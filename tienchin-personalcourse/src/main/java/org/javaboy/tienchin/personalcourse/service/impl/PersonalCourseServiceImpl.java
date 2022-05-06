package org.javaboy.tienchin.personalcourse.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.javaboy.tienchin.common.utils.SecurityUtils;
import org.javaboy.tienchin.personalcourse.domain.PersonalCourse;
import org.javaboy.tienchin.personalcourse.domain.dto.PersonalCourseDTO;
import org.javaboy.tienchin.personalcourse.mapper.PersonalCourseMapper;
import org.javaboy.tienchin.personalcourse.service.IPersonalCourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 课程管理 服务实现类
 * </p>
 *
 * @author javaboy
 * @since 2022-05-05
 */
@Service
public class PersonalCourseServiceImpl extends ServiceImpl<PersonalCourseMapper, PersonalCourse> implements IPersonalCourseService {

    @Override
    public boolean savePersonalCourse(PersonalCourse personalCourse) {
        personalCourse.setCreateBy(SecurityUtils.getUsername());
        personalCourse.setCreateTime(LocalDateTime.now());
        return save(personalCourse);
    }

    @Override
    public List<PersonalCourse> getPersonalCourseList(PersonalCourseDTO personalCourseDTO) {
        LambdaQueryWrapper<PersonalCourse> qw = new LambdaQueryWrapper<>();
        if (personalCourseDTO.getApplyTo() != null && !"".equals(personalCourseDTO.getApplyTo())) {
            qw.eq(PersonalCourse::getApplyTo, personalCourseDTO.getApplyTo());
        }
        if (personalCourseDTO.getName() != null && !"".equals(personalCourseDTO.getName())) {
            qw.eq(PersonalCourse::getName, personalCourseDTO.getName());
        }
        if (personalCourseDTO.getSubject() != null && !"".equals(personalCourseDTO.getSubject())) {
            qw.eq(PersonalCourse::getSubject, personalCourseDTO.getSubject());
        }
        if (personalCourseDTO.getBeginTime() != null && personalCourseDTO.getEndTime() != null) {
            qw.le(PersonalCourse::getCreateTime, personalCourseDTO.getEndTime())
                    .ge(PersonalCourse::getCreateTime, personalCourseDTO.getBeginTime());
        }
        return list(qw);
    }
}
