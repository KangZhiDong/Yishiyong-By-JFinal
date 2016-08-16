<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>试客商家发布任务第一步</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/stask.css" rel="stylesheet" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
</head>
<body>
<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />
<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">发布试用</a>
</div>

<form action="?" method="post" id="task_1">
  <div class="s-wrap">
    <div class="stit">
      <h2><img src="/static/images/s-tit1.png" alt="发布试用" /></h2>
      <div class="Process">
        <ul class="clearfix">
          <li style="width:16%"><em class="Processing">1</em><span class="c-yellow">选平台</span></li>
          <li style="width:19%"><em>2</em><span>填写商品和订单信息</span></li>
          <li style="width:17%"><em>3</em><span>如何找到商品</span></li>
          <li style="width:17%"><em>4</em><span>设置试用份数</span></li>
          <li style="width:16%"><em>5</em><span>选择增值服务</span></li>
          <li style="width:15%"><em>6</em><span>支付</span></li>
          <li style="width:5%" class="Processlast"><em>7</em><span>发布成功</span></li>
        </ul>
      </div>
    </div>



    <div class="smsg" style="padding:15px 0;">
      <c:if test="${member.role==3}">
        <p style="line-height:39px;">你当前为<span>体验商家</span>，发布任务需缴纳服务费<span>：388元</span>/次；最多可发布<span>3</span>次试用，本次试用发布后，你还可以发布<span>2</span>次试用</p>
      </c:if>
      <p style="line-height:39px;"><i class="red">16:00</i>前发布的试用任务，将在当日审核后上线；<i class="red">16:00</i>后发布的试用任务，将在审核后，次日<i class="red">9:00</i>上线</p>
    </div>

    <!--做任务-->
    <div class="stask-bd">
      <h3>第一步.选择店铺和试用类型</h3>
      <div class="stask-bd-tit">
        <span class="bdtit1 Release1">1.选择平台</span>
        <span class="bdtit2 Release2">2.选择店铺</span>
        <span class="bdtit3 Release3">3.选择试用类型</span>
      </div>
      <div class="stask-bd-cc">
        <div class="sl Release1">
          <ul>
            <li  class="cur" >
              <i></i><label><input type="radio" name="pid" pinyin="taobao" value="1"  checked="checked"  /><b class="taobao"></b>
              <em class="num">0</em>
            </label>
            </li>
            <li >
              <i></i><label><input type="radio" name="pid" pinyin="tmall" value="2"  /><b class="tmall"></b>
              <em class="num">0</em>
            </label>
            </li>
          </ul>
        </div>
        <div class="sc Release2">
          <c:if test="${empty listBusinesses}">
            <!--没有绑定店铺时候显示-->
            <div class="nobinding">
              <p>您还未绑定店铺，</p>
              <p>无法发布任务</p>
              <p>请先绑定店铺后再发布任务</p>
              <p><a href="/business/shoping_binding" target="_blank">前去绑定店铺 ></a></p>
              <p>（最多可绑定3个店铺）</p>
            </div>
            <!--//没有绑定店铺-->
          </c:if>
          <c:if test="${not empty listBusinesses}">
            <ul>
              <c:forEach var="business" items="${listBusinesses}" >
                <li class="cur">
                  <i></i><label><input type="radio" name="binding_id" value="${business.id}" checked="checked"><span>${business.wangWangId}</span></label>
                </li>
              </c:forEach>
            </ul>
          </c:if>


        </div>
        <div class="sr Release3">
          <ul>
            <li  class="cur" >
              <i></i>
              <label>
                <input type="radio" name="ttid" value="1"  checked="checked"  />
                <span>常规试用</span>
                <p>至少发10件试用品，试客会通过自然搜索、购物车等多渠道完成试用</p>
              </label>
            </li>
            <li >
              <i></i>
              <label>
                <input type="radio" name="ttid" value="2" disabled="true" />
                <span>上新试用<span style="font-size:12px; margin-left:15px;">(即将上线)</span></span>
                <p>最多发放10件试用品，可快速积累新品的基础销量和评价</p>
              </label>
            </li>
            <li >
              <i></i>
              <label>
                <input type="radio" name="ttid" value="3" disabled="true" />
                <span>爆款试用<span style="font-size:12px; margin-left:15px;">(即将上线)</span></span>
                <p>至少发放10件试用品，试客将在当天领取试用品并下单</p>
              </label>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!--//做任务-->
    <!--跳转按钮-->
    <div class="sbtn-box">
      <span><a class="s-next disabled">下一步</a><em>（填写商品信息）</em></span>
    </div>
    <!--//跳转按钮-->
  </div>
</form>

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
    //选择平台切换事件
    $("[name=pid]").click(function(){
      window.location = "/business/task_1/?type=" + $(this).attr("pinyin");
    })

    //下一步按钮是否跳转
    $(".s-next").click(function(){
      if(!$(this).hasClass("disabled")){
        $("#task_1").submit();
      }
    })

    //三个都选中按钮可操作
    if($(".sl").find("input").is(":checked") && $(".sc").find("input").is(":checked") && $(".sr").find("input").is(":checked")){
      $(".s-next").removeClass("disabled");
    }

    //选择平台、店铺、适用类型时效果
    $(".Release1 label").click(function(){
      if($(this).find('input').is(':checked')){
        $(this).parents('li').addClass('cur').siblings('li').removeClass('cur');
        $('.Release1').find('em').removeClass('num');
        $(this).find('em').addClass('num');
      };
    });
    $(".Release2 label").click(function(){
      $(this).parent("li").addClass("cur").siblings().removeClass("cur");
    });
    $(".Release3 label").click(function(){
      if($(this).children("input").attr("checked")=="checked"){
        $(this).parent("li").addClass("cur").siblings().removeClass("cur");
      }
    });
  })
</script>
</body>
</html>
