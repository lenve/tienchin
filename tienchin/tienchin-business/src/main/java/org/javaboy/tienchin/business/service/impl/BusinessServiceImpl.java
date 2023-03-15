package org.javaboy.tienchin.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.javaboy.tienchin.assignment.domain.Assignment;
import org.javaboy.tienchin.assignment.service.IAssignmentService;
import org.javaboy.tienchin.business.domain.Business;
import org.javaboy.tienchin.business.domain.vo.BusinessFollow;
import org.javaboy.tienchin.business.domain.vo.BusinessSummary;
import org.javaboy.tienchin.business.domain.vo.BusinessSummaryEnhance;
import org.javaboy.tienchin.business.domain.vo.BusinessVO;
import org.javaboy.tienchin.business.mapper.BusinessMapper;
import org.javaboy.tienchin.business.service.IBusinessService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.javaboy.tienchin.common.constant.TienChinConstants;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.domain.model.EchartsPoint;
import org.javaboy.tienchin.common.core.domain.model.LineChartData;
import org.javaboy.tienchin.common.utils.SecurityUtils;
import org.javaboy.tienchin.follow.domain.FollowRecord;
import org.javaboy.tienchin.follow.service.IFollowRecordService;
import org.springframework.beans.BeanUtils;
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
 * @since 2023-02-04
 */
@Service
public class BusinessServiceImpl extends ServiceImpl<BusinessMapper, Business> implements IBusinessService {

    @Autowired
    BusinessMapper businessMapper;

    @Autowired
    IAssignmentService assignmentService;

    @Autowired
    IFollowRecordService followRecordService;

    @Override
    public List<BusinessSummary> selectBusinessList(BusinessVO businessVO) {
        return businessMapper.selectBusinessList(businessVO);
    }

    @Override
    @Transactional
    public AjaxResult addBusiness(Business business) {
        QueryWrapper<Business> qw = new QueryWrapper<>();
        //按照手机号码查询这个客户，如果这个客户的信息已经录入了，则停止录入
        qw.lambda().eq(Business::getPhone, business.getPhone());
        Business one = getOne(qw);
        if (one != null) {
            return AjaxResult.error("客户手机号码重复，录入失败");
        }
        business.setStatus(TienChinConstants.BUSINESS_ALLOCATED);
        business.setCreateTime(LocalDateTime.now());
        business.setCreateBy(SecurityUtils.getUsername());
        business.setNextTime(LocalDateTime.now().plusHours(TienChinConstants.NEXT_FOLLOW_TIME));
        save(business);
        Assignment assignment = new Assignment();
        assignment.setAssignId(business.getBusinessId());
        assignment.setLatest(true);
        assignment.setType(TienChinConstants.BUSINESS_TYPE);
        assignment.setDeptId(SecurityUtils.getDeptId());
        assignment.setCreateBy(SecurityUtils.getUsername());
        assignment.setUserId(SecurityUtils.getUserId());
        assignment.setCreateTime(LocalDateTime.now());
        assignment.setUserName(SecurityUtils.getUsername());
        assignmentService.save(assignment);
        return AjaxResult.success("商机录入成功");
    }

    @Override
    public AjaxResult getBusinessById(Integer id) {
        return AjaxResult.success(getById(id));
    }

    @Override
    @Transactional
    public AjaxResult follow(BusinessFollow businessFollow) {
        //1. 线索本身的完善
        Business business = new Business();
        BeanUtils.copyProperties(businessFollow, business);
        business.setUpdateTime(LocalDateTime.now());
        business.setUpdateBy(SecurityUtils.getUsername());
        updateById(business);
        //2. 添加一个跟踪记录
        FollowRecord record = new FollowRecord();
        record.setInfo(businessFollow.getInfo());
        record.setType(TienChinConstants.BUSINESS_TYPE);
        record.setCreateBy(SecurityUtils.getUsername());
        record.setCreateTime(LocalDateTime.now());
        record.setAssignId(businessFollow.getBusinessId());
        followRecordService.save(record);
        return AjaxResult.success("商机跟进成功");
    }

    @Override
    public AjaxResult getBusinessSummaryByBusinessId(Integer businessId) {
        Business business = getById(businessId);
        BusinessSummaryEnhance businessSummaryEnhance = new BusinessSummaryEnhance();
        BeanUtils.copyProperties(business, businessSummaryEnhance);
        return AjaxResult.success(businessSummaryEnhance);
    }

    @Override
    public AjaxResult updateBusiness(BusinessSummaryEnhance businessSummaryEnhance) {
        Business business = new Business();
        BeanUtils.copyProperties(businessSummaryEnhance, business);
        return updateById(business) ? AjaxResult.success("更新成功") : AjaxResult.error("更新失败");
    }

    @Override
    public AjaxResult deleteBusinessById(Integer[] businessIds) {
        UpdateWrapper<Business> uw = new UpdateWrapper<>();
        uw.lambda().set(Business::getDelFlag, 1).in(Business::getBusinessId, businessIds);
        return update(uw) ? AjaxResult.success("删除成功") : AjaxResult.error("删除失败");
    }

    @Override
    public AjaxResult businessAnalysisData(BusinessVO businessVO) {
        if (businessVO.getParams().get("beginTime")==null||businessVO.getParams().get("endTime")==null) {
            businessVO.getParams().put("beginTime", LocalDateTime.now().minusWeeks(1));
            businessVO.getParams().put("endTime", LocalDateTime.now().plusWeeks(1));
        }
        List<EchartsPoint> increaseBusiness = businessMapper.increaseBusiness(businessVO);
        List<EchartsPoint> totalBusiness = businessMapper.totalBusiness(businessVO);
        LineChartData lineChartData = new LineChartData();
        lineChartData.setIncrease(increaseBusiness);
        lineChartData.setTotal(totalBusiness);
        return AjaxResult.success(lineChartData);
    }
}
