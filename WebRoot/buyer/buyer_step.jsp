<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>试用进展</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/brush_order_new.css" rel="stylesheet" />
  <link rel="stylesheet" href="/static/css/common.css" />
  <script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/common.js"></script>
  <script type="text/javascript" src="/static/script/jquery.zclip.min.js"></script>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">试用进展</a>
</div>

<!--wraptop-->
<div class="s-wrap">
  <!--头部-->
  <div class="stit">
    <h2><img src="/static/images/img-business/b-tit.png" alt="试用进展" /></h2>

    <div class="Process_new">
      <ul class="clearfix">

        <c:if test="${taskInstance.applyStatus<3}">
          <li style="width:10px"><em class="Processing">1</em><span style="width:60px;left:-22px;" class="c-yellow">申请试用</span></li>
        </c:if>
        <c:if test="${taskInstance.applyStatus>=3}">
          <li style="width:10px"><em class="Processyes">1</em><span style="width:60px;left:-22px;" class="c-green">申请试用</span></li>
        </c:if>


        <c:if test="${taskInstance.applyStatus<3}">
          <li style="width:20%" class=""><em class="">2</em><span class="">审核试客</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus>0}">
          <li style="width:20%" class="cur"><em class="Processyes">2</em><span class="c-green">审核试客</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus==0}">
          <c:if test="${taskInstance.applyStatus==3 || taskInstance.applyStatus==7 || taskInstance.applyStatus==10}">
            <li style="width:20%" class="cur"><em class="Processing">2</em><span class="c-yellow">审核试客</span></li>
          </c:if>
          <c:if test="${ taskInstance.awardgetStatus>0 }">
            <li style="width:20%" class="cur"><em class="Processyes">2</em><span class="c-green">审核试客</span></li>
          </c:if>
        </c:if>


        <c:if test="${taskInstance.awardgetStatus==0}">
          <li style="width:20%" class=""><em class="">3</em><span class="">下单付款</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus>0}">
          <c:if test="${taskInstance.awardgetStatus==14 || taskInstance.awardgetStatus==22 || taskInstance.awardgetStatus==32}"><li style="width:20%" class="cur"><em class="Processing">3</em><span class="c-yellow">下单付款</span></li></c:if>
          <c:if test="${(taskInstance.awardgetStatus>14 && taskInstance.awardgetStatus<20) || (taskInstance.awardgetStatus>=22 && taskInstance.awardgetStatus<30) || taskInstance.awardgetStatus>=32}"><li style="width:20%" class="cur"><em class="Processyes">3</em><span class="c-green">下单付款</span></li></c:if>
        </c:if>

        <c:if test="${taskInstance.awardgetStatus<91}">
          <li style="width:20%" class=""><em class="">4</em><span class="">收货好评</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus==91}">
          <li style="width:20%" class="cur"><em class="Processing">4</em><span class="c-yellow">收货好评</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus>91}">
          <li style="width:20%" class="cur"><em class="Processyes">4</em><span class="c-green">收货好评</span></li>
        </c:if>


        <c:if test="${taskInstance.awardgetStatus<92}">
          <li style="width:20%" class=""><em class="">5</em><span class="">平台返款</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus==92}">
          <li style="width:20%" class="cur"><em class="Processing">5</em><span class="c-yellow">平台返款</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus>92}">
          <li style="width:20%" class="cur"><em class="Processyes">5</em><span class="c-green">平台返款</span></li>
        </c:if>

        <c:if test="${taskInstance.awardgetStatus<93}">
          <li style="width:18%" class=""><em class="">6</em><span class="">完成任务</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus==93}">
          <li style="width:18%" class="cur"><em class="Processing">6</em><span class="c-yellow">完成任务</span></li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus>93}">
          <li style="width:18%" class="cur"><em class="Processyes">6</em><span class="c-green">完成任务</span></li>
        </c:if>

      </ul>
    </div>

  </div>
  <!--//头部-->
  <!--内容区-->
  <div class="scontent">
    <div class="task-l">
      <p>试用进度：
        申请试用</p>
      <p>下单渠道：<span>${task.mallPlatformId eq 1?"淘宝":"天猫"}</span>自然搜索 </p>
      <p>订单号：--<!--获得试用显示--></p>
      <p>买号：${taskInstance.wangWangId}</p>
      <p class="p1">支付金额：${task.productPrice}</p>
      <p>退款方式：平台退款</p>
      <p class="p2">退款金额：${task.productPrice}</p>
      <p class="p3">试用编号：${taskInstance.id}</p>
      <p>申请时间：<fmt:formatDate value="${taskInstance.applyTime}" pattern="yyyy-MM-dd HH:mm"/></p>
    </div>


    <div class="task-r clearfix">
        <c:if test="${taskInstance.applyStatus!=3&&taskInstance.applyStatus!=7&&taskInstance.applyStatus!=10}">
          <!--01第一天：开始申请-->
          <h4>任务状态：待试客搜索商品</h4>
          <c:if test="${taskInstance.awardgetStatus<90}"><P>试客需要在<fmt:formatDate value="${taskInstance.deadlineTime}" pattern="yyyy-MM-dd HH:mm"/>前提交试用申请</P></c:if>
        </c:if>
        <c:if test="${taskInstance.applyStatus==3||taskInstance.applyStatus==7||taskInstance.applyStatus==10}">
          <!--01第一天：开始申请-->
          <h4>任务状态: 等待处理</h4>
          <P>平台将在<fmt:formatDate value="${taskInstance.sysAwardgetDate}" pattern="yyyy-MM-dd HH:mm"/>进行抽奖</P>
        </c:if>

    </div>
  </div>
  <!--//内容区-->
</div>
<!--//wraptop-->


<!--任务进展内容展示模块-->
<div class="s-wrap clearfix">
  <div class="stit23">任务进展</div>
  <!--cc_box-->
  <div class="cc_box">
    <div class="cc_tit">
      <span class="span1">申请进度</span>
      <span class="span2">完成时间</span>
      <span class="span3">状态</span>
    </div>
  </div>
  <!--//cc_box-->

  <div class="Mline m1_line" style="margin-left:100px; margin-top:30px;">
    <ul>
      <!-- 正常申请开始(3天不同情况的流程) -->
      <!-- 第三天中奖 -->

      <!-- 申请开始 -->
      <!-- ------------------- 第一天开始 ----------------- -->

      <!--货比三家-->
      <c:if test="${taskInstance.applyStatus<1}">
        <c:if test="${taskInstance.applyStatus!=0}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_day cor999">第1天</i>
            <i class="type_tit cor999">货比三家</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
                <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==0}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_day red">第1天</i>
            <i class="type_tit red">货比三家</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中…</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=1}">
        <li class="h61 cur">
          <em class="emsy"></em>
          <i class="type_day red">第1天</i>
          <i class="type_tit red">货比三家</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step1Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc">
            <p class="icon-succ">试客已完成</p>
          </div>
        </li>
      </c:if>


      <!-- 核对商品 -->
      <c:if test="${taskInstance.applyStatus<2}">
        <c:if test="${taskInstance.applyStatus!=1}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_tit cor999">核对商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
                <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==1}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_tit red">核对商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中…</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=2 && not empty taskInstance.step2Time}">
        <li class="h61 cur" style="height:90px;">
          <em class="emsy"></em>
          <i class="type_tit red">核对商品</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step2Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc" style="height:65px;">
            <p class="icon-succ">试客已完成，链接如下：</p>
            <p class="pr"><span>${taskInstance.checkedProductUrl}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.checkedProductUrl}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_1" style="position: absolute; left: 304px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_1" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_1" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=1&amp;width=29&amp;height=19" wmode="transparent"></div></p>
          </div>
        </li>
      </c:if>



      <c:if test="${taskInstance.applyStatus<3}">
        <c:if test="${taskInstance.applyStatus!=2}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_tit cor999">放入购物车</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==2}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_tit red">放入购物车</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中…</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=3 && not empty taskInstance.step3Time}">
        <li class="h61 cur">
          <em class="emsy"></em>
          <i class="type_tit red">放入购物车</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step3Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc">
            <p class="icon-succ">试客已完成</p>
          </div>
        </li>
      </c:if>



      <c:if test="${taskInstance.applyStatus<4}">
        <c:if test="${taskInstance.applyStatus!=3}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_tit cor999">提交试用申请</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==3}">
          <li class="h61 cur">
            <em class="emsy"></em>
            <i class="type_tit red">提交试用申请</i>
            <i class="type_time"><fmt:formatDate value="${taskInstance.step4Time}" pattern="yyyy-MM-dd HH:mm"/></i>
            <div class="type_cc">
              <p class="icon_time">已提交试用申请，平台将在<fmt:formatDate value="${taskInstance.sysAwardgetDate}" pattern="yyyy-MM-dd HH:mm"/>进行抽奖</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=4}">
        <li class="h61 cur">
          <em class="emsy"></em>
          <i class="type_tit red">提交试用申请</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step4Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc">
            <p class="icon-succ">试客已提交，未获得试用资格，可继续申请试用</p>
          </div>
        </li>
      </c:if>



      <!-- 下面是第二天-->
     <c:if test="${taskInstance.awardgetStatus>0 && day==1}"><!--如果第一天就申请成功了-->
        <c:if test="${taskInstance.awardgetStatus==10}">
           <li class="h61">
             <em class="emsy"></em>
             <i class="type_day red" style="width:60px;left:-65px;">领取试用</i>
             <i class="type_tit red">找到商品</i>
             <i class="type_time cor999">--</i>
             <div class="type_cc">
               <p class="icon_time">进行中…</p>
             </div>
           </li>
        </c:if>
       <c:if test="${taskInstance.awardgetStatus>10}">
         <li class="h61 cur">
           <em class="emsy"></em>
           <i class="type_day red" style="width:60px;left:-65px;">领取试用</i>
           <i class="type_tit red">找到商品</i>
           <i class="type_time cor999">--</i>
           <div class="type_cc">
             <p class="icon-succ">试客已完成</p>
           </div>
         </li>
       </c:if>
     </c:if>

      <c:if test="${taskInstance.applyStatus<5 && taskInstance.awardgetStatus<1 }">
        <c:if test="${taskInstance.applyStatus!=4}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_day cor999">第2天</i>
            <i class="type_tit cor999">找到商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==4}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_day red">第2天</i>
            <i class="type_tit red">找到商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中…</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=5 && not empty taskInstance.step5Time}">
        <li class="h61 cur">
          <em class="emsy"></em>
          <i class="type_day red">第2天</i>
          <i class="type_tit red">找到商品</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step5Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc">
            <p class="icon-succ">试客已完成</p>
          </div>
        </li>
      </c:if>


      <!-------显示：第2天，分享商品--------->
      <c:if test="${taskInstance.applyStatus<6 || (taskInstance.awardgetStatus>0&&taskInstance.awardgetStatus<12)}">
        <c:if test="${taskInstance.applyStatus!=5 && taskInstance.awardgetStatus<11}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_tit cor999">分享商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==5 || taskInstance.awardgetStatus==11}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_tit red">分享商品</i>
            <i class="type_time red">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中...</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=6 || taskInstance.awardgetStatus>=12}">
        <li class="h61 cur" style="height:90px;">
          <em class="emsy"></em>
          <i class="type_tit red">分享商品</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step6Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc" style="height:65px;">
            <p class="icon-succ">试客已完成，链接如下：</p>
            <p class="pr"><span>${taskInstance.shareUrl}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.checkedProductUrl}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_1" style="position: absolute; left: 304px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_1" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_1" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=1&amp;width=29&amp;height=19" wmode="transparent"></div></p>
          </div>
        </li>
      </c:if>




      <c:if test="${taskInstance.applyStatus<7 || (taskInstance.awardgetStatus>0&&taskInstance.awardgetStatus<13)}">
        <c:if test="${taskInstance.applyStatus!=6 && taskInstance.awardgetStatus<12}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_tit cor999">收藏宝贝和店铺</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==6 || taskInstance.awardgetStatus==12}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_tit red">收藏宝贝和店铺</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中...</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=7 || taskInstance.awardgetStatus>=13}">
        <li class="h61 cur" style="height:130px;">
          <em class="emsy"></em>
          <i class="type_tit red">收藏宝贝和店铺</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step7Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc" style="height:110px;">
            <p class="icon-succ">试客已完成，截图如下：</p>
            <p class="mtb5"><img src="${taskInstance.collectProductScreenshotUrl}" width="50" height="35" alt="pic" style="vertical-align:middle;"><a class="c-blue" target="_blank" href="${taskInstance.collectProductScreenshotUrl}">点击查看收藏商品截图 &gt;</a></p>
            <p class="mtb5"><img src="${taskInstance.collectShopScreenshotUrl}" width="50" height="35" alt="pic" style="vertical-align:middle;"><a class="c-blue" target="_blank" href="${taskInstance.collectShopScreenshotUrl}">点击查收藏店铺截图 &gt;</a></p>
          </div>
        </li>
      </c:if>




      <c:if test="${taskInstance.applyStatus<8 && taskInstance.awardgetStatus<1}">
        <c:if test="${taskInstance.applyStatus!=7}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_tit cor999">提交试用申请</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==7}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_tit red">提交试用申请</i>
            <i class="type_time"><fmt:formatDate value="${taskInstance.step8Time}" pattern="yyyy-MM-dd HH:mm"/></i>
            <div class="type_cc">
              <p class="icon_time">已提交试用申请，平台将在<fmt:formatDate value="${taskInstance.sysAwardgetDate}" pattern="yyyy-MM-dd HH:mm"/>进行抽奖</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=8 && not empty taskInstance.step8Time}">
        <li class="h61 cur">
          <em class="emsy"></em>
          <i class="type_tit red">提交试用申请</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step8Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc">
            <p class="icon-succ">试客已提交，未获得试用资格，可继续申请试用</p>
          </div>
        </li>
      </c:if>






      <!-- -----------------第三天------------------------->

      <c:if test="${taskInstance.awardgetStatus>0 && day==2}"><!--如果第二天就申请成功了-->
        <c:if test="${taskInstance.awardgetStatus==20}"><!--插入显示-->
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_day red" style="width:60px;left:-65px;">领取试用</i>
            <i class="type_tit red">找到商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中…</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus>20}">
          <li class="h61 cur">
            <em class="emsy"></em>
            <i class="type_day red" style="width:60px;left:-65px;">领取试用</i>
            <i class="type_tit red">找到商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon-succ">试客已完成</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <!--显示“第三天，找到商品”-->
      <c:if test="${taskInstance.applyStatus<9 && taskInstance.awardgetStatus<1}">
        <c:if test="${taskInstance.applyStatus!=8}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_day cor999">第3天</i>
            <i class="type_tit cor999">找到商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==8}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_day red">第3天</i>
            <i class="type_tit red">找到商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中...</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=9 && not empty taskInstance.step9Time}">
        <li class="h61 cur">
          <em class="emsy"></em>
          <i class="type_day red">第3天</i>
          <i class="type_tit red">找到商品</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step9Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc">
            <p class="icon-succ">试客已完成</p>
          </div>
        </li>
      </c:if>



      <!--显示“第三天，浏览店铺”-->
      <c:if test="${taskInstance.applyStatus<10 && taskInstance.awardgetStatus<1}">
        <c:if test="${taskInstance.applyStatus!=9}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_tit cor999">浏览店铺</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==9}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_tit red">浏览店铺</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon_time">进行中...</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=10 && not empty taskInstance.step10Time}">
        <li class="h61 cur" style="height:142px;">
          <em class="emsy"></em>
          <i class="type_tit red">浏览店铺</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step10Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc" style="height:120px;">
            <p class="icon-succ">试客已完成，链接如下：</p>
            <p class="pr">1、<span>${taskInstance.ortherUrl1}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.ortherUrl1}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_3" style="position: absolute; left: 326px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_3" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_3" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=3&amp;width=29&amp;height=19" wmode="transparent"></div></p>
            <p class="pr">2、<span>${taskInstance.ortherUrl2}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.ortherUrl2}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_4" style="position: absolute; left: 326px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_4" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_4" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=4&amp;width=29&amp;height=19" wmode="transparent"></div></p>
            <p class="pr">3、<span>${taskInstance.ortherUrl3}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.ortherUrl3}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_5" style="position: absolute; left: 326px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_5" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_5" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=5&amp;width=29&amp;height=19" wmode="transparent"></div></p>
            <p class="pr">4、<span>${taskInstance.ortherUrl4}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.ortherUrl4}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_6" style="position: absolute; left: 326px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_6" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_6" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=6&amp;width=29&amp;height=19" wmode="transparent"></div></p>
          </div>
        </li>
      </c:if>

      <!--显示“第三天，提交试用申请”-->
      <c:if test="${taskInstance.applyStatus<11 && taskInstance.awardgetStatus<1}">
        <c:if test="${taskInstance.applyStatus<10}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_tit cor999">提交试用申请</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
        </c:if>
        <c:if test="${taskInstance.applyStatus==10}">
          <li class="h61">
            <em class="emsy"></em>
            <i class="type_tit red">提交试用申请</i>
            <i class="type_time"><fmt:formatDate value="${taskInstance.step10Time}" pattern="yyyy-MM-dd HH:mm"/></i>
            <div class="type_cc">
              <p class="icon-time">已提交试用申请，平台将在<fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/>进行抽奖</p>
            </div>
          </li>
        </c:if>
      </c:if>
      <c:if test="${taskInstance.applyStatus>=11}">
        <li class="h61 cur">
          <em class="emsy"></em>
          <i class="type_tit red">提交试用申请</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step11Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc">
            <p class="icon-succ">试客已完成</p>
          </div>
        </li>
      </c:if>
      <!-- 申请结束 -->

      <!-------------------------领取宝贝开始-------------------------------->
      <c:if test="${taskInstance.awardgetStatus<1}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_day cor999" style="width:60px;left:-65px;">领取试用</i>
          <i class="type_tit cor999">找到商品</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="pl24">未完成</p>
          </div>
        </li>
      </c:if>
      <c:if test="${taskInstance.awardgetStatus>0 && day==3}"><!--如果第三天就申请成功了-->
        <c:if test="${taskInstance.awardgetStatus==30}"><!--插入显示-->
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_day red" style="width:60px;left:-65px;">领取试用</i>
          <i class="type_tit red">找到商品</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon_time">进行中…</p>
          </div>
        </li>
        </c:if>
        <c:if test="${taskInstance.awardgetStatus>30}">
          <li class="h61 cur">
            <em class="emsy"></em>
            <i class="type_day red" style="width:60px;left:-65px;">领取试用</i>
            <i class="type_tit red">找到商品</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="icon-succ">试客已完成</p>
            </div>
          </li>
        </c:if>
      </c:if>

      <!--显示客服聊天-->
      <c:if test="${taskInstance.awardgetStatus<13 || (taskInstance.awardgetStatus>=20 && taskInstance.awardgetStatus<21) || (taskInstance.awardgetStatus>=30 && taskInstance.awardgetStatus<31)}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_tit cor999" style="width:128px;">${(taskInstance.awardgetStatus>0 && day <3)?'浏览店铺及':''}客服聊天</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="pl24">未完成</p>
          </div>
        </li>
      </c:if>
      <c:if test="${taskInstance.awardgetStatus==13 || taskInstance.awardgetStatus==21 || taskInstance.awardgetStatus==31}">
        <li class="h61">
          <em class="emsy"></em>
          <i class="type_tit red" style="width:128px;">${empty taskInstance.step10Time?'浏览店铺及':''}客服聊天</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon_time">进行中…</p>
          </div>
        </li>
      </c:if>
      <c:if test="${(taskInstance.awardgetStatus>13&&taskInstance.awardgetStatus<20) || (taskInstance.awardgetStatus>21&&taskInstance.awardgetStatus<30) || taskInstance.awardgetStatus>31}">
        <li class="h61 cur" style="height:200px;">
          <em class="emsy"></em>
          <i class="type_tit red" style="width:128px;">${empty taskInstance.step10Time?'浏览店铺及':''}客服聊天</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step13Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc" style="height:180px;">

            <c:if test="${taskInstance.applyStatus>=30}" >
              <p class="icon-succ">试客已完成，链接如下：</p>
              <p class="pr">1、<span>${taskInstance.shopProductUrl1}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.shopProductUrl1}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_3" style="position: absolute; left: 326px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_3" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_3" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=3&amp;width=29&amp;height=19" wmode="transparent"></div></p>
              <p class="pr">2、<span>${taskInstance.shopProductUrl2}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.shopProductUrl2}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_4" style="position: absolute; left: 326px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_4" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_4" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=4&amp;width=29&amp;height=19" wmode="transparent"></div></p>
              <p class="pr">3、<span>${taskInstance.shopProductUrl3}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.shopProductUrl3}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_5" style="position: absolute; left: 326px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_5" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_5" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=5&amp;width=29&amp;height=19" wmode="transparent"></div></p>
              <p class="pr">4、<span>${taskInstance.shopProductUrl4}</span> <a class="J_copytext c-blue" data-copy="${taskInstance.shopProductUrl4}" href="javascript:;">复制</a><div class="zclip" id="zclip-ZeroClipboardMovie_6" style="position: absolute; left: 326px; top: 3px; width: 29px; height: 19px; z-index: 99;"><embed id="ZeroClipboardMovie_6" src="/static/js/ZeroClipboard.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="29" height="19" name="ZeroClipboardMovie_6" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=6&amp;width=29&amp;height=19" wmode="transparent"></div></p>
            </c:if>
            <p class="icon-succ">试客已完成，截图如下：</p>
            <p class="mtb5"><img src="${taskInstance.chatWithCustomServiceScreenshotUrl}" width="50" height="35" alt="pic" style="vertical-align:middle;"><a href="${taskInstance.chatWithCustomServiceScreenshotUrl}" class="c-blue" target="_blank">点击客服聊天截图 &gt;</a></p>
          </div>
        </li>
      </c:if>


      <!--显示下单付款-->
      <c:if test="${taskInstance.awardgetStatus<14 || (taskInstance.awardgetStatus>=20 && taskInstance.awardgetStatus<22) || (taskInstance.awardgetStatus>=30 && taskInstance.awardgetStatus<32)}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_tit cor999">下单付款</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="pl24">未完成</p>
          </div>
        </li>
      </c:if>
      <c:if test="${taskInstance.awardgetStatus==14 || taskInstance.awardgetStatus==22 || taskInstance.awardgetStatus==32}">
        <li class="h61">
          <em class="emsy"></em>
          <i class="type_tit red">下单付款</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon_time">进行中…</p>
          </div>
        </li>
      </c:if>
      <c:if test="${(taskInstance.awardgetStatus>14&&taskInstance.awardgetStatus<20) || (taskInstance.awardgetStatus>22&&taskInstance.awardgetStatus<30) || taskInstance.awardgetStatus>32}">
        <li class="h61 cur" style="height:105px;">
          <em class="emsy"></em>
          <i class="type_tit red">下单付款</i>
          <i class="type_time"><fmt:formatDate value="${taskInstance.step14Time}" pattern="yyyy-MM-dd HH:mm"/></i>
          <div class="type_cc" style="height:90px;">
            <p class="icon-succ">试客已完成，截图如下：</p>
            <p>订单号：<i class="red">${taskInstance.orderId}</i>，付款金额：<i class="red">${taskInstance.realProductPrice}</i>元</p>
            <p class="mtb5"><img src="${taskInstance.succedOrderScreenshotUrl}" width="50" height="35" alt="pic" style="vertical-align:middle;"><a class="c-blue" target="_blank" href="${taskInstance.succedOrderScreenshotUrl}">点击查看订单信息截图 &gt;</a></p>
          </div>
        </li>
      </c:if>
      <!--显示下单付款-->




      <!-- 第三天中奖,领取宝贝结束 -->

      <!------------------------商家发货------------------------>
      <c:if test="${taskInstance.awardgetStatus<15 || (taskInstance.awardgetStatus>20&&taskInstance.awardgetStatus<23) || (taskInstance.awardgetStatus>30&&taskInstance.awardgetStatus<33)}">
          <li class="h61">
            <em class="emdis"></em>
            <i class="type_day cor999" style="width:60px;left:-65px;">获取试用</i>
            <i class="type_tit cor999">商家发货</i>
            <i class="type_time cor999">--</i>
            <div class="type_cc">
              <p class="pl24">未完成</p>
            </div>
          </li>
      </c:if>
      <c:if test="${taskInstance.awardgetStatus==15 || taskInstance.awardgetStatus==23 || taskInstance.awardgetStatus==33}">
        <li class="h61">
          <em class="emsy"></em>
          <i class="type_day red" style="width:60px;left:-65px;">获取试用</i>
          <i class="type_tit red">商家发货</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon_time">进行中…</p>
          </div>
        </li>
      </c:if>
      <c:if test="${(taskInstance.awardgetStatus>15&&taskInstance.awardgetStatus<20) || (taskInstance.awardgetStatus>25&&taskInstance.awardgetStatus<30) || (taskInstance.awardgetStatus>35&&taskInstance.awardgetStatus<40)}">
        <li class="h61">
          <em class="emsy cur"></em>
          <i class="type_day red" style="width:60px;left:-65px;">获取试用</i>
          <i class="type_tit red">商家发货</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon-succ">商家确认金额并已发货</p>
          </div>
        </li>
      </c:if>



      <!------------------------收货好评------------------------>
      <c:if test="${taskInstance.awardgetStatus<16 || (taskInstance.awardgetStatus>20&&taskInstance.awardgetStatus<26) || (taskInstance.awardgetStatus>30&&taskInstance.awardgetStatus<36)}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_tit cor999">收货好评</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="pl24">未完成</p>
          </div>
        </li>
      </c:if>
      <c:if test="${taskInstance.awardgetStatus==16 || taskInstance.awardgetStatus==26 || taskInstance.awardgetStatus==36}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_tit red">收货好评</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon_time">进行中…</p>
          </div>
        </li>
      </c:if>
      <c:if test="${(taskInstance.awardgetStatus>16&&taskInstance.awardgetStatus<20) || (taskInstance.awardgetStatus>26&&taskInstance.awardgetStatus<30) || (taskInstance.awardgetStatus>36&&taskInstance.awardgetStatus<40)}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_tit red">收货好评</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon-succ">试客已收货并发表好评：${taskInstance.productComment}</p>
          </div>
        </li>
      </c:if>


      <c:if test="${taskInstance.awardgetStatus<17 || (taskInstance.awardgetStatus>20&&taskInstance.awardgetStatus<27) || (taskInstance.awardgetStatus>30&&taskInstance.awardgetStatus<37)}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_tit cor999">返还本金</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="pl24">未完成</p>
          </div>
        </li>
      </c:if>
      <c:if test="${taskInstance.awardgetStatus==17 || taskInstance.awardgetStatus==27 || taskInstance.awardgetStatus==37}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_tit red">返还本金</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon_time">进行中…</p>
          </div>
        </li>
      </c:if>
      <c:if test="${(taskInstance.awardgetStatus>17&&taskInstance.awardgetStatus<20) || (taskInstance.awardgetStatus>27&&taskInstance.awardgetStatus<30) || (taskInstance.awardgetStatus>37&&taskInstance.awardgetStatus<40)}">
        <li class="h61">
          <em class="emdis"></em>
          <i class="type_tit red">返还本金</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon-succ">已完成</p>
          </div>
        </li>
      </c:if>



      <c:if test="${taskInstance.awardgetStatus<93}">
        <li class="h61" style="background:none; border-bottom: none">
          <em class="emdis"></em>
          <i class="type_tit cor999">完成试用</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="pl24">未完成</p>
          </div>
        </li>
      </c:if>
      <c:if test="${taskInstance.awardgetStatus==93}">
        <li class="h61" style="background:none; border-bottom: none">
          <em class="emdis"></em>
          <i class="type_tit red">完成试用</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon_time">进行中…</p>
          </div>
        </li>
      </c:if>
      <c:if test="${taskInstance.awardgetStatus>93}">
        <li class="h61" style="background:none; border-bottom: none">
          <em class="emdis"></em>
          <i class="type_tit red">完成试用</i>
          <i class="type_time cor999">--</i>
          <div class="type_cc">
            <p class="icon-succ icon_time">已完成</p>
          </div>
        </li>
      </c:if>



    </ul>
  </div>

</div>
<!--//任务进展内容展示模块-->

<!--wrapproduct-->
<div class="s-wrap mb35 clearfix">
  <div class="stit23">试用商品</div>
  <div class="table-box">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <thead>
      <tr class="trbg">
        <th width="55%">商品</th>
        <th width="20%">单价（元）</th>
        <th width="15%">数量</th>
        <th width="10%">运费（元）</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td><img src="${task.productPictureUrl}" width="40" height="40" alt="pic" style="vertical-align:middle;" /> ${task.productName}</td>
        <td><p class="c-red">${task.productPrice}</p></td>
        <td>1</td>
        <td>包邮</td>
      </tr>
      </tbody>
    </table>
  </div>
  <div class="table-box-but">押金：<span class="c-red">1</span>金币 试客实付款：
    <span class="c-red f-font-w">${empty taskInstance.realProductPrice?'待付款':'已付款'}</span>
  </div>
</div>
<!--//wrapproduct-->

<script>
  $(function(){
    // alert(3);
    var show_contents = $('.icon_time').parent().prev().prev().html();
    var h4 = $('.task-r h4');
    if(show_contents){
      h4.html('任务状态: '+show_contents);
    }else{
      h4.html('任务状态: 等待处理');
    }
    // alert(show_contents);
  });
</script>

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