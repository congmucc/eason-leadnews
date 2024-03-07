package com.eason.model.user.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * APP用户信息返回前端
 * </p>
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApUserVO implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Integer id;

    /**
     * 用户名
     */
    private String name;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 头像
     */
    private String image;

    /**
     * 0 男
     1 女
     2 未知
     */
    private Boolean sex;

    /**
     * 0 未
     1 是
     */
    private Boolean certification;

    /**
     * 是否身份认证
     */
    private Boolean identityAuthentication;

    /**
     * 0正常
     1锁定
     */
    private Boolean status;

    /**
     * 0 普通用户
     1 自媒体人
     2 大V
     */
    private Short flag;

    /**
     * 注册时间
     */
    private Date createdTime;

}