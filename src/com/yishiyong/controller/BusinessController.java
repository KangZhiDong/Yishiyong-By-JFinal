package com.yishiyong.controller;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Logger;
import com.jfinal.upload.UploadFile;
import com.yishiyong.model.Business;
import com.yishiyong.model.Member;
import com.yishiyong.model.Task;
import com.yishiyong.model.support.MallPlatform;
import com.yishiyong.service.BusinessService;
import com.yishiyong.support.BaseResponse;

import java.io.File;
import java.util.List;

/**
 * Created by dee on 15/8/30.
 */
public class BusinessController extends Controller {

    private static final Logger log = Logger.getLogger(BusinessController.class);

    public void level() {
        renderJsp("level.jsp");
    }

    public void level_succ() {

        renderJsp("level_succ.jsp");
    }

    public void shoping_binding(){

        Member member = getSessionAttr("member");
        log.info("=====shoping_binding");

        if ("POST".equalsIgnoreCase(getRequest().getMethod())) {
            String basePath = PropKit.get("uploadFilePath");
            String baseUploadFileUrl = PropKit.get("baseUploadFileUrl");
            UploadFile shopingLogoFile = getFile("shoping_logo", basePath);
            String shopingLogoFileNewName = genNewFileName(member, shopingLogoFile.getFile(), "shoplogo");
            shopingLogoFile.getFile().renameTo(new File(basePath + shopingLogoFileNewName));
            String shopingUrl = getPara("shoping_url");
            String wangWangId = getPara("shoping_name");
            String productUrl = getPara("shop_url");
            //验证验证码
            String uniqueCode = "";

            BusinessService.add(member.getLong("id"),member.getStr("account"), MallPlatform.TAOBAO.value,wangWangId,shopingUrl,baseUploadFileUrl+shopingLogoFileNewName,uniqueCode,productUrl);
        }
        renderJsp("shoping_binding.jsp");
    }

    public void shoping_check(){
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setError("0");
        baseResponse.setMsg("验证成功");
        renderJson(baseResponse);
    }

    public void task_1(){
        Member member = getSessionAttr("member");
        if(getParaMap().isEmpty()){
            //TODO 获取平台下发布的任务数量

            //获取店铺列表，VIP用户最多3个
            List<Business> listBusinesses = BusinessService.list(member.getLong("id"));
            setSessionAttr("listBusinesses",listBusinesses);

            renderJsp("/business/task_1.jsp");
            return;
        }
        //开始发布任务第一步，选平台
        if("POST".equalsIgnoreCase(getRequest().getMethod())){
            Task tempTask = new Task();
            int mallPlatformId = getParaToInt("pid"); // 1 淘宝，2，天猫
            long businessId = getParaToLong("binding_id");
            tempTask.set("uid",member.get("id"));
            tempTask.set("businessId", businessId);
            tempTask.set("mallPlatformId",mallPlatformId);
            log.info(tempTask.toJson());
            setSessionAttr("tempTask", tempTask);
            redirect("/business/task_2");
        }

    }

    public void task_2(){

        Member member = getSessionAttr("member");

        Task tempTask = getSessionAttr("tempTask");
        log.info("task_2 getparam:"+getParaMap());
        if("get".equalsIgnoreCase(getRequest().getMethod())) {
            Business business = BusinessService.findById(tempTask.getLong("businessId"));
            setAttr("business", business);
            renderJsp("/business/task_2.jsp");
            return;
        }
        //开始发布任务第二步，填写商品和订单信息
        if("POST".equalsIgnoreCase(getRequest().getMethod())){

            //商品图  task_mimg
            String basePath = PropKit.get("uploadFilePath");
            String baseUploadFileUrl = PropKit.get("baseUploadFileUrl");
            UploadFile wwPictureUploadFile = getFile("task_mimg", basePath);
            String wwPictureUploadFileNewName = genNewFileName(member, wwPictureUploadFile.getFile(), "product");
            wwPictureUploadFile.getFile().renameTo(new File(basePath + wwPictureUploadFileNewName));
            String taskMimgPicUrl = baseUploadFileUrl+wwPictureUploadFileNewName;


            tempTask.set("productPictureUrl",taskMimgPicUrl);
            tempTask.set("productName", getPara("shop_nickname"));
            tempTask.set("productUrl",getPara("url"));
            tempTask.set("productType", getPara("cate_id"));

            tempTask.set("productAttr1",getPara("productAttr1"));
            tempTask.set("productAttr2",getPara("productAttr2"));

            tempTask.set("productPrice",getPara("price"));
            tempTask.set("productNeedBuyAmount",getPara("shop_number"));
            log.info(tempTask.toJson());
            setSessionAttr("tempTask",tempTask);
            redirect("/business/task_3");
        }
    }

    public void task_3(){
        Member member = getSessionAttr("member");
        Task tempTask = getSessionAttr("tempTask");
        log.info("task_3 getparam:"+getParaMap());
        if("get".equalsIgnoreCase(getRequest().getMethod())) {
            Business business = BusinessService.findById(tempTask.getLong("businessId"));
            setAttr("business", business);
            renderJsp("/business/task_3.jsp");
            return;
        }
        //开始发布任务第二步，填写商品和订单信息
        if("POST".equalsIgnoreCase(getRequest().getMethod())){

            //商品主图  task_mimg
            String basePath = PropKit.get("uploadFilePath");
            String baseUploadFileUrl = PropKit.get("baseUploadFileUrl");
            UploadFile wwPictureUploadFile = getFile("tb_task_img", basePath);
            String wwPictureUploadFileNewName = genNewFileName(member, wwPictureUploadFile.getFile(), "mproduct");
            wwPictureUploadFile.getFile().renameTo(new File(basePath + wwPictureUploadFileNewName));
            String productMainPictureUrl = baseUploadFileUrl+wwPictureUploadFileNewName;

            tempTask.set("productMainPictureUrl",productMainPictureUrl);
            tempTask.set("searchKeyword", getPara("keyword"));
            tempTask.set("searchFilter1",getPara("filter1"));
            tempTask.set("searchFilter2",getPara("filter2"));
            tempTask.set("searchFilter3",getPara("filter3"));
            tempTask.set("searchFilter4",getPara("filter4"));

            tempTask.set("searchStartPrice",getPara("start_price"));
            tempTask.set("searchEndPrice", getPara("end_price"));

            tempTask.set("searchArea", getPara("area"));

            log.info(tempTask.toJson());

            redirect("/business/task_4");
        }
    }


    public void task_4() {
        Member member = getSessionAttr("member");
        Task tempTask = getSessionAttr("tempTask");
        log.info("task_4 getparam:" + getParaMap());

        if ("get".equalsIgnoreCase(getRequest().getMethod())) {
            renderJsp("/business/task_4.jsp");
            return;
        }
        //开始发布任务第二步，填写商品和订单信息
        if ("POST".equalsIgnoreCase(getRequest().getMethod())) {

            tempTask.set("total",getPara("task_number"));
            //TODO

            //保存任务
            tempTask.save();
            removeSessionAttr("tempTask");
        }
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
