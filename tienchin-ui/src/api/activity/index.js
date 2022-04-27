import request from '@/utils/request'

// 查询所有的活动信息
export function listActivity(query) {
  return request({
    url: '/tienchin/activity/list',
    method: 'get',
    params: query
  })
}

// 根据 id 查询某一个活动的信息
export function getActivity(activityId) {
  return request({
    url: '/tienchin/activity/' + activityId,
    method: 'get'
  })
}

// 添加活动
export function addActivity(data) {
  return request({
    url: '/tienchin/activity/',
    method: 'post',
    data: data
  })
}

// 更新活动信息
export function updateActivity(data) {
  return request({
    url: '/tienchin/activity/',
    method: 'put',
    data: data
  })
}

// 更新活动状态
export function changeActivityStatus(id, status) {
  const data = {
    id,
    status
  }
  return request({
    url: '/tienchin/activity/changeStatus',
    method: 'put',
    data: data
  })
}

// 根据 id 删除活动
export function delActivity(activityIds) {
  return request({
    url: '/tienchin/activity/' + activityIds,
    method: 'delete'
  })
}
