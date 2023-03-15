package org.javaboy.tienchin.follow.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.follow.domain.FollowRecord;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-12-14
 */
public interface IFollowRecordService extends IService<FollowRecord> {

    AjaxResult getFollowRecordByClueId(Integer clueId);

    AjaxResult getFollowRecordByBusinessId(Integer businessId);
}
