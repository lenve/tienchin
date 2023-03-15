import request from '@/utils/request'

// 查询渠道列表
export function listChannels(query) {
    return request({
        url: '/tienchin/business/channels',
        method: 'get',
        params: query
    })
}

// 根据id 查询线索摘要信息
export function getAllCourse() {
    return request({
        url: '/tienchin/business/all_course',
        method: 'get'
    })
}

// 根据 ID 查询商机
export function getBusinessById(businessId) {
    return request({
        url: '/tienchin/business/' + businessId,
        method: 'get'
    })
}

// 查询活动列表
export function listActivity(channelId) {
    return request({
        url: '/tienchin/business/activity/' + channelId,
        method: 'get'
    })
}

// 查询线索列表
export function listBusiness(query) {
    return request({
        url: '/tienchin/business/list',
        method: 'get',
        params: query
    })
}

// 查询商机的跟进记录
export function getBusinessRecordByBusinessId(clueId) {
    return request({
        url: '/tienchin/follow/record/business/' + clueId,
        method: 'get'
    })
}

// 根据课程的类型查询课程
export function getCourseByType(type) {
    return request({
        url: '/tienchin/business/course/' + type,
        method: 'get'
    })
}

// 根据部门查询用户列表
export function listUsers(deptId) {
    return request({
        url: '/tienchin/contract/users/' + deptId,
        method: 'get'
    })
}


// 新增线索
export function addBusiness(data) {
    return request({
        url: '/tienchin/business',
        method: 'post',
        data: data
    })
}

// 新增合同
export function addContract(data) {
    return request({
        url: '/tienchin/contract',
        method: 'post',
        data: data
    })
}

// 跟进商机
export function businessFollow(data) {
    return request({
        url: '/tienchin/business/follow',
        method: 'post',
        data: data
    })
}

// 线索分配
export function assignBusiness(data) {
    return request({
        url: '/tienchin/assignment',
        method: 'post',
        data: data
    })
}

// 合同审批
export function approveOrReject(data) {
    return request({
        url: '/tienchin/contract/approve',
        method: 'post',
        data: data
    })
}

// 更新商机
export function updateBusiness(data) {
    return request({
        url: '/tienchin/business',
        method: 'put',
        data: data
    })
}


// 更新商机
export function updateContractInfo(data) {
    return request({
        url: '/tienchin/contract',
        method: 'put',
        data: data
    })
}


// 根据商机的 ID 查询商机的摘要信息
export function getBusinessSummaryById(businessId) {
    return request({
        url: '/tienchin/business/summary/' + businessId,
        method: 'get'
    })
}


// 根据商机的 ID 查询商机的摘要信息
export function getCustomerNameByPhone(phone) {
    return request({
        url: '/tienchin/contract/customer/' + phone,
        method: 'get'
    })
}



// 查询当前任务已经审批完成的合同信息
export function getCurrentApprovedTask() {
    return request({
        url: '/tienchin/contract/approved',
        method: 'get'
    })
}


// 查询当前用户待审批的任务
export function getCurrentUserUnapproveTask() {
    return request({
        url: '/tienchin/contract/unapprove',
        method: 'get'
    })
}



// 查询当前用户已提交未审批的任务
export function getCurrentUserCommittedTask() {
    return request({
        url: '/tienchin/contract/committed_task',
        method: 'get'
    })
}


// 查询当前用户待审批的任务
export function getPdfFile(filename) {
    return request({
        url: '/tienchin/contract/views/' + filename,
        method: 'get'
    })
}


// 根据 ID 查询合同详细信息
export function getContractDetailsById(contractId) {
    return request({
        url: '/tienchin/contract/views/' + contractId,
        method: 'get'
    })
}


// 根据商机的 ID 删除商机
export function deleteBusinessByIds(businessIds) {
    return request({
        url: '/tienchin/business/' + businessIds,
        method: 'delete'
    })
}

// 删除合同原件
export function deleteContractFile(fileName) {
    return request({
        url: '/tienchin/contract/' + fileName,
        method: 'delete'
    })
}
