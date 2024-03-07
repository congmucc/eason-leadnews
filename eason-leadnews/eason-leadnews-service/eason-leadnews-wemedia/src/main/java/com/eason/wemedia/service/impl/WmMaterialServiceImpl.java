package com.eason.wemedia.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eason.model.common.dtos.PageResponseResult;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.common.enums.AppHttpCodeEnum;
import com.eason.model.wemedia.dtos.WmMaterialDto;
import com.eason.model.wemedia.pojos.WmMaterial;
import com.eason.file.service.FileStorageService;
import com.eason.utils.thread.WmThreadLocalUtil;
import com.eason.wemedia.mapper.WmMaterialMapper;
import com.eason.wemedia.service.WmMaterialService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;


@Slf4j
@Service
@Transactional
public class WmMaterialServiceImpl extends ServiceImpl<WmMaterialMapper, WmMaterial> implements WmMaterialService {


    @Autowired
    private FileStorageService fileStorageService;

    /**
     * 素材图片上传
     * @param multipartFile
     * @return
     */
    @Override
    public ResponseResult uploadPicture(MultipartFile multipartFile) {
        // 1 检查参数
        if (multipartFile == null || multipartFile.getSize() == 0) {
            return ResponseResult.errorResult(AppHttpCodeEnum.PARAM_INVALID);
        }
        // 2 上传图片到minIO中
        String fileName = UUID.randomUUID().toString().replace("-", "");
        String originalFilename = multipartFile.getOriginalFilename();
        String postfix = originalFilename.substring(originalFilename.lastIndexOf('.'));

        String fileId = null;
        try {
            fileId = fileStorageService.uploadImgFile("", fileName + postfix, multipartFile.getInputStream());
            log.info("上传图片到MinIO, fileId{}", fileId);
        } catch (IOException e) {
            log.error("上传图片到minio中失败");
            throw new RuntimeException(e);
        }
        // 3 保存到数据库中
        WmMaterial wmMaterial = new WmMaterial();
        wmMaterial.setUserId(WmThreadLocalUtil.getUser().getId());
        wmMaterial.setUrl(fileId);
        wmMaterial.setIsCollection((short)0);
        wmMaterial.setType((short)0);
        wmMaterial.setCreatedTime(new Date());
        save(wmMaterial);
        // 4 返回结果

        return ResponseResult.okResult(wmMaterial );
    }

    /**
     * 素材列表查询
     * @param wmMaterialDto
     * @return
     */
    @Override
    public ResponseResult findList(WmMaterialDto wmMaterialDto) {
        // 1 检查参数
        wmMaterialDto.checkParam();

        // 2 分页查询
        IPage page = new Page(wmMaterialDto.getPage(), wmMaterialDto.getSize());
        LambdaQueryWrapper<WmMaterial> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 是否收藏
        if(wmMaterialDto.getIsCollection() != null && wmMaterialDto.getIsCollection() == 1) {
            lambdaQueryWrapper.eq(WmMaterial::getIsCollection, wmMaterialDto.getIsCollection());
        }
        // 按照用户查询
        lambdaQueryWrapper.eq(WmMaterial::getUserId, WmThreadLocalUtil.getUser().getId());

        // 按照时间倒叙
        lambdaQueryWrapper.orderByDesc(WmMaterial::getCreatedTime);
        IPage page1 = page(page, lambdaQueryWrapper);

        // 3 结果返回
        PageResponseResult pageResponseResult = new PageResponseResult(wmMaterialDto.getPage(), wmMaterialDto.getSize(), (int) page1.getTotal());
        pageResponseResult.setData(page1.getRecords());
        return pageResponseResult;
    }
}
