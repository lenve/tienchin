<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--活动数据-->
      <el-col :span="24" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
                 label-width="68px">
          <el-form-item label="线索ID" prop="id">
            <el-input v-model="queryParams.id" placeholder="请输入线索ID"/>
          </el-form-item>
          <el-form-item label="手机号码" prop="phone">
            <el-input v-model="queryParams.phone" placeholder="请输入手机号码"/>
          </el-form-item>
          <el-form-item label="线索归属" prop="userName">
            <el-input v-model="queryParams.userName" placeholder="请输入线索归属"/>
          </el-form-item>
          <el-form-item label="线索状态" prop="status">
            <el-select v-model="queryParams.status" placeholder="请选择线索状态">
              <el-option
                v-for="item in dict.type.clue_status_type"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="渠道来源" prop="channel">
            <el-select v-model="queryParams.channel" placeholder="请选择渠道">
              <el-option
                v-for="item in channels"
                :key="item.channelId"
                :label="item.channelName"
                :value="item.channelId"
                :disabled="item.status == 1"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="创建时间" prop="createTime">
            <el-date-picker
              v-model="queryParams.createTime"
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
            />
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
              v-hasPermi="['tienchin:clue:add']"
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
              v-hasPermi="['tienchin:clue:edit']"
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
              v-hasPermi="['tienchin:clue:remove']"
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
              v-hasPermi="['tienchin:clue:import']"
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
              v-hasPermi="['tienchin:clue:export']"
            >导出
            </el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="clues" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="50" align="center"/>
          <el-table-column label="线索编号" align="center" prop="id" v-if="columns[0].visible"/>
          <el-table-column label="客户姓名" align="center" prop="name" v-if="columns[1].visible"/>
          <el-table-column label="手机号码" align="center" prop="phone" v-if="columns[2].visible"/>
          <el-table-column label="渠道来源" align="center" v-if="columns[3].visible">
            <template slot-scope="scope">
              <template v-for="c in channels">
                <template v-if="c.channelId==scope.row.channel">{{c.channelName}}</template>
              </template>
            </template>
          </el-table-column>
          <el-table-column label="创建时间" align="center" prop="createTime" width="180" v-if="columns[4].visible">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.createTime) }}</span>
            </template>
          </el-table-column>
          <el-table-column label="线索归属" align="center" prop="userName" v-if="columns[5].visible"/>
          <el-table-column label="线索状态" align="center" key="status" v-if="columns[6].visible">
            <template slot-scope="scope">
              <template v-for="status in dict.type.clue_status_type">
                <template v-if="status.value==scope.row.status">{{status.label}}</template>
              </template>
            </template>
          </el-table-column>
          <el-table-column label="下次跟进时间" align="center" prop="nextTime" width="180" v-if="columns[7].visible">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.nextTime) }}</span>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            align="center"
            width="160"
            class-name="small-padding fixed-width"
          >
            <template slot-scope="scope" v-if="scope.row.userId !== 1">
              <router-link :to="'/clue/details/index/' + scope.row.id+'/view'" class="link-type"
                           v-hasPermi="['tienchin:clue:query']">
                <span>查看</span>
              </router-link>
              <!--<router-link :to="'/clue/details/index/' + scope.row.id" class="link-type" v-hasPermi="['tienchin:clue:assignment']">
                <span>分配</span>
              </router-link>-->
              <!--              <el-button
                              size="mini"
                              type="text"
                              icon="el-icon-view"
                              @click="handleUpdate(scope.row)"
                              v-hasPermi="['tienchin:clue:query']"
                            >查看
                            </el-button>-->
              <el-button
                size="mini"
                type="text"
                icon="el-icon-thumb"
                @click="handleDelete(scope.row)"
                v-hasPermi="['tienchin:clue:assignment']"
              >分配
              </el-button>
              <router-link :to="'/clue/details/index/' + scope.row.id+'/edit'" class="link-type"
                           v-hasPermi="['tienchin:clue:record:add']">
                <span>跟进</span>
              </router-link>
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

    <!-- 添加或修改线索对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="客户姓名" prop="name">
              <el-input v-model="form.name" placeholder="请输入客户姓名"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="手机号码" prop="phone">
              <el-input v-model="form.phone" placeholder="请输入手机号码"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="微信号码" prop="weixin">
              <el-input v-model="form.weixin" placeholder="请输入客户微信"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="QQ号码" prop="qq">
              <el-input v-model="form.qq" placeholder="请输入 QQ 号码"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="渠道来源" prop="channel">
              <el-select v-model="form.channel" placeholder="请选择渠道" @change="getActivityByChannel">
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
            <el-form-item label="活动来源" prop="activityId">
              <el-select v-model="form.activityId" placeholder="请选择活动">
                <el-option
                  v-for="item in activities"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                  :disabled="item.status == 1"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户性别" prop="gender">
              <el-select v-model="form.gender" placeholder="请选择性别">
                <el-option
                  v-for="dict in dict.type.sys_user_sex"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="年龄" prop="age">
              <el-input-number v-model="form.age" :min="1" :precision="0" :step="1" :max="99"
                               placeholder="请输入用户年龄" controls-position="right"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 线索管理导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
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
  import { addClue, listClue } from '../../../api/clue'
  import {
    addActivity,
    listActivity,
    getActivity,
    updateActivity,
    changeActivityStatus,
    delActivity
  } from '../../../api/activity'
  import { listChannel } from '../../../api/channel'
  import { getToken } from '@/utils/auth'

  export default {
    name: 'index',
    dicts: ['sys_normal_disable', 'sys_user_sex', 'clue_status_type'],
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
        // 线索表格数据
        activities: null,
        clues: null,
        // 弹出层标题
        title: '',
        // 是否显示弹出层
        open: false,
        // 日期范围
        dateRange: [],
        // 表单参数
        form: {},
        // 线索导入参数
        upload: {
          // 是否显示弹出层（线索导入）
          open: false,
          // 弹出层标题（线索导入）
          title: '',
          // 是否禁用上传
          isUploading: false,
          // 是否更新已经存在的线索数据
          updateSupport: 0,
          // 设置上传的请求头部
          headers: { Authorization: 'Bearer ' + getToken() },
          // 上传的地址
          url: process.env.VUE_APP_BASE_API + '/tienchin/activity/importData'
        },
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          phone: undefined,
          status: undefined,
          channel: undefined,
          beginTime: undefined,
          endTime: undefined,
          createTime: undefined,
          userName: undefined
        },
        // 列信息
        columns: [
          { key: 0, label: `线索编号`, visible: true },
          { key: 1, label: `客户姓名`, visible: true },
          { key: 2, label: `手机号码`, visible: true },
          { key: 3, label: `渠道来源`, visible: true },
          { key: 4, label: `创建时间`, visible: true },
          { key: 5, label: `线索归属`, visible: true },
          { key: 6, label: `线索状态`, visible: true },
          { key: 7, label: `下次跟进时间`, visible: true }
        ],
        // 表单校验
        rules: {
          name: [
            { required: true, message: '客户姓名不能为空', trigger: 'blur' },
            { min: 2, max: 20, message: '活动名称长度必须介于 2 和 20 之间', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '手机号码不能为空', trigger: 'blur' }
          ],
          activityId: [
            { required: true, message: '活动不能为空', trigger: 'blur' }
          ],
          channel: [
            { required: true, message: '渠道不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    created() {
      this.getChannels()
      this.getList()
    },
    methods: {

      getList() {
        this.loading = true
        if (this.queryParams.createTime) {
          this.queryParams.beginTime = this.queryParams.createTime[0]
          this.queryParams.endTime = this.queryParams.createTime[1]
        }
        listClue(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
            this.clues = response.rows
            this.total = response.total
            this.loading = false
          }
        )
      },

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
      /** 查询线索列表 */
      getActivityByChannel() {
        listActivity({ channel: this.form.channel }).then(response => {
            this.activities = response.rows
            this.total = response.total
            this.loading = false
          }
        )
      },
      // 线索状态修改
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
          phone: undefined,
          qq: undefined,
          weixin: undefined,
          activityId: undefined,
          channel: undefined,
          gender: undefined,
          age: undefined
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
      /** 新增按钮操作 */
      handleAdd() {
        this.getChannels()
        this.reset()
        this.open = true
        this.title = '添加线索'
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset()
        this.getChannels()
        const activityId = row.id || this.ids
        getActivity(activityId).then(response => {
          this.form = response.data
          this.form.activityTime = [response.data.beginTime, response.data.endTime]
          this.open = true
          this.title = '修改活动'
        })
      },
      /** 提交按钮 */
      submitForm: function() {
        this.$refs['form'].validate(valid => {
          if (valid) {
            if (this.form.id != undefined) {
              updateActivity(this.form).then(response => {
                this.$modal.msgSuccess('修改成功')
                this.open = false
                this.getList()
              })
            } else {
              addClue(this.form).then(response => {
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
        const activityIds = row.id || this.ids
        this.$modal.confirm('是否确认删除线索编号为"' + activityIds + '"的数据项？').then(function() {
          return delActivity(activityIds)
        }).then(() => {
          this.getList()
          this.$modal.msgSuccess('删除成功')
        }).catch(() => {
        })
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('/tienchin/activity/export', {
          ...this.queryParams
        }, `activity_${new Date().getTime()}.xlsx`)
      },
      /** 导入按钮操作 */
      handleImport() {
        this.upload.title = '线索导入'
        this.upload.open = true
      },
      /** 下载模板操作 */
      importTemplate() {
        this.download('/tienchin/activity/importTemplate', {}, `activity_template_${new Date().getTime()}.xlsx`)
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
<style>
  .link-type{
    margin: 0px 10px;
  }
</style>
