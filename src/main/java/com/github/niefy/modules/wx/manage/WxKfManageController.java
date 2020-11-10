package com.github.niefy.modules.wx.manage;

import com.github.niefy.common.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.kefu.result.WxMpKfList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: wx-api
 * @package: com.github.niefy.modules.wx.manage
 * @description: 客服管理
 * @author: miaochen
 * @create: 2020-10-26 20:07
 * @copyright: CopyRight (c) 2020
 * @version: 1.0.0
 * @modified: miaochen
 **/
@RestController
@RequestMapping("/manage/kefu")
@Api(tags = {"客服管理-管理后台"})
public class WxKfManageController {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private WxMpService wxMpService;

    /**
     * 获取客服列表
     */
    @GetMapping("/list")
    @ApiOperation(value = "获取客服列表")
    public R list(@CookieValue String appid) throws WxErrorException {
        wxMpService.switchoverTo(appid);
        WxMpKfList wxMpKfList= wxMpService.getKefuService().kfList();
        return R.ok().put(wxMpKfList);
    }

}
