<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>商品详情</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/mai_new.css" rel="stylesheet" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/common.js"></script>
</head>
<body>
<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="javascript:;">商品详情</a>
</div>
<div style="width:1000px; height:90px; margin:0 auto 10px;"><a href="http://bbs.zhongguohuo.com/thread-1032930-1-1.html" target="_blank"><img src="/static/images/banner/banner907.png"></a></div>
<!--wrap-->
<div class="mwrap">
  <!--商品展示-->
  <div class="topbox clearfix">
    <div class="leftbox">
      <h3><i class="icon icon_taobao"></i>${task.productName}</h3>
      <div class="cc">
        <div class="pic"><img src="${task.productPictureUrl}" alt="商品主图" title="商品主图" width="240" height="240" /></div>
        <div class="tit">
          <p>试用类型：<span class="c-red">常规试用</span></p>
          <p class="lh40 c-red">连续3天申请试用此商品，可提高中奖机会！</p>
          <div class="money">
            <p class="p1">领取金额：<strong>${task.productPrice}</strong>元 </p>
            <p class="p1">返还金额：<strong>${task.productPrice}</strong>元</p>
            <p class="p2 pt11">当前商品为包邮试用</p>
          </div>
          <p class="pcoin">规格：${task.productAttr1}|${task.productAttr2} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 领取数量: <i class="red">${task.productNeedBuyAmount}</i>份/单</p>
          <p class="coin">赏金：<em>${task.feedbackCoin}</em>金币<a href="http://bbs.zhongguohuo.com/thread-1031806-1-1.html" target="_blank">什么是金币？</a></p>
        </div>
      </div>
      <div class="msg">
        <p>总计已有<span>${count1}</span>人申请，其中已有<span>${count2}</span>人已获得试用机会，其中已有<span>${count3}</span>人已下单领取</p>
        <P><i></i>(商家已存入总试用担保金<span>XXX</span>元，请放心申请)</P>
      </div>
    </div>

    <!--  商家试用详情页  -->
    <div class="rightbox">
      <div class="num">
        <p>试用份数：<strong>${task.total}</strong>份<i>剩余<span class="c-red">${task.remain}</span>份</i></p>
        <p>今日发放：<span class="c-red">${task.totalPerDay}</span>份 (已有<span class="c-red">${count4}</span>人申请)</p>
      </div>
      <!-- 试客展示 -->
      <c:if test="${empty member || member.role <= 2 }">
        <c:if test="${empty taskInstance}">
          <div class="task">
            <p>状态：<span class="c-red">待申请试用</span></p>
            <p>申请方式：<span class="c-red">电脑端申请</span>、<span class="c-red">手机淘宝APP申请</span></p>
            <ul>
              <li><span>确认申请试用</span></li>
              <li class="pb0"><span>申请试用</span></li>
            </ul>
          </div>
          <div class="buttbox">
            <a href="/buyer_apply/first/-${task.id}" class="butt1 J-pup">找宝贝，领试用</a>
            <div class="butt1-div">
              <a href="http://bbs.zhongguohuo.com/thread-1031811-1-1.html" target="_blank">如何领取试用？</a>
              <a href="http://bbs.zhongguohuo.com/thread-1032714-1-1.html" target="_blank">如何提高中奖率？</a>
            </div>
            <div class="butt2box pt30"><a class="butt2 J-pup1"><fmt:parseNumber value="${task.productPrice/5}" integerOnly="true"/>金币免审通过</a>(剩余<span class="c-red">${task.remain}</span>份)</div>
            <br>
          </div>
          <%--<div class="buttbox">--%>
            <%--<a href="/buyer_pass/index/-${task.id}" class="butt1">前去领取宝贝</a>--%>
            <%--<div class="butt2box"><i>请与2015-09-24 20:04之前领取试用宝贝</i></div>--%>
          <%--</div>--%>
        </c:if>
        <c:if test="${not empty taskInstance && taskInstance.applyStatus<3}">
          <div class="task">
            <p>申请进度：<span class="c-red">第<fmt:parseNumber value="${c/4+1}" integerOnly="true"/>天</span></p>
            <p>状态：<span class="c-red">已申请试用，待继续找宝贝</span></p>
            <p>只需完成以下步骤将有机会获得试用：</p>
            <ul>
              <li><span>1.访问淘宝找到试用宝贝 <c:if test="${taskInstance.applyStatus==0}">(<i class="c-yellow">未完成</i>)</c:if><c:if test="${taskInstance.applyStatus>=1}">(<i class="c-green">已完成</i>)</c:if> </span></li>
              <li><span>2.核对查找的宝贝是否正确 <c:if test="${taskInstance.applyStatus==1}">(<i class="c-yellow">未完成</i>)</c:if><c:if test="${taskInstance.applyStatus>=2}">(<i class="c-green">已完成</i>)</c:if></span></li>
              <li><span>3.加入购物车<c:if test="${taskInstance.applyStatus==2}">(<i class="c-yellow">未完成</i>)</c:if><c:if test="${taskInstance.applyStatus>=3}">(<i class="c-green">已完成</i>)</c:if></span></li>
              <li class="pb3"><span>4.提交申请试用<c:if test="${taskInstance.applyStatus==3}">(<i class="c-yellow">未完成</i>)</c:if><c:if test="${taskInstance.applyStatus>=4}">(<i class="c-green">已完成</i>)</c:if></span></li>
            </ul>
          </div>
          <div class="buttbox">
            <a href="/buyer_apply/first/-${task.id}" class="butt1">
              <c:if test="${taskInstance.applyStatus==0}">继续找试用宝贝</c:if>
              <c:if test="${taskInstance.applyStatus==1}">前去核对试用宝贝</c:if>
              <c:if test="${taskInstance.applyStatus==2}">前去把试用宝贝加入购物车</c:if>
              <c:if test="${taskInstance.applyStatus==3 || taskInstance.applyStatus==4}">前去提前试用申请</c:if>
            </a>
            <div class="butt2box"><i>请与<fmt:formatDate value="${taskInstance.deadlineTime}" pattern="yyyy-MM-dd HH:mm"/>之前提交申请</i></div>
          </div>
        </c:if>

        <%--<c:if test="${not empty taskInstance}">--%>
          <%--<div class="task">--%>
            <%--<p>${taskInstance.id}申请进度：<span class="c-red">已获得试用机会</span></p>--%>
            <%--<p>状态：<span class="c-red">已通过试用申请，待进入宝贝页</span></p>--%>
            <%--<p>请继续完成以下流程即可获得试用商品：</p>--%>
            <%--<ul class="uu">--%>
        <%--<   <li><span>1.进入试用宝贝页 (<i class="c-yellow">未完成</i>)</span></li>--%>
              <%--<li><span>2.喜欢并分享宝贝</span></li>--%>
              <%--<li><span>3.收藏宝贝和店铺</span></li>--%>
              <%--<li><span>4.浏览店铺及客服聊天</span></li>--%>
              <%--<li class="pb3"><span>5.领取试用宝贝</span></li>--%>
            <%--</ul>--%>
          <%--</div>--%>
          <%--</c:if>--%>

        </c:if>
      <!-- 商家展示 -->
      <c:if test="${member.role >2 }">
        <div class="buttbox">
          <a href="javascript:;" class="butt1 gray">找宝贝，领试用</a>
          <div class="butt2box pt30 gray"><a  class="butt2" style="color:#999; background:#F3F3F4; font-weight:bold; border-radius:3px;">8金币免审通过</a>(剩余<span class="c-red">1</span>份)</div>
          <br>
          <p class="error">商家会员不能申请试用商品</p>
        </div>
      </c:if>

    </div>
    <!-- 未登录状态下 -->
    <div class="rightbox" style="display:none;">
      <div class="num">
        <p>试用份数：<strong>3</strong>份<i>剩余<span class="c-red">3</span>份</i></p>
        <p>今日发放：<span class="c-red">3</span>份 (已有<span class="c-red">49</span>人申请)</p>
      </div>
      <div class="task">
        <p>状态：<span class="c-red">待注册或登录后可申请试用</span></p>
        <p>申请方式：<span class="c-red">电脑端申请</span>、<span class="c-red">手机淘宝APP申请</span></p>
        <ul>
          <li><span>注册试客账号</span></li>
          <li><span>购买会员</span></li>
          <li class="pb0" style="height:6px;"><span>申请试用</span></li>
        </ul>
      </div>
      <div class="buttbox">
        <a href="/register/buyer" class="butt1" target="_blank">前去注册试客</a>
        <div style="clear:both; font-size:15px; color:#555; line-height:50px;">已有账号？<a href="/login" target="_blank" style="color:#259FEC;">立即登陆</a></div>
      </div>
    </div>

    <!-- </div> -->
    <!--//第一天到第三天申请抽奖时候的状态和商家发货的状态-->


  </div>
  <!--//商品展示-->

  <!--申请流程-->
  <div class="flow-msg">
    <i class="pictit"></i>
    <ul>
      <li><p>① 找宝贝</p><span>搜索找到试用商品</span></li>
      <li><p>② 等待审核</p><span>系统抽取试用资格</span></li>
      <li><p>③ 下单付款</p><span>按照商品价格购买商品</span></li>
      <li><p>④ 好评并晒单</p><span>收货后发表好评并晒单</span></li>
      <li class="bgnone"><p>⑤ 平台返还本金</p><span>垫付资金将返还至您的琳琅帐号</span></li>
    </ul>
  </div>
  <!--//申请流程-->

  <!--商品详情页-->
  <div class="content">
    <!--左侧-->
    <div class="cleft">
      <div class="tab">
        <ul>
          <li class="action">试用详情</li>
          <li>已申请试用(<span class="c-red">49</span>)</li>
          <li>已获得试用(<span class="c-red">0</span>)</li>
          <li>试客好评</li>
        </ul>
      </div>
      <div class="tabbox">
        <!--试用详情-->
        <div id="desc">

          <img src="/static/images/loding.gif" alt="loding" style="margin:30px 0 0 100px;" />


        </div>
        <!--//试用详情-->
        <!--已申请试用-->
        <div class="march" style="display:none;">
          <dl>
            <dt><img src="/static//images/img/userpic.gif" width="48" height="48" alt="用户头像" /></dt>
            <dd>zshn</dd>
          </dl>
          <!-- <div class="more">
<span>1/2</span><span><a class="prv">上</a><a class="next">下</a></span>
</div> -->
        </div>
        <!--//已申请试用-->
        <!--已获得的试用-->
        <div class="march" style="display:none;">
          <!-- <div class="more">
<span>1/2</span><span><a class="prv">上</a><a class="next">下</a></span>
</div> -->
        </div>
        <!--//已获得的试用-->
        <!--试客晒单-->
        <div class="enjoy" style="display:none;">
          <ul>
            <p style="height:100px; line-height:100px; text-align:center; font-size:16px; color:#999;">~暂无评论~</p>
            <!--
<li class="enjoyli">
<div class="en-userpic"><a><img src="images/img/en-userpic.jpg" alt="userpic" /></a></div>
<div class="en-txt">
<div class="username"><a>点击图片放大</a><span>6小时前</span></div>
<div class="usertxt">
想玩皮这件事情酝酿了很久，掰下手指有两年吧，当年在豆瓣看到一个人发自己做钱包的过程，就崇拜到不行，那哥当初是为了送女朋友生日，这诚意可甩奢侈品钱包几条大街吧~
</div>
<div class="smallpic">
<ul class="smallpic-list">
    <li><img src="images/img/en-small-pic.jpg" alt="晒单缩略图" /><b></b></li>
    <li><img src="images/img/en-small-pic.jpg" alt="晒单缩略图" /><b></b></li>
</ul>
<div class="bigpic">
    <div style="display:none"><img src="images/img/en-pic.jpg" alt="晒带大图1" /><i>X</i></div>
    <div style="display:none;"><img src="images/img/userpic0demo.jpg" alt="晒带大图2" /><i>X</i></div>
</div>
</div>
</div>
</li>
<li class="enjoyli">
<div class="en-userpic"><a><img src="images/img/en-userpic.jpg" alt="userpic" /></a></div>
<div class="en-txt">
<div class="username"><a>没有图片的样式</a><span>8小时前</span></div>
<div class="usertxt">
想玩皮这件事情酝酿了很久，掰下手指有两年吧，当年在豆瓣看到一个人发自己做钱包的过程，就崇拜到不行，那哥当初是为了送女朋友生日，这诚意可甩奢侈品钱包几条大街吧~
</div>
</div>
</li>
-->
          </ul>
          <div class="more" style="display:none;"><span>1/2</span><span><a class="prv">上</a><a class="next">下</a></span></div>

        </div>
        <!--//试客晒单-->
      </div>
    </div>
    <!--//左侧-->
    <!--右侧-->
    <div class="cright">
      <div class="other">
        <h4>免费领取该商家其他产品</h4>
        <div class="other-box">
        </div>
      </div>
      <div class="underway">
        <h4>Ta们刚刚免费领取了</h4>
        <div class="underway-box">
          <ul>
            <li>
              <div class="li-div1"><img src="/static//images/img/underway-userpic.gif" width="20" height="20" alt="用户头像" /> <span>zshn</span>
                <i>                                	24分钟前                                </i>领取了：</div>
              <div class="li-div2">
                <div class="ccpic"><a href="#" target="_blank"><img src="/upload/2/4/3/58afec8bc8ec9cd0052d9af9789de50d.jpg" alt="商品图片" width="37" height="44" /></a></div>
                <div class="cctxt">原创纯色棉麻围巾女春秋丝巾<span>价值：39.00元</span></div>
              </div>
            </li>
            <li>
              <div class="li-div1"><img src="/static//images/img/underway-userpic.gif" width="20" height="20" alt="用户头像" /> <span>dsa51559</span>
                <i>                                	29分钟前                                </i>领取了：</div>
              <div class="li-div2">
                <div class="ccpic"><a href="#" target="_blank"><img src="/upload/2/4/3/58afec8bc8ec9cd0052d9af9789de50d.jpg" alt="商品图片" width="37" height="44" /></a></div>
                <div class="cctxt">原创纯色棉麻围巾女春秋丝巾<span>价值：39.00元</span></div>
              </div>
            </li>
            <li>
              <div class="li-div1"><img src="/static//images/img/underway-userpic.gif" width="20" height="20" alt="用户头像" /> <span>设落</span>
                <i>                                	34分钟前                                </i>领取了：</div>
              <div class="li-div2">
                <div class="ccpic"><a href="#" target="_blank"><img src="/upload/2/4/3/58afec8bc8ec9cd0052d9af9789de50d.jpg" alt="商品图片" width="37" height="44" /></a></div>
                <div class="cctxt">原创纯色棉麻围巾女春秋丝巾<span>价值：39.00元</span></div>
              </div>
            </li>
            <li>
              <div class="li-div1"><img src="/upload/face/9/5/6/c269bf2e84b4de1a1d4a88011e4bec92_100x100.jpg" width="20" height="20" alt="用户头像" /> <span>netrace</span>
                <i>                                	50分钟前                                </i>领取了：</div>
              <div class="li-div2">
                <div class="ccpic"><a href="#" target="_blank"><img src="/upload/2/4/3/58afec8bc8ec9cd0052d9af9789de50d.jpg" alt="商品图片" width="37" height="44" /></a></div>
                <div class="cctxt">原创纯色棉麻围巾女春秋丝巾<span>价值：39.00元</span></div>
              </div>
            </li>
            <li>
              <div class="li-div1"><img src="/upload/face/1/4/8/344aa4cc402922f1757baf5da6bdf743_100x100.jpg" width="20" height="20" alt="用户头像" /> <span>qiuzai9757</span>
                <i>                                	53分钟前                                </i>领取了：</div>
              <div class="li-div2">
                <div class="ccpic"><a href="#" target="_blank"><img src="/upload/2/4/3/58afec8bc8ec9cd0052d9af9789de50d.jpg" alt="商品图片" width="37" height="44" /></a></div>
                <div class="cctxt">原创纯色棉麻围巾女春秋丝巾<span>价值：39.00元</span></div>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="faq">
        <h4>常见问题</h4>
        <div class="faq-box">
          <dl>
            <dt>♥ 奖品可以直接购买吗？</dt>
            <dd>不可以的哦，需要按照任务流程，申请免费领取资格后，才可以继续购买商品</dd>
          </dl>
          <dl>
            <dt>♥ 什么是垫付资金？</dt>
            <dd>当你活动免费领取商品的资格后，需先垫付资金购买指定商品，待收货并好评之后，商家会将你垫付的资金返还到您的账户</dd>
          </dl>
          <dl>
            <dt>♥ 领取的商品支持退换货吗？</dt>
            <dd>所有领取的商品，一旦领取成功，均不允许退换货</dd>
          </dl>
        </div>
      </div>
      <div class="disclaimer">
        <h4>免责声明</h4>
        <div class="disclaimer-box">
          琳琅国货所有试用产品均由合作商家直接提供，杜绝一切非正规渠道来源的试用产品。琳琅国货为用户提供商品试用渠道及信息交流平台，产品的使用效果因产品本身及用户的个体差异而有所不同。若会员在产品试用过程中有任何不适，请即时停用并直接与试用品提供商联系。因试用品提供商的产品和服务导致的任何瑕疵、过错 、责任和纠纷，琳琅国货不承担任何法律责任。
        </div>
      </div>
    </div>
    <!--//右侧-->
  </div>
  <!--//商品详情页-->

  <!--免审通过弹出悬浮-->
  <div class="pup1">
    <div class="pupmsg">
      <i>X</i>
      <p>使用免审通过可<span class="c-red">直接获得</span>当前商品的试用资格，</p>
      <!--金币不足
      <p>你的帐号：<span class="c-red">李八万</span>拥有的金币不够使用免审通过，</p>
      <p>可以去购买金币或通过申请试用的方式获得试用商品</p>
      -->
      <p>使用后金币<span class="c-red">不予返还</span></p>
      <p>确定以<span class="c-red">8</span>金币通过试用资格吗？</p>
    </div>
    <div class="pup1-butbox">
      <a class="pup-button" href="/buyer_jb/index/${task.id}">确认使用免审通过</a><span>取消 </span>
    </div>
  </div>
  <!--//免审通过弹出悬浮-->

</div>
<!--//wrap-->

<script type="text/javascript">
  $(function(){

    $.get('/ajax/shop_desc?task_id=684',function(res){
      $("#desc").html(res);
    });


    //弹出与关闭--免审通过pup
    $(".J-pup1").click(function(){
      $(".pup1").show();
    });
    $(".pupmsg i").click(function(){
      $(this).parent().parent().hide();
    });
    $(".pup1-butbox span").click(function(){
      $(this).parent().parent().hide();
    });

    //商品详情页TAB切换
    var $divli=$("div.tab ul li");
    $divli.click(function(){
      $(this).addClass("action").siblings().removeClass("action");
      var index = $divli.index(this);
      $("div.tabbox>div").eq(index).show().siblings().hide();
    });

    //商品详情>>试客晒单图片切换
    var $picli=$(".smallpic-list li");
    $picli.click(function(){
      $(this).addClass("bb").siblings().removeClass("bb");
      var index = $picli.index(this);
      $("div.bigpic>div").eq(index).show().siblings().hide();
    })

    //关闭晒单大图
    $(".bigpic i").live("click",function(){
      $(this).parent().hide();
      $(this).parent().parent().siblings(".smallpic-list").children(".bb").removeClass("bb");
    })

  })
</script>

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