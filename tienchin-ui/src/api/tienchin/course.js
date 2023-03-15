import request from '@/utils/request'

// 查询活动列表
export function listCourse(query) {
    return request({
        url: '/tienchin/course/list',
        method: 'get',
        params: query
    })
}

// 查询角色详细
export function getCourse(courseId) {
    return request({
        url: '/tienchin/course/' + courseId,
        method: 'get'
    })
}

// 新增角色
export function addCourse(data) {
    return request({
        url: '/tienchin/course',
        method: 'post',
        data: data
    })
}

// 修改角色
export function updateCourse(data) {
    return request({
        url: '/tienchin/course',
        method: 'put',
        data: data
    })
}

// 删除角色
export function delCourse(activityIds) {
    return request({
        url: '/tienchin/course/' + activityIds,
        method: 'delete'
    })
}
