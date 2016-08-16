<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="nav-top">
  <div class="wrap">
    <div class="wrap-left">
      <c:if test="${empty member}">
        <a href="/login">请登录</a> | <a href="/register/buyer">注册试客</a> . <a href="/register/business">注册商家</a>
      </c:if>
      <c:if test="${!empty member}">
        <a href="/member">${member.account}</a> | <a href="/logout">退出</a>
      </c:if>
    </div>
    <div class="wrap-right">
      <!--未登录-->
      <a href="/test/index_m">帮助中心</a>
    </div>
  </div>
</div>