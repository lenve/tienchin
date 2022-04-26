<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--用户数据-->
      <el-col :span="24" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
                 label-width="68px">
          <el-form-item label="用户名称" prop="userName">
            <el-input
              v-model="queryParams.userName"
              placeholder="请输入用户名称"
              clearable
              style="width: 240px"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="手机号码" prop="phonenumber">
            <el-input
              v-model="queryParams.phonenumber"
              placeholder="请输入手机号码"
              clearable
              style="width: 240px"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="状态" prop="status">
            <el-select
              v-model="queryParams.status"
              placeholder="用户状态"
              clearable
              style="width: 240px"
            >
              <el-option
                v-for="dict in dict.type.sys_normal_disable"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="创建时间">
            <el-date-picker
              v-model="dateRange"
              style="width: 240px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
            ></el-date-picker>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>

        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              plain
              icon="el-icon-plus"
              size="mini"
              @click="handleAdd"
              v-hasPermi="['system:user:add']"
            >新增
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              plain
              icon="el-icon-edit"
              size="mini"
              :disabled="single"
              @click="handleUpdate"
              v-hasPermi="['system:user:edit']"
            >修改
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              plain
              icon="el-icon-delete"
              size="mini"
              :disabled="multiple"
              @click="handleDelete"
              v-hasPermi="['system:user:remove']"
            >删除
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="info"
              plain
              icon="el-icon-upload2"
              size="mini"
              @click="handleImport"
              v-hasPermi="['system:user:import']"
            >导入
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="warning"
              plain
              icon="el-icon-download"
              size="mini"
              @click="handleExport"
              v-hasPermi="['system:user:export']"
            >导出
            </el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="activities" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="50" align="center"/>
          <el-table-column label="活动渠道" align="center">
            <template slot-scope="scope">
              <template v-for="c in channels">
                <template v-if="c.channelId==scope.row.channel">{{c.channelName}}</template>
              </template>
            </template>
          </el-table-column>
          <el-table-column label="活动名称" align="center" prop="name"/>
          <el-table-column label="活动简介" align="center" prop="info"/>
          <el-table-column label="活动明细" align="center">
            <template slot-scope="scope">
              <el-tag type="primary" v-if="scope.row.type==1">年费折扣卡/{{scope.row.discount}}折</el-tag>
              <el-tag type="success" v-if="scope.row.type==2">年费代金券/{{scope.row.voucher}}元</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="开始时间" align="center" prop="beginTime" width="180">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.beginTime) }}</span>
            </template>
          </el-table-column>
          <el-table-column label="结束时间" align="center" prop="endTime" width="180">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.endTime) }}</span>
            </template>
          </el-table-column>
          <el-table-column label="活动状态" align="center" key="status">
            <template slot-scope="scope">
              <el-switch
                v-model="scope.row.status"
                active-value="0"
                inactive-value="1"
                @change="handleStatusChange(scope.row)"
              ></el-switch>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            align="center"
            width="160"
            class-name="small-padding fixed-width"
          >
            <template slot-scope="scope" v-if="scope.row.userId !== 1">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['tienchin:activity:edit']"
              >修改
              </el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['tienchin:activity:remove']"
              >删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>

        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </el-col>
    </el-row>

    <!-- 添加或修改用户配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="渠道来源" prop="channel">
              <el-select v-model="form.channel" placeholder="请选择渠道">
                <el-option
                  v-for="item in channels"
                  :key="item.channelId"
                  :label="item.channelName"
                  :value="item.channelId"
                  :disabled="item.status == 1"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="活动名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入活动名称"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="活动类型" prop="type">
              <el-select v-model="form.type" placeholder="请选择活动类型">
                <el-option
                  v-for="dict in dict.type.activity_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="form.type == 1" label="折扣额度" prop="discount">
              <el-input-number v-model="form.discount" :min="0.1" :precision="2" :step="0.1" :max="9.9"
                               placeholder="请输入年费折扣" controls-position="right"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item v-if="form.type == 2" label="代金券" prop="voucher">
              <el-input-number v-model="form.voucher" :min="1" :precision="1" :step="1" :max="999"
                               placeholder="请输入年费代金券" controls-position="right"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="活动日期" prop="activityTime">
              <el-date-picker
                v-model="form.activityTime"
                clearable
                type="datetimerange"
                align="right"
                unlink-panels
                value-format="yyyy-MM-dd HH:mm:ss"
                format="yyyy-MM-dd HH:mm:ss"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期"
                :default-time="['00:00:00', '23:59:59']"
                :picker-options="pickerOptions"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="活动简介" prop="remark">
              <el-input v-model="form.info" type="textarea" placeholder="请输入内容"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
          <div class="el-upload__tip" slot="tip">
            <el-checkbox v-model="upload.updateSupport"/>
            是否更新已经存在的用户数据
          </div>
          <span>仅允许导入xls、xlsx格式文件。</span>
          <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;"
                   @click="importTemplate">下载模板
          </el-link>
        </div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { addActivity,listActivity,getActivity,updateActivity,changeActivityStatus } from '../../../api/activity'
  import { listUser, getUser, delUser, addUser, updateUser, resetUserPwd, changeUserStatus } from '@/api/system/user'
  import { listChannel } from '../../../api/channel'
  import { getToken } from '@/utils/auth'
  import { treeselect } from '@/api/system/dept'
  import Treeselect from '@riophae/vue-treeselect'
  import '@riophae/vue-treeselect/dist/vue-treeselect.css'

  export default {
    name: 'User',
    dicts: ['sys_normal_disable', 'sys_user_sex', 'activity_type'],
    components: { Treeselect },
    data() {
      return {
        pickerOptions: {
          disabledDate(time) {
            return time.getTime() < Date.now()
          }
        },
        //渠道数组
        channels: [],
        // 遮罩层
        loading: true,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // 用户表格数据
        activities: null,
        // 弹出层标题
        title: '',
        // 部门树选项
        deptOptions: undefined,
        // 是否显示弹出层
        open: false,
        // 部门名称
        deptName: undefined,
        // 默认密码
        initPassword: undefined,
        // 日期范围
        dateRange: [],
        // 岗位选项
        postOptions: [],
        // 角色选项
        roleOptions: [],
        // 表单参数
        form: {},
        defaultProps: {
          children: 'children',
          label: 'label'
        },
        // 用户导入参数
        upload: {
          // 是否显示弹出层（用户导入）
          open: false,
          // 弹出层标题（用户导入）
          title: '',
          // 是否禁用上传
          isUploading: false,
          // 是否更新已经存在的用户数据
          updateSupport: 0,
          // 设置上传的请求头部
          headers: { Authorization: 'Bearer ' + getToken() },
          // 上传的地址
          url: process.env.VUE_APP_BASE_API + '/system/user/importData'
        },
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          userName: undefined,
          phonenumber: undefined,
          status: undefined,
          deptId: undefined
        },
        // 列信息
        columns: [
          { key: 0, label: `用户编号`, visible: true },
          { key: 1, label: `用户名称`, visible: true },
          { key: 2, label: `用户昵称`, visible: true },
          { key: 3, label: `部门`, visible: true },
          { key: 4, label: `手机号码`, visible: true },
          { key: 5, label: `状态`, visible: true },
          { key: 6, label: `创建时间`, visible: true }
        ],
        // 表单校验
        rules: {
          name: [
            { required: true, message: '活动名称不能为空', trigger: 'blur' },
            { min: 2, max: 20, message: '活动名称长度必须介于 2 和 20 之间', trigger: 'blur' }
          ],
          type: [
            { required: true, message: '请选择活动类型', trigger: 'blur' }
          ],
          discount: [
            { required: true, message: '请输入活动折扣', trigger: 'blur' }
          ],
          voucher: [
            { required: true, message: '请输入代金券金额', trigger: 'blur' }
          ],
          activityTime: [
            { required: true, message: '请选择活动时间', trigger: 'blur' }
          ],
          channel: [
            { required: true, message: '请选择活动渠道', trigger: 'blur' }
          ],
          info: [
            { required: true, message: '活动简介不能为空', trigger: 'blur' },
            { min: 5, max: 20, message: '活动简介必须介于 5 和 200 之间', trigger: 'blur' }
          ]
        }
      }
    },
    watch: {
      // 根据名称筛选部门树
      deptName(val) {
        this.$refs.tree.filter(val)
      }
    },
    created() {
      this.getList()
      this.getChannels()
      this.getTreeselect()
      this.getConfigKey('sys.user.initPassword').then(response => {
        this.initPassword = response.msg
      })
    },
    methods: {
      /**
       * 查询渠道列表
       */
      getChannels() {
        this.loading = true
        listChannel().then(response => {
            this.channels = response.rows
            this.loading = false
          }
        )
      },
      /** 查询用户列表 */
      getList() {
        this.loading = true
        listActivity(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
            this.activities = response.rows
            this.total = response.total
            this.loading = false
          }
        )
      },
      /** 查询部门下拉树结构 */
      getTreeselect() {
        treeselect().then(response => {
          this.deptOptions = response.data
        })
      },
      // 筛选节点
      filterNode(value, data) {
        if (!value) return true
        return data.label.indexOf(value) !== -1
      },
      // 节点单击事件
      handleNodeClick(data) {
        this.queryParams.deptId = data.id
        this.handleQuery()
      },
      // 用户状态修改
      handleStatusChange(row) {
        let text = row.status === '0' ? '启用' : '停用'
        this.$modal.confirm('确认要"' + text + '""' + row.name + '"活动吗？').then(function() {
          return changeActivityStatus(row.id, row.status)
        }).then(() => {
          this.$modal.msgSuccess(text + '成功')
        }).catch(function() {
          row.status = row.status === '0' ? '1' : '0'
        })
      },
      // 取消按钮
      cancel() {
        this.open = false
        this.reset()
      },
      // 表单重置
      reset() {
        this.form = {
          id: undefined,
          name: undefined,
          type: undefined,
          channel: undefined,
          info: undefined,
          discount: undefined,
          voucher: undefined,
          beginTime: undefined,
          endTime: undefined,
          status: '0'
        }
        this.resetForm('form')
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1
        this.getList()
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.dateRange = []
        this.resetForm('queryForm')
        this.handleQuery()
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.id)
        this.single = selection.length != 1
        this.multiple = !selection.length
      },
      // 更多操作触发
      handleCommand(command, row) {
        switch (command) {
          case 'handleResetPwd':
            this.handleResetPwd(row)
            break
          case 'handleAuthRole':
            this.handleAuthRole(row)
            break
          default:
            break
        }
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset()
        this.getTreeselect()
        getUser().then(response => {
          this.postOptions = response.posts
          this.roleOptions = response.roles
          this.open = true
          this.title = '添加用户'
          this.form.password = this.initPassword
        })
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset()
        this.getTreeselect()
        const activityId = row.id || this.ids
        getActivity(activityId).then(response => {
          this.form = response.data
          this.form.activityTime = [response.data.beginTime, response.data.endTime]
          this.open = true
          this.title = '修改活动'
        })
      },
      /** 重置密码按钮操作 */
      handleResetPwd(row) {
        this.$prompt('请输入"' + row.userName + '"的新密码', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          closeOnClickModal: false,
          inputPattern: /^.{5,20}$/,
          inputErrorMessage: '用户密码长度必须介于 5 和 20 之间'
        }).then(({ value }) => {
          resetUserPwd(row.userId, value).then(response => {
            this.$modal.msgSuccess('修改成功，新密码是：' + value)
          })
        }).catch(() => {
        })
      },
      /** 分配角色操作 */
      handleAuthRole: function(row) {
        const userId = row.userId
        this.$router.push('/system/user-auth/role/' + userId)
      },
      /** 提交按钮 */
      submitForm: function() {
        this.$refs['form'].validate(valid => {
          if (valid) {
            if (!this.form.beginTime) {
              this.form.beginTime = this.form.activityTime[0]
            }
            if (!this.form.endTime) {
              this.form.endTime = this.form.activityTime[1]
            }
            delete this.form.activityTime
            if (this.form.id != undefined) {
              updateActivity(this.form).then(response => {
                this.$modal.msgSuccess('修改成功')
                this.open = false
                this.getList()
              })
            } else {
              addActivity(this.form).then(response => {
                this.$modal.msgSuccess('新增成功')
                this.open = false
                this.getList()
              })
            }
          }
        })
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const userIds = row.userId || this.ids
        this.$modal.confirm('是否确认删除用户编号为"' + userIds + '"的数据项？').then(function() {
          return delUser(userIds)
        }).then(() => {
          this.getList()
          this.$modal.msgSuccess('删除成功')
        }).catch(() => {
        })
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('system/user/export', {
          ...this.queryParams
        }, `user_${new Date().getTime()}.xlsx`)
      },
      /** 导入按钮操作 */
      handleImport() {
        this.upload.title = '用户导入'
        this.upload.open = true
      },
      /** 下载模板操作 */
      importTemplate() {
        this.download('system/user/importTemplate', {}, `user_template_${new Date().getTime()}.xlsx`)
      },
      // 文件上传中处理
      handleFileUploadProgress(event, file, fileList) {
        this.upload.isUploading = true
      },
      // 文件上传成功处理
      handleFileSuccess(response, file, fileList) {
        this.upload.open = false
        this.upload.isUploading = false
        this.$refs.upload.clearFiles()
        this.$alert('<div style=\'overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;\'>' + response.msg + '</div>', '导入结果', { dangerouslyUseHTMLString: true })
        this.getList()
      },
      // 提交上传文件
      submitFileForm() {
        this.$refs.upload.submit()
      }
    }
  }
</script>
