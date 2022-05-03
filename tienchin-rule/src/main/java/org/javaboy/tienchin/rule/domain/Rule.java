package org.javaboy.tienchin.rule.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

/**
 * <p>
 * 线索池规则
 * </p>
 *
 * @author javaboy
 * @since 2022-04-30
 */
@TableName("tienchin_rule")
public class Rule implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 线索/商机回收时限
     */
    private Integer limitTime;

    /**
     * 时间单位（字典数据）
     */
    private Integer limitTimeType;

    /**
     * 线索/商机警告时间
     */
    private Integer warnTime;

    /**
     * 时间单位（字典数据）
     */
    private Integer warnTimeType;

    /**
     * 重复捞取时间
     */
    private Integer repeatGetTime;

    /**
     * 时间单位（字典数据）
     */
    private Integer repeatTimeType;

    /**
     * 最大保有量
     */
    private Integer maxNumber;

    /**
     * 0 线索 1 商机
     */
    private Integer type;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public Integer getLimitTime() {
        return limitTime;
    }

    public void setLimitTime(Integer limitTime) {
        this.limitTime = limitTime;
    }
    public Integer getLimitTimeType() {
        return limitTimeType;
    }

    public void setLimitTimeType(Integer limitTimeType) {
        this.limitTimeType = limitTimeType;
    }
    public Integer getWarnTime() {
        return warnTime;
    }

    public void setWarnTime(Integer warnTime) {
        this.warnTime = warnTime;
    }
    public Integer getWarnTimeType() {
        return warnTimeType;
    }

    public void setWarnTimeType(Integer warnTimeType) {
        this.warnTimeType = warnTimeType;
    }
    public Integer getRepeatGetTime() {
        return repeatGetTime;
    }

    public void setRepeatGetTime(Integer repeatGetTime) {
        this.repeatGetTime = repeatGetTime;
    }
    public Integer getRepeatTimeType() {
        return repeatTimeType;
    }

    public void setRepeatTimeType(Integer repeatTimeType) {
        this.repeatTimeType = repeatTimeType;
    }
    public Integer getMaxNumber() {
        return maxNumber;
    }

    public void setMaxNumber(Integer maxNumber) {
        this.maxNumber = maxNumber;
    }
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Rule{" +
            "id=" + id +
            ", limitTime=" + limitTime +
            ", limitTimeType=" + limitTimeType +
            ", warnTime=" + warnTime +
            ", warnTimeType=" + warnTimeType +
            ", repeatGetTime=" + repeatGetTime +
            ", repeatTimeType=" + repeatTimeType +
            ", maxNumber=" + maxNumber +
            ", type=" + type +
        "}";
    }
}
