import request from '@/utils/request'

// 查询所有的活动信息
export function listClue(query) {
  return request({
    url: '/tienchin/clue/list',
    method: 'get',
    params: query
  })
}

// 根据 id 查询某一个活动的信息
export function getClueById(clueId) {
  return request({
    url: '/tienchin/clue/' + clueId,
    method: 'get'
  })
}

// 查看线索跟进记录
export function getFollowRecordByClueId(clueId) {
  return request({
    url: '/tienchin/clue/record/list/' + clueId,
    method: 'get'
  })
}

// 添加活动
export function addClue(data) {
  return request({
    url: '/tienchin/clue/',
    method: 'post',
    data: data
  })
}

// 线索跟进
export function followClue(data) {
  return request({
    url: '/tienchin/clue/',
    method: 'put',
    data: data
  })
}

// 线索跟进
export function invalidClue(data) {
  return request({
    url: '/tienchin/clue/invalid',
    method: 'put',
    data: data
  })
}

// 线索跟进
export function assignClue(data) {
  return request({
    url: '/tienchin/clue/assign',
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
