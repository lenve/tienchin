package org.javaboy.tienchin.channel.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.javaboy.tienchin.common.core.domain.BaseEntity;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author javaboy
 * @since 2022-04-23
 */
@TableName("tienchin_channel")
public class Channel extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId(value = "channel_id", type = IdType.AUTO)
    private Integer channelId;

    /**
     * 渠道名称
     */
    private String channelName;

    /**
     * 渠道状态 1 可用；0 禁用
     */
    private String status;

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }
    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
