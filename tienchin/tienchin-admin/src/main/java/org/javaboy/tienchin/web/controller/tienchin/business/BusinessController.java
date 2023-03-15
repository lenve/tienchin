package org.javaboy.tienchin.web.controller.tienchin.business;

import org.javaboy.tienchin.activity.service.IActivityService;
import org.javaboy.tienchin.business.domain.Business;
import org.javaboy.tienchin.business.domain.vo.BusinessFollow;
import org.javaboy.tienchin.business.domain.vo.BusinessSummary;
import org.javaboy.tienchin.business.domain.vo.BusinessSummaryEnhance;
import org.javaboy.tienchin.business.domain.vo.BusinessVO;
import org.javaboy.tienchin.business.service.IBusinessService;
import org.javaboy.tienchin.channel.service.IChannelService;
import org.javaboy.tienchin.common.annotation.Log;
import org.javaboy.tienchin.common.core.controller.BaseController;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.page.TableDataInfo;
import org.javaboy.tienchin.common.enums.BusinessType;
import org.javaboy.tienchin.course.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tienchin/business")
public class BusinessController extends BaseController {

    @Autowired
    IBusinessService businessService;

    @Autowired
    IChannelService channelService;

    @Autowired
    IActivityService activityService;

    @Autowired
    ICourseService courseService;

    @PreAuthorize("hasAnyPermissions('tienchin:business:follow','tienchin:business:view')")
    @GetMapping("/course/{type}")
    public AjaxResult getCourseByCourseType(@PathVariable Integer type) {
        return courseService.getCourseByCourseType(type);
    }

    @PreAuthorize("hasAnyPermissions('tienchin:business:follow','tienchin:business:view')")
    @GetMapping("/all_course")
    public AjaxResult getAllCourse() {
        return AjaxResult.success(courseService.list());
    }

    @PreAuthorize("hasAnyPermissions('tienchin:business:follow','tienchin:business:view')")
    @GetMapping("/{id}")
    public AjaxResult getBusinessById(@PathVariable Integer id) {
        return businessService.getBusinessById(id);
    }

    @PreAuthorize("hasPermission('tienchin:clue:list')")
    @GetMapping("/list")
    public TableDataInfo list(BusinessVO businessVO) {
        startPage();
        List<BusinessSummary> list = businessService.selectBusinessList(businessVO);
        return getDataTable(list);
    }

    @PreAuthorize("hasPermission('tienchin:business:follow')")
    @PostMapping("/follow")
    public AjaxResult follow(@RequestBody @Validated BusinessFollow businessFollow) {
        return businessService.follow(businessFollow);
    }

    @PreAuthorize("hasPermission('tienchin:clue:create')")
    @Log(title = "商机管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody Business business) {
        return businessService.addBusiness(business);
    }

    @PreAuthorize("hasPermission('tienchin:business:create')")
    @GetMapping("/channels")
    public AjaxResult getAllChannels() {
        return AjaxResult.success(channelService.list());
    }

    @PreAuthorize("hasPermission('tienchin:business:create')")
    @GetMapping("/activity/{channelId}")
    public AjaxResult getActivityByChannelId(@PathVariable Integer channelId) {
        return activityService.selectActivityByChannelId(channelId);
    }

    /**
     * 根据商机的 ID 查询一个商机的摘要信息
     * @param businessId
     * @return
     */
    @GetMapping("/summary/{businessId}")
    @PreAuthorize("hasPermission('tienchin:business:edit')")
    public AjaxResult getBusinessSummaryByBusinessId(@PathVariable Integer businessId) {
        return businessService.getBusinessSummaryByBusinessId(businessId);
    }


    @PreAuthorize("hasPermission('tienchin:business:edit')")
    @PutMapping
    public AjaxResult updateBusiness(@RequestBody BusinessSummaryEnhance businessSummaryEnhance) {
        return businessService.updateBusiness(businessSummaryEnhance);
    }

    @PreAuthorize("hasPermission('tienchin:business:remove')")
    @DeleteMapping("/{businessIds}")
    public AjaxResult deleteBusinessById(@PathVariable Integer[] businessIds) {
        return businessService.deleteBusinessById(businessIds);
    }

}
