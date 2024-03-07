package com.eason.article.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.eason.article.ArticleApplication;
import com.eason.model.article.dtos.ArticleHomeDto;
import com.eason.model.article.pojos.ApArticle;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface ApArticleMapper extends BaseMapper<ApArticle> {

    /**
     * 加载文章列表
     * @param dto
     * @param type  1 加载更多  2 记录最新
     * @return
     */
    public List<ApArticle> loadArticleList(ArticleHomeDto dto, Short type);

    public List<ApArticle> findArticleListByLast5days(@Param("dayParam") Date dayParam);
}