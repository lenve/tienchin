package org.javaboy.tienchin.clue.service;

import org.javaboy.tienchin.clue.domain.Clue;
import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.clue.domain.vo.ClueDetails;
import org.javaboy.tienchin.clue.domain.vo.ClueSummary;
import org.javaboy.tienchin.clue.domain.vo.ClueVO;
import org.javaboy.tienchin.common.core.domain.AjaxResult;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-12-14
 */
public interface IClueService extends IService<Clue> {

    AjaxResult addClue(Clue clue);

    List<ClueSummary> selectClueList(ClueVO clueVO);

    AjaxResult getClueDetailsByClueId(Integer clueId);

    AjaxResult clueFollow(ClueDetails clueDetails);

    AjaxResult invalidClueFollow(ClueDetails clueDetails);

    AjaxResult getClueSummaryByClueId(Integer clueId);

    AjaxResult updateClue(Clue clue);

    AjaxResult deleteClueById(Integer[] clueId);

    AjaxResult clue2Business(Integer clueId);

    AjaxResult clueAnalysisData(ClueVO clueVO);
}
