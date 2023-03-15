package org.javaboy.tienchin.course.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.javaboy.tienchin.common.annotation.Excel;
import org.javaboy.tienchin.common.validator.CreateGroup;
import org.javaboy.tienchin.common.validator.EditGroup;

import javax.validation.constraints.Min;
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
 * @since 2022-12-13
 */
@TableName("tienchin_course")
public class Course implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "course_id", type = IdType.AUTO)
    @NotNull(message = "{course.id.notnull}",groups = {EditGroup.class})
    @Excel(name = "课程编号")
    private Integer courseId;

    /**
     * 课程类型 1 舞蹈类 2 游泳类 3 拳击类
     */
    @NotNull(message = "{course.type.notnull}",groups = {CreateGroup.class,EditGroup.class})
    @Excel(name = "课程类型", readConverterExp = "1=舞蹈类,2=游泳类,3=拳击类")
    private Integer type;

    /**
     * 课程名
     */
    @NotBlank(message = "{course.name.notblank}",groups = {CreateGroup.class,EditGroup.class})
    @Excel(name = "课程名称")
    private String name;

    /**
     * 课程价格
     */
    @NotNull(message = "{course.price.notnull}",groups = {CreateGroup.class,EditGroup.class})
    @Min(value = 0, message = "{course.price.invalid}",groups = {CreateGroup.class,EditGroup.class})
    @Excel(name = "课程价格")
    private Double price;

    /**
     * 课程适用人群
     */
    @NotNull(message = "{course.applyTo.notnull}",groups = {CreateGroup.class,EditGroup.class})
    @Excel(name = "适用人群", readConverterExp = "1=中小学生,2=上班族,3=小白用户,4=健身达人")
    private Integer applyTo;

    /**
     * 课程简介
     */
    @NotBlank(message = "{course.info.notblank}",groups = {CreateGroup.class,EditGroup.class})
    @Excel(name = "课程简介")
    private String info;

    /**
     * 课程备注
     */
    private String remark;

    @Excel(name = "创建时间")
    private LocalDateTime createTime;

    private String createBy;

    private LocalDateTime updateTime;

    private String updateBy;

    private Integer delFlag;

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getApplyTo() {
        return applyTo;
    }

    public void setApplyTo(Integer applyTo) {
        this.applyTo = applyTo;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
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

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    @Override
    public String toString() {
        return "Course{" +
                "courseId = " + courseId +
                ", type = " + type +
                ", name = " + name +
                ", price = " + price +
                ", applyTo = " + applyTo +
                ", info = " + info +
                ", remark = " + remark +
                ", createTime = " + createTime +
                ", createBy = " + createBy +
                ", updateTime = " + updateTime +
                ", updateBy = " + updateBy +
                ", delFlag = " + delFlag +
                "}";
    }
}
