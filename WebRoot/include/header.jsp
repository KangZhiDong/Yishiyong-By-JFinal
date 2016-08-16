<%@ page import="com.yishiyong.service.TaskInstanceService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jfinal.plugin.activerecord.Record" %>
<%@ page import="com.yishiyong.model.Member" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%

  Member member = (Member) session.getAttribute("member");
  if(member!=null){
    //获取目前正在进行的试用
    List<Record> apllayingTaskRecords = TaskInstanceService.findApllayingTasksBy(member.getLong("id"));
    //获取等待开奖的试用
    List<Record> waitingAwardTaskRecords = TaskInstanceService.listWaitingAwardBy(member.getLong("id"));
    //获取已经中奖的试用
    List<Record> awardgetedTaskRecords = TaskInstanceService.listAwardgetedBy(member.getLong("id"));

    request.setAttribute("countApllayingTaskRecords",apllayingTaskRecords.size()+waitingAwardTaskRecords.size());
    request.setAttribute("countAwardgetedTaskRecords",awardgetedTaskRecords.size());
    request.setAttribute("awardgetedTaskRecords",awardgetedTaskRecords);
  }

%>
<div id="header">
  <div class="logo">
    <a href="/">
      <h2>琳琅国货</h2>
    </a>
    <!--         <div class="search">
                <input type="text" class="search-text" value="" placeholder='搜"花瓶雨伞"试试，雨天晴天不一样的风景' />
                <input type="button" class="search-button" />
            </div> -->
  </div>
  <div class="nav">
    <ul>
      <li><a href="/">首页</a></li>
      <li><a href="/buyer">试用</a></li>
      <!--<li><a href="javascript:;">好店推荐</a></li>-->
      <li><a href="http://bbs.zhongguohuo.com/" target="_blank">论坛</a></li>
      <li style="float:right;"><a href="/member">个人中心</a></li>
      <c:if test="${not empty member}">
        <c:if test="${member.role <=2 }">
          <!--试客登录-->
          <li style="float:right;"><a href="/buyer/award" class="nav-img">继续申请(${countApllayingTaskRecords})</a></li>
          <li style="float:right;"><a href="/buyer/awardget" class="nav-img">中奖了(${countAwardgetedTaskRecords})</a></li>
        </c:if>
        <c:if test="${member.role >2 }">
          <li style="float:right;"><a href="/buyer/award" class="nav-img">我的任务(0)</a></li>
        </c:if>
      </c:if>
    </ul>
  </div>
</div>