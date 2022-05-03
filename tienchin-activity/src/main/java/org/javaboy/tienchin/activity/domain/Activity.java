package org.javaboy.tienchin.activity.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.javaboy.tienchin.common.annotation.Excel;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 促销活动
 * </p>
 *
 * @author javaboy
 * @since 2022-04-25
 */
@TableName("tienchin_activity")
public class Activity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 活动编号
     */
    @Excel(name = "活动编号")
    private String code;

    /**
     * 活动名称
     */
    @Excel(name = "活动名称")
    private String name;

    /**
     * 渠道来源
     */
    @Excel(name = "渠道来源")
    private String channel;

    /**
     * 活动简介
     */
    @Excel(name = "活动简介")
    private String info;

    /**
     * 活动类型
     */
    @Excel(name = "活动类型",readConverterExp = "1=年费折扣卡,2=年费代金券")
    private String type;

    /**
     * 年费折扣
     */
    @Excel(name = "年费折扣")
    private Float discount;

    /**
     * 年费代金券
     */
    @Excel(name = "年费代金券")
    private Double voucher;

    /**
     * 状态
     */
    @Excel(name = "活动状态",readConverterExp = "0=正常,1=停用")
    private String status;

    /**
     * 开始时间
     */
    @Excel(name = "活动开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime beginTime;

    /**
     * 结束时间
     */
    @Excel(name = "活动结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endTime;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    @Excel(name = "活动创建人")
    private String updateBy;
    @Excel(name = "活动修改人")
    private String createBy;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }
    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }
    public Double getVoucher() {
        return voucher;
    }

    public void setVoucher(Double voucher) {
        this.voucher = voucher;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public LocalDateTime getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(LocalDateTime beginTime) {
        this.beginTime = beginTime;
    }
    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }
    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }
    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    @Override
    public String toString() {
        return "Activity{" +
            "id=" + id +
            ", code=" + code +
            ", name=" + name +
            ", channel=" + channel +
            ", info=" + info +
            ", type=" + type +
            ", discount=" + discount +
            ", voucher=" + voucher +
            ", status=" + status +
            ", beginTime=" + beginTime +
            ", endTime=" + endTime +
            ", createTime=" + createTime +
            ", updateTime=" + updateTime +
            ", createBy=" + createBy +
            ", updateBy=" + updateBy +
        "}";
    }
}
