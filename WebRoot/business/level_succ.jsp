<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>商家注册成功</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link rel="stylesheet" href="/static/css/main.css" />
  <link rel="stylesheet" href="/static/css/common.css" />
</head>
<body onLoad="count();">
<div id="header"><h2>易试用</h2></div>
<div id="main">
  <div class="business-top">
    <h3>注册成功</h3>
    <div class="Process">
      <ul class="clearfix">
        <li class="cur" style="width:50%"><em class="Processyes">1<i></i></em><span class="c-green">填写注册信息</span><strong></strong></li>
        <li class="cur" style="width:50%"><em class="Processyes">2<i></i></em><span class="c-green">选择会员类型</span><strong></strong></li>
        <li class="Processlast" style="width:82px;"><em class="Processing">3<i></i></em><span class="c-yellow">绑定店铺</span><strong></strong></li>
      </ul>
    </div>

  </div>
  <div class="register">
    <div class="business_succ_box">
      <h4>您已经成功注册成为<span class="red">体验商家</span>，绑定店铺待客服审核通过后可发布试用</h4>

      <p><a href="/business/shoping_binding">点击前去绑定店铺 ></a><span id="time" class="red">5</span>秒钟后，将自动跳转至绑定店铺</p>
    </div>
  </div>
</div>
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
  <p>Copyright © 2015 zhongguohuo.com 版权所有 沪ICP备07009935号</p>
</div>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
<script type="text/javascript">

  //账号注册成功 5秒后自动跳转
  var start = 5;
  var step = -1;
  function count()
  {
    document.getElementById("time").innerHTML = start;
    start += step;
    if(start < 0)
      location.href = "/business/shoping_binding";
    setTimeout("count()",1000);
  };

</script>
</body>
</html>