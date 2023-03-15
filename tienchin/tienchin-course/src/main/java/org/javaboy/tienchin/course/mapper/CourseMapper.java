package org.javaboy.tienchin.course.mapper;

import org.javaboy.tienchin.course.domain.Course;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.javaboy.tienchin.course.domain.vo.CourseVO;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author javaboy
 * @since 2022-12-13
 */
public interface CourseMapper extends BaseMapper<Course> {

    List<Course> selectCourseList(CourseVO courseVO);
}
