<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>购买VIP</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link rel="stylesheet" href="/static/css/main.css" />
  <link rel="stylesheet" href="/static/css/common.css" />
  <script language="javascript" src="/static/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div id="header"><h2>易试用</h2></div>
<div id="main">
  <div class="business-top">
    <h3>选择会员等级</h3>
    <div class="Process Select4" style="display:none;">
      <ul class="clearfix">
        <li class="cur" style="width:33%"><em class="Processyes">1<i></i></em><span class="c-green">填写注册信息</span><strong></strong></li>
        <li class="" style="width:33%"><em class="Processing">2<i></i></em><span class="c-yellow">选择会员类型</span><strong></strong></li>
        <li class="" style="width:33%"><em class="">3<i></i></em><span class="">购买会员</span><strong></strong></li>
        <li class="Processlast" style="width:82px;"><em class="">4<i></i></em><span class="">完善信息</span><strong></strong></li>
      </ul>
    </div>
    <div class="Process Select3" >
      <ul class="clearfix">
        <li class="cur" style="width:50%"><em class="Processyes">1<i></i></em><span class="c-green">填写注册信息</span><strong></strong></li>
        <li class="" style="width:50%"><em class="Processing">2<i></i></em><span class="c-yellow">选择会员类型</span><strong></strong></li>
        <li class="Processlast" style="width:82px;"><em class="">3<i></i></em><span class="">完善信息</span><strong></strong></li>
      </ul>
    </div>
  </div>

  <input id="url" type="hidden" value="/register/buyer?type=1" />

  <div class="vip-grade" style="height:420px;">
    <div class="grade">

      <div id="grades" class="grades">
        <h1>普通试客</h1>
        <h3>免费</h3>
        <p>注册成功后送<span>2</span>金币（价值2元）</p>
        <p>每天最多<span>1</span>次通过机会</p>
      </div>

      <div id="vip-grades">
        <h1>VIP试客<span>(敬请期待)</span></h1>
        <h3><span>12</span>元/年</h3>
        <p>注册成功后送<span>12</span>个金币（价值12元）</p>
        <p>每天最多<span>5</span>次通过机会</p>
      </div>

    </div>
    <div class="grade-footer" style="border:none; text-align:center; padding-top:50px;"><i class="red">提示：</i>1金币=1元人民币，金币可以兑换试用通过资格和指定商品，不可提现。</div>
    <a href="javascript:;" class="tijiao">下一步</a>
  </div>

</div>

<!--footer-->
<jsp:include page="/include/footer.jsp" />
<script type="text/javascript">
  $(function(){
    var url = $("#url");

    //点击选择类型效果
    $("#grades").click(function(){
      $(this).addClass("grades");
      url.val("/register/buyer?type=1");
      $("#vip-grades").removeClass("vip-grades");
      $(".Select3").show();
      $(".Select4").hide();
    });
    $("#vip-grades").click(function(){
      $(this).addClass("vip-grades");
      url.val("/buyer/renewal_vip");
      $("#grades").removeClass("grades");
      $(".Select3").hide();
      $(".Select4").show();
    });

    //表单提交
    $(".tijiao").click(function(){
      window.location = url.val();
    })

  })
</script>
</body>
</html>