<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <style type="text/css">
	/* boostrap top */
	.icon{font-size:16px;vertical-align: middle;}
	.ifs22{font-size:22px;vertical-align: middle;}
	.iconf{margin-right:8px;}
	.logo{font-size:22px;}
	.userInfo{position:relative;width:50px;height:50px;margin-right:14px;}
	.userInfo a{width:100%;height:100%;}
	.userInfo img{width:30px;height:30px;position:absolute;left:0;top:10px;}
	.userInfo .caret{position:absolute;right:0;top:24px;}
	.userInfo ul li{padding:6px 0;text-align:center;}
	.userInfo ul li a{font-size:14px;color:#7a8e9d;}
	.userInfo ul li a i{color:#7a8e9d;font-weight:500;}
	.userInfo ul li:hover a{color:#3498db;font-weight:600;}
  </style>
  <body>
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
						<a href="javascript:void(0);">
							<span class="glyphicon glyphicon-bell icon"></span>
							<span class="badge">3</span>
						</a>
					</li>
					<li class="dropdown userInfo">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							<img src="${basePath}${sessionScope.userHeaderPic}" class="img-responsive img-circle" 
							alt="Responsive image" width="30" height="30">
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#"><i class="iconfont icon-pic iconf"></i>我的作品</a>
							</li>
							<li>
								<a href="#"><i class="iconfont icon-star iconf"></i>我的收藏</a>
							</li>
							<li>
								<a href="#"><i class="iconfont icon-iconfontres iconf"></i>我的简历</a>
							</li>
							<li>
								<a href="${basePath}/user/toPerson.do"><i class="iconfont icon-info iconf"></i>修改资料</a>
							</li>
							<li>
								<a href="${basePath}/user/loginout.do"><i class="iconfont icon-guanbianniu iconf"></i>退出登录</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 顶部导航条 end -->
  </body>

