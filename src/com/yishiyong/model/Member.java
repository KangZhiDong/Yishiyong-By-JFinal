package com.yishiyong.model;

import com.jfinal.plugin.activerecord.Model;
import com.yishiyong.model.support.MemberRole;

import java.util.Date;

/**
 * Created by dee on 15/8/23.
 */
public class Member extends Model<Member> {
    public static final String TABLE_NAME = "member";
    public static final Member dao = new Member();

    //自增标记
    Long id;
    //用户角色(1:买手; 2:VIP买手; 3:商家; 4:VIP商家;)
    int role;
    String account;
    String password;
    String payPassword;
    String qq;
    String email;
    String phone;
    String portrait;
    /**
     * VIP等级
     */
    String vipLevel;
    /**
     * 会员到期有效期
     */
    Date vipValidityDate;

    Date createDate;

    Date lastLoginDate;

    /**
     * 积分、金币（做任务的时候消耗，用户每申请1个任务将冻结1金币 | 任务未中奖、申请中途取消、中奖下单收货返款后解冻返还 | 已中奖自主放弃领取将扣除1金币）
     */
    double points;

    /**
     * 垫付本金
     */
    double moneyAdvanced;

    /**
     * 待平台返回本金
     */
    double moneyBacking;
    /**
     * 待平台返回本金笔数（1笔、2笔）
     */
    double moneyBackingCount;

    /**
     * 已返回到账户的本金
     */
    double moneyBacked;

    /**
     * 是否绑定商铺
     */
    boolean isBindShop;


}
