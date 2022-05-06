package org.javaboy.tienchin.personalcourse.service;

import org.javaboy.tienchin.personalcourse.domain.PersonalCourse;
import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.personalcourse.domain.dto.PersonalCourseDTO;

import java.util.List;

/**
 * <p>
 * 课程管理 服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-05-05
 */
public interface IPersonalCourseService extends IService<PersonalCourse> {

    boolean savePersonalCourse(PersonalCourse personalCourse);

    List<PersonalCourse> getPersonalCourseList(PersonalCourseDTO personalCourseDTO);
}
