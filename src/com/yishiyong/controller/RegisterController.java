package com.yishiyong.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.yishiyong.model.Member;
import com.yishiyong.model.support.MemberRole;
import com.yishiyong.service.MemberService;
import com.yishiyong.support.BaseResponse;
import org.apache.commons.lang3.StringUtils;

/**
 * Created by dee on 15/8/29.
 */
public class RegisterController extends Controller {

    private static final Logger log = Logger.getLogger(RegisterController.class);

    public void index() {
        renderJsp("/member.jsp");
    }

    /**
     * 注册买家，展示注册表单
     */
    public void buyer() {
        log.info("注册的参数是：" + getParaMap().toString());
        BaseResponse baseResponse = new BaseResponse();

        //
        if (getParaMap().isEmpty()) { //展示注册表单
            renderJsp("buyerAndBusiness.jsp");
        }
        //注册普通买家
        else if(getParaToInt("type")==1){
            Member member = (Member)getSessionAttr("member");
            member.set("role",MemberRole.NORMAL_BUYER.value);
            member.update();
            setSessionAttr("member", member);
            redirect("/member");
        }
    }

    /**
     * 注册商家
     */
    public void business(){
        BaseResponse baseResponse = new BaseResponse();
        setAttr("businessFlag","1");
        //第一步
        if (getParaMap().isEmpty()) { //展示注册表单
            renderJsp("buyerAndBusiness.jsp");
        }//第三步 注册普通商家
        else if(getParaToInt("type")==2){
            Member tempMember = (Member)getSessionAttr("tempMember");
            Member member = MemberService.regist(tempMember.getStr("account"), tempMember.getStr("password"), tempMember.getStr("email"), tempMember.getStr("qq"), tempMember.getStr("phone"), MemberRole.NORMAL_BUSINESS);
            removeSessionAttr("tempMember");
            setSessionAttr("member", member);
            redirect("/business/level_succ");
        }
    }


    public void member() {

        BaseResponse baseResponse = new BaseResponse();
        //获取注册参数并做临时保存
        Member member = new Member();
        String businessFlag = getPara("businessFlag");
        String account = getPara("username");
        String password = getPara("password");
        String qq = getPara("qq");
        String email = getPara("email");
        String phone = getPara("mobile");
        member.set("account",account);
        member.set("password",password);
        member.set("qq",qq);
        member.set("email", email);
        member.set("phone", phone);
        member.save();
        setSessionAttr("member", member);
        log.info("新用户注册:"+account);
        baseResponse.setError("0");
        baseResponse.setUrl("/buyer/level");
        if(!StringUtils.isEmpty(businessFlag)) {
            baseResponse.setUrl("/business/level");
        }
        renderJson(baseResponse);
    }


}
