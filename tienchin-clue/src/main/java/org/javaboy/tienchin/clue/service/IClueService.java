package org.javaboy.tienchin.clue.service;

import org.javaboy.tienchin.assignment.domain.Assignment;
import org.javaboy.tienchin.clue.domain.Clue;
import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.clue.domain.dto.ClueDTO;
import org.javaboy.tienchin.clue.domain.dto.ClueFollowDTO;
import org.javaboy.tienchin.clue.domain.vo.ClueDetailsVO;
import org.javaboy.tienchin.clue.domain.vo.ClueVO;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.followrecord.domain.FollowRecord;

import java.util.List;

/**
 * <p>
 * 线索 服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-04-28
 */
public interface IClueService extends IService<Clue> {

    AjaxResult saveClue(Clue clue);

    List<ClueVO> getClueList(ClueDTO clueDTO);

    ClueDetailsVO getClueById(Long id);

    boolean follow(ClueFollowDTO clueFollowDTO);

    List<FollowRecord> getClueFollowRecordList(Long cid);

    boolean assginClue(Assignment assignment);

    boolean invalidClue(ClueFollowDTO clueFollowDTO);
}
