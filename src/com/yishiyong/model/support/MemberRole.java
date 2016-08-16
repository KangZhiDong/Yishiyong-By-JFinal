package com.yishiyong.model.support;

/**
 *
 * 系统用户角色
 *
 * Created by dee on 15/8/23.
 */
public enum MemberRole {
    /**
     * 买手
     */
    NORMAL_BUYER(1),

    /**
     * VIP买手
     */
    VIP_BUYER(2),

    /**
     * 商家
     */
    NORMAL_BUSINESS(3),
    /**
     * VIP商家
     */
    VIP_BUSINESS(4);

    public int value;

    private MemberRole(int value){
        this.value = value;
    }

    public static MemberRole get(int index){

        switch (index){
            case 1: return MemberRole.NORMAL_BUYER;
            case 2: return MemberRole.VIP_BUYER;
            case 3: return MemberRole.NORMAL_BUSINESS;
            case 4: return MemberRole.VIP_BUSINESS;
        }
        return null;

    }

    public static void main(String args[]){
        System.out.print(MemberRole.NORMAL_BUSINESS.value);
    }

}
