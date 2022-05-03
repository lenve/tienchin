package org.javaboy.tienchin.clue.mapper;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.javaboy.tienchin.clue.domain.Clue;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.javaboy.tienchin.clue.domain.dto.ClueDTO;
import org.javaboy.tienchin.clue.domain.vo.ClueDetailsVO;
import org.javaboy.tienchin.clue.domain.vo.ClueVO;

import java.util.List;

/**
 * <p>
 * 线索 Mapper 接口
 * </p>
 *
 * @author javaboy
 * @since 2022-04-28
 */
public interface ClueMapper extends BaseMapper<Clue> {

    List<ClueVO> getClueList(ClueDTO clueDTO);

    ClueDetailsVO getClueById(Long id);
}
