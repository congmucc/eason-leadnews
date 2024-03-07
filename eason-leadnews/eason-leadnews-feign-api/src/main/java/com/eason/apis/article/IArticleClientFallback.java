package com.eason.apis.article;

import com.eason.model.article.dtos.ArticleDto;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.common.enums.AppHttpCodeEnum;
import org.springframework.stereotype.Component;

@Component
public class IArticleClientFallback implements IArticleClient {
    @Override
    public ResponseResult saveArticle(ArticleDto dto) {
        return ResponseResult.errorResult(AppHttpCodeEnum.SERVER_ERROR, "获取数据失败");
    }
}
