<template>
  <div>
    <el-row :gutter="16">
      <el-col :span="18">
        <el-row>
          <el-card class="box-card">
            <template #header>
              <div class="card-header">
                <span>客户资料/{{ business.name }}</span>
              </div>
            </template>
            <div>
              <el-row :gutter="36">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">客户姓名</div>
                  <el-input :disabled="isFiledDisabledEdit" v-model="business.name"></el-input>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">手机号码</div>
                  <el-input :disabled="isFiledDisabledEdit" v-model="business.phone"></el-input>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">职业</div>
                  <el-select v-model="business.occupation" style="width:100%" placeholder="请选择"
                             :disabled="isFiledDisabledEdit">
                    <el-option
                        v-for="dict in business_occupation"
                        :key="dict.value"
                        :label="dict.label"
                        :value="dict.label"
                    ></el-option>
                  </el-select>
                </el-col>
              </el-row>
              <el-row :gutter="36">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">学历</div>
                  <el-select v-model="business.education" style="width:100%" placeholder="请选择"
                             :disabled="isFiledDisabledEdit">
                    <el-option
                        v-for="dict in business_education"
                        :key="dict.value"
                        :label="dict.label"
                        :value="dict.label"
                    ></el-option>
                  </el-select>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">所在地区</div>
                  <el-cascader
                      :disabled="isFiledDisabledEdit"
                      style="width:100%"
                      :options="regionData"
                      v-model="business.address">
                  </el-cascader>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">微信号码</div>
                  <el-input :disabled="isFiledDisabledEdit" v-model="business.weixin"></el-input>
                </el-col>
              </el-row>
              <el-row :gutter=36>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">年龄</div>
                  <el-input-number :disabled="isFiledDisabledEdit" style="width:100%" v-model="business.age" :min="6"
                                   :max="99"/>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">QQ</div>
                  <el-input :disabled="isFiledDisabledEdit" v-model="business.qq"></el-input>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">性别</div>
                  <el-select v-model="business.gender" style="width:100%" placeholder="请选择"
                             :disabled="isFiledDisabledEdit">
                    <el-option
                        v-for="dict in sys_user_sex"
                        :key="dict.value"
                        :label="dict.label"
                        :value="parseInt(dict.value)"
                    ></el-option>
                  </el-select>
                </el-col>
              </el-row>
              <el-row :gutter="36">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">身高</div>
                  <el-input-number :disabled="isFiledDisabledEdit" style="width:100%" v-model="business.height"
                                   :precision="2" :min="60" :max="250"/>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">体重</div>
                  <el-input-number :disabled="isFiledDisabledEdit" style="width:100%" v-model="business.weight"
                                   :precision="2" :min="30" :max="250"/>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">备注</div>
                  <el-input :disabled="isFiledDisabledEdit" v-model="business.remark"></el-input>
                </el-col>
              </el-row>
            </div>
          </el-card>
        </el-row>
        <el-row>
          <el-card class="box-card">
            <template #header>
              <div class="card-header">
                <span>客户意向</span>
              </div>
            </template>
            <div>
              <el-row :gutter="36">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">意向类型</div>
                  <div>
                    <el-select
                        v-model="business.type"
                        placeholder="课程分类"
                        clearable
                        @change="courseTypeChange"
                        :disabled="isFiledDisabledEdit"
                        style="width: 100%"
                    >
                      <el-option
                          v-for="ct in course_type"
                          :key="ct.value"
                          :label="ct.label"
                          :value="parseInt(ct.value)"
                      />
                    </el-select>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">意向课程</div>
                  <div>
                    <el-select v-model="business.courseId" style="width: 100%" placeholder="请选择"
                               :disabled="isFiledDisabledEdit">
                      <el-option
                          v-for="c in courses"
                          :key="c.courseId"
                          :label="c.name"
                          :value="c.courseId"
                      ></el-option>
                    </el-select>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">健身原因</div>
                  <div>
                    <el-input :disabled="isFiledDisabledEdit" v-model="business.reason"></el-input>
                  </div>
                </el-col>
              </el-row>
              <el-row :gutter="36">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">每周健身时间</div>
                  <div>
                    <el-input-number :disabled="isFiledDisabledEdit" style="width:100%" v-model="business.hours"
                                     :min="6" :max="99"/>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">意向金额</div>
                  <div>
                    <el-input-number :disabled="isFiledDisabledEdit" style="width:100%" v-model="business.money"
                                     :precision="2" :min="0" :max="99999999"/>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">其他意向</div>
                  <div>
                    <el-input :disabled="isFiledDisabledEdit" v-model="business.othenIntention"></el-input>
                  </div>
                </el-col>
              </el-row>
            </div>
          </el-card>
        </el-row>
        <el-row>
          <el-card class="box-card">
            <template #header>
              <div class="card-header">
                <span>沟通记录</span>
              </div>
            </template>
            <div>
              <el-row :gutter="36">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">跟进状态</div>
                  <div>
                    <el-select v-model="business.status" style="width: 100%" placeholder="请选择"
                               :disabled="isFiledDisabledEdit">
                      <el-option
                          v-for="dict in business_status"
                          :key="dict.value"
                          :label="dict.label"
                          :disabled="isFiledDisabledEdit"
                          :value="parseInt(dict.value)"
                      ></el-option>
                    </el-select>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">下次跟进时间</div>
                  <div>
                    <el-date-picker
                        style="width:100%"
                        v-model="business.nextTime"
                        type="datetime"
                        :disabled="isFiledDisabledEdit"
                        placeholder="请选择时间"
                        format="YYYY/MM/DD HH:mm:ss"
                    />
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">沟通重点</div>
                  <div>
                    <el-select v-model="business.record1" style="width: 100%" placeholder="请选择"
                               :disabled="isFiledDisabledEdit">
                      <el-option
                          v-for="dict in business_focus"
                          :key="dict.value"
                          :label="dict.label"
                          :value="dict.label"
                      ></el-option>
                    </el-select>
                  </div>
                </el-col>
              </el-row>
              <el-row :gutter="36">
                <el-col :span="24">
                  <div style="font-style: italic;font-weight: bold">沟通纪要</div>
                  <div>
                    <el-input :disabled="isFiledDisabledEdit" v-model="business.record2"></el-input>
                  </div>
                </el-col>
              </el-row>
              <el-row>
                <el-col>
                  <div style="display: flex;justify-content: flex-end">
                    <el-button @click="goBack">返回</el-button>
                    <el-button :disabled="isFiledDisabledEdit" type="primary" @click="handleBusinessFollow">保存
                    </el-button>
                    <el-button @click="goBack" type="success" :disabled="isFiledDisabledEdit">转为成交客户</el-button>
                  </div>
                </el-col>
              </el-row>
            </div>
          </el-card>
        </el-row>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <template #header>
            <div class="card-header">
              <span>商机跟进记录</span>
            </div>
          </template>
          <div>
            <div v-for="(r,index) in records" :key="index" style="margin-bottom: 20px">
              <div>
                <span style="font-weight: bold;font-style: italic">{{ r.createBy }}：</span>
                <span>{{ r.info }}</span>
              </div>
              <span style="font-size: 12px;color: #8392a6">{{ parseTime(r.createTime) }}</span>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import {getCurrentInstance, onMounted} from "vue";
import {
  businessFollow,
  getAllCourse,
  getBusinessById,
  getBusinessRecordByBusinessId,
  getCourseByType
} from "../../../api/tienchin/business";
import {parseTime} from "../../../utils/ruoyi";
import {CodeToText, regionData, TextToCode} from 'element-china-area-data'

import {ElMessage} from 'element-plus'

const {proxy} = getCurrentInstance();
const router = useRouter();
const {
  sys_user_sex,
  course_type,
  business_occupation,
  business_status,
  business_focus,
  business_education
} = proxy.useDict("sys_user_sex", "business_occupation", "business_education", "business_status", "business_focus", "course_type");

const type = ref("");
const business = ref({});
const records = ref([]);
const courses = ref([]);
const isFiledDisabledEdit = ref(false);

/**
 * 课程类型发生变化的时候触发，此时根据课程类型重新去加载课程数据
 * @param type
 */
function courseTypeChange(type) {
  getCourseByType(type).then(response => {
    courses.value = response.data;
  })
}

function getRecords(businessId) {
  getBusinessRecordByBusinessId(businessId).then(response => {
    records.value = response.data;
  })
}

function handleBusinessFollow() {
  if (business.value.record1 && business.value.record2) {
    business.value.info = "【" + business.value.record1 + "】" + business.value.record2;
  } else {
    ElMessage.error('跟踪记录不能为空')
    return;
  }
  business.value.province = CodeToText[business.value.address[0]];
  business.value.city = CodeToText[business.value.address[1]];
  business.value.area = CodeToText[business.value.address[2]];
  businessFollow(business.value).then(response => {
    router.go(-1);
  })
}

function goBack() {
  router.go(-1);
}

/**
 * 跳转到这个页面的请求格式是 /business/details/index/10/view
 */
onMounted(() => {
  const businessId = proxy.$route.params && proxy.$route.params.businessId;
  type.value = proxy.$route.params && proxy.$route.params.type;
  isFiledDisabledEdit.value = type.value == 'view';
  handleBusiness(businessId);
  getRecords(businessId);
})

function handleBusiness(businessId) {
  getBusinessById(businessId).then(response => {
    business.value = response.data;
    business.value.address = new Array();
    business.value.address.push(TextToCode[business.value.province].code);
    business.value.address.push(TextToCode[business.value.province][business.value.city].code);
    business.value.address.push(TextToCode[business.value.province][business.value.city][business.value.area].code);
    isFiledDisabledEdit.value = isFiledDisabledEdit.value || business.value.status == 4;
  })
}

function handleAllCourse() {
  getAllCourse().then(response => {
    courses.value = response.data;
  })
}

handleAllCourse();

</script>

<style scoped>
.box-card {
  margin-top: 10px;
  width: 100%;
}

.el-row {
  margin-bottom: 30px;
}

.el-row:last-child {
  margin-bottom: 10px;
}
</style>
