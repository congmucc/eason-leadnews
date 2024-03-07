package com.eason.search.service;

import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.search.dto.UserSearchDto;

public interface ApAssociateWordsService {
    /**
     * 搜索联想词
     * @param userSearchDto
     * @return
     */
    ResponseResult search(UserSearchDto userSearchDto);
}
