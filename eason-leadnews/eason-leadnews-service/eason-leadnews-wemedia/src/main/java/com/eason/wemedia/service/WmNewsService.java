package com.eason.wemedia.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.wemedia.dtos.WmNewsDto;
import com.eason.model.wemedia.dtos.WmNewsPageReqDto;
import com.eason.model.wemedia.pojos.WmNews;

public interface WmNewsService extends IService<WmNews> {


    /**
     * 条件查询文章列表
     * @param dto
     * @return
     */
    ResponseResult findList(WmNewsPageReqDto dto);

    /**
     * 修改文章或保存为草稿
     * @param dto
     * @return
     */
    ResponseResult submitNews(WmNewsDto dto);
    /**
     * 文章的上下架
     * @param dto
     * @return
     */
    ResponseResult downOrUp(WmNewsDto dto);
}
