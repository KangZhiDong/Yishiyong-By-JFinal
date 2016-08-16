package com.yishiyong.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Record;
import com.yishiyong.model.Business;
import com.yishiyong.model.Buyer;
import com.yishiyong.model.Member;
import com.yishiyong.model.Task;
import com.yishiyong.service.*;
import com.yishiyong.support.BaseResponse;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

public class IndexController extends Controller {

    private static final Logger log = Logger.getLogger(IndexController.class);

    public void index() {
        Member member = getSessionAttr("member");
        if(member!=null){
            long uid = member.getLong("id");
            //获取待提交数量
            //获取待领取数量
            //获取待好评数量
            List<Record> taskInstanceRecord = TaskInstanceService.listWaittingCommentBy(uid);
            setAttr("waittingCommentCount",taskInstanceRecord.size());
            //获取待返回数量
        }

        //获取出所有的可用的任务
        setAttr("allTasks", TaskService.listAll());
        setAttr("allBusinesses", BusinessService.listAll());
        renderJsp("index.jsp");
    }

    public void login() {

        BaseResponse baseResponse = new BaseResponse();

        if(getParaMap().isEmpty()){
            renderJsp("login.jsp");
        }else {
            String username = getPara("username");
            String password = getPara("password");
            if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
                baseResponse.setError("1");
                baseResponse.setMsg("账号不能为空");
                renderJson(baseResponse);
                return;
            }

            if (StringUtils.isEmpty(password)) {
                baseResponse.setError("1");
                baseResponse.setMsg("密码不能为空");
                renderJson(baseResponse);
                return;
            }

            Member member = MemberService.login(username, password);
            if (member != null) {
                baseResponse.setError("0");
                baseResponse.setUrl("/index");

                int role = member.getInt("role");
                if(role<=2){ //买手
                    Buyer buyer = BuyerService.findAuditedgBuyerByUid(member.getLong("id"));
                    setSessionAttr("buyer", buyer); //设置会话
                }else{ //商家
                    Business business = BusinessService.findById(member.getLong("id"));
                    setSessionAttr("business", business); //设置会话
                }

                setSessionAttr("member", member); //设置会话
            } else {
                baseResponse.setError("1");
                baseResponse.setMsg("用户账号或密码错误");
            }
            renderJson(baseResponse);
        }
    }

    public void logout(){
        log.info("用户退出");
        removeSessionAttr("member");
        redirect("/login");
    }



}
