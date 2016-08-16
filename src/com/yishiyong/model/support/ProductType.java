package com.yishiyong.model.support;

/**
 * Created by dee on 15/9/30.
 */

/**
 * 商品分类(次分类为本系统内分类)
 *  <option value="1" >时尚女装</option>
 *  <option value="11" >美食特产</option>
 *  <option value="10" >百货日用</option>
 *  <option value="9" >家居家纺</option>
 *  <option value="8" >母婴用品</option>
 *  <option value="7" >护肤彩妆</option>
 *  <option value="6" >数码小家电</option>
 *  <option value="5" >钟表首饰</option>
 *  <option value="4" >运动户外</option>
 *  <option value="3" >鞋类箱包</option>
 *  <option value="2" >精品男装</option>
 *  <option value="12" >车用周边</option>
 */

public class ProductType {

    int id;
    String name;

    public ProductType(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
