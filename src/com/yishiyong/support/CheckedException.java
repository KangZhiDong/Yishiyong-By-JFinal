package com.yishiyong.support;

/**
 * 捕获的业务异常
 * Created by dee on 15/8/26.
 */
public class CheckedException extends Exception {

    public CheckedException(int code, String message){
        super(message);
    }

}
