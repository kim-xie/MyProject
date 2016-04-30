<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
  
  	<title>表单文件上传--传统上传方式</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<style>
		*{padding: 0;margin:0}
		body{font-size:14px;font-family: "微软雅黑";background:#333}
		#box{width:560px;height:480px;background:#888;margin:100px auto;text-align:center;border:1px solid #ccc;}
	</style>
  </head>
  <body>
  	
  	<div id="box">
  	
  		<form action="${basePath}/upload/upload" method="post" enctype="multipart/form-data">
  			<input type="file" name="doc" />
  			<input type="submit" value="上传">
  		</form>
  		
  	</div>
  	
  	<script type="text/javascript">
  	
  	
  	</script>
  </body>
</html>
