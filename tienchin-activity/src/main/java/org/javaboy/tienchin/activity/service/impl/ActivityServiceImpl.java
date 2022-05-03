package org.javaboy.tienchin.activity.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.javaboy.tienchin.activity.domain.Activity;
import org.javaboy.tienchin.activity.mapper.ActivityMapper;
import org.javaboy.tienchin.activity.service.IActivityService;
import org.javaboy.tienchin.common.utils.uuid.IdUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

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

    @Override
    public List<Activity> getActivityList(Activity activity) {
        QueryWrapper<Activity> qw = new QueryWrapper<>();
        if (activity.getChannel() != null) {
            qw.lambda().eq(Activity::getChannel, activity.getChannel());
        }
        if (activity.getStatus() != null) {
            qw.lambda().eq(Activity::getStatus, activity.getStatus());
        }
        if (activity.getEndTime() != null && activity.getBeginTime() != null) {
            qw.lambda().ge(Activity::getBeginTime, activity.getBeginTime()).le(Activity::getEndTime, activity.getEndTime());
        }
        return list(qw);
    }
}
