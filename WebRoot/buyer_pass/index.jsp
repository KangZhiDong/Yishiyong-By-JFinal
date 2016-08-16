<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>领取试用</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/buyer_make.css" rel="stylesheet" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/common.js"></script>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="javascript:;">领取试用</a>
</div>
<!--wrap-->
<div class="m-wrap clearfix">
  <div class="m-box m-new clearfix pb30">
    <h2>领取试用<span>您已获得试用资格，请花几分钟时间完成以下步骤即可获得试用商品！</h2>
    <div class="ccbox clearfix ">

      <!--－－－－－－－－－－－－－－－－－－－－－－－－－－第一天中奖的情况－－－－－－－－－－－－－－－－－－－－－－－－－－－－－-->
      <c:if test="${day==1}">
        <div class="fl">
          <div class="Mline m1_line" style="margin-top:33px;">
            <ul>
              <c:if test="${taskInstance.awardgetStatus<10}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=10}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<11}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==11}"><li class="h62"><em class="emby"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>11}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<12}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==12}"><li class="h62"><em class="emby"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>12}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<13}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==13}"><li class="h62"><em class="emby"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>13}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<14}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==14}"><li class="h62"><em class="emby"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>14}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <li class="h62" style="background:none;"><em class="emdis"></em></li>
            </ul>
          </div>
          <div class="m_txt" style="line-height:62px;">
            <ul class="m_txt_ul_ok">
              <li class="red">进入试用商品页<i class="sicon" style="top:28px;"></i></li>
              <c:if test="${taskInstance.awardgetStatus<11}"><li>分享商品</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=11}"><li class="red">分享商品</li></c:if>
              <c:if test="${taskInstance.awardgetStatus<12}"><li>收藏宝贝和店铺</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=12}"><li class="red">收藏宝贝和店铺</li></c:if>
              <c:if test="${taskInstance.awardgetStatus<13}"><li>浏览店铺及客服聊天</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=13}"><li class="red">浏览店铺及客服聊天</li></c:if>
              <c:if test="${taskInstance.awardgetStatus<14}"><li>下单并付款</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=14}"><li class="red">下单并付款</li></c:if>
              <c:if test="${taskInstance.awardgetStatus<15}"><li>成功领取</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=15}"><li class="red">成功领取</li></c:if>
            </ul>
          </div>
        </div>
      </c:if>
      <!--－－－－－－－－－－－－－－－－－－－－－－－－－－第二天中奖的情况－－－－－－－－－－－－－－－－－－－－－－－－－－－－－-->
      <c:if test="${day==2}">
        <div class="fl">
          <div class="Mline m1_line" style="margin-top:33px;">
            <ul>
              <c:if test="${taskInstance.awardgetStatus<20}"><li class="h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==20}"><li class="h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>20}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<21}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==21}"><li class="h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>21}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<22}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==22}"><li class="h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>22}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<23}"><li class="h62" style="background:none;"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=23}"><li class="h62" style="background:none;"><em class="emby"></em></li></c:if>
            </ul>
          </div>
          <div class="m_txt" style="line-height:62px;">
            <ul class="m_txt_ul_ok">
              <li class="red">进入试用商品页<i class="sicon" style="top:28px;"></i></li>
              <c:if test="${taskInstance.awardgetStatus<21}"><li>浏览店铺及客服聊天</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=21}"><li class="red">浏览店铺及客服聊天</li></c:if>
              <c:if test="${taskInstance.awardgetStatus<22}"><li>下单并付款</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=22}"><li class="red">下单并付款</li></c:if>
              <c:if test="${taskInstance.awardgetStatus<23}"><li>成功领取</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=23}"><li class="red">成功领取</li></c:if>
            </ul>
          </div>
        </div>
      </c:if>

      <!--－－－－－－－－－－－－－－－－－－－－－－－－－－第三天中奖的情况－－－－－－－－－－－－－－－－－－－－－－－－－－－－－-->
      <c:if test="${day==3}">
        <div class="fl">
          <div class="Mline m1_line" style="margin-top:33px;">
            <ul>
              <c:if test="${taskInstance.awardgetStatus<30}"><li class="h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==30}"><li class="h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>30}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<31}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==31}"><li class="h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>31}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<32}"><li class="h62"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus==32}"><li class="h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>32}"><li class="cur h62"><em class="emsy"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus<33}"><li class="h62" style="background:none;"><em class="emdis"></em></li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=33}"><li class="h62" style="background:none;"><em class="emby"></em></li></c:if>
            </ul>
          </div>
          <div class="m_txt" style="line-height:62px;">
            <ul class="m_txt_ul_ok">
              <li class="red">进入试用商品页<i class="sicon" style="top:28px;"></i></li>
              <c:if test="${taskInstance.awardgetStatus<31}"><li>客服聊天</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=31}"><li class="red">客服聊天</li></c:if>
              <c:if test="${taskInstance.awardgetStatus<32}"><li>下单并付款</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=32}"><li class="red">下单并付款</li></c:if>
              <c:if test="${taskInstance.awardgetStatus<33}"><li>成功领取</li></c:if>
              <c:if test="${taskInstance.awardgetStatus>=33}"><li class="red">成功领取</li></c:if>
            </ul>
          </div>
        </div>
      </c:if>


      <!----------------------------------------开始显示左侧---------------------------------------->
      <!----------------------------------------开始显示左侧---------------------------------------->
      <!----------------------------------------开始显示左侧---------------------------------------->


      <!-- 10,20,30 ,显示“进入试用商品页”内容 -->
      <c:if test="${taskInstance.awardgetStatus==10 || taskInstance.awardgetStatus==20 || taskInstance.awardgetStatus==30}">
        <div class="fl" style="width:755px;">
          <h3 class="mrtit mrtit1 f20">进入试用商品页<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/></i>前完成下单并付款，否则将自动取消获奖资格并扣除<i class="red">1</i>金币</h3>

          <p class="fontsize16 pb10">请打开淘宝网登录帐号：<i class="red">${taskInstance.wangWangId}</i>，进入<i class="red">购物车</i>找到以下商品，并点击进入<i class="red">宝贝详情页</i></p>
          <p class="m-s1-titname">店铺：${task.businessWangWangId}</p>
          <div class="m-s1-tabbox">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody>
              <tr>
                <td width="115" class="tac"><img src="${task.productPictureUrl}" width="55" height="55" alt="pic" /></td>
                <td width="218">${task.productName}</td>
                <td width="180"></td>
                <td width="265" class="tac">
                  <p>规格：${task.productAttr1}|${task.productAttr2}</p>
                  <p></p>
                </td>
              </tr>
              </tbody>
            </table>
            <p class="pt16">购买数量：<span>${task.productNeedBuyAmount}</span> &nbsp;&nbsp; 金额：<span>${task.productPrice}元</span>
              <!-- <a class="fr c-blue show-goods">购物车已无此商品？</a> -->
            </p>
          </div>
          <div class="ccbtn-box">
            <c:if test="${taskInstance.awardgetStatus==10||taskInstance.awardgetStatus==20||taskInstance.awardgetStatus==30}">
              <a href="/buyer_pass/first_one/-${taskInstance.taskId} " class="sk-arrange-next jsnextth act_next">下一步</a><span class="cor999" style="vertical-align:middle;"> (喜欢、分享商品)</span>
            </c:if>
            <c:if test="${taskInstance.awardgetStatus==21}">
              <a href="/buyer_pass/first_two/-${taskInstance.taskId} " class="sk-arrange-next jsnextth act_next">下一步</a><span class="cor999" style="vertical-align:middle;"> (喜欢、分享商品)</span>
            </c:if>
            <c:if test="${taskInstance.awardgetStatus==22}">
              <a href="/buyer_pass/first_three/-${taskInstance.taskId} " class="sk-arrange-next jsnextth act_next">下一步</a><span class="cor999" style="vertical-align:middle;"> (喜欢、分享商品)</span>
            </c:if>
          </div>
        </div>
      </c:if>
      <!--目前状态为11，进行“分享商品”，将进入状态12-->
      <c:if test="${taskInstance.awardgetStatus==11 && day==1}">
        <form action="/buyer_pass/first_two" method="post" id="form-make2">
          <input type="hidden" name="task_id" value="${taskInstance.taskId} ">
          <div class="fl" style="width:755px;">
            <h3 class="mrtit mrtit1 f20">分享商品<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/></i>前完成下单并付款，否则将自动取消获奖资格并扣除<i class="red">1</i>金币</span></h3>
            <!--天猫店铺展示：分享到微博-->
            <div class="make3-box">
              <p>1.在宝贝详情页面中，找到并点击【分享】链接后，在悬浮窗中将试用商品分享到“微博”，<br>如图所示：</p>
              <div class="picbox"><img src="/static/images/buyer/sq_img2.jpg" alt="pic"><p><!--<span class="bigpic"><a href="" target="_blank">点击查看大图</a></span>--></p></div>
              <p>2.分享完成完成后，在个人微博中找到分享的微博信息，点击信息中的时间链接，进入单独信息页<br>并复制页面链接到下面输入框中</p>
              <div class="inp">
                <input type="text" name="url_goods_share" cname="one" placeholder="将分享地址粘贴在此处" class="sq2" regname="shopurl" emptyerr="分享链接不能为空" value="">
                <a class="c-blue" href="http://bbs.zhongguohuo.com/thread-1031866-1-1.html" target="_blank">如何粘贴连接 &gt;</a>
              </div>
            </div>

            <div class="ccbtn-box">
              <span><a class="prev" href="/buyer_pass/pre_step/1268">上一步</a></span>
              <span class="sk-arrange-gray"><a id="submitId2" class="sk-arrange-next js2">下一步</a> <span>(收藏宝贝和店铺)</span></span>
            </div>
          </div>
        </form>
      </c:if>
      <!--目前状态为12，进行“收藏宝贝和店铺”，将进入状态13-->
      <c:if test="${taskInstance.awardgetStatus==12 && day==1}">
        <form action="/buyer_pass/first_three" method="post" enctype="multipart/form-data" id="form-make3">
          <input type="hidden" name="task_id" value="${taskInstance.taskId}">
          <div class="fl" style="width:755px;">
            <h3 class="mrtit mrtit1 f20">收藏宝贝和店铺<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/></i>前完成下单并付款，否则将自动取消获奖资格并扣除<i class="red">1</i>金币</span></h3>
            <div class="make3-box">
              <p>1.进入宝贝页后请收藏当前试用商品，如下图所示：</p>
              <div class="picbox"><img src="/static/images/new/buyermake3-img.jpg" alt="pic"></div>
              <p class="inp font14px">点击【<i class="red">收藏宝贝</i>】，收藏商品后截图并上传 <input type="file" name="collectProductScreenshotPic" regname="fxpic" emptyerr="请上传收藏宝贝截图" warn=""> <a class="c-blue" href="http://bbs.zhongguohuo.com/thread-1031822-1-1.html" target="_blank">查看截图示例</a></p>
            </div>
            <div class="make3-box pt40">
              <p>2.收藏宝贝后请继续收藏商家店铺，如下图所示：</p>
              <div class="picbox"><img src="/static/images/new/buyermake3-img2.jpg" alt="pic"></div>
              <p class="inp font14px">点击【<i class="red">收藏店铺</i>】，收藏店铺后截图并上传 <input type="file" name="collectShopScreenshotPic" regname="fxpic" emptyerr="请上传收藏店铺截图" warn=""> <a class="c-blue" href="http://bbs.zhongguohuo.com/thread-1031822-1-1.html" target="_blank">查看截图示例</a></p>
            </div>
            <div class="ccbtn-box">
              <span><a class="prev" href="/buyer_pass/pre_step/1268">上一步</a></span>
              <span class="sk-arrange-gray"><a id="submitId3" class="sk-arrange-next js3">下一步</a> <span>(浏览店铺及客服聊天)</span></span>
            </div>
          </div>
        </form>
      </c:if>
      <!--目前状态为13或者21或者31，进行“浏览店铺及客服聊天”，将进入状态14或者22-->
      <c:if test="${taskInstance.awardgetStatus==13 || taskInstance.awardgetStatus==21  || taskInstance.awardgetStatus==31}">
        <form action="/buyer_pass/first_four" method="post" enctype="multipart/form-data" id="form-make4">
          <input type="hidden" name="task_id" value="${taskInstance.taskId} ">
          <div class="fl" style="width:755px;">
            <h3 class="mrtit mrtit1 f20"><c:if test="${taskInstance.awardgetStatus!=31}">浏览店铺及</c:if>客服聊天<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/></i>前完成下单并付款，否则将自动取消获奖资格并扣除<i class="red">1</i>金币</span></h3>
            <div class="m-s2-box">
              <c:if test="${taskInstance.awardgetStatus!=31}">
                  <h4>1.如图示，进入店铺首页：</h4>
                  <div class="s2-box-pic"><img src="/static/images/new/buery-make-img5.jpg" alt="pic"></div>
                  <h4>2.进入首页后，随机点开<span class="red">3-4</span>个商品，浏览完整个宝贝详情，并将宝贝页地址粘贴到以下输入框中：</h4>
                  <p class="pl15">注意：4个宝贝页面地址不可重复，如果搜索到的商品少于4个，可填写淘宝其他链接 <a class="c-blue pl15" target="_blank" href="http://bbs.zhongguohuo.com/thread-1031832-1-1.html">查看详情</a></p>
                  <div class="Checkupbox">
                  <div class="c-l">宝贝页地址1：</div>
                  <div class="item clearfix">
                    <div class="inp">
                      <em class="inpbox">
                        <input type="text" id="s1" name="shopProductUrl1" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value="">
                      </em>
                    </div>
                  </div>
                </div>
                <div class="Checkupbox">
                  <div class="c-l">宝贝页地址2：</div>
                  <div class="item clearfix">
                    <div class="inp">
                      <em class="inpbox">
                        <input type="text" id="s2" name="shopProductUrl2" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value="">
                      </em>
                    </div>
                  </div>
                </div>
                <div class="Checkupbox">
                  <div class="c-l">宝贝页地址3：</div>
                  <div class="item clearfix">
                    <div class="inp">
                      <em class="inpbox">
                        <input type="text" id="s3" name="shopProductUrl3" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value="">
                      </em>
                    </div>
                  </div>
                </div>
                <div class="Checkupbox">
                  <div class="c-l">宝贝页地址4：</div>
                  <div class="item clearfix">
                    <div class="inp">
                      <em class="inpbox">
                        <input type="text" id="s4" name="shopProductUrl4" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value="">
                      </em>
                    </div>
                  </div>
                </div>
              </c:if>
              <div id="msg"></div>
              <h4 class="pt40">联系卖家在线客服，至少问5个常见购买问题，如：能否降价，是否包邮，商品什么材质等</h4>
              <div class="pl15">
                <p>注意：1.不得提起易试用、试用等关键字，否则<i class="red">封禁易试用帐号！</i></p>
                <p class="pl42">2.聊天记录必须上传和指定商品店铺的聊天记录截图，不得上传虚假信息，否则<i class="red">封禁易试用帐号！</i></p>
                <p class="pl42">3.如果卖家不在线或长时间不回复怎么办？如果卖家不在线或是超过10分钟未回复，可自主下单，截图上传聊天窗口图即可<a href="http://bbs.zhongguohuo.com/thread-1031833-1-1.html" target="_blank">查看详细教程</a></p>
                <div class="item clearfix pl42">
                  <label class="tit" style="color:#555;">请上传聊天记录截图:</label>
                  <div class="inp">
                    <em><input type="file" style="margin-top:5px; width:180px;" checkurl="true" name="chatWithCustomServiceScreenshotPic" regname="shoplogo" emptyerr="请上传聊天截图" warn="大小不超过1Mb"></em>
                  </div>
                </div>
              </div>
            </div>
            <div class="ccbtn-box">
              <span><a class="prev" href="/buyer_pass/pre_step/1268">上一步</a></span>
              <span class="sk-arrange-gray"><a id="submitId4" class="sk-arrange-next js4">下一步</a> <span>(下单并付款)</span></span>
            </div>
          </div>
        </form>
      </c:if>
      <!--目前状态为14或22，显示进行“下单并付款”，将进入状态15或23-->
      <c:if test="${taskInstance.awardgetStatus==14||taskInstance.awardgetStatus==22||taskInstance.awardgetStatus==32}">
        <form action="/buyer_pass/first_five" method="post" enctype="multipart/form-data" id="form-make5">
          <input type="hidden" name="task_id" value="${taskInstance.taskId} ">
          <div class="fl" style="width:755px;">
            <div class="m-s3-box">
              <h3 class="mrtit mrtit1 f20">下单付款<span class="f14">请在<i class="red"><i class="red"><fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/></i>前完成下单并付款，否则将自动取消获奖资格并扣除<i class="red">1</i>金币</span></h3>
              <p>点击【<span>立即购买</span>】按钮进行下单，请注意：</p>
              <p class="pl42"><i class="red">不得使用“信用卡”、“花呗”、“余额宝分期”付款；也不得使用“淘宝客”等“返利网站”下单付款 <a class="c-blue disb" href="http://bbs.zhongguohuo.com/thread-1031837-1-1.html" target="_blank">查看详情 &gt;</a></i></p>
              <div class="Table-ok-5">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <thead>
                  <tr>
                    <th width="15%">卖家ID</th>
                    <th width="55%">商品名</th>
                    <th width="15%">单价</th>
                    <th width="15%">购买数量</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>${task.businessWangWangId}</td>
                    <td>${task.productName}</td>
                    <td>${task.productPrice}</td>
                    <td>${task.productNeedBuyAmount}</td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <h4>填写当前订单信息：</h4>
              <p><em class="f16">第一步.请上传订单详情截图：</em>请使用电脑访问淘宝,到【<span class="red">我的淘宝-已买到的宝贝</span>】，点击“<span class="red">买家已付款</span>”，将此订单的【<span class="red">订单详情</span>】截图，并上传到平台。<a class="c-blue pl15" href="http://bbs.zhongguohuo.com/forum.php?mod=viewthread&amp;tid=1031823" target="_blank">查看截图示例</a></p>
              <p class="inp pt20">上传截图：<input type="file" name="succedOrderScreenshotPic" regname="ddpic" emptyerr="请上传截图，大小不超过1Mb"><span style="color:#999;">上传截图格式为:gif、jpg、jpeg、png，且图片不能大于1M</span></p>
              <div class="m-s3-inpbox">
                <h4>第二步.请填写当前订单信息：</h4>
                <p style="color:#f00;">1.严禁转售中奖获得的试用商品，一经发现，直接封号！<br>2.因试客问题造成的退换货，来回运费需自行承担！</p>
                请填写订单号<span class="inp"><input type="text" name="orderId" onkeyup="this.value=this.value.replace(/[^-_—0-9]/g,'')" onpaste="this.value=this.value.replace(/[^-_—0-9]/g,'')" regname="ddh" emptyerr="订单号不能为空"></span>
                实际付款金额<span class="inp"><input type="text" style="margin-right:0;" name="realProductPrice" onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onpaste="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" regname="sfje" emptyerr="实付金额不能为空"> 元</span>
                <a class="c-blue" target="_blank" href="http://bbs.zhongguohuo.com/thread-1031831-1-1.html"> 实付金额和任务金额相差较大怎么办?</a>
              </div>
            </div>
            <div class="ccbtn-box">
              <span><a class="prev" href="/buyer_pass/pre_step/1268">上一步</a></span>
              <span class="sk-arrange-gray"><a id="submitId5" class="sk-arrange-next js5">确认已付款，提交</a></span>
            </div>
          </div>
        </form>
      </c:if>
      <!--目前状态为15或23,即是“成功领取”-->
      <c:if test="${taskInstance.awardgetStatus==15||taskInstance.awardgetStatus==23||taskInstance.awardgetStatus==33}">
        <div class="fl" style="width:755px;">
          <div class="make6-box">
            <h4>任务已提交，等待卖家发货</h4>
            <p class="tc">卖家发货后，淘宝|天猫会更新快递配送信息，待快递状态变为已签收后，前去确认收货并好评,</p>
            <p class="tc">完成后请将好评内容发表在易试用中</p>
          </div>
          <div class="ccbtn-box">
            <span class="sk-arrange-gray"><a href="/buyer" class="sk-arrange-next">返回任务列表</a></span>
          </div>
        </div>
      </c:if>
      <!-- 22 ,显示“下单并付款”内容 -->
      <%--<c:if test="${taskInstance.awardgetStatus==22}">--%>
        <%--<form action="/buyer_pass/second_three" method="post" enctype="multipart/form-data" id="form-make5">--%>
          <%--<input type="hidden" name="task_id" value="${task.id} ">--%>
          <%--<div class="fl" style="width:755px;">--%>
            <%--<div class="m-s3-box">--%>
              <%--<h3 class="mrtit mrtit1 f20">下单付款<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/></i>前完成下单并付款，否则将自动取消获奖资格并扣除<i class="red">1</i>金币</span></h3>--%>
              <%--<p>点击【<span>立即购买</span>】按钮进行下单，请注意：</p>--%>
              <%--<p class="pl42"><i class="red">不得使用“信用卡”、“花呗”、“余额宝分期”付款；也不得使用“淘宝客”等“返利网站”下单付款 <a class="c-blue disb" href="http://bbs.zhongguohuo.com/thread-1031837-1-1.html" target="_blank">查看详情 &gt;</a></i></p>--%>
              <%--<div class="Table-ok-5">--%>
                <%--<table width="100%" border="0" cellspacing="0" cellpadding="0">--%>
                  <%--<thead>--%>
                  <%--<tr>--%>
                    <%--<th width="15%">卖家ID</th>--%>
                    <%--<th width="55%">商品名</th>--%>
                    <%--<th width="15%">单价</th>--%>
                    <%--<th width="15%">购买数量</th>--%>
                  <%--</tr>--%>
                  <%--</thead>--%>
                  <%--<tbody>--%>
                  <%--<tr>--%>
                    <%--<td>${task.businessWangWangId}</td>--%>
                    <%--<td>${task.productName}</td>--%>
                    <%--<td>${task.productPrice}</td>--%>
                    <%--<td>${task.productNeedBuyAmount}</td>--%>
                  <%--</tr>--%>
                  <%--</tbody>--%>
                <%--</table>--%>
              <%--</div>--%>
              <%--<h4>填写当前订单信息：</h4>--%>
              <%--<p><em class="f16">第一步.请上传订单详情截图：</em>请使用电脑访问淘宝,到【<span class="red">我的淘宝-已买到的宝贝</span>】，点击“<span class="red">买家已付款</span>”，将此订单的【<span class="red">订单详情</span>】截图，并上传到平台。<a class="c-blue pl15" href="http://bbs.zhongguohuo.com/forum.php?mod=viewthread&amp;tid=1031823">查看截图示例</a></p>--%>
              <%--<p class="inp pt20">上传截图：<input type="file" name="pic" regname="ddpic" emptyerr="请上传截图，大小不超过1Mb"><span style="color:#999;">上传截图格式为:gif、jpg、jpeg、png，且图片不能大于1M</span></p>--%>
              <%--<div class="m-s3-inpbox">--%>
                <%--<h4>第二步.请填写当前订单信息：<span class="red" style="font-size:14px; margin-left:30px;">注意：严禁转售中奖获得的试用商品，一经发现，直接封号！</span></h4>--%>
                <%--请填写订单号<span class="inp"><input type="text" name="order" onkeyup="this.value=this.value.replace(/[^-_—0-9]/g,'')" onpaste="this.value=this.value.replace(/[^-_—0-9]/g,'')" regname="ddh" emptyerr="订单号不能为空"></span>--%>
                <%--实际付款金额<span class="inp"><input type="text" style="margin-right:0;" name="price_real" onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onpaste="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" regname="sfje" emptyerr="实付金额不能为空"> 元</span>--%>
                <%--<a class="c-blue" href="http://bbs.zhongguohuo.com/thread-1031831-1-1.html" target="_blank"> 实付金额和任务金额相差较大怎么办?</a>--%>
              <%--</div>--%>
            <%--</div>--%>
            <%--<div class="ccbtn-box">--%>
              <%--<span><a class="prev" href="/buyer_pass/pre_step/1228">上一步</a></span>--%>
              <%--<span class="sk-arrange-gray"><a id="submitId5" class="sk-arrange-next js5">确认已付款，提交</a></span>--%>
            <%--</div>--%>
          <%--</div>--%>
        <%--</form>--%>
      <%--</c:if>--%>
      <%--<c:if test="${taskInstance.awardgetStatus==23}">--%>
        <%--<div class="fl" style="width:755px;">--%>
          <%--<div class="make6-box">--%>
            <%--<h4>任务已提交，等待卖家发货</h4>--%>
            <%--<p class="tc">卖家发货后，淘宝|天猫会更新快递配送信息，待快递状态变为已签收后，前去确认收货并好评,</p>--%>
            <%--<p class="tc">完成后请将好评内容发表在易试用</p>--%>
          <%--</div>--%>
          <%--<div class="ccbtn-box">--%>
            <%--<span class="sk-arrange-gray"><a href="/buyer" class="sk-arrange-next">返回任务列表</a></span>--%>
          <%--</div>--%>
        <%--</div>--%>
      <%--</c:if>--%>
    </div>
  </div>
</div>
<!--//wrap-->

<div class="m-wrap clearfix">
  <div class="m-box">
    <div class="tab-tit">试用信息</div>
    <div class="tab-cc">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <thead>
        <tr>
          <th width="18%">试用商品</th>
          <th width="10%">购买数量</th>
          <th width="10%">垫付本金</th>
          <th width="10%">赏金</th>
          <th width="18%">申请时间</th>
          <!--th width="12%">倒计时</th-->
          <th width="13%">状态</th>
          <!-- <th width="11%">操作</th> -->
        </tr>
        </thead>
        <tbody>
        <tr>
          <td><img src="${task.productPictureUrl}" width="55" height="55" alt="pic" /> ${task.productName}</td>
          <td>${task.productNeedBuyAmount}件</td>
          <td>${task.productPrice}元</td>
          <td>${task.feedbackCoin}金币</td>
          <td><fmt:formatDate value="${taskInstance.applyTime}" pattern="yyyy-MM-dd HH:mm"/></td>
          <!--td>20时52分</td-->
          <td>待继续</td>
          <!-- <td><a>放弃资格</a></td> -->
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

<script type="text/javascript">

  $(function(){

    //点击购物车显示隐藏
    $(".show-goods").click(function(){
      if($(".day2-show-box").is(":hidden")){
        $(".day2-show-box").show();
        $(".ccbtn-box").hide();
        $(".ccbtn-box1").show();
      }else{
        $(".day2-show-box").hide();
        $(".ccbtn-box").show();
        $(".ccbtn-box1").hide();
      };
    })

    //提交表单
    $("#submitId2").click(function(){
      $("#form-make2").submit();
    })
    $("#submitId3").click(function(){
      $("#form-make3").submit();
    })
    $("#submitId4").click(function(){
      $("#form-make4").submit();
    })
    $("#submitId5").click(function(){
      $("#form-make5").submit();
    })

    //表单验证
    $('.ccbox').Validform({
      btncls : '.jsnextth',
      disbtncls : 'disabled',
      reg : {
        shopitemurl : [[3,/^(http|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?$/]]
      },
      regtips : {
        shopitemurl : ['商品地址不正确!']
      },
      callback : function(){
        var _flag = true;
        var _url_arr = [];
        var _e = 0;
        // 检查页面链接
        $('.J-goods-url').each(function(){
          if($(this).val()==''){
            _e++;
          }
          if(_e==2){
            _flag = false;
          }
          _url_arr.push($(this).val());
        });

      }
    });


  });


  $(function(){

    var regurl = /^(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?$/;
    var errlength = 0;
    $('a.Checkup-btn').click(function(){
      if($(this).hasClass('disabled')) return;
      var _url = $(this).parents('.item').find('input').val();
      var name = $(this).attr('name');
      var _order = $(this).attr('data-order');
      var $this = $(this);
      if(!_url&&regurl.test(_url)){
        return;
      }else{
        // 时波添加,传递参数,任务id
        var task_id = "${task.id} ";
        // alert(task_id)
        $.ajax({
          type: "POST",
          url: "/buyer_apply/ajax_check",
          data:{"task_id":task_id,"itemurl":_url},
          dataType:"json",
          success: function(re) {
            // alert(re)
            if(re){
              $this.attr('ispass');
              $this.addClass('disabled');
              rqf.tip.showok('商品链接正确(请勿关闭此商品页面)',$this.parents('.item').find('.inp'));
              $this.parents('.item').find('.inp input').unbind('focusin');
              $this.parents('.item').find('.inp input').unbind('focusout');
              yesnum();
              $('.sk-arrange-next').removeClass('disabled').addClass('enable');
              $('span.ok').css('display','block');
            }else{
              errlength++;
              rqf.tip.showError('链接地址错误!',$this.parents('.item').find('.inp'));
            }
          }
        });
      }
    });
    // 下一步操作
    $('.act_next').click(function(){
      if($(this).hasClass('enable')){
        window.location.href = "/buyer_pass/first_one-${task.id} ";
      }
    });

  });

  function yesnum(){
    var pass = 1;
    $('a.Checkup-btn').each(function(){
      if(!$(this).hasClass('disabled')) pass = pass*0;
    })
    if(pass){
      $('.jsnextone').removeClass('disabled');
    }else{
      $('.jsnextone').addClass('disabled')
    }
  }

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
  <p>Copyright © 2015 zhongguohuo.com 版权所有 浙ICP备09002461号-1</p>
</div>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
</body>
</html>