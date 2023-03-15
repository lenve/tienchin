package org.javaboy.tienchin.assignment.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.assignment.domain.Assignment;
import org.javaboy.tienchin.common.core.domain.AjaxResult;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-12-14
 */
public interface IAssignmentService extends IService<Assignment> {
    AjaxResult assignClue(Assignment assignment);
}
