<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>商家选择会员等级</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link rel="stylesheet" href="/static/css/main.css" />
  <link rel="stylesheet" href="/static/css/common.css" />
</head>
<body>
<div id="header"><h2>易试用</h2></div>
<div id="main">
  <div class="business-top">
    <h3>选择商家等级</h3>
    <div class="Process">
      <ul class="clearfix">
        <li class="cur" style="width:50%"><em class="Processyes">1<i></i></em><span class="c-green">填写注册信息</span><strong></strong></li>
        <li class="" style="width:50%"><em class="Processing">2<i></i></em><span class="c-yellow">选择会员类型</span><strong></strong></li>
        <li class="Processlast" style="width:82px;"><em class="">3<i></i></em><span class="">绑定店铺</span><strong></strong></li>
      </ul>
    </div>
  </div>
  <div class="business-grade">
    <table>
      <tr>
        <th width="20%" class="borderl">权限</th>
        <th width="35%"><span class="f20">体验商家</span><br />免费</th>
        <th width="45%" class="borderb"><div class="f22 red business-grade-icon">VIP商家</div><div class="f14"><span class="f16 red">2688</span>元/年</div></th>
      </tr>
      <tr>
        <td class="borderl">发布任务次数</td>
        <td>最多<span class="red">3</span>次</td>
        <td class="borderb"><span class="red">不限</span>次数</td>
      </tr>
      <tr>
        <td class="borderl">任务服务费</td>
        <td><span class="red">388</span>元/次</td>
        <td class="borderb">发布任务<span class="red">无需缴纳</span>服务费</td>
      </tr>
      <tr>
        <td class="borderl">试用商品数量</td>
        <td>每次试用最多可发布<span class="red">50</span>件商品</td>
        <td class="borderb">每次试用最多可发布<span class="red">1000</span>件商品</td>
      </tr>
      <!-- <tr>
          <td>查找试用商品途径</td>
          <td>只能通过单个关键字引流</td>
          <td>支持多渠道、多关键字引流</td>
      </tr> -->
      <tr>
        <td class="borderl">平台退款手续费</td>
        <td>试用商品总金额的<span class="red">2</span>%</td>
        <td>试用商品总金额的<span class="red">0.6</span>%</td>
      </tr>
      <tr>
        <td class="borderl">试用担保金</td>
        <td>试用商品总金额的<span class="red">10</span>%</td>
        <td class="borderb">试用商品总金额的<span class="red">5</span>%</td>
      </tr>
      <tr>
        <td class="borderl">查找试用商品途径</td>
        <td>只能通过单个关键字引流</td>
        <td class="borderb">支持多渠道、多关键字引流<br /><div class="f14">（多渠道：<span class="red">微博、U站等</span>）</div></td>
      </tr>
      <tr>
        <td class="borderl borderb"></td>
        <td class="borderb"><a href="/register/business?type=2" class="experience">注册体验商家</a></td>
        <td class="borderr borderb"><a href="/business/buy_vip" class="vip-business">开通VIP商家</a></td>
      </tr>
    </table>
  </div>
</div>
<!--footer-->
<jsp:include page="/include/footer.jsp" />
</html>