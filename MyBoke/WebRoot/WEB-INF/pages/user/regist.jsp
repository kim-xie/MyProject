<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>注册页面</title>
	</head>
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<style>	
		*{padding:0;margin:0;}
		body{background:url("${basePath}/resources/imgs/2.jpg")no-repeat;background-size:cover;font-size:12px;font-family:"微软雅黑";position:relative;}
		/*<!--提示栏 start-->*/
		#tip{width:100%;height:60px;position:absolute;left:0;top:0;background-color:#3499DA;line-height:60px;text-align:center;display:none;}
		#tip i{font-size:25px;color:yellow;}
		#tip span{font-size:18px;color:#fff;margin-left:5px;}
		/*<!--提示栏 end-->*/
		/*<!--注册栏 start-->*/
		#registBox{width:380px;height:390px;position:absolute;top:50%;margin-top:60px;left:50%;margin-left:-150px;text-align:center;border-radius:10px;}
		/*<!--logo start-->*/
		#logo{width:250px;height:50px;line-height:50px;font-family:"方正舒体";font-weight:600;margin:20px auto;font-size:50px;color:#000;}
		/*<!--logo end-->*/
		/*<!--registForm start-->*/
		#form{width:380px;height:320px;margin:0 auto;}
		#form p{margin-bottom:25px;width:100%;height:35px;position:relative;line-height:35px;}
		#form p:nth-child(5){margin-bottom:10px;}
		#form p input{width:100%;height:100%;border:none;outline:none;text-indent:2.5em;font-size:16px;font-weight:600;}
		#form p input[type=button]{text-indent:0em;cursor:pointer;background-color:#3499DA;color:#fff;border-radius:5px;}
		#form p input[type=button]:hover{background-color:#2D95D8;}
		#form p .left{position:absolute;left:2px;font-size:30px;color:rgba(152, 151, 151, 0.59);z-index:1;}
		#form p span a{cursor:pointer;color:#3499DA;font-size:16px;text-decoration:none;}
		#form p span:hover a{color:#3499DA;}
		#form p .login{font-size:16px;}
		/*<!--registForm end-->*/
		.icon{position:absolute;right:4px;top:2px;display:none;color:rgba(152, 151, 151, 0.59);font-size:20px;cursor:pointer;}
		.icon-correct{color:green;}
		.icon-error{color:red;}
		/*<!--注册栏 end-->*/
	</style>
	<body>
		<div id="wrap">
			<!--提示栏 start-->
			<div id="tip">
				<i class="iconfont icon-tipinforeverse"></i>
				<span>请设置您的注册信息！</span>
			</div>
			<!--提示栏 end-->
			<!--注册栏 start-->
			<div id="registBox">
				<!--logo start-->
				<div id="logo" class="animated rotateInDownRight">
					欢迎注册
				</div>
				<!--logo end-->
				<!--registForm start-->
				<div id="form">
					<p class="animated bounceInLeft">
						<i class="iconfont icon-zhanghao left" id="icon_user"></i>
						<input type="text" placeholder="用户名(3-9个字符包括中文/字母/数字/下划线)" class="input" maxlength="15" autofocus="autofocus" id="user">
						<i class="iconfont icon"></i>
					</p>
					<p class="animated bounceInRight">
						<i class="iconfont icon-vpnkey left" id="icon_pwd"></i>
						<input type="password" placeholder="设置密码(长度为6-12个字符)" class="input" maxlength="12" id="pwd">
						<i class="iconfont icon"></i>
					</p>
					<p class="animated bounceInLeft">
						<i class="iconfont icon-vpnkey left" id="icon_confirm"></i>
						<input type="password" placeholder="确认密码(长度为6-12个字符)" class="input" maxlength="12" id="confirm">
						<i class="iconfont icon"></i>
					</p>
					<p class="animated bounceInRight">
						<i class="iconfont icon-email left" id="icon_email"></i>
						<input type="text" placeholder="设置邮箱" class="input" maxlength="20" id="email">
						<i class="iconfont icon"></i>
					</p>
					<p class="animated bounceIn">
						<input type="button" value="注册" id="regist" onclick="regist(this)">
					</p>
					<p class="animated rotateInUpRight">
						<span class="login">
							已有账号？<a href="${basePath}/user/toLogin.do" onclick="toLogin();">马上登录</a>
						</span>						
					</p>
				</div>
				<!--registForm start-->
			</div>
			<!--注册栏 end-->
		</div>
		<script>
		var $user = null;
		var $pwd = null;
		var $confirm = null;
		var $email = null;
		var $regist = null;
		var $input = null;
		var $error = null;
		
		//马上登录
		function toLogin(){
			window.location.href = basePath+"/user/toLogin.do";
		}
		
		$(function(){
			//获取对应的参数
			$user = $("#user");
			$pwd = $("#pwd");
			$confirm = $("#confirm");
			$email = $("#email");
			$regist = $("#regist");
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
								if(date == "UserIsAlive"){
									showTip("fadeInUp","icon-Error","red","该用户名已存在！");
									$user.next().addClass("icon-error").css("display","block");
									$user.focus();
									$user.keydown(function(){
										$(this).next().css("display","none");
									});
									 return;
								}else if(date == "UserIsCorrect"){
									$user.next().addClass("icon-correct").css("display","block");
									$user.keydown(function(){
										$(this).next().css("display","none");
									});
								}
							}
					 });
				 }
			 });
			 /*邮箱*/
			 $email.blur(function(){
				 var userEmail = $(this).val().trim();
				 if(!userEmail){
					$(this).css("borderBottom","");
					$(this).prev().css("color","");
				 }else{
					 $(this).css("borderBottom","4px solid #3499DA");
					 $(this).prev().css("color","#3499DA");
					 $email.next().addClass("icon-correct").removeClass("icon-error").css("display","block");
				 }
				 $.ajax({
					 	type:"post",
						url:basePath+"/user/checkUserEmail.do",
						data:{userEmail:userEmail},
						success:function(date){
							if(date == "EmailIsAlive"){
								showTip("fadeInUp","icon-Error","red","该邮箱已注册！");
								$email.next().addClass("icon-error").css("display","block");
								$email.focus();
								$email.keydown(function(){
									$(this).next().css("display","none");
								});
								 return;
							}else if(date == "EmailIsCorrect"){
								$email.next().addClass("icon-correct").removeClass("icon-error").css("display","block");
								$email.keydown(function(){
									$(this).next().css("display","none");
								});
							}else if(date == "emailError"){
								showTip("fadeInUp","icon-Error","red","邮箱格式错误！");
								$email.next().addClass("icon-error").css("display","block");
								$email.focus();
								$email.keydown(function(){
									$(this).next().css("display","none");
								});
								 return;
							}
						}
				 });
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
			 /*确认密码*/
			 $confirm.blur(function(){
				 var confirmPwd = $(this).val().trim();
				 var Pwd =  $pwd.val();
				 var len = confirmPwd.length;
				 if(!confirmPwd){
					$(this).css("borderBottom","");
					$(this).prev().css("color","");
				 }else if(confirmPwd != Pwd){
					 showTip("bounceInDown","icon-Error","red","确认密码和密码不一致！");
					 $confirm.next().addClass("icon-error").css("display","block");
					 $confirm.focus();
					 $confirm.keydown(function(){
						$(this).next().css("display","none");
					 });
					 return;
				 }else if(len<6 || len >12){
					 showTip("bounceInDown","icon-Error","red","请输入长度为6~12的确认密码！");
					 $confirm.next().addClass("icon-error").css("display","block");
					 $confirm.focus();
					 $confirm.keydown(function(){
						$(this).next().css("display","none");
					 });
					 return;
				 }else{
					 $(this).css("borderBottom","4px solid #3499DA");
					 $(this).prev().css("color","#3499DA");
					 $confirm.next().addClass("icon-correct").removeClass("icon-error").css("display","block");
					 $confirm.keydown(function(){
						$(this).next().css("display","none");
					 });
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
			
			//去掉默认事件
			$(document).click(function(){
				return false;
			});
			//回车注册
	 		$(document).keydown(function(e){
	 			if(e.keyCode==13){
	 				$regist.trigger("click");
	  			}
	 		});
		});
		//简单的非空注册验证
		function regist(obj){
			var userVal = $user.val().trim();
			var pwdVal = $pwd.val().trim();
			var confirmVal = $confirm.val().trim();
			var emailVal = $email.val().trim();
			
			if(userVal && pwdVal && confirmVal && emailVal && $user.blur() && $pwd.blur() && $confirm.blur() && $email.blur()){
				
				showTip("bounceInDown","icon-correct","green","注册中请稍等...");
				//去事件防止表单重复提交
				$regist.val("注册中...").off("click");
				$error.off("click");
				var params = {userName:userVal,userPassword:pwdVal,confirmPassword:confirmVal,userEmail:emailVal};
				//ajax提交数据
				$.ajax({
					type:"post",
					url:basePath+"/user/regist.do",
					data:params,
					success:function(data){
						var data = data.trim();
						if(data=="error" || data=="null" || data=="fail"){
		  					$pwd.val("");
		  					$confirm.val("");
		  					$user.focus();
		  					$regist.val("注册").on("click");
							$error.on("click");
		  					showTip("fadeInUp","icon-Error","red","注册失败...请输入正确的注册信息！");
		  				}else if(data=="EmailIsAlive"){
		  					showTip("fadeInUp","icon-Error","red","该邮箱已注册！");
							$email.next().addClass("icon-error").css("display","block");
							$email.focus();
							$email.keydown(function(){
								$(this).next().css("display","none");
							});
							$regist.val("注册").on("click");
							$error.bind("click");
		  				}else if(data=="EmailIsCorrect"){
		  					$email.next().addClass("icon-correct").removeClass("icon-error").css("display","block");
							$email.keydown(function(){
								$(this).next().css("display","none");
							});
		  				}else if(data == "emailError"){
							showTip("fadeInUp","icon-Error","red","邮箱格式错误！");
							$email.next().addClass("icon-error").css("display","block");
							$email.focus();
							$email.keydown(function(){
								$(this).next().css("display","none");
							});
							$regist.val("注册").on("click");
							$error.on("click");
						}else if(data == "success"){
							window.location.href = basePath+"/user/toMsg.do";
						}
					}
				});
			}
		};
		//展示提示框信息		
		function showTip(animate,icon,color,message){
			$("#tip").css("display","block");
			$("#tip").removeClass().addClass("animated "+ animate);
			$("#tip").children("i").removeClass().addClass("iconfont "+icon).css("color",color);
			$("#tip").children("span").html(message);
		};
			
		</script>
	</body>
</html>
