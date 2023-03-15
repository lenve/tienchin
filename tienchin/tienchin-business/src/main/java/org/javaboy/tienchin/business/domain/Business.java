package org.javaboy.tienchin.business.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 线索
 * </p>
 *
 * @author javaboy
 * @since 2023-02-04
 */
@TableName("tienchin_business")
public class Business implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 线索id
     */
    @TableId(value = "business_id", type = IdType.AUTO)
    private Integer businessId;

    /**
     * 客户姓名
     */
    @NotBlank(message = "{business.name.notblank}")
    private String name;

    /**
     * 渠道
     */
    private Integer channelId;

    /**
     * 活动
     */
    private Integer activityId;

    /**
     * 0 男 1 女
     */
    private Integer gender;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 微信
     */
    private String weixin;

    /**
     * qq
     */
    private String qq;

    /**
     * 手机号
     */
    @NotBlank(message = "{business.phone.notblank}")
    private String phone;

    /**
     * 客户意向等级 1 近期报名 2 打算报名，考虑中 3 了解一下 4 打酱油
     */
    private Integer level;

    /**
     * 意向私教课程
     */
    private Integer subject;

    /**
     * 状态(已分配1  进行中2  回收3)
     */
    private Integer status;

    /**
     * 伪线索失败次数(最大数3次)
     */
    private Integer failCount;

    /**
     * 下次跟进时间
     */
    private LocalDateTime nextTime;

    /**
     * 是否转派
     */
    private Boolean transfer;

    /**
     * 线索失效时间
     */
    private LocalDateTime endTime;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 备注信息
     */
    private String remark;

    /**
     * 0 未删除 1 表示删除
     */
    private Integer delFlag;

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区
     */
    private String area;

    /**
     * 课程ID
     */
    private Integer courseId;

    /**
     * 职业
     */
    private String occupation;

    private Double money;

    /**
     * 学历
     */
    private String education;

    /**
     * 身高
     */
    private Object height;

    /**
     * 体重
     */
    private Object weight;

    /**
     * 锻炼的原因
     */
    private String reason;

    /**
     * 每周可以用于锻炼的时间
     */
    private Integer hours;

    /**
     * 其他意向
     */
    private String othenIntention;

    /**
     * 线索ID
     */
    private Integer clueId;

    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
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

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
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

    public Boolean getTransfer() {
        return transfer;
    }

    public void setTransfer(Boolean transfer) {
        this.transfer = transfer;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public Object getHeight() {
        return height;
    }

    public void setHeight(Object height) {
        this.height = height;
    }

    public Object getWeight() {
        return weight;
    }

    public void setWeight(Object weight) {
        this.weight = weight;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getHours() {
        return hours;
    }

    public void setHours(Integer hours) {
        this.hours = hours;
    }

    public String getOthenIntention() {
        return othenIntention;
    }

    public void setOthenIntention(String othenIntention) {
        this.othenIntention = othenIntention;
    }

    public Integer getClueId() {
        return clueId;
    }

    public void setClueId(Integer clueId) {
        this.clueId = clueId;
    }

    @Override
    public String toString() {
        return "Business{" +
            "businessId = " + businessId +
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
            ", transfer = " + transfer +
            ", endTime = " + endTime +
            ", createTime = " + createTime +
            ", createBy = " + createBy +
            ", updateTime = " + updateTime +
            ", updateBy = " + updateBy +
            ", remark = " + remark +
            ", delFlag = " + delFlag +
            ", province = " + province +
            ", city = " + city +
            ", area = " + area +
            ", courseId = " + courseId +
            ", occupation = " + occupation +
            ", education = " + education +
            ", height = " + height +
            ", weight = " + weight +
            ", reason = " + reason +
            ", hours = " + hours +
            ", othenIntention = " + othenIntention +
            ", clueId = " + clueId +
        "}";
    }
}
