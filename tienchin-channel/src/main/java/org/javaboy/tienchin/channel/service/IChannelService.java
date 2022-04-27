package org.javaboy.tienchin.channel.service;

import org.javaboy.tienchin.channel.entity.Channel;
import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.common.core.domain.AjaxResult;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-04-23
 */
public interface IChannelService extends IService<Channel> {

    AjaxResult deleteChannelByIds(Long[] channelIds);
}
