<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="客户姓名" prop="name">
        <el-input
            v-model="queryParams.name"
            placeholder="请输入客户姓名"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户手机" prop="phone">
        <el-input
            v-model="queryParams.phone"
            placeholder="请输入客户手机号码"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="归属人" prop="owner">
        <el-input
            v-model="queryParams.owner"
            placeholder="请输入线索归属人"
            clearable
            @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="渠道来源" prop="channelId">
        <el-select
            v-model="queryParams.channelId"
            placeholder="渠道来源"
            clearable
        >
          <el-option
              v-for="cl in channelList"
              :key="cl.channelId"
              :label="cl.channelName"
              :value="cl.channelId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="线索状态" prop="status">
        <el-select
            v-model="queryParams.status"
            placeholder="线索状态"
            clearable
        >
          <el-option
              v-for="cs in clue_status"
              :key="cs.value"
              :label="cs.label"
              :value="cs.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="跟进时间">
        <el-date-picker
            v-model="queryParams.dateRange"
            value-format="YYYY-MM-DD hh:mm:ss"
            format="YYYY-MM-DD hh:mm:ss"
            type="datetimerange"
            range-separator="-"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
            type="primary"
            plain
            icon="Plus"
            @click="handleAdd"
            v-hasPermi="['tienchin:clue:create']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="success"
            plain
            icon="Edit"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['tienchin:clue:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['tienchin:clue:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['tienchin:clue:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="clueList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="线索编号" align="center" :show-overflow-tooltip="true" width="80" prop="clueId"/>
      <el-table-column label="客户姓名" align="center" :show-overflow-tooltip="true" width="120" prop="name"/>
      <el-table-column label="手机号码" align="center" :show-overflow-tooltip="true" width="120" prop="phone"/>
      <el-table-column label="渠道来源" align="center" :show-overflow-tooltip="true" width="120" prop="channelName"/>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="线索归属" align="center" :show-overflow-tooltip="true" width="120" prop="owner"/>
      <el-table-column label="线索状态" align="center" width="150">
        <template #default="scope">
          <dict-tag :options="clue_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="下次跟进时间" align="center" prop="nextTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.nextTime) }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button
              type="text"
              icon="View"
              @click="handleClueView(scope.row)"
              v-hasPermi="['tienchin:clue:view']"
          >查看
          </el-button>
          <el-button
              v-if="scope.row.status==1"
              type="text"
              icon="Pointer"
              @click="handleAssign(scope.row)"
              v-hasPermi="['tienchin:clue:assignment']"
          >分配
          </el-button>
          <el-button
              v-if="scope.row.owner==userStore.name &&(scope.row.status==1||scope.row.status==2)"
              type="text"
              icon="TopRight"
              @click="handleClueFollow(scope.row)"
              v-hasPermi="['tienchin:clue:follow']"
          >跟进
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
        v-show="total > 0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 添加或修改线索对话框 -->
    <el-dialog title="分配线索" v-model="assignClueDialog" width="700px" append-to-body>
      <el-form ref="clueAssignRef" :model="assignForm" :rules="assignFormRules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="归属部门" prop="departmentId">
              <el-tree-select
                  v-model="assignForm.departmentId"
                  :data="deptOptions"
                  :props="{ value: 'id', label: 'label', children: 'children' }"
                  value-key="id"
                  @change="deptChange"
                  placeholder="请选择归属部门"
                  check-strictly
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="分配给" prop="nickName">
              <el-select
                  v-model="assignForm.nickName"
                  placeholder="选择用户"
                  clearable
                  @change="assignUserChange"
                  style="width: 240px"
              >
                <el-option
                    v-for="ul in userList"
                    :key="ul.userId"
                    :label="ul.nickName"
                    :value="{value:ul.userId,userName:ul.userName,nickName:ul.nickName,deptId:ul.deptId}"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="handleAssignClue">确 定</el-button>
          <el-button @click="cancelAssignClue">取 消</el-button>
        </div>
      </template>
    </el-dialog>
    <!-- 添加或修改线索对话框 -->
    <el-dialog :title="title" v-model="open" width="700px" append-to-body>
      <el-form ref="clueRef" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="手机号码" prop="phone">
              <el-input v-model="form.phone" placeholder="请输入手机号码"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="客户姓名" prop="name">
              <el-input v-model="form.name" placeholder="请输入客户姓名"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="渠道来源" prop="channelId">
              <el-select
                  v-model="form.channelId"
                  placeholder="渠道来源"
                  clearable
                  @change="channelChange"
                  style="width: 240px"
              >
                <el-option
                    v-for="cl in channelList"
                    :key="cl.channelId"
                    :label="cl.channelName"
                    :value="cl.channelId"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="活动信息" prop="activityId">
              <el-select
                  v-model="form.activityId"
                  placeholder="活动信息"
                  clearable
                  style="width: 240px"
              >
                <el-option
                    v-for="al in activityList"
                    :key="al.activityId"
                    :label="al.name"
                    :value="al.activityId"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="客户性别" prop="gender">
              <el-radio-group v-model="form.gender">
                <el-radio
                    v-for="dict in sys_user_sex"
                    :key="dict.value"
                    :label="parseInt(dict.value)"
                >{{ dict.label }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="客户年龄" prop="age">
              <el-input-number v-model="form.age" :min="6" :max="100" placeholder="年龄"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="微信号" prop="weixin">
              <el-input v-model="form.weixin" placeholder="请输入微信号码"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="QQ号码" prop="qq">
              <el-input v-model="form.qq" placeholder="请输入QQ号码"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Post">
import useUserStore from '@/store/modules/user'
import {treeselect} from "@/api/system/dept";
import {
  listChannels,
  listActivity,
  addClue,
  listClue,
  listUsers,
  assignClue,
  getClueSummaryById,
  updateClue,
  delClue
} from "../../../api/tienchin/clue";

const userStore = useUserStore();
const router = useRouter();
const {proxy} = getCurrentInstance();
const {clue_status, course_apply_to, sys_user_sex} = proxy.useDict("clue_status", "course_apply_to", "sys_user_sex");

const clueList = ref([]);
const channelList = ref([]);
const userList = ref([]);
const activityList = ref([]);
const open = ref(false);
const assignClueDialog = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const deptOptions = ref(undefined);


const data = reactive({
  form: {},
  assignForm: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: undefined,
    phone: undefined,
    owner: undefined,
    channelId: undefined,
    dateRange: undefined,
    status: undefined
  },
  rules: {
    phone: [{required: true, message: "手机号码不能为空", trigger: "blur"}],
    name: [{required: true, message: "客户姓名不能为空", trigger: "blur"}],
  },
  assignFormRules: {
    departmentId: [{required: true, message: "部门ID不能为空", trigger: "blur"}],
    nickName: [{required: true, message: "用户名称不能为空", trigger: "blur"}],
  }
});

const {queryParams, form, assignForm, rules, assignFormRules} = toRefs(data);

function cancelAssignClue() {
  assignClueDialog.value = false;
  resetAssignForm();
}

function resetAssignForm() {
  assignForm.value = {
    departmentId: undefined,
    nickName: undefined
  };
  proxy.resetForm("clueAssignRef");
}

/**
 * 分配线索的方法
 */
function handleAssignClue() {
  proxy.$refs["clueAssignRef"].validate(valid => {
    if (valid) {
      assignClue(assignForm.value).then(response => {
        getList();
        assignClueDialog.value = false;
        resetAssignForm();
      })
    }
  });
}

function assignUserChange(data) {
  assignForm.value.nickName = data.nickName;
  assignForm.value.userId = data.value;
  assignForm.value.userName = data.userName;
  assignForm.value.deptId = data.deptId;
}

function handleClueView(data) {
  router.push("/clue/details/index/" + data.clueId + "/view");
}

function handleClueFollow(data) {
  router.push("/clue/details/index/" + data.clueId + "/follow");
}

function deptChange() {
  assignForm.value.nickName = undefined;
  initUsers();
}

function initUsers() {
  listUsers(assignForm.value.departmentId).then(response => {
    userList.value = response.data;
  })
}

function handleAssign(data) {
  assignForm.value.assignId = data.clueId;
  assignForm.value.type = 0;
  initDeptOptions();
  assignClueDialog.value = true;
}

function initDeptOptions() {
  if (deptOptions.value === undefined) {
    treeselect().then(response => {
      deptOptions.value = response.data;
    });
  }
}

function channelChange(channelId) {
  form.value.activityId = undefined;
  listActivity(channelId).then(response => {
    activityList.value = response.data;
  })
}

function getAllChannels() {
  listChannels().then(response => {
    channelList.value = response.data;
  })
}

/** 查询线索列表 */
function getList() {
  loading.value = true;
  listClue(proxy.addDateRange(queryParams.value, queryParams.value.dateRange)).then(response => {
    clueList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

/** 取消按钮 */
function cancel() {
  open.value = false;
  reset();
}

/** 表单重置 */
function reset() {
  form.value = {
    phone: undefined,
    name: undefined,
    channelId: undefined,
    activityId: undefined,
    gender: undefined,
    age: undefined,
    weixin: undefined,
    qq: undefined
  };
  proxy.resetForm("clueRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

/** 多选框选中数据 */
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.clueId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加线索";
}

getAllChannels();

/** 修改按钮操作 */
function handleUpdate() {
  reset();
  getAllChannels();
  const clueId = ids.value;
  getClueSummaryById(clueId).then(response => {
    form.value = response.data;
    listActivity(response.data.channelId).then(response => {
      activityList.value = response.data;
    })
    open.value = true;
    title.value = "修改线索";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["clueRef"].validate(valid => {
    if (valid) {
      if (form.value.clueId != undefined) {
        updateClue(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addClue(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const clueIds = ids.value;
  proxy.$modal.confirm('是否确认删除线索编号为"' + clueIds + '"的数据项？').then(function () {
    return delClue(clueIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download("tienchin/course/export", {
    ...queryParams.value
  }, `course_${new Date().getTime()}.xlsx`);
}

getList();
</script>
