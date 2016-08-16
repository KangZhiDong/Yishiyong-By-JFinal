package com.yishiyong.model;

import com.jfinal.plugin.activerecord.Model;
import com.yishiyong.model.support.ExpressType;
import com.yishiyong.model.support.TaskStatus;

import java.util.Date;

/**
 *
 * 用户任务
 *
 * Created by dee on 15/8/24.
 */
public class Task extends Model<Task> {

    public static final Task dao = new Task();

    public static final String TABLE_NAME = "task";

    /**
     * 唯一标记，任务ID
     */
    Long id;

    /**
     * 用户ID
     */
    Long uid;
    /**
     * 平台（1.淘宝；2.天猫）
     */
    int mallPlatformId;
    /**
     * 卖家
     */
    Long businessId;

    /**
     * 卖家店铺主旺旺号(冗余)
     */
    Long businessWangWangId;

    /**
     * 任务状态
     */
    int taskStatus;

    /**
     * 发布时间，审核通过自动设置发布时间
     */
    Date publishTime;
    /**
     * 产品名称
     */
    String productName;
    /**
     * 产品URL
     */
    String productUrl;

    /**
     * 商品分类(次分类为本系统内分类)
     *  <option value="1" >时尚女装</option>
     *  <option value="11" >美食特产</option>
     *  <option value="10" >百货日用</option>
     *  <option value="9" >家居家纺</option>
     *  <option value="8" >母婴用品</option>
     *  <option value="7" >护肤彩妆</option>
     *  <option value="6" >数码小家电</option>
     *  <option value="5" >钟表首饰</option>
     *  <option value="4" >运动户外</option>
     *  <option value="3" >鞋类箱包</option>
     *  <option value="2" >精品男装</option>
     *  <option value="12" >车用周边</option>
     */
    int productType;
    /**
     * 产品图片URL,上传的商品图将会展示在网站
     */
    String productPictureUrl;
    /**
     * 产品价格
     */
    double productPrice;
    /**
     * 商品单拍数量
     */
    int productNeedBuyAmount;
    /**
     * 商品规格1
     */
    String productAttr1;
    /**
     * 商品规格2
     */
    String productAttr2;

    /**
     * 产品主图片URL
     */
    String productMainPictureUrl;

    /**
     * 搜索关键字
     */
    String searchKeyword;

    /**
     * 筛选分类
     */
    String searchFilter1;
    String searchFilter2;
    String searchFilter3;
    String searchFilter4;

    double searchStartPrice;
    double searchEndPrice;

    String searchArea;

    /**
     * 已经申请任务的人数
     */
    int applied;

    /**
     * 已经合格获取任务的人数,awardget
     */
    int qualified;

    /**
     * 已经领取的任务的人数
     */
    int received;

    /**
     * 总任务数
     */
    int total;

    /**
     * 剩余数量
     */
    int remain;

    /**
     * 每天发放件数
     */
    int totalPerDay;

    /**
     * 回馈金币
     */
    int feedbackCoin;


}
