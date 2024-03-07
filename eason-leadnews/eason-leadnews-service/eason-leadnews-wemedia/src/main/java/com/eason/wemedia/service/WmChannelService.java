package com.eason.wemedia.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.wemedia.pojos.WmChannel;

public interface WmChannelService extends IService<WmChannel> {

    /**
     * 查询所有频道
     * @return
     */
    ResponseResult findAll();
}