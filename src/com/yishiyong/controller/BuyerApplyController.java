package com.yishiyong.controller;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import com.yishiyong.model.Buyer;
import com.yishiyong.model.Member;
import com.yishiyong.model.Task;
import com.yishiyong.model.TaskInstance;
import com.yishiyong.service.TaskInstanceService;
import com.yishiyong.service.TaskService;
import com.yishiyong.support.util.StringUtil;

import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * 任务申请流程
 * Created by dee on 15/9/10.
 */
public class BuyerApplyController extends Controller {

    private static final Logger log = Logger.getLogger(BuyerApplyController.class);


    public void index(){
        //获取任务的ID
        long taskId = getParaToLong(1);
        Buyer buyer = getSessionAttr("buyer");
        Task task = TaskService.findBy(taskId);
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
        //判断目前是否有未完成的任务，如果有则提示
        if(applyingTaskInstance==null ) {
            redirect301("/buyer_apply/first/-" + taskId);
        }else if(applyingTaskInstance.getInt("applyStatus")<4) {
            redirect301("/buyer_apply/first/-" + taskId);
        }else if(applyingTaskInstance.getInt("applyStatus")>=4 && applyingTaskInstance.getInt("applyStatus")<8) {
            redirect301("/buyer_apply/second/-" + taskId);
        }else if(applyingTaskInstance.getInt("applyStatus")>=8) {
            redirect301("/buyer_apply/third/-" + taskId);
        }
        return;

    }

    //======================第一天=============================
    /**
     * 第一天：做任务，目前状态未0
     */
    public void first(){
        //获取任务的ID
        long taskId = getParaToLong(1);
        Buyer buyer = getSessionAttr("buyer");
        Member member = getSessionAttr("member");
        Task task = TaskService.findBy(taskId);

        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingBy(taskId, member.getLong("id"));
        if(applyingTaskInstance==null){
            //判断目前是否有正在申请的任务
            List<Record> applayingTaskRecords = TaskInstanceService.findApllayingTasksBy(member.getLong("id"));
            if(!applayingTaskRecords.isEmpty() ) {
                redirect("/buyer/award");
                return;
            }else {
                applyingTaskInstance = TaskInstanceService.apply(buyer,task);
            }
        }
        setAttr("taskInstance", applyingTaskInstance);
        setAttr("task", task);
        renderJsp("first.jsp");
    }




    /**
     * 第一天：提交“1:搜索商品”，设置状态为 1
     */
    public void first_tb_zero(){
        Long taskInstanceId = getParaToLong("taskInstanceId");
        TaskInstance  taskInstance = TaskInstance.dao.findById(taskInstanceId);
        if(StringUtil.isEmpty(getPara("url1"))||StringUtil.isEmpty(getPara("url2"))||StringUtil.isEmpty(getPara("url3"))||StringUtil.isEmpty(getPara("url4"))) {
            redirect301("/buyer_apply/first/-" +  taskInstance.getLong("taskId"));
            return;
        }

        taskInstance.set("ortherUrl1",getPara("url1"));
        taskInstance.set("ortherUrl2", getPara("url2"));
        taskInstance.set("ortherUrl3",getPara("url3"));
        taskInstance.set("ortherUrl4", getPara("url4"));
        taskInstance.set("step1Time",new Date());
        taskInstance.set("applyStatus", 1);
        taskInstance.update();
        setAttr("taskInstance", taskInstance);
        redirect("/buyer_apply/first/-" + taskInstance.getLong("taskId"));
    }

    /**
     * 第一天：提交“2:核对商品”，设置状态为 2
     */
    public void first_tb_one(){
        Long taskInstanceId = getParaToLong("taskInstanceId");
        //Long taskId = getParaToLong(1);
        //Long buyerId = ((Buyer)getSessionAttr("buyer")).getLong("id");
        TaskInstance taskInstance = TaskInstanceService.findBy(taskInstanceId);
        Task task = TaskService.findBy(taskInstance.getLong("taskId"));

        log.info("taskInstance===" + taskInstance);

        String checkedProductUrl = getPara("goods_url");

        boolean flag = checkProductUrl(checkedProductUrl,task.getStr("productUrl"));
        if(!flag){
            redirect("/buyer_apply/first/-"+taskInstance.getLong("taskId"));
            return;
        }


        taskInstance.set("step2Time",new Date());
        taskInstance.set("applyStatus", 2);
        taskInstance.set("checkedProductUrl",checkedProductUrl);
        taskInstance.update();
        setSessionAttr("taskInstance", taskInstance);
        redirect("/buyer_apply/first/-"+taskInstance.getLong("taskId"));
    }

    /**
     * 第一天：核对商品URL
     */
    public void ajax_check(){
        String task_id = getPara("task_id");
        String itemurl = getPara("itemurl");
        //TODO 比较链接是否正确
        log.info("task_id:" + task_id + ", itemUrl:" + itemurl);
        renderJson("1");
    }

    /**
     * 第一天：提交"3:放入购物车"，，设置状态为 3
     */
    public void first_two(){
        Long taskId = getParaToLong(1);
        Long buyerId = ((Buyer)getSessionAttr("buyer")).getLong("id");
        TaskInstance taskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyerId);

        Date newDeadlineTime = new Date(taskInstance.getDate("deadlineTime").getTime());
        //newDeadlineTime.setDate(newDeadlineTime.getDate() + 1);
        newDeadlineTime.setHours(10);
        newDeadlineTime.setMinutes(00);
        //设置开奖时间
        taskInstance.set("sysAwardgetDate", newDeadlineTime);
        //setAttr("newDeadlineTime", newDeadlineTime);
        Date newDeadlineTime2 = new Date(taskInstance.getDate("deadlineTime").getTime());
        //newDeadlineTime2.setDate(newDeadlineTime.getDate() + 1);
        newDeadlineTime2.setHours(22);
        newDeadlineTime2.setMinutes(00);
        taskInstance.set("awardgetDeadline", newDeadlineTime2);
        taskInstance.set("applyStatus", 3); //TODO 必需由审核后，状态才能转为4
        taskInstance.set("step3Time",new Date());
        taskInstance.set("step4Time",new Date());
        taskInstance.update();
        setAttr("taskInstance", taskInstance);
        //setAttr("task", TaskService.findBy(taskInstance.getLong("taskId")));
        redirect("/buyer_apply/first/-" + taskInstance.getLong("taskId"));
    }




    //======================第二天=============================

    /**
     * 第二天:进入试用商品页面，不设置状态
     */
    public void second() {
        //获取任务的ID
        long taskId = getParaToLong(1);
        Buyer buyer = getSessionAttr("buyer");
        //Member member = getSessionAttr("member");
        Task task = TaskService.findBy(taskId);

        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
//        if(applyingTaskInstance==null){
//            //判断目前是否有正在申请的任务
//            List<Record> applayingTaskRecords = TaskInstanceService.findApllayingTasksBy(member.getLong("id"));
//            if(!applayingTaskRecords.isEmpty() ) {
//                redirect("/buyer/award");
//                return;
//            }else {
//                applyingTaskInstance = TaskInstanceService.apply(buyer,task);
//            }
//        }
        setAttr("taskInstance", applyingTaskInstance);
        setAttr("task", task);
        renderJsp("first.jsp");
    }

    /**
     * 第二天: 完成“进入试用商品页”，设置状态为 5
     */
    public void second_one(){
        //获取任务的ID
        long taskInstanceId = getParaToLong(1);
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findBy(taskInstanceId);
        applyingTaskInstance.set("step5Time",new Date());
        applyingTaskInstance.set("applyStatus", 5);
        applyingTaskInstance.update();
        redirect301("/buyer_apply/second-" + applyingTaskInstance.getLong("taskId"));
    }


    /**
     * 第二天: 提交“分享商品链接”，设置状态为6
     */
    public void second_two(){
        //获取任务的ID
        long taskInstanceId = getParaToLong("task_instance_id");
        String shareUrl = getPara("url_goods_share");
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findBy(taskInstanceId);
        applyingTaskInstance.set("shareUrl",shareUrl);
        applyingTaskInstance.set("step6Time",new Date());
        applyingTaskInstance.set("applyStatus", 6);
        applyingTaskInstance.update();
        redirect301("/buyer_apply/second-" + applyingTaskInstance.getLong("taskId"));
    }

    /**
     * 第二天: 提交“收藏宝贝和店铺”，设置状态为7
     */
    public void second_three(){
        Member member = getSessionAttr("member");

        //获取图片
        //处理上传的图片
        String basePath = PropKit.get("uploadFilePath");
        String baseUploadFileUrl = PropKit.get("baseUploadFileUrl");
        UploadFile wwPictureUploadFile = getFile("collectProductScreenshotPic", basePath);
        UploadFile zfbPictureUploadFile1 = getFile("collectShopScreenshotPic", basePath);
        String wwPictureUploadFileNewName = genNewFileName(member, wwPictureUploadFile.getFile(), "cps");
        wwPictureUploadFile.getFile().renameTo(new File(basePath + wwPictureUploadFileNewName));
        String zfbPictureUploadFile1NewName =  genNewFileName(member, zfbPictureUploadFile1.getFile(),"css");
        zfbPictureUploadFile1.getFile().renameTo(new File(basePath + zfbPictureUploadFile1NewName));

        String collectProductScreenshotUrl=baseUploadFileUrl+wwPictureUploadFileNewName;;
        String collectShopScreenshotUrl=baseUploadFileUrl+zfbPictureUploadFile1NewName;;

        //获取任务的ID
        long taskInstanceId = getParaToLong("task_instance_id");
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findBy(taskInstanceId);
        applyingTaskInstance.set("step7Time",new Date());
        applyingTaskInstance.set("step8Time",new Date());
        applyingTaskInstance.set("applyStatus", 7);
        applyingTaskInstance.set("collectProductScreenshotUrl",collectProductScreenshotUrl);
        applyingTaskInstance.set("collectShopScreenshotUrl",collectShopScreenshotUrl);
        applyingTaskInstance.update();

        //TODO 更新系统抽奖时间和中奖后领取的时间

        redirect301("/buyer_apply/second-" + applyingTaskInstance.getLong("taskId"));
    }


    public void third(){
        //获取任务的ID
        long taskId = getParaToLong(1);
        Buyer buyer = getSessionAttr("buyer");
        //Member member = getSessionAttr("member");
        Task task = TaskService.findBy(taskId);

        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
        setAttr("taskInstance", applyingTaskInstance);
        setAttr("task", task);
        renderJsp("first.jsp");
    }


    public void third_one(){
        //获取任务的ID
        long taskInstanceId = getParaToLong(1);
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findBy(taskInstanceId);
        applyingTaskInstance.set("step9Time",new Date());
        applyingTaskInstance.set("applyStatus", 9);
        applyingTaskInstance.update();
        redirect301("/buyer_apply/third-" + applyingTaskInstance.getLong("taskId"));
    }

    public void third_two(){
        //获取任务的ID
        long taskInstanceId = getParaToLong("taskInstanceId");
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findBy(taskInstanceId);
        String ortherUrl1 = getPara("ortherUrl1");
        String ortherUrl2 = getPara("ortherUrl2");
        String ortherUrl3 = getPara("ortherUrl3");
        String ortherUrl4 = getPara("ortherUrl4");
        applyingTaskInstance.set("step10Time",new Date());
        applyingTaskInstance.set("applyStatus", 10);
        applyingTaskInstance.set("ortherUrl1",ortherUrl1);
        applyingTaskInstance.set("ortherUrl2",ortherUrl2);
        applyingTaskInstance.set("ortherUrl3",ortherUrl3);
        applyingTaskInstance.set("ortherUrl4",ortherUrl4);
        applyingTaskInstance.update();
        redirect301("/buyer_apply/third-" + applyingTaskInstance.getLong("taskId"));
    }

    private static String genNewFileName(Member member, File file, String type) {
        String accountId = "0";
        if (member != null) {
            accountId = member.getLong("id")+"";
        }
        String postfix = "png";
        String[] paths = file.getPath().split(".");
        if (paths.length > 1) {
            postfix = paths[1];
        }
        return type + "_" + accountId + "_" + System.currentTimeMillis() + "." + postfix;
    }

    /**
     * 核对商品链接
     * @return
     */
    private boolean checkProductUrl(String tempUrl, String url){
        //链接类似：https://item.taobao.com/item.htm?spm=a230r.1.14.13.nhp7x7&id=44815762376&ns=1&abbucket=7#detail
        if(StringUtil.isEmpty(tempUrl)){
            return false;
        }
        return true;
    }


}
