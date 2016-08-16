package com.yishiyong.service;

import com.jfinal.log.Logger;
import com.yishiyong.model.Buyer;
import com.yishiyong.model.Member;
import com.yishiyong.model.support.MemberRole;

import java.util.Date;
import java.util.List;

/**
 * 用户基本服务
 * Created by dee on 15/8/26.
 */
public class MemberService {

    private static final Logger log = Logger.getLogger(MemberService.class);

    /**
     * 用户登录
     * @param account
     * @param password 此处的密码的值必须是md5(原文密码)
     * @return
     */
    public static Member login(String account, String password){
        Member member = Member.dao.findFirst("select * from member where account=? and password=?",account,password);
        if (member !=null){
            member.remove("password");
            log.info("用户"+ member.get("account")+"登录成功");
            //更新最后登录时间
            member.set("lastLoginDate",new Date()).update();
        }
        return member;
    }

    /**
     * 用户注册
     * @param account
     * @param password
     * @param email
     * @param qq
     * @param phone
     * @param memberRole
     * @return
     */
    public static Member regist(String account, String password, String email, String qq, String phone, MemberRole memberRole) {

//        if(account.length()<6 && account.length()>15) {
//            throw new CheckedException();
//        }
        boolean isRegistedSuccess = new Member().set("account", account).set("password", password).set("email",email).set("qq",qq).set("phone",phone).set("userRole", memberRole.value)
                .save();
        Member member = findByAccount(account);
        if (member !=null){
            log.info("用户id:" + member.get("id") + ", account:" + member.get("account") + "注册成功");
        }
        return member;

    }

    public static Member findByAccount(String account){
       return Member.dao.findFirst("select * from "+Member.TABLE_NAME+" where account=?",account);
    }

    public static Member findByEmail(String email){
        return Member.dao.findFirst("select * from "+Member.TABLE_NAME+" where email=?",email);
    }

    public static Member findByPhone(String phone){
        return Member.dao.findFirst("select * from "+Member.TABLE_NAME+" where phone=?",phone);
    }

    public static Member findByQQ(String qq){
        return Member.dao.findFirst("select * from "+Member.TABLE_NAME+" where qq=?",qq);
    }

}
