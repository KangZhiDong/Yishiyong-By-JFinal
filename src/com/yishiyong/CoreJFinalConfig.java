package com.yishiyong;

import com.jfinal.config.*;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.yishiyong.controller.*;
import com.yishiyong.controller.interceptors.AuthInterceptor;
import com.yishiyong.model.*;

public class CoreJFinalConfig extends JFinalConfig {

    public void configConstant(Constants me) {
        PropKit.use("config.properties");

        me.setDevMode(PropKit.getBoolean("devMode")); //在开发模式下，JFinal 会对每次请求输出报告，如输出本次请求的 Controller、Method 以及请求所携带的参数。
        me.setViewType(ViewType.JSP);
        me.setUrlParaSeparator("-");
        me.setEncoding("utf-8");
    }

    //此方法用来配置 JFinal 访问路由
    public void configRoute(Routes me) {
        me.add("/", IndexController.class);
        me.add("/register", RegisterController.class);
        me.add("/member", MemberController.class);
        me.add("/buyer", BuyerController.class);
        me.add("/business", BusinessController.class);
        me.add("/task_info", TaskController.class);
        me.add("/buyer_apply", BuyerApplyController.class);
        me.add("/buyer_pass",BuyerPassController.class);
    }

    public void configPlugin(Plugins me) {

        C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password"));
        me.add(c3p0Plugin);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        me.add(arp);
        arp.addMapping("member", Member.class);
        arp.addMapping("buyer", Buyer.class);
        arp.addMapping("business", Business.class);
        arp.addMapping("task", Task.class);
        arp.addMapping("taskInstance", TaskInstance.class);
    }

    public void configInterceptor(Interceptors me) {

        me.add(new AuthInterceptor());
    }

    public void configHandler(Handlers me) {
    }
}