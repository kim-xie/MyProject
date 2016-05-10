<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!doctype html>
<html>
 <head>
  <title>king的博客</title>
  <meta charset="UTF-8">
  <meta name="Author" content="king">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <%@include file="/WEB-INF/pages/common/common.jsp"%>
  <style type="text/css">
	*{padding:0;margin:0;}
	a{text-decoration:none;}
	ul,ol li{list-style:none;}
	body{font-size:12px;font-family:"微软雅黑";background:#EDEDEF;}

	/*个人信息栏目  start*/
	.person{width:100%;margin-bottom:30px;}
	.person .user{width:1000px;height:100%;margin:0 auto;background:#fff;overflow:hidden;}
	/* userbox */
	.person .user .userbox{width:240px;height:100%;float:left;margin-right:50px;background:#fafafa;}
	.person .user .userbox .u_info{padding:5px 80px;width:80px;height:80px;display:block;}
	.person .user .userbox .u_info img{width:80px;height:80px;border-radius:50%;vertical-align:middle;}
	.person .user .userbox .name{color:#4c4c4c;font-size:26px;transition:1s;margin:10px 88px;}
	.person .user .userbox .name:hover{color: #828d95;transition:1s;}
	.person .user .userbox .info_list{width:240px;height:48px;margin:15px 0 20px 0;}
 	.person .user .userbox .info_list li{float:left;width:78px;color:#414141;line-height:26px;font-size:16px;text-align:center;}
 	.person .user .userbox .info_list li span{color:#8a8880;line-height:22px;display:block;}
 	/* fansbox */
 	.person .user .fansbox{width:240px;height:100%;float:right;background:#fafafa;margin-left:50px;}
 	.person .user .fansbox h3{padding:0 15px;line-height:39px;border-bottom:1px solid #eee;}
 	.person .user .fansbox h3 span{font-size:14px;color:#414141;}
 	.person .user .fansbox h3 .fans-change{float:right;position:relative;padding-left:10px;color:#8a8880;font-size:12px;}
 	.person .user .fansbox h3 .fans-change i{margin-right:6px;}
 	.person .user .fansbox ul li{display:block;width:170px;height:50px;padding:17px 45px 16px 25px;border-bottom:1px solid #eee;}
 	.person .user .fansbox ul li .fans-ava{float:left;position:relative;margin:0px 10px;}
 	.person .user .fansbox ul li .fans-ava img{width:50px;height:50px;border-radius:50%;}
	.person .user .fansbox ul li .fans-r{float:right;}
	.person .user .fansbox ul li .fans-r .fans-name{text-align:center;display:block;font-size:12px;line-height:18px;color:#414141;font-weight:bold;width:90px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
	.person .user .fansbox ul li .fans-r .fans-add{cursor:pointer;display:block;margin-top:8px;height:22px;border:1px solid #d8d6d0;text-align:center;line-height:22px;color:#414141;font-size:12px;}
	.person .user .fansbox ul li .fans-r .fans-add:hover{border-color:#414141;}
	/* calebox */
	.person .user #calebox{width:420px;float:left;background:#fafafa;}
	.person .user #calebox .caleheader{height:35px;background:#fafafa;line-height:35px;color:#4c4c4c;border-bottom:1px solid #eee;position:relative;}
	.person .user #calebox .caleheader #prev,#next{position:absolute;top:0;font-size:30px;cursor:pointer;}
	.person .user #calebox .caleheader #prev:hover{color:#00f;}
	.person .user #calebox .caleheader #next:hover{color:#00f;}
	.person .user #calebox .caleheader #prev{left:2px;}
	.person .user #calebox .caleheader #next{right:2px;}
	.person .user #calebox .caletab{width:100%;border-collapse:collapse}
	.person .user #calebox .caletab thead th{background:#fafafa;color:#4c4c4c}
	.person .user #calebox .caletab th,td{border:1px solid #eee;text-align:center;padding:6px 4px;transition:all 0.3s ease-in-out;}
	.person .user #calebox .caletab td:hover{background:#999;color:#00f;cursor:pointer;transition:all 0.3s ease-in-out;}
	.person .user #calebox .caletab td.noon{color:#999;}
	.person .user #calebox .caletab td.on{color:#fafafa;background:#0066ff;}
	.person .user #time{position:absolute;right:20%;top:2px;font-size:14px;font-weight:700;color:#4c4c4c;}
	.person .user #cale{position:absolute;left:20%;top:2px;font-size:14px;font-weight:700;color:#4c4c4c;}
	/*个人信息栏目  end*/
	
	/* 发表文章栏目   start */
    .fb_box{width:1005px;height:50px;overflow:hidden;margin:30px auto;background:#fff;}
	.fb_box .soup{position:relative;float:right;width:auto;height:40px;padding:0 120px 0 20px;background-color:#fff7e7;border-radius:20px;box-shadow:1px 1px 2px rgba(0,0,0,.2);margin-top:5px;}
	.fb_box .soup li i{position:absolute;font-size:28px;color:#eae1d0;cursor:pointer;}
	.fb_box .soup li .txt{display:none;line-height:40px;font-size:14px;color:#6b3612;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:550px;}
	.fb_box .soup li.open .txt{display:block;}
	.fb_box .soup li.open i{color:#e67e22;}
	.fb_box .soup li i.icon-warn{right:80px;top:5px;font-size:31px;margin-left:10px;}
	.fb_box .soup li i.icon-iconfontaixin{right:46px;top:3px;}
	.fb_box .soup li i.icon-gonggao{right:10px;top:5px;}
	.fb_box span{display:block;background:#fff7e7;float:left;border-radius:10px;line-height:30px;cursor:pointer;font-size:20px;font-weight:600;color:#6b3612;margin-top:5px;padding:5px 8px;}
	.fb_box span .icon-add{font-size:24px;font-weight:600;color:#6b3612;margin-right:5px;}
 	/* 发表文章栏目   end */

	/*banner start*/
	#banner{width:1005px;height:300px;overflow:hidden;margin:30px auto;}
	#banner ul{width:1000%;}
	#banner ul li{width:200px;height:300px;border-left:1px solid #fff;position:relative;transition:1.6s ease;float:left;}
	#banner ul li img{height:300px;width:800px;}
	#banner ul li h2{position:absolute;left:0;bottom:0px;width:100%;height:100%;cursor:pointer;background:rgba(0,0,0,0.5);font-size:16px;text-align:center;line-height:300px;transition:1.6s ease;color:#fff;}
	#banner ul li .over{position:absolute;left:0;bottom:0px;width:100%;height:100%;}
	#banner ul:hover li{width:50px;}
	#banner ul:hover .over{transition:1.6s ease;background:rgba(0,0,0,0.3);}
	#banner ul li:hover{width:800px;transition:1.6s ease;}
	#banner ul li:hover h2{transition:1.6s;height:40px;color:#fff;line-height:40px;}
	#banner ul li:hover .over{z-index:-1;}
	/*banner end*/

	/*文本编辑器 start*/
	.editerBox{width:100%;margin:30px 0;display:none;}
	.input{width:400px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
	.editerBox .editer{width:1000px;height:100%;margin:0 auto;background:#fff;overflow:hidden;}
	.editerBox .editer .title{width:600px;height:30px;margin:10px auto;display:block;font-size:18px;font-weight:600;}
	.editerBox .editer .title input{width:500px;height:30px;font-size:16px;font-weight:600;text-indent:0.5em;}
	.editerBox .editer .edui-container{width:800px;margin:10px auto;overflow-x:hidden;overflow-y:auto;height:400px;}
	.editerBox .editer p{width:800px;font-size:14px;font-weight:600;margin:20px auto;}
	.editerBox .editer p .fabiao{float:right;height:30px;line-height:30px;margin-right:.1%;}
	.editerBox .editer p .fabiao .tip{padding-right:10px;font-size:14px;font-weight:600;color:#999;}
	.editerBox .editer p .fabiao .submit{padding:9px;outline:none;border:none;background:#0033ff;transition:1s;border-radius:5px;cursor:pointer;font-size:14px;font-weight:600;color:#fff;}
	.editerBox .editer p .fabiao .submit:hover{background:#0033cc;transition:1s;}
	/*文本编辑器 end*/

	/*--main start--*/
	.box{width:1000px;overflow:hidden;margin:0 auto;padding-bottom:25px;background:#fff;}
	.box .contents{margin:40px;}
	.box .contents:after{content:"";clear:both;display:block;}
	.box .contents .side{width:84px;float:left;}
	.box .contents .side .day a{width:70px;height:70px;display:block;border-radius:50%;border:5px solid #828d95;color:#828d95;font-size:40px;text-align:center;line-height:70px;margin-bottom:6px;}
	.box .contents .side .day a:hover{color:#330066;border:5px solid #330066;}
	.box .contents .side .month a:hover{color:#330066;}
	.box .contents .side .month a{font-weight:600;display:block;color:#c0c0c0;font-size:24px;text-align:center;}
	.box .contents .main{width:770px;border-bottom:4px dashed #ccffcc;float:right;}
	.box .contents .main .conts{width:100%;margin-bottom:20px;}
	.box .contents .main .conts h2{padding:10px 0;width:100%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;}
	.box .contents .main .conts h2 a{width:100%;color:#737373;font-size:26px;}
	.box .contents .main .conts .contentsBox{margin-bottom:15px;line-height:26px;width:100%;font-size:16px;word-break:break-word;}
	.box .contents .main .link{width:100%;}
	.box .contents .main .link a{margin-right:15px;font-size:16px;color:#737373;}
	.box .contents .main .link a:hover{color:#000033;}
	.box .contents .main .link a i{font-size:20px;margin-right:5px;}
	.box .contents .main .coment{width:100%;margin:15px 0;}
	.box .contents .main .coment .c_info{position:relative;margin-bottom:10px;}
	.box .contents .main .coment .c_info .header_pic{width:40px;height:40px;display:inline-block;}
	.box .contents .main .coment .c_info img{width:40px;height:40px;border-radius:50%;vertical-align:middle;}
	.box .contents .main .coment .c_info .name{font-size:16px;color:#4c4c4c;}
	.box .contents .main .coment .c_info .time{left:42px;top:30px;position:absolute;}
	.box .contents .main .pl{width:100%;height:40px;border:1px solid gray;margin-bottom:50px;display:inline-block;position:relative;}
	.box .contents .main .pl .fb{width:100px;height:100%;background:#009900;float:right;line-height:40px;text-align:center;cursor:pointer;font-size:16px;font-weight:600;color:#fff;transition:1s;}
	.box .contents .main .pl .fb:hover{background:#00cc00;transition:1s;}
	.box .contents .main .pl .pl_txt{width:640px;height:100%;border:none;text-indent:1em;font-size:16px;font-weight:600;outline:none;position:absolute;left:0;top:0;}
	.box .contents .main .pl .clear{width:30px;display:inline-block;height:100%;text-align:center;line-height:40px;position:absolute;right:100px;top:0;}
	.box .contents .main .pl .icon-clear{font-size:25px;cursor:pointer;transition:1s;color:#999;}
	.box .contents .main .pl .icon-clear:hover{transform:rotate(360deg);transition:1s;color:#cc0000;}
	/*--main end--*/
	
	/*滚动条兼容*/
	::-webkit-scrollbar{width:10px;height:6px;background:#ccc;}
	::-webkit-scrollbar-button{background-color:#e5e5e5;}
	::-webkit-scrollbar-track{background:#999;}
	::-webkit-scrollbar-track-piece{background:#ccc}
	::-webkit-scrollbar-thumb{background:#666;}
	::-webkit-scrollbar-corner{background:#82AFFF;}
	::-webkit-scrollbar-resizer{background:#FF0BEE;}
	scrollbar{-moz-appearance:none !important;background:rgb(0,255,0) !important;}
	scrollbarbutton{-moz-appearance:none !important;background-color:rgb(0,0,255) !important;}
	scrollbarbutton:hover{-moz-appearance:none !important;background-color:rgb(255,0,0) !important;}

  </style>
  <link rel="stylesheet" type="text/css" href="${basePath}/resources/js/umeditor/themes/default/css/umeditor.css">
  <script type="text/javascript" src="${basePath}/resources/js/wnl/wnl.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="${basePath}/resources/js/umeditor/umeditor.js"></script>
 </head>
 
 <body style="overflow-y:auto;overflow-x:hidden;">
 <%@include file="/WEB-INF/pages/common/header.jsp"%>
 <%@include file="/WEB-INF/pages/common/left.jsp"%>
 
 <!--banner start-->
 <div id="banner">
	<ul id="list">
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/banner/01.jpg"/>
			</a>
			<h2>付出不亚于任何人的努力</h2>
			<div class="over"></div>
		</li>
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/banner/02.jpg" />
			</a>
			<h2>每个牛逼的瞬间都是要经过菜鸟的过程</h2>
			<div class="over"></div>
		</li>
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/banner/03.jpg" />
			</a>
			<h2>人之所以能是相信自己能</h2>
			<div class="over"></div>
		</li>
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/banner/04.jpg" />
			</a>
			<h2>如果奇迹没有出现那么就去创造一个</h2>
			<div class="over"></div>
		</li>
		<li>
			<a href="javascript:void(0);">
				<img src="${basePath}/resources/imgs/banner/05.jpg" />
			</a>
			<h2>要想飞得高就该把地平线忘掉</h2>
			<div class="over"></div>
		</li>
	</ul>
 </div>
 <!--banner end-->
 
 <!--个人信息 start-->
 <div class="person">
 	<div class="user">
 		<!-- userbox -->
 		<div class="userbox">
			<span class="u_info">
				<a href="javascript:void(0)">
					<img src="${basePath}/resources/imgs/header_pic/header_pic.jpg" alt="头像" onclick="window.open(basePath+'/user/toPerson.do')">
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
		<!-- fansbox -->
		<div class="fansbox">
		    <h3>
			    <span>可能感兴趣的人</span>
			    <a href="javascript:void(0);" class="fans-change"><i class="iconfont icon-shuanxin"></i>换一批</a>
		    </h3>
			<ul class="f-list">
			    <li style="display: list-item;">
					<a class="fans-ava" target="_blank" href="spadeli">
						<img src="${basePath}/resources/imgs/header_pic/header_pic.jpg">
					</a>
					<div class="fans-r">
						<a class="fans-name" target="_blank" href="spadeli">kings</a>
						<a class="fans-add" data="10039">+ 关注</a>
					</div>
				</li>
				
				<li style="display: list-item;">
					<a class="fans-ava" target="_blank" href="spadeli">
						<img src="${basePath}/resources/imgs/header_pic/header_pic.jpg">
					</a>
					<div class="fans-r">
						<a class="fans-name" target="_blank" href="spadeli">小黑桃</a>
						<a class="fans-add" data="10039">+ 关注</a>
					</div>
				</li>
			</ul>
		</div>
		<!-- calebox -->
		<div id="calebox">
			<div class="caleheader">
				<span id="prev">&lt;</span>
				<span id="cale">
					<span id="y"></span>
					<span id="m"></span>
				</span>
				<span id="time"></span>
				<span id="next">&gt;</span>
			</div>
			<table class="caletab">
				<thead id="theadweek"></thead>
				<tbody id="tbodybox"></tbody>
			</table>
		</div>
		
	</div>
 </div>
 <!--个人信息 end-->
 
 <!-- 发表文章栏目   start -->
 <div class="fb_box">
 	<span class="fb_aritcle"><i class="iconfont icon-add"></i>发表文章</span>
 	<ul class="soup">
	 	<li class="">
		 	<i class="iconfont icon-warn" title="更新"></i>
		 	<a class="txt" href="/system.html" target="_blank"> 更新：上传作品明细增添字体设计一栏！欢迎大家上传~ </a>
	 	</li>
	 	<li class="open">
		 	<i class="iconfont icon-iconfontaixin" title="鸡汤"></i>
		 	<a class="txt" href="/soup.html" target="_blank"> 鸡汤：将来的你一定会感谢现在努力拼命的自己~ </a>
	 	</li>
	 	<li class="">
		 	<i class="iconfont icon-gonggao" title="公告"></i>
		 	<a class="txt" href="/site.html" target="_blank"> 公告：king将从0点至明早7点进行数据库优化，平台将无法访问，造成不便敬请谅解！ </a>
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
	<!-- 	<div class="edui-container" id="myEditor" maxlength="200"></div> -->
		<script id="myEditor" type="text/plain" style="width:800px;height:400px;overflow-x:hidden;"></script>
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
 	<c:forEach item="${content}" var="content">
 		<tr>
 			<td>${content.getTitle()}</td>
 		</tr>
 	</c:forEach>
	 <div class="contents">
		<div class="side">
			<div class="day"><a href="javascript:void(0)">09</a></div>
			<div class="month"><a href="javascript:void(0)">05</a></div>
		</div>
		<div class="main">
			<div class="conts">
				<div class="text">
					<h2>
						<a href="javascript:void(0)">2016年4月全球浏览器市场份额：Chrome终登冠军宝座</a>
					</h2>
					<div class='contentsBox'>摘要： 根据市场研究公司 Net Applications 的最新数据显示：本月冠亚军终于逆转，Chrome 浏览器势不可挡地登上了全球浏览器市场份额的首位，而其他位置则变化不大，整体市场份额仍由前五大浏览器瓜分。市场研究公司Net Applications每月都会对外公布操作系统与浏览器的市场份额统计，方便我们了解当前的PC操作系统市场分布情况以及相关趋势。本月全球浏览器市场的冠亚军终于易位，Chrome浏览器以41.71%的市场份额攫取了冠军宝座。不过在关注者看来，这一幕显然毫无悬念，随着Chrome的一路看涨，获取冠军也是迟早之事。再加上Chrome浏览器的份额较上月增长了2.62%；与此同时IE浏览器的总份额跌到了41.33%，较上月减少了2.07%，此消彼长之下，易位也是水到渠成之事。不过，尽管冠亚军上演了激烈的竞争，浏览器市场份额的第三、第四与第五名却波澜不惊，相对比较稳定：其中Firefox和Safari较上月轻微下滑，市场份额分别为10.06%与4.47%；而第五名的Opera浏览器则略有上涨，本月为2.01%。除了这五大主流浏览器之外，其余浏览器的市场份额均不足1%。前十名中微软有4个版本上榜，其中占有市场份额最多的是IE 11，达到21.39%，较上月略有下滑；排名第三和第四的IE10和IE8，市场份额分别为6.09%及5.95%；排名第六的Edge13继续看涨，份额为4.13%；而上月在榜的IE9则跌到了2.28%，掉出榜外。Chrome有四个版本上榜，其中排名第二的Chrome49占额20.7%，较上月涨了7个点有多；而上月位居第三的Chrome48则从11.33%迅速跌至0.95%，已掉出榜外；Chrome的其它三个上榜版本则分别列居第七到第九，总计份额为7.9%。另外Firefox仅一个版本上榜，占比5.44%；Safari 9.1位居末位，份额为2.3%。（文/孙薇 责编/钱曙光）
					</div>
					<p><img src="http://img.blog.csdn.net/20160504233245886"><br>
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
				<p class="c_info">
					<a href="javascript:void(0)" class="header_pic">
						<img src="${basePath}/resources/imgs/header_pic/header_pic.jpg" alt="头像">
					</a>
					<a href="javascript:void(0)" class="name"><%=request.getSession().getAttribute("userName")%> <b>:</b> </a>
					<span class="con">好样的！看好你哦！棒棒哒！</span>
					
					<span class="time">
						<span class="hours">15</span>
						<b>:</b>
						<span class="mins">30</span>
					</span>	
				</p>
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
 <%@include file="/WEB-INF/pages/common/footer.jsp"%>
 <script type="text/javascript">
    /*初始化万年历 */
	initWnl();
    /*格式化时间*/
	function timeFormate(time){
		return time<10 ? "0" + time:time;
	};
	//实例化编辑器
	var um = UM.getEditor("myEditor");
	
	/*文本编辑器 start*/
	/* $("#myEditor").keyup(function(){
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
	}); */
	
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
	 $(".fb_box .soup li").click(function(){
		 $(this).addClass("open").siblings().removeClass("open");
	 });
	
	/*发表文章*/
	$(".editerBox .editer p .fabiao .submit").click(function(){
		var titleVal = $(".editer .txt_title").val();
		var contentVal = getPlainTxt("myEditor");
		var tagval = $(".editer p .input").val();
		if(!titleVal || !contentVal)return;
		var params = {title:titleVal,content:contentVal,tag:tagval};
		$.ajax({
			type:"post",
			url:basePath+"/content/save.do",
			data:params,
			success:function(data){
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
						"				<div class='contentsBox'>"+contentVal+"</div>"+
//						"				<p><img src='${basepath}/resources/imgs/1.jpg'><br>"+
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
					
					$(".editerBox").slideUp();
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
		"		<img src='${basePath}/resources/imgs/header_pic/header_pic.jpg' alt='头像'>"+
		"	</a>"+
		"	<a href='javascript:void(0)' class='name'>"+<%=request.getSession().getAttribute("userName")%>+" <b>:</b> </a>"+
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

