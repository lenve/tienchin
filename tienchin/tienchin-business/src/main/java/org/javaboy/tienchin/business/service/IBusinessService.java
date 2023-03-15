package org.javaboy.tienchin.business.service;

import org.javaboy.tienchin.business.domain.Business;
import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.business.domain.vo.BusinessFollow;
import org.javaboy.tienchin.business.domain.vo.BusinessSummary;
import org.javaboy.tienchin.business.domain.vo.BusinessSummaryEnhance;
import org.javaboy.tienchin.business.domain.vo.BusinessVO;
import org.javaboy.tienchin.common.core.domain.AjaxResult;

import java.util.List;

/**
 * <p>
 * 线索 服务类
 * </p>
 *
 * @author javaboy
 * @since 2023-02-04
 */
public interface IBusinessService extends IService<Business> {

    List<BusinessSummary> selectBusinessList(BusinessVO businessVO);

    AjaxResult addBusiness(Business business);

    AjaxResult getBusinessById(Integer id);

    AjaxResult follow(BusinessFollow businessFollow);

    AjaxResult getBusinessSummaryByBusinessId(Integer businessId);

    AjaxResult updateBusiness(BusinessSummaryEnhance businessSummaryEnhance);

    AjaxResult deleteBusinessById(Integer[] businessIds);

    AjaxResult businessAnalysisData(BusinessVO businessVO);
}
