package com.yishiyong.controller;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.upload.UploadFile;
import com.yishiyong.model.Buyer;
import com.yishiyong.model.Member;
import com.yishiyong.model.Task;
import com.yishiyong.model.TaskInstance;
import com.yishiyong.service.TaskInstanceService;
import com.yishiyong.service.TaskService;

import java.io.File;

/**
 * Created by dee on 15/9/21.
 */
public class BuyerPassController extends Controller {

    public void index(){
        Buyer buyer = getSessionAttr("buyer");
        //获取任务的ID
        long taskId = getParaToLong(1);
        Task task = TaskService.findBy(taskId);
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
        //计算是第几天完成任务的
        int day = (int)Math.ceil(applyingTaskInstance.getInt("applyStatus")/4.0);
        setAttr("day", day);
        setAttr("task", task);
        setAttr("taskInstance",applyingTaskInstance);
        renderJsp("index.jsp");
    }

    /**
     * 进入试用商品页
     */
    public void first_one(){
        Buyer buyer = getSessionAttr("buyer");
        //获取任务的ID
        long taskId = getParaToLong(1);
        //Task task = TaskService.findBy(taskId);
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
        //计算是第几天完成任务的
        int day = (int)Math.ceil(applyingTaskInstance.getInt("applyStatus")/4.0);
        applyingTaskInstance.set("awardgetStatus", day*10+1);
        applyingTaskInstance.update();
        redirect301("/buyer_pass/index-"+taskId);

    }


    /**
     * 分享商品
     */
    public void first_two(){
        Buyer buyer = getSessionAttr("buyer");
        //获取任务的ID
        long taskId = getParaToLong("task_id");
        String shareUrl = getPara("url_goods_share");
        //Task task = TaskService.findBy(taskId);
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
        //计算是第几天完成任务的
        int day = (int)Math.ceil(applyingTaskInstance.getInt("applyStatus")/4.0);
        applyingTaskInstance.set("awardgetStatus", day*10+2);
        applyingTaskInstance.set("shareUrl",shareUrl);
        applyingTaskInstance.update();
        redirect301("/buyer_pass/index-"+taskId);

    }

    /**
     * 收藏宝贝和店铺
     */
    public void first_three(){
        Buyer buyer = getSessionAttr("buyer");
        Member member = getSessionAttr("member");
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
        long taskId = getParaToLong("task_id");

        //Task task = TaskService.findBy(taskId);
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
        //计算是第几天完成任务的
        int day = (int)Math.ceil(applyingTaskInstance.getInt("applyStatus")/4.0);
        applyingTaskInstance.set("awardgetStatus", day*10+3);
        applyingTaskInstance.set("collectProductScreenshotUrl",collectProductScreenshotUrl);
        applyingTaskInstance.set("collectShopScreenshotUrl",collectShopScreenshotUrl);
        applyingTaskInstance.update();
        redirect301("/buyer_pass/index-"+taskId);
    }


    /**
     * 浏览店铺及客服聊天
     */
    public void first_four(){
        Buyer buyer = getSessionAttr("buyer");
        Member member = getSessionAttr("member");
        //处理上传的图片
        String basePath = PropKit.get("uploadFilePath");
        String baseUploadFileUrl = PropKit.get("baseUploadFileUrl");
        UploadFile chatWithCustomServiceScreenshotPicFile = getFile("chatWithCustomServiceScreenshotPic", basePath);
        String wwPictureUploadFileNewName = genNewFileName(member, chatWithCustomServiceScreenshotPicFile.getFile(), "cps");
        chatWithCustomServiceScreenshotPicFile.getFile().renameTo(new File(basePath + wwPictureUploadFileNewName));
        String chatWithCustomServiceScreenshotUrl=baseUploadFileUrl+wwPictureUploadFileNewName;;
        //获取任务的ID
        long taskId = getParaToLong("task_id");
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
        //计算是第几天完成任务的
        int day = (int)Math.ceil(applyingTaskInstance.getInt("applyStatus")/4.0);
        int awardgetStatus = 0;
        if(day==1){
            awardgetStatus = 14;
        }else if(day==2){
            awardgetStatus = 22;
        }else{
            awardgetStatus = 32;
        }
        applyingTaskInstance.set("awardgetStatus", awardgetStatus);
        applyingTaskInstance.set("chatWithCustomServiceScreenshotUrl",chatWithCustomServiceScreenshotUrl);
        if(!isParaBlank("shopProductUrl1")){
            String shopProductUrl1 = getPara("shopProductUrl1");
            String shopProductUrl2 = getPara("shopProductUrl2");
            String shopProductUrl3 = getPara("shopProductUrl3");
            String shopProductUrl4 = getPara("shopProductUrl4");
            applyingTaskInstance.set("shopProductUrl1",shopProductUrl1);
            applyingTaskInstance.set("shopProductUrl2",shopProductUrl2);
            applyingTaskInstance.set("shopProductUrl3",shopProductUrl3);
            applyingTaskInstance.set("shopProductUrl4",shopProductUrl4);
        }

        applyingTaskInstance.update();
        redirect301("/buyer_pass/index-"+taskId);
    }

    /**
     * 下单并付款
     */
    public void first_five(){
        Buyer buyer = getSessionAttr("buyer");
        Member member = getSessionAttr("member");
        //处理上传的图片
        String basePath = PropKit.get("uploadFilePath");
        String baseUploadFileUrl = PropKit.get("baseUploadFileUrl");
        UploadFile chatWithCustomServiceScreenshotPicFile = getFile("succedOrderScreenshotPic", basePath);
        String wwPictureUploadFileNewName = genNewFileName(member, chatWithCustomServiceScreenshotPicFile.getFile(), "cps");
        chatWithCustomServiceScreenshotPicFile.getFile().renameTo(new File(basePath + wwPictureUploadFileNewName));
        String succedOrderScreenshotUrl =baseUploadFileUrl+wwPictureUploadFileNewName;;
        //获取任务的ID
        long taskId = getParaToLong("task_id");
        String orderId = getPara("orderId");
        String realProductPrice = getPara("realProductPrice");
        //Task task = TaskService.findBy(taskId);
        //判断目前用户是否已经申请了当前任务
        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
        //计算是第几天完成任务的
        int day = (int)Math.ceil(applyingTaskInstance.getInt("applyStatus")/4.0);
        int awardgetStatus = 0;
        if(day==1){
            awardgetStatus = 15;
        }else if(day==2){
            awardgetStatus = 23;
        }else{
            awardgetStatus = 33;
        }
        applyingTaskInstance.set("awardgetStatus", awardgetStatus);
        applyingTaskInstance.set("succedOrderScreenshotUrl",succedOrderScreenshotUrl);
        applyingTaskInstance.set("orderId",orderId);
        applyingTaskInstance.set("realProductPrice",realProductPrice);
        applyingTaskInstance.update();
        redirect301("/buyer_pass/index-"+taskId);
    }















    /**
     * 下单并付款
     */
//    public void second_three(){
//        Buyer buyer = getSessionAttr("buyer");
//
//        getFile();
//        //获取任务的ID
//        long taskId = getParaToLong("task_id");
//        //Task task = TaskService.findBy(taskId);
//        //判断目前用户是否已经申请了当前任务
//        TaskInstance applyingTaskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
//        //计算是第几天完成任务的
//        int day = applyingTaskInstance.getInt("applyStatus")/4+1;
//        applyingTaskInstance.set("awardgetStatus", day*10+3);
//        applyingTaskInstance.update();
//        redirect301("/buyer_pass/index-"+taskId);
//    }


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

    public static void main(String[] args){
        int applyingTaskInstance = 8;
        int day = (int)Math.ceil(applyingTaskInstance/4.0);


        System.out.println(day);
    }

}
