package org.javaboy.tienchin.clue.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.javaboy.tienchin.common.validator.CreateGroup;
import org.javaboy.tienchin.common.validator.EditGroup;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author javaboy
 * @since 2022-12-14
 */
@TableName("tienchin_clue")
public class Clue implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 线索编号
     */
    @TableId(value = "clue_id", type = IdType.AUTO)
    @NotNull(message = "{clue.clueId.notnull}",groups = EditGroup.class)
    private Integer clueId;

    /**
     * 客户姓名
     */
    @NotBlank(message = "{clue.name.notblank}",groups = {EditGroup.class, CreateGroup.class})
    private String name;

    /**
     * 渠道ID
     */
    private Integer channelId;

    /**
     * 活动ID
     */
    private Integer activityId;

    /**
     * 0 男 1女
     */
    private Integer gender;

    /**
     * 客户年龄
     */
    private Integer age;

    /**
     * 客户微信
     */
    private String weixin;

    /**
     * 客户QQ
     */
    private String qq;

    /**
     * 客户电话
     */
    @NotBlank(message = "{clue.phone.notblank}",groups = {EditGroup.class, CreateGroup.class})
    private String phone;

    /**
     * 客户意向等级 1 近期报名 2 打算报名，考虑中 3 了解一下 4 打酱油
     */
    private Integer level;

    /**
     * 私教课程
     */
    private Integer subject;

    /**
     * 线索状态 1 已分配 2 跟进中 3 回收 4 伪线索
     */
    private Integer status;

    /**
     * 伪线索失败次数，最大 3 次
     */
    private Integer failCount;

    /**
     * 下次跟进时间
     */
    private LocalDateTime nextTime;

    /**
     * 线索失效时间
     */
    private LocalDateTime endTime;

    /**
     * 线索是否需要转派
     */
    private Boolean transfer;

    private Integer remark;

    private LocalDateTime createTime;

    private String createBy;

    private LocalDateTime updateTime;

    private String updateBy;

    private Integer delFlag;

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public Integer getClueId() {
        return clueId;
    }

    public void setClueId(Integer clueId) {
        this.clueId = clueId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getSubject() {
        return subject;
    }

    public void setSubject(Integer subject) {
        this.subject = subject;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getFailCount() {
        return failCount;
    }

    public void setFailCount(Integer failCount) {
        this.failCount = failCount;
    }

    public LocalDateTime getNextTime() {
        return nextTime;
    }

    public void setNextTime(LocalDateTime nextTime) {
        this.nextTime = nextTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public Boolean getTransfer() {
        return transfer;
    }

    public void setTransfer(Boolean transfer) {
        this.transfer = transfer;
    }

    public Integer getRemark() {
        return remark;
    }

    public void setRemark(Integer remark) {
        this.remark = remark;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    @Override
    public String toString() {
        return "Clue{" +
            "clueId = " + clueId +
            ", name = " + name +
            ", channelId = " + channelId +
            ", activityId = " + activityId +
            ", gender = " + gender +
            ", age = " + age +
            ", weixin = " + weixin +
            ", qq = " + qq +
            ", phone = " + phone +
            ", level = " + level +
            ", subject = " + subject +
            ", status = " + status +
            ", failCount = " + failCount +
            ", nextTime = " + nextTime +
            ", endTime = " + endTime +
            ", transfer = " + transfer +
            ", remark = " + remark +
            ", createTime = " + createTime +
            ", createBy = " + createBy +
            ", updateTime = " + updateTime +
            ", updateBy = " + updateBy +
        "}";
    }
}
