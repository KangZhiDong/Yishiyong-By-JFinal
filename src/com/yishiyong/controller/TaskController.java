package com.yishiyong.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.yishiyong.model.Buyer;
import com.yishiyong.model.Member;
import com.yishiyong.model.Task;
import com.yishiyong.model.TaskInstance;
import com.yishiyong.service.BuyerService;
import com.yishiyong.service.TaskInstanceService;
import com.yishiyong.service.TaskService;

/**
 * Created by dee on 15/9/8.
 */
public class TaskController extends Controller {

    private static final Logger log = Logger.getLogger(TaskController.class);

    public void index(){

        //获取任务的ID
        long taskId = getParaToLong(1);
        Task task = TaskService.findBy(taskId);
        Member member = getSessionAttr("member");
        Buyer buyer = BuyerService.findAuditedgBuyerByUid(member.getLong("id"));
        TaskInstance taskInstance = null;
        if (buyer!=null) {
            taskInstance = TaskInstanceService.findFirstApllayingByBuyerId(taskId, buyer.getLong("id"));
            setAttr("taskInstance", null);
        }
        if(taskInstance!=null)
            setAttr("taskInstance", taskInstance);

        //获取任务已经被多少用户领取
         Long count1 = TaskInstanceService.countTotalBy(taskId);

        //获取任务已经被多少用户中奖
         Long count2 = TaskInstanceService.countAwardgetBy(taskId);

        Long count3 = TaskInstanceService.countOrderBy(taskId);

        //获取该任务当天的领取人数
        Long count4 = TaskInstanceService.countTodayTotalBy(taskId);

        setAttr("task", task);
        setAttr("buyer",buyer);
        setAttr("count1",count1);
        setAttr("count2",count2);
        setAttr("count3",count3);
        setAttr("count4",count4);
        renderJsp("index.jsp");

    }

}
