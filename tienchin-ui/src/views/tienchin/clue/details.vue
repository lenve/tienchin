<template>
  <div style="padding: 10px">
    <el-row :gutter="16">
      <el-col :span="18">
        <el-row>
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>{{clue.name}} / {{clue.id}}</span>
            </div>
            <div>
              <el-row :gutter="16">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">线索创建时间</div>
                  <div style="color: #8492a6">{{parseTime(clue.createTime)}}</div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">客户手机号码</div>
                  <div style="color: #8492a6">{{clue.phone}}</div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">渠道来源</div>
                  <div style="color: #8492a6">{{clue.channelName}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="16">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">线索分配者</div>
                  <div style="color: #8492a6">{{clue.allocator}}</div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">线索归属时间</div>
                  <div style="color: #8492a6">{{parseTime(clue.belongTime)}}</div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">线索归属人</div>
                  <div style="color: #8492a6">{{clue.userName}}</div>
                </el-col>
              </el-row>
              <el-row :gutter="16">
                <el-col :span="16">
                  <div style="font-style: italic;font-weight: bold">所属促销活动信息</div>
                  <div style="color: #8492a6">{{clue.activityName}}：{{clue.activityInfo}}</div>
                </el-col>
                <el-col :span="8">
                  <div>
                    <el-button :disabled="type==='view'" type="danger">无效线索</el-button>
                    <el-button :disabled="type==='view'" type="primary">转为商机</el-button>
                  </div>
                </el-col>
              </el-row>
            </div>
          </el-card>
        </el-row>
        <el-row>
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>线索跟进</span>
            </div>
            <div>
              <el-row :gutter="24">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">客户姓名</div>
                  <div>
                    <el-input :disabled="type==='view'" v-model="clue.name"></el-input>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">性别</div>
                  <div>
                    <el-select :disabled="type==='view'" v-model="clue.gender" placeholder="请选择性别">
                      <el-option
                        v-for="dict in dict.type.sys_user_sex"
                        :key="dict.value"
                        :label="dict.label"
                        :value="dict.value"
                      ></el-option>
                    </el-select>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">年龄</div>
                  <div>
                    <el-input-number :disabled="type==='view'" :max="99" :precision="0" :min="3" v-model="clue.age"></el-input-number>
                  </div>
                </el-col>
              </el-row>
              <el-row :gutter="24">
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">微信号</div>
                  <div>
                    <el-input :disabled="type==='view'" v-model="clue.weixin"></el-input>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">QQ</div>
                  <div>
                    <el-input :disabled="type==='view'" v-model="clue.qq"></el-input>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="font-style: italic;font-weight: bold">手机号码</div>
                  <div>
                    <el-input :disabled="type==='view'" v-model="clue.phone"></el-input>
                  </div>
                </el-col>
              </el-row>
              <el-row>
                <el-col :span="24">
                  <div style="font-style: italic;font-weight: bold">意向等级</div>
                  <div>
                    <el-radio-group v-model="clue.level" size="medium" :disabled="type==='view'">
                      <el-radio-button :label="i.label" :value="i.value" :key="i.value" v-for="i in dict.type.intention_level"></el-radio-button>
                    </el-radio-group>
                  </div>
                </el-col>
              </el-row>
              <el-row>
                <el-col :span="24">
                  <div style="font-style: italic;font-weight: bold">意向类型</div>
                  <div>
                    <el-radio-group v-model="clue.subject" size="medium" :disabled="type==='view'">
                      <el-radio-button :label="i.label" :value="i.value" :key="i.value" v-for="i in dict.type.intention_type"></el-radio-button>
                    </el-radio-group>
                  </div>
                </el-col>
              </el-row>
              <el-row>
                <el-col :span="24">
                  <div style="font-style: italic;font-weight: bold">跟进记录</div>
                  <div>
                    <el-input
                      :disabled="type==='view'"
                      type="textarea"
                      :rows="5"
                      placeholder="请输入内容"
                      v-model="clue.record">
                    </el-input>
                  </div>
                </el-col>
              </el-row>
              <el-row>
                <el-col :span="24">
                  <div style="font-style: italic;font-weight: bold">下次跟进时间</div>
                  <div>
                    <el-date-picker
                      :disabled="type==='view'"
                      v-model="clue.nextTime"
                      clearable
                      align="right"
                      unlink-panels
                      value-format="yyyy-MM-dd HH:mm:ss"
                      format="yyyy-MM-dd HH:mm:ss"
                      :default-time="['12:00:00']"
                    />
                  </div>
                </el-col>
              </el-row>
              <el-row>
                <el-col>
                  <div style="display: flex;justify-content: flex-end">
                    <el-button type="primary" :disabled="type==='view'">提交</el-button>
                    <el-button @click="goBack">返回</el-button>
                  </div>
                </el-col>
              </el-row>
            </div>
          </el-card>
        </el-row>
      </el-col>
      <el-col :span="6">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>线索跟进记录</span>
          </div>
          <div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getClueById } from '../../../api/clue'

  export default {
    name: 'details',
    dicts: ['sys_user_sex','intention_level','intention_type'],
    data() {
      return {
        type: null,
        clue: {}
      }
    },
    created() {
      const clueId = this.$route.params && this.$route.params.clueId
      this.type = this.$route.params && this.$route.params.type
      this.getClue(clueId)
    },
    methods: {
      getClue(clueId) {
        getClueById(clueId).then(response => {
          this.clue = response.data
        })
      },
      goBack() {
        this.$router.go(-1)
      }
    }
  }
</script>

<style scoped>
  .box-card {
    margin-top: 10px;
  }

  .el-row {
    margin-bottom: 30px;

  &
  :last-child {
    margin-bottom: 0;
  }

  }
</style>
