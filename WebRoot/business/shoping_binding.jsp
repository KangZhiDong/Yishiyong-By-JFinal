<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>商家绑定店铺</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <link href="/static/css/shop_binding.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/js/common.js"></script>
  <script type="text/javascript" src="/static/js/jquery.zclip.min.js"></script>
  <script type="text/javascript" src="/static/script/publish-task1.js"></script>
  <script type="text/javascript" src="/static/js/jquery.form.js"></script>
  <style type="text/css">
    a.verify {display: inline-block; height: 32px;border: 1px solid #ccc;line-height:32px;border-radius:5px;padding:0 10px;background: #F8F8F8;font-size:14px;font-weight:bold; color: #F00;}
  </style>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="javascript:;">商家绑定店铺</a>
</div>

<!--wrap-->
<div class="g-wrap clearfix">
  <div class="g-box clearfix">
    <div class="binding">
      <h2>商家绑定店铺</h2>
      <div class="bd-cc">
        <div class="bd-cc-l">
          <h3>选择平台</h3>
          <ul>
            <li  class="active" ><i></i><label><input  checked="checked"  type="radio" name="binding_type" value="taobao" />淘宝						                        	<span>0</span>
            </label></li>
            <li ><i></i><label><input  type="radio" name="binding_type" value="tmall" />天猫						                        	<span>0</span>
            </label></li>
          </ul>
        </div>

        <!--right-->
        <div class="bd-cc-r J_FIVE_CONTENT">

          <input type="hidden" id='J_type' value="taobao">

          <h3 class="f18">绑定淘宝店铺<span>每个商家ID可免费绑定<em class="c-red">1</em>个店铺，付费<em class="c-red">268</em>元可增加绑定<em class="c-red">1</em>个店铺，最多可绑定<em class="c-red">2</em>个店铺</span></h3>
          <!--第一次绑定-->
          <div class="business-bind-list business-bind-new bdform" style="display:block;">
            <h4>绑定新店铺<span>你已绑定<em class="c-red">0</em>个店铺，还可以添加<em class="c-red">2</em>个店铺</span></h4>
            <form enctype="multipart/form-data" action="?" method="post" id="forms">
              <input type="hidden" name="shoping_type" value="taobao" />
              <input type="hidden" id="shoping_logo" name="shoping_logo"  />
              <div id="s">
                <!--绑定店铺-->
                <div class="addkey">
                  <p class="t1msg">店铺1：<span>店铺绑定后无法修改也无法解除绑定</span><i class="fr del"></i></p>
                  <div class="item clearfix">
                    <label class="tit">店铺首页网址:</label>
                    <div class="inp">
                      <input type="text" class="txt w320 inpbox"  name="shoping_url" reg="urls"  style="ime-mode:disabled" value="" />
                    </div>
                  </div>
                  <div class="item clearfix">
                    <label class="tit">店铺主旺旺ID:</label>
                    <div class="inp">
                      <input type="text" class="txt inpbox" name="shoping_name" reg="wangwang" />
                    </div>
                  </div>
                  <div class="item clearfix">
                    <label class="tit">店铺LOGO:</label>
                    <div class="inp">
                      <%--<iframe frameborder="0" scrolling="no" style="position:relative;width:210px;height:38px;" src="/ajax/upload#logo"></iframe>--%>
                      <input type="file" id="logo_img" name="shoping_logo" />
                      <i id="logo_msg" style="position:relative; top:-12px;">请上传店铺LOGO，要求：尺寸为260x260，大小不超过1M</i>
                      <i class="none"><img src="" width="50" height="50" alt="logo" /></i>
                    </div>
                  </div>
                  <div class="item clearfix">
                    <label class="tit">验证码:</label>
                    <div>
                      <input type="hidden" value="9DBcxZ1W" name="copy-code" />
                      <span class="copy-code">9DBcxZ1W</span>
                      <a class="J_copytext copy-code1" data-copy="9DBcxZ1W" href="javascript:;">复制</a>
                    </div>
                  </div>
                  <div class="copy-box">
                    <p>1.将验证码加到您的店铺里某个上架商品的标题上，类似这样：</p>
                    <div><img src="/static/images/new/taobao.jpg" alt="示例截图" /></div>
                    <p>2.再将这个商品的详情页链接，复制到下面输入框</p>
                  </div>
                  <div class="item clearfix">
                    <label class="tit">商品网址（URL）：</label>
                    <div class="inp">
                      <input type="text" name="shop_url" class="txt inpbox w320" reg="urls">
                      <input type="hidden" id="urlok" >
                      <a class="verify">验证商品网址</a>
                    </div>
                  </div>
                  <div class="msg-box">
                    <p class="cor999">若店铺负责人的QQ和手机号不一致，可点击修改，设置为当前店铺负责人的QQ和手机号</p>
                    <p>负责人QQ号：<span>353453453</span> [<a href="javascript:;" class="c-blue update-qq">修改</a>]</p>
                    <p>负责人手机号：<span>18865433454</span> [<a href="javascript:;" class="c-blue update-phone">修改</a>]</p>
                  </div>
                  <div class="item clearfix show-qq" style="display:none;">
                    <label class="tit">负责人QQ号：</label>
                    <div class="inp">
                      <input type="text" name="qq"  class="txt placebox inpbox" reg="qq" value="353453453" />
                    </div>
                  </div>
                  <div class="item clearfix show-phone" style="display:none;">
                    <label class="tit">负责人手机号：</label>
                    <div class="inp">
                      <input type="text" name="mobile" class="txt placebox inpbox" id="usermoblie" reg="mobile" value="18865433454" />
                    </div>
                  </div>
                </div>
                <!--//绑定店铺-->
              </div>
              <!--绑定按钮-->
              <div class="bd-btn-box">
                <p class="tit"><em>需支付：<span class="c-red f22" id="money">0</span>元 <a class="bd-btn checkout-btn btn_first">确认绑定 ></a></em></p>
              </div>
            </form>
          </div>
          <!--//第一次绑定-->

        </div>
        <!--//right-->
      </div>
      <div class="bd-msg">
        <h3>温馨提示：</h3>
        <p>店铺请填写自己店铺首页地址，不可绑定其他卖家的地址.</p>
      </div>
    </div>
  </div>
</div>
<!--//wrap-->

<!--footer-->
<jsp:include page="/include/footer.jsp"/>

<div class="bind-update-box none">
  <!--已绑定的店铺修改联系方式-->
  <form action="?" method="post" id="form-update">
    <input type="hidden" name="binding_id"  class="shopid"/>
    <i class="icon-bd"></i>
    <p class="bind-up-p">修改负责人联系方式<a class="fr red" id="del-updete">X</a></p>
    <div class="item clearfix">
      <label class="tit">负责人QQ号：</label>
      <div class="inp">
        <input type="text" name="qq" class="txt placebox inpbox" id="userqq" reg="qq"  />
      </div>
    </div>
    <div class="item clearfix">
      <label class="tit">负责人手机号：</label>
      <div class="inp">
        <input type="text"  name="moblie" class="txt placebox inpbox" id="usersj" reg="mobile" />
      </div>
    </div>
    <div class="bd-btn-box" style="border:none;"> <p class="tit"><a class="bd-btn checkout-btn">确认修改</a></em></p></div>
  </form>
  <!--//已绑定的店铺修改联系方式-->
</div>

<script type="text/javascript">
  $(function(){

    //切换平台事件
    $("[name=binding_type]").click(function(){
      window.location.href = "/business/shoping_binding/" + $(this).val();
    });

    //左侧选择平台样式
    $(".bd-cc-l ul input").click(function(){
      $(this).parent().parent("li").addClass("active").siblings().removeClass("active");
    })

    //绑定店铺修改QQ、手机
    $(".update-qq").click(function(){
      $(this).parent().hide();
      $(this).parent().parent().next(".show-qq").show();
    });
    $(".update-phone").click(function(){
      $(this).parent().hide();
      $(this).parent().parent().next().next(".show-phone").show();
    })


    //已绑定店铺列表修改联系方式
    $("a.updata").each(function(){
      $(this).live("click",function(){
        var shopid = $(this).attr("data-shopid");
        $('.bind-update-box').find('#form-update').find(".shopid").val(shopid);
        $('.bind-update-box').find('#form-update').find("input[name=qq]").val($(this).parents("tr").find(".j_up_qq").text())
        $('.bind-update-box').find('#form-update').find("input[name=moblie]").val($(this).parents("tr").find(".j_up_mobile").text())

        var $clone = $('.bind-update-box').find('#form-update');
        var size = $(this).parent().parent().parent().find(".bind-up #form-update").length;
        if(size<2){
          $(this).parent().parent().parent().find(".bind-up").hide();
          $(this).parent().parent().parent().find("#form-update").remove();
          $(this).parent().parent().next().find(".bind-up").show().append($clone.clone(true));
        };

      })
    })

    //已绑定的店铺取消修改
    $("#del-updete").click(function(){
      $(this).parent().parent().parent().hide();
    })

    //第二次展开隐藏继续绑定店铺
    $(".bd-btn-box .up1").click(function(){
      $(".bind-again-box").show();
    });
    $(".icon-bdclose").click(function(){
      $(".bind-again-box").hide();
    });


    //第一个绑定店铺验证
    $('#forms').find('a.btn_first').click(function(event) {
      var $regList = $("#s *[reg]");
      var _re = regForm($regList);

      var logoimg = $("#logo_img").val();//获取上传地址
      if(logoimg==""){
        $("#logo_msg").html('<span class="error" style="color:red; padding-left:18px; display:inline!important;">请上传店铺LOGO</span>')
        return false;
      }
      var yzurl = $('#urlok').val();//获取上传的商品网址
      if(yzurl==""){
        alert("请验证商品网址")
        return false;
      }else if(yzurl==2){
        alert("商品网址验证失败，请重新验证")
        return false;
      }

      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }
      //如果验证成功执行
      $('#forms').submit();

    })


    //店铺列表修改信息
    $('#form-update').find('a.checkout-btn').click(function(event) {
      var $regList = $(".J_FIVE_CONTENT1 *[reg]");
      var _re = regForm($regList);
      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }

      //如果验证成功执行
      var binding_id = $(".shopid").val();//店铺id
      var qq = $("#userqq").val();//QQ
      var mobile = $("#usersj").val();//手机

      $.post("/ajax/edit_shoping_info",{"binding_id":binding_id,"qq":qq,"mobile":mobile},function(result){
        if(result.error == 0){
          alert(result.msg);
          window.location = window.location.href;
        }else{
          alert(result.msg);
        }
      },"json")

    })


    //第二个店铺验证
    $('#form-update1').find('a.checkout-btn').click(function(event) {
      var $regList = $("#form-update1 *[reg]");
      var _re = regForm($regList);

      var logoimg = $("#logo_img").val();//获取上传地址
      if(logoimg==""){
        $("#logo_msg").html('<span class="error" style="color:red; padding-left:18px; display:inline!important;">请上传店铺LOGO</span>')
        return false;
      }

      var yzurl = $('#urlok').val();//获取上传的商品网址
      if(yzurl==""){
        alert("请验证商品网址")
        return false;
      }else if(yzurl==2){
        alert("商品网址验证失败，请重新验证")
        return false;
      }

      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }
      $('#form-update1').submit();
    })

    // 上传文件类型大小验证
    $('input[type="file"]').each(function(){
      $(this).change(function(){
        fileChange(this,1,'jpg|jpeg|png|gif',$(this).attr('checkfor'));
      });
    })

    //验证商品店铺连接
    $(".verify").click(function(){
      var code = $(".copy-code").text();//验证码
      var url =  $(this).siblings("input").val();//商品网址

      var type = $('#J_type').val();//判定用户所选择的平台
      if(type=="taobao"){
        if(url.indexOf("tmall.com")<1 && url.indexOf("taobao.com")>0){
        }else{
          alert("请检查商品连接是否为淘宝商品连接!")
          return false;
        };
      }else if(type=="tmall"){
        if(url.indexOf("tmall.com")>0){
        }else{
          alert("请检查商品连接是否为天猫商品连接!")
          return false;
        };
      }else if(type=="jd"){
        if(url.indexOf("jd.com")>0){
        }else{
          alert("请检查商品连接是否为京东商品连接!")
          return false;
        };
      }

      $.post("/business/shoping_check",{"url":url,"code":code},function(result){
        if(result.error == 0){
          $('#urlok').val(1)//验证成功
          alert(result.msg);
        }else{
          $('#urlok').val(2)//验证失败
          alert(result.msg);
        }
      },"json")
    })

  })
</script>
</body>
</html>