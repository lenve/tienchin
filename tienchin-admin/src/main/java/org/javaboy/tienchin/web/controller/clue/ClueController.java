package org.javaboy.tienchin.web.controller.clue;

import org.javaboy.tienchin.assignment.domain.Assignment;
import org.javaboy.tienchin.clue.domain.Clue;
import org.javaboy.tienchin.clue.domain.dto.ClueDTO;
import org.javaboy.tienchin.clue.domain.dto.ClueFollowDTO;
import org.javaboy.tienchin.clue.domain.vo.ClueVO;
import org.javaboy.tienchin.clue.service.IClueService;
import org.javaboy.tienchin.common.annotation.Log;
import org.javaboy.tienchin.common.core.controller.BaseController;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.page.TableDataInfo;
import org.javaboy.tienchin.common.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
@RestController
@RequestMapping("/tienchin/clue")
public class ClueController extends BaseController {
    @Autowired
    IClueService clueService;

    @PreAuthorize("@ss.hasPermi('tienchin:clue:add')")
    @Log(title = "线索管理", businessType = BusinessType.INSERT)
    @PostMapping("/")
    public AjaxResult add(@Validated @RequestBody Clue clue) {
        return clueService.saveClue(clue);
    }

    @PreAuthorize("@ss.hasPermi('tienchin:clue:query')")
    @GetMapping("/list")
    public TableDataInfo getClueList(ClueDTO clueDTO) {
        startPage();
        List<ClueVO> list = clueService.getClueList(clueDTO);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('tienchin:clue:record:list')")
    @GetMapping("/record/list/{cid}")
    public TableDataInfo getClueFollowRecordList(@PathVariable Long cid) {
        startPage();
        return getDataTable(clueService.getClueFollowRecordList(cid));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:clue:info')")
    @GetMapping(value = "/{id}")
    public AjaxResult getClueById(@PathVariable Long id) {
        return AjaxResult.success(clueService.getClueById(id));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:clue:record:add')")
    @Log(title = "线索管理", businessType = BusinessType.UPDATE)
    @PutMapping("/")
    public AjaxResult follow(@Validated @RequestBody ClueFollowDTO clueFollowDTO) {
        return toAjax(clueService.follow(clueFollowDTO));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:clue:record:add')")
    @Log(title = "线索管理", businessType = BusinessType.UPDATE)
    @PutMapping("/assign")
    public AjaxResult assginClue(@Validated @RequestBody Assignment assignment) {
        return toAjax(clueService.assginClue(assignment));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:clue:record:add')")
    @Log(title = "线索管理", businessType = BusinessType.UPDATE)
    @PutMapping("/invalid")
    public AjaxResult invalidClue(@Validated @RequestBody ClueFollowDTO clueFollowDTO) {
        return toAjax(clueService.invalidClue(clueFollowDTO));
    }

}