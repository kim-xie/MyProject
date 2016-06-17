<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="banner" varStatus="bannerindex" items="${banners}">
	<div class="item">
		<img src="${basePath}${banner.img}" alt="${bannerindex.count} slide" width="1200">
	</div>
</c:forEach>
