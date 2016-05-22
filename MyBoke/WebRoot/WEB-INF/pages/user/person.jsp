<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>个人资料</title>
		<meta charset="UTF-8" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" /> 
	</head>
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<style>
		*{padding:0;margin:0;}
		li{list-style:none;margin-bottom:10px;}
		img{vertical-align:middle;}
		body{background-color:#fff;}
		a{text-decoration:none;cursor:pointer;}
		u{text-decoration:none;}
		textarea,input,button{outline:none;}
		i,th,em,strong,b,address,cite{font-style:normal;font-weight:400;}
		select{width:101px;cursor:pointer;outline:none;border:1px solid #ff475c;}
		select option{width:101px;border:1px solid #ff475c;}
		.setting-tit{position:relative;width:100%;height:0px;border-top:1px solid #d8d6d0;margin:36px 0 50px 0;}
		.setting-tit span{position:absolute;top:-6px;left:50%;background:#fff;padding:0 16px;text-align:center;color:#8a8880;font-size:12px;height:12px;line-height:12px;}
		.setting-part-tit{float:left;width:86px;line-height:40px;font-size:14px;color:#414141;text-align:left;}
		.wrap{width:100%;height:100%;}
		.self-intro ul{width:40%;height:100%;margin:20px auto;}
		.self-intro input{height:38px;line-height:38px;}
		.self-intro input,.self-intro textarea{padding-left:12px;width:306px;border:1px solid #d8d6d0;color:#414141;font-size:14px;}
		.radio a i{position:absolute;top:5px;left:5px;width:10px;height:10px;border-radius:5px;background:#212121;}
		.self-intro .radio{float:left;width:50px;height:40px;margin:0 15px;text-align:center;line-height:40px;position:relative;}
		.radio a{position:absolute;top:9px;left:-15px;width:20px;height:20px;border-radius:11px;border:1px solid #8a8880;background:#fff;cursor:pointer;margin-right:5px;}
		.self-intro ul li{margin-bottom:10px;}
		.self-intro ul li:after{display:block;clear:both;content:"";}
		.textarea:hover,.select:hover,select:hover{border:1px solid #ff475c;}
		.select,#province,#city,#area{width:86px;margin-right:10px;float:left;padding-left:13px;height:38px;line-height:38px;border:1px solid #b6b3aa;text-align:left;position:relative;color:#b6b3aa;}
		#province,#city,#area{width:101px;padding-left:5px;line-height: 38px;}
		.infor_ul_birth a{color:#414141;}
		.select a{height:40px;line-height:40px;}
		.infor_ul_birth dl{width:100%;}
		.select dl{position:absolute;max-height:160px;left:-1px;top:38px;border:1px solid #ff475c;border-radius:2px;background:#fff;z-index:5;overflow-y:auto;display:none;color:#414141;}
		.select dl dd:hover{background:#ff475c;}
		.select:after{position:absolute;width:0;height:0;top:18px;right:14px;border-color:#b6b3aa #fff #fff;border-style:solid;border-width:6px;content:"";}
		#user_head{border-radius:50%;}
		.person_information_headimg{position:relative;float:left;text-align:center;margin:-20px 0 15px 0;height:80px;}
		.person_information_headimg img{width:80px;height:80px;cursor:pointer;}
		#change_head{position:absolute;top:26px;left:56%;margin-left:55px;width:78px;height:26px;border-radius:11px;border:1px solid #d8d6d0;color:#b6b3ad;font-size:14px;line-height:26px;}
		#change_head:hover{color:#ff475c;border-color:#ff475c;}
		.Scancel,.Ssubmit,.select{border-radius:2px;cursor:pointer;}
		.submit:hover{background:#2dd888;}
		.submit{cursor:pointer;margin:20px 500px;width:306px;height:40px;border:none;outline:none;border-radius:5px;}
		
		/*footer start*/
		.footer{width:100%;height:50px;padding:20px 0;}
		.footer .copyright{width:1000px;height:50px;margin:0 auto;text-align:center;
		line-height:50px;color:#999;}
		.footer .copyright a{color:#999;}
		/*footer end*/
	</style>
	<script src="${basePath}/resources/js/pca.js" type="text/javascript"></script>
	<body>
	<div class="wrap">
		<!--个人简介-->
		<div class="self-intro">
			<h3 class="setting-tit"><span>个人简介</span></h3>
			<ul>
				<!--头像-->
				<li>
					<h4 class="setting-part-tit">头像：</h4>
					<div class="person_information_headimg">
						<img src="${basePath}${sessionScope.userHeaderPic}" width="120" height="120" id="user_head">
						<a id="change_head" onclick="window.location.replace('${basePath}/upload/toUpload.do')">更改头像</a>
					</div>
				</li>
				<li>
					<h4 class="setting-part-tit">昵称：</h4>
					<div>
						<input class="information_ul_nametext" id="nick_name" type="text" value=<%=request.getSession().getAttribute("userName") %>>
						<i class="infor_ul_nametext_error" id="nick_i"></i>
						<span class="nick_error" id="nick_error"></span>
					</div>
				</li>
				<li>
					<h4 class="setting-part-tit">性别：</h4>
					<div class="radio" id="chose_man">
						<a></a><u>男</u>
					</div>
					<div class="radio" id="chose_female">
						<a></a><u>女</u>
					</div>
					<div class="radio" id="chose_secret">
						<a></a><u>保密</u>
					</div>
				</li>
				<li class="infor_ul_birth">
					<h4 class="setting-part-tit">生日：</h4>
					<div class="select" id="year">
						<a>1993</a>
						<dl>
							<dd>2016</dd>
						</dl>
					</div>
					<div class="select" id="month">
						<a>07</a>
						<dl> 
							<dd>12</dd>
						</dl>
					</div>
					<div class="select" id="day">
						<a>04</a>
						<dl>
							<dd>31</dd>
						</dl>
					</div>
				</li>
				<li class="infor_ul_place infor_ul_birth">
					<h4 class="setting-part-tit">居住地：</h4>
					<select id="province"></select>
					<select id="city"><option value="">--请选择--</option></select>
					<select id="area"><option value="">--请选择--</option></select>
				</li>
				<li>
					<h4 class="setting-part-tit">邮箱绑定：</h4>
					<div class="setting-part-addr">
						<input type="text" id="host_domain" value=<%=request.getSession().getAttribute("userEmail") %>>
						<i class="photog_infor_ul_error" id="host_error"></i>
					</div>
				</li>
				<li>
					<h4 class="setting-part-tit">QQ：</h4>
					<c:choose>
					    <c:when test="${sessionScope.userQq != null}">
					       <input type="text" id="qq_domain" value=<%=request.getSession().getAttribute("userQq") %>> 
					    </c:when>
					    <c:otherwise>
					        <input type="text" id="qq_domain" value="">
					    </c:otherwise>
					</c:choose>
					
				</li>
				<li>
					<h4 class="setting-part-tit">电话：</h4>
					<c:choose>
					    <c:when test="${sessionScope.userTel != null}">
					      <input type="text" id="phone_domain" value=<%=request.getSession().getAttribute("userTel") %>>
					    </c:when>
					    <c:otherwise>
					      <input type="text" id="phone_domain" value="">
					    </c:otherwise>
					</c:choose>
					
				</li>
				<li>
					<h4 class="setting-part-tit">微信：</h4>
					<c:choose>
					    <c:when test="${sessionScope.userWeixin != null}">
					       <input type="text" id="wechat_domain" value=<%=request.getSession().getAttribute("userWeixin") %>>
					    </c:when>
					    <c:otherwise>
					        <input type="text" id="wechat_domain" value="">
					    </c:otherwise>
					</c:choose>
				</li>
				
				<li>
					<h4 class="setting-part-tit">简介：</h4>
					<textarea id="desc_domain" data-desc=<%=request.getSession().getAttribute("userDescription") %>></textarea>
				</li>
			</ul>
		</div>
		<button class="submit setting-submit" id="photog_save">保存</button>
		<%@include file="/WEB-INF/pages/common/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function(){
			
			$(".radio").click(function(){
				var i = $("<i></i>")
				if($(this).find("a").children().length==0){
					$(this).find("a").append(i);
					$(this).siblings().find("a").children(0).remove();
				}else{
					$(this).find("a").children(0).remove();
				}
			});
			
			$(".infor_ul_birth .select").click(function(){
				$(this).find("dl").toggle();
			});
			
			$(".infor_ul_birth #year dl dd").click(function(){
				var val = $(this).text();
				$(".infor_ul_birth #year").find("a").text(val);
			});
			$(".infor_ul_birth #month dl dd").click(function(){
				var val = $(this).text();
				$(".infor_ul_birth #month").find("a").text(val);
			});
			$(".infor_ul_birth #day dl dd").click(function(){
				var val = $(this).text();
				$(".infor_ul_birth #day").find("a").text(val);
			});
		})
	</script>
	</body>

</html>
