<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${member.role <=2 }">
<div class="mleft">
  <!--dl class="bornone">
    <dt>试用管理</dt>
    <dd><a href="/buyer/task_platform/tb" target="_self">淘宝|天猫试用<span>(4781)</span></a></dd>
    <dd><a href="/buyer/task_platform/jd" target="_self">京东试用<span>(0)</span></a></dd>
  </dl-->
  <a href="/buyer/account" class="addbuy">+ 添加买号</a>
  <!--dl>
    <dt>邀请会员</dt>
    <dd><a href="/invite/invite?t=4" target="_self">邀请会员</a></dd>
  </dl-->
  <!--dl>
    <dt>资金记录</dt>
    <dd style="position:relative;"><a href="/buyer/money_record" target="_self">资金明细</a><em style="position:absolute;right:0;top:0;"><a href="/buyer/withdraw" class="c-blue">提现</a></em></dd>
    <dd><a href="/buyer/money_record?t=2" target="_self">金币记录</a></dd>
    <dd><a href="/buyer/money_record?t=3" target="_self">提现记录</a></dd>
  </dl-->
  <dl>
    <dt>账号信息</dt>
    <dd><a href="/member/userinfo" target="_self">基本信息</a></dd>
    <!--dd><a href="/member/buyer_card_manage" target="_self">银行卡帐号管理</a></dd-->
  </dl>
  <!--dl>
    <dt>申述中心</dt>
    <dd><a href="/tips" target="_self">消息</a></dd>
  </dl-->
</div>
</c:if>
<c:if test="${member.role >2 }">
<div class="mleft">
  <dl class="bornone">
    <dt>任务管理</dt>
    <dd><a href="#" target="_self">淘宝店铺<span>(0)</span></a></dd>
    <dd><a href="#" target="_self">天猫店铺<span>(0)</span></a></dd>
  </dl>
  <a href="/business/shoping_binding" class="addbuy" target="_blank">+ 绑定店铺</a>
  <dl>
    <dt>资金记录</dt>
    <dd style="position:relative;"><a href="/business/pay_money" target="_self">充值押金</a><em style="position:absolute;right:0;top:0;"><a href="/business/withdrawal" class="c-blue">提现</a></em></dd>
    <dd><a href="/business/money_record" target="_self">资金记录</a></dd>
  </dl>
  <dl>
    <dt>账号信息</dt>
    <dd><a href="/member/userinfo" target="_self">基本信息</a></dd><!--/member/userinfo-->
    <dd><a href="/business/bank_card" target="_self">提现帐号管理</a></dd>
  </dl>
  <dl>
    <dt>申述中心</dt>
    <dd><a href="/tips" target="_self">消息</a></dd>
    <!--<dd><a href="#" target="_self">邀请商家</a></dd>-->
  </dl>
</div>
</c:if>