<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en" style="background:#FFFEE6;">
<head>
    <meta charset="UTF-8">
    <title>易试用-登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" href="/static/css/main.css" />
    <link rel="stylesheet" href="/static/css/common.css" />
    <link rel="stylesheet" href="/static/css/login.css" />
    <script language="javascript" src="/static/js/jquery-1.8.3.min.js"></script>
    <script language="javascript" src="/static/js/main.js"></script>
    <script language="javascript" src="/static/js/common.js"></script>
    <script language="javascript" src="/static/js/register.js"></script>
</head>
<body>
<div id="header"><h2>易试用</h2></div>
<div id="main">
    <div class="mai-top"><h3>用户登录</h3><strong>还没有账号？<a href="/register/buyer">注册试客</a> | <a href="/register/business">注册商家</a> | <a href="/">返回首页 </a></strong></div>
    <div class="login_form">
        <div style="line-height:30px; color:#555; font-size:14px; padding-left:140px;"><b>各位商家</b>：琳琅试用支持发布淘宝、天猫、京东各大平台的试用任务，目前处于内测阶段，如需咨询或者购买会员请联系客服QQ:<b style="color:#f00;">800057935</b><br /><b>各位试客</b>：为了获得第一手试用品信息，请试客们加入QQ新人群：<b style="color:#f00;">474384354</b><br />原琳琅国货论坛用户可用原用户名、密码直接登录，无需再注册！</div>
        <div class="login_error" style="display:none; height:30px; width:210px; padding-left:13px; margin-left:200px; line-height:30px; border:1px solid #FBE0AC; background:#FFFEDE; color:#F90000; font-weight:bold;"></div>
        <div class="register-business-form" style="border:none; width:650px; margin:20px 0 20px 50px;">
            <div class="item clearfix">
                <label class="tit">用户名:</label>
                <div class="inp">
                    <em class="inpbox">
                        <i class="icon-U"></i>
                        <input type="text" cname="one" placeholder="请输入用户名" warn="用户名4-15个字符，一个汉字为2个字符 "  checkurl="ture" name="username" class="txt placebox" id="username" emptyerr="用户名不能为空"  onkeydown="javascript: enterPress(event);" />
                    </em>
                </div>
            </div>
            <div class="item clearfix">
                <label class="tit">密码:</label>
                <div class="inp">
                    <em class="inpbox">
                        <i class="icon-P"></i>
                        <input type="password" autocomplete="off" placeholder="请输入密码" warn="长度6~16位数字、字母、字符包含两种 " cname="one" class="txt placebox" confirmationpass="password" id="password" name="password"  emptyerr="密码不能为空" onKeyDown="javascript: enterPress(event);" />
                    </em>
                </div>
            </div>
            <div class="item clearfix">
                <label class="tit">&nbsp;</label>
                <div class="inp" style="color:#333;">
                    <label><input id="remember" name="remember" type="checkbox" onKeyDown="javascript:enterPress(event);" />&nbsp;记住我（两周免登陆）</label>
                </div>
            </div>
            <div class="login_div"><input id="submit_btn" type="button" class="login_button" /><a href="/retrieve/index">忘记密码？</a></div>
        </div>
    </div>


</div>

<!--footer-->
<jsp:include page="include/footer.jsp"/>


<script type="text/javascript">
    function enterPress(e) {
        if (e.keyCode == 13) {
            login();
            $(".login_button").click();
        }
    }
</script>
<script type="text/javascript">
    $(function(){
        $('.login_form').Validform({
            btncls : '.login_button',
            callback : function(){
                var data = {
                    "username":$("#username").val(),
                    "password":$("#password").val(),
                    "remember":$("#remember").val()
                }

                url = window.location.href;
                url = "login";

                $.post(url,data,function(result){

                    if(result.error == 0){
                        //console.log(result.synlogin_url);
                        if(result.synlogin != undefined){
                            $("body").append(result.synlogin);
                        }
                        window.location = result.url;
                    }else{
                        $(".login_error").show().html(result.msg);
                    }
                },"json")
            }
        });
    })
</script>
</body>
</html>	