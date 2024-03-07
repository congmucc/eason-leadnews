package com.eason.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eason.model.admin.dtos.AdUserDto;
import com.eason.model.admin.pojos.AdUser;
import com.eason.model.common.dtos.ResponseResult;

public interface AdUserService extends IService<AdUser> {

    /**
     * 登录
     * @param dto
     * @return
     */
    public ResponseResult login(AdUserDto dto);
}
