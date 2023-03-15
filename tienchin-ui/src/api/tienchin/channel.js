import request from '@/utils/request'

// 查询角色列表
export function listChannel(query) {
    return request({
        url: '/tienchin/channel/list',
        method: 'get',
        params: query
    })
}

// 查询角色详细
export function getChannel(channelId) {
    return request({
        url: '/tienchin/channel/' + channelId,
        method: 'get'
    })
}

// 新增角色
export function addChannel(data) {
    return request({
        url: '/tienchin/channel',
        method: 'post',
        data: data
    })
}

// 修改角色
export function updateChannel(data) {
    return request({
        url: '/tienchin/channel',
        method: 'put',
        data: data
    })
}

// 删除角色
export function delChannel(channelId) {
    return request({
        url: '/tienchin/channel/' + channelId,
        method: 'delete'
    })
}
