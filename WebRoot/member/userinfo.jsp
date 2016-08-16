<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>个人中心-账户信息</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/m_user_index.css" rel="stylesheet" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/js/common.js"></script>

  <script type="text/javascript" src="/static/js/swfobject.js"></script>
  <script type="text/javascript" src="/static/js/fullAvatarEditor.js"></script>

  <style type="text/css">
    .business-info-list-bd{display: none;}
    .business-info-list-small-list-bd{display: none;}
  </style>
</head>
<body>
<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />
<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">账户信息</a>
</div>

<!--wrap-->
<div class="m-wrap clearfix">

  <jsp:include page="/member/include/mleft.jsp" />

  <!--right-content-->
  <div class="business-right clearfix">
    <div class="business-right-comm clearfix">
      <div class="business-info clearfix">

        <div class="business-info-hd">账户信息</div>

        <div class="business-info-bd">


          <div class="business-info-list">
            <div class="business-info-list-hd">
              <span>用户帐号</span>
              <b>${member.account}</b>

              <a class="fr" href="javascript:;">设置</a>
            </div>
            <div class="business-info-list-bd">

              <div class="userpic-box clearfix" style="padding-left: 0;">
                <div style="width:630px;margin-left:0;">

                  <div>
                    <p id="swfContainer">
                      本组件需要安装Flash Player后才可使用，请从<a href="http://www.adobe.com/go/getflashplayer">这里</a>下载安装。
                    </p>
                  </div>

                </div>
                <script type="text/javascript">
                  swfobject.addDomLoadEvent(function () {
                    var swf = new fullAvatarEditor("swfContainer", {
                              id: 'swf',
                              upload_url: '/ajax/face',
                              src_upload:2
                            }, function (msg) {
                              switch(msg.code)
                              {
                                case 5 :
                                  if(msg.type == 0)
                                  {
                                    window.location.href = "/member";
                                  }
                                  break;
                              }
                            }
                    );

                  });
                </script>
              </div>
            </div>
            <script type="text/javascript">
              function updateavatar() {
                location.reload();
              }
              $(function(){
                $('.userpic-box').Validform({
                  btncls : '.pic-btn',
                  callback : function(){
                    $('#form-userpic').submit();
                  }
                });
                // 上传文件验证
                $('input[type="file"]').each(function(){
                  $(this).change(function(){
                    fileChange(this,2,'jpg|jpeg|png|gif',$(this).attr('checkfor'));
                  });
                });
              })
            </script>
          </div>



          <!--登录密码-->
          <div class="business-info-list">
            <div class="business-info-list-hd">
              <span>登录密码</span>
              <b class="set">已设置</b>
              <%--<a class="fr" href="javascript:;">修改</a>--%>
            </div>
            <div class="business-info-list-bd">
              <form action="/member/userinfo" method="post" id="from-userpwd">
                <input name="act" type="hidden" value="password">
                <div class="user-info-form user-login-box">
                  <p class="setTips">为了您的账号安全，请定期更换登陆密码，并确保登录密码设置与提现密码不一样。</p>
                  <div class="item clearfix">
                    <label class="tit"><i>*</i>原密码</label>
                    <div class="inp">
                      <em class="inpbox">
                        <i class="icon-P"></i>
                        <input type="password" placeholder="请输入密码" autocomplete="off" cname="one" class="txt placebox"  name="ypassword" regname="loginpasswordno" emptyerr="密码不能为空" />

                      </em>
                    </div>
                  </div>
                  <div class="item clearfix">
                    <label class="tit"><i>*</i>新密码</label>
                    <div class="inp">
                      <em class="inpbox">
                        <i class="icon-P"></i>
                        <input type="password" placeholder="请输入密码" cname="one" class="txt placebox" confirmationpass="password" name="password" regname="password" emptyerr="密码不能为空" />
                      </em>
                    </div>
                  </div>
                  <div class="item clearfix">
                    <label class="tit"><i>*</i>确认新密码</label>
                    <div class="inp">
                      <em class="inpbox">
                        <i class="icon-P"></i>
                        <input type="password" placeholder="请输入确认密码" cname="one" class="txt placebox"  name="repassword" confirmation="password"  emptyerr="确认密码不能为空" confirmationerr="输入密码不一致,请重新填写" />
                      </em>
                    </div>
                  </div>
                  <p class="item itembtnp">
                    <a href="javascript:;" class="itembtn">确认修改</a><span id="password"></span>
                  </p>
                </div>
              </form>
              <script type="text/javascript">
                $(function(){
                  $('.user-login-box').Validform({
                    btncls : '.itembtn',
                    callback : function(){
                      //$('#from-userpwd').submit();
                      $.post("/member/userinfo",$('#from-userpwd').serialize(),function(result){
                        if(result.error == 0){
                          $("#password").attr("class","ok").html(result.msg);
                        }else{
                          $("#password").attr("class","error").html(result.msg);
                        }
                      },"json")
                    }
                  });
                })
              </script>
            </div>
          </div>


          <!--提现密码-->
          <div class="business-info-list">
            <div class="business-info-list-hd">
              <span>提现密码</span>
              <b>未设置</b>
              <%--<a class="fr" href="javascript:;">设置</a>--%>
            </div>
            <div class="business-info-list-bd">

              <!--***第一次设置提现密码***-->
              <form action="/userinfo/modify_user" method="post" id="from-pay">
                <input name="act" type="hidden" value="password_withdraw">
                <div class="user-info-form find-pay-box">
                  <p class="setTips">为了您的账号安全，请设置提现密码，并确保提现密码设置与登录密码不一样。</p>
                  <div class="item clearfix">
                    <label class="tit"><i>*</i>提现密码</label>
                    <div class="inp">
                      <em class="inpbox">
                        <i class="icon-P"></i>
                        <input type="password" autocomplete="off" placeholder="请输入密码" cname="one" class="txt placebox" confirmationpass="password"  name="password_withdraw" regname="paypassword" emptyerr="密码不能为空" />
                      </em>
                    </div>
                  </div>
                  <div class="item clearfix">
                    <label class="tit"><i>*</i>重复密码</label>
                    <div class="inp">
                      <em class="inpbox">
                        <i class="icon-P"></i>
                        <input type="password" placeholder="请输入确认密码" cname="one" class="txt placebox"  name="repassword_withdraw" confirmation="password"  emptyerr="确认密码不能为空" confirmationerr="输入密码不一致,请重新填写" />
                      </em>
                    </div>
                  </div>
                  <p class="item itembtnp">
                    <a href="javascript:;" class="itembtn">确认修改</a><span id="pwd_msg"></span>
                  </p>
                </div>
              </form>
              <script type="text/javascript">
                $(function(){
                  $('.find-pay-box').Validform({
                    btncls : '.itembtn',
                    callback : function(){
                      //$('#from-pay').submit();
                      $.post("/member/userinfo",$('#from-pay').serialize(),function(result){
                        if(result.error == 0){
                          $("#pwd_msg").attr("class","ok").html(result.msg);
                        }else{
                          $("#pwd_msg").attr("class","error").html(result.msg);
                        }
                      },"json")
                    }
                  });
                })
              </script>
            </div>
          </div>


          <!--修改联系方式-->
          <div class="business-info-list">
            <div class="business-info-list-hd business-info-list-hd-lx">
              <span>联系方式</span>
            </div>
            <div class="business-info-list-small">
              <div class="business-info-list-small-list">
                <div class="business-info-list-small-list-hd">
                  <span>QQ</span>
                  <b>${member.qq}</b>
                  <%--<a class="fr" href="javascript:;">修改</a>--%>
                </div>
                <div class="business-info-list-small-list-bd" style="display:none;">

                  <form action="/member/userinfo" method="post" id="from-userqq">
                    <input name="act" type="hidden" value="qq">
                    <div class="user-info-form user-qq-box">
                      <p class="setTips">为了便于商家与您联系，请填写您的常用QQ</p>
                      <div class="item clearfix">
                        <label class="tit"><i>*</i>新的QQ号码</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-Q"></i>
                            <input type="text" warn="请输入QQ号" cname="one" placeholder="请输入QQ号" name="qq" class="txt placebox" id="qq" regname="qq" emptyerr="QQ号不能为空"/>
                          </em>
                        </div>
                      </div>
                      <p class="item itembtnp">
                        <a href="javascript:;" class="itembtn">确认修改</a>
                        <span id="qq_msg"></span>
                      </p>
                    </div>
                  </form>
                  <script type="text/javascript">
                    $(function(){
                      $('.user-qq-box').Validform({
                        btncls : '.itembtn',
                        callback : function(){
                          //$('#from-userqq').submit();
                          $.post("/member/userinfo",$('#from-userqq').serialize(),function(result){
                            if(result.error == 0){
                              $("#qq_msg").attr("class","ok").html(result.msg);
                            }else{
                              $("#qq_msg").attr("class","error").html(result.msg);
                            }
                          },"json")
                        }
                      });

                    })
                  </script>
                </div>
              </div>

              <div class="business-info-list-small-list">
                <div class="business-info-list-small-list-hd">
                  <span>邮箱</span>
                  <b>${member.email}</b>
                  <%--<a class="fr" href="javascript:;">修改</a>--%>
                </div>
                <div class="business-info-list-small-list-bd user-info-form" style="display:none;">

                  <form action="userinfo/verifymodifymail" method="post" id="from-email">
                    <input name="act" type="hidden" value="email">
                    <div class="user-info-form Modif-email-box">
                      <div class="item clearfix">
                        <label class="tit"><i>*</i>填写新邮箱:</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-E"></i>
                            <input type="text" cname="one" placeholder="请输入邮箱地址" name="email" class="txt placebox" id="email" regname="email" emptyerr="邮箱地址不能为空"/>
                          </em>
                        </div>
                      </div>
                      <p class="item itembtnp">
                        <a href="javascript:;" class="itembtn">确认修改</a>
                        <span id="email_msg"></span>
                      </p>
                    </div>
                  </form>
                  <script type="text/javascript">
                    $(function(){
                      $('.Modif-email-box').Validform({
                        btncls : '.itembtn',
                        callback : function(){
                          //$('#from-email').submit();
                          $.post("/member/userinfo",$('#from-email').serialize(),function(result){
                            if(result.error == 0){
                              $("#email_msg").attr("class","ok").html(result.msg);
                            }else{
                              $("#email_msg").attr("class","error").html(result.msg);
                            }
                          },"json")
                        }
                      });
                    })
                  </script>

                </div>
              </div>

              <div class="business-info-list-small-list">
                <div class="business-info-list-small-list-hd">
                  <span>手机</span>
                  <b>${member.phone}</b>
                  <%--<a class="fr" href="javascript:;">修改</a>--%>
                </div>
                <div class="business-info-list-small-list-bd" style="display:none;">
                  <div class="user-info-form user-mobile-box">
                    <form action="/userinfo/modify_user" method="post" id="from-mobile">
                      <input name="act" type="hidden" value="mobile">
                      <p class="setTips">为了便于我们与您联系，请填写您的常用手机号</p>
                      <div class="item clearfix">
                        <label class="tit"><i>*</i>手机号</label>
                        <div class="inp">
                          <em class="inpbox">
                            <i class="icon-M"></i>
                            <input type="text" cname="one" placeholder="请输入手机号" name="mobile" class="txt placebox" id="moblie" regname="mobile" emptyerr="手机号不能为空"/>
                          </em>
                          <span class="error">手机码已存在</span>
                        </div>
                      </div>
                      <p class="item itembtnp">
                        <a href="javascript:;" class="itembtn">确认修改</a>
                        <span id="mobile_msg"></span>
                      </p>
                    </form>
                  </div>

                  <script type="text/javascript">
                    $(function(){
                      $('.user-mobile-box').Validform({
                        btncls : '.itembtn',
                        callback : function(){
                          //$('#from-mobile').submit();
                          $.post("/member/userinfo",$('#from-mobile').serialize(),function(result){
                            if(result.error == 0){
                              $("#mobile_msg").attr("class","ok").html(result.msg);
                            }else{
                              $("#mobile_msg").attr("class","error").html(result.msg);
                            }
                          },"json")
                        }
                      });
                    })
                  </script>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!--//right-content-->
</div>
<!--//wrap-->

<!--footer-->
<jsp:include page="/include/footer.jsp" />

<script type="text/javascript">
  $(function(){
    var $list = $('.business-info-list-bd,.business-info-list-small-list-bd');
    $('.business-info-list-hd a,.business-info-list-small-list-hd a').click(function(){
      if($(this).hasClass('userhead')) return;
      $('.business-info-list-bd:visible,.business-info-list-small-list-bd:visible').slideUp();
      if(!$(this).parent().next().is(':hidden'))return;
      $(this).parent().next().slideDown();
    });
  })
</script>


</body>
</html>