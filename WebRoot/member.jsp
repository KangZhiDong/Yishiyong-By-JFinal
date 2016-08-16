<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>试客个人中心</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link rel="stylesheet" href="/static/css/business.css" />
  <link rel="stylesheet" href="/static/css/common.css" />
  <script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
</head>
<body>

<jsp:include page="/include/navTop.jsp" />
<jsp:include page="/include/header.jsp" />

<c:if test="${member.role <=2 }">
  <div class="buyer_info_top">
    升级<span>VIP</span>试客，您将立刻提升试用申请中奖率，并获赠<span>12</span>个金币，无需充值即可用于申请试用<a href="/buyer/renewal_vip">前去升级VIP会员&gt;</a>
  </div>
</c:if>
<div class="sbreadcrumbs">
  <a href="/">首页</a> > <a href="javascript:;">个人中心</a>
</div>

<!--wrap-->
<div class="m-wrap clearfix">
  <!-- 试客左侧 -->
  <jsp:include page="/member/include/mleft.jsp"/>
  <!--//试客左侧 -->    <!--right-content-->
  <div class="mright clearfix">

    <!--买家信息-->
    <c:if test="${member.role <=2 }">
    <div class="mright-cc">
      <div class="userbox clearfix">
        <div class="userbox-left">
          <img src="/static/images/user_pic.png" alt="用户头像" width="42" height="42" class="userpic"/>
          <span class="sp1">${member.account}</span>
          会员等级：
            <span class="c-red">普通会员</span>
            <a href="/buyer/buy_vip">充值会员</a>
        </div>
        <!--下面的安全等级模块图标：已绑定：a标签里的class  一一对应ok1.2.3.4  未绑定：no1.2.3.4-->
        <div class="userbox-right">安全等级：
          <a class="icon no1" title="绑定银行卡" href="/member/buyer_card_manage"></a>
          <a class="icon ok2" title="绑定手机号" href="/member/userinfo"></a>
          <a class="icon ok3" title="绑定邮箱" href="/member/userinfo"></a>
          <a class="icon no4" title="设定提现密码" href="/member/userinfo"></a>
        </div>
      </div>
      <div class="moneybox">
        <p>垫付本金： <span class="f24 red fb">0</span> 元<i></i></p>
        <p>待平台返还本金：<span class="red">0</span>元（<span class="red">0</span>笔）&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; 已返还到账户的本金：<span class="red">0.00</span>元 （<span class="red">0</span>笔） <a href="/buyer/withdraw" class="mai-take-btn">立即提现</a></p>
        <p class="mai-recharge-box">金币：<span class="red">2.00</span>点 (待商家发放金币：<span class="red">0</span>点 &nbsp;&nbsp;&nbsp; 冻结金币：<span class="red">0.00</span>点)<a href="/buyer/pay_gold" class="mai-recharge-btn">充 值</a><span class="cor999">做任务金币不够，可充值金币</span></p>
        <div>试客每申请1个任务将冻结1金币 | 任务未中奖、申请中途取消、中奖下单收货返款后解冻返还 | 已中奖自主放弃领取将扣除1金币</div>
      </div>

      <div class="record">
        <span>资金记录：</span>
        <div class="records">
          <div class="yongj"><a href="javascript:;" class="zuijin_yongjin_record ajaxed">最近资金记录</a></div>
          <div class="yongj_div records_position" style="display: none;">
            <a href="javascript:;" class="record_close"></a>
            <table id="zuijin_yongjin_record_tbl">
              <tbody>
              <tr><th width="25%">时间</th><th width="25%">类型</th><th width="25%">收入或支出</th><th width="25%">结余</th></tr>
              <!--资金记录每个模块，最多只展示最新的五条记录-->
              </tbody>
            </table>
            <a href="/buyer/money_record" target="_blank" class="all_records">查看全部记录&gt;</a>
          </div>
        </div>
        <div class="records">
          <div class="benj"><a href="javascript:;" class="zuijin_yongjin_record ajaxed">最近金币记录</a></div>
          <div class="yongj_div records_position" style="display: none;">
            <a href="javascript:;" class="record_close"></a>
            <table id="zuijin_yongjin_record_tbl">
              <tbody>
              <tr><th width="25%">时间</th><th width="25%">类型</th><th width="25%">收入或支出</th><th width="25%">结余</th></tr>
              </tbody>
            </table>
            <a href="/buyer/money_record?t=2" target="_blank" class="all_records">查看全部记录&gt;</a>
          </div>
        </div>
        <div class="records">
          <div class="zij"><a href="javascript:;" class="zuijin_benjin_record ajaxed">最近提现记录</a></div>
          <div class="benj_div records_position" style="display: none;">
            <a href="javascript:;" class="record_close"></a>
            <table id="zuijin_benjin_record_tbl">
              <tbody>
              <!-- <tr><th width="25%">时间</th><th width="25%">提现金额</th><th width="25%">手续费</th><th width="25%">到账金额</th></tr> -->
              <tr><th width="24%">时间</th><th width="19%">提现金额</th><th width="19%">手续费</th><th width="19%">消耗运费</th><th width="19%">到账金额</th></tr>

              </tbody>
            </table>
            <a href="/buyer/money_record?t=3" target="_blank" class="all_records">查看全部记录&gt;</a>
          </div>
        </div>
        <!--//资金记录结束-->

      </div>
    </div>
    </c:if>
    <!--//买家信息-->

    <!--//商家信息-->
    <c:if test="${member.role >2 }">
      <div class="mright-cc">
        <div class="userbox clearfix">
          <div class="userbox-left">
            <img src="/static/images/user_pic.png" alt="用户头像" width="42" height="42" class="userpic">

            <span class="sp1">${member.account}</span>
            会员等级：<span class="c-red">体验商家</span><a href="/business/buy_vip">购买会员</a>
          </div>
          <!--下面的安全等级模块图标：已绑定：a标签里的class  一一对应ok1.2.3.4  未绑定：no1.2.3.4-->
          <div class="userbox-right">安全等级：<a class="icon ok1" title="绑定银行卡" href="business/bank_card"></a><a class="icon ok2" title="绑定手机号" href=""></a><a class="icon ok3" title="绑定邮箱" href=""></a><a class="icon ok4" title="设定提现密码" href=""></a></div>
        </div>
        <div class="moneybox">
          <p>可用押金：<span class="jb">0.00</span> 元<i></i>平台冻结押金：<span class="c-red">0.00</span> 元<a href="/business/pay_money" class="pl33 c-blue" target="_blank">充值押金</a></p>
          <p>可用金币：<span class="jb">0.00</span> 点<a href="/business/pay_gold" target="_blank" class="pl44 c-blue">充值金币</a></p>
          <a href="/business/task_1" class="task_btn" target="_blank">发布试用任务</a>
        </div>
        <div class="record">
          <span>资金记录：</span>
          <div class="records">
            <div class="yongj"><a href="javascript:;" class="zuijin_yongjin_record ajaxed">最近押金记录</a></div>
            <div class="yongj_div records_position" style="display: none;">
              <a href="javascript:;" class="record_close"></a>
              <table id="zuijin_yongjin_record_tbl">
                <tbody>
                <tr><th width="25%">时间</th><th width="25%">类型</th><th width="25%">收入或支出</th><th width="25%">结余</th></tr>
                <!--资金记录每个模块，最多只展示最新的五条记录-->
                </tbody>

              </table>
              <a href="/business/money_record" target="_blank" class="all_records">查看全部记录&gt;</a>
            </div>
          </div>
          <div class="records">
            <div class="benj"><a href="javascript:;" class="zuijin_yongjin_record ajaxed">最近金币记录</a></div>
            <div class="yongj_div records_position" style="display: none;">
              <a href="javascript:;" class="record_close"></a>
              <table id="zuijin_yongjin_record_tbl">
                <tbody>
                <tr><th width="25%">时间</th><th width="25%">类型</th><th width="25%">收入或支出</th><th width="25%">结余</th></tr>
                </tbody>
              </table>
              <a href="/business/money_record?t=2" target="_blank" class="all_records">查看全部记录&gt;</a>
            </div>
          </div>
          <div class="records">
            <div class="zij"><a href="javascript:;" class="zuijin_benjin_record ajaxed">最近提现记录</a></div>
            <div class="benj_div records_position" style="display: none;">
              <a href="javascript:;" class="record_close"></a>
              <table id="zuijin_benjin_record_tbl">
                <tbody>
                <tr><th width="25%">时间</th><th width="25%">提现金额</th><th width="25%">手续费</th><th width="25%">到账金额</th></tr>

                </tbody>
              </table>
              <a href="/business/money_record?t=3" target="_blank" class="all_records">查看全部记录&gt;</a>
            </div>
          </div>
          <!--//资金记录结束-->
        </div>
      </div>
    </c:if>
    <!--//商家信息-->

    <c:if test="${member.role <2 }">
    <!--待处理订单-->
    <div class="mright-cc">
      <div class="mpending">
        <h2>待处理的试用</h2>
        <div class="mpending-list">
          <h3>已申请试用，待继续<span>您已申请了以下试用，请按照要求尽快完成并提交审核</span></h3>
          <ul>
            <li><a href="/buyer/award" target="_blank">淘宝|天猫<span>(<em>0</em>)</span></a></li>
          </ul>
        </div>
        <div class="mpending-list">
          <h3>已通过试用审核，待下单领取<span>您已通过了以下试用，请按照要求前去商家店铺下单付款</span></h3>
          <ul>
            <li><a href="/buyer/awardget" target="_blank">淘宝|天猫<span>(<em>0</em>)</span></a></li>
          </ul>
        </div>
        <div class="mpending-list">
          <h3>商家已确认发货，待收货好评<span>请在收到试用品后再确认收货并好评</span></h3>
          <ul>
            <li><a href="/buyer/waitting_get" target="_blank">淘宝|天猫<span>(<em>0</em>)</span></a></li>
          </ul>
        </div>
        <!--
        <div class="mpending-list bordernone">
            <h3>已收货好评，待重新确认返还金额<span>确认金额后，琳琅将自动返还本金至您的琳琅试用帐号</span></h3>
            <ul>
                <li><a href="/buyer/check_money" target="_blank">淘宝|天猫<span>(<em>0</em>)</span></a></li>
            </ul>
        </div>
        -->
      </div>
    </div>
    <!--//待处理订单-->


      <!--任务进展-->
      <div class="mright-cc">
        <div class="mpending">
          <h2>试用进展</h2>
          <form action="/member" method="post" id="frm_tasks">
            <div class="selectbox">
              <span>任务类型： </span>
              <select name="status">
                <option value="99" selected>全部</option>
                <option value="1" >常规试用</option>
                <option value="2" >爆款试用</option>
                <option value="3" >新品试用</option>
              </select>
              <span>平台： </span>
              <select name="platform">
                <option value="99" selected>全部</option>
                <option value="1" >淘宝</option>
                <option value="2" >天猫</option>
                <option value="3" >京东</option>
              </select>
              <span>试用进展： </span>
              <select name="step">
                <option value="99" selected>全部</option>
                <option value="0" >已申请，待完成任务</option>
                <option value="1" >已提交，待平台审核</option>
                <option value="3" >已通过，待下单领取</option>
                <option value="4" >已支付，待好评</option>
                <option value="6" >已好评，待确认退款</option>
                <!--<option value="7" >已晒单，待确认退款</option>-->
                <option value="8" >已结束</option>
              </select>
              <a id="J-submiit-btn">查 询</a>
            </div>
          </form>
          <div class="task-title-box">
            <span class="sw1">试用商品</span><span class="sw2">买号</span><span class="sw3">垫付本金</span><span class="sw4">赏金</span><span class="sw5">试用进度</span>
          </div>
          <c:if test="${empty listRecords}">
            <h2>暂无任务</h2>
          </c:if>
          <c:if test="${!empty listRecords}">
            <c:forEach items="${listRecords}" var="record">
              <div class="tasktab-box">
                <div class="tasktab-box-t">
                            <span class="fl">
                                <i class="play_small play_taobao"></i><span class="shopname">${record.businessWangWangId}</span>
                            </span>
                  <span class="fr">任务编号：${record.tiId}[<a href="/buyer/buyer_step/-${record.tiId}" class="c-blue">查看详情</a>]</span>
                </div>
                <div class="tasktab-box-c">
                  <ul>
                    <li class="li1"><img src="${record.productPictureUrl}" width="55" height="50" alt="pic"></li>
                    <li class="li2"><p>${record.productName}</p></li>
                    <li class="li3" style="padding:15px 0 0 0;text-align:center;width:110px;">${record.wangWangId}</li>
                    <li class="li4" style="padding:15px 0 0 10px;text-align:center;width:100px;">${record.productPrice}元</li>
                    <li class="li4" style="padding:15px 0 0 20px;text-align:center;width:90px;">${record.feedbackCoin}金币</li>
                    <li class="li5" style="padding:15px 0 0 0;text-align:center;width:110px;">
                      <c:if test="${record.awardgetStatus > 0}">已通过试用审核，待下单</c:if>
                      <c:if test="${record.awardgetStatus == 0}">${(record.applyStatus==4||record.applyStatus==8)?'未中奖':'待继续'}</c:if>
                    </li>
                  </ul>
                </div>
              </div>
            </c:forEach>
          </c:if>

          <!--分页-->
          <div class="pager">
            <!-- <div class="page"><a class="now">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">下一页</a> 共20页</div> -->
          </div>

        </div>
      </div>
      <!--//任务进展-->
    </c:if>


    <c:if test="${member.role >2 }">
      <div class="mright-cc">
        <div class="tasktime">
          <h2>任务进展</h2>
          <form action="?" method="get">
            <div class="selectbox">
              <span>平台： </span>
              <select name="pid">
                <option value="0">所有平台</option>
                <option value="1">淘宝</option>
                <option value="2">天猫</option>
              </select>
              <span>店铺： </span>
              <select name="binding_id">
                <option value="0">全部</option>
                <c:forEach items="${listBusinesses}" var="business">
                  <option value="${business.id}">${business.wangWangId}</option>
                </c:forEach>
              </select>
              <span>试用类型： </span>
              <select name="ttid">
                <option value="0">全部</option>
                <option value="1">常规试用</option>
                <option value="2">上新试用</option>
                <option value="3">爆款试用</option>
              </select>
              <input type="submit" value="查询">
            </div>
          </form>
          <!--新品试用-->

          <c:forEach items="${listTasks}" var="task">
            <div class="tasktab-box">
              <div class="tasktab-box-t">
                              <span class="fl">
                                  <i class="play_small play_taobao"></i><span class="shopname">${task.businessWangWangId}</span>任务编号：${task.id}[<a href="/business/task_detail/585" class="c-blue" target="_blank">详情</a>]
                              </span>
                <span class="fr">试用类型：<em class="c-yellow">常规试用</em></span>
              </div>
              <div class="tasktab-box-c">
                <ul>
                  <li class="li1"><img src="${task.productPictureUrl}" width="50" height="50" alt="pic"></li>
                  <li class="li2" style="width:355px;">${task.productName}</li>
                  <li class="li5">
                    <p>试用总份数(<i class="c-yellow">X</i>) | 申请人数(<i class="c-yellow">X</i>)</p>
                    <p>已领取(<i class="c-yellow">X</i>): <a class="c-blue" href="/business/task_paid?task_sn=2015083171838" target="_blank">待确认付款金额(<i class="c-yellow">0</i>)</a> | <a class="c-blue" href="/business/confirmation/585" target="_blank">待确认好评(<i class="c-yellow">0</i>)</a></p>
                  </li>
                </ul>
              </div>
            </div>
          </c:forEach>

          <!--翻页-->
          <div class="pager">
            <div class="page"><a class="now">1</a><a href="/member?pid=0&amp;binding_id=0&amp;ttid=0&amp;page=2" data-ci-pagination-page="2">2</a><a href="/member?pid=0&amp;binding_id=0&amp;ttid=0&amp;page=2" data-ci-pagination-page="2">下一页 &gt;</a></div>
          </div>
        </div>
      </div>
    </c:if>


  </div>
  <!--//right-content-->
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
  <p>Copyright © 2015 zhongguohuo.com 版权所有 沪ICP备07009935号</p>
</div>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA1NzkzNV8zMDUyMDdfODAwMDU3OTM1Xw"></script>
<script>

  $(document).ready(function(){
    $(".capitallist_top a").click(function(){
      var bishu = parseInt($(this).attr('data'));
      if(bishu < 1){
        return false;
      }
      $(this).parents("table").toggleClass("capitallist_tops");
      $(this).parents("table").siblings("div").toggle();
    })

    /* 资金记录 点击显示区域中操作 */
    $(".records div a").click(function(){
      $(this).parent("div").addClass("recordposition").siblings("div").show();
      $(this).parent().parent().siblings().children().removeClass("recordposition");
      $(this).parent().parent().siblings().children(".records_position").hide();
    })

    $(".records .records_position .record_close").click(function(){
      //$(this).parent().hide();
      //$(this).parent().siblings().removeClass("recordposition");
      $(this).parents(".records_position").hide();
      $(this).parents(".records_position").siblings().removeClass("recordposition");
    })

    //试用进展表单提交按钮
    $('#J-submiit-btn').click(function(){
      $('#frm_tasks').submit();
    })


  });

</script>

</body>
</html>