<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>试客绑定买号</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <link href="/static/css/binding.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/common.js"></script>
  <style type="text/css">
    .userbigimg{position:relative; z-index:999; border:5px solid #F2F2F2; left:-352px; top:-350px; width:601px; height:440px; overflow:hidden; background:#fff;}
    .userbigimg a{width:20px; height:20px; display:inline-block; float:right; color:#555;}
    .userminimg{width:155px; height:45px; float:left; position:absolute; margin-left:500px;}
    .userminimg a{height:45px; line-height:45px; float:right; display:inline-block; color:#1F9CD8; font-weight:bold; font-size:14px;}
  </style>
</head>
<body>
<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">绑定买号</a>
</div>

<!--wrap-->
<div class="g-wrap">
  <div class="g-box">
    <div class="binding">
      <h2>试客绑定买号<span>买号绑定后将不能继续修改买号信息，请绑定您平时购物经常使用的买号</span></h2>
      <!--content-->
      <div class="bd-cc" style="padding: 0">
        <!--left_nav-->
        <div class="bd-cc-l">
          <h3>选择平台</h3>
          <ul>
            <li class="active"><i></i><label><input checked="checked" type="radio" name="binding_type" value="taobao" id="tbselect" />淘宝 | 天猫</label><span>0</span></li>
            <li><i></i><label><input type="radio" name="binding_type" value="jd" id="jdselect" />京东</label><span>0</span></li>
          </ul>
        </div>
        <!--//left_nav-->

        <!--绑定淘宝||天猫买号 star -->
        <div class="bd-cc-r tbBox clearfix">
          <h3>绑定淘宝|天猫买号<span>绑定的淘宝买号必须和您支付宝认证信息为同1人，否则平台不能审核通过</span></h3>

          <c:if test="${empty buyer}">
          <!-- 未绑定买号旺旺或者未绑定支付宝 -->
          <form action="/buyer/account" method="post" id="from1" enctype="multipart/form-data">

            <div class="cc-r-msg">
              <div class="important">
                <h5>重要提示：</h5>
                <p style="line-height: 30px;">1、请绑定您等级最高的淘宝旺旺号，将有助于您提高中奖几率；</p>
                <p style="line-height: 30px;">2、旺旺号提交后，平台预计24小时内完成审核操作，买号绑定成功后不得解绑及更换其他买号；</p>
              </div>
            </div>

            <h5>第一步：填写淘宝|天猫买号信息</h5>

            <div class="g-item f-mb15 clearfix">
              <label class="tit">旺旺ID：</label>
              <div class="inp">
                <em><input class="txt" type="text" name="ww_name" value="xxxxxxxxx" regname="tbname" emptyerr="旺旺ID不能为空"/></em>
              </div>
              <div class="hint">（用户名绑定后无法修改，严禁绑定相似的买号，如：小符01，小符wi，小符520）</div>
            </div>

            <div class="g-item clearfix">
              <label class="tit">旺旺个人档案截图：</label>
              <div class="inp" style="width:200px;">
                <input type="file" checkurl="true" name="ww_picture" regname="frname" emptyerr="图片必须为jpg、png、gif，且大小不超过1Mb">
              </div>
              <div class="userminimg"><img src="/static/images/buyer/userbigimg.jpg" width="60" height="42"><a href="javascript:;">查看示例截图</a>
                <div class="userbigimg" style="display:none;"><a href="javascript:;">X</a><img src="/static/images/buyer/userbigimg.jpg" width="601" height="412"></div>
              </div>
            </div>

            <p class="addofficial">进入【我的淘宝】点击【我的评价】后，再点击个人信息中的【会员名】上传 "个人档案" 截图，<a class="c-blue" href="http://bbs.zhongguohuo.com/thread-1032141-1-1.html" target="_blank">查看详细教程 ></a></p>

            <div class="zfb_info">
              <h5>第二步：上传支付宝基本信息截图</h5>
              <div style="font-size:14px; color:#333; line-height:30px;">为确保您绑定的买号及支付宝账号为同1人，请填写淘宝|天猫买号绑定的支付宝的认证姓名，并上传基本信息截图</div>
              <div class="zfbdiv clearfix">
                <label class="tit">姓名：</label>
                <div class="inp">
                  <em><input class="txt" type="text" name="zfb_name" value="xxxxxxx" regname="tbname" emptyerr="姓名不能为空"/></em>
                </div>
                <span>支付宝姓名必须为真实姓名</span>
              </div>
              <div class="zfbdiv clearfix">
                <label class="tit">支付宝：</label>
                <div class="inp">
                  <em><input class="txt" type="text" name="zfb" value="coolcooldee@gmail.com" regname="alipay" style="width:320px;" emptyerr="支付宝不能为空"/></em>
                </div>
              </div>
              <div class="zfbdiv clearfix">
                <label class="tit">身份证号：</label>
                <div class="inp">
                  <em><input class="txt" type="text" name="zfb_idcard" value="441422199911065432" regname="sfcord" style="width:320px;" emptyerr="身份证号不能为空"/></em>
                </div>
              </div>
              <div class="zfbdivs clearfix">
                <label class="tit">支付宝信息截图：</label>
                <div class="inp">
                  <input type="file" checkurl="true" name="zfb_picture" regname="frname" emptyerr="图片必须为jpg、png、gif，且大小不超过1Mb">
                  <span>jpg、gif、png，大小不超过1Mb</span>
                </div>

                <p class="zfb-addofficial" style="padding-bottom:0; margin-bottom:5px;">为确保您的琳琅账号及退款账号为同一人，请登录您的【<span>支付宝</span>】，点击【<span>账号设置</span>】，截取您的支付宝【<span>基本信息</span>】作为审核凭证。</p>

                <div class="zfb_img" style="line-height: 21px;">截图需包含：姓名、绑定的淘宝买号、已实名认证的信息<a href="javascript:;" class="zfb_imga">点击放大示例图</a>
                  <div class="zfb_imgs" style="display: none;"><a href="javascript:;" class="zfb_imgsa">X</a><img src="/static/images/buyer/zfb_img.jpg" width="740" height="250"></div>
                </div>
              </div>
            </div>

            <p class="g-item"><a class="binding-btn bg-btn tbbtn" href="javascript:;">提交审核</a></p>

          </form>
          </c:if>
          <!-- 买号旺旺、支付宝绑定数据信息，都已成功插入到数据库中 -->

          <!-- 买号旺旺、支付宝状态，都为待审核状态 -->
          <c:if test="${not empty buyer}">
          <div class="audit">
            <!-- 绑定列表start -->
            <table class="bind_list">
              <tr><th width="20%">旺旺ID</th><th width="25%">支付宝</th><th width="25%">姓名</th><th width="15%">身份证</th><th width="15%">状态</th></tr>
              <tr>
                <td><div class="wwID"><span>${buyer.wangWangId}</span><img src="/static/images/buyer/zfblist.jpg"><div><a href="javascript:;">X</a><img src="${buyer.screenshotWangWangInfoUrl}" width="440" height="400"></div></div></td>
                <td><div class="wwID"><span>${buyer.alipayAccount}</span><img src="/static/images/buyer/zfblist.jpg"><div class="imagesize" style="left:-20px;"><a href="javascript:;">X</a><img src="${buyer.screenshotAlipayRealNameUrl}" width="440" height="400"></div></div></td>
                <td>${buyer.alipayRealName}</td>
                <td>${buyer.identityCard}</td>
                <c:if test="${buyer.status==0}"><td class="orange">等待平台审核</td></c:if>
                <c:if test="${buyer.status==1}"><td class="green">通过审核</td></c:if>
              </tr>
            </table>
          </div>
            <c:if test="${buyer.status==0}"><p style="font-size:14px; padding-left:30px; color:#f00;">温馨提示：绑定成功后客服预计在1个小时左右审核 请耐心等待~</p></c:if>
            </c:if>

          <!-- 买号旺旺、支付宝状态，都为审核通过状态 -->

          <!-- 买号旺旺、支付宝状态，都为审核未通过状态 -->


        </div>
        <!--绑定淘宝||天猫买号 end -->


        <!--绑定京东买号 start -->
        <div class="bd-cc-r jdBox" style="display:none; height:400px;">
          <h3 style="margin-bottom:81px;">绑定京东买号</h3>

          <!-- 如果是不存在绑定记录，或审核未通过，重新修改买号信息 -->
          <form action="/buyer/account_jd" method="post" id="form" enctype="multipart/form-data">

            <input type="hidden" name="cfg_pinyin" value="jd" />

            <div class="g-item clearfix">
              <label class="tit">京东ID：</label>
              <div class="inp">
                <em><input class="txt" type="text" value="" name="name_account" regname="jdname" emptyerr="京东ID不能为空" /></em>
                <a class="c-blue pl10" href="http://bbs.zhongguohuo.com/forum.php?mod=viewthread&tid=1031804" target="_blank">如何找到京东买号？</a>
              </div>
            </div>

            <div class="g-item clearfix">
              <label class="tit">京东帐号截图：</label>
              <div class="inp" style="width:200px;">
                <input type="file" checkurl="true" name="jd_picture" regname="frname" emptyerr="图片必须为jpg、png、gif，且大小不超过1Mb">
              </div>
              <div class="userminimg"><img src="/static/images/buyer/jd_binding_demo.jpg" width="60" height="42"><a href="javascript:;">查看示例截图</a>
                <div class="userbigimg none" style="width:740px; height:325px; left:-552px; top:-200px;"><a href="javascript:;">X</a><img src="/static/images/buyer/jd_binding_demo.jpg" width="740" height="285"></div>
              </div>
            </div>

            <p class="addofficial" style="margin-bottom: 0;">访问 <i class="c-blue">http://home.jd.com/index.html</i>，截取京东帐号信息并<br />上传至琳琅 <a class="c-blue" href="http://bbs.zhongguohuo.com/forum.php?mod=viewthread&tid=1031699" target="_blank">查看详细教程 ></a></p>
            <p class="g-item"><a class="binding-btn jdbtn" href="javascript:;">提交审核</a></p>

          </form>

          <!-- 如果存在绑定记录的话 -->

        </div>
        <!--绑定京东买号 end -->

      </div>
      <!--//content-->
      <c:if test="${not empty buyer}">
        <div class="bd-msg">
          <h3>温馨提示：</h3>
          <p>1.买号提交审核后，平台预计在24小时内完成审核操作，只有审核通过的买号才能申请试用。</p>
          <p>2.买号信誉低于2颗心 <span></span><span></span> ，或给商家中差评比例大于1%，审核可能不通过。</p>
        </div>
      </c:if>

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
  <p>Copyright © 2015 zhongguohuo.com 版权所有 沪ICP备07009935号</p>
</div>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
</body>
</html>

<script type="text/javascript">
  $(function(){

    //支付宝示例截图
    $(".zfb_imga").click(function(){
      $(".zfb_imgs").show();
    })
    $(".zfb_imgsa").click(function(){
      $(".zfb_imgs").hide();
    })

    //点击淘宝京东显示隐藏
    $("#tbselect").click(function(){
      $(".tbBox").show();
      $(".jdBox").hide();
      $(".bd-msg").show();
      $(".imagesize").hide();
    })
    $("#jdselect").click(function(){
      $(".tbBox").hide();
      $(".jdBox").show();
      $(".bd-msg").hide();
      $(".userbigimg").hide();
    })

    //左侧选择平台样式
    $(".bd-cc-l ul input").click(function(){
      $(this).parent().parent("li").addClass("active").siblings().removeClass("active");
    });

    //点击缩略图放大显示与隐藏
    $(".zfbminimg img,.zfbminimg a").click(function(){
      $(this).siblings(".zfbbigimg").show();
    });
    $(".zfbbigimg a").click(function(){
      $(".zfbbigimg").hide();
    });

    //京东验证
    $('.jdBox').Validform({
      btncls : '.jdbtn',
      reg : {
        jdname : [],
      },
      callback : function(){
        $("#form").submit();
      },
    });

    //淘宝验证
    $('.tbBox').Validform({
      btncls : '.tbbtn',
      reg : {
        tbname : [],
      },
      callback : function(){
        $("#from1").submit();
      },
    });

    //旺旺个人档案截图
    $(".userminimg img,.userminimg a").click(function(){
      $(this).siblings(".userbigimg").show();
    })
    $(".userbigimg a").click(function(){
      $(this).parent().hide();
    })

    //绑定列表查看大图
    $(".bind_list td .wwID img").click(function(){
      $(this).siblings("div").show();
    })
    $(".bind_list td .wwID a").click(function(){
      $(this).parent("div").hide();
    })

  })

</script>