package com.yishiyong.controller.interceptors;


import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.yishiyong.model.Buyer;
import com.yishiyong.model.Member;

/**
 * Created by dee on 15/8/23.
 */
public class AuthInterceptor implements Interceptor {

    private static final Logger log = Logger.getLogger(AuthInterceptor.class);

    @Override
    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        String controllerKey = inv.getControllerKey();

        if(controllerKey.equals("/task_info")||controllerKey.equals("/buyer") || controllerKey.equals("/buyer_apply")|| controllerKey.equals("/buyer_pass")){
            //log.info("controllerKey is:" + controllerKey);
            Member member = controller.getSessionAttr("member");
            if(member==null) {
                inv.getController().redirect("/login");
                return;
            }
        }


        if(controllerKey.equals("/buyer_apply") || controllerKey.equals("/buyer_pass")){
            //log.info("controllerKey is:" + controllerKey);
            Buyer buyer = controller.getSessionAttr("buyer");
            if(buyer==null) {
                inv.getController().redirect("/buyer/account");
                return;
            }
        }


        inv.invoke();

    }
}
