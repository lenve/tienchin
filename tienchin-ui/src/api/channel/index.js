import request from '@/utils/request'

// 查询所有的渠道信息
export function listChannel(query) {
  return request({
    url: '/tienchin/channel/list',
    method: 'get',
    params: query
  })
}

// 根据 id 查询某一个渠道的信息
export function getChannel(channelId) {
  return request({
    url: '/tienchin/channel/' + channelId,
    method: 'get'
  })
}

// 添加渠道
export function addChannel(data) {
  return request({
    url: '/tienchin/channel/',
    method: 'post',
    data: data
  })
}

// 更新渠道信息
export function updateChannel(data) {
  return request({
    url: '/tienchin/channel/',
    method: 'put',
    data: data
  })
}

// 根据 id 删除渠道
export function delChannel(channelIds) {
  return request({
    url: '/tienchin/channel/' + channelIds,
    method: 'delete'
  })
}
