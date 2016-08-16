<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>试客商家发布任务第四步</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <link href="/static/css/stask.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">发布试用</a>
</div>

<form action="?" method="post" id="task4">
  <input type="hidden" name="task_id" value="585">
  <input type="hidden" name="source" value="">

  <div class="s-wrap">

    <div class="stit">
      <h2><img src="/static/images/s-tit1.png" alt="发布试用" /></h2>
      <div class="Process">
        <ul class="clearfix">
          <li style="width:16%" class="cur"><em class="Processyes">1</em><span class="c-green">选平台</span></li>
          <li style="width:19%" class="cur"><em class="Processyes">2</em><span class="c-green">填写商品和订单信息</span></li>
          <li style="width:17%" class="cur"><em class="Processyes">3</em><span class="c-green">如何找到商品</span></li>
          <li style="width:17%"><em class="Processing">4</em><span class="c-yellow">设置试用份数</span></li>
          <li style="width:16%"><em>5</em><span>选择增值服务</span></li>
          <li style="width:15%"><em>6</em><span>支付</span></li>
          <li style="width:5%" class="Processlast"><em>7</em><span>发布成功</span></li>
        </ul>
      </div>
    </div>


    <div class="smsg">
      <p><i class="red">16:00</i>前发布的试用任务，将在当日审核后上线；<i class="red">16:00</i>后发布的试用任务，将在审核后，次日<i class="red">9:00</i>上线</p>
    </div>

    <div class="stitle">
      <h3>第四步：设置不同渠道的试用份数</h3>
      <div class="tit-choose">已选择：<span>淘宝</span>|<span>啥啥啥718</span>|<span>常规试用</span>|<span>数码小家电</span>|<span>1种进店渠道</span></div>
    </div>
    <!--内容区-->
    <div class="scontent">
      <div class="step4">


        <!---常规试用、爆款试用的发放份数-->
        <p class="taskarea">
        <div class="collection-num J_FV_STATE" style="margin-left:20px;">
          <label><input type='checkbox'  name="task_number" value="10" />10单</label>
          <label><input type='checkbox'  name="task_number" value="30" />30单</label>
          <label><input type='checkbox'  name="task_number" value="50" />50单</label>
          <label><input type='checkbox'  name="task_number" value="100" />100单</label>
          <label><input type='checkbox'  name="task_number" value="500" />500单</label>
          <label style="padding-right:0; margin-right:-5px;" class="custom-vistor">

            <input status="false" id="visitor" type='checkbox' checked="" name="visitor" value="other"/>自定义</label>
          <input id="test" type="text" AUTOCOMPLETE="off" name="task_number" class="visitor-num-text" style="width:58px; height:28px; border:1px solid #C5C5C5; line-height:28px; text-align:center; border-radius:3px; margin:0 10px;" onchange="OnInput (event)" onblur="javascript:this.value=this.value.replace(/[^\d]/g,'');if(this.value<3){this.value=3}; if(this.value>1000){this.value=1000}" value="3" onkeyup="this.value=this.value.replace(/\D/g,'')" />个<i>(3-1000单)</i>
        </div>
        </p>

        <p class="txt1">您已选择发布试用商品：<span class="dan-num" id="orders">0</span>单，请分别设置以下<span id="source">1</span>个订单来源的订单数：</p>
        <ul class="uu">
          <!-- <li class="action u_tb"> -->
          <li class=" u_tb"><em><span>淘宝</span>自然搜索</em><input name="source[1][source_number]" value="0" p_ac ="0.5" type="text" class="text w65" onkeyup="javascript:this.value=this.value.replace(/[^\d]/g,'');if(this.value<0){this.value=0;}" onafterpaste="this.value=this.value.replace(/\D/g,'')" />单<i></i></li>
          <li class="none alter_tb"><span>淘宝</span>自然搜索<span class="red"> 0 </span>单 <i></i></li>
        </ul>

        <div class="uukey">
          <!--淘宝-->
          <div class="seekbox1 b_tb none">
            <p class="pb15 f14">请设置每个自然搜索来源关键词的订单数；注：订单总数之和需为<i class="red taobao_f">0：</i></p>
            <ul>
              <li><i class="play_small play_taobao"></i>淘宝关键词1: 智能手表<input name="source[1][so][0][number]" type="text" class="text w65"  onkeyup="javascript:this.value=this.value.replace(/[^\d]/g,'');if(this.value<0){this.value=0;}" onafterpaste="this.value=this.value.replace(/\D/g,'')" />单</li>
            </ul>
            <p class="p1"><i class="red taobao_f">0</i>单中将有：<i class="red sq_taobao">0</i>单通过试客申请，获得试用资格；<i class="red jb_taobao">0</i>单通过金币兑换直接获取试用资格</p>
            <p><a class="btn">确 认</a></p>
            <p id="xx_tb" class="none">[<a class="c_blue">修改试用份数</a>]</p>
          </div>                				<!--各个渠道的内容显示-->

        </div>

        <div class="cl">
          <p class="pb15">请设置每日平台发放试用份数：<input type="text" name="today_put_number" class="text w65" id="Platform" onkeyup="this.value=this.value.replace(/\D/g,'')" />份，试用活动预计将在平台展示<i class="red" id="j_day"></i>天。</p>
        </div>

      </div>
    </div>
    <!--//内容区-->
    <!--跳转按钮-->
    <div class="sbtn-box">
      <span><a href="/business/task_3/585" class="s-prev">上一步</a></span>
      <span><a class="s-next">下一步</a><em>（选择增值服务）</em></span>
    </div>
    <!--//跳转按钮-->
  </div>
</form>

<!--费用小计-->
<div class="s-wrap">
  <div class="moneybox">
    <p class="m-tit">费用小计</p>
    <div class="moneycc">
      商品押金：<em id="j_cash">300.00</em>元/单 × <em class="dan-num">0</em>单<span>
            试用完成后，平台直接将押金返还给试客</span><strong><em class="numall">0</em>元</strong>
    </div>
    <div class="moneycc">
      试用担保金：<em id="j_dbj">300.00</em>元/单 × <em class="dan-num">0</em>单 × <em>5%</em><span>
		    
            试用完成后，试用担保金系统将会自动返回至您的琳琅账户</span><strong><em class="dbjall">0</em>元</strong>
    </div>
  </div>
</div>
<!--//费用小计-->

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

    //默认选择单数
    var task_number = 0;
    var number_box = $(".collection-num").find("input");
    if(task_number > 0){
      $.each(number_box,function(){
        if($(this).val() == task_number){
          $(this).attr("checked",true);
        }else{
          $("#test").val(task_number);
        }
      })
    }


    function prevstep(a,b,c,d,e){//加载页面触发(其实就是返回上一步加载)
      var v = $('.'+a).find('input').val();
      var b =	$('.'+b);
      if(v>0){
        $('.'+c).text(v);
        if(v==""||v==0){
          b.find('.'+d).text(0);
          b.find('.'+e).text(0);
          $(".taobao_f").html(0);
        }else if(v<5){
          b.find('.'+d).text(v);
          b.find('.'+e).text(0);
        }else if(v<1001){
          b.find('.'+d).text(v-(Math.ceil(v*0.2)));
          b.find('.'+e).text(Math.ceil(v*0.2));
        }
      }
    }
    prevstep('u_tb','b_tb','taobao_f','sq_taobao','jb_taobao');
    prevstep('u_sjtb','b_sj','sjtb_f','sq_sj','jb_sj');
    prevstep('u_sina','b_sina','sina_f','sq_sina','jb_sina');
    prevstep('u_qq','b_qq','qq_f','sq_qq','jb_qq');
    prevstep('u_tuz','b_tuz','tuz_f','sq_tuz','jb_tuz');
    prevstep('u_tm','b_tm','tm_f','sq_tm','jb_tm');
    prevstep('u_tjb','b_tjb','tjb_f','sq_tjb','jb_tjb');
    prevstep('u_tb','b_tb','taobao_f','sq_taobao','jb_taobao');


    function daynum(){//加载页面触发(其实就是返回上一步加载)
      var d = $('#Platform').val();//获取上一步试用份数的值
      var n = 0;//获取上一步返回的总单数
      if(d>0){
        if(parseInt(n/d)<1){
          $("#j_day").text(1)
        }else{
          $("#j_day").text(Math.ceil(n/d))
        }
      };
    }
    daynum();


    function selectnum(){//页面加载时，自动执行选择单数
      $(".collection-num label input").eq(0).attr("checked","checked")
      var dannum = $(".collection-num label input").eq(0).val();
      var cash = $("#j_cash").text();
      var dbj = $("#j_dbj").text();
      var numall = parseFloat(dannum) * parseFloat(cash);

      var dbjall = (parseFloat(dannum) * parseFloat(dbj) * 0.05).toFixed(2);


      //var dbjall = parseFloat(dannum) * parseFloat(dbj) * 0.05;
      $(".dan-num").html(dannum);
      $(".numall").html((numall).toFixed(2));
      $(".dbjall").html(dbjall);
    }

    //上一步的时候判定
    var yz4 = $("#visitor").attr("checked");
    if(!yz4){
      selectnum();
    }else{
      var dannum = $("#test").val();
      var cash = $("#j_cash").text();
      var dbj = $("#j_dbj").text();
      var numall = parseFloat(dannum) * parseFloat(cash);

      var dbjall = (parseFloat(dannum) * parseFloat(dbj) * 0.05).toFixed(2);


      //var dbjall = parseFloat(dannum) * parseFloat(dbj) * 0.05;
      $(".dan-num").html(dannum);
      $(".numall").html((numall).toFixed(2));
      $(".dbjall").html(dbjall);
    }


    //加载时执行
    $(".uu li").eq(0).addClass("action");//添加演示
    $(".uukey div").eq(0).show();//展示
    var source = $("ul.uu").find("input").size();//订单来源统计
    $("#source").html(source);

    //算申请金币兑换比例0518
    $('input[name="source[1][source_number]"]').keyup(function(){
      var v = $(this).val();
      var b =	$(".b_tb");
      $(".taobao_f").html(v);

      if(v==""||v==0){
        b.find(".sq_taobao").text(0);
        b.find(".jb_taobao").text(0);
        $(".taobao_f").html(0);
      }else if(v<5){
        b.find(".sq_taobao").text(v);
        b.find(".jb_taobao").text(0);
      }else if(v<1001){
        b.find(".sq_taobao").text(v-(Math.ceil(v*0.2)));
        b.find(".jb_taobao").text(Math.ceil(v*0.2));
      }else {
        alert("订单数量不能大于1000")
      }
    })

    $('input[name="source[2][source_number]"]').keyup(function(){
      var v = $(this).val();
      var b =	$(".b_tm");
      $(".tm_f").html(v);

      if(v==""||v==0){
        b.find(".sq_tm").text(0);
        b.find(".jb_tm").text(0);
        $(".tm_f").html(0);
      }else if(v<5){
        b.find(".sq_tm").text(v);
        b.find(".jb_tm").text(0);
      }else if(v<1001){
        b.find(".sq_tm").text(v-(Math.ceil(v*0.2)));
        b.find(".jb_tm").text(Math.ceil(v*0.2));
      }else {
        alert("订单数量不能大于1000")
      }
    })

    $('input[name="source[7][source_number]"]').keyup(function(){
      var v = $(this).val();
      var b =	$(".b_sj");
      $(".sjtb_f").html(v);

      if(v==""||v==0){
        b.find(".sq_sj").text(0);
        b.find(".jb_sj").text(0);
        $(".sjtb_f").html(0);
      }else if(v<5){
        b.find(".sq_sj").text(v);
        b.find(".jb_sj").text(0);
      }else if(v<1001){
        b.find(".sq_sj").text(v-(Math.ceil(v*0.2)));
        b.find(".jb_sj").text(Math.ceil(v*0.2));
      }else {
        alert("订单数量不能大于1000")
      }
    })

    $('input[name="source[3][source_number]"]').keyup(function(){
      var v = $(this).val();
      var b =	$(".b_tjb");
      $(".tjb_f").html(v);

      if(v==""||v==0){
        b.find(".sq_tjb").text(0);
        b.find(".jb_tjb").text(0);
        $(".tjb_f").html(0);
      }else if(v<5){
        b.find(".sq_tjb").text(v);
        b.find(".jb_tjb").text(0);
      }else if(v<1001){
        b.find(".sq_tjb").text(v-(Math.ceil(v*0.2)));
        b.find(".jb_tjb").text(Math.ceil(v*0.2));
      }else {
        alert("订单数量不能大于1000")
      }
    })

    $('input[name="source[4][source_number]"]').keyup(function(){
      var v = $(this).val();
      var b =	$(".b_tuz");
      $(".tuz_f").html(v);

      if(v==""||v==0){
        b.find(".sq_tuz").text(0);
        b.find(".jb_tuz").text(0);
        $(".tuz_f").html(0);
      }else if(v<5){
        b.find(".sq_tuz").text(v);
        b.find(".jb_tuz").text(0);
      }else if(v<1001){
        b.find(".sq_tuz").text(v-(Math.ceil(v*0.2)));
        b.find(".jb_tuz").text(Math.ceil(v*0.2));
      }else {
        alert("订单数量不能大于1000")
      }
    })

    $('input[name="source[5][source_number]"]').keyup(function(){
      var v = $(this).val();
      var b =	$(".b_sina");
      $(".sina_f").html(v);

      if(v==""||v==0){
        b.find(".sq_sina").text(0);
        b.find(".jb_sina").text(0);
        $(".sina_f").html(0);
      }else if(v<5){
        b.find(".sq_sina").text(v);
        b.find(".jb_sina").text(0);
      }else if(v<1001){
        b.find(".sq_sina").text(v-(Math.ceil(v*0.2)));
        b.find(".jb_sina").text(Math.ceil(v*0.2));
      }else {
        alert("订单数量不能大于1000")
      }
    })
    $('input[name="source[6][source_number]"]').keyup(function(){
      var v = $(this).val();
      var b =	$(".b_qq");
      $(".qq_f").html(v);

      if(v==""||v==0){
        b.find(".sq_qq").text(0);
        b.find(".jb_qq").text(0);
        $(".qq_f").html(0);
      }else if(v<5){
        b.find(".sq_qq").text(v);
        b.find(".jb_qq").text(0);
      }else if(v<1001){
        b.find(".sq_qq").text(v-(Math.ceil(v*0.2)));
        b.find(".jb_qq").text(Math.ceil(v*0.2));
      }else {
        alert("订单数量不能大于1000")
      }
    })


    //算平台展示天数
    $("input#Platform").keyup(function(){
      var s = Number($("#orders").text());
      var y = $(this).val();
      if(parseInt(s/y)<1){
        $("#j_day").text(1)
      }else{
        $("#j_day").text(Math.ceil(s/y))
      }
      if(s<y){
        alert("每日发放试用份数不能大于总份数")
        $(this).attr("value","");
      }
    })


    //提交表单判断
    $(".s-next").click(function(){
      var day = $("#j_day").text();//试用活动预计将在平台展示天
      var s=0;
      $("ul.uu").find("input").each(function(){
        var a=Number($(this).val());
        s+=a;
      })
      var aa = Number($("#orders").html());
      if(s==aa){

        if($("ul.uu").find("input").parent("li:even").is(":visible")){
          alert("需全部确认所选择的订单来源");
        }else{
          if($("#Platform").val()==""){
            alert("请设置每日平台发放试用份数")
          }else if(day>30){
            alert("平台展示天数不能超过30天,请重新设置每日平台发放试用份数")
          }else{
            $("#task4").submit();//提交表单
          }
        }

      }else{
        alert("订单总数需等于所选择的试用份数");
      }

    })


    //切换渠道事件
    $("ul[class=uu] li").click(function(){
      var _input = $(this).find("input"),
              _name_str = _input.attr("name"),
              cc = _input.val() ? _input.val() : 0;
      $("."+_name_str+"_f").html(cc);
      //渠道份数值变动事件
      _input.bind("keyup",function(){
        var cc = _input.val() ? _input.val() : 0;
        $("."+_name_str+"_f").html(cc);
      })
    })


    //淘宝确认判定
    $(".b_tb a.btn").click(function(){

      var h = $(".u_tb").find("input").val();
      if(h==""||h==0){
        alert("请先填写订单来源渠道的订单数")
        return false;
      }

      var s=0;
      $(".b_tb").find("input").each(function(){
        var a=Number($(this).val());
        s+=a;
      })
      var aa = Number($(".u_tb input").val());
      if(s==aa){
        $(".u_tb").hide();//淘宝子订单数量相等的时候执行
        $(".alter_tb").show().addClass("action");
        $(".alter_tb").find("span").eq(1).text($(".u_tb").find("input").val());
        $("#xx_tb").show();
        $(".b_tb .btn").hide();
        $(".b_tb").find("input").attr("readonly","readonly").addClass("w30").css({"border":"none","color":"red","text-align":"center"});

      }else{
        alert("订单数量不相等");
      }
    })

    //天猫确认判定
    $(".b_tm a.btn").click(function(){

      var h = $(".u_tm").find("input").val();
      if(h==""||h==0){
        alert("请先填写订单来源渠道的订单数")
        return false;
      }

      var s=0;
      $(".b_tm").find("input").each(function(){
        var a=Number($(this).val());
        s+=a;
      })
      var aa = Number($(".u_tm input").val());
      if(s==aa){
        $(".u_tm").hide();
        $(".alter_tm").show().addClass("action");
        $(".alter_tm").find("span").eq(1).text($(".u_tm").find("input").val());
        $("#xx_tm").show();
        $(".b_tm .btn").hide();
        $(".b_tm").find("input").attr("readonly","readonly").addClass("w30").css({"border":"none","color":"red","text-align":"center"});

      }else{
        alert("订单数量不相等");
      }
    })

    //手机淘宝确认判定
    $(".b_sj a.btn").click(function(){

      var h = $(".u_sjtb").find("input").val();
      if(h==""||h==0){
        alert("请先填写订单来源渠道的订单数")
        return false;
      }

      var s=0;
      $(".b_sj").find("input").each(function(){
        var a=Number($(this).val());
        s+=a;
      })
      var aa = Number($(".u_sjtb input").val());
      if(s==aa){
        $(".u_sjtb").hide();
        $(".alter_sjtb").show().addClass("action");
        $(".alter_sjtb").find("span").eq(1).text($(".u_sjtb").find("input").val());
        $("#xx_sj").show();
        $(".b_sj .btn").hide();
        $(".b_sj").find("input").attr("readonly","readonly").addClass("w30").css({"border":"none","color":"red","text-align":"center"});

      }else{
        alert("订单数量不相等");
      }
    })

    //新浪微博确认判定
    $(".b_sina a.btn").click(function(){

      var h = $(".u_sina").find("input").val();
      if(h==""||h==0){
        alert("请先填写订单来源渠道的订单数")
        return false;
      }

      var s=0;
      $(".b_sina").find("input").each(function(){
        var a=Number($(this).val());
        s+=a;
      })
      var aa = Number($(".u_sina input").val());
      if(s==aa){
        $(".u_sina").hide();
        $(".alter_sina").show().addClass("action");
        $(".alter_sina").find("span").eq(1).text($(".u_sina").find("input").val());
        $("#xx_sina").show();
        $(".b_sina .btn").hide();
        $(".b_sina").find("input").attr("readonly","readonly").addClass("w30").css({"border":"none","color":"red","text-align":"center"});

      }else{
        alert("订单数量不相等");
      }
    })

    //QQ空间确认判定
    $(".b_qq a.btn").click(function(){

      var h = $(".u_qq").find("input").val();
      if(h==""||h==0){
        alert("请先填写订单来源渠道的订单数")
        return false;
      }

      var s=0;
      $(".b_qq").find("input").each(function(){
        var a=Number($(this).val());
        s+=a;
      })
      var aa = Number($(".u_qq input").val());
      if(s==aa){
        $(".u_qq").hide();
        $(".alter_qq").show().addClass("action");
        $(".alter_qq").find("span").eq(1).text($(".u_qq").find("input").val());
        $("#xx_qq").show();
        $(".b_qq .btn").hide();
        $(".b_qq").find("input").attr("readonly","readonly").addClass("w30").css({"border":"none","color":"red","text-align":"center"});

      }else{
        alert("订单数量不相等");
      }
    })

    //淘金币确认判定
    $(".b_tjb").find("a.btn").click(function(){//淘金币
      var h = $(".u_tjb").find("input").val();
      if(h==""||h==0){
        alert("请先填写订单来源渠道的订单数")
        return false;
      }
      $(".u_tjb").hide();
      $(".alter_tjb").show().addClass("action");
      $("#xx_tjb").show();
      $(".b_tjb .btn").hide();
      $(".alter_tjb").find("span").eq(1).text($(".u_tjb").find("input").val());
    });

    //淘u站确认判定
    $(".b_tuz").find("a.btn").click(function(){//淘u站
      var h = $(".u_tuz").find("input").val();
      if(h==""||h==0){
        alert("请先填写订单来源渠道的订单数")
        return false;
      }
      $(".u_tuz").hide();
      $(".alter_tuz").show().addClass("action");
      $("#xx_tuz").show();
      $(".b_tuz .btn").hide();
      $(".alter_tuz").find("span").eq(1).text($(".u_tuz").find("input").val());
    });



    //各平台搜索
    $("ul.uu li").click(function(){
      $(this).addClass('action').siblings('li').removeClass('action');
    })
    $(".u_tb").click(function(){
      $(".b_tb").show().siblings().hide();
    })
    $(".u_tm").click(function(){
      $(".b_tm").show().siblings().hide();
    })
    $(".u_sjtb").click(function(){
      $(".b_sj").show().siblings().hide();
    })
    $(".u_tjb").click(function(){
      $(".b_tjb").show().siblings().hide();
    })
    $(".u_tuz").click(function(){
      $(".b_tuz").show().siblings().hide();
    })
    $(".u_sina").click(function(){
      $(".b_sina").show().siblings().hide();
    })
    $(".u_qq").click(function(){
      $(".b_qq").show().siblings().hide();
    });

    //点击确认后的左侧
    $("li.alter_tb").click(function(){
      $(".b_tb").show().siblings().hide()
    })
    $("li.alter_tm").click(function(){
      $(".b_tm").show().siblings().hide()
    })
    $("li.alter_sjtb").click(function(){
      $(".b_sj").show().siblings().hide()
    })
    $("li.alter_tjb").click(function(){
      $(".b_tjb").show().siblings().hide()
    })
    $("li.alter_tuz").click(function(){
      $(".b_tuz").show().siblings().hide()
    })
    $("li.alter_sina").click(function(){
      $(".b_sina").show().siblings().hide()
    })
    $("li.alter_qq").click(function(){
      $(".b_qq").show().siblings().hide()
    })


    //各平台修改0507
    $("#xx_tb").click(function(){//淘宝
      $(this).hide();
      $(".alter_tb").hide();
      $(".u_tb").show().addClass("action");
      $(".b_tb .btn").show();
      $(".b_tb").show().siblings().hide();
      $(".b_tb").find("input").removeAttr("readonly","readonly").removeClass("w30").css({"border":"1px solid #c5c5c5","color":"#555","text-align":"left"});
    })

    $("#xx_tm").click(function(){//天猫
      $(this).hide();
      $(".alter_tm").hide();
      $(".u_tm").show().addClass("action");
      $(".b_tm .btn").show();
      $(".b_tm").show().siblings().hide();
      $(".b_tm").find("input").removeAttr("readonly","readonly").removeClass("w30").css({"border":"1px solid #c5c5c5","color":"#555","text-align":"left"});
    })

    $("#xx_sj").click(function(){//手机淘宝
      $(this).hide();
      $(".alter_sjtb").hide();
      $(".u_sjtb").show().addClass("action");
      $(".b_sj .btn").show();
      $(".b_sj").show().siblings().hide();
      $(".b_sj").find("input").removeAttr("readonly","readonly").removeClass("w30").css({"border":"1px solid #c5c5c5","color":"#555","text-align":"left"});
    })

    $("#xx_tjb").click(function(){//淘金币
      $(this).hide();
      $(".alter_tjb").hide();
      $(".u_tjb").show().addClass("action");
      $(".b_tjb .btn").show();
      $(".b_tjb").show().siblings().hide();
    })

    $("#xx_tuz").click(function(){//淘宝u站
      $(this).hide();
      $(".alter_tuz").hide();
      $(".u_tuz").show().addClass("action");
      $(".b_tuz .btn").show();
      $(".b_tuz").show().siblings().hide();
    })

    $("#xx_sina").click(function(){//新浪
      $(this).hide();
      $(".alter_sina").hide();
      $(".u_sina").show().addClass("action");
      $(".b_sina .btn").show();
      $(".b_sina").show().siblings().hide();
      $(".b_sina").find("input").removeAttr("readonly","readonly").removeClass("w30").css({"border":"1px solid #c5c5c5","color":"#555","text-align":"left"});
    })

    $("#xx_qq").click(function(){//QQ空间
      $(this).hide();
      $(".alter_qq").hide();
      $(".u_qq").show().addClass("action");
      $(".b_qq .btn").show();
      $(".b_qq").show().siblings().hide();
      $(".b_qq").find("input").removeAttr("readonly","readonly").removeClass("w30").css({"border":"1px solid #c5c5c5","color":"#555","text-align":"left"});
    })



  })
</script>


<script type="text/javascript">
  $(function(){
    //数量选择时相应的效果
    $(".collection-num label").click(function(){
      if(($(this).index()) == 5){
        if($("#visitor").attr("checked") == "checked"){
          $("#visitor").attr("status","true");
          $("#test").attr("disabled",false);
        }else{
          $("#visitor").attr("status","false");
          $("#test").attr("disabled",true).attr("value","10");
        }
        var dannum = $("#test").val();
        var cash = $("#j_cash").text();//商品押金
        var dbj = $("#j_dbj").text();//商品担保金
        var numall = parseFloat(dannum) * parseFloat(cash);

        var dbjall = (parseFloat(dannum) * parseFloat(dbj) * 0.05).toFixed(2);

        //var dbjall = parseFloat(dannum) * parseFloat(dbj) * 0.05;

        $(".dan-num").html(dannum);
        $(".numall").html((numall).toFixed(2));
        $(".dbjall").html(dbjall);
      }else {
        $("#visitor").attr("status","false");
        $("#test").attr("disabled",true).attr("value","10");
        var dannum = $(this).children("input").val();
        var cash = $("#j_cash").text();//商品押金
        var dbj = $("#j_dbj").text();//商品担保金
        var numall = parseFloat(dannum) * parseFloat(cash);
        var dbjall = (parseFloat(dannum) * parseFloat(dbj) * 0.05).toFixed(2);
        //var dbjall = parseFloat(dannum) * parseFloat(dbj) * 0.05;
        $(".dan-num").html(dannum);
        $(".numall").html((numall).toFixed(2));
        $(".dbjall").html(dbjall);
      }

    })
  })

  $('.J_FV_STATE label').click(function(){
    var $this = $(this),$par = $this.parent();
    if($('.J_FV_STATE').find('input:checked').length>0){
      $this.siblings().find('input').removeAttr('checked');
      var _zk = $this.find('input').attr('data-zk')||0;
      var _enable = $this.find('input').attr('data-enable')||0;
      if(_enable==0){
        _enable = $('.data-enable').val()||0;
      }
      $('.J_total').text(_enable);
      $('.J_rqf_zk').text(_zk);

    }else{
      $this.find('input').attr('checked','checked');
    }

  });

  //自定义个数方法
  function OnInput (event) {
    var dannum = parseFloat(event.target.value);
    if(dannum<3){
      dannum = 3;
    }else if(dannum>1000){
      dannum = 1000;
    }

    var cash = $("#j_cash").text();//商品押金
    var dbj = $("#j_dbj").text();//商品担保金
    var numall = parseFloat(dannum) * parseFloat(cash);
    var dbjall = (parseFloat(dannum) * parseFloat(dbj) * 0.05).toFixed(2);

    //var dbjall = parseFloat(dannum) * parseFloat(dbj) * 0.05;
    $(".dan-num").html(dannum);
    $(".numall").html((numall).toFixed(2));
    $(".dbjall").html(dbjall);

  }
</script>

</body>
</html>