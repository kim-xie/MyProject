<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${musics}" var="music">
	<div class="col-md-3 col-xs-6 col-sm-3 list" >
		<!-- shade -->
		<div class="shade"></div>
		<!-- pic -->
		<div class="cover">
			<a href="${basePath}/music/detail/${music.id}.do" target="_blank">
				<img src="${basePath}${music.img}" title="${music.title}" class="img-responsive img" alt="Responsive image">
			</a>
		</div>
		<!-- info -->
		<div class="info">
			<h4 class="title ellipsis">${music.title}</h4>
			<div class="msg">
				<span class="time tmui-tips" tip="${king:formatDate(music.createTime,'yyyy-MM-dd HH:mm:ss')}"><i class="iconfont icon-time"></i>
					<em><fmt:formatDate value="${music.createTime}" dateStyle="medium"/></em>
				</span>
				<span><i class="iconfont icon-music" title="收听数"></i><em>${music.hits}</em></span>
				<span><i class="iconfont icon-comment" title="评论数"></i><em>${music.comments}</em></span>
				<span><i class="iconfont icon-zan" title="点赞数"></i><em>${music.loves}</em></span>
			</div>
			<p class="user">
				<a href="#" target="_blank">
					<img src="${basePath}${music.headerPic}" class="img-circle headerPic">
					<strong class="name">${music.username}</strong>
				</a>
			</p>
		</div>
	</div>
</c:forEach>
