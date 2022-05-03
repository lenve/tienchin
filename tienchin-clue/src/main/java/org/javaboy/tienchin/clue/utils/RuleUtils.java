package org.javaboy.tienchin.clue.utils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.javaboy.tienchin.assignment.domain.Assignment;
import org.javaboy.tienchin.common.utils.spring.SpringUtils;
import org.javaboy.tienchin.rule.domain.Rule;
import org.javaboy.tienchin.rule.service.IRuleService;
import org.javaboy.tienchin.rule.utils.RuleTimeType;
import org.javaboy.tienchin.rule.utils.RuleType;

import java.time.LocalDateTime;

/**
 * @author 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
public class RuleUtils {

    public static LocalDateTime getClueEndTime(Assignment assignment) {
        IRuleService ruleService = SpringUtils.getBean(IRuleService.class);
        QueryWrapper<Rule> qw = new QueryWrapper<>();
        qw.lambda().eq(Rule::getType, RuleType.CLUE);
        Rule rule = ruleService.getOne(qw);
        if (rule.getLimitTimeType().compareTo(RuleTimeType.HOUR) == 0) {
            return assignment.getCreateTime().plusHours(rule.getLimitTime());
        }
        if (rule.getLimitTimeType().compareTo(RuleTimeType.DAY) == 0) {
            return assignment.getCreateTime().plusDays(rule.getLimitTime());
        }
        if (rule.getLimitTimeType().compareTo(RuleTimeType.WEEK) == 0) {
            return assignment.getCreateTime().plusWeeks(rule.getLimitTime());
        }
        return assignment.getCreateTime();
    }
}
