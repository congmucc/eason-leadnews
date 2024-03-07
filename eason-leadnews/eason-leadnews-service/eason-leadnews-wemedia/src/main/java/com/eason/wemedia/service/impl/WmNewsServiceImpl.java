package com.eason.wemedia.service.impl;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eason.model.common.dtos.PageResponseResult;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.common.enums.AppHttpCodeEnum;
import com.eason.model.wemedia.dtos.WmNewsDto;
import com.eason.model.wemedia.dtos.WmNewsPageReqDto;
import com.eason.model.wemedia.pojos.WmMaterial;
import com.eason.model.wemedia.pojos.WmNews;
import com.eason.model.wemedia.pojos.WmNewsMaterial;
import com.eason.common.constants.WemediaConstants;
import com.eason.common.constants.WmNewsMessageConstants;
import com.eason.common.exception.CustomException;
import com.eason.utils.thread.WmThreadLocalUtil;
import com.eason.wemedia.mapper.WmMaterialMapper;
import com.eason.wemedia.mapper.WmNewsMapper;
import com.eason.wemedia.mapper.WmNewsMaterialMapper;
import com.eason.wemedia.service.WmNewsAutoScanService;
import com.eason.wemedia.service.WmNewsService;
import com.eason.wemedia.service.WmNewsTaskService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@Transactional
public class WmNewsServiceImpl  extends ServiceImpl<WmNewsMapper, WmNews> implements WmNewsService {

    /**
     * 条件查询文章列表
     * @param dto
     * @return
     */
    @Override
    public ResponseResult findList(WmNewsPageReqDto dto) {

        // 1 检查参数
        dto.checkParam();
        // 2 分页条件查询
        IPage page = new Page(dto.getPage(), dto.getSize());
        LambdaQueryWrapper<WmNews> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据状态精确查询
        if(dto.getStatus() != null){
            lambdaQueryWrapper.eq(WmNews::getStatus,dto.getStatus());
        }

        //频道精确查询
        if(dto.getChannelId() != null){
            lambdaQueryWrapper.eq(WmNews::getChannelId,dto.getChannelId());
        }

        //时间范围查询
        if(dto.getBeginPubDate()!=null && dto.getEndPubDate()!=null){
            lambdaQueryWrapper.between(WmNews::getPublishTime,dto.getBeginPubDate(),dto.getEndPubDate());
        }

        //关键字模糊查询
        if(StringUtils.isNotBlank(dto.getKeyword())){
            lambdaQueryWrapper.like(WmNews::getTitle,dto.getKeyword());
        }

        //查询当前登录用户的文章
        lambdaQueryWrapper.eq(WmNews::getUserId, WmThreadLocalUtil.getUser().getId());

        //发布时间倒序查询
        lambdaQueryWrapper.orderByDesc(WmNews::getCreatedTime);

        page = page(page, lambdaQueryWrapper);


        // 3 结果返回
        ResponseResult responseResult = new PageResponseResult(dto.getPage(), dto.getSize(), (int) page.getTotal());
        responseResult.setData(page.getRecords());
        return responseResult;
    }

    /**
     * 修改文章或保存为草稿
     * @param dto
     * @return
     */
    @Autowired
    private WmNewsAutoScanService wmNewsAutoScanService;

    @Autowired
    private WmNewsTaskService wmNewsTaskService;
    @Override
    public ResponseResult submitNews(WmNewsDto dto) {
        // 条件判断
        if (dto ==null || dto.getContent() == null) {
            return ResponseResult.errorResult(AppHttpCodeEnum.PARAM_INVALID);
        }
        // 1 保存或修改文章
        WmNews wmNews = new WmNews();
        // 属性拷贝
        BeanUtils.copyProperties(dto, wmNews);
        if (dto.getImages() != null && dto.getImages().size() > 0) {
            // 将传来的图片数组转换为字符串
            String imgString = StringUtils.join(dto.getImages(), ",");
            wmNews.setImages(imgString);
        }
        // 如果当前封面类型为自动 -1
        if (dto.getType().equals(WemediaConstants.WM_NEWS_TYPE_AUTO)) {
            wmNews.setType(null);
        }

        saveOrUpdateWmNews(wmNews);


        // 2 判断是否为草稿
        if (dto.getStatus().equals(WmNews.Status.NORMAL.getCode())) {
            return ResponseResult.okResult(AppHttpCodeEnum.SUCCESS);
        }

        // 3 不是草稿，保存文章内容图片与素材的关系
        List<String> materials =  ectractUrlInfo(dto.getContent());
        saveRelativeInfoForContent(materials, wmNews.getId());
        // 4 不是草稿， 保存文化在哪个封面图片与素材
        saveRelativeInfoForCover(dto,wmNews,materials);

        // 审核文章
        // wmNewsAutoScanService.autoScanWmNews(wmNews.getId());

        wmNewsTaskService.addNewsToTask(wmNews.getId(),dto.getPublishTime());
        return ResponseResult.okResult(AppHttpCodeEnum.SUCCESS);

    }

    @Resource
    private KafkaTemplate<String, String> kafkaTemplate;

    /**
     * 文章的上下架
     * @param dto
     * @return
     */
    @Override
    public ResponseResult downOrUp(WmNewsDto dto) {
        // 1 检查参数
        if (dto.getId() == null) {
            return ResponseResult.errorResult(AppHttpCodeEnum.PARAM_INVALID);
        }

        // 2 查询文章
        WmNews wmNews = getById(dto.getId());
        if (wmNews ==null) {
            return ResponseResult.errorResult(AppHttpCodeEnum.DATA_NOT_EXIST, "文章不存在");
        }
        // 3 判断文章是否已发布
        if (!wmNews.getStatus().equals(WmNews.Status.PUBLISHED.getCode())) {
            return ResponseResult.errorResult(AppHttpCodeEnum.PARAM_INVALID, "当前文章不是发布状态，不能上下架");
        }
        // 4 修改文章enable
        if (dto.getEnable() != null && dto.getEnable() > -1 && dto.getEnable() < 2) {
            update(Wrappers.<WmNews>lambdaUpdate().set(WmNews::getEnable, dto.getEnable())
                    .eq(WmNews::getId, wmNews.getId()));
            // 发送消息，通知article修改文章配置
            if(wmNews.getArticleId() != null){
                Map<String,Object> map = new HashMap<>();
                map.put("articleId",wmNews.getArticleId());
                map.put("enable",dto.getEnable());
                kafkaTemplate.send(WmNewsMessageConstants.WM_NEWS_UP_OR_DOWN_TOPIC,JSON.toJSONString(map));
                log.info("kafka发送消息");
            }
        }
        return ResponseResult.okResult(AppHttpCodeEnum.SUCCESS);
    }

    /**
     * 第一个功能：如果当前封面类型为自动，则设置封面类型的数据
     * 匹配规则：
     * 1，如果内容图片大于等于1，小于3  单图  type 1
     * 2，如果内容图片大于等于3  多图  type 3
     * 3，如果内容没有图片，无图  type 0
     *
     * 第二个功能：保存封面图片与素材的关系
     * @param dto
     * @param wmNews
     * @param materials
     */
    private void saveRelativeInfoForCover(WmNewsDto dto, WmNews wmNews, List<String> materials) {
        List<String> images = dto.getImages();

        //如果当前封面类型为自动，则设置封面类型的数据
        if(dto.getType().equals(WemediaConstants.WM_NEWS_TYPE_AUTO)){
            //多图
            if(materials.size() >= 3){
                wmNews.setType(WemediaConstants.WM_NEWS_MANY_IMAGE);
                images = materials.stream().limit(3).collect(Collectors.toList());
            }else if(materials.size() >= 1 && materials.size() < 3){
                //单图
                wmNews.setType(WemediaConstants.WM_NEWS_SINGLE_IMAGE);
                images = materials.stream().limit(1).collect(Collectors.toList());
            }else {
                //无图
                wmNews.setType(WemediaConstants.WM_NEWS_NONE_IMAGE);
            }

            //修改文章
            if(images != null && images.size() > 0){
                wmNews.setImages(StringUtils.join(images,","));
            }
            updateById(wmNews);
        }
        if(images != null && images.size() > 0){
            saveRelativeInfo(images,wmNews.getId(),WemediaConstants.WM_COVER_REFERENCE);
        }

    }

    /**
     * 保存文章内容图片与素材的关系
     */
    private void saveRelativeInfoForContent(List<String> materials, Integer id) {
        saveRelativeInfo(materials, id, WemediaConstants.WM_COVER_REFERENCE);
    }

    @Autowired
    private WmMaterialMapper wmMaterialMapper;

    /**
     * 保存文章图片和素材的关系到数据库中
     * @param materials
     * @param id
     * @param wmCoverReference
     */
    private void saveRelativeInfo(List<String> materials, Integer id, Short wmCoverReference) {
        if (materials != null && !materials.isEmpty()) {
            // 通过图片的url查询素材id
            List<WmMaterial> wmMaterials = wmMaterialMapper.selectList(Wrappers.<WmMaterial>lambdaQuery().in(WmMaterial::getUrl, materials));

            // 判断素材是否有效
            if (wmMaterials == null || wmMaterials.size() == 0) {
                // 手动抛出异常 第一个功能：能够提示调用者素材失效，第二个功能： 进行数据的回滚
                throw new CustomException(AppHttpCodeEnum.MATERIASL_REFERNCE_FAIL);
            }

            if (materials.size() != wmMaterials.size()) {
                throw new CustomException(AppHttpCodeEnum.MATERIASL_REFERNCE_FAIL);
            }


            List<Integer> idList = wmMaterials.stream().map(WmMaterial::getId).collect(Collectors.toList());

            // 批量保存
            wmNewsMaterialMapper.saveRelations(idList, id, wmCoverReference);
        }
    }

    /**
     *获取文章中的图片信息
     * @param content
     * @return
     */
    private List<String> ectractUrlInfo(String content) {
        ArrayList<String> materials = new ArrayList<>();
        List<Map> maps = JSON.parseArray(content, Map.class);
        for (Map map : maps) {
            if (map.get("type").equals("image")) {
                String imgUrl = (String) map.get("value");
                materials.add(imgUrl);
            }
        }
        return materials;
    }




    @Autowired
    private WmNewsMaterialMapper wmNewsMaterialMapper;


    /**
     * 保存或修改文章
     * @param wmNews
     */
    private void saveOrUpdateWmNews(WmNews wmNews) {
        // 补全属性
        wmNews.setUserId(WmThreadLocalUtil.getUser().getId());
        wmNews.setCreatedTime(new Date());
        wmNews.setSubmitedTime(new Date());
        wmNews.setEnable((short)1);//默认上架

        if(wmNews.getId() == null){
            //保存
            save(wmNews);
        }else {
            //修改
            //删除文章图片与素材的关系
            wmNewsMaterialMapper.delete(Wrappers.<WmNewsMaterial>lambdaQuery().eq(WmNewsMaterial::getNewsId, wmNews.getId()));
            updateById(wmNews);
        }
    }
}
