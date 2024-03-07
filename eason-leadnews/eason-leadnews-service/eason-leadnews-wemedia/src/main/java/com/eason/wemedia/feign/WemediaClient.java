package com.eason.wemedia.feign;

import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.wemedia.pojos.WmUser;
import com.eason.apis.wemedia.IWemediaClient;
import com.eason.wemedia.service.WmChannelService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WemediaClient implements IWemediaClient {

    @Autowired
    private WmChannelService wmChannelService;


    @Override
    public WmUser findWmUserByName(String name) {
        return null;
    }

    @Override
    public ResponseResult saveWmUser(WmUser wmUser) {
        return null;
    }

    @GetMapping("/api/v1/channel/list")
    @Override
    public ResponseResult getChannels() {
        return wmChannelService.findAll();
    }
}
