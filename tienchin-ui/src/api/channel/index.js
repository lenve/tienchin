import request from '@/utils/request'

// 查询所有的渠道信息
export function listChannel(query) {
  return request({
    url: '/tienchin/channel/list',
    method: 'get',
    params: query
  })
}

// 查询字典类型详细
export function getChannel(channelId) {
  return request({
    url: '/tienchin/channel/' + channelId,
    method: 'get'
  })
}

// 新增字典类型
export function addChannel(data) {
  return request({
    url: '/tienchin/channel/',
    method: 'post',
    data: data
  })
}

// 修改字典类型
export function updateChannel(data) {
  return request({
    url: '/tienchin/channel/',
    method: 'put',
    data: data
  })
}

// 删除字典类型
export function delChannel(channelIds) {
  return request({
    url: '/tienchin/channel/' + channelIds,
    method: 'delete'
  })
}

// 刷新字典缓存
export function refreshCache() {
  return request({
    url: '/system/dict/type/refreshCache',
    method: 'delete'
  })
}

// 获取字典选择框列表
export function optionselect() {
  return request({
    url: '/system/dict/type/optionselect',
    method: 'get'
  })
}
