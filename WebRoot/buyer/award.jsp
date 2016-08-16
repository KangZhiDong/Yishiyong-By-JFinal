<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>赢取宝贝</title>
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
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">赢取宝贝</a>
</div>

<!--wrap-->
<div class="pwrap clearfix">
  <div class="pendingbox clearfix">
    <h2>提高中奖机会<span>以下任务您已申请，暂未获得试用资格；每个试用活动最多可抽<i class="red">3</i>次奖，继续完成任务，可再次获得抽奖机会</span></h2>
    <ul class="business-tabs">
      <li class="active"><a href="/buyer/award"><span>全部试用(1)</span></a></li>
      <!-- <li><a href="/buyer/award"><span>淘宝试用()</span></a></li>
      <li><a href="/buyer/award"><span>天猫试用()</span></a></li>
      <li><a href="javascript:void(0)"><span>京东试用(0)</span></a></li> -->
    </ul>
    <form action="/buyer/award" method="post">
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
        <input type="text" name="shop_nickname" class="text w270" placeholder="请输入商品名称关键字" />
        <input type="submit" value="查询" class="from_sub" />
        <a href="http://bbs.zhongguohuo.com/thread-1032714-1-1.html" target="_blank" style="color:#00A6ED; font-weight:bold; font-size:14px; margin-left:20px; line-height:30px;">如何提高中奖率？</a>
      </div>

    </form>
    <div class="award_title">每个试用有<span>3</span>次试用机会，每完成<span>1</span>次任务即可参与抽奖：<i>第1次：找宝贝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第2次：喜欢并收藏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第3次：浏览店铺</i></div>
    <ul class="task-tit" style="display:none;">
      <li class="liw1">平台</li>
      <li class="liw2">商品信息</li>
      <li class="liw3">剩余抽奖次数</li>
      <li class="liw4">状态</li>
      <li class="liw5" style="padding-left:200px;">操作</li>
    </ul>
    <!--内容区-->
    <div class="task-cc">
      <c:forEach items="${applayingTaskRecords}" var="applayingTaskRecord">
      <ul>
        <li class="w1">
          <c:if test="${applayingTaskRecord.mallPlatformId eq 1}">
            <i class="play_small play_taobao"></i>
          </c:if>
          <c:if test="${applayingTaskRecord.mallPlatformId eq 2}">
            <i class="play_small play_tmall"></i>
          </c:if>
          <i class="c_yellow">
            <c:if test="${applayingTaskRecord.productType eq 1}">时尚女装</c:if>
            <c:if test="${applayingTaskRecord.productType eq 11}">美食特产</c:if>
            <c:if test="${applayingTaskRecord.productType eq 10}">百货日用</c:if>
            <c:if test="${applayingTaskRecord.productType eq 9}">家居家纺</c:if>
            <c:if test="${applayingTaskRecord.productType eq 8}">母婴用品</c:if>
            <c:if test="${applayingTaskRecord.productType eq 7}">护肤彩妆</c:if>
            <c:if test="${applayingTaskRecord.productType eq 6}">数码小家电</c:if>
            <c:if test="${applayingTaskRecord.productType eq 5}">钟表首饰</c:if>
            <c:if test="${applayingTaskRecord.productType eq 4}">运动户外</c:if>
            <c:if test="${applayingTaskRecord.productType eq 3}">鞋类箱包</c:if>
            <c:if test="${applayingTaskRecord.productType eq 2}">精品男装</c:if>
            <c:if test="${applayingTaskRecord.productType eq 12}">车用周边</c:if>
          </i>
        </li>
        <li class="w2"><img src="${applayingTaskRecord.productPictureUrl}" width="32" height="32">${applayingTaskRecord.productName}</li>

        <c:if test="${applayingTaskRecord.applyStatus<4}">
          <li class="w5 tc">
            <a href="/buyer_apply/index-${applayingTaskRecord.id}" class="c-blue pr10">前去找宝贝&gt;</a>
            <a class="J_abandon" task_id="${applayingTaskRecord.id}">放弃任务</a>
          </li>
        </c:if>
        <c:if test="${applayingTaskRecord.applyStatus>=4}">
          <li class="w3"><div class="completed">已完成，未中奖</div></li>
        </c:if>
        <c:if test="${applayingTaskRecord.applyStatus>=4 && applayingTaskRecord.applyStatus<8 }">
          <li class="w5 tc">
            <a href="/buyer_apply/index-${applayingTaskRecord.id}" class="c-blue pr10">前去分享并收藏&gt;</a>
            <a class="J_abandon" task_id="${applayingTaskRecord.id}">放弃任务</a>
          </li>
        </c:if>
        <c:if test="${applayingTaskRecord.applyStatus>=8}">
          <li class="w3"><div class="completed">已完成，未中奖</div></li>
          <c:if test="${applayingTaskRecord.applyStatus<11 }">
            <li class="w5 tc">
              <a href="/buyer_apply/index-${applayingTaskRecord.id}" class="c-blue pr10">前去浏览店铺&gt;</a>
              <a class="J_abandon" task_id="${applayingTaskRecord.id}">放弃任务</a>
            </li>
          </c:if>
          <c:if test="${applayingTaskRecord.applyStatus>=11}">
            <li class="w5 tc">
              已完成，未中奖
            </li>
          </c:if>
        </c:if>
      </ul>
      </c:forEach>

    </div>
    <!--//内容区-->
  </div>

</div>
<!--//wrap-->

<!--wrap-->
<div class="pwrap clearfix">
  <div class="pendingbox clearfix">
    <h3>待开奖的试用<span>平台将在<i class="red">每天10:00</i>抽取试用资格，将会以站内信、手机短信的方式通知您抽奖结果，请根据抽奖结果完成后续任务</span></h3>
    <ul class="task-tit">
      <li class="liw1">平台</li>
      <li class="liw2">商品信息</li>
      <li class="liw3">剩余抽奖次数</li>
      <li class="liw4">状态</li>
      <li class="liw5">操作</li>
    </ul>
    <!--内容区-->
    <div class="task-cc">
      <c:forEach items="${waitingAwardTaskRecords}" var="waitingAwardTaskRecord">
        <ul>
          <li class="w1">
            <c:if test="${waitingAwardTaskRecord.mallPlatformId eq 1}">
              <i class="play_small play_taobao"></i>
            </c:if>
            <c:if test="${waitingAwardTaskRecord.mallPlatformId eq 2}">
              <i class="play_small play_tmall"></i>
            </c:if>
            <i class="c_yellow">
              <c:if test="${waitingAwardTaskRecord.productType eq 12}">车用周边</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 11}">美食特产</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 10}">百货日用</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 9}">家居家纺</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 8}">母婴用品</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 7}">护肤彩妆</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 6}">数码小家电</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 5}">钟表首饰</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 4}">运动户外</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 3}">鞋类箱包</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 2}">精品男装</c:if>
              <c:if test="${waitingAwardTaskRecord.productType eq 1}">时尚女装</c:if>
            </i>
          </li>
          <li class="w2"><img src="${waitingAwardTaskRecord.productPictureUrl}" width="32" height="32" />${waitingAwardTaskRecord.productName}</li>
          <fmt:parseNumber var="temp"  value="${(waitingAwardTaskRecord.applyStatus+1)/4}" integerOnly="true"/>
          <li class="w3">${3-temp}次</li>
          <li class="w4">已申请试用，待抽奖</li>
          <!-- <li class="w5" style="display:none"><a href="/buyer" class="c-blue">前去做任务 ></a></li>    -->
          <li class="w5">等待抽奖结果</li>
        </ul>
      </c:forEach>
    </div>
    <!--//内容区-->
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
<script type="text/javascript">
  $(function(){

    //放弃任务
    $(".J_abandon").click(function(){
      var task_id = $(this).attr("task_id");
      if(confirm("你确定要放弃任务吗？放弃任务后将不可再申请此试用")){
        window.location.href = "/buyer/giveup/"+task_id;
      }
    })

  })
</script>
</body>
</html>