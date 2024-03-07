package com.eason.user.service.impl;


import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.eason.user.mapper.ApUserMapper;
import com.eason.user.service.ApUserService;
import com.eason.model.common.dtos.ResponseResult;
import com.eason.model.common.enums.AppHttpCodeEnum;
import com.eason.model.user.dtos.LoginDto;
import com.eason.model.user.pojos.ApUser;
import com.eason.model.user.vo.ApUserVO;
import com.eason.utils.common.AppJwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.HashMap;
import java.util.Map;

@Service
@Transactional
@Slf4j
public class ApUserServiceImpl extends ServiceImpl<ApUserMapper, ApUser> implements ApUserService {

    /**
     * app端用户登录
     * @param dto
     * @return
     */
    @Override
    public ResponseResult login(LoginDto dto) {
        // 1 正常登录 用户名和密码
        if (StringUtils.isNotBlank(dto.getPhone()) && StringUtils.isNotBlank(dto.getPassword())) {
            // 1.1 根据手机号查询
            ApUser dbUser = getOne(Wrappers.<ApUser>lambdaQuery().eq(ApUser::getPhone, dto.getPhone()));
            if (dbUser == null) {
                return ResponseResult.errorResult(AppHttpCodeEnum.AP_USER_DATA_NOT_EXIST, "用户信息不存在");
            }
            // 1.2 比对密码
            String salt = dbUser.getSalt();
            String password = dto.getPassword();
            String pswd = DigestUtils.md5DigestAsHex((password + salt).getBytes());
            if (!pswd.equals(dbUser.getPassword())) {
                return ResponseResult.errorResult(AppHttpCodeEnum.LOGIN_PASSWORD_ERROR);
            }
            // 1.3 返回结果 jwt
            String token = AppJwtUtil.getToken(dbUser.getId().longValue());
            Map<String, Object> map = new HashMap<>();

            ApUserVO apUserVO = new ApUserVO();
            BeanUtils.copyProperties(dbUser, apUserVO);
            map.put("user", apUserVO);
            map.put("token", token);
            return ResponseResult.okResult(map);
        } else {
            // 2 游客登录
            Map<String, Object> map = new HashMap<>();
            map.put("token", AppJwtUtil.getToken(0L));
            return ResponseResult.okResult(map);
        }

    }
}
