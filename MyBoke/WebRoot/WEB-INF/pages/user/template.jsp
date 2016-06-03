<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${users}" var="user">
	<li style="display: list-item;">
		<a class="fans-ava" target="_blank">
			<img src="${basePath}${user.headerPic}">
		</a>
		<div class="fans-r">
			<a class="fans-name" target="_blank">${user.userName}</a>
			<a class="fans-add">+ 关注</a>
		</div>
	</li>
</c:forEach>