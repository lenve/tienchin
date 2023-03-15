package org.javaboy.tienchin.web.controller.tienchin.clue;

import org.javaboy.tienchin.activity.service.IActivityService;
import org.javaboy.tienchin.channel.service.IChannelService;
import org.javaboy.tienchin.clue.domain.Clue;
import org.javaboy.tienchin.clue.domain.vo.ClueDetails;
import org.javaboy.tienchin.clue.domain.vo.ClueSummary;
import org.javaboy.tienchin.clue.domain.vo.ClueVO;
import org.javaboy.tienchin.clue.service.IClueService;
import org.javaboy.tienchin.common.annotation.Log;
import org.javaboy.tienchin.common.core.controller.BaseController;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.page.TableDataInfo;
import org.javaboy.tienchin.common.enums.BusinessType;
import org.javaboy.tienchin.common.validator.CreateGroup;
import org.javaboy.tienchin.common.validator.EditGroup;
import org.javaboy.tienchin.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author javaboy
 * @since 2022-12-14
 */
@RestController
@RequestMapping("/tienchin/clue")
public class ClueController extends BaseController {

    @Autowired
    IClueService clueService;
    @Autowired
    IChannelService channelService;

    @Autowired
    ISysUserService sysUserService;

    @Autowired
    IActivityService activityService;

    @PreAuthorize("hasPermission('tienchin:clue:create')")
    @Log(title = "线索管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated(CreateGroup.class) @RequestBody Clue clue) {
        return clueService.addClue(clue);
    }

    @PreAuthorize("hasPermission('tienchin:clue:create')")
    @GetMapping("/channels")
    public AjaxResult getAllChannels() {
        return AjaxResult.success(channelService.list());
    }

    @PreAuthorize("hasPermission('tienchin:clue:create')")
    @GetMapping("/activity/{channelId}")
    public AjaxResult getActivityByChannelId(@PathVariable Integer channelId) {
        return activityService.selectActivityByChannelId(channelId);
    }

    @PreAuthorize("hasPermission('tienchin:clue:list')")
    @GetMapping("/list")
    public TableDataInfo list(ClueVO clueVO) {
        startPage();
        List<ClueSummary> list = clueService.selectClueList(clueVO);
        return getDataTable(list);
    }


    @GetMapping("/users/{deptId}")
    @PreAuthorize("hasPermission('tienchin:clue:assignment')")
    public AjaxResult getUsersByDeptId(@PathVariable Long deptId) {
        return sysUserService.getUsersByDeptId(deptId);
    }


    @GetMapping("/{clueId}")
    @PreAuthorize("hasAnyPermissions('tienchin:clue:view','tienchin:clue:follow')")
    public AjaxResult getClueDetailsByClueId(@PathVariable Integer clueId) {
        return clueService.getClueDetailsByClueId(clueId);
    }

    @PreAuthorize("hasPermission('tienchin:clue:follow')")
    @PostMapping("/follow")
    public AjaxResult clueFollow(@RequestBody ClueDetails clueDetails) {
        return clueService.clueFollow(clueDetails);
    }

    @PreAuthorize("hasPermission('tienchin:clue:follow')")
    @PostMapping("/to_business/{clueId}")
    public AjaxResult clue2Business(@PathVariable Integer clueId) {
        return clueService.clue2Business(clueId);
    }
    @PreAuthorize("hasPermission('tienchin:clue:follow')")
    @PostMapping("/invalid")
    public AjaxResult invalidClueFollow(@RequestBody ClueDetails clueDetails) {
        return clueService.invalidClueFollow(clueDetails);
    }

    @GetMapping("/summary/{clueId}")
    @PreAuthorize("hasPermission('tienchin:clue:edit')")
    public AjaxResult getClueSummaryByClueId(@PathVariable Integer clueId) {
        return clueService.getClueSummaryByClueId(clueId);
    }


    @PreAuthorize("hasPermission('tienchin:clue:edit')")
    @PutMapping
    public AjaxResult updateClue(@Validated(EditGroup.class) @RequestBody Clue clue) {
        return clueService.updateClue(clue);
    }

    //localhost:8080/clueIds=1&clueIds=2
    @PreAuthorize("hasPermission('tienchin:clue:remove')")
    @DeleteMapping("/{clueIds}")
    public AjaxResult deleteClueById(@PathVariable Integer[] clueIds) {
        return clueService.deleteClueById(clueIds);
    }


}
