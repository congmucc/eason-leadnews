package com.eason.user.service;


import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.user.dtos.LoginDto;

public interface ApUserService {

    /**
     * app端登录功能
     * @param dto
     * @return
     */
    public ResponseResult login(LoginDto dto);
}
