package com.yishiyong.support;

import com.yishiyong.service.ConstantService;

/**
 * Created by dee on 15/10/4.
 */
public class MyJSTLFunctions {

    public static String sayHello(String name){
        return "Hello,"+name;
    }

    public static String getProductTypeNameById(String id){
        return ConstantService.getProductTypesMap().get(Integer.parseInt(id));
    }
}
