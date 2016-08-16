<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>试客商家发布任务第三步如何找到商品</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link href="/static/css/stask3.css" rel="stylesheet" />
  <link href="/static/css/common.css" rel="stylesheet" />
  <script type="text/javascript" src="/static/script/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="/static/script/My97DatePicker-time/WdatePicker.js"></script>
  <script type="text/javascript" src="/static/script/common.js"></script>
  <script type="text/javascript" src="/static/js/jquery.form.js"></script>
  <script type="text/javascript" src="/static/script/task3.js"></script>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="/member">个人中心</a> > <a href="javascript:;">发布试用</a>
</div>

<form action="?" method="post" id="task3" enctype="multipart/form-data">
  <input name="task_id" type="hidden" value="585" />

  <div class="s-wrap">
    <div class="stit">
      <h2><img src="/static/images/s-tit1.png" alt="发布试用" /></h2>
      <div class="Process">
        <ul class="clearfix">
          <li style="width:16%" class="cur"><em class="Processyes">1</em><span class="c-green">选平台</span></li>
          <li style="width:19%" class="cur"><em class="Processyes">2</em><span class="c-green">填写商品和订单信息</span></li>
          <li style="width:17%"><em class="Processing">3</em><span class="c-yellow">如何找到商品</span></li>
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
      <h3>第三步：设置如何找到商品</h3>
      <div class="tit-choose">已选择：<span>${tempTask.mallPlatformId==1?'淘宝':'天猫'}</span>|<span>${business.wangWangId}</span>|<span>常规试用</span></div>
    </div>
    <p class="textmsg">请添加几个订单来源方式，任务发布时系统将会随机安排试客通过不同的方式模拟真实购物流程</p>
    <!--内容区-->
    <div class="scontent">
      <!--步骤1-->
      <div id="step-1" class="step" style="display:block;">
        <div class="step1-title">1.填写商品信息</div>
        <div class="step1-main">
          <div class="step1-main1">
            <div class="step-writ" style="display:block;">
              <div class="step-writ-box">
                <!--php模版-->

                <!--确认后的淘宝-->
                <div class="step-show updateTB" style="display:none; clear:both;">
                  <div class="list">
                    <label>
                      <input type="checkbox" name="platform[]" value="tb" id="tb_sub" />通过<span>淘宝自然搜索</span>找到商品
                    </label>
                    <a class="alter">修改</a>
                  </div>
                  <div class="update cb key1">
                    <span style="display:inline-block; float:left;"><img src="" class="tb_show_img" width="60" height="60" style="vertical-align:middle; margin-right:18px;" alt="pic"></span>
                    <span class="w1 fl">关键字来源1：<em class="tbgjc"></em></span>
                    <span class="w2 fl">所在分类：<em class="tbfl"></em></span>
                    <span class="w3 fl">价格：<i class="tbcosts"></i>-<i class="tbcostm"></i>元</em></span>
                    <span>所在地：<em class="tbaddress"></em></span>
                  </div>
                  <div class="update key2 cb none">
                    <span style="display:inline-block; float:left;"><img src="" class="tb_show_img" width="60" height="60" style="vertical-align:middle; margin-right:18px;" alt="pic"></span>
                    <span class="w1 fl" style="line-height:33px;">关键字来源1：<em class="tbgjc"></em><br />关键字来源2:<em class="tbgjc2"></em></span>
                    <span class="w2 fl" style="line-height:33px;">所在分类：<em class="tbfl"></em><br />所在分类:<em class="tbfl2"></em></span>
                    <span class="w3 fl">价格：<i class="tbcosts"></i>-<i class="tbcostm"></i>元</em></span>
                    <span>所在地：<em class="tbaddress"></em></span>
                  </div>
                </div>
                <!--//确认后的淘宝-->
                <p class="list S-TB" style="clear:both;"><label><input type="checkbox"  checked="checked" />通过<span>淘宝自然搜索</span>找到商品</label></p>

                <div class="J_FIVE_CONTENT">
                  <!--taobao-->
                  <div style="display:block;" class="S-BOX-TB">
                    <div>
                      <p class="tit">使用“淘宝搜索框”查找商品</p>
                      <P class="tit1">请上传<span>“淘宝商品主图”</span>，已便试客快速找到任务商品
                      <input type="file" id="tb_task_img" name="tb_task_img" value="" />
                      <span id="tb_task_msg"></span>
                    </div>
                    <div id="addkey">
                      <p class="tit2">关键字来源<span id="addkey-num">1</span>：</p>
                      <p class="tit3">
                        让试客在<span>taobao.com</span>搜索关键字进入<span>"搜索列表"</span>
                        <input type="text" name="keyword" class="text w135" data-a="gjc" reg="keyword"/><a class="skip" target="_blank" href="http://bbs.zhongguohuo.com/thread-1031868-1-1.html">如何选择关键词？</a>
                      </p>
                      <p class="tit3">
                        在当前列表中，告诉试客通过筛选分类找到商品
                        <input type="text" name="filter1" class="text w70 ml-21" data-a="f1" data-b="arr"/>
                        <input name="filter2" type="text" class="text w70" data-a="f2" data-b="arr" />
                        <input name="filter3" type="text" class="text w70" data-a="f3" data-b="arr" />
                        <input name="filter4" type="text" class="text w70" data-a="f4" data-b="arr"/>
                      </p>
                    </div>

                    <p class="tit4"><a href="javascript:;" class="up"><img src="/static/images/s-jia-icon.gif" alt="+"  style="vertical-align: middle;"/> 可多添加<i id="num1">1</i>个淘宝搜索关键字方案</a>（最多可添加2个方案）<em>可提高任务安全保障</em></p>

                    <!--soso-->
                    <div class="soso" id="sosoTB">
                      <p class="title">缩小搜索范围：</p>
                      <p class="so-txt1">让买手用列表筛选中<span>“价格筛选”</span>、<span>“商品所在地”</span>缩小范围<em>选填</em></p>
                      <div>
                        <strong>价格：</strong>

                        <input type="text" data-a="scost" name="start_price" class="text w65" onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')"  />元-
                        <input type="text" data-a="mcost" name="end_price" class="text w65" onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')" />元
                        <span class="padd">|</span><strong>商品所在地：</strong>
                            <span class="ie7_areaHack_area">
                                <div class="sel-loc-box">
                                  <div class="fake-select sel-loc">
                                    <ul class="selected">
                                      <li>
                                        <s class="sel_dropdown"><s class="i"></s></s>
                                        <input type="hidden" name="area" class="position" value="全国" />
                                        <a href="javascript:;" data-value="全国" data-nogo="true">全国</a>

                                      </li>
                                    </ul>
                                    <div style="display: none;" class="toselect">
                                      <ul class="loc1"><li class="checked"><a _val="全国" href="javascript:;">全国</a></li></ul>
                                      <ul class="loc2 split">
                                        <li><a trace="location" _val="江苏,浙江,上海">江浙沪</a></li>
                                        <li><a trace="location" _val="广州,深圳,中山,珠海,佛山,东莞,惠州">珠三角</a></li>
                                        <li><a trace="location" _val="香港,澳门,台湾">港澳台</a></li>
                                        <li><a trace="location" _val="美国,英国,法国,瑞士,澳洲,新西兰,加拿大,奥地利,韩国,荷兰,新加坡,其它国家">海外</a></li>
                                        <li><a trace="location">北京</a></li>
                                        <li><a trace="location">上海</a></li>
                                        <li><a trace="location">广州</a></li>
                                        <li><a trace="location">深圳</a></li>
                                        <li><a trace="location" _val="北京,天津">京津</a></li>
                                      </ul>
                                      <ul class="loc3">
                                        <li><a trace="location">杭州</a></li>
                                        <li><a trace="location">温州</a></li>
                                        <li><a trace="location">宁波</a></li>
                                        <li><a trace="location">南京</a></li>
                                        <li><a trace="location">苏州</a></li>
                                        <li><a trace="location">济南</a></li>
                                        <li><a trace="location">青岛</a></li>
                                        <li><a trace="location">大连</a></li>
                                        <li><a trace="location">无锡</a></li>
                                        <li><a trace="location">合肥</a></li>
                                        <li><a trace="location">天津</a></li>
                                        <li><a trace="location">长沙</a></li>
                                        <li><a trace="location">武汉</a></li>
                                        <li><a trace="location">石家庄</a></li>
                                        <li><a trace="location">郑州</a></li>
                                        <li><a trace="location">成都</a></li>
                                        <li><a trace="location">重庆</a></li>
                                        <li><a trace="location">西安</a></li>
                                        <li><a trace="location">昆明</a></li>
                                        <li><a trace="location">南宁</a></li>
                                        <li><a trace="location">福州</a></li>
                                        <li><a trace="location">厦门</a></li>
                                        <li><a trace="location">南昌</a></li>
                                        <li><a trace="location">东莞</a></li>
                                        <li><a trace="location">沈阳</a></li>
                                        <li><a trace="location">长春</a></li>
                                        <li><a trace="location">哈尔滨</a></li>
                                      </ul>
                                      <ul class="loc4 split">
                                        <li><a trace="location">河北</a></li>
                                        <li><a trace="location">河南</a></li>
                                        <li><a trace="location">湖北</a></li>
                                        <li><a trace="location">湖南</a></li>
                                        <li><a trace="location">福建</a></li>
                                        <li><a trace="location">江苏</a></li>
                                        <li><a trace="location">江西</a></li>
                                        <li><a trace="location">广东</a></li>
                                        <li><a trace="location">广西</a></li>
                                        <li><a trace="location">海南</a></li>
                                        <li><a trace="location">浙江</a></li>
                                        <li><a trace="location">安徽</a></li>
                                        <li><a trace="location">吉林</a></li>
                                        <li><a trace="location">辽宁</a></li>
                                        <li><a trace="location">黑龙江</a></li>
                                        <li><a trace="location">山东</a></li>
                                        <li><a trace="location">山西</a></li>
                                        <li><a trace="location">陕西</a></li>
                                        <li><a trace="location">新疆</a></li>
                                        <li><a trace="location">云南</a></li>
                                        <li><a trace="location">贵州</a></li>
                                        <li><a trace="location">四川</a></li>
                                        <li><a trace="location">甘肃</a></li>
                                        <li><a trace="location">宁夏</a></li>
                                        <li><a trace="location">西藏</a></li>
                                        <li><a trace="location">香港</a></li>
                                        <li><a trace="location">澳门</a></li>
                                        <li><a trace="location">台湾</a></li>
                                        <li><a trace="location">内蒙古</a></li>
                                      </ul>
                                    </div>
                                  </div>
                                </div>
                            </span>
                      </div>
                    </div>
                    <!--//soso-->
                    <p class="checkout-btnp" style="display:block;"><a class="checkout-btn checkout-btn-tb" href="javascript:;">确认提交信息</a></p>


                  </div>
                  <!--//taobao-->

                </div>


                <!--确认后的天猫-->
                <div class="step-show updateTM" style="display:none; clear:both;">
                  <div class="list">
                    <label><input name="platform[]" value="tm" type="checkbox" id="tm_sub" />通过<span>天猫自然搜索</span>找到商品</label><a class="alter">修改</a>
                  </div>
                  <div class="update cb key1">
                    <span style="display:inline-block; float:left;"><img src="" class="tm_show_img" width="60" height="60" style="vertical-align:middle; margin-right:18px;" alt="pic"></span>
                    <span class="w1 fl">关键字来源1：<em class="tbgjc"></em></span>
                    <span class="w2 fl">所在分类：<em class="tbfl"></em></span>
                    <span class="w3 fl">价格：<i class="tbcosts"></i>-<i class="tbcostm"></i>元</em></span>
                    <span>所在地：<em class="tbaddress"></em></span>
                  </div>
                  <div class="update key2 cb">
                    <span style="display:inline-block; float:left;"><img src="" class="tm_show_img" width="60" height="60" style="vertical-align:middle; margin-right:18px;" alt="pic"></span>
                    <span class="w1 fl" style="line-height:33px;">关键字来源1：<em class="tbgjc"></em><br />关键字来源2:<em class="tbgjc2"></em></span>
                    <span class="w2 fl" style="line-height:33px;">所在分类：<em class="tbfl"></em>	<br />所在分类:<em class="tbfl2"></em></span>
                    <span class="w3 fl">价格：<i class="tbcosts"></i>-<i class="tbcostm"></i>元</em></span>
                    <span>所在地：<em class="tbaddress"></em></span>
                  </div>
                </div>
                <!--//确认后的天猫-->
                <p class="list S-TM" style="clear:both;"><label><input  type="checkbox" />通过<span>天猫自然搜索</span>找到商品</label></p>
                <!--tmall-->
                <div class="S-BOX-TM" style="display:none;clear:both;">
                  <div>
                    <p class="tit">使用“天猫搜索框”查找商品</p>
                    <P class="tit1">请上传<span>“天猫商品主图”</span>，已便试客快速找到任务商品

                    <input type="file" id="tm_task_img" name="tm[img]" value="" />
                    <span id="tm_task_msg"></span>
                  </div>

                  <div id="addkeyTM">
                    <p class="tit2">关键字来源<span id="addkeyTM-num">1</span>：</p>
                    <p class="tit3">
                      让试客在<span>tmall.com</span>搜索关键字进入<span>"搜索列表"</span>
                      <input type="text" class="text w135" name="tm[so][0][keyword]" data-a="tmgjc" reg="keyword" /><a target="_blank" class="skip" href="http://bbs.zhongguohuo.com/thread-1031868-1-1.html">如何选择关键词？</a>
                    </p>
                    <p class="tit3">
                      在当前列表中，告诉试客通过筛选分类找到商品
                      <input type="text"  class="text w70 ml-21" name="tm[so][0][filter][]" data-a="f1" data-b="tmarr" />
                      <input type="text" class="text w70"  name="tm[so][0][filter][]" data-a="f2" data-b="tmarr" />
                      <input type="text" class="text w70"  name="tm[so][0][filter][]" data-a="f3" data-b="tmarr" />
                      <input type="text" class="text w70"  name="tm[so][0][filter][]" data-a="f4" data-b="tmarr" />
                    </p>
                  </div>

                  <p class="tit5"><a href="javascript:;" class="up"><img src="/static/images/s-jia-icon.gif" alt="+"  style="vertical-align: middle;"/> 可多添加1个淘宝搜索关键字方案</a>（最多可添加2个方案）<em>可提高任务安全保障</em></p>


                  <!--sosoTM-->
                  <div class="soso" id="sosoTM">
                    <p class="title">缩小搜索范围：</p>
                    <p class="so-txt1">让买手用列表筛选中<span>“价格筛选”</span>、<span>“商品所在地”</span>缩小范围<em>选填</em></p>
                    <div>
                      <strong>价格：</strong>
                      <input type="text"  data-a="scost" name="tm[start_price]" value="" class="text w65" onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')"  />元-
                      <input type="text" data-a="mcost" name="tm[end_price]" value="" class="text w65" onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')" />元
                      <span class="padd">|</span><strong>商品所在地：</strong>
                                        <span class="ie7_areaHack_area">
                                            <div class="sel-loc-box">
                                              <div class="fake-select sel-loc">
                                                <ul class="selected">
                                                  <li>
                                                    <s class="sel_dropdown"><s class="i"></s></s>

                                                    <input type="hidden" name="area" class="position" value="全国" />
                                                    <a href="javascript:;" data-value="全国" data-nogo="true">全国</a>

                                                  </li>
                                                </ul>
                                                <div style="display: none;" class="toselect">
                                                  <ul class="loc1"><li class="checked"><a _val="全国" href="javascript:;">全国</a></li></ul>
                                                  <ul class="loc2 split">
                                                    <li><a trace="location" _val="江苏,浙江,上海">江浙沪</a></li>
                                                    <li><a trace="location" _val="广州,深圳,中山,珠海,佛山,东莞,惠州">珠三角</a></li>
                                                    <li><a trace="location" _val="香港,澳门,台湾">港澳台</a></li>
                                                    <li><a trace="location" _val="美国,英国,法国,瑞士,澳洲,新西兰,加拿大,奥地利,韩国,荷兰,新加坡,其它国家">海外</a></li>
                                                    <li><a trace="location">北京</a></li>
                                                    <li><a trace="location">上海</a></li>
                                                    <li><a trace="location">广州</a></li>
                                                    <li><a trace="location">深圳</a></li>
                                                    <li><a trace="location" _val="北京,天津">京津</a></li>
                                                  </ul>
                                                  <ul class="loc3">
                                                    <li><a trace="location">杭州</a></li>
                                                    <li><a trace="location">温州</a></li>
                                                    <li><a trace="location">宁波</a></li>
                                                    <li><a trace="location">南京</a></li>
                                                    <li><a trace="location">苏州</a></li>
                                                    <li><a trace="location">济南</a></li>
                                                    <li><a trace="location">青岛</a></li>
                                                    <li><a trace="location">大连</a></li>
                                                    <li><a trace="location">无锡</a></li>
                                                    <li><a trace="location">合肥</a></li>
                                                    <li><a trace="location">天津</a></li>
                                                    <li><a trace="location">长沙</a></li>
                                                    <li><a trace="location">武汉</a></li>
                                                    <li><a trace="location">石家庄</a></li>
                                                    <li><a trace="location">郑州</a></li>
                                                    <li><a trace="location">成都</a></li>
                                                    <li><a trace="location">重庆</a></li>
                                                    <li><a trace="location">西安</a></li>
                                                    <li><a trace="location">昆明</a></li>
                                                    <li><a trace="location">南宁</a></li>
                                                    <li><a trace="location">福州</a></li>
                                                    <li><a trace="location">厦门</a></li>
                                                    <li><a trace="location">南昌</a></li>
                                                    <li><a trace="location">东莞</a></li>
                                                    <li><a trace="location">沈阳</a></li>
                                                    <li><a trace="location">长春</a></li>
                                                    <li><a trace="location">哈尔滨</a></li>
                                                  </ul>
                                                  <ul class="loc4 split">
                                                    <li><a trace="location">河北</a></li>
                                                    <li><a trace="location">河南</a></li>
                                                    <li><a trace="location">湖北</a></li>
                                                    <li><a trace="location">湖南</a></li>
                                                    <li><a trace="location">福建</a></li>
                                                    <li><a trace="location">江苏</a></li>
                                                    <li><a trace="location">江西</a></li>
                                                    <li><a trace="location">广东</a></li>
                                                    <li><a trace="location">广西</a></li>
                                                    <li><a trace="location">海南</a></li>
                                                    <li><a trace="location">浙江</a></li>
                                                    <li><a trace="location">安徽</a></li>
                                                    <li><a trace="location">吉林</a></li>
                                                    <li><a trace="location">辽宁</a></li>
                                                    <li><a trace="location">黑龙江</a></li>
                                                    <li><a trace="location">山东</a></li>
                                                    <li><a trace="location">山西</a></li>
                                                    <li><a trace="location">陕西</a></li>
                                                    <li><a trace="location">新疆</a></li>
                                                    <li><a trace="location">云南</a></li>
                                                    <li><a trace="location">贵州</a></li>
                                                    <li><a trace="location">四川</a></li>
                                                    <li><a trace="location">甘肃</a></li>
                                                    <li><a trace="location">宁夏</a></li>
                                                    <li><a trace="location">西藏</a></li>
                                                    <li><a trace="location">香港</a></li>
                                                    <li><a trace="location">澳门</a></li>
                                                    <li><a trace="location">台湾</a></li>
                                                    <li><a trace="location">内蒙古</a></li>
                                                  </ul>
                                                </div>
                                              </div>
                                            </div>
                                        </span>
                    </div>
                  </div>
                  <!--//sosoTM-->

                  <p class="checkout-btnp" style="display:block;"><a class="checkout-btn checkout-btn-tm" href="javascript:;">确认提交信息</a></p>
                </div>
                <!--//tmall-->
                <!--//php模版-->

              </div>
            </div>
          </div>
        </div>
      </div>
      <!--//步骤1-->
    </div>
    <!--//内容区-->
    <!--跳转按钮-->
    <div class="sbtn-box" style="margin-bottom:60px;">
      <span><a href="/business/task_2/585?pid=1&ttid=1&binding_id=167" class="s-prev">上一步</a></span>
      <span><a class="s-next disabled">下一步</a><em>（设置试用份数）</em></span>
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

    //跳转
    $(".s-next").click(function(){
      if(!$(this).hasClass("disabled")){
        $("#task3").submit();
      };
    })

    // 上传文件类型大小验证
    $('input[type="file"]').each(function(){
      $(this).change(function(){
        fileChange(this,1,'jpg|jpeg|png|gif',$(this).attr('checkfor'));
      });
    })


    //点击验证淘宝信息
    $('.scontent').find('a.checkout-btn-tb').click(function(event) {

      var $regList = $(".J_FIVE_CONTENT *[reg]");
      var _re = regForm($regList);

      //验证淘宝信息
      var simg = $("#tb_task_img").val();//获取上传地址
      if(simg==""){
        $("#tb_task_msg").html('<span class="error" style="color:red; padding-left:18px; display:inline!important;">请上传商品图</span>')
        return false;
      }


      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }


      //如果验证成功执行
      $('.sbtn-box').find('a.s-next').removeClass('disabled');
      $("#tb_sub").attr("checked","checked");//添加选中状态

      var tbimg = $("#tb_task_img").val();//获取上传的图片地址
      $(".tb_show_img").attr("src",'/upload/'+tbimg);//添加上传的图片地址


      //点击淘宝提交按钮
      $(this).parent().hide();
      $(".S-TB").hide();
      $("#sosoTB").hide();
      $(".S-BOX-TB").hide();
      $(".updateTB").show();

      if($(".S-BOX-TB").find("input").is(".taobaokey2")){//如果添加第二个淘宝关键字执行
        $(".updateTB .key1").hide();
        $(".updateTB .key2").show();
        var $uptb =	$(".updateTB");
        var $boxtb = $(".S-BOX-TB");
        var $css = $(".addkeycss");
        $uptb.find('em.tbgjc').text($boxtb.find('input[data-a="gjc"]').val());//关键词来源1
        $uptb.find('em.tbfl').text($boxtb.find('input[data-a="f1"]').val()+" "+ $boxtb.find('input[data-a="f2"]').val()+" "+ $boxtb.find('input[data-a="f3"]').val()+" "+ $boxtb.find('input[data-a="f4"]').val());//所在分类1
        $uptb.find('em.tbgjc2').text($boxtb.find('.taobaokey2').val());//关键词来源2
        $uptb.find('em.tbfl2').text($css.find('input[data-a="f1"]').val()+" "+ $css.find('input[data-a="f2"]').val()+" "+ $css.find('input[data-a="f3"]').val()+" "+ $css.find('input[data-a="f4"]').val());//所在分类2
        $uptb.find('i.tbcosts').text($("#sosoTB").find('input[data-a="scost"]').val());//价格小
        $uptb.find('i.tbcostm').text($("#sosoTB").find('input[data-a="mcost"]').val());//价格大
        $uptb.find('em.tbaddress').text($(".fake-select").find('input[name="area"]').val());//地址
      }else{
        $(".updateTB .key1").show();
        $(".updateTB .key2").hide();
        var $uptb =	$(".updateTB");
        var $boxtb = $(".S-BOX-TB");
        $uptb.find('em.tbgjc').text($boxtb.find('input[data-a="gjc"]').val());//关键词来源
        $uptb.find('em.tbfl').text($boxtb.find('input[data-a="f1"]').val()+" "+ $boxtb.find('input[data-a="f2"]').val()+" "+ $boxtb.find('input[data-a="f3"]').val()+" "+ $boxtb.find('input[data-a="f4"]').val());//所在分类
        $uptb.find('i.tbcosts').text($("#sosoTB").find('input[data-a="scost"]').val());//价格小
        $uptb.find('i.tbcostm').text($("#sosoTB").find('input[data-a="mcost"]').val());//价格大
        $uptb.find('em.tbaddress').text($(".fake-select").find('input[name="area"]').val());//地址
      };

    })


    //点击淘宝修改按钮
    $(".updateTB").find(".alter").click(function(){
      $("a.checkout-btn-tb").parent().show();
      $(".updateTB").hide();
      $(".S-TB").show();
      $("#sosoTB").show();
      $(".S-BOX-TB").show();
      $("#tb_sub").attr("checked",false);//取消选择提交表单

      if( $(".updateTB").is(":hidden")&& $(".updateTM").is(":hidden")&& $(".updateSJTB").is(":hidden")&& $(".updateTJB").is(":hidden")&& $(".updateTBUZ").is(":hidden")&& $(".updateWB").is(":hidden")&& $(".updateQQ").is(":hidden"))
      {
        $('.sbtn-box').find('a.s-next').addClass('disabled');
      }

    })


    //验证天猫信息


    $('.S-BOX-TM').find('a.checkout-btn').click(function(event) {
      var $regList = $(".S-BOX-TM *[reg]");
      var _re = regForm($regList);


      var tmimg = $("#tm_task_img").val();//获取上传地址
      if(tmimg==""){
        $("#tm_task_msg").html('<span class="error" style="color:red; padding-left:18px; display:inline!important;">请上传商品图</span>')
        return false;
      }


      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }
      //如果验证成功执行
      $('.sbtn-box').find('a.s-next').removeClass('disabled');
      $("#tm_sub").attr("checked","checked");//添加选中状态

      var tmimg = $("#tm_task_img").val();//获取上传的图片地址
      $(".tm_show_img").attr("src",'/upload/'+tmimg);//添加上传的图片地

      //点击天猫提交按钮
      $('.step-writ-box .checkout-btnp').find('a.checkout-btn-tm').live("click",function(){
        $(this).parent().hide();
        $(".S-TM").hide();
        $("#sosoTM").hide();
        $(".S-BOX-TM").hide();
        $(".updateTM").show();
        var $uptm =	$(".step-show.updateTM");
        var $boxtm = $(".S-BOX-TM");
        if($(".S-BOX-TM").find("input").is(".tmallkey2")){//如果添加第二个天猫关键字执行
          $(".updateTM .key1").hide();
          $(".updateTM .key2").show();
          var $csstm = $(".addkeycsstm");
          $uptm.find('em.tbgjc').text($boxtm.find('input[data-a="tmgjc"]').val());//关键词来源1
          $uptm.find('em.tbfl').text($boxtm.find('input[data-a="f1"]').val()+" "+ $boxtm.find('input[data-a="f2"]').val()+" "+ $boxtm.find('input[data-a="f3"]').val()+" "+ $boxtm.find('input[data-a="f4"]').val());//所在分类
          $uptm.find('em.tbgjc2').text($boxtm.find('.tmallkey2').val());//关键词来源2
          $uptm.find('em.tbfl2').text($csstm.find('input[data-a="f1"]').val()+" "+ $csstm.find('input[data-a="f2"]').val()+" "+ $csstm.find('input[data-a="f3"]').val()+" "+ $csstm.find('input[data-a="f4"]').val());//所在分类2
          $uptm.find('i.tbcosts').text($("#sosoTM").find('input[data-a="scost"]').val());//价格小
          $uptm.find('i.tbcostm').text($("#sosoTM").find('input[data-a="mcost"]').val());//价格大
          $uptm.find('em.tbaddress').text($(".S-BOX-TM .fake-select").find('input[name="tm[area]"]').val());//地址
        }else{
          $(".updateTM .key1").show();
          $(".updateTM .key2").hide();
          $uptm.find('em.tbgjc').text($boxtm.find('input[data-a="tmgjc"]').val());//关键词来源
          $uptm.find('em.tbfl').text($boxtm.find('input[data-a="f1"]').val()+" "+ $boxtm.find('input[data-a="f2"]').val()+" "+ $boxtm.find('input[data-a="f3"]').val()+" "+ $boxtm.find('input[data-a="f4"]').val());//所在分类
          $uptm.find('i.tbcosts').text($("#sosoTM").find('input[data-a="scost"]').val());//价格小
          $uptm.find('i.tbcostm').text($("#sosoTM").find('input[data-a="mcost"]').val());//价格大
          $uptm.find('em.tbaddress').text($(".S-BOX-TM .fake-select").find('input[name="tm[area]"]').val());//地址
        };

      })


    })

    //点击天猫修改按钮
    $(".updateTM").find(".alter").click(function(){
      $("a.checkout-btn-tm").parent().show();
      $(".updateTM").hide();
      $(".S-TM").show();
      $("#sosoTM").show();
      $(".S-BOX-TM").show();
      $("#tm_sub").attr("checked",false);//取消选择提交表单

      if( $(".updateTB").is(":hidden")&& $(".updateTM").is(":hidden")&& $(".updateSJTB").is(":hidden")&& $(".updateTJB").is(":hidden")&& $(".updateTBUZ").is(":hidden")&& $(".updateWB").is(":hidden")&& $(".updateQQ").is(":hidden"))
      {
        $('.sbtn-box').find('a.s-next').addClass('disabled');
      }

    })

    //验证手机淘宝信息
    $('.S-BOX-SJTB').find('a.checkout-btn').click(function(event) {
      var $regList = $(".S-BOX-SJTB *[reg]");
      var _re = regForm($regList);
      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }
      //如果验证成功执行
      $('.sbtn-box').find('a.s-next').removeClass('disabled');
      $("#sjtb_sub").attr("checked","checked");//添加选中状态

    })

    //点击手机淘宝提交按钮
    $('.S-BOX-SJTB .checkout-btnp').find('a.checkout-btn').click(function(){
      $(this).parent().hide();
      $(".S-SJTB").hide();
      $("#sosoSJTB").hide();
      $(".S-BOX-SJTB").hide();
      $(".updateSJTB").show();
      //打印填写的信息
      var $upsjtb = $(".step-show.updateSJTB");
      var $boxsjtb = $(".S-BOX-SJTB");
      if($(".S-BOX-SJTB").find("input").is(".sjtbkey2")){//如果添加第二个手机淘宝关键字执行
        $("#sjtbgjc2").show();
        $upsjtb.find('em.sjtbgjc').text($boxsjtb.find('input[data-sjtb="sjtbgjc"]').val());//关键词来源
        $upsjtb.find('i.sjtbgjc2').text($boxsjtb.find('input[data-sjtb="sjtbgjc1"]').val());//关键词来源2
        $upsjtb.find('em.sjtbfl').text($boxsjtb.find('input[data-sjtb="sjtbfl"]').val());//所在分类
        $upsjtb.find('em.sjtbgg').text($boxsjtb.find('input[data-a="f1"]').val()+" "+ $boxsjtb.find('input[data-a="f2"]').val()+" "+ $boxsjtb.find('input[data-a="f3"]').val()+" "+ $boxsjtb.find('input[data-a="f4"]').val());//规格
        $upsjtb.find('i.sjtbcosts').text($("#sosoSJTB").find('input[data-a="scost"]').val());//价格小
        $upsjtb.find('i.sjtbcostm').text($("#sosoSJTB").find('input[data-a="mcost"]').val());//价格大
        $upsjtb.find('em.sjtbaddress').text($(".S-BOX-SJTB .fake-select").find('input[name="sjtb[area]"]').val());//地址
        if($("#sjtbselect").val()==1){
          $upsjtb.find('i.sjbtpaixu').text("综合排序");
        }else{
          $upsjtb.find('i.sjbtpaixu').text("销量优先");
        }

      }else{
        $("#sjtbgjc2").hide();
        $upsjtb.find('em.sjtbgjc').text($boxsjtb.find('input[data-sjtb="sjtbgjc"]').val());//关键词来源
        $upsjtb.find('em.sjtbfl').text($boxsjtb.find('input[data-sjtb="sjtbfl"]').val());//所在分类
        $upsjtb.find('em.sjtbgg').text($boxsjtb.find('input[data-a="f1"]').val()+" "+ $boxsjtb.find('input[data-a="f2"]').val()+" "+ $boxsjtb.find('input[data-a="f3"]').val()+" "+ $boxsjtb.find('input[data-a="f4"]').val());//规格
        $upsjtb.find('i.sjtbcosts').text($("#sosoSJTB").find('input[data-a="scost"]').val());//价格小
        $upsjtb.find('i.sjtbcostm').text($("#sosoSJTB").find('input[data-a="mcost"]').val());//价格大
        $upsjtb.find('em.sjtbaddress').text($(".S-BOX-SJTB .fake-select").find('input[name="sjtb[area]"]').val());//地址
        if($("#sjtbselect").val()==1){
          $upsjtb.find('i.sjbtpaixu').text("综合排序");
        }else{
          $upsjtb.find('i.sjbtpaixu').text("销量优先");
        }
      };

    })
    //点击手机淘宝修改按钮
    $(".updateSJTB").find(".alter").click(function(){
      $(".S-BOX-SJTB a.checkout-btn").parent().show();
      $(".updateSJTB").hide();
      $(".S-SJTB").show();
      $("#sosoSJTB").show();
      $(".S-BOX-SJTB").show();
      $("#sjtb_sub").attr("checked",false);//取消选择提交表单

      if( $(".updateTB").is(":hidden")&& $(".updateTM").is(":hidden")&& $(".updateSJTB").is(":hidden")&& $(".updateTJB").is(":hidden")&& $(".updateTBUZ").is(":hidden")&& $(".updateWB").is(":hidden")&& $(".updateQQ").is(":hidden"))
      {
        $('.sbtn-box').find('a.s-next').addClass('disabled');
      }

    })


    //淘金币时间验证方法
    function checkEndTime(){
      var startTime=$("#startTime").val();
      var start=new Date(startTime.replace("-", "/").replace("-", "/"));
      var endTime=$("#endTime").val();
      var end=new Date(endTime.replace("-", "/").replace("-", "/"));
      if(end<start){
        return false;
      }
      return true;
    }

    //验证淘金币信息
    $('.S-BOX-TJB').find('a.checkout-btn').click(function(event) {
      var $regList = $(".S-BOX-TJB *[reg]");
      var _re = regForm($regList);


      var tjbimg = $("#tjb_task_img").val();//获取上传地址
      if(tjbimg==""){
        $("#tjb_task_msg").html('<span class="error" style="color:red; padding-left:18px; display:inline!important;">请上传商品图</span>')
        return false;
      }

      if(!checkEndTime()){
        alert("活动结束时间必须晚于开始时间！");
        return;
      }

      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }
      //如果验证成功执行
      $('.sbtn-box').find('a.s-next').removeClass('disabled');
      $("#tjb_sub").attr("checked","checked");//添加选中状态

      var tjbimg = $("#tjb_task_img").val();//获取上传的图片地址
      $("#tjb_show_img").attr("src",'/upload/'+tjbimg);//添加上传的图片地


      //点击淘金币提交按钮
      $(this).parent().parent().hide();
      $(".S-TJB").hide();
      $(".S-BOX-TJB").hide();
      $(".updateTJB").show();
      //打印填写的信息
      var $u = $(".step-show.updateTJB");
      var $b = $(".S-BOX-TJB");
      $u.find('i.tjbtitle').text($b.find('input[name="tjb[title]"]').val());//标题
      $u.find('em.tjbfl').text($b.find('input[data-tjb="fenlei1"]').val()+" "+$b.find('input[data-tjb="fenlei2"]').val());//分类
      $u.find('em.tjbstime').text($b.find('input[name="tjb[start_time]"]').val());//开始时间
      $u.find('em.tjbetime').text($b.find('input[name="tjb[end_time]"]').val());//结束时间

    })


    //点击淘金币修改按钮
    $(".updateTJB").find(".alter").click(function(){
      $(".S-BOX-TJB a.checkout-btn").parent().show();
      $(".updateTJB").hide();
      $(".S-TJB").show();
      $(".S-BOX-TJB").show();
      $("#tjb_sub").attr("checked",false);//取消选择提交表单

      if( $(".updateTB").is(":hidden")&& $(".updateTM").is(":hidden")&& $(".updateSJTB").is(":hidden")&& $(".updateTJB").is(":hidden")&& $(".updateTBUZ").is(":hidden")&& $(".updateWB").is(":hidden")&& $(".updateQQ").is(":hidden"))
      {
        $('.sbtn-box').find('a.s-next').addClass('disabled');
      }

    })


    //验证淘宝U站
    $('.S-BOX-TBUZ').find('a.checkout-btn').click(function(event) {
      var $regList = $(".S-BOX-TBUZ *[reg]");
      var _re = regForm($regList);

      var tuzimg = $("#tuz_task_img").val();//获取上传地址
      if(tuzimg==""){
        $("#tuz_task_msg").html('<span class="error" style="color:red; padding-left:18px; display:inline!important;">请上传商品图</span>')
        return false;
      }


      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }
      //如果验证成功执行
      $('.sbtn-box').find('a.s-next').removeClass('disabled');
      $("#tbuz_sub").attr("checked","checked");//添加选中状态

      var tuzimg = $("#tuz_task_img").val();//获取上传的图片地址
      $("#tuz_show_img").attr("src",'/upload/'+tuzimg);//添加上传的图片地


      //点击淘宝U站活动页面提交按钮
      $(this).parent().parent().hide();
      $(".S-TBUZ").hide();
      $(".S-BOX-TBUZ").hide();
      $(".updateTBUZ").show();
      //打印填写的信息
      var $u = $(".step-show.updateTBUZ");
      var $b = $(".S-BOX-TBUZ");
      $u.find('i.tbuzurl').text($b.find('input[name="tuz[url]"]').val());//地址
      $u.find('i.tbuztitle').text($b.find('input[name="tuz[title]"]').val());//标题


    })


    //点击淘宝U站活动页面修改按钮
    $(".updateTBUZ").find(".alter").click(function(){
      $(".S-BOX-TBUZ a.checkout-btn").parent().show();
      $(".updateTBUZ").hide();
      $(".S-TBUZ").show();
      $(".S-BOX-TBUZ").show();
      $("#tbuz_sub").attr("checked",false);//取消选择提交表单

      if( $(".updateTB").is(":hidden")&& $(".updateTM").is(":hidden")&& $(".updateSJTB").is(":hidden")&& $(".updateTJB").is(":hidden")&& $(".updateTBUZ").is(":hidden")&& $(".updateWB").is(":hidden")&& $(".updateQQ").is(":hidden"))
      {
        $('.sbtn-box').find('a.s-next').addClass('disabled');
      }

    })




    //新浪微博方法：插件验证成功后，判定新浪添加的连接是否相同，相同则执行隐藏打印效果
    function fsina(){
      var str = ""//input值
      var num = 0;//次数
      $(".J_sina_num").find("input").each(function(){
        var b = $(this).val();
        str+=b+"authorlhn";
        num+=1;
      })
      if(num==1){
        var sArr=str.split("authorlhn")
        var s = sArr[0];
      }else if(num==2){
        var sArr=str.split("authorlhn")
        var s = sArr[0];
        var s1 =sArr[1];
        if(s==s1){
          alert("连接不能重复!")
          return false;
        };
      }else{
        var sArr=str.split("authorlhn")
        var s = sArr[0];
        var s1 =sArr[1];
        var s2 =sArr[2];
        if(s==s1||s==s2||s1==s2){
          alert("连接不能重复!")
          return false;
        };
      }

      //点击新浪按钮后执行的操作
      $(this).parent().parent().hide();
      $(".S-SINA").hide();
      $(".S-BOX-SINA").hide();
      $(".updateWB").show();
      //打印填写的新浪信息
      var $u = $(".step-show.updateWB");
      var $b = $(".S-BOX-SINA");
      var $size = $(".S-BOX-SINA #addkeySINA").size();

      if($size == 1){
        $("#sina_up2").hide();
        $("#sina_up3").hide();
        $u.find('i.sina_url1').text($b.find('input:eq(0)').val());//新浪连接1
      }else if($size == 2){
        $("#sina_up2").show();
        $("#sina_up3").hide();
        $u.find('i.sina_url1').text($b.find('input:eq(0)').val());//新浪连接1、2
        $u.find('i.sina_url2').text($b.find('input:eq(1)').val());
      }else{
        $("#sina_up2").show();
        $("#sina_up3").show();
        $u.find('i.sina_url1').text($b.find('input:eq(0)').val());//新浪连接1、2、3
        $u.find('i.sina_url2').text($b.find('input:eq(1)').val());
        $u.find('i.sina_url3').text($b.find('input:eq(2)').val());
      };


    }

    //验证新浪微博
    $('.S-BOX-SINA').find('a.checkout-btn').click(function(event) {
      var $regList = $(".S-BOX-SINA *[reg]");
      var _re = regForm($regList);
      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }
      //如果验证成功执行
      fsina();
      $('.sbtn-box').find('a.s-next').removeClass('disabled');
      $("#sina_sub").attr("checked","checked");//添加选中状态
    })


    //点击新浪微博活动页面修改按钮
    $(".updateWB").find(".alter").click(function(){
      $(".S-BOX-SINA a.checkout-btn").parent().show();
      $(".updateWB").hide();
      $(".S-SINA").show();
      $(".S-BOX-SINA").show();
      $("#sina_sub").attr("checked",false);//取消选择提交表单

      if( $(".updateTB").is(":hidden")&& $(".updateTM").is(":hidden")&& $(".updateSJTB").is(":hidden")&& $(".updateTJB").is(":hidden")&& $(".updateTBUZ").is(":hidden")&& $(".updateWB").is(":hidden")&& $(".updateQQ").is(":hidden"))
      {
        $('.sbtn-box').find('a.s-next').addClass('disabled');
      }

    })



    //插件验证成功后，判定QQ添加的连接是否相同，相同则执行隐藏打印效果
    function fqq(){
      var str = ""//input值
      var num = 0;//次数
      $(".J_qq_num").find("input").each(function(){
        var b = $(this).val();
        str+=b+"author20150701";
        num+=1;
      })

      var sArr=str.split("author20150701")
      if(num==1){
        var s = sArr[0];
      }else if(num==2){
        var s = sArr[0];
        var s1 =sArr[1];
        if(s==s1){
          alert("连接不能重复!")
          return false;
        };
      }else{
        var s = sArr[0];
        var s1 =sArr[1];
        var s2 =sArr[2];
        if(s==s1||s==s2||s1==s2){
          alert("连接不能重复!")
          return false;
        };
      }

      //点击qq按钮后执行的操作
      $(this).parent().parent().hide();
      $(".S-QQ").hide();
      $(".S-BOX-QQ").hide();
      $(".updateQQ").show();
      //打印填写的QQ信息
      var $u = $(".step-show.updateQQ");
      var $b = $(".S-BOX-QQ");
      var $size = $(".S-BOX-QQ #addkeyQQ").size();

      if($size == 1){
        $("#qq_up2").hide();
        $("#qq_up3").hide();
        $u.find('i.qq_url1').text($b.find('input:eq(0)').val());//qq连接1
      }else if($size == 2){
        $("#qq_up2").show();
        $("#qq_up3").hide();
        $u.find('i.qq_url1').text($b.find('input:eq(0)').val());//qq连接1、2
        $u.find('i.qq_url2').text($b.find('input:eq(1)').val());
      }else{
        $("#qq_up2").show();
        $("#qq_up3").show();
        $u.find('i.qq_url1').text($b.find('input:eq(0)').val());//qq连接1、2、3
        $u.find('i.qq_url2').text($b.find('input:eq(1)').val());
        $u.find('i.qq_url3').text($b.find('input:eq(2)').val());
      };


    }


    //验证qq空间
    $('.S-BOX-QQ').find('a.checkout-btn').click(function(event) {
      var $regList = $(".S-BOX-QQ *[reg]");
      var _re = regForm($regList);
      if(_re.length>0)
      {
        regFormRerun($regList,_re)
        return false;
      }
      //如果验证成功执行
      fqq();
      $('.sbtn-box').find('a.s-next').removeClass('disabled');
      $("#qq_sub").attr("checked","checked");//添加选中状态

    })

    //点击qq活动页面修改按钮
    $(".updateQQ").find(".alter").click(function(){
      $(".S-BOX-QQ a.checkout-btn").parent().show();
      $(".updateQQ").hide();
      $(".S-QQ").show();
      $(".S-BOX-QQ").show();
      $("#qq_sub").attr("checked",false);//取消选择提交表单

      if( $(".updateTB").is(":hidden")&& $(".updateTM").is(":hidden")&& $(".updateSJTB").is(":hidden")&& $(".updateTJB").is(":hidden")&& $(".updateTBUZ").is(":hidden")&& $(".updateWB").is(":hidden")&& $(".updateQQ").is(":hidden"))
      {
        $('.sbtn-box').find('a.s-next').addClass('disabled');
      }

    })



/////////////////////////////////////////////////////////////////////


    //淘宝添加搜索关键字0514
    $(".S-BOX-TB .up").click(function(){
      size = $("body").find("[id=addkey]").length;
      var i= 0;
      if(size < 2){
        _div = $("#addkey").clone().addClass("addkeycss"); //克隆对象
        _div.find("input[data-a='gjc']").attr("name","tb[so][1][keyword]").addClass("taobaokey2");//0507复制的input更改name值
        _div.find("input[data-b='arr']").attr("name","tb[so][1][filter][]");
        _div.find("input").attr("value","");//清空input值
        _div.find(".skip").html("删除X").addClass("J-del").removeClass("skip").css("color","#333").click(function(){
          $(this).parent().parent("#addkey").remove();
          $(".S-BOX-TB .tit4").show();
        });
        _div.find("#addkey-num").html(parseInt(size)+1);
        $("body").find("[id=addkey]:last").after(_div);
        $(".S-BOX-TB .tit4").hide();
      }else{
        alert("最多可添加2个方案!");
        $(".S-BOX-TB .tit4").hide();
      };
    })


    //天猫添加搜索关键字0514
    $(".S-BOX-TM .up").click(function(){
      size = $("body").find("[id=addkeyTM]").length;
      if(size < 2){
        _div = $("#addkeyTM").clone().addClass("addkeycsstm");
        _div.find("input[data-a='tmgjc']").attr("name","tm[so][1][keyword]").addClass("tmallkey2");
        _div.find("input[data-b='tmarr']").attr("name","tm[so][1][filter][]");
        _div.find("input").attr("value","");
        _div.find(".skip").html("删除X").addClass("J-del").removeClass("skip").css("color","#333").click(function(){
          $(this).parent().parent("#addkeyTM").remove();
          $(".S-BOX-TM .tit5").show();
        });
        _div.find("#addkeyTM-num").html(parseInt(size)+1);
        $("body").find("[id=addkeyTM]:last").after(_div);
        $(".S-BOX-TM .tit5").hide();
      }else{
        alert("最多可添加2个方案!");
        $(".S-BOX-TM .tit5").hide();
      };
    })


    //手机淘宝添加搜索关键字0514
    $(".S-BOX-SJTB .up").click(function(){
      size = $("body").find("[id=addkeySJTB]").length;
      if(size < 2){
        _div = $("#addkeySJTB").clone().addClass("addkeycsssjtb");
        _div.find("input").attr("value","");
        _div.find("input[data-sjtb='sjtbgjc']").attr("name","sjtb[so][1][keyword]").attr("data-sjtb","sjtbgjc1").addClass("sjtbkey2");
        _div.find("a").html("删除X").addClass("J-del").css("color","#333").click(function(){
          $(this).parent().parent("#addkeySJTB").remove();
          $('.S-BOX-SJTB .tit4').show();
        });
        _div.find("#addkeySJTB-num").html(parseInt(size)+1);
        $("body").find("[id=addkeySJTB]:last").after(_div);
        $('.S-BOX-SJTB .tit4').hide();
      }else{
        alert("最多可添加2个方案!");
      };
    })

    //新浪微博添加商品链接
    $(".S-BOX-SINA .qq-more").live("click",function(){
      size = $("body").find("[id=addkeySINA]").length;
      if(size==2){
        $(".S-BOX-SINA .qq-more").hide();
      }
      if(size < 3){
        _div = $("#addkeySINA").clone();
        _div.find("input").attr("value","");
        _div.find(".skipSINA").show().css("color","#333").click(function(){
          $(this).parent("#addkeySINA").remove();
          $(".S-BOX-SINA .qq-more").show();
        });
        _div.find("#addkeySINA-num").html(parseInt(size)+1);
        $("body").find("[id=addkeySINA]:last").after(_div);
      }
    })

    //QQ空间添加商品链接
    $(".S-BOX-QQ .qq-more").live("click",function(){
      size = $("body").find("[id=addkeyQQ]").length;
      if(size==2){
        $(".S-BOX-QQ .qq-more").hide();
      }
      if(size < 3){
        _div = $("#addkeyQQ").clone();
        _div.find("input").attr("value","");
        _div.find(".skipQQ").show().css("color","#333").click(function(){
          $(this).parent("#addkeyQQ").remove();
          $(".S-BOX-QQ .qq-more").show();
        });
        _div.find("#addkeyQQ-num").html(parseInt(size)+1);
        $("body").find("[id=addkeyQQ]:last").after(_div);
      };
    })


////////////////////////////////////////////

    //所在地
    $('ul.selected').click(function(e){
      e.stopPropagation();
      var $pr = $(this).parents('.sel-loc-box').find('.toselect');
      if($pr.is(':visible')){
        $pr.hide();
      }else{
        $pr.show();
      };
    });
    $('.toselect a').click(function(e){
      e.stopPropagation();
      e.preventDefault();
      var set = $(this).parents('.sel-loc-box').find('ul.selected a');
      var _val = $(this).text();
      set.html($(this).text())
      set.attr('data-value',_val);
      $(this).parents('.sel-loc-box').find('.position').val(_val);
      $('div.toselect').hide();
    });
    $(document).click(function(){
      $('div.toselect').hide();
    });
    //淘宝
    $(".S-TB label").click(function(){
      var $inp = $(this).find("input");
      if($inp.is(":checked")){
        $(".S-BOX-TB").show();
      }else{
        $(".S-BOX-TB").hide();
      };
    });
    //天猫
    $(".S-TM label").click(function(){
      var $inp = $(this).find("input");
      if($inp.is(":checked")){
        $(".S-BOX-TM").show();
      }else{
        $(".S-BOX-TM").hide();
      };
    });
    //手机淘宝
    $(".S-SJTB label").click(function(){
      var $inp = $(this).find("input");
      if($inp.is(":checked")){
        $(".S-BOX-SJTB").show();
      }else{
        $(".S-BOX-SJTB").hide();
      };
    });
    //淘金币
    $(".S-TJB label").click(function(){
      var $inp = $(this).find("input");
      if($inp.is(":checked")){
        $(".S-BOX-TJB").show();
      }else{
        $(".S-BOX-TJB").hide();
      };
    });
    //淘宝U站
    $(".S-TBUZ label").click(function(){
      var $inp = $(this).find("input");
      if($inp.is(":checked")){
        $(".S-BOX-TBUZ").show();
      }else{
        $(".S-BOX-TBUZ").hide();
      };
    });
    //新浪微博
    $(".S-SINA label").click(function(){
      var $inp = $(this).find("input");
      if($inp.is(":checked")){
        $(".S-BOX-SINA").show();
      }else{
        $(".S-BOX-SINA").hide();
      };
    });
    //QQ空间
    $(".S-QQ label").click(function(){
      var $inp = $(this).find("input");
      if($inp.is(":checked")){
        $(".S-BOX-QQ").toggle();
      }else{
        $(".S-BOX-QQ").hide();
      };
    });



///////////////////////////	


    //qq删除关键字
    $(".skipQQ").live("click",function(){
      $(".S-BOX-QQ .qqnums").eq(1).html("2")
      $(".S-BOX-QQ .qqnums").eq(2).html("3")
    })

    //SINA删除关键字
    $(".skipSINA").live("click",function(){
      $(".S-BOX-SINA .sinanums").eq(1).html("2")
      $(".S-BOX-SINA .sinanums").eq(2).html("3")
    })

    //返回上一步

    $("body").each(function(){//淘宝
      var s = $("#addkey .tit2").size();
      if(s==2){
        $(".step .step-writ .step-writ-box p.tit4").hide()
      }
    })
    $("body").find(".step .step-writ .step-writ-box p.tit3").eq(2).find("input").addClass('taobaokey2');
    $("body").find(".step .step-writ .step-writ-box p.tit3").eq(3).addClass('addkeycss');

    $("body").each(function(){//天猫
      var s = $("#addkeyTM .tit2").size();
      if(s==2){
        $(".step .step-writ .step-writ-box p.tit5").hide()
      }
    })
    $("body").find("#addkeyTM p.tit3").eq(2).find("input").addClass('tmallkey2');
    $("body").find("#addkeyTM p.tit3").eq(3).addClass('addkeycsstm');

    $("#addkeySINA .skipSINA").hide();//新浪微博
    $("#addkeyQQ .skipQQ").hide();//QQ空间


  })
</script>
</body>
</html>