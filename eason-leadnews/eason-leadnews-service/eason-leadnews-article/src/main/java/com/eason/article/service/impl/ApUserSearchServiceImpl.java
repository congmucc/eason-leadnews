package com.eason.article.service.impl;

import com.eason.article.service.ApUserSearchService;
import org.springframework.stereotype.Service;

@Service
public class ApUserSearchServiceImpl implements ApUserSearchService {
    /**
     * 保存用户搜索历史记录
     * @param keyword
     * @param userId
     */
    @Override
    public void insert(String keyword, Integer userId) {

    }
}
