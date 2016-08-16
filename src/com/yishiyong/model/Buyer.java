package com.yishiyong.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.Date;

/**
 * Created by dee on 15/8/23.
 */

//买家账号
public class Buyer extends Model<Buyer> {
    public static final String TABLE_NAME = "buyer";
    public static final Buyer dao = new Buyer();
    //自增标记
    Long id;

    Long uid;

    String wangWangId;

    /**
     * 旺旺个人档案截图
     */
    String screenshotWangWangInfoUrl;

    /**
     * 支付宝实名认证名字
     */
    String alipayRealName;

    String alipayAccount;

    /**
     * 支付宝实名认证名字截图
     */
    String screenshotAlipayRealNameUrl;

    /**
     * 身份证号
     */
    String identityCard;

    String province;

    String city;

    String area;

    String stree;

    /**
     * IP地址截图
     */
    String screenshotIpUrl;

    /**
     * 真实姓名
     */
    String fullName;
    /**
     * 电话
     */
    String phone;
    Date lastModifyDate;
    Date bindDate;
    Date auditDate;
    int status;//0:未审核；1:审核通过;2:未审核通过

}
