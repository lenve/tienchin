package org.javaboy.tienchin.clue.domain.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

public class ClueDetails {
    /**
     * 线索编号
     */
    private Integer clueId;

    /**
     * 客户姓名
     */
    private String name;

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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "Asia/Shanghai")
    private LocalDateTime nextTime;


    private String channelName;
    /**
     * 线索的分配人
     */
    private String allocator;

    private String activityName;
    private String activityInfo;

    private String owner;
    private String record;

    private LocalDateTime belongTime;

    private LocalDateTime createTime;

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
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

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public String getAllocator() {
        return allocator;
    }

    public void setAllocator(String allocator) {
        this.allocator = allocator;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getActivityInfo() {
        return activityInfo;
    }

    public void setActivityInfo(String activityInfo) {
        this.activityInfo = activityInfo;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public LocalDateTime getBelongTime() {
        return belongTime;
    }

    public void setBelongTime(LocalDateTime belongTime) {
        this.belongTime = belongTime;
    }
}
