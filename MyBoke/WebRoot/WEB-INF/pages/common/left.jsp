<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
	/* left nav  start*/
	.left-nav,.project-nav,.tool-nav{position:fixed;top:0;left:-240px;background:#2b2d2e;width:240px;height:100%;padding-top:75px;z-index:3;}
	.nav_title{color:rgb(255,255,255);margin-bottom:20px;padding:0 30px;}
	.parents{width:100%;height:100%;}
	.parents .p_title{border-bottom:1px solid #333;height:24px;line-height:24px;padding:5px 30px;}
	.parents .p_title:hover a{color:rgb(255,255,255);}
	.parents .p_title:hover i{color:rgb(255,255,255);}
	.parents .p_title i{margin-right:5px;}
	.parents .p_title a,i{color:rgb(182,179,173);font-size:18px;}
	.parents .p_title .children{width:155px;}
	.parents .p_title .children .c_title{line-height:24px;background:#ccc;font-size:14px;border-bottom:1px solid #fff;padding:0 20px;display:none;}
	.parents .p_title .children .c_title:hover{color:#0000cc;background:#ccff66;}
	.overlay{position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.4);z-index:2;display:none;}
	.button{width:50px;height:50px;padding:17px;border-radius:50%;cursor:pointer;position:fixed;left:10px;z-index:100;-webkit-transform:translateX(0);-ms-transform:translateX(0);transform:translateX(0);-webkit-transition:-webkit-transform .5s;transition:transform .5s;}
	.push_button{top:75px;background-color:#2e2e2e;}
	.tool_button{top:135px;background-color:#2DD888;}
	.project_button{top:195px;background-color:#2DD888;}
	.tool_button .icon-tool{font-size:24px;color:#fff;line-height:10px;margin-left:-4px;}
	.project_button .icon-project{font-size:26px;color:#fff;line-height:12px;margin-left:-5px;}
	.push_button .navi-one{margin-top:6px;-webkit-transform:translate(0,-200%);-ms-transform:translate(0,-200%);transform:translate(0,-200%);-webkit-transition:-webkit-transform .3s .3s;transition:transform .3s .3s;}
	.push_button li{width:100%;height:2px;background:#FFF;margin:0 auto;border-radius:2px;}
	.navi-two{transition:opacity .2s .3s,width .2s .3s;-webkit-transition:opacity .2s .3s,width .2s .3s;-moz-transition:opacity .2s .3s,width .2s .3s;-ms-transition:opacity .2s .3s,width .2s .3s;}
	.navi-three{transition:transform .3s .3s;-webkit-transition:-webkit-transform .3s .3s;-ms-transition:transform .3s .3s;-moz-transition:transform .3s .3s;transform:translate(0,200%);-moz-transform:translate(0,200%);-webkit-transform:translate(0,200%);-ms-transform:translate(0,200%);}
	.button.active{-webkit-transform:translateX(240px);-ms-transform:translateX(240px);transform:translateX(240px);}
	.navi-one.active{transform:translateY(2px) rotate(45deg);-moz-transform:translateY(2px) rotate(45deg);-webkit-transform:translateY(2px) rotate(45deg);-ms-transform:translateY(2px) rotate(45deg);}
	.navi-two.active{width:0;opacity:0;}
	.navi-three.active{transform:translateY(-2px) rotate(-45deg);-moz-transform:translateY(-2px) rotate(-45deg);-webkit-transform:translateY(-2px) rotate(-45deg);-ms-transform:translateY(-2px) rotate(-45deg);}
	/* left nav end */
</style>

<body>
	<!-- left-nav start -->
	<div class="left-nav">
		<h2 class="nav_title">成长路线</h2>
		<ul class="parents">
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">HTML</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);">HTML5</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">CSS</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);">CSS3</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">JavaScript</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);">数据类型</a></li>
					<li class="c_title"><a href="javascript:void(0);">面向对象</a></li>
					<li class="c_title"><a href="javascript:void(0);">设计模式</a></li>
					<li class="c_title"><a href="javascript:void(0);">动画</a></li>
					<li class="c_title"><a href="javascript:void(0);">bom</a></li>
					<li class="c_title"><a href="javascript:void(0);">dom</a></li>
					<li class="c_title"><a href="javascript:void(0);">ajax</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">Jquery</a>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i>
				<a href="javascript:void(0);">Boostrap</a>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">Angular</a>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">Node</a>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">DBAS</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);">Mysql</a></li>
					<li class="c_title"><a href="javascript:void(0);">Oracle</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">JAVASE</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);">数据类型</a></li>
					<li class="c_title"><a href="javascript:void(0);">面向对象</a></li>
					<li class="c_title"><a href="javascript:void(0);">设计模式</a></li>
					<li class="c_title"><a href="javascript:void(0);">异常处理</a></li>
					<li class="c_title"><a href="javascript:void(0);">IO文件流</a></li>
					<li class="c_title"><a href="javascript:void(0);">网络编程</a></li>
					<li class="c_title"><a href="javascript:void(0);">多线程</a></li>
					<li class="c_title"><a href="javascript:void(0);">泛型</a></li>
					<li class="c_title"><a href="javascript:void(0);">集合</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i>
				<a href="javascript:void(0);">JAVAWEB</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);">Servlet</a></li>
					<li class="c_title"><a href="javascript:void(0);">Jsp</a></li>
					<li class="c_title"><a href="javascript:void(0);">Jstl</a></li>
					<li class="c_title"><a href="javascript:void(0);">自定义标签</a></li>
				</ul>
			</li>
			
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">JAVAEE</a>
				<ul class="children">
					<li class="c_title"><a href="javascript:void(0);">SpringMvc</a></li>
					<li class="c_title"><a href="javascript:void(0);">Struct2</a></li>
					<li class="c_title"><a href="javascript:void(0);">Spring</a></li>
					<li class="c_title"><a href="javascript:void(0);">Mybaties</a></li>
					<li class="c_title"><a href="javascript:void(0);">Hibernate</a></li>
					<li class="c_title"><a href="javascript:void(0);">WebService</a></li>
					<li class="c_title"><a href="javascript:void(0);">自定义框架</a></li>
					<li class="c_title"><a href="javascript:void(0);">Maven</a></li>
					<li class="c_title"><a href="javascript:void(0);">SVN</a></li>
					<li class="c_title"><a href="javascript:void(0);">GIT</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<div class="tool-nav">
		<h2 class="nav_title">工具箱</h2>
		<ul class="parents">
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="${basePath}/resources/html/tools/cssFormat.html" target="_blank">css格式化工具</a>
			</li>
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="${basePath}/resources/html/tools/htmlFormat.html" target="_blank">html格式化工具</a>
			</li>
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="${basePath}/resources/html/tools/yhFormat.html" target="_blank">单双引号转换工具</a>
			</li>
		</ul>
	</div>

	<div class="project-nav">
		<h2 class="nav_title">项目锦集</h2>
		<ul class="parents">
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="${basePath}/resources/html/projects/picScale.html" target="_blank">图片放大镜</a>
			</li>
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="${basePath}/resources/html/projects/wnl.html" target="_blank">万年历</a>
			</li>
			<li class="p_title">
				<i class="iconfont icon-add"></i> 
				<a href="javascript:void(0);">弹窗</a>
			</li>
		</ul>
	</div>

	<!-- button start -->
	<ul class="push_button button">
		<li class="navi-one"></li>
		<li class="navi-two"></li>
		<li class="navi-three"></li>
	</ul>

	<div class="tool_button button">
		<a class="tool-btn" href="javascript:void(0);"> 
			<i class="iconfont icon-tool"></i> 
			<span class="tool-btn-num"></span>
		</a>
	</div>

	<div class="project_button button">
		<a class="project-btn" href="javascript:void(0);">
			<i class="iconfont icon-project"></i>
			<span class="project-btn-num"></span>
		</a>
	</div>
	<!-- button end -->

	<!-- overlay -->
	<div class="overlay"></div>

	<!-- left-nav end -->

	<script>
		var leftNav = 0;
		var toolNav = 0;
		var projectNav = 0;

		$(".button").on("click", function() {

			$(this).toggleClass("active");
			$(this).siblings().toggleClass("active");
			$(this).css("z-index", 100);
			$(this).siblings().css("z-index", 2);
			$(".left-nav").css("z-index", 3);
			$(".tool-nav").css("z-index", 3);
			$(".project-nav").css("z-index", 3);
			$(".overlay").toggle();

			var bodyLeft = parseInt($("body").css("margin-left"));
			if (bodyLeft == 0) {
				$("body").animate({"margin-left" : "240px"}, 300);
			} else {
				$("body").animate({"margin-left" : 0}, 300);
			}

			if ($(this).attr("class")[1] == "u") {
				$(this).children().toggleClass("active");

				leftNav = parseInt($(".left-nav").css("left"));
				if (leftNav == 0) {
					$(".left-nav").animate({"left" : "-240px"}, 300);
				} else {
					$(".left-nav").animate({"left" : 0}, 300);
				}

			} else if ($(this).attr("class")[1] == "o") {

				toolNav = parseInt($(".tool-nav").css("left"));
				if (toolNav == 0) {
					$(".tool-nav").animate({"left" : "-240px"}, 300);
				} else {
					$(".tool-nav").animate({"left" : 0}, 300);
				}

			} else if ($(this).attr("class")[1] == "r") {

				projectNav = parseInt($(".project-nav").css("left"));
				if (projectNav == 0) {
					$(".project-nav").animate({"left" : "-240px"}, 300);
				} else {
					$(".project-nav").animate({"left" : 0}, 300);
				}
			}
		});

		$(".overlay").click(function() {
			if (leftNav != 0) {
				$(".push_button").trigger("click");
			} else if (toolNav != 0) {
				$(".tool_button").trigger("click");
			} else if (projectNav != 0) {
				$(".project_button").trigger("click");
			}
		});

		/* 左边导航列表 */
		$(".p_title").click(function() {
			$(this).find("i").toggleClass("icon-jian icon-add");
			$(this).find(".c_title").slideToggle();
			$(this).siblings().find(".c_title").slideUp().end().find("i").removeClass("icon-jian").addClass("icon-add");
			$(".overlay").trigger("click");
		});
	</script>
</body>

