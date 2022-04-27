package org.javaboy.tienchin.activity.service;

import org.javaboy.tienchin.activity.entity.Activity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 促销活动 服务类
 * </p>
 *
 * @author javaboy
 * @since 2022-04-25
 */
public interface IActivityService extends IService<Activity> {

    boolean saveActivity(Activity activity);

    List<Activity> getActivityList(Activity activity);
}
