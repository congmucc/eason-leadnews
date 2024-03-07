package com.eason.behavior.service;

import com.eason.model.behavior.dtos.LikesBehaviorDto;
import com.eason.model.common.dtos.ResponseResult;

public interface ApLikesBehaviorService {

    /**
     * 存储喜欢数据
     * @param dto
     * @return
     */
    public ResponseResult like(LikesBehaviorDto dto);
}
