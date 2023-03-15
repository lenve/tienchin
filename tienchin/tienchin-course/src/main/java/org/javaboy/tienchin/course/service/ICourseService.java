package org.javaboy.tienchin.course.service;

import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.course.domain.Course;
import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.course.domain.vo.CourseVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-12-13
 */
public interface ICourseService extends IService<Course> {

    List<Course> selectCourseList(CourseVO courseVO);

    AjaxResult addCourse(Course course);

    AjaxResult updateCourse(Course course);

    boolean deleteCourseByIds(Long[] courseIds);

    AjaxResult getCourseByCourseType(Integer type);
}
