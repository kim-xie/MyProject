<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!doctype html>
<html>
 <head>
  <title>king的博客</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="Author" content="king">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <%@include file="/WEB-INF/pages/common/common.jsp"%>
  <style type="text/css">
	/*个人信息栏目  start*/
	.person{margin-bottom:30px;margin-top:30px;margin-left:-15px;}
	.person .user{height:100%;margin:0 auto;overflow:hidden;background:#fafafa;}
 	/* calebox */
	.person .user .calebox .caleheader{height:35px;background:#fafafa;line-height:35px;color:#4c4c4c;border-bottom:1px solid #eee;position:relative;}
	.person .user .calebox .caleheader #prev,#next{position:absolute;top:0;font-size:30px;cursor:pointer;}
	.person .user .calebox .caleheader #prev:hover{color:#00f;}
	.person .user .calebox .caleheader #next:hover{color:#00f;}
	.person .user .calebox .caleheader #prev{left:2px;}
	.person .user .calebox .caleheader #next{right:2px;}
	.person .user .calebox .caletab{border-collapse:collapse;width:100%}
	.person .user .calebox .caletab thead th{background:#fafafa;color:#4c4c4c}
	.person .user .calebox .caletab th,td{border:1px solid #eee;text-align:center;padding:6px 4px;transition:all 0.3s ease-in-out;}
	.person .user .calebox .caletab td:hover{background:#999;color:#00f;cursor:pointer;transition:all 0.3s ease-in-out;}
	.person .user .calebox .caletab td.noon{color:#999;}
	.person .user .calebox .caletab td.on{color:#fafafa;background:#0066ff;}
	.person .user #time{position:absolute;right:20%;top:2px;font-size:14px;font-weight:700;color:#4c4c4c;}
	.person .user #cale{position:absolute;left:20%;top:2px;font-size:14px;font-weight:700;color:#4c4c4c;}
	/*个人信息栏目  end*/
	
	/* 公告栏   start */
    .soupBox{height:80px;width:670px;overflow:hidden;margin:30px auto;}
	.soupBox .soup{position:relative;float:right;width:auto;height:40px;padding:0 120px 0 20px;background-color:#fff7e7;border-radius:20px;box-shadow:1px 1px 2px rgba(0,0,0,.2);margin-top:36px;}
	.soupBox .soup li i{position:absolute;font-size:28px;color:#eae1d0;cursor:pointer;}
	.soupBox .soup li .txt{display:none;line-height:40px;font-size:14px;color:#6b3612;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:550px;}
	.soupBox .soup li.open .txt{display:block;}
	.soupBox .soup li.open i{color:#e67e22;}
	.soupBox .soup li i.icon-warn{right:80px;top:0;font-size:31px;margin-left:10px;}
	.soupBox .soup li i.icon-iconfontaixin{right:46px;top:0;}
	.soupBox .soup li i.icon-gonggao{right:10px;top:2px;}
	.soupBox span{display:block;background:#fff7e7;float:left;border-radius:10px;line-height:30px;cursor:pointer;font-size:20px;font-weight:600;color:#6b3612;margin-top:5px;padding:5px 8px;}
	.soupBox span .icon-add{font-size:24px;font-weight:600;color:#6b3612;margin-right:5px;}
 	/* 公告栏   end */
 	
 	/* boostrap top */
	.icon{font-size:16px;vertical-align: middle;}
	.ifs22{font-size:22px;vertical-align: middle;}
	.iconf{margin-right:8px;}
	.logo{font-size:22px;}
	.userInfo{height:50px;}
	.userInfo a{width:100%;height:100%;font-size:16px;font-weight:600;color:#7a8e9d;}
	.userInfo:hover a span{color:#3498db;}
	.userInfo:hover a i{color:#3498db;}
	/*列表*/
	.tabBox{padding-left:0;padding-right:30px;}
	.tabBox .tab{position:relative;top:30px;color:#7c7c7c;font-size:16px;font-weight:600;}
	.tabBox .tab .active a{background:url(${basePath}/resources/imgs/share/bg2.jpg);}
	.tabBox .row .panel{padding:0;}
	.tabBox .row .panel .panel-body{padding:0;}
	.tabBox .row .panel .pic{padding:0;height:120px;}
	.tabBox .row .panel .pic img{height:120px;}
	.tabBox .list:nth-child(4n+1){position:relative;}
	.tabBox .list:hover .shade{opacity:1;}
	.tabBox .list:hover .cover .img{transform:scale(1.1)}
	.tabBox .list .shade{box-shadow:0 0 12px rgba(0, 0, 0, 0.1);position:absolute;left:0;top:0;width:100%;height:100%;background:#fff;z-index:1;opacity:0;}
	.tabBox .list .cover{overflow:hidden;position:relative;z-index:2;margin-top:15px;}
	.tabBox .list .info{position:relative;z-index:2;border-bottom:1px solid #e2e8eb;padding:5px 0 20px 0;}
	.tabBox .list .info .msg{height: 21px;overflow: hidden;margin-top:5px;}
	.tabBox .list .info .msg span{margin-right:10px;}
	.tabBox .list .info .msg span i{margin-right:3px;color:#9aabb8;font-weight:600;}
	.tabBox .list .info .user{margin-top:7px;}
	.tabBox .list .info .user a{display:block;height:20px;line-height: 20px;color:#2c3e50;}
	.tabBox .list .info .title{font-weight:bold;color: #34495e;}
	.tabBox .list .info .msg span em {font-size:14px;color:#9aabb8;display:inline-block;line-height:21px;vertical-align: middle;}
	.tabBox .list .info .user a .headerPic{float:left;width:20px;height:20px;border-radius:50%;}
	.tabBox .list .info .user a .name{float:left;margin-left:10px;font-size:12px;}
	.tzPage{font-size:14px;margin-top:0px;float:right;margin-left: 0px;}
	.ellipsis{width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
	.row{margin:0;}
	.iconfont{margin-right:6px;color:#9aabb8;font-weight:600;font-size:18px;}
	.data{position:absolute;right:10px;top:5px;color: #bdbdbd;}
	h4 .tag{float: left;height: 25px;margin: 1px 5px 1px 0;
	padding: 0 10px;font-size: 12px;color: #fff;border-radius: 2px;line-height: 25px;}
	h4 a{text-decoration:none;}
	h4 .title{line-height:28px;display: block;max-width: 450px;font-size: 18px;color: #2c3e50;font-weight: normal;}
	.bg-blue {background-color: #3498db!important;color: #fff !important;}
	.ellipsis{overflow:hidden;white-space:nowrap;text-overflow:ellipsis;}
	.mt10{margin-top: 10px !important;}
	.container .panel .row p{max-height:44px;overflow: hidden;margin-top:10px;color: #7f8c8d;}
	.msg span{margin-right:10px;}
	.msg span em {font-size:14px;color:#9aabb8;}
	.tab-pane{margin-top: 60px;}
		
  </style>
  <link rel="stylesheet" type="text/css" href="${basePath}/resources/js/umeditor/themes/default/css/umeditor.css">
  <script type="text/javascript" src="${basePath}/resources/js/wnl/wnl.js"></script>
  <script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.js"></script>
 </head>
 
 <body data-count="${itemCount}">
    <!-- 顶部导航条 start -->
	<nav class="navbar navbar-inverse navbar-fixed-top nav-tabs" role="navigation">
		<div class="container-fluid container">
			
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" >
					<span class="sr-only">切换导航</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo" href="${basePath}/user/main.do">King</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation">
						<a href="javascript:void(0);">
							<span class="glyphicon glyphicon-bell icon"></span>
						</a>
					</li>
					<li class="userInfo">
						<a href="${basePath}/user/toLogin.do">
							<i class="iconfont icon-admin" style="font-size:25px;margin-right:0;"></i>
							<span>登录</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 顶部导航条 end -->
	
 <%@include file="/WEB-INF/pages/common/left.jsp"%>

 <div class="container">
		<!--start Carousel -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class=""></li>
				<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="2" class=""></li>
				<li data-target="#myCarousel" data-slide-to="3" class=""></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item">
					<img src="${basePath}/resources/imgs/banner/banner1.jpeg" alt="First slide" width="1200">
				</div>
				<div class="item active">
					<img src="${basePath}/resources/imgs/banner/banner2.jpeg" alt="Second slide" width="1200">
				</div>
				<div class="item">
					<img src="${basePath}/resources/imgs/banner/banner3.jpeg" alt="Third slide" width="1200">
				</div>
				<div class="item">
					<img src="${basePath}/resources/imgs/banner/banner4.png" alt="Third slide" width="1200">
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		<!-- end carousel -->
		
		 <!--个人信息 start-->
		 <div class="person container">
		 	<div class="user row">
				<!-- calebox -->
				<div class="calebox col-md-12">
					<div class="caleheader col-md-12">
						<span id="prev">&lt;</span>
						<span id="cale">
							<span id="y"></span>
							<span id="m"></span>
						</span>
						<span id="time"></span>
						<span id="next">&gt;</span>
					</div>
					<table class="caletab col-md-12">
						<thead id="theadweek"></thead>
						<tbody id="tbodybox"></tbody>
					</table>
				</div>
			</div>
		 </div>
		 <!--个人信息 end-->
		
		 <!-- 公告栏  start -->
		 <div class="soupBox">
			<ul class="soup">
			 	<li class="">
				 	<i class="iconfont icon-warn" title="更新"></i>
				 	<a class="txt" href="" target="_blank"> 更新：上传作品明细增添字体设计一栏！欢迎大家上传~ </a>
			 	</li>
			 	<li class="">
				 	<i class="iconfont icon-iconfontaixin" title="鸡汤"></i>
				 	<a class="txt" href="" target="_blank"> 鸡汤：将来的你一定会感谢现在努力拼命的自己~ </a>
			 	</li>
			 	<li class="open">
				 	<i class="iconfont icon-gonggao" title="公告"></i>
				 	<a class="txt" href="" target="_blank"> 公告：king将从0点至明早7点进行数据库优化，平台将无法访问，造成不便敬请谅解！ </a>
			 	</li>
		 	</ul> 
		</div>
		<!-- 公告栏  end -->

		<!-- list start-->
		<div class="container tabBox">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs tab" role="tablist">
				<li role="presentation" class="active" onclick="changeTab(this);" data-model="music" data-count="${itemCount}">
					<a href="#music" aria-controls="music" role="tab" data-toggle="tab">音乐</a>
				</li>
				<li role="presentation" onclick="changeTab(this);" data-model="content" data-count="${count}">
					<a href="#aritcle" aria-controls="aritcle" role="tab" data-toggle="tab">文章</a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 音乐栏 -->
				<div role="tabpanel" class="tab-pane fade in active" id="music">
					<!-- 音乐列表 -->
					<div class="row musicRow contList"></div>
				</div>
				<!-- 文章栏 -->
				<div role="tabpanel" class="tab-pane fade" id="aritcle">
					<!-- 文章列表 -->
					<div class="row aritcleRow contList"></div>
				</div>
			</div>
			<!-- 分页 -->
			<div class="col-md-8 cpage" style="margin-top:30px;"></div>
		</div>
		<!--list end-->
	</div>
	
 <%@include file="/WEB-INF/pages/common/footer.jsp"%>
 <script type="text/javascript">
   
	$(function(){
		$(".tmui-tips").tmTip();
		var itemCount = $("body").data("count");
		kingIndex.initPage(itemCount);
		kingIndex.loadData(0,12);
		/*初始化万年历 */
		initWnl();
	});
	 /*格式化时间*/
	function timeFormate(time){
		return time<10 ? "0" + time:time;
	};
	$(".soup li").click(function(){
		$(this).addClass("open").siblings().removeClass("open");
	});
	// 菜单切换
	function changeTab(obj){
		//$.tzConfirm({title:"友情提示",content:"您确定删除吗?"});
		var $obj = $(obj);
		var model = $obj.data("model");
		var itemCount = $obj.data("count");
		if(isNotEmpty(model)){
			if(window.localStorage){
				localStorage.setItem("model", model);
			}
		}
		kingIndex.initPage(itemCount);
		kingIndex.loadData(0,12,function(itemCount){
			kingIndex.initPage(itemCount);
		});
	};
	
	function loading2(target,mark){
		$.loading({target:$(target),mark:1}); 
	};
	var kingIndex = {
		timer :null,
		initPage:function(itemCount){
			$(".cpage").tzPage(itemCount, {
				num_edge_entries : 1, //边缘页数
				num_display_entries :4, //主体页数
				num_edge_entries:5,
				current_page:0,
				showGo:true,
				showSelect:false,
				items_per_page : 12, //每页显示X项
				prev_text : "前一页",
				next_text : "后一页",
				callback : function(pageNo,psize){//回调函数
					kingIndex.loadData(pageNo,psize);
				}
			});
		},
		loadData:function(pageNo,pageSize,callback){
			if(window.localStorage){
				var model = localStorage.getItem("model");
			}
			clearTimeout(this.timer);
			this.timer = setTimeout(function(){
				$.ajax({
					type:"post",
					beforeSend:function(){loading2($(".contList"),4);},
					url:basePath+"/"+model+"/template.do",
					data:{pageNo:pageNo*pageSize,pageSize:pageSize},
					success:function(data){
						var $data = $(data);
						$(".contList").html($data);
						$(".tmui-tips").tmTip();
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

