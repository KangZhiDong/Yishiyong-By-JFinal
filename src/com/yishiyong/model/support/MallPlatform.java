package com.yishiyong.model.support;

/**
 *
 * 系统商城类别
 *
 * Created by dee on 15/8/23.
 */
public enum MallPlatform {

    TAOBAO(1),
    TMALL(2),
    YHD(3),
    JD(4),
    JUMEI(5),
    AMAZON(6),
    DANGDANG(7);

    public int value;

    private MallPlatform(int value){
        this.value = value;
    }
}
