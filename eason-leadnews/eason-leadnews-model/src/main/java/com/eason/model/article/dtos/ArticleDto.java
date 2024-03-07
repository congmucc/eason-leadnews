package com.eason.model.article.dtos;

import com.eason.model.article.pojos.ApArticle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleDto extends ApArticle {
    /**
     * 文章内容
     */
    private String content;
}
