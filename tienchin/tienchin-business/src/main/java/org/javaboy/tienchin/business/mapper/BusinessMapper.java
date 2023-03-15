package org.javaboy.tienchin.business.mapper;

import org.javaboy.tienchin.business.domain.Business;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.javaboy.tienchin.business.domain.vo.BusinessSummary;
import org.javaboy.tienchin.business.domain.vo.BusinessVO;
import org.javaboy.tienchin.common.core.domain.model.EchartsPoint;

import java.util.List;

/**
 * <p>
 * 线索 Mapper 接口
 * </p>
 *
 * @author javaboy
 * @since 2023-02-04
 */
public interface BusinessMapper extends BaseMapper<Business> {

    List<BusinessSummary> selectBusinessList(BusinessVO businessVO);

    List<EchartsPoint> increaseBusiness(BusinessVO businessVO);

    List<EchartsPoint> totalBusiness(BusinessVO businessVO);
}
