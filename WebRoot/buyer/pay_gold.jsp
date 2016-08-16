<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>购买简试用币</title>
  <link rel="stylesheet" href="/static/css/main.css" />
  <link rel="stylesheet" href="/static/css/common.css" />
  <link rel="stylesheet" href="/static/css/vip-user.css"/>
  <script language="javascript" src="/static/js/jquery-1.8.3.min.js"></script>
  <script language="javascript" src="/static/js/vip-renew.js"></script>
  <script language="javascript" src="/static/js/issuetask.js"></script>
</head>
<body>



<div class="nav-top">
  <div class="wrap">
    <div class="wrap-left">

      <a href="/member">coolcooldee</a> | <a href="/logout">退出</a>
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
</div>
<form id="pay_gold" action="?" method="post" target="_blank">
  <input type="hidden" name="gold" value="" />
  <div id="main" style="min-height:500px;">
    <div class="crumbs"><h3>购买琳琅金币</h3></div>
    <div class="purchase member-upgrade">
      <h1>1.选择琳琅金币数量</h1>
      <div class="business-buyrqf-state">
        <div class="open" gold="50" text="50琳琅金币">
          <div class="inner">
            <h3>50琳琅金币</h3>
            <em class="J_pay">50元</em>
          </div>
          <b></b>
        </div>
        <div class="open active" gold="100" text="100琳琅金币">
          <div class="inner">
            <h3>100琳琅金币</h3>
            <em class="J_pay">100元</em>
          </div>
          <b></b>
        </div>
        <div class="open" gold="300" text="300琳琅金币">
          <div class="inner">
            <h3>300琳琅金币</h3>
            <em class="J_pay">300元</em>
          </div>
          <b></b>
        </div>
        <div class="open" gold="500" text="500琳琅金币">
          <div class="inner">
            <h3>500琳琅金币</h3>
            <em class="J_pay">500元</em>
          </div>
          <b></b>
        </div>
        <div class="open" gold="1000" text="1000琳琅金币">
          <div class="inner">
            <h3>1000琳琅金币</h3>
            <em class="J_pay">1000元</em>
          </div>
          <b></b>
        </div>
      </div>
      <div class="payres">
        您已选择购买<i class="J_typename red"></i>
        <span class="fr font-bold">需支付：<strong class="red J_payVal">0</strong>元</span>
      </div>
      <h1>2.选择支付方式</h1>
      <!-- <div class="pay-des J_mainpay J_pay_cut">
          <label><input type="checkbox"  name="money" value="0.00" class="J_pay_cut_check" />使用押金支付   (可用押金：<em class="money">0.00</em>元)</label>
          <span class="fr">支付：<em data-enable="0.00" class="J_pay_cut_price J_money">0.00</em>元</span>
      </div> -->

      <div class="pay-des J_ac_other J_cardlist">
        <label class="dis"><input type="radio" disabled />使用<span class="red">工商银行</span>支付</label>

        <label class="normal" ><input type="radio" name="pay_id" value="2" />使用<span class="font_red">工商银行</span>支付<span style="padding-left:5px; color:#999;">(快钱账号)</span></label>
        <a class="business-vip-arrange-down-gray J_showmoreacother normal">共有8个网银支付方式，点击选择</a>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des J_ac_other J_cardlist ac-other">
        <label class="dis"><input type="radio" disabled />使用<span class="red">农业银行</span>支付</label>

        <label class="normal" ><input type="radio" name="pay_id" value="2" />使用<span class="font_red">农业银行</span>支付<span style="padding-left:5px; color:#999;">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des J_ac_other J_cardlist ac-other">
        <label class="dis"><input type="radio" disabled />使用<span class="red">招商银行</span>支付</label>

        <label class="normal" ><input type="radio" name="pay_id" value="2" />使用<span class="font_red">招商银行</span>支付<span style="padding-left:5px; color:#999;">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des J_ac_other J_cardlist ac-other">
        <label class="dis"><input type="radio" disabled />使用<span class="red">建设银行</span>支付</label>

        <label class="normal" ><input type="radio" name="pay_id" value="2" />使用<span class="font_red">建设银行</span>支付<span style="padding-left:5px; color:#999;">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des J_ac_other J_cardlist ac-other">
        <label class="dis"><input type="radio" disabled />使用<span class="red">兴业银行</span>支付</label>

        <label class="normal" ><input type="radio" name="pay_id" value="2" />使用<span class="font_red">兴业银行</span>支付<span style="padding-left:5px; color:#999;">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des J_ac_other J_cardlist ac-other">
        <label class="dis"><input type="radio" disabled />使用<span class="red">中信银行</span>支付</label>

        <label class="normal" ><input type="radio" name="pay_id" value="2" />使用<span class="font_red">中信银行</span>支付<span style="padding-left:5px; color:#999;">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des J_ac_other J_cardlist ac-other">
        <label class="dis"><input type="radio" disabled />使用<span class="red">浦发银行</span>支付</label>

        <label class="normal" ><input type="radio" name="pay_id" value="2" />使用<span class="font_red">浦发银行</span>支付<span style="padding-left:5px; color:#999;">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>
      <div class="pay-des J_ac_other J_cardlist ac-other">
        <label class="dis"><input type="radio" disabled />使用<span class="red">广发银行</span>支付</label>

        <label class="normal" ><input type="radio" name="pay_id" value="2" />使用<span class="font_red">广发银行</span>支付<span style="padding-left:5px; color:#999;">(快钱账号)</span></label>
        <span class="fr">支付：<em class="J_pay_cut_res">0</em>元</span>
      </div>


      <div class="btn-box tc"><a class="buttons-vip-confirm buttons"></a></div>

    </div>

  </div>
</form>
<div class="business-popup-under"></div>
<div id="payto2" style="display: none;">
  <h3><a href="javascript:;"></a> 请到打开的新窗口进行银行卡支付：</h3>
  <p><strong>支付小贴士：</strong></p>
  <p>
    1. 付款未完成前请不要关闭本页面，您在银行端完成付款后本页面会自动刷新。<br />
    2. 如果银行页面没有打开，请您设置您的浏览器为允许弹出，并确保已经安装了银行的 ActiveX 安全控件，
    然后点击下面的"返回支付页面，重新选择"按钮，重新支付。
  </p>
  <p class="btn">
    <a class="autobtn" href="javascript:;"><span>已完成付款</span></a>
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

    //提交按钮事件
    $('.buttons').click(function(e){
      if($('.open.active').length==0){
        alert('请先选择琳琅金币!');
        return false;
      }

      if(PayEnd>0 && $('.J_cardlist input[name="pay_id"]:checked').length<1){
        alert('支付总额不足!');
        return false;
      }

      //提交表单数据
      $("#pay_gold").submit();

      //如果选择银行支付
      if($('input[name="pay_id"]:checked').val()){
        var $payto2 = $("#payto2"),$payto2hieght = $payto2.outerHeight()/2;
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