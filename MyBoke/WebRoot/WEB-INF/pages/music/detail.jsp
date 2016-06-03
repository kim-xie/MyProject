<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>${music.title}-king博客</title>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<%@include file="/WEB-INF/pages/common/common.jsp"%>
		<script type="text/javascript" src="${basePath}/resources/js/king_music.js"></script>
		<script type="text/javascript" src="${basePath}/resources/js/king_detail.js"></script>
	</head>
	<style>
		@keyframes move { 
			0%{	transform: rotate(0deg);}
			100%{transform:rotate(360deg);}
		}
		.r {animation: move 1s linear infinite;}
		@keyframes sc {
			0%{	transform: scale(1) opacity:1}
			100%{transform:scale(10);opacity:0;}
		}
		.sc {
			animation: sc 1s infinite linear;
		}
		
		.sstime {
			display: inline-block;
			transform: translateX(-120px)
		}
		.iconfont{margin-right:6px;}
		.iconfont.fz32{font-size:32px;}
		.iconfont.fz64{font-size:64px;}
		.musicBox{height:350px;}
		.musicBox .m_box{position:relative;}
		.musicBox .p_over{position:absolute;z-index:1;width:0;height:100%;left:0;top:0;
		background:rgba(243,125,125,0.3);}
		.musicBox .txt_over{position:absolute;z-index:3;width:100%;height:100%;left:0;top:0;
		color:#fff;background:rgba(0,0,0,0.4);}
		.musicBox .txt_over a{text-decoration:none;}
		.musicBox .txt_over a i{color:#fff;margin:0;}
		#wrapbox{position:relative;bottom:-90px;}
		#wrapbox .items{position:absolute;bottom:0px;}
		
	</style>
	<body data-opid="${music.id}" data-typeid="${music.categoryId}" style="overflow-y:auto;overflow-x:hidden;background:#EDEDEF;padding-top:70px;padding-bottom:70px;">
	<%@include file="/WEB-INF/pages/common/header.jsp"%>
 	<%@include file="/WEB-INF/pages/common/left.jsp"%>	
	<!-- 播放器盒子 -->
	<div class="container musicBox">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center m_box" style="padding:0;">
				<img src="${basePath}${music.img}" class="img-responsive center-block" alt="Responsive image">
				<div class="p_over"></div>
				<div class="txt_over">
					<h1>
						<i class="iconfont icon-music fz32"></i>${music.title}
					</h1>
					<p class="lead"><fmt:formatDate value="${music.createTime}" dateStyle="medium"/> @${music.username} 
						<span id="time">00:00</span>/<span id="ptime">00:00</span>
						<span id="percent">0%</span>
					</p>
					<a href="javascript:void(0);" class="ke_op">
						<i class="iconfont icon-play fz64"></i>
					</a>
					<!--音轨盒子-->
					<div id="wrapbox"></div>
				</div>
				
			</div>
		</div>
	</div>
	<!-- 内容盒子 -->
	<div class="container contentBox">
		<div class="row">
			<div class="col-md-8 col-md-offset-2" style="margin-top:10px;padding:0;">
				<p style="line-height:26px;">一首歌唱到最后还会剩下什么？<br/><br/>
					无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。<br/><br/>
					本期音乐为华语摇滚乐专题。<br/>
					<audio src="${basePath}${music.src}" id="audio" loop="loop"></audio>
				</p>
			</div>
		</div>
	</div>
	<!-- 相似主题盒子 -->
	<div class="container relationBox">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 relation" style="margin-top:10px;padding:0;">
				<div class="page-header" style="margin:0 0 10px 0;">
					<h2>
						<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>相似主题
					</h2>
				</div>
				<div class="row" style="margin-left:0;margin-right:0;">
					
				</div>
			</div>
		</div>
	</div>
		<style>
		.glyphicon{margin-left:6px;margin-right:6px;vertical-align:middle;}
		.replay:hover .glyphicon{color: #3498db;border-color: #3498db;}
		.text{font-size: 16px;color: #34495e;line-height: 26px;}
		.replay:hover{color: #3498db;cursor:pointer;}
		.glyphicon.mt2{margin-top:2px;}
		.glyphicon.mt4{margin-top:4px;}
		.glyphicon.mt6{margin-top:6px;}
		.glyphicon.mt8{margin-top:8px;}
		.glyphicon.mt10{margin-top:10px;}
		.glyphicon.fs16{font-size:16px;}
		.glyphicon.fs20{font-size:20px;}
		.glyphicon.fs26{font-size:26px;}
		.glyphicon.fs30{font-size:30px;}
		.glyphicon.fs36{font-size:36px;}
		#basic-addon1:hover{background:#00ff66;}
		.relationPic{padding:0;height:140px;}
		.thumbnail{border:none;outline:none;}
		.relationPic img{height:140px;}
		.headerPic{padding:0;height:40px;}
		.headerPic img{height:50px;}
		.name a{font-size: 14px;color: #95a5a6;font-weight: bold;text-decoration:none;}
		.name:hover a{color: #3498db;}
		.count{position:absolute;bottom:5px;right:85px;z-index:2;font-size:20px;font-family:"方正舒体";}
		</style>
		<!-- 评论盒子 -->
		<div class="container commentBox">
			<div class="row">
				<div class="col-md-8 col-md-offset-2" style="margin-top:10px;padding:0;">
					<div class="input-group col-md-12" style="margin-top:30px;padding:0;">
						<input type="text" class="form-control" onkeyup="keRealtion.setCacheData(this)" placeholder="请输入评论的内容(不得超过400字)" id="content" maxlength="400" aria-describedby="basic-addon1" style="position:relative;padding-right:60px;">
						<span class="input-group-addon" onclick="keRealtion.saveComment(this)" id="basic-addon1" style="cursor:pointer;">发表评论</span>
						<span class="count"><em class="num">400</em>/400</span>
					</div>
					<ul class="list-group comments" style="margin-top:30px;padding:0;">
						
					</ul>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/pages/common/footer.jsp"%>
		
		<script>
		
			$("#content").keyup(function(){
				var maxlength = $("#content").attr("maxlength");
				var textlength = $("#content").val().length;
				if(textlength <= maxlength){
					$(".count .num").text(maxlength-textlength);
				}
			}).keydown(function(){
				var maxlength = $("#content").attr("maxlength");
				var textlength = $("#content").val().length;
				if(textlength <= maxlength){
					$(".count .num").text(maxlength-textlength);
				}
			});
		
		</script>
		
	</body>
</html>
