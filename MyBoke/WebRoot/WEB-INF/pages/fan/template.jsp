<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${fans}" var="fan">
	<div class="col-sm-6 col-md-4">
	   <div class="thumbnail">
	   	   <input type="hidden" id="itemCount" value="${itemCount}"/>
	       <a href="#">
	      	  <img src="${basePath}${fan.fanHeaderPic}" class="img-circle" alt="头像" width="60" height="60">
	       </a> 
	       <div class="caption">
	        <a href="javascript:void(0);">
	        	<h3 class="text-center">${fan.fanName}</h3>
	        </a>
	        <p  class="text-center txt">越努力，越幸运！just do</p>
	        <p  class="text-center">
		        <a href="#" class="pics"><strong>129</strong><span>作品</span></a> 
		        <a href="#" class="fans"><strong>129</strong><span>粉丝</span></a>
		        <a href="#" class="looks"><strong>129</strong><span>关注</span></a>
		    </p>
	       </div>
	   </div>
	</div>
</c:forEach>
