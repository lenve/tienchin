import request from '@/utils/request'

// 查询所有的活动信息
export function listCourse(query) {
  return request({
    url: '/tienchin/course/list',
    method: 'get',
    params: query
  })
}

// 根据 id 查询某一个活动的信息
export function getCourse(courseId) {
  return request({
    url: '/tienchin/course/' + courseId,
    method: 'get'
  })
}

// 添加活动
export function addCourse(data) {
  return request({
    url: '/tienchin/course/',
    method: 'post',
    data: data
  })
}

// 更新活动信息
export function updateCourse(data) {
  return request({
    url: '/tienchin/course/',
    method: 'put',
    data: data
  })
}

// 更新活动状态
export function changeCourseStatus(id, status) {
  const data = {
    id,
    status
  }
  return request({
    url: '/tienchin/course/changeStatus',
    method: 'put',
    data: data
  })
}

// 根据 id 删除活动
export function delCourse(courseIds) {
  return request({
    url: '/tienchin/course/' + courseIds,
    method: 'delete'
  })
}
