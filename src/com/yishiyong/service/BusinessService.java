package com.yishiyong.service;

import com.jfinal.log.Logger;
import com.yishiyong.model.Business;
import com.yishiyong.model.Buyer;

import java.util.Date;
import java.util.List;

/**
 * Created by dee on 15/8/30.
 */
public class BusinessService {

    private static final Logger log = Logger.getLogger(BusinessService.class);

    public static void add(Long uid, String account, int mallPlatform, String wangWangId, String shopUrl, String shopLogoUrl, String uniqueCode, String productUrlByUniqueCode){
        new Business().set("uid", uid)
                .set("account", account)
                .set("mallPlatform",mallPlatform)
                .set("wangWangId", wangWangId)
                .set("shopUrl", shopUrl)
                .set("shopLogoUrl", shopLogoUrl)
                .set("uniqueCode",uniqueCode)
                .set("productUrlByUniqueCode", productUrlByUniqueCode)
                .set("bindDate",new Date())
                .set("status", 0)
                .save();
        log.info("用户"+uid+"成功绑定商铺信息");
    }

    public static List<Business> list(Long uid){
        return Business.dao.find("select * from "+Business.TABLE_NAME+" where uid = ?",uid);
    }

    public static List<Business> listAll(){
        return Business.dao.find("select * from "+Business.TABLE_NAME);
    }

    public static Business findById(Long id){
        return Business.dao.findFirst("select * from "+Business.TABLE_NAME+" where id = ?",id);
    }
}
