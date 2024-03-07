package com.eason.wemedia.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.wemedia.dtos.WmLoginDto;
import com.eason.model.wemedia.pojos.WmUser;


public interface WmUserService extends IService<WmUser> {

    /**
     * 自媒体端登录
     * @param dto
     * @return
     */
    public ResponseResult login(WmLoginDto dto);

}