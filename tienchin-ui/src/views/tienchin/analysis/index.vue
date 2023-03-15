<template>
  <div style="padding-left: 10px">
    <el-tabs v-model="activeName" class="demo-tabs">
      <el-tab-pane label="线索分析" v-hasPermi="['tienchin:analysis:clue']" name="clue"><clue-analysis></clue-analysis></el-tab-pane>
      <el-tab-pane label="商机分析" v-hasPermi="['tienchin:analysis:business']" name="business"><business-analysis></business-analysis></el-tab-pane>
      <el-tab-pane label="活动分析" v-hasPermi="['tienchin:analysis:activity']" name="activity"><activity-analysis></activity-analysis></el-tab-pane>
      <el-tab-pane label="渠道分析" v-hasPermi="['tienchin:analysis:channel']" name="channel"><channel-analysis></channel-analysis></el-tab-pane>
    </el-tabs>
  </div>
</template>

<script setup name="Analysis">
import ClueAnalysis from "./com/ClueAnalysis.vue";
import BusinessAnalysis from "./com/BusinessAnalysis.vue";
import ActivityAnalysis from "./com/ActivityAnalysis.vue";
import ChannelAnalysis from "./com/ChannelAnalysis.vue";

const activeName = ref("activity");
</script>

<style scoped>

</style>
