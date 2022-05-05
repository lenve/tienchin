package org.javaboy.tienchin.clue.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.javaboy.tienchin.assignment.domain.Assignment;
import org.javaboy.tienchin.assignment.service.IAssignmentService;
import org.javaboy.tienchin.assignment.utils.AssignmentType;
import org.javaboy.tienchin.clue.domain.Clue;
import org.javaboy.tienchin.clue.domain.dto.ClueDTO;
import org.javaboy.tienchin.clue.domain.dto.ClueFollowDTO;
import org.javaboy.tienchin.clue.domain.vo.ClueDetailsVO;
import org.javaboy.tienchin.clue.domain.vo.ClueVO;
import org.javaboy.tienchin.clue.mapper.ClueMapper;
import org.javaboy.tienchin.clue.service.IClueService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.javaboy.tienchin.clue.utils.RuleUtils;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.utils.ConvertUtil;
import org.javaboy.tienchin.common.utils.SecurityUtils;
import org.javaboy.tienchin.followrecord.domain.FollowRecord;
import org.javaboy.tienchin.followrecord.service.IFollowRecordService;
import org.javaboy.tienchin.followrecord.utils.FollowRecordType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 线索 服务实现类
 * </p>
 *
 * @author javaboy
 * @since 2022-04-28
 */
@Service
public class ClueServiceImpl extends ServiceImpl<ClueMapper, Clue> implements IClueService {

    @Autowired
    IAssignmentService assignmentService;
    @Autowired
    IFollowRecordService followRecordService;

    @Autowired
    ClueMapper clueMapper;

    /**
     * 添加线索并分配给当前用户
     *
     * @param clue
     * @return
     */
    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public AjaxResult saveClue(Clue clue) {
        QueryWrapper<Clue> qw = new QueryWrapper<>();
        qw.lambda().eq(Clue::getPhone, clue.getPhone());
        Clue one = getOne(qw);
        if (one != null) {
            return AjaxResult.error("手机号码重复");
        }
        clue.setCreateTime(LocalDateTime.now());
        clue.setCreateBy(SecurityUtils.getUsername());
        boolean saveClue = save(clue);
        Assignment assignment = new Assignment();
        assignment.setType(AssignmentType.CLUE);
        assignment.setUserId(SecurityUtils.getUserId());
        assignment.setUserName(SecurityUtils.getUsername());
        assignment.setAssignId(clue.getId());
        assignment.setDeptId(SecurityUtils.getDeptId());
        assignment.setLatest(true);
        assignment.setCreateBy(SecurityUtils.getUsername());
        assignment.setCreateTime(LocalDateTime.now());
        boolean saveAssignment = assignmentService.save(assignment);
        clue.setEndTime(RuleUtils.getClueEndTime(assignment));
        LambdaUpdateWrapper<Clue> wrapper = new LambdaUpdateWrapper<>();
        wrapper.eq(Clue::getId, clue.getId()).set(Clue::getEndTime, clue.getEndTime());
        boolean updateClue = update(wrapper);
        return (saveClue && saveAssignment && updateClue) ? AjaxResult.success() : AjaxResult.error();
    }

    @Override
    public List<ClueVO> getClueList(ClueDTO clueDTO) {
        List<ClueVO> list = clueMapper.getClueList(clueDTO);
        return list;
    }

    @Override
    public ClueDetailsVO getClueById(Long id) {
        return clueMapper.getClueById(id);
    }

    @Override
    public boolean follow(ClueFollowDTO clueFollowDTO) {
        Clue clue = ConvertUtil.convert(clueFollowDTO, Clue.class);
        boolean b = updateById(clue);
        boolean a = saveFollowRecord(clueFollowDTO);
        return b && a;
    }

    @Override
    public List<FollowRecord> getClueFollowRecordList(Long cid) {
        QueryWrapper<FollowRecord> qw = new QueryWrapper<>();
        qw.lambda().eq(FollowRecord::getAssignId, cid);
        return followRecordService.list(qw);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public boolean assginClue(Assignment assignment) {
        UpdateWrapper<Assignment> qw = new UpdateWrapper<>();
        qw.lambda().eq(Assignment::getAssignId, assignment.getAssignId()).set(Assignment::getLatest, false);
        boolean update = assignmentService.update(qw);
        assignment.setType(AssignmentType.CLUE);
        //是当前最新分配人
        assignment.setLatest(true);
        assignment.setCreateTime(LocalDateTime.now());
        assignment.setCreateBy(SecurityUtils.getUsername());
        boolean save = assignmentService.save(assignment);
        return save && update;
    }

    @Override
    public boolean invalidClue(ClueFollowDTO clueFollowDTO) {
        LambdaUpdateWrapper<Clue> qw = new LambdaUpdateWrapper<>();
        qw.eq(Clue::getId, clueFollowDTO.getId()).setSql("fail_count=fail_count+1");
        boolean update = update(qw);
        boolean a = saveFollowRecord(clueFollowDTO);
        return update&&a;
    }

    private boolean saveFollowRecord(ClueFollowDTO clueFollowDTO) {
        FollowRecord fr = new FollowRecord();
        fr.setAssignId(clueFollowDTO.getId());
        fr.setCreateBy(SecurityUtils.getUsername());
        fr.setCreateTime(LocalDateTime.now());
        fr.setInfo(clueFollowDTO.getRecord());
        fr.setType(FollowRecordType.CLUE);
        return followRecordService.save(fr);
    }
}
