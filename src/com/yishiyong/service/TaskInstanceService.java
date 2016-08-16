package com.yishiyong.service;

import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.yishiyong.model.Buyer;
import com.yishiyong.model.Task;
import com.yishiyong.model.TaskInstance;
import com.yishiyong.support.util.DateUtil;

import java.util.Date;
import java.util.List;

/**
 * Created by dee on 15/9/23.
 */
public class TaskInstanceService {

    private static final Logger log = Logger.getLogger(TaskInstanceService.class);

    /**
     * 用户申请某个任务
     * @param buyer
     * @param task
     */
    public static TaskInstance apply(Buyer buyer, Task task){
        Long taskId = task.getLong("id");
        Long buyerId = buyer.get("id");
        TaskInstance taskInstance = findFirstApllayingBy(taskId, buyerId);
        if(taskInstance==null){
            //创建任务实例
            taskInstance = new TaskInstance();
            taskInstance.set("taskId",taskId);
            taskInstance.set("buyerId",buyerId);
            taskInstance.set("wangWangId",buyer.get("wangWangId"));
            taskInstance.save();
            TaskService.apply(task);
        }
        return taskInstance;
    }



    public static TaskInstance findBy(Long id){
        return TaskInstance.dao.findFirst("select * from " + TaskInstance.TABLE_NAME + " where id=?", id);
    }

    /**
     * 获取该用户所有的任务列表
     * @param uid
     * @return
     */
    public static List<Record> list(long uid){
        return Db.find("select *,ti.id as tiId from " + TaskInstance.TABLE_NAME + " ti," + Task.TABLE_NAME + " t where ti.taskId=t.id and ti.buyerId in (?)", BuyerService.getBuyerIdsStr(uid));
    }




    /**
     * 获取该用户正在申请的该任务，如果未领取该任务，返回空
     * @return
     */
    public static TaskInstance findFirstApllayingBy(Long taskId, Long uid){
        return TaskInstance.dao.findFirst("select * from " + TaskInstance.TABLE_NAME + " where taskId=? and buyerId  in (?) ", taskId, BuyerService.getBuyerIdsStr(uid));
    }

    /**
     * 获取该“买家”正在申请的该任务，如果未领取该任务，返回空
     * @return
     */
    public static TaskInstance findFirstApllayingByBuyerId(Long taskId, Long buyerId){
        return TaskInstance.dao.findFirst("select * from " + TaskInstance.TABLE_NAME + " where taskId=? and buyerId = ? ", taskId, buyerId);
    }

    /**
     * 获取该用户正在申请的任务列表
     * @return
     */
//    public static List<TaskInstance> findApllayingTasksBy(Long buyerId){
//        return TaskInstance.dao.find("select * from " + TaskInstance.TABLE_NAME + " where buyerId=? and awardget=0 ", buyerId);
//    }
    public static List<Record> findApllayingTasksBy(long uid){
        return Db.find("select *,ti.id as tiId from " + TaskInstance.TABLE_NAME + " ti," + Task.TABLE_NAME + " t where ti.taskId=t.id and ti.applyStatus in (0,1,2,4,5,6,8,9,11) and ti.awardgetStatus=0 and ti.buyerId in (?)", BuyerService.getBuyerIdsStr(uid));
    }

    /**
     * 获取该用户所有待开奖的任务列表
     * @param uid
     * @return
     */
    public static List<Record> listWaitingAwardBy(long uid){

        return Db.find("select *,ti.id as tiId from " + TaskInstance.TABLE_NAME + " ti," + Task.TABLE_NAME + " t where ti.taskId=t.id and ti.applyStatus in (3,7,10) and ti.awardgetStatus=0 and ti.buyerId in (?)", BuyerService.getBuyerIdsStr(uid));
    }

    /**
     * 列举待好评的任务
     * @return
     */
    public static List<Record> listWaittingCommentBy(long uid){
        return Db.find("select *,ti.id as tiId from " + TaskInstance.TABLE_NAME + " ti," + Task.TABLE_NAME + " t where ti.taskId=t.id and ti.awardgetStatus in (16,26,36) and ti.buyerId in (?)", BuyerService.getBuyerIdsStr(uid));
    }

    /**
     * 获取该用户所有中奖的任务列表
     * @param uid
     * @return
     */
    public static List<Record> listAwardgetedBy(long uid){

        return Db.find("select *,ti.id as tiId from " + TaskInstance.TABLE_NAME + " ti," + Task.TABLE_NAME + " t where ti.taskId=t.id and ti.awardgetStatus>0 and ti.buyerId in (?)", BuyerService.getBuyerIdsStr(uid));
    }


    /**
     * 计算某个任务有多少人领取
     * @param taskId
     * @return
     */
    public static Long countTotalBy(Long taskId){
        return Db.queryLong("select count(*) from " + TaskInstance.TABLE_NAME + " where taskId = ? ", taskId);
    }

    /**
     * 计算某个任务今日有多少人领取
     * @param taskId
     * @return
     */
    public static Long countTodayTotalBy(Long taskId){
        String beginDateStr = DateUtil.format(DateUtil.getBeginOfDay(new Date()),DateUtil.exportXlsDateCreateTimeFormat);
        String endDateStr = DateUtil.format(DateUtil.getEndOfDay(new Date()), DateUtil.exportXlsDateCreateTimeFormat);
        return Db.queryLong("select count(*) from " + TaskInstance.TABLE_NAME + " where taskId = ? and applyTime>=? and applyTime<=?", taskId,beginDateStr,endDateStr);
    }

    /**
     * 计算某个任务有多少人中奖
     * @param taskId
     * @return
     */
    public static Long countAwardgetBy(Long taskId){
        return Db.queryLong("select count(*) from "+TaskInstance.TABLE_NAME + " where taskId = ? and awardgetStatus>0",taskId);
    }

    /**
     * 计算某个任务有多少人中奖并且下单
     * @param taskId
     * @return
     */
    public static Long countOrderBy(Long taskId){
        return Db.queryLong("select count(*) from "+TaskInstance.TABLE_NAME + " where taskId = ? and awardgetStatus>0 and applyStatus>11",taskId);
    }






}
