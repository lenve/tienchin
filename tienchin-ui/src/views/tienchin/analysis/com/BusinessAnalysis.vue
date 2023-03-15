<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" label-width="80px">
      <el-form-item label="创建时间">
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
    <div>
      <v-chart class="business_chart" :option="option"/>
    </div>
    <div>
      <el-table :data="businessData" style="width: 100%" border stripe>
        <el-table-column prop="x" label="时间" width="180" />
        <el-table-column prop="y" label="商机增量" width="180" />
        <el-table-column prop="y2" label="商机存量" />
      </el-table>
    </div>
  </div>
</template>

<script setup name="BusinessAnalysis">
import {use} from "echarts/core";
import {CanvasRenderer} from "echarts/renderers";
import {PieChart, LineChart, BarChart} from "echarts/charts";
import "echarts/lib/component/grid"
import {
  TitleComponent,
  TooltipComponent,
  LegendComponent
} from "echarts/components";
import VChart, {THEME_KEY} from "vue-echarts";
import {ref, provide} from "vue";
import {businessAnalysisData} from "../../../../api/tienchin/analysis";
import {listChannels, listClue} from "../../../../api/tienchin/clue";

const {proxy} = getCurrentInstance();
const {clue_status} = proxy.useDict("clue_status");
const channelList = ref([]);
const businessData = ref([]);

use([
  CanvasRenderer,
  PieChart,
  LineChart,
  BarChart,
  TitleComponent,
  TooltipComponent,
  LegendComponent
]);

provide(THEME_KEY, "light");

const option = ref({
  title: {
    text: "商机分析",
    left: "center"
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['增量数据', '存量数据'],
    bottom: 0,
  },
  xAxis: {
    data: [],
  },
  yAxis: {},
  series: [{
    type: 'line',
    data: [],
    name: '存量数据'
  }, {
    type: 'line',
    data: [],
    name: '增量数据'
  }]
});

const data = reactive({
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: undefined,
    phone: undefined,
    owner: undefined,
    channelId: undefined,
    dateRange: undefined,
    status: undefined
  }
});

const {queryParams} = toRefs(data);

function handleQuery() {
  getList();
}

function handlebusinessData(data) {
  businessData.value = JSON.parse(JSON.stringify(data.increase));
  let totalBusiness = data.total;
  for (let i = 0; i < totalBusiness.length; i++) {
    businessData.value[i].y2 = totalBusiness[i].y;
  }
}

function getList() {
  businessAnalysisData(proxy.addDateRange(queryParams.value, queryParams.value.dateRange)).then(response => {
    let data = response.data;
    let increaseBusiness = data.increase;
    let totalBusiness = data.total;
    let increaseData = new Object();
    increaseData.name = '增量数据';
    increaseData.type = 'line';
    let totalData = new Object();
    totalData.name = '存量数据';
    totalData.type = 'line';
    option.value.xAxis.data = [];
    increaseData.data = [];
    totalData.data = [];
    for (let i = 0; i < increaseBusiness.length; i++) {
      option.value.xAxis.data.push(increaseBusiness[i].x);
      increaseData.data.push(increaseBusiness[i].y);
      totalData.data.push(totalBusiness[i].y);
    }
    option.value.series = [];
    option.value.series.push(increaseData);
    option.value.series.push(totalData);
    handlebusinessData(data);
  });

}

function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}


function getAllChannels() {
  listChannels().then(response => {
    channelList.value = response.data;
  })
}

getAllChannels();

getList();
</script>

<style scoped>
.business_chart {
  height: 400px;
  width: 1670px;
}
</style>
