package com.eason.wemedia.controller.v1;

import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.wemedia.dtos.WmMaterialDto;
import com.eason.model.wemedia.pojos.WmMaterial;
import com.eason.wemedia.service.WmMaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RequestMapping("/api/v1/material")
@RestController
public class WmMaterialController {

    @Autowired
    private WmMaterialService wmMaterialService;

    @PostMapping("/upload_picture")
    public ResponseResult uploadPicture(MultipartFile multipartFile) throws IOException {
        return wmMaterialService.uploadPicture(multipartFile);
    }

    @PostMapping("list")
    public ResponseResult findList(@RequestBody WmMaterialDto wmMaterialDto) {
        return wmMaterialService.findList(wmMaterialDto);
    }

}
