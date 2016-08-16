package com.yishiyong.service;

import com.yishiyong.model.support.ProductType;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dee on 15/9/30.
 */

public class ConstantService {

    private static  List<ProductType> list = new ArrayList<ProductType>();
    private static Map<Integer,String> productMap = new HashMap<Integer,String>();

    static {
        list.add(new ProductType(1,"时尚女装"));
        list.add(new ProductType(2,"精品男装"));
        list.add(new ProductType(3,"鞋类箱包"));
        list.add(new ProductType(4,"运动户外"));
        list.add(new ProductType(5,"钟表首饰"));
        list.add(new ProductType(6,"数码小家电"));
        list.add(new ProductType(7,"护肤彩妆"));
        list.add(new ProductType(8,"母婴用品"));
        list.add(new ProductType(9,"家居家纺"));
        list.add(new ProductType(10,"百货日用"));
        list.add(new ProductType(11,"美食特产"));
        list.add(new ProductType(12,"车用周边"));

        for (int i = 0; i <list.size() ; i++) {
            productMap.put(list.get(i).getId(),list.get(i).getName());
        }
    }

    /**
     * 获取所有的商品种类
     * @return
     */
    public static List<ProductType> listProductTypes(){
        return list;
    }

    public static Map<Integer,String> getProductTypesMap(){
        return productMap;
    }

}
