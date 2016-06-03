<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	/* userbox */
	.person .user .userbox{float:left;}
	.person .user .userbox .u_info{margin-bottom:20px;padding:5px 80px;width:80px;height:80px;display:block;}
	.person .user .userbox .u_info img{width:80px;height:80px;border-radius:50%;vertical-align:middle;}
	.person .user .userbox .name{color:#4c4c4c;font-size:26px;transition:1s;margin-left:68px;text-align:center;display:block;max-width:100px;min-height:30px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;}
	.person .user .userbox .name:hover{color: #828d95;transition:1s;}
	.person .user .userbox a{text-decoration:none;}
	.person .user .userbox .info_list{width:240px;height:48px;margin:15px 0 20px 0;}
 	.person .user .userbox .info_list li{float:left;width:78px;color:#414141;line-height:26px;font-size:16px;text-align:center;}
 	.person .user .userbox .info_list li span{color:#8a8880;line-height:22px;display:block;}
 	/* calebox */
	.person .user .calebox{float:left;}
	.person .user .calebox .caleheader{height:35px;background:#fafafa;line-height:35px;color:#4c4c4c;border-bottom:1px solid #eee;position:relative;}
	.person .user .calebox .caleheader #prev,#next{position:absolute;top:0;font-size:30px;cursor:pointer;}
	.person .user .calebox .caleheader #prev:hover{color:#00f;}
	.person .user .calebox .caleheader #next:hover{color:#00f;}
	.person .user .calebox .caleheader #prev{left:2px;}
	.person .user .calebox .caleheader #next{right:2px;}
	.person .user .calebox .caletab{width:100%;border-collapse:collapse}
	.person .user .calebox .caletab thead th{background:#fafafa;color:#4c4c4c}
	.person .user .calebox .caletab th,td{border:1px solid #eee;text-align:center;padding:6px 4px;transition:all 0.3s ease-in-out;}
	.person .user .calebox .caletab td:hover{background:#999;color:#00f;cursor:pointer;transition:all 0.3s ease-in-out;}
	.person .user .calebox .caletab td.noon{color:#999;}
	.person .user .calebox .caletab td.on{color:#fafafa;background:#0066ff;}
	.person .user #time{position:absolute;right:20%;top:2px;font-size:14px;font-weight:700;color:#4c4c4c;}
	.person .user #cale{position:absolute;left:20%;top:2px;font-size:14px;font-weight:700;color:#4c4c4c;}
 	/* fansbox */
 	.person .user .fansbox{float:left;}
 	.person .user .fansbox h3{padding:0 15px;line-height:39px;border-bottom:1px solid #eee;margin:0;}
 	.person .user .fansbox h3 span{font-size:14px;color:#414141;}
 	.person .user .fansbox h3 .fans-change{float:right;position:relative;padding-left:10px;color:#8a8880;font-size:12px;transition:1s;}
 	.person .user .fansbox h3 .fans-change i{margin-right:6px;}
 	.person .user .fansbox h3 .fans-change:hover ,i{color:#0066ff;transition:1s;}
 	.person .user .fansbox ul li{margin:30px;width:170px;height:50px;border-bottom:1px solid #eee;}
 	.person .user .fansbox ul li .fans-ava{float:left;position:relative;margin:0px 10px;}
 	.person .user .fansbox ul li .fans-ava img{width:50px;height:50px;border-radius:50%;}
 	.person .user .fansbox a{text-decoration:none;}
	.person .user .fansbox ul li .fans-r{float:right;}
	.person .user .fansbox ul li .fans-r .fans-name{text-align:center;display:block;font-size:12px;line-height:18px;color:#414141;font-weight:bold;width:90px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
	.person .user .fansbox ul li .fans-r .fans-add{cursor:pointer;display:block;margin-top:8px;height:22px;border:1px solid #d8d6d0;text-align:center;line-height:22px;color:#414141;font-size:12px;}
	.person .user .fansbox ul li .fans-r .fans-add:hover{border-color:#414141;}
	/*个人信息栏目  end*/
	
	/* 公告栏   start */
    .soupBox{height:110px;width:670px;overflow:hidden;margin:30px auto;}
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
	
	/* 发表文章栏目   start */
    .fb_box{height:110px;width:670px;overflow:hidden;margin:30px auto;}
	.fb_box .soup{position:relative;float:right;width:auto;height:40px;padding:0 120px 0 20px;background-color:#fff7e7;border-radius:20px;box-shadow:1px 1px 2px rgba(0,0,0,.2);margin-top:36px;}
	.fb_box .soup li i{position:absolute;font-size:28px;color:#eae1d0;cursor:pointer;}
	.fb_box .soup li .txt{display:none;line-height:40px;font-size:14px;color:#6b3612;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:550px;}
	.fb_box .soup li.open .txt{display:block;}
	.fb_box .soup li.open i{color:#e67e22;}
	.fb_box .soup li i.icon-warn{right:80px;top:0;font-size:31px;margin-left:10px;}
	.fb_box .soup li i.icon-iconfontaixin{right:46px;top:0;}
	.fb_box .soup li i.icon-gonggao{right:10px;top:2px;}
	.fb_box span{display:block;background:#fff7e7;float:left;border-radius:10px;line-height:30px;cursor:pointer;font-size:20px;font-weight:600;color:#6b3612;margin-top:5px;padding:5px 8px;}
	.fb_box span .icon-add{font-size:24px;font-weight:600;color:#6b3612;margin-right:5px;}
 	/* 发表文章栏目   end */

	
	/*文本编辑器 start*/
	.editerBox{width:570px;margin:30px auto;display:none;}
	.input{width:400px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
	.editerBox .editer{width:570px;height:100%;background:#fff;overflow:hidden;padding:10px;}
	.editerBox .editer .title{width:550px;width:600px;height:30px;margin:10px 0;display:block;font-size:18px;font-weight:600;}
	.editerBox .editer .title input{width:502px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
	.editerBox .editer .upload_pic{width:550px;height:320px;border:1px dashed #ccc;text-align:center;margin:20px 0;}
	.editerBox .editer .upload_pic .txt-tip{line-height:320px;font-size:20px;color:#999;font-weight:600;}
	.editerBox .editer p{float:left;font-size:14px;font-weight:600;margin:20px 0;}
	.editerBox .editer p .fabiao{height:30px;line-height:30px;}
	.editerBox .editer p .fabiao .submit{padding:0 10px;margin-left:22px;outline:none;border:none;background:#0033ff;transition:1s;border-radius:5px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
	.editerBox .editer p .fabiao .submit:hover{background:#0033cc;transition:1s;}
	/*文本编辑器 end*/
	
  </style>
  <link rel="stylesheet" type="text/css" href="${basePath}/resources/js/umeditor/themes/default/css/umeditor.css">
  <script type="text/javascript" src="${basePath}/resources/js/wnl/wnl.js"></script>
  <script type="text/javascript" src="${basePath}/resources/sg/tz_page.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.js"></script>
 </head>
 
 <body data-count="${itemCount}" data-content="${count}" style="overflow-y:auto;overflow-x:hidden;background:#EDEDEF;padding-top:70px;padding-bottom:70px;">
 <%@include file="/WEB-INF/pages/common/header.jsp"%>
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
					<img src="${basePath}/resources/mp3/banner/1.jpg" alt="First slide">
				</div>
				<div class="item active">
					<img src="${basePath}/resources/mp3/banner/2.jpg" alt="Second slide">
				</div>
				<div class="item">
					<img src="${basePath}/resources/mp3/banner/3.jpg" alt="Third slide">
				</div>
				<div class="item">
					<img src="${basePath}/resources/mp3/banner/4.jpg" alt="Third slide">
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
		 		<!-- userbox -->
		 		<div class="userbox col-md-3">
					<span class="u_info">
						<a href="javascript:void(0)">
							<img src=${basePath}${sessionScope.userHeaderPic} alt="头像" onclick="window.open(basePath+'/user/toPerson.do')">
						</a>
					</span>
					<a href="javascript:void(0)" onclick="window.open(basePath+'/user/toPerson.do')" class="name"><%=request.getSession().getAttribute("userName") %></a>
					<ul class="info_list">
						<li>
							<strong class="dynamic_count">1</strong>
							<span>动态</span>
						</li>
						<li style="border-left:1px solid #d8d6d0;border-right: 1px solid #d8d6d0;">
							<strong class="follow_count">4</strong>
							<span>关注</span>
						</li>
						<li>
							<strong class="fans_count">10</strong>
							<span>粉丝</span>
						</li>
					</ul>
				</div>
				<!-- calebox -->
				<div class="calebox col-md-6">
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
				<!-- fansbox -->
				<div class="fansbox col-md-3">
				    <h3>
					    <span>可能感兴趣的人</span>
					    <a href="javascript:void(0);" class="fans-change" onclick="hyb(this);"><i class="iconfont icon-shuanxin"></i>换一批</a>
				    </h3>
					<ul class="f-list">
					    <c:forEach items="${users}" var="user">
					    	 <li>
								<a class="fans-ava" target="_blank">
									<img src="${basePath}${user.headerPic}">
								</a>
								<div class="fans-r">
									<a class="fans-name" target="_blank">${user.userName}</a>
									<a class="fans-add" data="">+ 关注</a>
								</div>
							</li>
					    </c:forEach>
					</ul>
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
		 <style>
		 	.fb_box .publicBar{background:url("${basePath}/resources/imgs/share/nav224.png")no-repeat;height:110px;}
		 	.fb_box .publicBar li{float:left;width:140px;height:100%;}
		 	.fb_box .publicBar li a{width:100%;height:100%;display:block;}
		 	.fb_box .publicBar li:hover{background:#e5e5e5;opacity:0.3}
		 	.fb_box .publicBar li.user{width:110px;height:100%;position:relative;}
		 	.fb_box .publicBar li.user img{width:110px;height:100%;position:absolute;}
		 	.fb_box .publicBar li.user a:hover{background:transparent;opacity:1;}
		 </style>
		
		 <!-- 发表文章栏目   start -->
		 <div class="fb_box">
		 	<ul class="publicBar">
			 	<li class="user">
				 	<a href="javascript:void(0);" target="_blank" onclick="window.open(basePath+'/user/toPerson.do')">
				 		<img src="${basePath}${sessionScope.userHeaderPic}" alt="头像">
				 	</a>
			 	</li>
			 	<li>
				 	<a href="javascript:void(0);" target="_blank" class="fb_aritcle"></a>
			 	</li>
			 	<li>
				 	<a href="javascript:void(0);" target="_blank" class="fb_pic"></a>
			 	</li>
			 	<li>
				 	<a href="javascript:void(0);" target="_blank" class="fb_music"></a>
			 	</li>
			 	<li>
				 	<a href="javascript:void(0);" target="_blank" class="fb_video"></a>
			 	</li>
		 	</ul>
		 </div>
		 <!-- 发表文章栏目  end -->
		 
		 <!--文本编辑器 start-->
		 <div class="editerBox">
		 	<div class="editer">
		 		<span class="title">
		 			标题:
		 			<input type="text" placeholder="请输入标题不得超过50个字" maxlength="50" class="txt_title">
		 		</span>
		 		<span class="description title">
		 			描述:
		 			<input type="text" placeholder="描述不得超过200个字" maxlength="200" class="txt_description">
		 		</span>
		 		<div class="upload_pic">
		 			<input type="file" style="display:none;">
		 			<span class="txt-tip" onclick="">
		 				<a>请添加封面图片</a>
		 				<img id="preview" src="" width="550" height="320">
		 			</span>
		 		</div>
				<script id="myEditor" type="text/plain" style="width:550px;height:300px;margin:10px 0;overflow-X:hidden;overflow-Y:auto;"></script>
		 		<p>
					标签：
					<input type="text" class="input" placeholder="请输入标签" maxlength="40">	
					<span class="fabiao">
						<input type="button" class="submit" value="发表文章" onclick="saveContent(this);">
					</span>
		 		</p>
		 	</div>
		 </div>
		 <!--文本编辑器 end-->

		<style>
			.mubox .tab{position:relative;left:-15px;top:30px;color:#7c7c7c;font-size:16px;font-weight:600;}
			.mubox .musicRow{margin-top:40px;position:relative;margin-left:-15px;}
			.ellipsis{width:100%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
			.mubox .list:nth-child(4n+1){position:relative;margin-left:-15px;}
			.mubox .list:hover .shade{opacity:1;}
			.mubox .list:hover .cover .img{transform:scale(1.1)}
			.mubox .list .shade{box-shadow:0 0 12px rgba(0, 0, 0, 0.1);position:absolute;left:0;top:0;
			width:100%;height:100%;background:#fff;z-index:1;opacity:0;}
			.mubox .list .cover{overflow:hidden;position:relative;z-index:2;margin-top:15px;}
			.mubox .list .info{position:relative;z-index:2;border-bottom:1px solid #e2e8eb;padding:5px 0 20px 0;}
			.mubox .list .info .msg{height: 21px;overflow: hidden;margin-top:5px;}
			.mubox .list .info .msg span{margin-right:10px;}
			.mubox .list .info .msg span i{margin-right:3px;}
			.mubox .list .info .user{margin-top: 7px;}
			.mubox .list .info .user a{display: block;height:20px;line-height: 20px;color:#2c3e50;}
			.mubox .list .info .title{font-weight: bold;color: #34495e;}
			.mubox .list .info .msg span em {font-size:14px;color:#9aabb8;display:inline-block;line-height:21px;
			vertical-align: middle;}
			.mubox .row .list .info .user a .headerPic{float:left;width:20px;height:20px;border-radius:50%;}
			.mubox .row .list .info .user a .name{float:left;margin-left:10px;font-size:12px;}
			.tzPage{font-size:14px;margin-top:0px;float:right;margin-left: 0px;}
		</style>


		<!-- list start-->
		<div class="container mubox">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs tab" role="tablist">
				<li role="presentation" class="active">
					<a href="#music" aria-controls="music" role="tab" data-toggle="tab">音乐</a>
				</li>
				<li role="presentation">
					<a href="#aritcle" aria-controls="aritcle" role="tab" data-toggle="tab">文章</a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content contBox">
				<div role="tabpanel" class="tab-pane fade active" id="music">
					<!-- 音乐列表 -->
					<div class="row musicRow" id="listBox" data-model="music">
						<%-- <c:forEach items="${musics}" var="music">
							<div class="col-md-3 col-xs-6 col-sm-3 list">
								<!-- shade -->
								<div class="shade"></div>
								<!-- pic -->
								<div class="cover">
									<a href="${basePath}/music/detail/${music.id}.do" target="_blank">
										<img src="${basePath}${music.img}" title="${music.title}" class="img-responsive img" alt="Responsive image">
									</a>
								</div>
								<!-- info -->
								<div class="info">
									<h4 class="title ellipsis">${music.title}</h4>
									<div class="msg">
										<span class="time tmui-tips" tip="${king:formatDate(music.createTime,'yyyy-MM-dd HH:mm:ss')}"><i class="iconfont icon-time"></i>
											<em><fmt:formatDate value="${music.createTime}" dateStyle="medium"/></em>
										</span>
										<span><i class="iconfont icon-music" title="收听数"></i><em>${music.hits}</em></span>
										<span><i class="iconfont icon-comment" title="评论数"></i><em>${music.comments}</em></span>
										<span><i class="iconfont icon-zan" title="点赞数"></i><em>${music.loves}</em></span>
									</div>
									<p class="user">
										<a href="#" target="_blank">
											<img src="${basePath}${music.headerPic}" class="img-circle headerPic">
											<strong class="name">${music.username}</strong>
										</a>
									</p>
								</div>
							</div>
						</c:forEach> --%>
					</div>
					<!-- 分页 -->
					<div class="col-md-4 col-md-offset-4 cpage" style="display:block;"></div>
				</div>
				<!-- 文章栏 -->
				<div role="tabpanel" class="tab-pane fade" id="aritcle">
					<!-- 文章列表 -->
					<div class="row aritcleRow"  id="listBox" data-model="content" style="margin-top: 5px;margin-right: 15px;margin-left: -15px;">
						<%-- <c:forEach items="${contents}" var="content">
							<div class="panel panel-default col-md-12">
								<div class="panel-body" style="padding:0;margin-top:0;margin-left: -15px;">
									<div class="col-md-2 pull-left" style="padding:0;height:120px;">
										<a href="${basePath}/content/detail/${content.id}.do" target="_blank">
											<img src="${basePath}${content.image}" class="img-responsive" alt="Responsive image" 
											style="height:120px"/>
										</a>
									</div> 
									<div class="col-md-10 pull-left" style="padding-right:0;">
										<h4 style="margin:2px 0 8px 0;">
											<a class="tag bg-blue" target="_blank" href="">${content.tag}</a>
											<a class="ellipsis title" href="" title="" target="_blank">${content.title}</a>
										</h4>
										<p>
											${content.description}
										</p>
										<div class="pull-left" style="line-height:30px;">
											<a class="u_headrpic pull-left" href="" title="" target="_blank">
												<img src="${basePath}${content.headerPic}" class="img-responsive img-circle pull-left" style="width:30px;height:30px;">
												<strong class="name pull-left" style="line-height:30px;font-size: 12px;color: #394a58;font-weight: bold;padding: 0 15px;">${content.userName}</strong>
											</a>
											<div class="msg pull-left">
												<span><i class="iconfont icon-eye"></i><em>${content.hits}</em></span>
												<span><i class="iconfont icon-comment"></i><em>${content.comments}</em></span>
												<span><i class="iconfont icon-zan"></i><em>${content.loves}</em></span>
											</div>
										</div>
										<div class="data">
											<i class="iconfont icon-time"></i>
											<fmt:formatDate value="${content.createTime}" dateStyle="medium"/>
										</div>
									</div>
								</div>
							</div>
						</c:forEach> --%>
					</div>
					<!-- 分页 -->
					<div class="col-md-4 col-md-offset-4 cpage" style="display:block;"></div>
				</div>
			</div>
		</div>
		<!--list end-->
		
	</div>
				<script type="text/javascript">
				function loading2(target,mark){
					$.loading({target:$(target),mark:1}); 
				};
				var indexMusic = {
					timer :null,
					ltimer :null,
					initPage:function(itemCount){
						$(".cpage").tzPage(itemCount, {
							num_edge_entries : 1, //边缘页数
							num_display_entries :4, //主体页数
							num_edge_entries:5,
							current_page:0,
							showGo:true,
							showSelect:true,
							items_per_page : 12, //每页显示X项
							prev_text : "前一页",
							next_text : "后一页",
							callback : function(pageNo,psize){//回调函数
								indexMusic.loadData(pageNo,psize);
							}
						});
					},
					loadData:function(pageNo,pageSize,callback){
						//var keyword = $("#keywords").val();
						//var model = $("#listBox").data("model");
						var $this = this;
						clearTimeout(this.ltimer);
						this.ltimer = setTimeout(function(){
							$.ajax({
								type:"post",
								beforeSend:function(){loading2($(".musicRow"),4);},
								url:basePath+"/music/template.do",
								data:{pageNo:pageNo*pageSize,pageSize:pageSize},
								success:function(data){
									//模板技术
									var $data = $(data);
									$(".musicRow").html($data);//追加元素到dom中
									$(".tmui-tips").tmTip();
									var itemCount = $data.find("#itemCount").val();
									//if(isNotEmpty(keyword))$this.highligter(keyword);
									if(callback)callback(itemCount);
								}
							});
						},300);
					}	
				}
				var indexContent = {
						timer :null,
						ltimer :null,
						initPage:function(itemCount){
							$(".cpage").tzPage(itemCount, {
								num_edge_entries : 1, //边缘页数
								num_display_entries :4, //主体页数
								num_edge_entries:5,
								current_page:0,
								showGo:true,
								showSelect:true,
								items_per_page : 10, //每页显示X项
								prev_text : "前一页",
								next_text : "后一页",
								callback : function(pageNo,psize){//回调函数
									indexContent.loadData(pageNo,psize);
								}
							});
						},
						loadData:function(pageNo,pageSize,callback){
							//var keyword = $("#keywords").val();
							//var model = $("#listBox").data("model");
							var $this = this;
							clearTimeout(this.ltimer);
							this.ltimer = setTimeout(function(){
								$.ajax({
									type:"post",
									beforeSend:function(){loading2($(".aritcleRow"),4);},
									url:basePath+"/content/template.do",
									data:{pageNo:pageNo*pageSize,pageSize:pageSize},
									success:function(data){
										//模板技术
										var $data = $(data);
										$(".aritcleRow").html($data);//追加元素到dom中
										$(".tmui-tips").tmTip();
										var itemCount = $data.find("#itemCount").val();
										//if(isNotEmpty(keyword))$this.highligter(keyword);
										if(callback)callback(itemCount);
									}
								});
							},300);
						}	
					}
				$(function(){
					$(".tmui-tips").tmTip();
					var count = $("body").data("count");
					indexMusic.initPage(count);
					indexMusic.loadData(0,12,function(count){
						indexMusic.initPage(count);
					});
					
					var itemCount = $("body").data("content");
					indexContent.initPage(itemCount);
					indexContent.loadData(0,10,function(itemCount){
						indexContent.initPage(itemCount);
					});
				});
				</script>
				<!-- 文章 -->
				<style>
					.iconfont{margin-right:6px;}
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
				
 
 <%@include file="/WEB-INF/pages/common/footer.jsp"%>
 <script type="text/javascript">
    /*初始化万年历 */
	initWnl();
    /*格式化时间*/
	function timeFormate(time){
		return time<10 ? "0" + time:time;
	};
	
	//关注列表分页
	function hyb(obj){
		var pageNo = 0;
		var pageSize = 2;
		var mark = true;
		var timer = null;
		clearTimeout(timer);
		timer = setTimeout(function(){
			if(!mark)return;
			pageNo++;
			var params={pageNo:pageNo*pageSize,pageSize:pageSize};
			$.ajax({
				type:"post",
				url:basePath+"/user/template.do",
				beforeSend:function(){loading2($(".f-list"),4);},
				data:params,
				success:function(data){
					if(data && data.length>0){
						var $data = $(data);
						$(".f-list").html($data);
					}else{
						loading("数据加载完毕",4);
						mark = false;
						hyb(obj).removeAttr("onclick");
					}
					
				}
			});
		},300);
	}
	
	//实例化编辑器
	var um = UM.getEditor("myEditor");
	
	//获得整个html的内容
	function getAllHtml(myEditor){
        return UM.getEditor(myEditor).getAllHtml();
    }
	
	//获取富文本编辑器的带有格式的文本
	function getPlainTxt(myEditor){
		return UM.getEditor(myEditor).getPlainTxt();
	}
	
	//获取富文本编辑器的纯文本内容
	function getEditText(myEditor){
		return UM.getEditor(myEditor).getContentTxt();
	}
	//给某个富文本框赋值
	function setEditorText(message,myEditor){
		 UM.getEditor(myEditor).setContent(message, false);//清空富文本编辑器
	}
	
	 /* 发表文章栏目  */
	 $(".fb_box .fb_aritcle").click(function(){
		 $(".editerBox").slideToggle();
	 });
	 $(".soup li").click(function(){
		 $(this).addClass("open").siblings().removeClass("open");
	 });
	
	/*发表文章*/
	function saveContent(obj){
		alert(1);
		var titleVal = $(".editer .txt_title").val();
		var contentVal = getPlainTxt("myEditor");
		var tagval = $(".editer p .input").val();
		if(!titleVal || !contentVal)return;
		var params = {title:titleVal,content:contentVal,tag:tagval};
		$.ajax({
			type:"post",
			url:basePath+"/content/save.do",
			data:params,
			beforeSend:function(){loading("文章发表中...",5);},
			success:function(data){
				loading("发表成功...",5);
				var data = data.trim();
				if(data == "fail" || data=="error"){
					alert("发表失败");
				}
				if(data == "success"){
					
					$(".editer .txt_title").val("");
					setEditorText("","myEditor");
					$(".editer p .input").val("");
					
					$(".editerBox").slideUp();
				}
			}
		}); 
	};
	/*文本编辑器 end*/
	
	
 </script>
 </body>
</html>

