package org.javaboy.tienchin.web.controller.course;

import org.javaboy.tienchin.common.annotation.Log;
import org.javaboy.tienchin.common.core.controller.BaseController;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.page.TableDataInfo;
import org.javaboy.tienchin.common.enums.BusinessType;
import org.javaboy.tienchin.personalcourse.domain.PersonalCourse;
import org.javaboy.tienchin.personalcourse.domain.dto.PersonalCourseDTO;
import org.javaboy.tienchin.personalcourse.service.IPersonalCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Arrays;
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
@RequestMapping("/tienchin/course")
public class PersonalCourseController extends BaseController {

    @Autowired
    IPersonalCourseService personalCourseService;

    @PreAuthorize("@ss.hasPermi('tienchin:course:add')")
    @Log(title = "私教课程管理", businessType = BusinessType.INSERT)
    @PostMapping("/")
    public AjaxResult add(@Validated @RequestBody PersonalCourse personalCourse) {
        personalCourse.setCreateBy(getUsername());
        return toAjax(personalCourseService.savePersonalCourse(personalCourse));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:course:query')")
    @GetMapping("/list")
    public TableDataInfo getCourseList(PersonalCourseDTO personalCourseDTO) {
        startPage();
        List<PersonalCourse> list = personalCourseService.getPersonalCourseList(personalCourseDTO);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('tienchin:course:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getCourseById(@PathVariable Long id) {
        return AjaxResult.success(personalCourseService.getById(id));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:course:edit')")
    @Log(title = "促销活动", businessType = BusinessType.UPDATE)
    @PutMapping("/")
    public AjaxResult edit(@Validated @RequestBody PersonalCourse personalCourse) {
        personalCourse.setUpdateBy(getUsername());
        personalCourse.setUpdateTime(LocalDateTime.now());
        return toAjax(personalCourseService.saveOrUpdate(personalCourse));
    }


    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('tienchin:course:edit')")
    @Log(title = "促销活动", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody PersonalCourse personalCourse) {
        personalCourse.setUpdateTime(LocalDateTime.now());
        personalCourse.setUpdateBy(getUsername());
        return toAjax(personalCourseService.updateById(personalCourse));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:course:remove')")
    @Log(title = "促销活动", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        //待完善，将来加了其他功能后再继续完善
        return toAjax(personalCourseService.removeBatchByIds(Arrays.asList(ids)));
    }
//    @Autowired
//    IActivityService activityService;
//
//    @PreAuthorize("@ss.hasPermi('tienchin:activity:add')")
//    @Log(title = "促销活动", businessType = BusinessType.INSERT)
//    @PostMapping("/")
//    public AjaxResult add(@Validated @RequestBody Activity activity) {
//        activity.setCreateBy(getUsername());
//        return toAjax(activityService.saveActivity(activity));
//    }
//
//
//    /**
//     * 状态修改
//     */
//    @PreAuthorize("@ss.hasPermi('tienchin:activity:edit')")
//    @Log(title = "促销活动" , businessType = BusinessType.UPDATE)
//    @PutMapping("/changeStatus")
//    public AjaxResult changeStatus(@RequestBody Activity activity) {
//        activity.setUpdateTime(LocalDateTime.now());
//        activity.setUpdateBy(getUsername());
//        return toAjax(activityService.updateById(activity));
//    }
//
//    @PreAuthorize("@ss.hasPermi('tienchin:activity:edit')")
//    @Log(title = "促销活动" , businessType = BusinessType.UPDATE)
//    @PutMapping("/")
//    public AjaxResult edit(@Validated @RequestBody Activity activity) {
//        activity.setUpdateBy(getUsername());
//        activity.setUpdateTime(LocalDateTime.now());
//        return toAjax(activityService.saveOrUpdate(activity));
//    }
//
//    @PreAuthorize("@ss.hasPermi('tienchin:activity:query')")
//    @GetMapping("/list")
//    public TableDataInfo getActivityList(Activity activity) {
//        startPage();
//        List<Activity> list = activityService.getActivityList(activity);
//        return getDataTable(list);
//    }
//
//    @PostMapping("/importTemplate")
//    public void importTemplate(HttpServletResponse response) {
//        ExcelUtil<Activity> util = new ExcelUtil<Activity>(Activity.class);
//        util.importTemplateExcel(response, "活动数据");
//    }
//
//    @Log(title = "促销活动" , businessType = BusinessType.EXPORT)
//    @PreAuthorize("@ss.hasPermi('tienchin:activity:export')")
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, Activity activity) {
//        List<Activity> list = activityService.getActivityList(activity);
//        ExcelUtil<Activity> util = new ExcelUtil<Activity>(Activity.class);
//        util.exportExcel(response, list, "促销活动数据");
//    }
//
//    @Log(title = "促销活动" , businessType = BusinessType.IMPORT)
//    @PreAuthorize("@ss.hasPermi('tienchin:activity:import')")
//    @PostMapping("/importData")
//    public AjaxResult importData(MultipartFile file) throws Exception {
//        ExcelUtil<Activity> util = new ExcelUtil<Activity>(Activity.class);
//        List<Activity> activityList = util.importExcel(file.getInputStream());
//        return toAjax(activityService.saveBatch(activityList));
//    }
//
//    @PreAuthorize("@ss.hasPermi('tienchin:activity:remove')")
//    @Log(title = "促销活动" , businessType = BusinessType.DELETE)
//    @DeleteMapping("/{activityIds}")
//    public AjaxResult remove(@PathVariable Long[] activityIds) {
//        //待完善，将来加了其他功能后再继续完善
//        return toAjax(activityService.removeBatchByIds(Arrays.asList(activityIds)));
//    }
//
//    @PreAuthorize("@ss.hasPermi('tienchin:activity:query')")
//    @GetMapping(value = "/{id}")
//    public AjaxResult getActivityById(@PathVariable Long id) {
//        return AjaxResult.success(activityService.getById(id));
//    }
//}
}
