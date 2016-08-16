<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>注册</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link rel="shortcut icon" href="/static/images/favicon.ico" />
  <link rel="stylesheet" href="/static/css/main.css" />
  <link rel="stylesheet" href="/static/css/common.css" />
  <link rel="stylesheet" href="/static/css/login.css" />
  <script language="javascript" src="/static/js/jquery-1.8.3.min.js"></script>
  <script language="javascript" src="/static/js/common.js"></script>
</head>

<body>
<div id="header"><h2>易试用</h2></div>
<div id="main">
  <div class="business-top">
    <h3>注册${businessFlag eq 1?'商家':'试客'}账号</h3>
    <div class="Process">
      <ul class="clearfix">
        <li class="" style="width:50%"><em class="Processing">1<i></i></em><span class="c-yellow">填写注册信息</span><strong></strong></li>
        <li class="" style="width:50%"><em class="">2<i></i></em><span class="">选择会员类型</span><strong></strong></li>
        <li class="Processlast" style="width:82px;"><em class="">3<i></i></em><span class="">${businessFlag eq 1?'绑定店铺':'完善信息'}</span><strong></strong></li>
      </ul>
    </div>
  </div>
  <div class="container">
    <div class="Shadowbox">
      <h3 class="you-login"><strong>已有账号?</strong><a href="/login">立即登录</a></h3>
      <div class="register" style="overflow:hidden;">

        <div class="register-main" style="padding-top:10px;">
          <div class="register-tabs">

            <div class="register-tabs-bd">
              <div class="register-tabs-main">
                <div class="register-business clearfix">
                  <form id="form" autocomplete="off" action="/register/member" method="post">
                    <input type="hidden" name="businessFlag" value="${businessFlag}">
                    <input type="hidden" name="invite_id" value="">
                    <input type="hidden" name="partner" value="0">
                    <div class="register-business-form" style="border:none; margin-left:10px;">
                      <div class="item clearfix">
                        <label class="tit">用户名:</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-U"></i>
                            <input value="12345678903" type="text" cname="one" placeholder="请输入用户名" warn="用户名4-15个字符，一个汉字为2个字符 "  checkurl="ture" name="username" class="txt placebox" regname="username" emptyerr="用户名不能为空"/>
                          </em>
                        </div>
                      </div>
                      <div class="item clearfix">
                        <label class="tit">密码:</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-P"></i>
                            <input value="qqq123" type="password" autocomplete="off" placeholder="请输入密码" warn="长度6~16位数字、字母、字符包含两种 " cname="one" class="txt placebox" confirmationpass="password" name="password" regname="loginpassword" emptyerr="密码不能为空" />
                          </em>
                        </div>
                      </div>
                      <div class="item clearfix">
                        <label class="tit">确认密码:</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-P"></i>
                            <input value="qqq123" type="password" placeholder="请输入确认密码" cname="one" class="txt placebox"  name="repassword" confirmation="password"  emptyerr="确认密码不能为空" confirmationerr="输入密码不一致,请重新填写" />
                          </em>
                        </div>
                      </div>

                      <div class="item clearfix">
                        <label class="tit">邮箱:</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-E"></i>
                            <input value="12345678@qq.com" type="text" warn="请填写您的常用邮箱" cname="one" checkurl="ture" placeholder="请输入邮箱地址" name="email" class="txt placebox"  regname="email" emptyerr="邮箱地址不能为空"/>
                          </em>
                        </div>
                        <div class="register-hint">一个邮箱只能注册一个易试用账号</div>
                      </div>
                      <div class="item clearfix">
                        <label class="tit">QQ号:</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-Q"></i>
                            <input value="12345678" type="text" warn="便于联系" cname="one" checkurl="ture" placeholder="请输入qq号" name="qq" class="txt placebox" regname="qq" emptyerr="QQ号不能为空"/>
                          </em>
                        </div>
                      </div>
                      <div class="item clearfix">
                        <label class="tit">手机:</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-M"></i>
                            <input value="18826455432" type="text" warn="便于联系客服与您" cname="one" checkurl="ture" placeholder="请输入手机号" name="mobile" class="txt placebox" regname="mobile" emptyerr="手机号不能为空"/>
                          </em>
                        </div>
                      </div>
                      <p class="item loginsub inp" style="margin-top:15px;">
                        <button type="button" class="loginbtn" id="submit_btn" name="submit_btn">立即注册</button>
                        <label for="recommend_chk"><input canempty="ture" checkurl="ture" regname="recommend_chk"  type="checkbox" checked="checked" name="login_remember">我同意
                          <a href="/static/html/m_protocol.html" target="_blank">琳琅国货服务协议</a>
                        </label>
                      </p>
                    </div>
                    <div class="right-info">
                      <c:if test="${empty businessFlag}">
                        琳琅国货试用平台处于网站内测阶段<br />为了获得第一手试用品信息，请试客们加入QQ新人群：<span style="color:#f00;">431080203</span>
                      </c:if>
                      <c:if test="${not empty businessFlag}">
                        琳琅试用支持发布淘宝、天猫、京东各大平台的试用任务，目前处于内测阶段，如需咨询或者购买会员请联系客服<b style="color:#4CA7ED;">QQ:800057935</b>
                      </c:if>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="Shadowboxb"></div>
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
  $(function(){
    $('.register-business-form').Validform({
      btncls : '.loginbtn',
      ifok : true,
      disbtncls : 'disabled',
      regback : {
        //用户名
        username : function(o,v,c){
          $.ajax({
            type: "POST",
            url: "/member/check_user_info",
            data:"tid=0&chk_str="+v,
            dataType:"json",
            async:true,
            success: function(re) {

              if(re.error){
                rqf.tip.showError(re.msg,o.parents('.inp'));
                o.removeAttr('pass');
              }else{
                c(o);
              }
            }
          });
        },
        //邮箱
        email : function(o,v,c){
          $.ajax({
            type: "POST",
            url: "/member/check_user_info",
            data:"tid=1&chk_str="+v,
            dataType:"json",
            async:true,
            success: function(re) {
              if(re.error){
                rqf.tip.showError(re.msg,o.parents('.inp'));
                o.removeAttr('pass');
              }else{
                c(o);
              }
            }
          });
        },
        //手机
        mobile : function(o,v,c){
          $.ajax({
            type: "POST",
            url: "/member/check_user_info",
            data:"tid=2&chk_str="+v,
            dataType:"json",
            async:true,
            success: function(re) {
              if(re.error){
                rqf.tip.showError(re.msg,o.parents('.inp'));
                o.removeAttr('pass');
              }else{
                c(o);
              }
            }
          });
        },
        qq : function(o,v,c){
          $.ajax({
            type: "POST",
            url: "/member/check_user_info",
            data:"tid=3&chk_str="+v,
            dataType:"json",
            async:true,
            success: function(re) {
              if(re.error){
                rqf.tip.showError(re.msg,o.parents('.inp'));
                o.removeAttr('pass');
              }else{
                c(o);
              }
            }
          });
        },
        //同意
        recommend_chk : function(o,v) {
          if(!v){
            $('button[type=button]').addClass('disabled');

          }else{
            $('button[type=button]').removeClass('disabled');
          }
        }
      },
      callback : function(){
        var data = $("#form").serialize(), url = $("#form").attr("action");
        $.post(url, data,function(result){
          if(result.error == 0){
            window.location = result.url;
          }else{
            alert(result.msg);
          }
        },"json")
      }
    });
  })
</script>
</body>
</html>