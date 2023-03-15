package org.javaboy.tienchin.web.controller.tienchin;

import org.javaboy.tienchin.activity.domain.vo.ActivityVO;
import org.javaboy.tienchin.activity.service.IActivityService;
import org.javaboy.tienchin.common.validator.CreateGroup;
import org.javaboy.tienchin.common.validator.EditGroup;
import org.javaboy.tienchin.channel.domain.vo.ChannelVO;
import org.javaboy.tienchin.channel.service.IChannelService;
import org.javaboy.tienchin.common.annotation.Log;
import org.javaboy.tienchin.common.core.controller.BaseController;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.page.TableDataInfo;
import org.javaboy.tienchin.common.enums.BusinessType;
import org.javaboy.tienchin.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author javaboy
 * @since 2022-12-11
 */
@RestController
@RequestMapping("/tienchin/activity")
public class ActivityController extends BaseController {

    @Autowired
    IActivityService activityService;

    @Autowired
    IChannelService channelService;

    @PreAuthorize("hasPermission('tienchin:activity:create')")
    @GetMapping("/channel/list")
    public AjaxResult channelList() {
        return AjaxResult.success(channelService.selectChannelList(new ChannelVO()));
    }

    @PreAuthorize("hasPermission('tienchin:activity:list')")
    @GetMapping("/list")
    public TableDataInfo list(ActivityVO activityVO) {
        startPage();
        List<ActivityVO> list = activityService.selectActivityList(activityVO);
        return getDataTable(list);
    }

    /**
     * 添加活动
     *
     * @param activityVO
     * @return
     */
    @PreAuthorize("hasPermission('tienchin:activity:create')")
    @Log(title = "活动管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated(CreateGroup.class) @RequestBody ActivityVO activityVO) {
        return activityService.addActivity(activityVO);
    }

    /**
     * 修改活动
     */
    @PreAuthorize("hasPermission('tienchin:activity:edit')")
    @Log(title = "活动管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated(EditGroup.class) @RequestBody ActivityVO activityVO) {
        return activityService.updateActivity(activityVO);
    }

    /**
     * 根据活动 ID 查询一个具体的活动
     *
     * @param activityId
     * @return
     */
    @PreAuthorize("hasPermission('tienchin:activity:edit')")
    @GetMapping("/{activityId}")
    public AjaxResult getInfo(@PathVariable Long activityId) {
        return AjaxResult.success(activityService.getActivityById(activityId));
    }

    /**
     * 删除活动
     */
    @PreAuthorize("hasPermission('tienchin:activity:remove')")
    @Log(title = "活动管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{activityIds}")
    public AjaxResult remove(@PathVariable Long[] activityIds) {
        return toAjax(activityService.deleteActivityByIds(activityIds));
    }

    /**
     * 导出活动
     *
     * @param response
     * @param activityVO
     */
    @Log(title = "活动管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("hasPermission('tienchin:activity:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, ActivityVO activityVO) {
        List<ActivityVO> list = activityService.selectActivityList(activityVO);
        ExcelUtil<ActivityVO> util = new ExcelUtil<ActivityVO>(ActivityVO.class);
        util.exportExcel(response, list, "活动数据");
    }


}
