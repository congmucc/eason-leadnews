package com.eason.behavior.service;

import com.eason.model.behavior.dtos.ReadBehaviorDto;
import com.eason.model.common.dtos.ResponseResult;

public interface ApReadBehaviorService {

    /**
     * 保存阅读行为
     * @param dto
     * @return
     */
    public ResponseResult readBehavior(ReadBehaviorDto dto);
}
