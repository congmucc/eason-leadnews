package com.eason.wemedia.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.wemedia.dtos.WmMaterialDto;
import com.eason.model.wemedia.pojos.WmMaterial;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface WmMaterialService extends IService<WmMaterial> {

    /**
     * 素材图片上传
     * @param multipartFile
     * @return
     */
    public ResponseResult uploadPicture(MultipartFile multipartFile) throws IOException;

    /**
     * 素材列表查询
     * @param wmMaterialDto
     * @return
     */
    ResponseResult findList(WmMaterialDto wmMaterialDto);
}