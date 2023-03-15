package org.javaboy.tienchin.clue.mapper;

import org.javaboy.tienchin.clue.domain.Clue;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.javaboy.tienchin.clue.domain.vo.ClueDetails;
import org.javaboy.tienchin.clue.domain.vo.ClueSummary;
import org.javaboy.tienchin.clue.domain.vo.ClueVO;
import org.javaboy.tienchin.common.core.domain.model.EchartsPoint;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author javaboy
 * @since 2022-12-14
 */
public interface ClueMapper extends BaseMapper<Clue> {

    List<ClueSummary> selectClueList(ClueVO clueVO);

    ClueDetails getClueDetailsByClueId(Integer clueId);

    List<EchartsPoint> increaseClue(ClueVO clueVO);

    List<EchartsPoint> totalClue(ClueVO clueVO);
}
