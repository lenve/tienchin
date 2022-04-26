package org.javaboy.tienchin.activity.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.javaboy.tienchin.activity.entity.Activity;
import org.javaboy.tienchin.activity.mapper.ActivityMapper;
import org.javaboy.tienchin.activity.service.IActivityService;
import org.javaboy.tienchin.common.utils.uuid.IdUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * <p>
 * 促销活动 服务实现类
 * </p>
 *
 * @author javaboy
 * @since 2022-04-25
 */
@Service
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper, Activity> implements IActivityService {

    @Override
    public boolean saveActivity(Activity activity) {
        activity.setCreateTime(LocalDateTime.now());
        activity.setCode(IdUtils.fastSimpleUUID());
        //默认状态正常
        activity.setStatus("0");
        return save(activity);
    }
}
