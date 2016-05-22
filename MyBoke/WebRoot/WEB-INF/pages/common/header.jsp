<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <style type="text/css">
	/* boostrap top */
	.icon{font-size:16px;vertical-align: middle;}
	.ifs22{font-size:22px;vertical-align: middle;}
	.iconf{margin-right:8px;}
	.logo{font-size:22px;}
	.userInfo{height:50px;width:60px;margin-right:12px;padding:5px;}
	.hPic{width:30px;height:30px;position:absolute;left:0;top:5px;}
	.sjx{position:absolute;right:0;top:18px;}
	.userInfo ul li{padding:5px 0;}
	.userInfo ul li a{font-size:14px;color: #7a8e9d;}
	.userInfo ul li a i{color: #7a8e9d;font-weight:600;}
	.userInfo ul li:hover a{color:#3498db;font-weight:600;}
	
	/* top start */
	/* .top{width:100%;height:50px;margin-bottom:30px;background:#24292C;}
	.top .nav{width:1000px;height:100%;margin:0 auto;position:relative;}
	.top .nav .logo{font-size:40px;font-weight:600;margin-top:8px;display:inline-block;float:left;color:#fff;font-family:"方正舒体"}
	.top .nav .topnav_list{height:100%;float:left;margin-left:60px;}
	.top .nav .topnav_list li{float:left;padding:16px 15px;transition:1s;position:relative;}
	.top .nav .topnav_list li .sjx{position:absolute;bottom:0;left:calc(50% - 10px);font-size:20px;color:#EDEDEF;display:none;}
	.top .nav .topnav_list li.on a{color:#0066ff;}
	.top .nav .topnav_list li.on .sjx{display:block;}
	.top .nav .topnav_list li:hover a{color:#0066ff;transition:1s;}
	.top .nav .topnav_list li a{color:#fff;font-size:16px;}
	.top .nav .nav_userinfo{height:50px;float:right;display:inline-block;}
	.top .nav .nav_userinfo .personal{height:50px;float:right;}
	.top .nav .nav_userinfo .personal .p{position:absolute;top:-16px;right:60px;color:#EDEDEF;}
	.top .nav .nav_userinfo .personal .person-menu{position:relative;text-align:center;width:135px;background:#fff;z-index:2;position:absolute;top:50px;right:0;box-shadow:0px 1px 2px rgba(0,0,0,.1);}
	.top .nav .nav_userinfo .personal .person-menu li{float:left;width:100%;}
	.top .nav .nav_userinfo .personal .person-menu li:hover{background:#EDEDEF;}
	.top .nav .nav_userinfo .personal .person-menu li:hover a{color:#2E93D4;}
	.top .nav .nav_userinfo .personal .person-menu li a{display:block;height:40px;font-size:14px;color:#647587;line-height:40px;}
	.top .nav .nav_userinfo .personal .person-menu li a i{margin-right:5px;font-size:18px;color:#666;}
	.top .nav .login{float:right;cursor:pointer;color:#fff;display:none;line-height:50px;}
	.top .nav .login.on{display:block;}
	.top .nav .login.on:hover{color:#0066ff;transition:1s;}
	.top .nav .login.on:hover .iconfont{color:#0066ff;transition:1s;}
	.top .nav .login.on .iconfont{font-size:20px;color:#fff;}
	.top .nav .information{margin-right:16px;display:inline-block;line-height:50px;}
	.top .nav .information .icon-xiaoxi{font-size:20px;color:#fff;transition:1s;cursor:pointer;}
	.top .nav .information:hover .icon-xiaoxi{color:#0066ff;transition:1s;}
	.top .nav .header_pic img{margin-right:10px;margin-top: -20px;cursor:pointer;width:40px;height:40px;border-radius:50%;}
	.top .nav .username{display:inline-block;margin-top:15px;margin-right:10px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:60px;}
	.top .nav .username .name{color:#fff;font-size:14px;transition:1s;}
	.top .nav .username .name:hover{color:#0066ff;transition:1s;} */
	/* top end */
  </style>
  <body>
     <%-- <!--top start-->
	 <div class="top">
	 	<div class="nav">
	 		<a href="javascript:void(0);" class="logo">king</a>
	 		<ul class="topnav_list">
	 			<li class="on">
					<a href="javascript:void(0);">HOME</a>
					<i class="iconfont icon-triangle-copy sjx"></i>
				</li>
				<li>
					<a href="javascript:void(0);">MUSIC</a>
					<i class="iconfont icon-triangle-copy sjx"></i>
				</li>
	 		</ul>
	 		
	 		<div class="nav_userinfo">
	 			<span class="information"><i class="iconfont icon-xiaoxi"></i></span>
		 		<div class="personal">
			 		<span class="header_pic">
			 			<img src="${basePath}${sessionScope.userHeaderPic}" alt="头像" onclick="window.open('${basePath}/user/toPerson.do')">
			 		</span>
			 		<span class="username">
			 			<a href="javascript:void(0)" onclick="window.open('${basePath}/user/toPerson.do')" class="name"><%=request.getSession().getAttribute("userName")%></a>
					</span>
					<span class="login"><i class="iconfont icon-admin"></i>LoginIn</span>
					<span class="login on" onclick="window.location.replace('${basePath}/user/loginout.do')"><i class="iconfont icon-loginout"></i>Exit</span>
					
					<ul class="person-menu" style="display:none;">
						<i class="iconfont icon-triangle-copy sjx p"></i>
						<li><a href="javascript:void(0);"><i class="iconfont icon-pic"></i>我的文章</a></li>
						<li><a href="javascript:void(0);"><i class="iconfont icon-fonticonstar" style="font-size:22px;"></i>我的收藏</a></li>
						<li><a href="javascript:void(0);"><i class="iconfont icon-iconfontres"></i>我的简历</a></li>
						<li><a href="${basePath}/user/toPerson.do"><i class="iconfont icon-info"></i>修改资料</a></li>
						<li><a href="${basePath}/user/loginout.do"><i class="iconfont icon-loginout"  style="font-size:22px;"></i>退出登录</a></li>
					</ul>
				</div>
			</div>
	 	</div>
	 </div>
	 <!--top end-->
	 <script>
		 $(".top .nav .nav_userinfo .personal").hover(function(){
				$(".top .nav .nav_userinfo .person-menu").fadeIn();
			},function(){
				$(".top .nav .nav_userinfo .person-menu").fadeOut();
		 });
	 </script> --%>
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
				<a class="navbar-brand logo" href="${basePath}/index.do">King</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
				</ul>
			
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation">
						<a href="#">
							<span class="glyphicon glyphicon-bell icon"></span>
							<span class="badge">3</span>
						</a>
					</li>
					<li class="dropdown userInfo">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							<img src="${basePath}${sessionScope.userHeaderPic}" class="img-responsive img-circle hPic" 
							alt="Responsive image" width="30" height="30">
							<span class="caret sjx"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#"><i class="iconfont icon-pic iconf"></i>我的文章</a>
							</li>
							<li>
								<a href="#"><i class="iconfont icon-fonticonstar ifs22 iconf"></i>我的收藏</a>
							</li>
							<li>
								<a href="#"><i class="iconfont icon-iconfontres iconf"></i>我的简历</a>
							</li>
							<li>
								<a href="${basePath}/user/toPerson.do"><i class="iconfont icon-info iconf"></i>修改资料</a>
							</li>
							<li>
								<a href="${basePath}/user/loginout.do"><i class="iconfont icon-loginout ifs22 iconf"></i>退出登录</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 顶部导航条 end -->
  </body>

