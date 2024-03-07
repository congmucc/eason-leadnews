package com.eason.search.service;

import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.search.dto.UserSearchDto;

import java.io.IOException;

public interface ArticleSearchService {

    /**
     * ES文章分页搜索
     * @param dto
     * @return
     */
    ResponseResult search(UserSearchDto dto) throws IOException;
}
