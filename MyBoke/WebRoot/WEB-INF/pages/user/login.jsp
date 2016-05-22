<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>登录页面</title>
	</head>
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<style>	
		*{padding:0;margin:0;}
		body{background-size:cover;font-size: 12px;font-family:"微软雅黑";position:relative;}
		
		/*<!--提示栏 start-->*/
		#tip{width:100%;height:60px;position:absolute;left:0;top:0;background-color:#3499DA;line-height:60px;text-align:center;display:none;}
		#tip i{font-size:25px;color:yellow;}
		#tip span{font-size:18px;color:#fff;margin-left:5px;}
		/*<!--提示栏 end-->*/
		
		/*<!--登录栏 start-->*/
		#loginBox{width:300px;height:250px;position:absolute;top:50%;margin-top:125px;left:50%;margin-left:-150px;text-align:center;border-radius:10px;}
		/*<!--logo start-->*/
		#logo{width:250px;height:50px;line-height:50px;font-family:"方正舒体";font-weight:600;margin:20px auto;font-size:50px;color:#000;}
		/*<!--logo end-->*/
		/*<!--loginForm start-->*/
		#form{width:250px;height:180px;margin:0 auto;}
		#yzm{width:40%;height:100%;vertical-align:middle;position:absolute;right:0;top:0;cursor:pointer;}
		#error{position:absolute;right:100px;top:2px;font-size:20px;}
		#form p{margin-bottom:25px;width:100%;position:relative;height:35px;line-height:35px;}
		#form p:nth-child(3){margin-bottom:10px;}
		#form p input{width:100%;height:100%;border:none;outline:none;text-indent:2.5em;font-size:16px;font-weight:600;}
		#form p #login{text-align:center;text-indent:0em;cursor:pointer;background-color:#3499DA;color:#fff;border-radius:5px;}
		#form p #login:hover{background-color:#2D95D8;}
		#form p .left{position:absolute;left:2px;font-size:30px;color:rgba(152, 151, 151, 0.59);vertical-align:middle;}
		#form p span a{cursor:pointer;color:#333;font-size:16px;text-decoration:none;}
		#form p span:hover a{color:#3499DA;}
		#form p .regist{float:left;}
		#form p .pwd{float:right;}
		/*<!--loginForm end-->*/
		.icon{position:absolute;right:4px;top:2px;display:none;color:rgba(152, 151, 151, 0.59);font-size:20px;cursor:pointer;}
		.icon-correct{color:green;}
		.icon-error{color:red;}
		/*<!--登录栏 end-->*/
	</style>
	<body>
		<div id="wrap">
			<!--提示栏 start-->
			<div id="tip" >
				<i class="iconfont icon-tipinforeverse"></i>
				<span>请输入您的用户名和密码！</span>
			</div>
			<!--提示栏 end-->
			<!--登录栏 start-->
			<div id="loginBox">
				<!--logo start-->
				<div id="logo" class="animated rotateInDownRight">
					登录
				</div>
				<!--logo end-->
				<!--loginForm start-->
				<div id="form">
					<p class="animated bounceInLeft">
						<i class="iconfont icon-zhanghao left" id="icon_user"></i>
						<input type="text" placeholder="请输入用户名" class="input"  maxlength="20" id="user" autofocus="autofocus">
						<i class="iconfont icon"></i>
					</p>
					<p class="animated bounceInRight">
						<i class="iconfont icon-vpnkey left" id="icon_pwd"></i>
						<input type="password" placeholder="请输入密码" class="input"  maxlength="20" id="pwd">
						<i class="iconfont icon"></i>
					</p>
					<p class="animated bounceInLeft" style="display:none;" id="verify">
						<i class="iconfont icon-verify left" id="icon_yzm"></i>
						<input type="text" placeholder="请输入验证码" class="input"  maxlength="4" id="verifycode">
						<i class="iconfont icon" id="error"></i>
						<img src="yzm.do" id="yzm" alt="验证码" onclick="this.src='yzm.do?'+ new Date();"/>
					</p>
					<p class="animated bounceIn">
						<input id="login" type="button" value="登录" onclick="loginIn(this)">
					</p>
					<p class="animated rotateInUpRight">
						<span class="regist">
							<a href="${basePath}/user/toRegist.do" onclick="toRegist();">立即注册</a>
						</span>
						<span class="pwd">
							<a href="${basePath}/user/toFindPwd.do" onclick="toFindPwd();">忘记密码?</a>
						</span>
					</p>
				</div>
				<!--loginForm end-->
			</div>
			<!--登录栏 end-->
		</div>
		<script>
		var $user = null;
		var $pwd = null;
		var $login = null;
		var $input = null;
		var $error = null;
		//登录拦截
		var loginIndex = 0;
		
		//马上注册
		function toRegist(){
			window.location.href = basePath+"/user/toRegist.do";
		}
		
		//找回密码
		function toFindPwd(){
			window.open(basePath+"/user/toFindPwd.do");
		}
		
		$(function(){
			//获取对应的参数
			$user = $("#user");
			$pwd = $("#pwd");
			$login = $("#login");
			$input = $(".input");
			$error = $(".icon");
			
			$input.each(function(i){
				//获取焦点事件
				$(this).focus(function(){
					$(this).css("borderBottom","4px solid #3499DA");
					$(this).prev().css("color","#3499DA");
				});
				
				$(this).keydown(function(){
					$("#tip").fadeOut(500);
				});
			});
			//验证码
			$("#verifycode").keydown(function(){
				$(this).next().removeClass().addClass("iconfont icon-error").css({"display":"block","color":"rgba(152, 151, 151, 0.59)","cursor":"pointer"});
			});
			$("#error").hover(function(){
				$(this).css("color","#3499DA");
			},function(){$(this).css("color","rgba(152, 151, 151, 0.59)");});
			
			 //失去焦点事件
			 $user.blur(function(){
				 var userName = $(this).val().trim();
				 var len = userName.length;
				 if(!userName){
					$(this).css("borderBottom","");
					$(this).prev().css("color","");
				 }else if( len<3 || len>9){
					 showTip("bounceInDown","icon-Error","red","请输入长度为3~9的用户名！");
					 $user.next().addClass("icon-error").css("display","block");
					 $user.focus();
					 return;
				 }else{
					 $(this).css("borderBottom","4px solid #3499DA");
					 $(this).prev().css("color","#3499DA");
					 $user.next().addClass("icon-correct").removeClass("icon-error").css("display","block");
					 $.ajax({
						 	type:"post",
							url:basePath+"/user/checkUserName.do",
							data:{userName:userName},
							success:function(date){
								var date = date.trim();
								if(date == "UserIsAlive"){
									$user.next().addClass("icon-correct").css("display","block");
									$user.keydown(function(){
										$(this).next().css("display","none");
									});
								}else{
									showTip("fadeInUp","icon-Error","red","该用户名不存在！");
									$user.next().addClass("icon-error").css("display","block");
									$user.focus();
									$user.keydown(function(){
										$(this).next().css("display","none");
									});
									return;
								}
							}
					 });
				 }
			 });
			 /*密码*/
			 $pwd.blur(function(){
				 var Pwd = $(this).val().trim();
				 var len = Pwd.length;
				 if(!Pwd){
					$(this).css("borderBottom","");
					$(this).prev().css("color","");
				 }else if(len<6 || len >12){
					 showTip("bounceInDown","icon-Error","red","请输入长度为6~12的密码！");
					 $pwd.next().addClass("icon-error").css("display","block");
					 $pwd.focus();
					 $pwd.keydown(function(){
						$(this).next().css("display","none");
					 });
					 return;
				 }else{
					 $(this).css("borderBottom","4px solid #3499DA");
					 $(this).prev().css("color","#3499DA");
					 $pwd.next().addClass("icon-correct").removeClass("icon-error").css("display","block");
					 $pwd.keydown(function(){
						$(this).next().css("display","none");
					 });
				 }
			 });
			
			//去掉默认事件
			$(document).click(function(){
				return false;
			});
			
			//回车登录
	 		$(document).keydown(function(e){
	 			if(e.keyCode==13){
	 				loginIn();
	  			}
	 		});
			
	 		//点击清除内容按钮
			$error.click(function(){
				if($(this).prev().val()){
					$(this).prev().val("").focus();
					$(this).fadeOut(500);
					$("#tip").fadeOut(500);
				}
			}); 
		});

		//展示提示框信息		
		function showTip(animate,icon,color,message){
			$("#tip").css("display","block");
			$("#tip").removeClass().addClass("animated "+ animate);
			$("#tip").children("i").removeClass().addClass("iconfont "+icon).css("color",color);
			$("#tip").children("span").html(message);
		};
		//简单校验
		function loginIn(obj){
			var mark = $("#verify").is(":hidden");
			if(loginIndex == 2){
				$("#verify").css("display","block");
			}
			if(mark){
				var userVal = $user.val().trim();
				var pwdVal = $pwd.val().trim();
				
				if(!userVal && !pwdVal){
					showTip("fadeInUp","icon-Error","red","请填写完整的登录信息！");
					$user.focus();
					return;
				}
				if(!userVal){
					showTip("fadeInUp","icon-Error","red","请填写用户名！");
					$user.focus();
					return;
				}
				if(!pwdVal){
					showTip("fadeInUp","icon-Error","red","请填写密码！");
					$pwd.focus();
					return;
				}
				if(userVal && pwdVal && $user.blur() && $pwd.blur()){
					showTip("bounceInDown","icon-correct","green","登陆中请稍等...");
					$login.val("登陆中...").off("click");
					$error.off("click");
					var params = {userName:userVal,userPassword:pwdVal};
					$.ajax({
						type:"post",
						url:basePath+"/user/login.do",
						data:params,
						success:function(data){
							var data = data.trim(); 
							if(data=="error" || data=="null" || data=="fail"){
								$pwd.val("");
								$pwd.focus();
			  					$login.val("登录").on("click");
								$error.on("click");
			  					showTip("fadeInUp","icon-Error","red","登录密码错误！");
			  					$pwd.next().css("display","none");
			  					loginIndex++;
			  				}else if(data=="noActive"){
			  					showTip("fadeInUp","icon-Error","red","该用户名还未激活请前往邮箱激活！");
			  					$user.val("");
			  					$pwd.val("");
			  					$user.focus();
			  					$login.val("登录").on("click");
								$error.on("click");
								$user.next().css("display","none");
								$pwd.next().css("display","none");
								loginIndex++;
			  				}else if(data=="success"){
			  					window.location.href = basePath+"/index.do";
			  				}
						}
					});
				}
			}else{
				var userVal = $user.val().trim();
				var pwdVal = $pwd.val().trim();
				var yzmVal = $("#verifycode").val().trim();
				
				if(!userVal && !pwdVal && !yzmVal){
					showTip("fadeInUp","icon-Error","red","请填写完整的登录信息！");
					$user.focus();
					return;
				}
				if(!userVal){
					showTip("fadeInUp","icon-Error","red","请填写用户名！");
					$user.focus();
					return;
				}
				if(!pwdVal){
					showTip("fadeInUp","icon-Error","red","请填写密码！");
					$pwd.focus();
					return;
				}
				if(!yzmVal){
					showTip("fadeInUp","icon-Error","red","请填写验证码！");
					$("#verifycode").focus();
					return;
				}
				if(userVal && pwdVal && yzmVal && $user.blur() && $pwd.blur()){
					showTip("bounceInDown","icon-correct","green","登陆中请稍等...");
					$login.val("登陆中...").off("click");
					$error.off("click");
					var params = {userName:userVal,userPassword:pwdVal,verifyCode:yzmVal};
					$.ajax({
						type:"post",
						url:basePath+"/user/login.do",
						data:params,
						success:function(data){
							var data = data.trim(); 
							if(data=="error" || data=="null" || data=="fail"){
								$pwd.val("");
								$pwd.focus();
			  					$login.val("登录").on("click");
								$error.on("click");
			  					showTip("fadeInUp","icon-Error","red","登录失败...用户名或密码错误！");
			  					$pwd.next().css("display","none");
			  					loginIndex++;
			  				}else if(data=="noActive"){
			  					showTip("fadeInUp","icon-Error","red","该用户名还未激活请前往邮箱激活！");
			  					$user.val("");
			  					$pwd.val("");
			  					$user.focus();
			  					$login.val("登录").on("click");
								$error.on("click");
								$user.next().css("display","none");
								$pwd.next().css("display","none");
								loginIndex++;
			  				}else if(data=="success"){
			  					window.location.href = basePath+"/index.do";
			  				}else if(data == "vrfError"){
			  					showTip("fadeInUp","icon-Error","red","验证码错误,请重新输入");
			  					$("#verifycode").val("");
			  					$("#verifycode").next().css("display","none");
			  					$("#verifycode").focus();
			  					$login.val("登录").on("click");
								$error.on("click");
								loginIndex++;
			  				}
						}
					});
				}
			}
		};
		</script>
	</body>
</html>



