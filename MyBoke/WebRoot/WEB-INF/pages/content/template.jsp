<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${contents}" var="content">
	<div class="panel panel-default col-md-12">
		<input type="hidden" id="itemCount" value="${itemCount}"/>
		<div class="panel-body" style="padding:0;margin-top:0;margin-left:-15px;">
			<div class="col-md-2 pull-left" style="padding:0;height:120px;">
				<a href="${basePath}/content/detail/${content.id}.do" target="_blank">
					<img src="${basePath}${content.image}" class="img-responsive" alt="Responsive image" 
					style="height:120px">
				</a>
			</div> 
			<div class="col-md-10 pull-left" style="padding-right:0;">
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
						<strong class="name pull-left" style="line-height:30px;font-size: 12px;color: #394a58;font-weight: bold;padding: 0 15px;">${content.userName}</strong>
					</a>
					<div class="msg pull-left">
						<span><i class="iconfont icon-eye"></i><em>${content.hits}</em></span>
						<span><i class="iconfont icon-comment"></i><em>${content.comments}</em></span>
						<span><i class="iconfont icon-zan"></i><em>${content.loves}</em></span>
					</div>
				</div>
				<div class="data">
					<i class="iconfont icon-time"></i>
					${content.createTime}
				</div>
			</div>
		</div>
	</div>
</c:forEach>
