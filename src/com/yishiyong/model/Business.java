package com.yishiyong.model;
import com.jfinal.plugin.activerecord.Model;
import com.yishiyong.model.support.MallPlatform;

/**
 * Created by dee on 15/8/23.
 */
public class Business extends Model<Business> {
    public static final String TABLE_NAME = "business";
    public static final Business dao = new Business();
    /**
     * 卖家ID
     */
    Long id;
    /**
     * 用户ID
     */
    Long uid;
    /**
     * 用户账号
     */
    String account;
    /**
     * 商城平台
     */
    MallPlatform mallPlatform;
    /**
     * 店铺主旺旺号
     */
    String wangWangId;

    /**
     * 店铺首页网址
     */
    String shopUrl;
    /**
     * 店铺LOGO
     */
    String shopLogoUrl;

    /**
     * 分配给卖家的唯一验证码，如 8760-ZJWV
     */
    String uniqueCode;
    /**
     * 带验证码的商品URL
     */
    String productUrlByUniqueCode;

    int statuts;//0:未审核；1:审核通过；2审核不通过

    /**
     * 发件人地址，省
     */
    String province;
    /**
     * 发件人地址，市
     */
    String city;
    /**
     * 发件人地址，区
     */
    String area;
    /**
     * 发件人地址，街道
     */
    String street;
    /**
     * 真实姓名
     */
    String fullName;
    /**
     * 电话
     */
    String phone;





}

