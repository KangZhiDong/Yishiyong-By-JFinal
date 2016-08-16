package com.yishiyong.service;

import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.yishiyong.model.Task;

import java.util.List;

/**
 * Created by dee on 15/9/4.
 */
public class TaskService {

    private static final Logger log = Logger.getLogger(TaskService.class);

    public static List<Task> list(long uid){
        return Task.dao.find("select * from "+Task.TABLE_NAME +" where uid=?", uid);
    }

    public static List<Task> listAll(){
        return Task.dao.find("select * from "+Task.TABLE_NAME + " where total>0");
    }

    public static Task findBy(Long id){
        return Task.dao.findFirst("select * from " + Task.TABLE_NAME + " where id=?", id);
    }

    /**
     * 剩余的任务数减一
     * @param task
     */
    public static void apply(Task task){
        if(task.getInt("remain")<=0){
            log.error("剩余的任务数量不足");
        }
        Db.update("update "+Task.TABLE_NAME+" set remain=remain-1, applied=applied+1 where id=?", task.getLong("id"));
    }

}
