<%@ page import="com.yishiyong.service.ConstantService" %>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.yishiyong.com/functions" prefix="my" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>领取宝贝</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <link href="/static/css/choujiang0514.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/common.js"></script>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />
<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">领取宝贝</a>
</div>

<!--wrap-->
<div class="pwrap clearfix">
  <div class="pendingbox clearfix" style="margin-bottom:30px;">
    <h2 class="f_borderb">领取宝贝<span>以下试用是您已经获得试用资格，需要在<i class="red"> 22:00</i>之前必须完成领取的任务</span></h2>
    <ul class="business-tabs">
      <li class="active"><a href="/buyer/awardget"><span>全部试用(1)</span></a></li>
      <!-- <li><a href="/buyer/award"><span>淘宝试用()</span></a></li>
      <li><a href="/buyer/award"><span>天猫试用()</span></a></li>
      <li><a href="javascript:void(0)"><span>京东试用(0)</span></a></li> -->
    </ul>
    <form action="/buyer/awardget" method="post">
      <div class="content-place check-money-tit">
        <span>试用分类：</span>
        <select name="cid" class="w110">
          <option value="99">所有分类</option>
          <option value="1" >时尚女装</option>
          <option value="2" >精品男装</option>
          <option value="3" >鞋类箱包</option>
          <option value="4" >运动户外</option>
          <option value="5" >钟表首饰</option>
          <option value="6" >数码小家电</option>
          <option value="7" >护肤彩妆</option>
          <option value="8" >母婴用品</option>
          <option value="9" >家居家纺</option>
          <option value="10" >百货日用</option>
          <option value="11" >美食特产</option>
          <option value="12" >车用周边</option>
        </select>
        <span>商品名称：</span>
        <input type="text" name="shop_nickname" class="text w270" placeholder="请输入商品名称关键字"  value=""/>
        <input type="submit" value="查询" class="from_sub" />
      </div>
    </form>
    <div class="award_title">每个试用有<span>3</span>次试用机会，每完成<span>1</span>次任务即可参与抽奖：<i>第1次：找宝贝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第2次：喜欢并收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第3次：浏览店铺</i></div>



    <div class="task-cc">
      <c:forEach items="${awardgetedTaskRecords}" var="awardgetedTaskRecord">
        <ul>
          <li class="w1"><i class="play_small play_tmall"></i> <i class="c_yellow">${my:getProductTypeNameById(awardgetedTaskRecord.productType)}</i></li>
          <li class="w2"><img src="${awardgetedTaskRecord.productPictureUrl}" width="32" height="32" />${awardgetedTaskRecord.productName}</li>
          <li class="w5"><a href="/buyer_pass/index-${awardgetedTaskRecord.id}" class="c-blue winning">已获奖，前去领取&gt;</a></li>
        </ul>
      </c:forEach>

    </div>


  </div>
</div>
<!--//wrap-->


<!--footer-->
<div id="footers" class="clearfix">
  <ul class="clearfix">
    <li><a href="/test/help_js" target="_blank">关于我们</a></li>
    <li><a href="/test/help_lxwm" target="_blank">联系我们</a></li>
    <li><a href="/test/help_invite" target="_blank">诚聘英才</a></li>
    <li><a href="/test/help_book" target="_blank">用户协议</a></li>
    <li><a href="/test/index_m" target="_blank">帮助中心</a></li>
    <li class="bnone"><a href="http://bbs.zhongguohuo.com/" target="_blank">琳琅论坛</a></li>
  </ul>
  <p>Copyright © 2015 zhongguohuo.com 版权所有 浙ICP备09002461号-1</p>
</div>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
</body>
</html>