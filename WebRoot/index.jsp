<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>易试用首页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link href="/static/css/index.css" rel="stylesheet" />
    <link href="/static/css/common.css" rel="stylesheet" />
    <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/static/js/index_tab.js"></script>
</head>
<body>
<a href="test/propaganda" target="_blank" style="overflow: hidden; position: relative;;width:1920px;height:75px;left:50%;margin-left:-960px;"><img src="/static/images/help/homebanner.png" /></a>


<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />


<!--二维码-->
<div class="a_cn">
    <p class="close" onclick="this.parentNode.style.display='none'">
        <a href="javascript:;"><img src="/static/images/index/ad_close.gif" alt="close" /></a>
    </p>
    <a href="http://bbs.zhongguohuo.com" target="_blank"><img src="/static/images/index/erweima.jpg" border="0"></a>
</div>
<!--//二维码-->

<!--top-->
<div class="cc_box clearfix">
    <!--left_banner-->
    <div class="box1_left clearfix">
        <div class="left_banner1">
            <ul>
                <li><a href="http://bbs.zhongguohuo.com/thread-1032943-1-1.html" target="_blank"><img src="/static/images/index/banner_new_1.jpg" alt="banner" /></a></li>
                <li><a href="http://www.zhongguohuo.com/task_info/index/260" target="_blank"><img src="/static/images/index/banner_new_2.jpg" alt="banner" /></a></li>
                <li><a href="http://www.zhongguohuo.com/task_info/index/507" target="_blank"><img src="/static/images/index/banner_new_3s.jpg" alt="banner" /></a></li>
            </ul>
        </div>
        <div class="left_banner2_box clearfix">
            <div class="left_banner2">
                <ul>
                    <li><a href="http://www.zhongguohuo.com/task_info/index/471" target="_blank"><img src="/static/images/index/banner_new2_8281.jpg" alt="banner" /></a></li>
                    <li><a href="http://www.zhongguohuo.com/task_info/index/432" target="_blank"><img src="/static/images/index/banner_new2_8282.jpg" alt="banner" /></a></li>
                    <li><a href="http://www.zhongguohuo.com/task_info/index/480" target="_blank"><img src="/static/images/index/banner_new2_8283.jpg" alt="banner" /></a></li>
                </ul>
            </div>
            <div class="left_banner3 clearfix">
                <ul>
                    <li><a href="http://www.zhongguohuo.com/task_info/index/334" target="_blank"><img src="/static/images/index/banner_new3_1s.jpg" alt="banner" /></a></li>
                    <li><a href="http://www.zhongguohuo.com/task_info/index/408" target="_blank"><img src="/static/images/index/banner_new3_2s.jpg" alt="banner" /></a></li>
                    <li><a href="http://www.zhongguohuo.com/task_info/index/438" target="_blank"><img src="/static/images/index/banner_new3_3s.jpg" alt="banner" /></a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--//left_banner-->
    <!--right_message-->
    <div class="right_message clearfix">
        <!--未登录的状态-->
        <c:if test="${empty member}">
            <div class="message_t_box">
                <div class="user_msg_box clearfix">
                    <div class="fl"><img src="/static/images/index/user_pic2.gif" alt="pic" width="41" height="41" /></div>
                    <div class="fl pl25 f13">
                        <p class="line22">您好，欢迎来到易试用！</p>
                        <p class="line22 cor999">你还未登录哦~</p>
                    </div>
                </div>
                <div class="user_register clearfix">
                    <a class="btn1" href="/login" title="登录"></a>
                    <a class="btn2" href="/register/business" title="注册商家"></a>
                    <a class="btn3" href="/register/buyer" title="注册试客"></a>
                </div>
            </div>
        </c:if>
        <c:if test="${not empty member}">
            <!--普通买家登录的状态-->
            <c:if test="${member.role eq 1}">
                <div class="message_t_box">
                    <div class="user_msg_box">
                        <div class="fl">
                            <c:if test="${empty membre.portrait}">
                                <img src="/static/images/index/user_pic2.gif" alt="pic" width="41" height="41">
                            </c:if>
                            <c:if test="${not empty membre.portrait}">
                                <img src="${membre.portrait}" alt="pic" width="41" height="41">
                            </c:if>

                        </div>
                        <div class="fl pl25 f13">
                            <p class="line22">
                                <span class="noyear">${membre.account}</span> [<a href="/buyer/renewal_vip" class="c_blue">续费</a>]
                            </p>
                            <p class="line22">垫付本金：<i class="red">0</i>元</p>
                        </div>
                    </div>
                    <div class="user_cc_list clearfix">
                        <ul>
                            <li><a href="/buyer/award" target="_blank"><p><i class="c_yellow">0</i></p><p>待提交</p></a></li>
                            <li><a href="/buyer/awardget" target="_blank"><p><i class="c_yellow">0</i></p><p>待领取</p></a></li>
                            <li><a href="/buyer/waitting_get" target="_blank"><p><i class="c_yellow">${waittingCommentCount}</i></p><p>待好评</p></a></li>
                            <li class="bdnone"><a href="/buyer/check_money"><p><i class="c_yellow">0</i></p><p>待返款</p></a></li>
                        </ul>
                    </div>
                </div>
            </c:if>
            <!--普通商家登录的状态-->
            <c:if test="${member.role eq 3}">
                <div class="message_t_box">
                    <div class="user_msg_box">
                        <div class="fl"><img src="/static/images/user_pic.png" alt="pic" width="41" height="41"></div>
                        <div class="fl pl25 f13">
                            <p class="line22">
                                <span class="noyear">${membre.account}</span> [<a href="/business/renewal_vip" class="c_blue">续费</a>]
                            </p>
                            <p class="line22">可用押金：<i class="red">0.00</i>元</p>
                        </div>
                    </div>
                    <div class="user_cc_list clearfix">
                        <a href="/business/shoping_binding" class="binding_btn" title="绑定店铺"></a><a href="/business/task_1" class="fb_task" title="发布任务"></a>
                    </div>
                </div>
            </c:if>
        </c:if>

        <div class="message_b_box">
            <h3>琳琅快报</h3>
            <div class="tab_tit">
                <ul>
                    <li class="active">官方公告</li>
                    <li>试客中心</li>
                    <li class="bdnone">商家中心</li>
                </ul>
            </div>
            <div class="tab_list">
                <div>
                    <ul>
                        <li>· <a href="http://www.zhongguohuo.com/" target="_blank" class="c_yellow">琳琅试用内测上线通知</a></li>
                        <li>· <a href="http://bbs.zhongguohuo.com/thread-1032577-1-1.html" target="_blank" class="">琳琅试用平台招募商家</a></li>
                        <li>· <a href="http://bbs.zhongguohuo.com/thread-1032565-1-1.html" target="_blank" class="">琳琅试用平台招募试客</a></li>
                        <!-- <li>· <a href="/test/index_m" target="_blank" class="">推荐有礼</a></li> -->
                    </ul>
                </div>
                <div class="none">
                    <ul>
                        <!-- <li>· <a href="http://bbs.zhongguohuo.com/thread-1032703-1-1.html" target="_blank">邀请试客加入就送价值60元试用机会</a></li> -->
                        <li>· <a href="http://bbs.zhongguohuo.com/forum.php?mod=viewthread&tid=1032966&page=1&extra=#pid9197204" target="_blank" class="c_yellow">琳琅试用试客手册</a><img src="/static/images/new.gif"></li>
                        <li>· <a href="http://bbs.zhongguohuo.com/thread-1032930-1-1.html" target="_blank" class="c_yellow">邀请好友首次成功申请试用返现10元</a><img src="/static/images/new.gif"></li>
                        <li>· <a href="http://bbs.zhongguohuo.com/thread-1032804-1-1.html" target="_blank" style="color:#f00;">如何快速的邀请其他试客加入？</a><img src="/static/images/hot.gif"></li>
                        <li>· <a href="http://bbs.zhongguohuo.com/thread-1032714-1-1.html" target="_blank" style="color:#f00;">如何提高试用申请中奖率？</a><img src="/static/images/hot.gif"></li>
                        <li>· <a href="/test/index_m/36" target="_blank">试客规则</a></li>
                    </ul>
                </div>
                <div class="none">
                    <ul>
                        <li>· <a href="http://bbs.zhongguohuo.com/forum.php?mod=viewthread&tid=1032965&page=1&extra=#pid9197203#userconsent#" target="_blank" class="c_yellow">琳琅试用优秀试客行为规范</a><img src="/static/images/new.gif"></li>
                        <li>· <a href="/test/index/45" target="_blank" style="color:#f00;">琳琅试用活动商品主图规范</a><img src="/static/images/hot.gif"></li>
                        <li>· <a href="http://bbs.zhongguohuo.com/thread-1032801-1-1.html" target="_blank" style="color:#f00;">关于商家功能优化的计划和安排</a><img src="/static/images/hot.gif"></li>
                        <li>· <a href="/test/index/1" target="_blank">商家发布任务教程</a></li>
                        <li>· <a href="/test/index/29" target="_blank">商家规则</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--//right_message-->
</div>
<!--//top-->

<!--cc1-->
<div class="cc_tit_box">
    <h3>
        免费试用品专区
        <span class="pl65"><a href="/buyer?pid=0&cate=1&sort=0&trial=0" target="_blank">时尚女装</a></span>
        <span><a href="/buyer?pid=0&cate=2&sort=0&trial=0" target="_blank">精品男装</a></span>
        <span><a href="/buyer?pid=0&cate=3&sort=0&trial=0" target="_blank">鞋类箱包</a></span>
        <span><a href="/buyer?pid=0&cate=4&sort=0&trial=0" target="_blank">运动户外</a></span>
        <span><a href="/buyer?pid=0&cate=5&sort=0&trial=0" target="_blank">钟表首饰</a></span>
        <span><a href="/buyer?pid=0&cate=6&sort=0&trial=0" target="_blank">数码小家电</a></span>
        <span><a href="/buyer?pid=0&cate=7&sort=0&trial=0" target="_blank">护肤彩妆</a></span>
        <span><a href="/buyer?pid=0&cate=8&sort=0&trial=0" target="_blank">母婴用品</a></span>
        <span><a href="/buyer?pid=0&cate=9&sort=0&trial=0" target="_blank">家具家访</a></span><span><a href="/buyer?pid=0&cate=10&sort=0&trial=0" target="_blank">百货日用</a></span>
        <span><a href="/buyer?pid=0&cate=11&sort=0&trial=0" target="_blank">美食特产</a></span><span class="bdnone"><a href="/buyer?pid=0&cate=12&sort=0&trial=0" target="_blank">车用周边</a></span>
    </h3>
</div>
<div class="cc_apply">
    <ul class="clearfix">
        <c:forEach items="${allTasks}" var="task" varStatus="status">
            <c:if test="${status.count%5 ne 0 }"><li ></c:if>
            <c:if test="${status.count%5 eq 0 }"><li class="mrnone"></c:if>
                <a href="/task_info/index-${task.id}">
                    <img src="${task.productPictureUrl}" width="194" height="194" alt="pic" />
                    <h4>${task.productName}</h4>
                    <p>${task.productPrice}元 | 今日发放：${task.totalPerDay}件</p>
                    <div><span><b>免费申请</b></span></div>
                </a>
            </li>
        </c:forEach>
    </ul>
</div>
<!--//cc1-->

<!--cc2-->
<div class="cc_tit_box"><h3>新入驻商家</h3></div>
<div class="cc_shops clearfix">
    <ul>
        <c:forEach items="${allBusinesses}" var="business" varStatus="status">
            <c:if test="${status.count%8 ne 0 }"><li ></c:if>
            <c:if test="${status.count%8 eq 0 }"><li class="mrnone"></c:if>
                <img src="${business.shopLogoUrl}" width="70" height="70" alt="logo" />
                <p>${business.wangWangId}</p>
            </li>
        </c:forEach>
    </ul>
</div>
<!--//cc2-->

<!--cc3-->
<!--div class="cc_tit_box"><h3>Ta们刚刚评价了</h3></div>
<div class="cc_just clearfix">
    <ul>
        <li >
            <a href="/task_info/index/476" target="_blank"><img src="/upload/1/3/2/ec7cc58fc5fb29c160012c1f2e650469.jpg" alt="pic" width="245" height="254" /></a>
            <h4>魅色口红8.25</h4>
            <div class="user_name clearfix"><img src="/upload/face/7/7/3/568de4aabaccbcdd8352cfee2c603784_100x100.jpg" alt="user" width="40" height="40" /><span>march317：</span></div>
            <p><i class="f18">“</i>包装好，唇膏完全没有磕碰，完好无损，验证了是...<i class="f18">”</i></p>
        </li>
        <li >
            <a href="/task_info/index/456" target="_blank"><img src="/upload/3/9/3/b3987aa526a08fc7edcb8087a3505e8b.jpg" alt="pic" width="245" height="254" /></a>
            <h4>2015新款 春秋季穿着男士商务休闲立领夹克...</h4>
            <div class="user_name clearfix"><img src="/static/images/user_pic.png" alt="user" width="40" height="40" /><span>rolina666：</span></div>
            <p><i class="f18">“</i>薄款的，再过一个月就可以穿了。款式和质量都很...<i class="f18">”</i></p>
        </li>
        <li >
            <a href="/task_info/index/411" target="_blank"><img src="/upload/1/4/4/21fb761b9bf7c815b9971953cc2cc638.jpg" alt="pic" width="245" height="254" /></a>
            <h4>薄款 运动七分裤</h4>
            <div class="user_name clearfix"><img src="/upload/face/5/9/0/92868088f5be51928e797ec6125b422d_100x100.jpg" alt="user" width="40" height="40" /><span>chenchunyu：</span></div>
            <p><i class="f18">“</i>刚收到宝贝，发货速度很快，昨天下午拍的，性价...<i class="f18">”</i></p>
        </li>
        <li class="mrnone">
            <a href="/task_info/index/464" target="_blank"><img src="/upload/2/9/3/a817c8aa1597c9d6e39c428d16ea94e2.jpg" alt="pic" width="245" height="254" /></a>
            <h4>文学泉咸鸭蛋</h4>
            <div class="user_name clearfix"><img src="/upload/face/4/3/3/a9cb8b28c9ba4fdac3b52d62775d763a_100x100.jpg" alt="user" width="40" height="40" /><span>Wssjnawm：</span></div>
            <p><i class="f18">“</i>好久没吃到这么好吃的鸭蛋了，蛋黄又沙又糯，特...<i class="f18">”</i></p>
        </li>
        <li >
            <a href="/task_info/index/340" target="_blank"><img src="/upload/5/3/4/19ddf84893585d30c1e8047a190a5e7e.jpg" alt="pic" width="245" height="254" /></a>
            <h4>孕妇纯棉托腹休闲裤</h4>
            <div class="user_name clearfix"><img src="/static/images/user_pic.png" alt="user" width="40" height="40" /><span>徐小勇在路上：</span></div>
            <p><i class="f18">“</i>裤子质量很不错，面料很好<i class="f18">”</i></p>
        </li>
        <li >
            <a href="/task_info/index/465" target="_blank"><img src="/upload/1/1/6/bbbc5f2fd5c2e49eaa4bb3ba61ad24eb.jpg" alt="pic" width="245" height="254" /></a>
            <h4>『高端定制』纯色棒球帽</h4>
            <div class="user_name clearfix"><img src="/static/images/user_pic.png" alt="user" width="40" height="40" /><span>徐小勇在路上：</span></div>
            <p><i class="f18">“</i>质量很好，戴上很帅气<i class="f18">”</i></p>
        </li>
        <li >
            <a href="/task_info/index/452" target="_blank"><img src="/upload/2/0/2/3c15a990ee7fbd078b162156096d4324.jpg" alt="pic" width="245" height="254" /></a>
            <h4>秋冬日系潮牌牛仔裤</h4>
            <div class="user_name clearfix"><img src="/static/images/user_pic.png" alt="user" width="40" height="40" /><span>chenllibing：</span></div>
            <p><i class="f18">“</i>裤子很快收到了，试试刚好，质量非常好，很喜欢...<i class="f18">”</i></p>
        </li>
        <li class="mrnone">
            <a href="/task_info/index/430" target="_blank"><img src="/upload/3/0/4/4bd43fca8d94881ae38864a48741873e.jpg" alt="pic" width="245" height="254" /></a>
            <h4>KT猫iphone5s/6/6p手机壳</h4>
            <div class="user_name clearfix"><img src="/upload/face/4/7/7/38ba7a3465af1e494898eb207edb531a_100x100.jpg" alt="user" width="40" height="40" /><span>糯米格子：</span></div>
            <p><i class="f18">“</i>店家的老顾客啦，今天就收到了，质量还是那么好...<i class="f18">”</i></p>
        </li>
    </ul>
</div>
<!--//cc3-->

<!--footer-->
<div class="index_wrap">
    <div class="index_footer_msg clearfix">
        <dl class="bg1">
            <dt>帮助中心</dt>
            <dd><a href="/test/help_js" target="_blank">关于我们</a></dd>
            <dd><a href="/test/index" target="_blank">商家流程</a></dd>
            <dd><a href="/test/index_m" target="_blank">试用流程</a></dd>
        </dl>
        <dl class="bg2">
            <dt>试客常见问题</dt>
            <dd><a href="/test/index_m/50" target="_blank">什么是琳琅试用</a></dd>
            <dd><a href="/test/index_m/51" target="_blank">如何申请试用</a></dd>
            <dd><a href="/test/index_m/52" target="_blank">中奖后如何下单领取</a></dd>
        </dl>
        <dl class="bg3">
            <dt>商家常见问题</dt>
            <dd><a href="/test/index/40" target="_blank">试用推广的好处是什么</a></dd>
            <dd><a href="/test/index/41" target="_blank">琳琅试用的优势</a></dd>
            <dd><a href="/test/index/42" target="_blank">如何发布试用任务</a></dd>
        </dl>
        <dl class="bg4 brnone">
            <dt>服务中心</dt>
            <dd><a href="http://bbs.zhongguohuo.com/" target="_blank">琳琅论坛</a></dd>
            <dd><a href="/test/help_lxwm" target="_blank">联系我们</a></dd>
            <dd><a href="/test/help_invite" target="_blank">诚聘英才</a></dd>
            <dd><a href="/test/help_book" target="_blank">用户协议</a></dd>
        </dl>
    </div>
    <div class="index_footer_msg1 clearfix">
        <ul class="clearfix">
            <li><a href="/test/help_js" target="_blank">关于我们</a></li>
            <li><a href="/test/help_lxwm" target="_blank">联系我们</a></li>
            <li><a href="/test/help_invite" target="_blank">诚聘英才</a></li>
            <li><a href="/test/help_book" target="_blank">用户协议</a></li>
            <li><a href="/test/index_m" target="_blank">帮助中心</a></li>
            <li class="bnone"><a href="http://bbs.zhongguohuo.com/" target="_blank">琳琅论坛</a></li>
        </ul>
    </div>
    <div class="index_copyright">Copyright © 2015 zhongguohuo.com 版权所有 沪ICP备07009935号</div>
</div>
<!--//footer-->
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
<script type="text/javascript">
    $(function() {

        //轮播1
        $('.left_banner1').unslider({
            speed: 500,               //速度动画每个幻灯片(以毫秒为单位)
            delay: 4000,              //  幻灯片动画之间的延迟(毫秒)
            complete: function(){},  // 后调用一个函数,每个幻灯片的动画
            keys: false,               // 启用键盘快捷键(左、右)箭头
            dots: true,               //  显示点导航
            fluid: false             //  支持响应设计,可能会破坏没有响应的设计哦
        })

        //轮播2
        $('.left_banner2').unslider({
            speed: 500,
            delay: 4500,
            complete: function(){},
            keys: false,
            dots: true,
            fluid: false
        })

        //轮播3
        $('.left_banner3').unslider({
            speed: 500,
            delay: 5000,
            complete: function(){},
            keys: false,
            dots: true,
            fluid: false
        })

        //琳琅快报
        $("div.tab_tit ul li").mouseover(function(){
            $(this).addClass("active").siblings().removeClass("active");
            var index = $("div.tab_tit ul li").index(this);
            $("div.tab_list>div").eq(index).show().siblings().hide();
        })

        //二维码扫描图
        $(".shokey_ewm").hover(function(){
            $(".shokey_ewm .img").toggle();
        })


    })
</script>
</body>
</html>