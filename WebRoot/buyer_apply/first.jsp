<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>申请试用</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/buyer_make.css" rel="stylesheet" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/common.js"></script>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />
<fmt:parseNumber var="day"  value="${(taskInstance.applyStatus/4)+1}" integerOnly="true"/>

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="javascript:;">申请试用</a>
</div>

<div class="m-wrap clearfix">
  <div class="m-box m-new clearfix">
    <h2>申请试用<span>请完成以下步骤，您将有机会获得试用资格！</span></h2>
    <div class="ccbox clearfix">
    <div class="fl">
            <div class="mday">
              <ul>
                <li class="red">第1天</li>
                <c:if test="${day<2}"><li style="margin-top:145px;">第2天</li></c:if>
                <c:if test="${day>=2}"><li style="margin-top:145px;" class="red">第2天</li></c:if>
                <c:if test="${day<3}"><li style="margin-top:145px;">第3天</li></c:if>
                <c:if test="${day>=3}"><li style="margin-top:145px;" class="red">第3天</li></c:if>
              </ul>
            </div>
            <div class="Mline m1_line">
              <ul>
                <c:forEach begin="1" end="10" varStatus="status">
                  <c:if test="${taskInstance.applyStatus>status.index-1}"><li class="cur h41 "><em class="emsy"></em></li></c:if>
                  <c:if test="${taskInstance.applyStatus==status.index-1}"><li class=" h41 "><em class="emby"></em></li></c:if><!--正在进行-->
                  <c:if test="${taskInstance.applyStatus<status.index-1}"><li class="h41"><em class="emdis"></em></li></c:if>
                </c:forEach>
                <li class="h41" style="background:none;"><em class="emdis"></em></li>
              </ul>
            </div>
            <div class="m_txt">
              <ul>
                <li class="red">搜索商品<i class="sicon"></i></li>
                <li <c:if test="${taskInstance.applyStatus>=1}">class="red"</c:if> >核对商品</li>
                <li <c:if test="${taskInstance.applyStatus>=2}">class="red"</c:if> >放入购物车</li>
                <li <c:if test="${taskInstance.applyStatus>=3}">class="red"</c:if> >提交试用申请</li>
                <li <c:if test="${taskInstance.applyStatus>=4}">class="red"</c:if> >进入试用商品页</li>
                <li <c:if test="${taskInstance.applyStatus>=5}">class="red"</c:if> >分享宝贝</li>
                <li <c:if test="${taskInstance.applyStatus>=6}">class="red"</c:if> >收藏宝贝和店铺</li>
                <li <c:if test="${taskInstance.applyStatus>=7}">class="red"</c:if> >提交试用申请</li>
                <li <c:if test="${taskInstance.applyStatus>=8}">class="red"</c:if> >进入试用商品页</li>
                <li <c:if test="${taskInstance.applyStatus>=9}">class="red"</c:if> >浏览店铺</li>
                <li <c:if test="${taskInstance.applyStatus>=10}">class="red"</c:if> >提交试用申请</li>
              </ul>
            </div>
          </div>

          <!--1:搜索商品，当前状态为:0-->
          <c:if test="${0 eq taskInstance.applyStatus}">
            <div class="fl flag_1">
              <h3 class="mrtit mrtit1 f20">搜索商品<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.deadlineTime}" pattern="yyyy-MM-dd HH:mm"/></i>前完成并提交试用申请，否则将视为自动放弃</span></h3>
              <p>1.请访问淘宝<span>www.taobao.com</span>,登入帐号：<span>${buyer.wangWangId}</span>，并刷新淘宝页面确认帐号是否已登录</p>
              <p>2.淘宝搜索关键字：<span>${task.searchKeyword}</span></p>
              <p>3.搜索结果页面筛选商品分类：<span>${task.searchFilter1}</span><span>${task.searchFilter2}</span><span>${task.searchFilter3}</span><span>${task.searchFilter4}</span></p>
              <p>4.筛选价格区间为：<span>${task.searchStartPrice}-${task.searchEndPrice}元</span>, 筛选商品所在地为：<span>${task.searchArea}</span></p>
              <p>5.搜索完成后，随机点击<span>4</span>个商品浏览整个商品页面，并将宝贝地址复制粘贴到以下输入框中：</p>
              <p class="p1" style="color:#f00;">注意：4个宝贝页面地址不可重复，如果搜索结果页面商品不足4个，可以找其他同类商品链接补足</p>


                <form id="submitForm0" action="/buyer_apply/first_tb_zero" method="post">
                  <input type="hidden" name="taskInstanceId" value="${taskInstance.id}" />
                <div class="Checkupbox clearfix">
                  <div class="c-l">宝贝页地址1：</div>
                  <div class="item clearfix">
                    <div class="inp">
                      <em class="inpbox">
                        <input type="text" name="url1" id="s1" cname="one" placeholder="将搜索到的商品链接贴到此处" name="" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value=""/>
                      </em>
                    </div>
                  </div>
                </div>
                <div class="Checkupbox clearfix">
                  <div class="c-l">宝贝页地址2：</div>
                  <div class="item clearfix">
                    <div class="inp">
                      <em class="inpbox">
                        <input type="text" name="url2" id="s2" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value=""/>
                      </em>
                    </div>
                  </div>
                </div>
                <div class="Checkupbox clearfix">
                  <div class="c-l">宝贝页地址3：</div>
                  <div class="item clearfix">
                    <div class="inp">
                      <em class="inpbox">
                        <input type="text" name="url3" id="s3" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value=""/>
                      </em>
                    </div>
                  </div>
                </div>
                <div class="Checkupbox clearfix">
                  <div class="c-l">宝贝页地址4：</div>
                  <div class="item clearfix">
                    <div class="inp">
                      <em class="inpbox">
                        <input type="text" name="url4" id="s4" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value=""/>
                      </em>
                    </div>
                  </div>
                </div>
                <div id="msg"></div>
                <div class="ccbtn-box">
                  <a id="submitId0" class="sk-arrange-next jsnextth">下一步</a><span> (核对商品)</span>
                </div>
              </form>
            </div>
          </c:if>

          <!--2:核对商品，当前状态为:1-->
          <c:if test="${1 eq taskInstance.applyStatus}">
            <div class="fl">
              <h3 class="mrtit mrtit1 f20" style="width:700px;">核对商品<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.deadlineTime}" pattern="yyyy-MM-dd HH:mm"/></i>前完成并提交试用申请，否则将视为自动放弃</span></h3>
              <form id="submitForm1" action="/buyer_apply/first_tb_one" method="post">
                <input type="hidden" name="taskInstanceId" value="${taskInstance.id}" />
                <p>1.根据以下提示找到试用商品</p>
                <p>商家为：<span>${task.businessWangWangId}</span></p>
                <p> 商品名称包含：<span>${task.productName}</span></p>
                <p> 商品价格：<span>${task.productPrice}</span>元 </p>
                <ul class="uu pln">
                  <li>商品图：</li>
                  <li><img src="${task.productPictureUrl}" alt="pic" width="150" height="150"></li>
                </ul>
                <p>2.核对商品连接<a href="http://bbs.zhongguohuo.com/thread-1033097-1-1.html" target="_blank" style="color:#3385FF; margin-left:20px; font-weight:bold;">找不到商品怎么办？</a></p>
                <div class="Checkupbox" style="margin-bottom:0; overflow:hidden; height:60px;">
                  <div class="item clearfix" style="margin-bottom:0;">
                    <div class="inp" style="margin-left:0;">
                      <em class="inpbox">
                        <input type="text" cname="one" placeholder="将搜索到的商品链接贴到此处" name="goods_url" class="txt placebox" regname="shopitemurl" emptyerr="商品链接不能为空" style="width:360px;">
                      </em>
                      <a class="Checkup-btn" href="javascript:;" name="1" data-order="1" style="color:#e85912;">核对商品地址</a>
                    </div>
                  </div>
                </div>
                <div class="ccbtn-box">
                  <span><a class="prev" href="/buyer_apply/pre_step/${task.ids}">上一步</a></span>
                  <span class="sk-arrange-gray"><a id="submitId1" class="sk-arrange-next jsnextth disabled">下一步</a> <span>(放入购物车)</span></span>
                </div>
              </form>
            </div>
          </c:if>

          <!--3:放入购物车，当前状态为:2-->
          <c:if test="${2 eq taskInstance.applyStatus}">
            <div class="fl" style="width:700px;">
              <h3 class="mrtit mrtit1 f20">放入购物车<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.deadlineTime}" pattern="yyyy-MM-dd HH:mm"/></i>前完成并提交试用申请，否则将自动取消获奖资格并扣除<i class="red">1</i>金币</span></h3>

              <div class="ccbox-item">
                <h4>请将以下商品加入购物车，以便您在之后的任务过程中更容易找到试用商品</h4>
                <p class="pb10"><span class="red f14">注意：部分商品不同规格价格不同，请按照指定规格选择后加入购物车</span></p>
                <div class="ccitem">
                  <div class="l">
                    <p class="lt1">商 品 名：<span>${task.productName} </span></p>
                    <p class="lt2">
                      <em>商 品 图：</em>
                      <span><img src="${task.productPictureUrl}" alt="商品图" title="商品图" width="155" height="155"></span>
                    </p>
                  </div>
                  <div class="r">
                    <p class="rt3">规 格：<span>${task.productAttr1}|${task.productAttr2}</span></p>
                    <p class="rt4">购买件数:<span>${task.productNeedBuyAmount}</span>件</p>
                    <p class="rt5"><em>价 格：</em><span>${task.productPrice}</span>元 <!--(包邮)-->
                    </p>
                  </div>
                </div>
              </div>
              <p>注意：1.请核实您购买的商品是否为<span>${task.productPrice}</span>元 （实际付款金额可能会上下浮动<span>10</span>元左右）</p>
              <p class="pl42">2.当前商品为<span>包邮</span>试用</p>

              <!--小于100元包邮
              <p class="pl42">2.当前商品为<span>包邮</span>试用</p>
              -->
              <!--大于100元包邮
              <p class="pl42">2.因该商品价值为<span>109</span>元 (大于100元)，且商家设置了商品包邮，在试用结束后，平台返还试用本金时会<br />扣除<span>5</span>元作为运费补偿给商品，即会返还您：109 - 5 = <span id="minus">104</span>元</p>
              -->

              <div class="ccbtn-box">
                <span><a class="prev" href="/buyer_apply/pre_step/-${task.id}">上一步</a></span>
                <span class="sk-arrange-gray"><a href="/buyer_apply/first_two/-${task.id}" class="sk-arrange-next">已加入购物车</a> <span>(提交试用申请)</span></span>
              </div>
            </div>
          </c:if>


          <!--4:提交试用申请，当前状态为:3-->
          <c:if test="${3 eq taskInstance.applyStatus || 7 eq taskInstance.applyStatus}">
            <div class="fl" style="width:700px;">

              <div class="ok-box">
                <p>您已提交试用申请，系统将在<span><fmt:formatDate value="${taskInstance.sysAwardgetDate}" pattern="yyyy-MM-dd HH:mm"/></span>抽取试用试用资格</p>
                <p>待系统抽奖后，将会以站内信、手机短信的方式通知您抽奖结果，请根据抽奖结果完成后续任务</p>
              </div>

              <div class="ok-box1">
                <h4>若您获得试用资格，需领取试用并下单</h4>
                <p class="pb30">请在收到平台通知后，于<span><fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/></span>前点击网站顶部【<span>领取宝贝</span>】，完成领取并下单，若超时未领取<br>试用商品将扣除<span>1</span>金币</p>
                <h4>若您未获得试用资格，可继续做任务获得抽奖机会</h4>
                <p>可以在收到平台通知后，于<span><fmt:formatDate value="${taskInstance.awardgetDeadline}" pattern="yyyy-MM-dd HH:mm"/></span>前点击网站顶部【<span>提高中奖机会</span>】，继续完成第二天试用申请并<br>提交，将再获得<span>1</span>次抽奖机会</p>
              </div>
              <div class="ccbtn-box">
                <span class="sk-arrange-gray"><a href="/buyer" class="sk-arrange-next">返回试用列表</a></span>
              </div>
            </div>
          </c:if>



          <!--5:进入试用商品页，当前状态为:4-->
          <c:if test="${4 eq taskInstance.applyStatus}">
            <div class="fl flag_1">
              <h3 class="mrtit mrtit1 f20">进入试用商品页<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.deadlineTime2}" pattern="yyyy-MM-dd HH:mm"/></i>前完成并提交试用申请，否则将视为自动放弃</span></h3>
              <p class="fontsize16 pb10">请打开淘宝网登录帐号：<i class="red">${buyer.wangWangId}</i>，进入<i class="red">购物车</i>找到以下商品，并点击进入<i class="red">宝贝详情页</i></p>
              <p class="m-s1-titname">店铺：${task.businessWangWangId}</p>
              <div class="m-s1-tabbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody>
                  <tr>
                    <td width="115" class="tac"><img src="${task.productPictureUrl}" width="55" height="55" alt="pic"></td>
                    <td width="218">${task.productName}</td>
                    <td width="90"></td>
                    <td width="265" class="tac">
                      <p>规格：${task.productAttr1}|${task.productAttr2}</p>
                      <p></p>
                    </td>
                  </tr>
                  </tbody>
                </table>
                <p class="pt16">加入购物车数量：<span>${task.productNeedBuyAmount}</span>&nbsp;&nbsp; 金额：<span>${task.productPrice}元</span>
                  <!-- <a class="fr c-blue show-goods">购物车已无此商品？</a> -->
                </p>
              </div>
            </div>
            <div class="ccbtn-box">
              <a href="/buyer_apply/second_one/-${taskInstance.id}" class="sk-arrange-next">下一步</a><span> (喜欢、分享宝贝)</span>
            </div>
        </c:if>




      <!--6:分享宝贝，当前状态为:5-->
      <c:if test="${5 eq taskInstance.applyStatus}">
        <form action="/buyer_apply/second_two" method="post" id="form-make2">
          <!-- 隐藏域传递task_id -->
          <input type="hidden" name="task_id" value="${taskInstance.taskId}">
          <input type="hidden" name="task_instance_id" value="${taskInstance.id}">
          <div class="fl" style="width:700px;">
            <h3 class="mrtit mrtit1 f20">分享宝贝<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.deadlineTime2}" pattern="yyyy-MM-dd HH:mm"/></i>前完成并提交试用申请，否则将视为自动放弃</span></h3>

            <!--淘宝店铺展示：分享到爱逛街-->
            <div class="make3-box">
              <p>1.在宝贝详情页面中，找到并点击【<i class="red">分享</i>】连接后，在悬浮窗中点击【<i class="red">分享到爱逛街</i>】按钮，<br>将试用商品分享到“爱逛街”，如图所示：</p>
              <div class="picbox"><img src="/static/images/buyer/sq_img1.jpg" alt="pic"><p><!--<span class="bigpic"><a href="" target="_blank">点击查看大图</a></span>--></p></div>
              <p>2.完成后，请将分享地址粘贴在下方输入框中</p>
              <div class="inp">
                <input type="text" name="url_goods_share" cname="one" placeholder="将分享地址粘贴在此处" class="sq2" regname="shopurl" emptyerr="商品链接不能为空" value="">
                <a class="c-blue" href="http://bbs.zhongguohuo.com/thread-1031866-1-1.html" target="_blank">如何粘贴连接 &gt;</a>
              </div>
            </div>

            <div class="ccbtn-box">
              <span><a class="prev" href="/buyer_apply/pre_step/${taskInstance.taskId}">上一步</a></span>
              <!-- <span class="sk-arrange-gray"><a class="sk-arrange-next js2">下一步</a> <span>(收藏宝贝和店铺)</span></span> -->
              <span class="sk-arrange-gray"><a><input class="sk-arrange-next js2" type="submit" value="下一步"></a> <span>(收藏宝贝和店铺)</span></span>
            </div>
          </div>
        </form>
      </c:if>


      <!--7:分享宝贝，当前状态为:6-->
      <c:if test="${6 eq taskInstance.applyStatus}">
        <form action="/buyer_apply/second_three" method="post" enctype="multipart/form-data" id="form-make3">
          <!-- 隐藏域传递task_id -->
          <input type="hidden" name="task_instance_id" value="${taskInstance.id} ">
          <div class="fl" style="width:700px;">
            <h3 class="mrtit mrtit1 f20">收藏宝贝和店铺<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.deadlineTime2}" pattern="yyyy-MM-dd HH:mm"/></i>前完成并提交试用申请，否则将视为自动放弃</span></h3>

            <div class="make3-box">
              <p>1.点击【<i class="red">收藏宝贝</i>】，收藏商品后截图并上传，截图需包含宝贝收藏成功的提示<br>信息，<a class="c-blue" target="_blank" href="http://bbs.zhongguohuo.com/thread-1031822-1-1.html">点击查看截图示例 &gt;</a></p>
              <p class="inp font14px">上传截图： <input type="file" name="collectProductScreenshotPic" regname="fxpic" emptyerr="请上传收藏宝贝截图" warn=""></p>
              <div class="picbox"><img src="/static/images/new/buyermake3-img.jpg" alt="pic"></div>
            </div>
            <div class="make3-box ">
              <p>2.点击【<i class="red">收藏店铺</i>】，收藏店铺后截图并上传，截图需包含店铺收藏成功的提示<br>信息，<a class="c-blue" target="_blank" href="http://bbs.zhongguohuo.com/thread-1031822-1-1.html">点击查看截图示例 &gt;</a></p>
              <p class="inp font14px">上传截图： <input type="file" name="collectShopScreenshotPic" regname="fxpic" emptyerr="请上传收藏店铺截图" warn=""></p>
              <div class="picbox"><img src="/static/images/new/buyermake3-img2.jpg" alt="pic"></div>
            </div>
            <div class="ccbtn-box">
              <span><a class="prev" href="/buyer_apply/pre_step/1228">上一步</a></span>
              <span class="sk-arrange-gray"><input class="sk-arrange-next js3" type="submit" value="下一步"> <span>(提交试用申请)</span></span>

            </div>
          </div>
        </form>
      </c:if>

      <!--9:进入试用商品页，当前状态为:8-->
      <c:if test="${8 eq taskInstance.applyStatus}">
        <div class="fl flag_1">
          <h3 class="mrtit mrtit1 f20">进入试用商品页<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.deadlineTime2}" pattern="yyyy-MM-dd HH:mm"/></i>前完成并提交试用申请，否则将视为自动放弃</span></h3>
          <p class="fontsize16 pb10">请打开淘宝网登录帐号：<i class="red">${buyer.wangWangId}</i>，进入<i class="red">购物车</i>找到以下商品，并点击进入<i class="red">宝贝详情页</i></p>
          <p class="m-s1-titname">店铺：${task.businessWangWangId}</p>
          <div class="m-s1-tabbox">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody>
              <tr>
                <td width="115" class="tac"><img src="${task.productPictureUrl}" width="55" height="55" alt="pic"></td>
                <td width="218">${task.productName}</td>
                <td width="90"></td>
                <td width="265" class="tac">
                  <p>规格：${task.productAttr1}|${task.productAttr2}</p>
                  <p></p>
                </td>
              </tr>
              </tbody>
            </table>
            <p class="pt16">加入购物车数量：<span>${task.productNeedBuyAmount}</span>&nbsp;&nbsp; 金额：<span>${task.productPrice}元</span>
              <!-- <a class="fr c-blue show-goods">购物车已无此商品？</a> -->
            </p>
          </div>
        </div>
        <div class="ccbtn-box">
          <a href="/buyer_apply/third_one/-${taskInstance.id}" class="sk-arrange-next">下一步</a><span> (喜欢、分享宝贝)</span>
        </div>
      </c:if>
      <!--10:进入试用商品页，当前状态为:9-->
      <c:if test="${9 eq taskInstance.applyStatus}">
        <form action="/buyer_apply/third_two" method="post" id="submitForm9">
          <!-- 隐藏域传递task_id -->
          <input type="hidden" name="taskInstanceId" value="${taskInstance.id} ">
          <div class="fl" style="width:700px;">
            <h3 class="mrtit mrtit1 f20">浏览店铺<span class="f14">请在<i class="red"><fmt:formatDate value="${taskInstance.deadlineTime2}" pattern="yyyy-MM-dd HH:mm"/></i>前完成并提交试用申请，否则将视为自动放弃</span></h3>
            <div class="m-s2-box">

              <p class="fontsize16">点击【<i class="red">进入店铺</i>】按钮后，进入首页随机点开<i class="red">3-4</i>个商品，浏览完整个宝贝详情，并将宝贝页地址<br>粘贴到以下输入框中：</p>
              <div class="s2-box-pic"><img src="/static/images/new/buery-make-img5.jpg" alt="pic"></div>
              <p class="pl15">注意：4个宝贝页面地址不可重复，如果搜索到的商品少于4个，可填写淘宝其他链接 <a class="c-blue pl15" target="_blank" href="http://bbs.zhongguohuo.com/thread-1031832-1-1.html">查看详情</a></p>

              <div class="Checkupbox">
                <div class="c-l">宝贝页地址1：</div>
                <div class="item clearfix">
                  <div class="inp">
                    <em class="inpbox">
                      <input type="text" name="ortherUrl1" id="s1" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value="">
                    </em>
                  </div>
                </div>
              </div>
              <div class="Checkupbox">
                <div class="c-l">宝贝页地址2：</div>
                <div class="item clearfix">
                  <div class="inp">
                    <em class="inpbox">
                      <input type="text" name="ortherUrl2" id="s2" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value="">
                    </em>
                  </div>
                </div>
              </div>
              <div class="Checkupbox">
                <div class="c-l">宝贝页地址3：</div>
                <div class="item clearfix">
                  <div class="inp">
                    <em class="inpbox">
                      <input type="text" name="ortherUrl3" id="s3" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value="">
                    </em>
                  </div>
                </div>
              </div>
              <div class="Checkupbox">
                <div class="c-l">宝贝页地址4：</div>
                <div class="item clearfix">
                  <div class="inp">
                    <em class="inpbox">
                      <input type="text" name="ortherUrl4" id="s4" cname="one" placeholder="将搜索到的商品链接贴到此处" class="txt placebox J-goods-url w380" regname="shopitemurl" emptyerr="商品链接不能为空" value="">
                    </em>
                  </div>
                </div>
              </div>
            </div>
            <div id="msg"></div>
            <div class="ccbtn-box">
              <span><a class="prev" href="/buyer_apply/pre_step/1276">上一步</a></span>
              <span class="sk-arrange-gray"><a id="submitId9" class="sk-arrange-next js4">提交试用申请</a></span>
            </div>
          </div>
        </form>
      </c:if>

      <!--11:进入试用商品页，当前状态为:10-->
      <c:if test="${10 eq taskInstance.applyStatus}">
        <div class="fl" style="width:700px;">
          <div class="ok-box" style="margin-top:100px;">
            <h4>您已提交试用申请，系统将在<i class="red">2015-10-08 10:00</i>抽取试用试用资格</h4>
            <p>待系统抽奖后，将会以站内信、手机短信的方式通知您抽奖结果，请根据抽奖结果完成后续任务</p>
            <p>待平台审核通过试用资格后，请在<i class="red">2015-10-08 22:00</i>前完成领取试用任务并下单</p>
          </div>
          <div class="ccbtn-box">
            <span class="sk-arrange-gray"><a href="/buyer" class="sk-arrange-next">返回试用列表</a></span>
          </div>
        </div>
      </c:if>
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
          <th width="200" style="padding-right:10px;" class="tc">试用信息</th>
          <th width="100" class="tc">购买数量</th>
          <th width="120" class="tc">垫付本金</th>
          <th width="100" class="tc">赏金</th>
          <th width="150" class="tc">申请时间</th>
          <!--th width="120" class="tc">倒计时</th-->
          <th width="150" class="tc">状态</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>
            <div class="fl" style="width:55px;"><img src="${task.productPictureUrl}" width="55" height="55" alt="pic" /></div>
            <div class="fl" style="padding-top:15px; width:130px;">${task.productName}</div>
          </td>
          <td class="tc">${task.productNeedBuyAmount}件</td>
          <td class="tc">${task.productPrice}元</td>
          <td class="tc">${task.feedbackCoin}金币</td>
          <td class="tc"><fmt:formatDate value="${taskInstance.applyTime}" pattern="yyyy-MM-dd HH:mm"/></td>
          <!--td class="tc">11时48分</td-->
          <td class="tc">待提交试用申请</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>


<script type="text/javascript">

  $(function(){

    //表单验证
    $('.ccbox').Validform({
      btncls : '.jsnextth',
      disbtncls : 'disabled',
      //btnSubmit : '#submitId0',
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

    $('#submitId0').click(function(){
        $('#submitForm0').submit();
    });

    $('#submitId1').click(function(){
        $('#submitForm1').submit();
    });

    $('#submitId9').click(function(){
      $('#submitForm9').submit();
    });


  });


  $(function(){

    var regurl = /^(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?$/;
    var errlength = 0;
    $('a.Checkup-btn').on('click',function(){
      if($(this).hasClass('disabled')) return;
      var _url = $(this).parents('.item').find('input').val();
      var name = $(this).attr('name');
      var _order = $(this).attr('data-order');
      var $this = $(this);
      if(!_url && regurl.test(_url)){
        return;
      }else{
        // 时波添加,传递参数,任务id
        var task_id = "${taskInstance.taskId}";
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
//    $('.sk-arrange-next').click(function(){
//      if($(this).hasClass('enable')){
//        $('#submitForm0').submit();
//      }
//    });

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
  <p>Copyright © 2015 yishiyong.com 版权所有 浙ICP备09002461号-1</p>
</div>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
</body>
</html>