<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>商家发布任务第二步填写商品信息</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/stask2.css" rel="stylesheet" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/publish-task1.js"></script>
  <script type="text/javascript" src="/static/js/common.js"></script>
  <style type="text/css">
    .step-item span.error {padding-left:18px!important; display:block!important; margin:6px 0 2px 0!important;}
  </style>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">发布试用</a>
</div>

<div class="s-wrap J_FIVE_CONTENT">
  <form action="?" method="post" id="task_2" enctype="multipart/form-data">
    <%--<input name="task_id" type="hidden" value="563">--%>
    <input name="pid" type="hidden" value="">
    <input name="binding_id" type="hidden" value="">
    <input name="ttid" type="hidden" value="">
    <div class="stit">
      <h2><img src="/static/images/s-tit1.png" alt="发布试用" /></h2>
      <div class="Process">
        <ul class="clearfix">
          <li style="width:16%" class="cur"><em class="Processyes">1</em><span class="c-green">选平台</span></li>
          <li style="width:19%"><em class="Processing">2</em><span class="c-yellow">填写商品和订单信息</span></li>
          <li style="width:17%"><em>3</em><span>如何找到商品</span></li>
          <li style="width:17%"><em>4</em><span>设置试用份数</span></li>
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
      <h3>第二步：填写商品信息及运费</h3>
      <div class="tit-choose">已选择：<span id="select_type">${tempTask.mallPlatformId==1?'淘宝':'天猫'}</span>|<span>${business.wangWangId}</span>|<span>常规试用</span></div>
    </div>
    <!--内容区-->
    <div class="scontent">
      <!--步骤1-->
      <div id="step-1" class="step stepcur">
        <div class="step1-title">1.填写商品信息</div>
        <div class="step1-main">
          <div class="step1-main1">
            <!--确认与修改步骤一显示-->
            <div class="step-show" style="display:none;">
              <p><b>商品简称:</b><span class="span1"></span><a href="javascript:void(0)" class="alter" id="J_reset">修改</a></p>
              <p>
                <span class="span2">商品规格:<em class="em-norms mr20"></em><em class="em-norms1"></em></span>
                <span class="span3">单品售价：<em class="em-price"></em>元</span>
                <span class="span4">此商品每单拍<em class="em-number"></em>个</span>
              </p>
              <p><b>商品链接：</b><em class="em-href c-blue"></em></p>
            </div>
            <!--//确认与修改步骤一显示-->
            <div class="step-writ" style="display:block;;">
              <div class="step-writ-box">
                <div class="step-item">
                  <strong>商品简称：</strong>
                  <input type="text" name="shop_nickname" value="" class="text w285" reg="name" />
                  <span>必填</span>
                  <i>请输入试用品简称，不要和淘宝商品名相同，防止试客直接搜索名称购买</i>
                </div>
                <div class="step-item">
                  <strong>商品连接：</strong>
                  <input type="text" name="url" value="" class="text w540" reg="urls" id="good_url_val"/>
                  <span>必填</span><span id="J_url_msg"></span>
                  <p class="p1">琳琅会根据您填写的试用商品链接抓取对应淘宝商品的宝贝描述，展示在琳琅试用详情页</p>
                </div>
                <div class="step-item">
                  <strong>选择商品分类：</strong>
                  <select name="cate_id" class="w110">
                    <option value="1" >时尚女装</option>
                    <option value="11" >美食特产</option>
                    <option value="10" >百货日用</option>
                    <option value="9" >家居家纺</option>
                    <option value="8" >母婴用品</option>
                    <option value="7" >护肤彩妆</option>
                    <option value="6" >数码小家电</option>
                    <option value="5" >钟表首饰</option>
                    <option value="4" >运动户外</option>
                    <option value="3" >鞋类箱包</option>
                    <option value="2" >精品男装</option>
                    <option value="12" >车用周边</option>
                  </select>
                  <span>必填</span><i class="cor999">此分类为琳琅试用的分类</i>
                </div>
                <div class="step-item">
                  <strong>商品图：</strong>
                  <%--<iframe frameborder="0" scrolling="no" style="position:relative;top:15px;width:220px;height:38px;" src="/ajax/upload#task"></iframe>--%>
                  <input type="file" id="task_img" name="task_mimg"  />
                  <span>必填</span>
                  <i id="task_msg"><b style="color:#f00;">上传的商品图将会展示在琳琅网站</b>，图片大小为：600x600，格式为：jpg、png、gif</i>
                </div>
              </div>
              <div class="step-writ-box1">
                <div class="step-item">
                  <strong>规格：</strong>
                  <input type="text" name="productAttr1" value="" class="text w56" placeholder="如：颜色" />
                  <input type="text" name="productAttr2" data-cm="cm" value="" class="text w56" placeholder="如：尺码" />
                  <i>如需试客拍下指定规格，请填写此项，若无此要求，请不要填写</i>
                </div>
                <div class="step-item" id="onermb">
                  <strong>单品售价：</strong>
                  <input type="text" reg="price" name="price" value="0" class="text w60 haoma" onkeyup="value=value.replace(/[^\d.]/g,'')" onafterpaste="value=value.replace(/\D/g,'')"  onblur="javascript:if(this.value<0.01){this.value=0.01};"  />元<span>必填</span>
                  每单拍<input type="text" name="shop_number" value="1" class="text w60 qian"value="1" onchange="OnInput (event)" onblur="javascript:this.value=this.value.replace(/[^\d]/g,'');if(this.value<1){this.value=1};" onkeyup="this.value=this.value.replace(/\D/g,'')" />件<span>必填</span>
                  <i>下单总金额<em>0</em>元</i>
                </div>
              </div>
              <p class="f14 pb10"><i class="red">提示：</i>试客成功领取试用后，商家需按照提交的试用商品进行发货；若试客收到的商品与任务商品不一致，平台会对商家进行严厉处罚</p>
              <p class="checkout-btnp" style="display:block;"><a class="checkout-btn" href="javascript:;">确认提交信息</a></p>
            </div>
          </div>

        </div>
      </div>
      <!--//步骤1-->
      <!--步骤2-->
      <div id="step-3" class="step stepcss2">
        <div class="step1-title">2.设置商品收取运费的方式</div>
        <div class="step1-main"style="display:none;">
          <div class="step-show" style="display:none;">
            <em id="tishixinxi"></em><a href="javascript:void(0)" class="alter">修改</a>
          </div>
          <div class="step-writ" style="display:block;">
            <div class="fee_a">您发布的试用商品单价低于<span class="red">100</span>元，必须设置为<span class="red">全国包邮</span>，若试用商品不包邮任务将不会审核通过</div>
            <div class="fee_b">您发布的商品下单价大于<span class="red">100</span>元，您可以选择适用类型为“<span class="red">包邮试用</span>”或“<span class="red">付邮试用</span>”</div>
            <ul>

              <li id="fee_inp0"><label><input type="radio" value="0" name="freight" checked="checked" id="fee_input1"/>包邮试用：任务完成后，每单会扣除试客<span>5</span>金币作为运费补偿给商家<span class="pl-25">（推荐：吸引更多试客参与）</span></label></li>
              <li id="fee_input"><label><input type="radio" value="1" name="freight"/>付邮试用：需要试客支付运费</label></li>

            </ul>
            <p class="checkout-btnp"><a class="checkout-btn" href="javascript:;">确认提交信息</a></p>
          </div>
        </div>
      </div>
      <!--//步骤2-->
    </div>
    <!--//内容区-->
    <!--跳转按钮-->
    <div class="sbtn-box">
      <span><a href="/business/task_1" class="s-prev">上一步</a></span>
      <span><a class="s-next disabled J_FIVE_NEXT">下一步</a><em>（设置试用份数）</em></span>
    </div>
    <!--//跳转按钮-->
  </form>
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

    //判断下一步是否跳转
    $(".J_FIVE_NEXT").click(function(){
      if(!$(this).hasClass("disabled")){
        $("#task_2").submit();
      };
    });
    //计算下单金额
    $("#onermb input").keyup(function(){
      var $em = $("#onermb em");
      var $hao= $("#onermb .haoma").val();
      var $qian=$("#onermb .qian").val();
      var rmb = ($hao  * $qian).toFixed(2);
      $em.text(rmb);
    });

    //第一步提交 输入内容复制和第二步邮费状态
    $('#step-1 a.checkout-btn').click(function() {
      var $step1 = $("#step-1");
      $step1.find('span.span1').text($step1.find('input[name="shop_nickname"]').val());
      $step1.find('em.em-norms').text($step1.find('input[name="productAttr1"]').val());
      $step1.find('em.em-norms1').text($step1.find('input[data-cm="cm"]').val());
      $step1.find('em.em-price').text($step1.find('input[name="price"]').val());
      $step1.find('em.em-number').text($step1.find('input[name="shop_number"]').val());
      $step1.find('em.em-href').text($step1.find('input[name="url"]').val());
      //邮费低于100必须包邮判定
      var m =$step1.find('input[name="price"]').val();
      if((m-0)<100){
        $(".fee_b").hide();
        $(".fee_a").show();
        $('#fee_input').hide();
        $('#fee_input1').attr('checked','checked');
        $('#fee_inp0').hide();
      }else{
        $(".fee_a").hide();
        $(".fee_b").show();
        $('#fee_input').show();
        $("#fee_inp0").show();
      };

    })
    //第一步修改
    $('#J_reset').click(function(){
      $('#step-1').addClass('stepcur');
      $('#step-3').removeClass('stepcur');
      $('.J_FIVE_NEXT').addClass('disabled');
      $('.step1-main .step-writ').show();
      $('.step1-main .step-show').hide();
      $('#step-3 .step-writ').hide();
    });
    //第二步提交
    $("#step-3").find('.checkout-btn').click(function(){
      $('#step-3').removeClass('stepcur');
      $('#step-3 .step-writ').hide();
      $('#step-3 .step-show').show();
    });
    //第二步修改
    $("#step-3 .step-show .alter").click(function(){
      $('#step-3').addClass('stepcur');
      $('#step-3 .step-writ').show();
      $('#step-3 .step-show').hide();
      $(".J_FIVE_NEXT").addClass("disabled");
    });

    //第二步邮费信息
    $("#step-3 .checkout-btn").click(function(){
      var m =$("#step-1").find('input[name="price"]').val();
      if((m-0)<100){
        $("#tishixinxi").html("您发布的试用商品单价低于100元，必须设置为全国包邮，若试用商品不包邮任务将不会审核通过");
      }else{
        $("#tishixinxi").text($("#step-3 .step-writ label input:checked").parent('label').text());
      };
      $(".J_FIVE_NEXT").removeClass("disabled");
    })

    // 上传文件类型大小验证
    $('input[type="file"]').each(function(){
      $(this).change(function(){
        fileChange(this,1,'jpg|jpeg|png|gif',$(this).attr('checkfor'));
      });
    })


    $('#step-1 .checkout-btnp').find('a.checkout-btn').click(function(){
      var simg = $("#task_img").val();//获取上传地址
      if(simg==""){
        $("#task_msg").html('<span class="error" style="color:red; padding-left:18px; display:inline!important;">请上传商品图</span>')
        return false;
      }
    })

    //填写信息验证
    $('#step-1 .checkout-btnp').find('a.checkout-btn').click(function(event) {
      var $regList = $(".J_FIVE_CONTENT *[reg]");
      var _re = regForm($regList);
      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }

      //如果验证成功执行

      var simg = $("#task_img").val();//获取上传地址
      if(simg==""){
        $("#task_msg").html('<span class="error" style="color:red; padding-left:18px; display:inline!important;">请上传商品图</span>')
        return false;
      }

      var type = $("#select_type").html();//获取店铺类型
      var v =$("#good_url_val").val();//获取商品连接
      if(type=="淘宝"){
        if(v.indexOf("id")>0 && v.indexOf("tmall.com")<1 && v.indexOf("taobao.com")>0){
          $('#step-1').removeClass('stepcur');
          $('#step-1 .step-writ').hide();
          $('#step-1 .step-show').show();
          $('#step-3').addClass('stepcur');
          $('.step1-main').show();
          $('#step-3 .step-writ').show();
        }else{
          $("#J_url_msg").html("<span class='error'>请检查商品连接，是否为淘宝商品连接</span>")
        };
      }else if(type=="天猫"){
        if(v.indexOf("id")>0 && v.indexOf("tmall.com")>0 && v.indexOf("detail")>0){
          $('#step-1').removeClass('stepcur');
          $('#step-1 .step-writ').hide();
          $('#step-1 .step-show').show();
          $('#step-3').addClass('stepcur');
          $('.step1-main').show();
          $('#step-3 .step-writ').show();
        }else{
          $("#J_url_msg").html("请检查商品连接，是否为天猫商品连接")
        };
      }


    })

  });
</script>
</body>
</html>