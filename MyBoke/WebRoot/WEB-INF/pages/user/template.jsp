<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${users}" var="user">
	<li>
		<input type="hidden" id="itemCount" value="${itemCount}"/>
		<a class="fans-ava" target="_blank">
			<img src="${basePath}${user.headerPic}">
		</a>
		<div class="fans-r">
			<a class="fans-name" data-uname="${user.userName}">${user.userName}</a>
			<a class="fans-add" onclick="saveFan(this);" data-uid="${user.userId}">+ 关注</a>
		</div>
	</li>
</c:forEach>