package com.eason.article.controller.v1;

import com.eason.article.service.ApArticleService;
import com.eason.model.article.dtos.ArticleHomeDto;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.common.constants.ArticleConstants;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(value = "文章管理")
@RestController
@RequestMapping("/api/v1/article")
public class ArticleHomeController {

    @Autowired
    private ApArticleService apArticleService;

    /**
     * 加载首页
     * @param dto
     * @return
     */
    @ApiOperation("加载首页")
    @PostMapping("/load")
    public ResponseResult load(@RequestBody ArticleHomeDto dto) {
        return apArticleService.load2(dto, ArticleConstants.LOADTYPE_LOAD_MORE,true);
    }

    /**
     * 加载更多
     * @param dto
     * @return
     */
    @ApiOperation("加载更多")
    @PostMapping("/loadmore")
    public ResponseResult loadMore(@RequestBody ArticleHomeDto dto) {
        return apArticleService.load(dto, ArticleConstants.LOADTYPE_LOAD_MORE);
    }


    /**
     * 加载最新
     * @param dto
     * @return
     */
    @ApiOperation("加载最新")
    @PostMapping("/loadNew")
    public ResponseResult loadNew(@RequestBody ArticleHomeDto dto) {
        return apArticleService.load(dto, ArticleConstants.LOADTYPE_LOAD_NEW);
    }
}
