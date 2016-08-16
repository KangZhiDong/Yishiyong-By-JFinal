<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>购买续费VIP</title>
  <link href="/static/css/vip-user.css" rel="stylesheet" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/js/common.js"></script>
  <script type="text/javascript" src="/static/js/vip-user.js"></script>
</head>
<body>
<!-- <div id="header"><h2>琳琅国货</h2></div>
 -->


<div class="nav-top">
  <div class="wrap">
    <div class="wrap-left">

      <a href="/member">vipshike</a> | <a href="/logout">退出</a>
    </div>

    <div class="wrap-right">

      <!--试客登录-->
      <a href="/buyer/pay_gold" target="_self">充值金币</a> |
      <a href="/buyer/buy_vip">续费会员</a>
      <a href="/tips/index">提醒(<span class="red">0</span>)</a>
      <a href="/test/index_m">帮助中心</a>

    </div>

  </div>
</div>
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

      <!--试客登录-->
      <li style="float:right;"><a href="/buyer/award" class="nav-img">继续申请(0)</a></li>
      <li style="float:right;"><a href="/buyer/awardget" class="nav-img">中奖了(0)</a></li>

    </ul>
  </div>
</div><div class="sbreadcrumbs">
  <a href="/">首页</a> > <a>购买会员</a>
</div>
<div id="main">
  <!--<div class="mai-top">
      <h3>商家续费VIP</h3>
      <!-- <h3>体验商家升级为VIP商家</h3>
      <div class="member-upgrade-top">琳琅账号：<span class="red">vipshike</span>，当前为
                          <span class="red business-vip-no">体验商家商家</span>会员有效时间已过
                  </div>
  </div>-->

  <!-- 试客续费VIP显示 -->
  <div class="mai-top">
    <h3>试客续费VIP</h3>

    <!-- <span class="sp3">已过期会员</span> -->
    <div class="member-upgrade-top">琳琅账号：<span class="red">vipshike</span>，当前为<span class="red">VIP试客</span>，会员有效时间已过期</div>
  </div>




  <form id="renewal_vip" action="?" method="post" target="_blank">

    <div class="business-vip clearfix">
      <h3 class="f18">1.请选择开通时长</h3>
      <div class="radiolist">
        <label class="f-mr14"><input type="radio" name="pay_time" value="12" data-k="12" checked="checked"> 1年 <span class="list_s1">12</span>元<i class="cor999">(送12金币)</i></label>
        <label class="f-mr14"><input type="radio" name="pay_time" value="24" data-k="24"> 2年 <span class="list_s1">24</span>元<i class="cor999">(送24金币) - </i> <i style="color:red">推荐</i></label>
        <label class="f-mr14"><input type="radio" name="pay_time" value="36" data-k="36"> 3年 <span class="list_s1">36</span>元<i class="cor999">(送36金币)</i></label>
      </div>
      <div class="payres">
        <span>您已选择 续费VIP试客</span> <strong class="red J_type">12</strong>个月，有效期至：<strong class="red" id="J_date_limit" y="1970-01-01">--</strong>
        <span class="f18 fr">需支付：<strong class="red J_price_to_pay J_payVal">0</strong>元</span>
      </div>

      <h3 class="f18">2.请选择支付方式<span class="pointinfo f-s2">当前金币足够支付，若需要使用网银支付方式，请先取消选择使用金币支付</span></h3>
      <!--<div class="pay-des J_mainpay J_pay_cut disabled">
          <label><input type="checkbox" name="money" value="0.00" class="J_pay_cut_check" disabled="disabled">使用押金支付   (可用押金：<em class="money">0.00</em>元)</label>
          <span class="fr">支付：<em data-enable="0.00" class="J_pay_cut_price J_money">0</em>元</span>
      </div>-->
      <!--         <div class="pay-des J_mainpay J_pay_cut disabled">
                  <label><input type="checkbox" name="gold" value="2.00" class="J_pay_cut_check" disabled="disabled">使用金币支付   (可用金币：<em class="gold">2.00</em>点)  1点 ＝ 1元</label><span class="fr">支付：<em data-enable="2.00" class="J_pay_cut_price J_gold">0</em>点</span>
              </div>   -->
      <div class="pay-des  J_ac_other J_cardlist active">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">工商银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="2">使用<span class="red">工商银行</span>支付</label>
        <a class="business-vip-arrange-down-gray J_showmoreacother normal">共有9个网银支付方式，点击选择</a>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des  J_ac_other J_cardlist none">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">建设银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="3">使用<span class="red">建设银行</span>支付</label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des  J_ac_other J_cardlist none">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">交通银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="1">使用<span class="red">交通银行</span>支付<span class="f-pl5">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des  J_ac_other J_cardlist none">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">兴业银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="1">使用<span class="red">兴业银行</span>支付<span class="f-pl5">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des  J_ac_other J_cardlist none">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">中信银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="1">使用<span class="red">中信银行</span>支付<span class="f-pl5">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>

      <div class="pay-des  J_ac_other J_cardlist none">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">农业银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="1">使用<span class="red">农业银行</span>支付<span class="f-pl5">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des  J_ac_other J_cardlist none">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">民生银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="1">使用<span class="red">民生银行</span>支付<span class="f-pl5">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des  J_ac_other J_cardlist none">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">招商银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="1">使用<span class="red">招商银行</span>支付<span class="f-pl5">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des  J_ac_other J_cardlist none">
        <label class="dis"><input type="radio" disabled="">使用<span class="red">邮政银行</span>支付</label>
        <label class="normal"><input type="radio" name="pay_id" value="1">使用<span class="red">邮政银行</span>支付<span class="f-pl5">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>






      <div class="btn-box tc pr">
        <a class="buttons-vip-confirm buttons"></a>
      </div>
    </div>
  </form>
</div>

<!--popup-->
<div class="business-popup-under"></div>
<div id="payto2" style="display: none;">
  <h3><a href="javascript:;"></a>请到打开的新窗口进行银行卡支付：</h3>
  <p><strong>支付小贴士：</strong></p>
  <p>
    1. 付款未完成前请不要关闭本页面，您在银行端完成付款后本页面会自动刷新。<br>
    2. 如果银行页面没有打开，请您设置您的浏览器为允许弹出，并确保已经安装了银行的 ActiveX 安全控件，
    然后点击下面的“返回支付页面，重新选择”按钮，重新支付。
  </p>
  <p class="btn">
    <a class="autobtn" href="#"><span>已完成付款</span></a>
    <a class="nook" href="javascript:void(0);">返回重新选择付款方式</a>
  </p>
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
  <p>Copyright © 2015 zhongguohuo.com 版权所有 浙ICP备09002461号-1</p>
</div>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
<script type="text/javascript">
  $(function(){

    //选择开通时间
    $('.radiolist label').click(function(){
      var datak = $(this).children("input").attr("data-k");
      var gold  = $(".gold").html();
      var money = $(".money").html();
      if(parseFloat(datak) < (parseFloat(gold) + parseFloat(money))){
        $(".pointinfo").show();
      }else{
        $(".pointinfo").hide();
      }
    })

    $('.buttons-vip-confirm').click(function(e){

      //提交表单数据
      $("#renewal_vip").submit();

      //支付成功弹出层
      if($('input[name="pay_id"]:checked').val()){
        var $payto2 = $("#payto2"),$payto2hieght = $payto2.outerHeight() / 2;
        $('.business-popup-under').css({height:$(document).height()}).fadeIn(200);
        $payto2.css({'marginTop': "-" + $payto2hieght + 'px'}).fadeIn(200);

        //绑定支付成功层a标签点击事件
        $payto2.find("a").click(function(e){
          if($(this).index() == 0){
            window.location = "/member";
          }else{
            $('.business-popup-under').fadeOut(200);
            $payto2.fadeOut(200);
          }
        })
      }
    })


  });
</script>
</body>
</html>