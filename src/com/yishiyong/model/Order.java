package com.yishiyong.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by dee on 15/8/26.
 */


public class Order extends Model<Order> {
    public static final String TABLE_NAME = "order";
    public static final Order dao = new Order();

}
