package com.eason.search.controller.v1;

import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.search.dto.UserSearchDto;
import com.eason.search.service.ApAssociateWordsService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.PipedReader;


@RestController
@RequestMapping("/api/v1/associate")
public class ApAssociateWordsController {

    @Autowired
    private ApAssociateWordsService apAssociateWordsService;
    /**
     * 搜索联想词
     * @param userSearchDto
     * @return
     */
    @PostMapping("/search")
    public ResponseResult search(@RequestBody UserSearchDto userSearchDto) {
        return apAssociateWordsService.search(userSearchDto);
    }
}
