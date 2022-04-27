package org.javaboy.tienchin.web.controller.channel;

import org.javaboy.tienchin.channel.entity.Channel;
import org.javaboy.tienchin.channel.service.IChannelService;
import org.javaboy.tienchin.common.annotation.Log;
import org.javaboy.tienchin.common.core.controller.BaseController;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.page.TableDataInfo;
import org.javaboy.tienchin.common.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

/**
 * @author 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
@RestController
@RequestMapping("/tienchin/channel")
public class ChannelController extends BaseController {

    @Autowired
    IChannelService channelService;

    @PreAuthorize("@ss.hasPermi('tienchin:channel:query')")
    @GetMapping("/list")
    public TableDataInfo getChannelList() {
        startPage();
        List<Channel> list = channelService.list();
        return getDataTable(list);
    }
    @PreAuthorize("@ss.hasPermi('tienchin:channel:add')")
    @Log(title = "渠道管理" , businessType = BusinessType.INSERT)
    @PostMapping("/")
    public AjaxResult add(@Validated @RequestBody Channel channel) {
        channel.setCreateBy(getUsername());
        channel.setCreateTime(LocalDateTime.now());
        return toAjax(channelService.save(channel));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:channel:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable Long id) {
        return AjaxResult.success(channelService.getById(id));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:channel:edit')")
    @Log(title = "渠道管理" , businessType = BusinessType.UPDATE)
    @PutMapping("/")
    public AjaxResult edit(@Validated @RequestBody Channel channel) {
        channel.setUpdateBy(getUsername());
        channel.setUpdateTime(LocalDateTime.now());
        return toAjax(channelService.saveOrUpdate(channel));
    }

    @PreAuthorize("@ss.hasPermi('tienchin:channel:remove')")
    @Log(title = "渠道管理" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{channelIds}")
    public AjaxResult remove(@PathVariable Long[] channelIds) {
        return channelService.deleteChannelByIds(channelIds);
    }

}
