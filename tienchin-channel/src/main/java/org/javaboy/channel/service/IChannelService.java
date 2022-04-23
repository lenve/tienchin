package org.javaboy.channel.service;

import org.javaboy.channel.entity.Channel;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-04-23
 */
public interface IChannelService extends IService<Channel> {

    boolean saveChannel(Channel channel);
}
