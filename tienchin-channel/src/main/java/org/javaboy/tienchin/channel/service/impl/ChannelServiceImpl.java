package org.javaboy.tienchin.channel.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.javaboy.tienchin.activity.entity.Activity;
import org.javaboy.tienchin.activity.service.IActivityService;
import org.javaboy.tienchin.channel.entity.Channel;
import org.javaboy.tienchin.channel.mapper.ChannelMapper;
import org.javaboy.tienchin.channel.service.IChannelService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author javaboy
 * @since 2022-04-23
 */
@Service
public class ChannelServiceImpl extends ServiceImpl<ChannelMapper, Channel> implements IChannelService {

    @Autowired
    IActivityService activityService;

    @Override
    public AjaxResult deleteChannelByIds(Long[] channelIds) {
        QueryWrapper<Activity> qw = new QueryWrapper<>();
        qw.lambda().in(Activity::getChannel, channelIds);
        List<Activity> list = activityService.list(qw);
        if (list != null && list.size() > 0) {
            return AjaxResult.error("该渠道下有活动，无法删除");
        }
        return removeBatchByIds(Arrays.asList(channelIds)) ? AjaxResult.success() : AjaxResult.error();
    }
}
