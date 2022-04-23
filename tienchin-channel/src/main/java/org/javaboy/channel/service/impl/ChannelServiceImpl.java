package org.javaboy.channel.service.impl;

import org.javaboy.channel.entity.Channel;
import org.javaboy.channel.mapper.ChannelMapper;
import org.javaboy.channel.service.IChannelService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

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

    @Override
    public boolean saveChannel(Channel channel) {
        channel.setCreateTime(LocalDateTime.now());
        channel.setUpdateTime(LocalDateTime.now());
        return save(channel);
    }
}
