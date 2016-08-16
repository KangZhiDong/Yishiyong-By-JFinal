package com.yishiyong.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Record;
import com.yishiyong.model.Business;
import com.yishiyong.model.Member;
import com.yishiyong.model.Task;
import com.yishiyong.model.TaskInstance;
import com.yishiyong.service.BusinessService;
import com.yishiyong.service.MemberService;
import com.yishiyong.service.TaskInstanceService;
import com.yishiyong.service.TaskService;
import com.yishiyong.support.BaseResponse;

import java.util.List;

/**
 *
 * 用户中心，包括用户属性检查
 *
 * Created by dee on 15/8/28.
 */
public class MemberController extends Controller {

    private static final Logger log = Logger.getLogger(MemberController.class);

    public void index() {
        log.info(getParaMap().toString());
        Member member = getSessionAttr("member");
        if(member==null){
            redirect("/login");
            return;
        }
        if(member.getInt("role")>2) {
            //获取店铺列表，最多3个
            List<Business> listBusinesses = BusinessService.list(member.getLong("id"));
            setSessionAttr("listBusinesses", listBusinesses);
            //获取任务列表
            List<Task> listTasks = TaskService.list(member.getLong("id"));
            setSessionAttr("listTasks", listTasks);
        }else{
            //获取领取的任务
            List<Record> listRecords = TaskInstanceService.list(member.getLong("id"));
            setSessionAttr("listRecords", listRecords);
        }

        renderJsp("/member.jsp");
    }

    /**
     * 检查用户信息
     */
    public void check_user_info(){
        BaseResponse baseResponse = new BaseResponse();
        String chk_str = getPara("chk_str");
        int tid = getParaToInt("tid"); //0:qq;1:邮箱;2:手机
        log.info(getParaMap().toString());
        if(tid==0){
            Member member = MemberService.findByAccount(chk_str);
            if(member !=null){
                baseResponse.setError("1");
                baseResponse.setMsg("该帐号已经被使用");
            }
        }else if(tid==1){
            Member member = MemberService.findByEmail(chk_str);
            if(member !=null){
                baseResponse.setError("1");
                baseResponse.setMsg("该邮箱已经被使用");
            }
        }else if(tid==2){
            Member member = MemberService.findByPhone(chk_str);
            if(member !=null){
                baseResponse.setError("1");
                baseResponse.setMsg("该手机号已经被使用");
            }
        }else if(tid==3){
            Member member = MemberService.findByQQ(chk_str);
            if(member !=null){
                baseResponse.setError("1");
                baseResponse.setMsg("该QQ号已经被使用");
            }
        }
        baseResponse.setUrl("/buyer/level");
        renderJson(baseResponse);

    }

    public void userinfo(){
        renderJsp("userinfo.jsp");
    }

}
