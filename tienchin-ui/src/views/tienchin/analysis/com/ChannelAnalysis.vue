<template>
  <div>
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
    <v-chart class="chart" :option="option"/>
    <v-chart class="chart" :option="option2"/>
    <el-table :data="channelData" style="width: 100%" border stripe>
      <el-table-column prop="name" label="渠道名称" width="180" />
      <el-table-column prop="count" label="线索数量" width="180" />
      <el-table-column prop="available" label="线索有效率" />
    </el-table>
  </div>
</template>

<script setup name="ChannelAnalysis">
import {use} from "echarts/core";
import {CanvasRenderer} from "echarts/renderers";
import {PieChart, LineChart} from "echarts/charts";
import "echarts/lib/component/grid"
import {channelAnalysisData, clueAnalysisData} from "../../../../api/tienchin/analysis";
import {
  TitleComponent,
  TooltipComponent,
  LegendComponent
} from "echarts/components";
import VChart, {THEME_KEY} from "vue-echarts";
import {ref, provide} from "vue";

const {proxy} = getCurrentInstance();
const channelData = ref([]);
use([
  CanvasRenderer,
  PieChart,
  LineChart,
  TitleComponent,
  TooltipComponent,
  LegendComponent
]);

provide(THEME_KEY, "light");
const option2 = ref({
  title: {
    text: "渠道有效率分析",
    left: "center"
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['渠道线索有效率'],
    bottom: 0,
  },
  xAxis: {
    data: [],
  },
  yAxis: {},
  series: {
    type: 'line',
    data: [],
    name: '渠道线索有效率'
  }
});

const option = ref({
  title: {
    text: "渠道总数分析",
    left: "center"
  },
  tooltip: {
    trigger: "item",
    formatter: "{a} <br/>{b} : {c} ({d}%)"
  },
  legend: {
    orient: "vertical",
    left: "left",
    data: []
  },
  series: [
    {
      name: "渠道分析",
      type: "pie",
      radius: "55%",
      center: ["50%", "60%"],
      data: [],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: "rgba(0, 0, 0, 0.5)"
        }
      }
    }
  ]
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

function getList() {
  channelAnalysisData(proxy.addDateRange(queryParams.value, queryParams.value.dateRange)).then(response => {
    let data = response.data;
    option.value.series[0].data = [];
    option.value.legend.data = [];
    option2.value.xAxis.data = [];
    option2.value.series.data = [];
    for (let i = 0; i < data.length; i++) {
      let {name, count,available} = data[i];
      let newItem = {name: name, value: count}
      console.log(newItem);
      option.value.series[0].data.push(newItem);
      option.value.legend.data.push(name);
      option2.value.xAxis.data.push(name);
      option2.value.series.data.push(available);
      channelData.value = data;
    }
  });

}

getList();

</script>

<style scoped>
.chart {
  height: 400px;
}
</style>
