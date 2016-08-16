<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>确认收货并好评</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/bbs_like.css" rel="stylesheet" />
  <link rel="stylesheet" href="/static/css/common.css" />
  <script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/common.js"></script>
</head>
<body>
<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />
<div class="sbreadcrumbs">
  <a href="/">>首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">确认收货并好评</a>
</div>

<!--wrap-->
<div class="g-wrap clearfix">
  <div class="g-box clearfix">

    <div class="bbs-like">
      <h2>确认收货并好评</h2>
      <div class="bd-cc">
        <!--left-->
        <div class="bd-cc-l">
          <h3>店铺</h3>
          <ul>
            <li class="active"><b></b><label><a href="/buyer/waitting_get/1228"><input type="radio" name="binding_type" checked /> <i class="play_small play_taobao"></i>成品豆豆</a><span class="c-yellow">1</span></label></li>
            <li class="active"><b></b><label><a href="/buyer/waitting_get/1268"><input type="radio" name="binding_type"  /> <i class="play_small play_taobao"></i>西霸数码专营店</a><span class="c-yellow">1</span></label></li>
            <!-- <li class="active"><b></b><label><a><input checked="checked" type="radio" name="binding_type" /> <i class="play_small play_taobao"></i>店铺</a><span class="c-yellow">1</span></label></li>
<li><b></b><label><a><input type="radio" name="binding_type" /> <i class="play_small play_taobao"></i>宁美国度装机旗舰店</a><span>1</span></label></li>
<li><b></b><label><a><input type="radio" name="binding_type" /> <i class="play_small play_tmall"></i>宁美国度装机旗舰店</a><span>0</span></label></li> -->
          </ul>
        </div>
        <!--//left-->
        <!--右侧-->
        <div class="bd-cc-r">
          <div class="bbs-r clearfix">
            <p class="good_tit">请访问<i class="red">www.taobao.com</i>，登录账号：<i class="red">coolcooldee</i>，在网站导航【<i class="red">已买到的宝贝</i>】中找到以下商品</p>

            <!--商品内容(有设置关键字的状态)-->
            <div>
              <h3>好评商品1:<span class="fr">赏金：<i class="red">0</i>金币</span></h3>

              <div class="cc_box1">
                <p>第一步.在【<i class="red">待收货</i>】中找到试用商品</p>
                <div class="f_mtb10">
                  <img src="/upload/2/3/5/a6398bbc42c5310311d455c608ae9c86.jpg" alt="pic" width="40" height="40" style="vertical-align:middle" />
                  迷迭香精油 <a href="/task_info/index/1228" class="fr c-blue">查看任务详情 ></a>
                </div>
              </div>
              <!-- 根据状态判断显示文案 -->

              <div class="copy-cc-box clearfix">
                <p class="tit">第二步.点击【<i class="red">确认收货</i>】后，请根据商家提供的以下关键字，独自撰写评价内容并提交好评</p>
                <p style="color:#f00; font-size:14px;">严禁复制、抄袭、拼凑他人评价，一经发现，直接禁封琳琅试客账号！</p>
                <div class="copy-box">
                  <p>&nbsp;</p>
                  <div class="copykey-box clearfix">
                    <div class="copykey-box-l">关键字：</div>
                    <div class="copykey-box-r">
                      <p class="red">禁止直接复制粘贴商家提供的关键字作为评价内容</p>
                      <ul>
                        <li>,,</li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <!-- <form action="/buyer/waitting_get_upimg" method="post" id="from-pic" enctype="multipart/form-data">
                  <input type="hidden" name="task_id" value=" " />
                  <div class="file-box inp">
                      第三步.将已评价的内容截图，并上传至琳琅<br /><br />
                      上传图文好品截图：<input type="file" name="pic" regname="goodpic" emptyerr="截图不能为空，大小不超过2Mb" />
                  </div>
                  <div class="bbs-btn-box"><a class="btn">提交评价</a></div>
              </form> -->
              <form action="/buyer/waitting_get_comment_show" method="post" id="from-pic" enctype="multipart/form-data">
                <input type="hidden" name="task_id" value="1228 " />
                <div class="file-box inp">

                  第三步.将已评价的内容，发布在琳琅<br /><br />
                  <i class="fl">好评内容： </i><textarea name="comment" style="border:1px solid #ccc; width:460px; height:110px; float:left;"  regname="reviewtxt" emptyerr="评价内容不能为空"></textarea>
                </div>
                <p class="bbs_msg cb">评价内容不能包含“<i class="red">刷单</i>”、“<i class="red">试用</i>”、“<i class="red">琳琅国货</i>”、“<i class="red">团购</i>”、“<i class="red">免费送</i>”等关键词</p>

                <!-- 如果商家选择了真人秀, 则显示真人秀上传模块 -->

                <div class="bbs-btn-box" style="text-align:left;"><a class="btn">提交评价</a>&nbsp;&nbsp;&nbsp;<span>请按照好评要求进行评价，否则平台将会冻结您的账户，试用本金将不予提现</span></div>
              </form>

            </div>
            <!--//商品内容(有设置关键字的状态)-->


          </div>
        </div>
        <!--//右侧-->

      </div>

      <div class="btn-return-box"><a href="/member" class="return">返回个人中心 ></a></div>
      <div class="bd-msg">
        <h3>注意：</h3>
        <p>• 在订单快递状态变为“<i class="red">已签收</i>”前请勿操作“确认收货”</p>
        <p>• 不能给商家“<i class="red">中差评</i>”或低于“<i class="red">4星好评</i>”，否则平台将会冻结您的账户，账户押金将不予提现</p>
        <p>• 评价内容不能包含“<i class="red">刷单</i>”、“<i class="red">试用</i>”、“<i class="red">琳琅国货</i>”、“<i class="red">团购</i>”、“<i class="red">免费送</i>”等关键词</p>
      </div>
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
  <p>Copyright © 2015 zhongguohuo.com 版权所有 浙ICP备09002461号-1</p>
</div>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
<script type="text/javascript">
  $(function(){

    //左侧选择店铺样式
    $(".bd-cc-l label").click(function(){
      if($(this).find('input').is(':checked')){
        $(this).parents('li').addClass('active').siblings('li').removeClass('active');
        var a = $(this).children('a').attr("href");
        location.href=a;
        $('.bd-cc-l').find('span').removeClass('c-yellow');
        $(this).find('span').addClass('c-yellow');
      };
    });

    //表单验证
    $('.bd-cc-r').Validform({
      btncls : '.btn',
      callback : function(){
        $('#from-pic').submit();
      }
    });


    // 上传图片验证
    $('input[type="file"]').each(function(){
      $(this).change(function(){
        fileChange(this,2,'jpg|jpeg|png|gif',$(this).attr('checkfor'));
      });
    });


  })
</script>
</body>
</html>