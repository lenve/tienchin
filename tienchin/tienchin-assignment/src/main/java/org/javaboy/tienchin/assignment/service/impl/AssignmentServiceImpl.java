package org.javaboy.tienchin.assignment.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.javaboy.tienchin.assignment.domain.Assignment;
import org.javaboy.tienchin.assignment.mapper.AssignmentMapper;
import org.javaboy.tienchin.assignment.service.IAssignmentService;
import org.javaboy.tienchin.common.constant.TienChinConstants;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author javaboy
 * @since 2022-12-14
 */
@Service
public class AssignmentServiceImpl extends ServiceImpl<AssignmentMapper, Assignment> implements IAssignmentService {

    @Override
    @Transactional
    public AjaxResult assignClue(Assignment assignment) {
        //1. 先将一个线索的所有分配记录中的 latest 属性设置为 false
        UpdateWrapper<Assignment> uw = new UpdateWrapper<>();
        uw.lambda().set(Assignment::getLatest, false).eq(Assignment::getAssignId, assignment.getAssignId());
        update(uw);
        //2。 分配线索
//            assignment.setType(TienChinConstants.CLUE_TYPE);
        assignment.setCreateBy(SecurityUtils.getUsername());
        assignment.setCreateTime(LocalDateTime.now());
        assignment.setLatest(true);
        save(assignment);
        return AjaxResult.success("线索分配成功");
    }
}
