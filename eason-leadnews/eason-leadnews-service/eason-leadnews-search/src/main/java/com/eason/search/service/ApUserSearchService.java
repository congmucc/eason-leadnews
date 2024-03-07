package com.eason.search.service;

import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.search.dto.HistorySearchDto;

public interface ApUserSearchService {
    /**
     * 保存用户搜索历史记录
     * @param keyword
     * @param userId
     */
    public void insert(String keyword,Integer userId);

    /**
     * 加载用户搜索历史记录
     * @return
     */
    ResponseResult findUserSearch();

    /**
     * 删除用户搜索记录
     * @param historySearchDto
     * @return
     */
    ResponseResult delUserSearch(HistorySearchDto historySearchDto);
}

