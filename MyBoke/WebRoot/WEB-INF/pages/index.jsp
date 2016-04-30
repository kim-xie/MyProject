<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!doctype html>
<html>
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>king的博客</title>
  <%@include file="/WEB-INF/pages/common/common.jsp"%>
  <style type="text/css">
	*{padding:0;margin:0;}
	a{text-decoration:none;}
	ul,ol li{list-style:none;}
	body{font-size:12px;font-family:"微软雅黑";background:#EDEDEF;}
	/* top start */
	.top{width:100%;height:82px;margin-bottom:30px;background:#24292C;}
	.top .nav{width:1000px;height:100%;margin:0 auto;}
	.top .nav .logo{font-size:60px;font-weight:600;
	display:inline-block;float:left;color:#fff;font-family:"方正舒体"}
	.top .nav ul{height:100%;float:left;margin-left:60px;}
	.top .nav ul li{float:left;padding:32px 10px;
	transition:1s;position:relative;}
	.top .nav ul li .sjx{position:absolute;bottom:0;
	left:calc(50% - 10px);font-size:20px;color:#EDEDEF;display:none;}
	.top .nav ul li.on a{color:#0066ff;}
	.top .nav ul li.on .sjx{display:block;}
	.top .nav ul li:hover a{color:#0066ff;transition:1s;}
	.top .nav ul li a{color:#fff;font-size:18px;}
	.top .nav .login{float:right;padding:18px 0;cursor:pointer;color:#fff;
	display:none;}
	.top .nav .login.on{display:block;}
	.top .nav .login.on:hover{color:#0066ff;}
	.top .nav .login.on:hover .iconfont{color:#0066ff;}
	.top .nav .login.on .iconfont{font-size:40px;color:#fff;}
	/* top end */

	/*个人信息 start*/
	.person{width:100%;height:170px;margin-bottom:30px;}
	.person .user{width:1000px;height:100%;margin:0 auto;background:#fff;overflow:hidden;}
	.person .user .u_info{margin:20px;height:80px;}
	.person .user .u_info img{width:80px;height:80px;border-radius:50%;
	margin-right:20px;vertical-align:middle;}
	.person .user .u_info .name{color: #4c4c4c;font-size:26px;transition:1s;}
	.person .user .u_info .name:hover{color: #828d95;transition:1s;}
	/*个人信息 end*/

	/*banner start*/
	#banner{width:1005px;height:300px;
	overflow:hidden;margin:30px auto;}
	#banner ul{width:1000%;}
	#banner ul li{width:200px;height:300px;border-left:1px solid #fff;
	position:relative;transition:1.6s ease;float:left;}
	#banner ul li img{height:300px;width:800px;}
	#banner ul li h2{position:absolute;left:0;bottom:0px;width:100%;height:100%;
	cursor:pointer;background:rgba(0,0,0,0.5);font-size:16px;text-align:center;
	line-height:300px;transition:1.6s ease;color:#fff;}
	#banner ul li .over{position:absolute;left:0;bottom:0px;width:100%;height:100%;}
	#banner ul:hover li{width:50px;}
	#banner ul:hover .over{transition:1.6s ease;background:rgba(0,0,0,0.3);}
	#banner ul li:hover{width:800px;transition:1.6s ease;}
	#banner ul li:hover h2{transition:1.6s;height:40px;color:#fff;line-height:40px;}
	#banner ul li:hover .over{z-index:-1;}
	/*banner end*/

	/*文本编辑器 start*/
	.editerBox{width:100%;margin:30px 0;}
	.editerBox .editer{width:1000px;height:100%;margin:0 auto;background:#fff;
	overflow:hidden;}
	.editerBox .editer .title{width:600px;height:30px;
	margin:10px auto;display:block;font-size:18px;font-weight:600;}
	.editerBox .editer .title input{width:500px;height:30px;font-size:16px;font-weight:600;
	text-indent:0.5em;}
	.editerBox .editer .edui-container{width:800px;margin:10px auto;overflow:hidden;height:400px;}
	.editerBox .editer p{width:800px;font-size:14px;font-weight:600;margin:20px auto;}
	.input{width:400px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
	.editerBox .editer p .fabiao{float:right;height:30px;line-height:30px;margin-right: .1%;}
	.editerBox .editer p .fabiao .tip{padding-right:10px;font-size:14px;font-weight:600;color:#999;}
	.editerBox .editer p .fabiao .submit{padding:9px;outline:none;border:none;background:#0033ff;
	transition:1s;border-radius:5px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
	.editerBox .editer p .fabiao .submit:hover{background:#0033cc;transition:1s;}
	/*文本编辑器 end*/

	/*--main start--*/
	.box{width:1000px;overflow:hidden;margin:0 auto;padding-bottom:25px;background:#fff;}
	.box .contents{margin:40px;}
	.box .contents:after{content:"";clear:both;display:block;}
	.box .contents .side{width:84px;float:left;}
	.box .contents .side .day a{width:70px;height:70px;display:block;
	border-radius:50%;border:5px solid #828d95;color:#828d95;font-size:40px;
	text-align:center;line-height:70px;margin-bottom:6px;}
	.box .contents .side .day a:hover{color: #330066;border:5px solid #330066;}
	.box .contents .side .month a:hover{color: #330066;}
	.box .contents .side .month a{font-weight:600;display:block;color:#c0c0c0;
	font-size:24px;text-align:center;}
	.box .contents .main{width:770px;border-bottom:4px dashed #ccffcc;float:right;}
	.box .contents .main .conts{width:100%;margin-bottom:20px;}
	.box .contents .main .conts h2{padding:10px 0;width:100%;}
	.box .contents .main .conts h2 a{width:100%;color:#737373;font-size:26px;}
	.box .contents .main .conts p{margin-bottom:15px;line-height:26px;
	width:100%;font-size:16px;word-break: break-word;}
	.box .contents .main .link{width:100%;}
	.box .contents .main .link a{margin-right:15px;font-size:16px;color:#737373;}
	.box .contents .main .link a:hover{color:#000033;}
	.box .contents .main .link a i{font-size:20px;margin-right:5px;}
	.box .contents .main .coment{width:100%;margin:15px 0;}
	.box .contents .main .coment .c_info{position:relative;margin-bottom:10px;}
	.box .contents .main .coment .c_info .header_pic{width:40px;height:40px;
	display:inline-block;}
	.box .contents .main .coment .c_info img{width:40px;height:40px;border-radius:50%;
	vertical-align:middle;}
	.box .contents .main .coment .c_info .name{font-size:16px;color:#4c4c4c;}
	.box .contents .main .coment .c_info .con{font-size:14px;color:#4c4c4c;}
	.box .contents .main .coment .c_info .time{left:50px;top:24px;position:absolute;}
	.box .contents .main .pl{width:100%;height:40px;border:1px solid gray;margin-bottom:50px;display: inline-block;position:relative;}
	.box .contents .main .pl .fb{width:100px;height:100%;background:#009900;
	float:right;line-height:40px;text-align:center;cursor:pointer;font-size:16px;
	font-weight:600;color:#fff;transition:1s;}
	.box .contents .main .pl .fb:hover{background:#00cc00;transition:1s;}
	.box .contents .main .pl .pl_txt{width:640px;height:100%;border:none;
	text-indent:1em;font-size:16px;font-weight:600;outline:none;position:absolute;
	left:0;top:0;}
	.box .contents .main .pl .clear{width:30px;
	display: inline-block;height:100%;text-align:center;line-height:40px;
	position:absolute;right:100px;top:0;}
	.box .contents .main .pl .icon-clear{font-size:25px;
	cursor:pointer;transition:1s;color:#999;}
	.box .contents .main .pl .icon-clear:hover{transform:rotate(360deg);
	transition:1s;color:#cc0000;}
	/*--main end--*/

	/*gotop start*/
	.gotop{display:none;position:fixed;right:50px;bottom:100px;cursor:pointer;z-index:100;}
	.gotop .icon-top{font-size:50px;color:#999;transition:1s;}
	.gotop:hover .icon-top{color:#990000;transition:1s;}
	/*gotop end*/

	/*footer start*/
	.footer{width:100%;height:50px;padding:20px 0;}
	.footer .copyright{width:1000px;height:50px;margin:0 auto;text-align:center;
	line-height:50px;color:#999;font-size:16px;}
	.footer .copyright a{color:#999;font-size:16px;}
	/*footer end*/

  </style>
  <link rel="stylesheet" type="text/css" href="${basePath}/resources/js/themes/default/css/umeditor.css">
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor.js" ></script>
 </head>
 <body>
 <!--top start-->
 <div class="top">
 	<div class="nav">
 		<a href="#" class="logo kb">king</a>
 		<ul>
 			<li class="on">
				<a href="#">HOME</a>
				<i class="iconfont icon-triangle-copy sjx"></i>
			</li>
			<li>
				<a href="#">H5+CS3</a>
				<i class="iconfont icon-triangle-copy sjx"></i>
			</li>
 			<li>
				<a href="#">JS+JQ</a>
				<i class="iconfont icon-triangle-copy sjx"></i>
			</li>
 			<li>
				<a href="#">BOOSTRAP</a>
				<i class="iconfont icon-triangle-copy sjx"></i>
			</li>
			<li>
				<a href="#">ANGULAR</a>
				<i class="iconfont icon-triangle-copy sjx"></i>
			</li>
 			<li>
				<a href="#">DBAS</a>
				<i class="iconfont icon-triangle-copy sjx"></i>
			</li>
 			<li>
				<a href="#">JAVASE</a>
				<i class="iconfont icon-triangle-copy sjx"></i>
			</li>
			<li>
				<a href="#">JAVAEE</a>
				<i class="iconfont icon-triangle-copy sjx"></i>
			</li>
 		</ul>
 		<span class="login "><i class="iconfont icon-admin"></i>LoginIn</span>
		<span class="login on" onclick="LoginOut(this)"><i class="iconfont icon-loginout"></i>LoginOut</span>
 	</div>
 </div>
 <!--top end-->
 
 <!--个人信息 start-->
 <div class="person">
 	<div class="user">
		<p class="u_info">
			<a href="javascript:void(0)">
				<img src="${basePath}/resources/imgs/header_pic.jpg" alt="头像">
			</a>
			<a href="javascript:void(0)" class="name">手写的从前</a>
		</p>
	</div>
 </div>
 <!--个人信息 end-->

 <!--banner start-->
 <div id="banner">
	<ul id="list">
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/01.jpg"/>
			</a>
			<h2>付出不亚于任何人的努力</h2>
			<div class="over"></div>
		</li>
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/02.jpg" />
			</a>
			<h2>每个牛逼的瞬间都是要经过菜鸟的过程</h2>
			<div class="over"></div>
		</li>
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/03.jpg" />
			</a>
			<h2>人之所以能是相信自己能</h2>
			<div class="over"></div>
		</li>
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/04.jpg" />
			</a>
			<h2>如果奇迹没有出现那么就去创造一个</h2>
			<div class="over"></div>
		</li>
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/05.jpg" />
			</a>
			<h2>要想飞得高就该把地平线忘掉</h2>
			<div class="over"></div>
		</li>
	</ul>
 </div>
 <!--banner end-->
 
 <!--文本编辑器 start-->
 <div class="editerBox">
 	<div class="editer">
 		<span class="title">
 			标题:
 			<input type="text" placeholder="请输入标题不得超过50个字" maxlength="50" class="txt_title">
 		</span>
		<div class="edui-container" id="myEditor" maxlength="200"></div>
 		<p>
			标签：
			<input type="text" class="input" placeholder="请输入标签" maxlength="40">	
			<span class="fabiao">
				<span class="tip">还可以输入<label id="count">200</label>字</span>
				<input type="button" class="submit" value="发表文章">
			</span>
 		</p>
 	</div>
 </div>
 <!--文本编辑器 end-->

 <!--main start-->
 <div class="box">
 	
	<div class="contents">
		
		<div class="side">
			<div class="day"><a href="javascript:void(0)">05</a></div>
			<div class="month"><a href="javascript:void(0)">04</a></div>
		</div>
		
		<div class="main">
			
			<div class="conts">
				<div class="text">
					<h2>
						<a href="javascript:void(0)">KING，从简约中领悟品质的真谛</a>
					</h2>
					<p>有没有那么一件单品、一张照片、一副美景或一杯暖饮，让你流连忘返、回味无穷？KING的视觉设计，希望悄悄的留住你的视线，带给你唯一却熟悉的感觉…
					</p>
					<p><img src="http://imglf6.ph.126.net/r6Oa30BUiJaANM2QgiuAWQ==/6597833927237755956.jpg"><br>
					</p>
				</div>
			</div>
			
			<div class="link">
				<a href="javascript:void(0)">
					<i class="iconfont icon-hot"></i>
					热度(<span class="hot">990</span>)
				</a>
				<a href="javascript:void(0)">
					<i class="iconfont icon-link"></i>
					全文链接
				</a>
				<a href="javascript:void(0)">
					<i class="iconfont icon-eye"></i>
					浏览(<span class="look">490</span>)
				</a>
				<a href="javascript:void(0)">
					<i class="iconfont icon-zan"></i>
					赞(<span class="zan">666</span>)
				</a>
				<a href="javascript:void(0)">
					<i class="iconfont icon-pinglun"></i>
					评论(<span class="pilun">20</span>)
				</a>
			</div>
			
			<div class="coment">
				
				<!-- <p class="c_info">
					<a href="javascript:void(0)" class="header_pic">
						<img src="imgs/header_pic.jpg" alt="头像">
					</a>
					<a href="javascript:void(0)" class="name">手写的从前 <b>:</b> </a>
					<span class="con">好样的！看好你哦！棒棒哒！</span>
					
					<span class="time">
						<span class="hours">15</span>
						<b>:</b>
						<span class="mins">51</span>
					</span>	
				</p> -->

			</div>
			<p class="pl">
				<input type="text" placeholder="我也说一句" class="pl_txt">
				<span class="clear"><i class="iconfont icon-clear"></i></span>
				<span class="fb">发表评论</span>
			</p>
		</div>
	</div>	
 </div>
 <!--main end-->
 <!--gotop start-->
 <span class="gotop"><i class="iconfont icon-top"></i></span>
  <!--gotop end-->
 
 <!--footer start-->
 <div class="footer">
	 <div class="copyright">
		<span title="Copyright" style="cursor:pointer;">Copyright ©</span>&nbsp;
		<a href="javascript:void(0)">2016</a> All rights by king | 手写的从前
		<a href="javascript:void(0)">&nbsp;|&nbsp;联系邮箱:1134771121@qq.com</a>
	</div>
 </div>
 <!--footer end-->

 <script type="text/javascript">
	/*格式化时间*/
	function timeFormate(time){
		return time<10 ? "0" + time:time;
	};
	//实例化编辑器
	var um = UM.getEditor("myEditor");
	
	//注销
	function LoginOut(obj){
		$.post(basePath+"/user/loginout.do",function(data){
			if(data=="success"){
				window.location.href = basePath+"/user/toLogin.do";
			}
		});
	};
	
	$(function(){
		/*top*/
		$(".nav").find("ul li").click(function(){
			$(this).addClass("on").siblings().removeClass("on");
		}); 

		/*gotop start*/
		$(".gotop").click(function(){
			$(document.body).stop(true,true).animate({"scrollTop":0},1000,
			function(){$(".gotop").stop(true,true).fadeOut(1000);});
		});
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			if(scrollTop >= 200){
				$(".gotop").stop(true,true).fadeIn(1000);
			}else{
				$(".gotop").stop(true,true).fadeOut(1000);
			}
		});
		/*gotop end*/

	});
	/*文本编辑器 start*/
	$("#myEditor").keyup(function(){
		var maxlength = $("#myEditor").attr("maxlength");
		var textlength = getEditoHtml("myEditor").length;
		if(textlength <= maxlength){
			$(".editerBox .editer p .fabiao .tip #count").text(maxlength-textlength);
		}
	}).keydown(function(){
		var maxlength = $("#myEditor").attr("maxlength");
		var textlength = getEditoHtml("myEditor").length;
		if(textlength <= maxlength){
			$(".editerBox .editer p .fabiao .tip #count").text(maxlength-textlength);
		}
	});
	
	//获取富文本编辑器的带有格式的内容
	function getEditoHtml(myEditor){
		return UM.getEditor(myEditor).getContentTxt();
	}
	
	//获取富文本编辑器的纯文本内容
	function getEditText(myEditor){
		return UM.getEditor(myEditor).getContentTxt();
	}
	//给某个富文本框赋值
	function setEditorText(message,myEditor){
		 UM.getEditor(myEditor).setContent(message, false);//清空富文本编辑器
	}
	
	/*发表文章*/
	$(".editerBox .editer p .fabiao .submit").click(function(){
		var titleVal = $(".editer .txt_title").val();
		var contentVal = getEditoHtml("myEditor");
		var tagval = $(".editer p .input").val();
		var params = {title:titleVal,content:contentVal,tag:tagval};
		//alert(JSON.stringify(params));
		$.ajax({
			type:"post",
			url:basePath+"/content/save.do",
			data:params,
			success:function(data){
				//alert(data);
				var data = data.trim();
				if(data == "fail" || data=="error"){
					alert("发表失败");
				}
				if(data == "success"){
					var month = new Date().getMonth()+1;
					var day = new Date().getDate();
					$(".box").prepend("<div class='contents animated bounceInUp'>"+
						"		<div class='side'>"+
						"			<div class='day'><a href='javascript:void(0)'>"+timeFormate(day)+"</a></div>"+
						"			<div class='month'><a href='javascript:void(0)'>"+timeFormate(month)+"</a></div>"+
						"		</div>"+
						"	<div class='main'>"+
						"		<div class='conts'>"+
						"			<div class='text'>"+
						"				<h2>"+
						"					<a href='javascript:void(0)'>"+titleVal+"</a>"+
						"				</h2>"+
						"				<p>"+contentVal+"</p>"+
						"				<p><img src='${basepath}/resources/imgs/1.jpg'><br>"+
						"				</p>"+
						"			</div>"+
						"		</div>"+
								
						"		<div class='link'>"+
						"			<a href='javascript:void(0)'>"+
						"				<i class='iconfont icon-hot'></i>"+
						"				热度(<span class='hot'>0</span>)"+
						"			</a>"+
						"			<a href='javascript:void(0)'>"+
						"				<i class='iconfont icon-link'></i>"+
						"				全文链接"+
						"			</a>"+
						"			<a href='javascript:void(0)'>"+
						"				<i class='iconfont icon-eye'></i>"+
						"				浏览(<span class='look'>0</span>)"+
						"			</a>"+
						"			<a href='javascript:void(0)' onclick='zan(this)'>"+
						"				<i class='iconfont icon-zan'></i>"+
						"				赞(<span class='zan'>0</span>)"+
						"			</a>"+
						"			<a href='javascript:void(0)'>"+
						"				<i class='iconfont icon-pinglun'></i>"+
						"				评论(<span class='pilun'>0</span>)"+
						"			</a>"+
						"		</div>"+
						"		<div class='coment'></div>"+
						"		<p class='pl'>"+
						"			<input type='text' placeholder='我也说一句' class='pl_txt' onkeydown='enter(event,this)'>"+
						"			<span class='clear'>"+
						"				<i class='iconfont icon-clear'></i>"+
						"			</span>"+
						"			<span class='fb' onclick='fbpinglun(this)'>发表评论</span>"+
						"		</p>"+
						"	</div>"+
						"</div>");
					$(".editer .txt_title").val("");
					setEditorText("","myEditor");
					$(".editer p .input").val("");
				}
				
			}
		}); 
	});
	/*文本编辑器 end*/
	/*发表评论*/
	function fbpinglun(obj){
		var conVal = $(obj).parents(".contents").find(".pl .pl_txt").val();
		$(obj).parents(".contents").find(".pl .pl_txt").val("");
		$(obj).parents(".contents").find(".pl .pl_txt").focus();
	
		var html = "<p class='c_info animated bounceInUp'> "+
		"	<a href='javascript:void(0)' class='header_pic'>"+
		"		<img src='${basepath}/resources/imgs/header_pic.jpg' alt='头像'>"+
		"	</a>"+
		"	<a href='javascript:void(0)' class='name'>手写的从前 <b>:</b> </a>"+
		"	<span class='con'>"+conVal+"</span>"+
		"	<span class='time'>"+
		"		<span class='hours'>"+timeFormate(new Date().getHours())+"</span>"+
		"		<b>:</b>"+
		"		<span class='mins'>"+timeFormate(new Date().getMinutes())+"</span>"+
		"	</span>"+
		"</p>";
		
		$(obj).parents(".contents").find(".main .coment").append(html);
		
		/*滚动条滚动*/
		var scrollTop = $(document.body).scrollTop();
		$(document.body).stop(true,true).animate({"scrollTop":scrollTop+50},500);
		
		/*评论框*/
		var pilunVal = $(obj).parents(".contents").find(".link .pilun").text();
		$(obj).parents(".contents").find(".link .pilun").html(pilunVal*1+1);
	};
	
	/*评论框触发键盘事件*/
	function enter(e,obj){
		var e = e || window.event;
		if(e.keyCode == 13){
			fbpinglun(obj);
		}
	};
	/*zan*/
	function zan(obj){
		var textVal = $(obj).parents(".contents").find(".link .zan").text();
		$(obj).parents(".contents").find(".link .zan").html(textVal*1+1);
	};
	
 </script>
 </body>
</html>

