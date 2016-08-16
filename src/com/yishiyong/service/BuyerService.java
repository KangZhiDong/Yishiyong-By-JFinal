package com.yishiyong.service;

import com.jfinal.log.Logger;
import com.yishiyong.model.Buyer;

import java.util.Date;
import java.util.List;

/**
 * Created by dee on 15/8/30.
 */
public class BuyerService {

    private static final Logger log = Logger.getLogger(BuyerService.class);

    public static void add(Long uid, String wangWangId, String alipayAccount, String alipayRealName, String identityCard, String wwPicture, String zfbPicture){
        new Buyer().set("uid",uid)
                    .set("wangWangId", wangWangId)
                    .set("alipayAccount", alipayAccount)
                    .set("identityCard",identityCard)
                    .set("alipayRealName", alipayRealName)
                    .set("screenshotWangWangInfoUrl", wwPicture)
                    .set("screenshotAlipayRealNameUrl",zfbPicture)
                    .set("bindDate",new Date())
                    .set("status", 0)
                    .save();
        log.info("用户"+uid+"提交绑定信息");

    }

    /**
     * 获取该用户一个正在审核通过的买家账号
     * @param uid
     * @return
     */
    public static Buyer findAuditingBuyerByUid(Long uid){
        return Buyer.dao.findFirst("select * from "+Buyer.TABLE_NAME+" where uid=? and status = 0", uid);

    }

    /**
     * 获取该用户一个淘宝/天猫的买家账号(包括待审或者审核)
     * @param uid
     * @return
     */
    public static Buyer findTaobaoTmallBuyerByUid(Long uid){
        return Buyer.dao.findFirst("select * from "+Buyer.TABLE_NAME+" where uid=? and mallPlatformId in (1,2)", uid);

    }

    /**
     * 获取该用户一个已经审核通过的买家账号
     * @param uid
     * @return
     */
    public static Buyer findAuditedgBuyerByUid(Long uid){
        return Buyer.dao.findFirst("select * from "+Buyer.TABLE_NAME+" where uid=? and status = 1", uid);

    }

    /**
     * 获取该用户已经审核通过的所有的买家账号
     * @param uid
     * @return
     */
    public static List<Buyer> findAllAuditedgBuyerByUid(Long uid){
        return Buyer.dao.find("select * from " + Buyer.TABLE_NAME + " where uid=? and status = 1", uid);
    }

    public static String getBuyerIdsStr(Long uid){
        List<Buyer> buyers = findAllAuditedgBuyerByUid(uid);
        StringBuffer ids = new StringBuffer();
        for (int i = 0; i < buyers.size(); i++) {
            if(i!=0) ids.append(",");
            ids.append(buyers.get(i).getLong("id"));
        }
        return ids.toString();
    }

}
