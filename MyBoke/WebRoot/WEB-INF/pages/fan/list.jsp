<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" fan="no-cache">
	<meta http-equiv="cache-control" fan="no-cache">
	<meta http-equiv="expires" fan="0">    
	<meta http-equiv="keywords" fan="keyword1,keyword2,keyword3">
	<meta http-equiv="description" fan="This is my page">
	<%@include file="/WEB-INF/pages/common/common.jsp" %>
	<script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
 </head>
 <style>
 	.list-group{padding:0 100px;margin-bottom:0;}
 	.page-header{border-bottom:1px solid #ccc;}
 	.h{display:inline-block;margin:0 0 0 5px;color:#BDC8D1;font-weight:600;}
 	.h:hover{color:#3498db;}
 	h2,h3,h5{margin-top:0px;}
 	a:hover{text-decoration:none;color: #369;}
 	.fans_count{margin-left:20px;margin-right:5px;}
 	.active{color:#34495e;}
 	.pics,.fans,.looks{display:inline-block;padding:0 10px;font-size: 16px;width:62px;color: #34495e;}
 	.fans{border-left:1px solid #ecf0f1;border-right:1px solid #ecf0f1;}
 	.txt{color:#7f8c8d;margin-bottom:10px;}
 	.thumbnail{background-color:#FFF7E7;}
 	
 </style>
 <body data-count="${itemCount}">
	<%@include file="/WEB-INF/pages/common/header.jsp"%>
	<!-- 关注列表 -->
	<div class="list-group">
		<!-- 表头 -->
		<div class="page-header">
			<a href="#">
	       	  <img src="${basePath}${sessionScope.userHeaderPic}" class="img-circle" alt="头像" width="60" height="60">
	        </a> 
			<a href="#"><h2 class="uname h"><%=request.getSession().getAttribute("userName") %></h2></a> 
			<a href="#"><h5 class="fans_count h active" onclick="changeList(this)"  data-model="fans" data-count="${itemCount}">粉丝</h5></a>/ 
			<a href="#"><h5 class="looks_count h" onclick="changeList(this)" data-model="looks" data-count="${Count}">关注</h5></a> 
		</div>
		<!-- 列表 -->
		<div class="row"></div>
	</div>
	<!-- 分页  -->
	<div class="col-md-12 cpage" style="margin:30px 0;padding:0 495px;"></div>
	
	<%@include file="/WEB-INF/pages/common/footer.jsp"%>
	<script type="text/javascript">
	$(function(){
		var itemCount = $("body").data("count");
		kingFan.initPage(itemCount);
		kingFan.loadData(0,9);
	});
	
	// 菜单切换
	function changeList(obj){
		//$.tzConfirm({title:"友情提示",content:"您确定删除吗?"});
		var $obj = $(obj);
		var itemCount = $obj.data("count");
		kingFan.initPage(itemCount);
		kingFan.loadData(0,9,function(itemCount){
			kingFan.initPage(itemCount);
		});
	};
	
	function loading2(target,mark){
		$.loading({target:$(target),mark:1}); 
	};
	var kingFan = {
			timer :null,
			initPage:function(itemCount){
				$(".cpage").tzPage(itemCount, {
					num_edge_entries : 1, //边缘页数
					num_display_entries :4, //主体页数
					num_edge_entries:5,
					current_page:0,
					showGo:true,
					showSelect:false,
					items_per_page : 9, //每页显示X项
					prev_text : "前一页",
					next_text : "后一页",
					callback : function(pageNo,psize){//回调函数
						kingFan.loadData(pageNo,psize);
					}
				});
			},
			loadData:function(pageNo,pageSize,callback){
				clearTimeout(this.timer);
				this.timer = setTimeout(function(){
					$.ajax({
						type:"post",
						beforeSend:function(){loading2($(".row"),4);},
						url:basePath+"/fan/template.do",
						data:{pageNo:pageNo*pageSize,pageSize:pageSize},
						success:function(data){
							var $data = $(data);
							$(".row").html($data);
							var itemCount = $data.find("#itemCount").val();
							if(callback)callback(itemCount);
						}
					});
				},300);
			}	
		}
	</script>
 </body>
</html>
