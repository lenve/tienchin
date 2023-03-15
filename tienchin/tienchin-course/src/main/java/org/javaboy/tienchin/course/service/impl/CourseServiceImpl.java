package org.javaboy.tienchin.course.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.utils.SecurityUtils;
import org.javaboy.tienchin.course.domain.Course;
import org.javaboy.tienchin.course.domain.vo.CourseVO;
import org.javaboy.tienchin.course.mapper.CourseMapper;
import org.javaboy.tienchin.course.service.ICourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author javaboy
 * @since 2022-12-13
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements ICourseService {

    @Autowired
    CourseMapper courseMapper;

    @Override
    public List<Course> selectCourseList(CourseVO courseVO) {
        return courseMapper.selectCourseList(courseVO);
    }

    @Override
    public AjaxResult addCourse(Course course) {
        course.setCreateBy(SecurityUtils.getUsername());
        course.setCreateTime(LocalDateTime.now());
        course.setDelFlag(0);
        return save(course) ? AjaxResult.success("添加成功") : AjaxResult.error("添加失败");
    }

    @Override
    public AjaxResult updateCourse(Course course) {
        course.setCreateBy(null);
        course.setCreateTime(null);
        course.setDelFlag(null);
        course.setUpdateBy(SecurityUtils.getUsername());
        course.setUpdateTime(LocalDateTime.now());
        return updateById(course) ? AjaxResult.success("更新成功") : AjaxResult.error("更新失败");
    }

    @Override
    public boolean deleteCourseByIds(Long[] courseIds) {
        UpdateWrapper<Course> uw = new UpdateWrapper<>();
        uw.lambda().set(Course::getDelFlag, 1).in(Course::getCourseId, courseIds);
        return update(uw);
    }

    @Override
    public AjaxResult getCourseByCourseType(Integer type) {
        QueryWrapper<Course> qw = new QueryWrapper<>();
        qw.lambda().eq(Course::getType, type);
        List<Course> list = list(qw);
        return AjaxResult.success(list);
    }
}
