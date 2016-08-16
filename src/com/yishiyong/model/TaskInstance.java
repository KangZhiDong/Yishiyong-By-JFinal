package com.yishiyong.model;

import com.jfinal.plugin.activerecord.Model;
import org.apache.commons.lang3.time.DateUtils;

import java.util.Date;

/**
 *
 * 买家领取的任务实例
 * Created by dee on 15/9/10.
 */
public class TaskInstance extends Model<TaskInstance> {

    public static final TaskInstance dao = new TaskInstance();

    public static final String TABLE_NAME = "taskInstance";

    public TaskInstance(){
        Date now = new Date();
        this.set("id",System.currentTimeMillis());
        this.set("applyStatus",0); //初始化为“新建”状态
        this.set("applyTime",now);
        //截至时间默认为12个小时后
        this.set("deadlineTime", DateUtils.addHours(now,12));
    }

    //自增标记
    Long id;

    Long taskId;

    Long buyerId;

    String wangWangId;

    /**
     * 申请状态
     * 第一天：(0:新建；1:搜索商品；2:核对商品；3:放入购物车；4:提交试用申请；
     * 第二天：5:进入试用商品页；6:分享宝贝；7:收藏宝贝和店铺；8提交试用申请；
     * 第三天：9:进入试用商品页；10:浏览店铺；11提交试用申请；)
     */
    int applyStatus;

    //创建时间
    //Date createTime;
    /**
     * 申请时间
     */
    Date applyTime;
    //完成第一步“搜索商品”的时间
    Date step1Time;
    Date step2Time;
    Date step3Time;
    Date step4Time;
    Date step5Time;
    Date step6Time;
    Date step7Time;
    Date step8Time;
    Date step9Time;
    Date step10Time;
    Date step11Time;

    //1.搜索商品
    String ortherUrl1;
    String ortherUrl2;
    String ortherUrl3;
    String ortherUrl4;

    //2.核对商品
    String checkedProductUrl;

    //6.分享到爱逛街的链接
    String shareUrl;

    //7.收藏宝贝截图
    String collectProductScreenshotUrl;
    //7.收藏店铺截图
    String collectShopScreenshotUrl;

    //8.浏览店铺
    String shopProductUrl1;
    String shopProductUrl2;
    String shopProductUrl3;
    String shopProductUrl4;
    //8.与客服聊天截图
    String chatWithCustomServiceScreenshotUrl;

    //9.订单付款成功截图
    String succedOrderScreenshotUrl;
    //9.订单号
    String orderId;
    //9.实际付费金额
    String realProductPrice;

    //收货好评
    String productComment;

    /**
     * 第一天最后提交时间，否则视为自动放弃
     */
    Date deadlineTime;
    /**
     * 第二天最后提交时间，否则视为自动放弃
     */
    Date deadlineTime2;

    /**
     * 是否中奖,是否获得试用
     */
    //boolean awardget;

    /**
     * 记录中奖后的状态，第一天中奖初始值为10，第二天中奖初始值为20，第三天中奖初始值为30，后面每完成一个任务往后递增
     */
    int awardgetStatus;

    /**
     * 系统的开奖时间
     */
    Date sysAwardgetDate;

    Date awardgetDeadline;

    /**
     * 审核资料时间
     */
    Date check1Date;
    Date check2Date;

    /**
     * 是否放弃任务
     */
    boolean abandoned;


}
