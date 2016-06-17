<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${contents}" var="content">
	<div class="panel panel-default col-md-12">
		<input type="hidden" id="itemCount" value="${itemCount}"/>
		<div class="panel-body">
			<div class="col-md-2 pull-left pic">
				<a href="javascript:void(0);" target="_blank" onclick="changeHits(this);" data-hits="${content.hits}" data-opid="${content.id}" data-model="content">
					<img src="${content.image}" class="img-responsive" alt="Responsive image"/>
				</a>
			</div> 
			<div class="col-md-10 pull-left">
				<h4 style="margin:2px 0 8px 0;">
					<a class="tag bg-blue" target="_blank" href="">${content.tag}</a>
					<a class="ellipsis title" href="" title="" target="_blank">${content.title}</a>
				</h4>
				<p>
					${content.description}
				</p>
				<div class="pull-left" style="line-height:30px;">
					<a class="u_headrpic pull-left" href="" title="" target="_blank">
						<img src="${basePath}${content.headerPic}" class="img-responsive img-circle pull-left" style="width:30px;height:30px;">
						<strong class="name pull-left" style="line-height:30px;font-size: 14px;color:#394a58;font-weight: 600;padding: 0 20px 0 8px;">${content.userName}</strong>
					</a>
					<div class="msg pull-left">
						<span><i class="iconfont icon-eye"></i><em>${content.hits}</em></span>
						<span><i class="iconfont icon-comment"></i><em>${content.comments}</em></span>
						<span><i class="iconfont icon-zan"></i><em>${content.loves}</em></span>
					</div>
				</div>
				<div class="data">
					<i class="iconfont icon-time"></i>
					${king:formatDate(content.createTime,'yyyy-MM-dd')}
					<%-- ${king:timeFormat(content.createTime)} --%>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
