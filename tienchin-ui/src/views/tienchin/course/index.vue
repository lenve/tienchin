<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--活动数据-->
      <el-col :span="24" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch"
                 label-width="68px">
          <el-form-item label="适用人群" prop="applyTo">
            <el-select v-model="queryParams.applyTo" placeholder="请选择适用人群">
              <el-option
                v-for="item in dict.type.course_apply_to"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="课程分类" prop="subject">
            <el-select v-model="queryParams.subject" placeholder="请选择课程分类">
              <el-option
                v-for="item in dict.type.personal_course_type"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="课程名称" prop="name">
            <el-input v-model="queryParams.name" placeholder="请输入课程名称"></el-input>
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
              v-hasPermi="['tienchin:course:add']"
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
              v-hasPermi="['tienchin:course:edit']"
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
              v-hasPermi="['tienchin:course:remove']"
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
              v-hasPermi="['tienchin:course:import']"
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
              v-hasPermi="['tienchin:course:export']"
            >导出
            </el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="courses" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="50" align="center"/>
          <el-table-column label="课程编号" align="center" prop="id"/>
          <el-table-column label="课程分类" align="center" v-if="columns[0].visible">
            <template slot-scope="scope">
              <template v-for="c in dict.type.personal_course_type">
                <template v-if="c.value==scope.row.subject">{{c.label}}</template>
              </template>
            </template>
          </el-table-column>
          <el-table-column label="课程名称" align="center" prop="name" v-if="columns[1].visible"/>
          <el-table-column label="课程价格（元）" align="center" prop="price" v-if="columns[2].visible"/>
          <el-table-column label="适用人群" align="center" v-if="columns[3].visible">
            <template slot-scope="scope">
              <template v-for="c in dict.type.course_apply_to">
                <template v-if="c.value==scope.row.applyTo">{{c.label}}</template>
              </template>
            </template>
          </el-table-column>
          <el-table-column label="课程说明" align="center" prop="info" v-if="columns[2].visible"/>
          <el-table-column label="课程创建时间" align="center" prop="beginTime" width="180" v-if="columns[4].visible">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.createTime) }}</span>
            </template>
          </el-table-column>
          <el-table-column label="课程状态" align="center" key="status" v-if="columns[6].visible">
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
                v-hasPermi="['tienchin:course:edit']"
              >修改
              </el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['tienchin:course:remove']"
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
            <el-form-item label="课程类别" prop="subject">
              <el-select v-model="form.subject" placeholder="请选择渠道">
                <el-option
                  v-for="item in dict.type.personal_course_type"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="课程名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入课程名称"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="适用人群" prop="applyTo">
              <el-select v-model="form.applyTo" placeholder="请选择课程适用人群">
                <el-option
                  v-for="dict in dict.type.course_apply_to"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="课程价格" prop="price">
              <el-input-number v-model="form.price" :min="0.1" :precision="2" :step="0.1" :max="999999"
                               placeholder="请输入课程价格" controls-position="right"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="课程状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="课程说明" prop="info">
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

    <!-- 私教课程导入对话框 -->
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
  import {addCourse,listCourse,getCourse,updateCourse,changeCourseStatus,delCourse} from '../../../api/course'
  import { listChannel } from '../../../api/channel'
  import { getToken } from '@/utils/auth'

  export default {
    name: 'acitivity',
    dicts: ['course_apply_to', 'personal_course_type','sys_normal_disable'],
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
        // 私教课程表格数据
        courses: null,
        // 弹出层标题
        title: '',
        // 是否显示弹出层
        open: false,
        // 日期范围
        dateRange: [],
        // 表单参数
        form: {},
        // 私教课程导入参数
        upload: {
          // 是否显示弹出层（私教课程导入）
          open: false,
          // 弹出层标题（私教课程导入）
          title: '',
          // 是否禁用上传
          isUploading: false,
          // 是否更新已经存在的私教课程数据
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
          channel: undefined,
          status: undefined,
          activityTime: undefined
        },
        // 列信息
        columns: [
          { key: 0, label: `活动渠道`, visible: true },
          { key: 1, label: `活动名称`, visible: true },
          { key: 2, label: `活动简介`, visible: true },
          { key: 3, label: `活动明细`, visible: true },
          { key: 4, label: `开始时间`, visible: true },
          { key: 5, label: `结束时间`, visible: true },
          { key: 6, label: `状态`, visible: true }
        ],
        // 表单校验
        rules: {
          name: [
            { required: true, message: '课程名称不能为空', trigger: 'blur' },
            { min: 2, max: 20, message: '课程名称长度必须介于 2 和 20 之间', trigger: 'blur' }
          ],
          subject: [
            { required: true, message: '请选择课程类型', trigger: 'blur' }
          ],
          price: [
            { required: true, message: '请输入课程价格', trigger: 'blur' }
          ],
          applyTo: [
            { required: true, message: '请选择课程适用人群', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '请选择课程状态', trigger: 'blur' }
          ],
          info: [
            { required: true, message: '课程简介不能为空', trigger: 'blur' },
            { min: 5, max: 20, message: '课程简介必须介于 5 和 200 之间', trigger: 'blur' }
          ]
        }
      }
    },
    created() {
      this.getList()
      this.getChannels()
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
      /** 查询私教课程列表 */
      getList() {
        this.loading = true
        if (this.queryParams.createTime) {
          this.queryParams.beginTime = this.queryParams.createTime[0]
          this.queryParams.endTime = this.queryParams.createTime[1]
        }
        listCourse(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
            this.courses = response.rows
            this.total = response.total
            this.loading = false
          }
        )
      },
      // 私教课程状态修改
      handleStatusChange(row) {
        let text = row.status === '0' ? '启用' : '停用'
        this.$modal.confirm('确认要"' + text + '""' + row.name + '"课程吗？').then(function() {
          return changeCourseStatus(row.id, row.status)
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
          subject: undefined,
          price: undefined,
          info: undefined,
          applyTo: undefined,
          status: 0
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
        this.reset()
        this.open = true
        this.title = '添加私教课程'
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset()
        const courseId = row.id || this.ids
        getCourse(courseId).then(response => {
          this.form = response.data
          this.open = true
          this.title = '修改课程'
        })
      },
      /** 提交按钮 */
      submitForm: function() {
        this.$refs['form'].validate(valid => {
          if (valid) {
            if (this.form.id != undefined) {
              updateCourse(this.form).then(response => {
                this.$modal.msgSuccess('修改成功')
                this.open = false
                this.getList()
              })
            } else {
              addCourse(this.form).then(response => {
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
        const courseIds = row.id || this.ids
        this.$modal.confirm('是否确认删除私教课程编号为"' + courseIds + '"的数据项？').then(function() {
          return delCourse(courseIds)
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
        this.upload.title = '私教课程导入'
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
