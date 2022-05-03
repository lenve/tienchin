package org.javaboy.tienchin.rule.service.impl;

import org.javaboy.tienchin.rule.domain.Rule;
import org.javaboy.tienchin.rule.mapper.RuleMapper;
import org.javaboy.tienchin.rule.service.IRuleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 线索池规则 服务实现类
 * </p>
 *
 * @author javaboy
 * @since 2022-04-30
 */
@Service
public class RuleServiceImpl extends ServiceImpl<RuleMapper, Rule> implements IRuleService {

}
