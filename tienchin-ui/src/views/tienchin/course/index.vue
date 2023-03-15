<template>
    <div class="app-container">
        <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
            <el-form-item label="课程名称" prop="name">
                <el-input
                        v-model="queryParams.name"
                        placeholder="请输入课程名称"
                        clearable
                        @keyup.enter="handleQuery"
                />
            </el-form-item>
            <el-form-item label="课程类型" prop="type">
                <el-select
                        v-model="queryParams.type"
                        placeholder="课程类型"
                        clearable
                >
                    <el-option
                            v-for="ct in course_type"
                            :key="ct.value"
                            :label="ct.label"
                            :value="ct.value"
                    />
                </el-select>
            </el-form-item>
            <el-form-item label="适用人群" prop="applyTo">
                <el-select v-model="queryParams.applyTo" placeholder="适用人群" clearable>
                    <el-option
                            v-for="cat in course_apply_to"
                            :key="cat.value"
                            :label="cat.label"
                            :value="cat.value"
                    />
                </el-select>
            </el-form-item>
            <el-form-item label="最低价格" prop="minPrice">
                <el-input-number placeholder="最低价格" @keyup.enter="handleQuery" clearable v-model="queryParams.minPrice" :precision="2" :step="100" :min="0" />
            </el-form-item>
            <el-form-item label="最高价格" prop="maxPrice">
                <el-input-number placeholder="最高价格" @keyup.enter="handleQuery" clearable v-model="queryParams.maxPrice" :precision="2" :step="100" :min="0" />
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
                        v-hasPermi="['tienchin:course:create']"
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
                        v-hasPermi="['tienchin:course:edit']"
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
                        v-hasPermi="['tienchin:course:remove']"
                >删除
                </el-button>
            </el-col>
            <el-col :span="1.5">
                <el-button
                        type="warning"
                        plain
                        icon="Download"
                        @click="handleExport"
                        v-hasPermi="['tienchin:course:export']"
                >导出
                </el-button>
            </el-col>
            <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="courseList" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55" align="center"/>
            <el-table-column label="课程编号" align="center" :show-overflow-tooltip="true" width="80" prop="courseId"/>
            <el-table-column label="课程类型" align="center" width="120">
                <template #default="scope">
                    <dict-tag :options="course_type" :value="scope.row.type"/>
                </template>
            </el-table-column>
            <el-table-column label="课程名称" align="center" :show-overflow-tooltip="true" width="120" prop="name"/>
            <el-table-column label="课程价格" align="center" :show-overflow-tooltip="true" width="120" prop="price"/>
            <el-table-column label="课程适用人群" align="center" width="150">
                <template #default="scope">
                    <dict-tag :options="course_apply_to" :value="scope.row.applyTo"/>
                </template>
            </el-table-column>
            <el-table-column label="课程简介" align="center" :show-overflow-tooltip="true" width="180" prop="info"/>
            <!--            <el-table-column label="课程备注" align="center" :show-overflow-tooltip="true" width="180" prop="remark"/>-->
            <el-table-column label="创建时间" align="center" prop="createTime" width="180">
                <template #default="scope">
                    <span>{{ parseTime(scope.row.createTime) }}</span>
                </template>
            </el-table-column>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                <template #default="scope">
                    <el-button
                            type="text"
                            icon="Edit"
                            @click="handleUpdate(scope.row)"
                            v-hasPermi="['tienchin:course:edit']"
                    >修改
                    </el-button>
                    <el-button
                            type="text"
                            icon="Delete"
                            @click="handleDelete(scope.row)"
                            v-hasPermi="['tienchin:course:remove']"
                    >删除
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

        <!-- 添加或修改课程对话框 -->
        <el-dialog :title="title" v-model="open" width="500px" append-to-body>
            <el-form ref="courseRef" :model="form" :rules="rules" label-width="80px">
                <el-row>
                    <el-col :span="12">
                        <el-form-item label="课程分类" prop="type">
                            <el-select
                                    v-model="form.type"
                                    placeholder="课程分类"
                                    clearable
                                    style="width: 240px"
                            >
                                <el-option
                                        v-for="ct in course_type"
                                        :key="ct.value"
                                        :label="ct.label"
                                        :value="parseInt(ct.value)"
                                />
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
                            <el-select
                                    v-model="form.applyTo"
                                    placeholder="课程适用人群"
                                    clearable
                                    style="width: 240px"
                            >
                                <el-option
                                        v-for="cat in course_apply_to"
                                        :key="cat.value"
                                        :label="cat.label"
                                        :value="parseInt(cat.value)"
                                />
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="课程价格" prop="price">
                            <el-input-number style="width: 100%" v-model="form.price" placeholder="课程价格"
                                             :precision="2" :min="0" :step="100"/>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="24">
                        <el-form-item label="课程简介" prop="info">
                            <el-input v-model="form.info" type="textarea" placeholder="请输入内容"></el-input>
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
    import {listCourse, addCourse, getCourse, updateCourse, delCourse} from "../../../api/tienchin/course";

    const {proxy} = getCurrentInstance();
    const {course_type, course_apply_to} = proxy.useDict("course_type", "course_apply_to");

    const courseList = ref([]);
    const open = ref(false);
    const loading = ref(true);
    const showSearch = ref(true);
    const ids = ref([]);
    const single = ref(true);
    const multiple = ref(true);
    const total = ref(0);
    const title = ref("");

    const data = reactive({
        form: {},
        queryParams: {
            pageNum: 1,
            pageSize: 10,
            name: undefined,
            channelId: undefined,
            type: undefined,
            status: undefined
        },
        rules: {
            price: [{required: true, message: "课程价格不能为空", trigger: "blur"}],
            name: [{required: true, message: "课程名称不能为空", trigger: "blur"}],
            info: [{required: true, message: "课程简介不能为空", trigger: "blur"}],
            type: [{required: true, message: "课程类型不能为空", trigger: "blur"}],
            applyTo: [{required: true, message: "适用人群不能为空", trigger: "blur"}]
        }
    });

    const {queryParams, form, rules} = toRefs(data);

    /** 查询课程列表 */
    function getList() {
        loading.value = true;
        listCourse(queryParams.value).then(response => {
            courseList.value = response.rows;
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
            applyTo: undefined,
            name: undefined,
            info: undefined,
            type: undefined,
            price: undefined
        };
        proxy.resetForm("courseRef");
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
        ids.value = selection.map(item => item.courseId);
        single.value = selection.length != 1;
        multiple.value = !selection.length;
    }

    /** 新增按钮操作 */
    function handleAdd() {
        reset();
        open.value = true;
        title.value = "添加课程";
    }

    /** 修改按钮操作 */
    function handleUpdate(row) {
        reset();
        const courseId = row.courseId || ids.value;
        getCourse(courseId).then(response => {
            form.value = response.data;
            open.value = true;
            title.value = "修改课程";
        });
    }

    /** 提交按钮 */
    function submitForm() {
        proxy.$refs["courseRef"].validate(valid => {
            if (valid) {
                if (form.value.courseId != undefined) {
                    updateCourse(form.value).then(response => {
                        proxy.$modal.msgSuccess("修改成功");
                        open.value = false;
                        getList();
                    });
                } else {
                    addCourse(form.value).then(response => {
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
        const courseIds = row.courseId || ids.value;
        proxy.$modal.confirm('是否确认删除课程编号为"' + courseIds + '"的数据项？').then(function () {
            return delCourse(courseIds);
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
