<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>找回密码页面</title>
	</head>
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<style>	
		*{padding:0;margin:0;}
		a{text-decoration: none;}
		body{background:url("${basePath}/resources/img/2.jpg")no-repeat;background-size:cover;font-size: 12px;font-family:"微软雅黑";position:relative;}
		
		/*<!--提示栏 start-->*/
		#tip{width:100%;height:60px;position:absolute;left:0;top:0;background-color:#3499DA;line-height:60px;text-align:center;display:none;}
		#tip i{font-size:25px;color:yellow;}
		#tip span{font-size:18px;color:#fff;margin-left:5px;}
		/*<!--提示栏 end-->*/
		
		/*<!--找回密码 start-->*/
		#loginBox{width:300px;height:250px;position:absolute;top:50%;margin-top:125px;left:50%;margin-left:-150px;text-align:center;border-radius:10px;}
		/*<!--logo start-->*/
		#logo{width:250px;height:50px;line-height:50px;font-family:"方正舒体";font-weight:600;margin:10px auto;font-size:50px;color:#000;}
		/*<!--logo end-->*/
		/*<!--loginForm start-->*/
		#form{width:250px;height:180px;margin:0 auto;}
		#form p{margin-bottom:25px;width:100%;position:relative;height:35px;line-height:35px;}
		#form p input{width:100%;height:100%;border:none;outline:none;text-indent:2.5em;font-size:16px;font-weight:600;}
		#error{position:absolute;right:100px;top:2px;font-size:20px;}
		#yzm{width:40%;height:100%;vertical-align:middle;position:absolute;right:0;top:0;cursor:pointer;}
		#form p input[type=button]{text-indent:0em;cursor:pointer;background-color:#3499DA;color:#fff;border-radius:5px;}
		#form p input[type=button]:hover{background-color:#2D95D8;}
		#form p .left{position:absolute;left:2px;font-size:30px;color:rgba(152, 151, 151, 0.59);vertical-align:middle;}
		#form p span a{cursor:pointer;color:#333;font-size:16px;text-decoration:none;}
		#form p span:hover a{color:#3499DA;}
		#form p .regist{float:left;}
		#form p .pwd{float:right;}
		/*<!--loginForm end-->*/
		.icon-error{position:absolute;right:4px;top:2px;display:none;color:rgba(152, 151, 151, 0.59);font-size:20px;cursor:pointer;}
		.icon-error:hover{color:#3499DA;}
		/*<!--找回密码 end-->*/
	</style>
	<body>
		<div id="wrap">
			<!--提示栏 start-->
			<div id="tip">
				<i class="iconfont icon-tipinforeverse"></i>
				<span>请输入您的用户名和密码！</span>
			</div>
			<!--提示栏 end-->
			<!--找回密码 start-->
			<div id="loginBox">
				<!--logo start-->
				<div id="logo" class="animated rotateInDownRight">
					找回密码
				</div>
				<!--logo end-->
				<!--loginForm start-->
				<div id="form">
					<p class="animated bounceInLeft">
						<i class="iconfont icon-email left" id="icon_email"></i>
						<input type="text" placeholder="请输入注册邮箱" maxlength="20" id="email" autofocus="autofocus" class="input">
						<i class="iconfont icon-error"></i>
					</p>
					<p class="animated bounceInRight">
						<i class="iconfont icon-verify left" id="icon_pwd"></i>
						<input type="text" placeholder="请输入验证码" maxlength="4" id="pwd" class="input">
						<i class="iconfont icon-error" id="error"></i>
						<img src="yzm.do" id="yzm" alt="验证码" onclick="this.src='yzm.do?'+ new Date();"/>
					</p>
					<p class="animated bounceIn">
						<input type="button" value="发送验证邮件" id="findPwd">
					</p>
				</div>
				<!--loginForm end-->
			</div>
			<!--找回密码 end-->
		</div>
		<script>
		$(function(){

			//获取对应的参数
			var $email = $("#email");
			var $pwd = $("#pwd");
			var $findPwd = $("#findPwd");
			var $input = $(".input");
			var $error = $(".icon-error");
			
			$input.each(function(i){
				//获取焦点事件
				$(this).focus(function(){
					$(this).css("borderBottom","4px solid #3499DA");
					$(this).prev().css("color","#3499DA");
					if(!$(this).val()){
						$(this).next().css("display","none");
					}
				});
				//键盘抬起事件
				$(this).keyup(function(){
					$(this).next().css("display","block");
					$("#tip").fadeOut(500);
				});
				//市区焦点事件
				$(this).blur(function(){
					var Val = $(this).val();
					if(Val){
						$(this).css("borderBottom","4px solid #3499DA");
						$(this).prev().css("color","#3499DA");
					}else{
						$(this).css("borderBottom","");
						$(this).prev().css("color","");
					}
				});
			});
			//点击清除内容按钮
			$error.click(function(){
				if($(this).prev().val()){
					$(this).prev().val("").focus();
				}
			});
			
			//简单校验
			$findPwd.click(function(){
				var emailVal = $email.val();
				var pwdVal = $pwd.val();
				if(!emailVal && !pwdVal){
					showTip("bounceInDown","icon-tip","yellow","请输入您注册的邮箱和验证码！");
					$email.focus();
					return;
				}
				if(!emailVal){
					showTip("fadeInUp","icon-Error","red","请输入您注册的邮箱！");
					$email.focus();
					return;
				}
				if(!pwdVal){
					showTip("fadeInUp","icon-Error","red","请输入您的验证码！");
					$pwd.focus();
					return;
				}
				if(emailVal && pwdVal){
					showTip("bounceInDown","icon-correct","green","验证邮件发送中请稍等...！");
					$(this).val("验证邮件发送中...").off("click");
					$error.off("click");
					var params = {email:emailVal,yzm:pwdVal};
					alert(JSON.stringify(params));
					return;
					//ajax提交数据
					ajax({
						type:"post",
						url:"findpwd.do",
						data:params,
						success:function(data){
							alert(data);
						}
					});
				}
			});
			//展示提示框信息		
			function showTip(animate,icon,color,message){
				$("#tip").css("display","block");
				$("#tip").addClass("animated "+ animate);
				$("#tip").children("i").addClass("iconfont "+icon).css("color",color);
				$("#tip").children("span").html(message);
			};
			//去掉默认事件
			$(document).click(function(){
				return false;
			});
			
			//回车
	 		$(document).keydown(function(e){
	 			if(e.keyCode==13){
	 				$findPwd.trigger("click");
	  			}
	 		});
		});
		
		</script>
	</body>
</html>


