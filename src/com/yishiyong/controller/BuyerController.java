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
import com.yishiyong.service.BuyerService;
import com.yishiyong.service.TaskInstanceService;
import com.yishiyong.service.TaskService;

import java.io.File;
import java.util.List;

/**
 * Created by dee on 15/8/29.
 */
public class BuyerController extends Controller {

    private static final Logger log = Logger.getLogger(BuyerController.class);

    public void level() {
        renderJsp("level.jsp");
    }

    public void account() {

        Member member = getSessionAttr("member");

        //是否有正在审核的自己提交的买家信息
        Buyer buyer = BuyerService.findTaobaoTmallBuyerByUid(member.getLong("id"));
        if(buyer!=null){
            setAttr("buyer", buyer);
            renderJsp("account.jsp");
            return;
        }

        if ("POST".equalsIgnoreCase(getRequest().getMethod())) {
            //处理上传的图片
            String basePath = PropKit.get("uploadFilePath");
            String baseUploadFileUrl = PropKit.get("baseUploadFileUrl");
            UploadFile wwPictureUploadFile = getFile("ww_picture", basePath);
            UploadFile zfbPictureUploadFile1 = getFile("zfb_picture", basePath);
            String wwPictureUploadFileNewName = genNewFileName(member, wwPictureUploadFile.getFile(), "ww");
            wwPictureUploadFile.getFile().renameTo(new File(basePath + wwPictureUploadFileNewName));
            String zfbPictureUploadFile1NewName =  genNewFileName(member, zfbPictureUploadFile1.getFile(),"zfb");
            zfbPictureUploadFile1.getFile().renameTo(new File(basePath + zfbPictureUploadFile1NewName));

            String wangwangId = getPara("ww_name");
            String alipayAccount = getPara("zfb");
            String alipayRealName = getPara("zfb_name");
            String identityCard = getPara("zfb_idcard");
            String wwPicture = baseUploadFileUrl+wwPictureUploadFileNewName;
            String zfbPicture = baseUploadFileUrl+zfbPictureUploadFile1NewName;

            BuyerService.add(member.getLong("id"),wangwangId,alipayAccount,alipayRealName,identityCard,wwPicture,zfbPicture);

            setAttr("buyer", BuyerService.findTaobaoTmallBuyerByUid(member.getLong("id")));

        }

        renderJsp("account.jsp");

    }

    //赢取宝贝页面
    public void award(){
        Member member = getSessionAttr("member");
        Long uid = member.getLong("id");
        Buyer buyer = getSessionAttr("buyer");
        if(buyer!=null){
            Long buyerId = buyer.getLong("id");
            //获取目前正在进行的试用
            List<Record> applayingTaskRecords = TaskInstanceService.findApllayingTasksBy(uid);
            //Long taskId = apllayingTaskInstances.getLong("taskId");
            //Task apllayingTask = TaskService.findBy(taskId);
            setAttr("applayingTaskRecords",applayingTaskRecords);
            //setAttr("apllayingTask",apllayingTask);
            //获取等待开奖的试用
            List<Record> waitingAwardTaskRecords = TaskInstanceService.listWaitingAwardBy(uid);
            setAttr("waitingAwardTaskRecords", waitingAwardTaskRecords);
        }

        renderJsp("award.jsp");
    }

    public  void  awardget(){
        renderJsp("awardget.jsp");
    }

    public void buyer_step(){
        Long taskInstanceId = getParaToLong(1);
        TaskInstance taskInstance = TaskInstanceService.findBy(taskInstanceId);
        Long taskId = taskInstance.getLong("taskId");
        Task task = TaskService.findBy(taskId);
        int day = (int)Math.ceil(taskInstance.getInt("applyStatus")/4.0);
        setAttr("day", day);
        setAttr("taskInstance",taskInstance);
        setAttr("task",task);
        renderJsp("buyer_step.jsp");
    }

    /**
     * 购买金币
     */
    public void pay_gold(){
        renderJsp("pay_gold.jsp");

    }


    public void renewal_vip(){

        render("renewal_vip.jsp");
    }

    public void waitting_get(){
        Member member = getSessionAttr("member");
        long uid = member.getLong("id");
        //获取待好评数量
        List<Record> taskInstanceRecord = TaskInstanceService.listWaittingCommentBy(uid);
        setAttr("taskInstanceRecord",taskInstanceRecord);
        render("waitting_get.jsp");
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



}
