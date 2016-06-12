<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>留言板</title>
<meta name="Author" content="king">
<meta name="Keywords" content="留言板">
<%@include file="/WEB-INF/pages/common/common.jsp"%>
<style type="text/css">
	*{margin:0;padding:0;}
	body{background:url("${basePath}/resources/imgs/share/bg.jpg")top center;font-size:12px;
	font-family:"微软雅黑";color:#666;background-attachment:fixed;overflow-x:hidden;}
	img{vertical-align:middle;}
	/*timeline start*/
	.wrap{width:100%;height:100%;margin-top:50px;}
	.wrap .timeline{width:691px;margin:0 auto;position:relative;}
	.wrap .timeline .t_line{width:5px;background:#ccc;position:absolute;left:30px;top:64px;}
	.wrap .timeline .t_send{width:700px;height:200px;}
	.wrap .timeline .t_send .t_header{float:left;}
	.wrap .timeline .t_send .t_header img{border-radius:33px;}
	.wrap .timeline .t_send .t_icon{width:13px;height:16px;float:left;margin: 27px 0 0 10px;}
	.wrap .timeline .t_send .t_box{width:600px;background:#fff;float:left;border-radius:5px;box-shadow:1px 1px 1em #333;position:relative;padding:10px 0;}
	.wrap .timeline .t_send .t_box .t_face{padding:0 10px;}
	.wrap .timeline .t_send .t_box .t_msg{width:540px;height:80px;border:1px solid #ccc;margin:0 auto;padding:10px;overflow:auto;} 
	.wrap .timeline .t_send .t_box .t_msg img{margin:2px;}
	.wrap .timeline .t_send .t_box .t_title{padding-bottom:10px;font-size:16px;text-align:center;font-weight:600;color:#999}
	.wrap .timeline .t_send .t_box .t_face_btn{float:left;margin: 15px 0 0 16px;}
	.wrap .timeline .t_send .t_box .t_send_btn{float:right;width:80px;height:32px;background:#F60;text-decoration:none;	text-align:center;line-height:32px;font-size:14px;color:#fff;margin:8px 20px 0 0;border-radius:3px;}
	.wrap .timeline .t_send .t_box .t_send_btn:hover{background:#F00;}
	.wrap .timeline .t_send .t_box .t_face_con{width:365px;border:1px solid #ccc;background:#fff;box-shadow: 1px 2px 6px 0px #000;position:absolute;left:24px;top:158px;padding:5px;display:none;z-index:1;}
	.wrap .timeline .t_send .t_box .t_face_con ul li{list-style:none;float:left;margin:2px;	cursor: pointer;}
	.wrap .timeline .t_all{width:1100px;position:relative;}
	.wrap .timeline .t_all .l_header{float:left;}
	.wrap .timeline .t_all .t_list{margin:30px 0;}
	.wrap .timeline .t_all .t_list .l_icon{width:13px;height:16px;float:left;margin:15px 0 0 10px;}
	.wrap .timeline .t_all .t_list .l_icon .icon-zuosanjiao{font-size:20px;color:#fff;}
	.wrap .timeline .t_all .t_list .l_header img{border-radius:33px;}
	.wrap .timeline .t_all .t_list .l_msg{position:relative;max-width:600px;min-height:36px;background:#fff;border-radius:10px;padding:14px 16px 30px 16px;font-size:14px;overflow:hidden;word-wrap:break-word;word-break:normal;}
	.timeline .t_all .t_list .l_msg .time{position:absolute;bottom:0;left:16px;}
	.clear{clear:both;}
	/*end timeline*/
</style>
</head>
<body>
<%@include file="/WEB-INF/pages/common/header.jsp"%>
<!--timeline start-->
<div class="wrap">
	<div class="timeline">
		<div class="t_line"></div>
		
		<div class="t_send">
			<div class="t_header">
				<img src="${basePath}/resources/imgs/header_pic/header_pic.jpg" alt="king" width="66" height="66"/>
			</div>
			<div class="t_icon"></div>
			
			<div class="t_box">
				<p class="t_title">意见反馈请留言!</p>
				<div class="t_msg" contenteditable="true"></div> 
				<p class="t_face">
					<a href="javascript:void(0);" class="t_face_btn">
						<img src="${basePath}/resources/imgs/face/cza_thumb.gif" alt="表情" width="22" height="22" />
						<span class="facemotion">表情</span>
					</a>
					<a href="javascript:void(0);" class="t_send_btn" onclick="saveResponse(this);">留 言</a>
				</p>
				<div class="t_face_con">
					<ul id="q_ul">
						<li><img src="${basePath}/resources/imgs/face/zz2_thumb.gif" title="[织]" width="22" height="22"></li>
						<li><img src="${basePath}/resources/imgs/face/horse2_thumb.gif" title="[神马]"></li>
						<li><img src="${basePath}/resources/imgs/face/fuyun_thumb.gif" title="[浮云]"></li>
						<li><img src="${basePath}/resources/imgs/face/geili_thumb.gif" title="[给力]"></li>
						<li><img src="${basePath}/resources/imgs/face/wg_thumb.gif" title="[围观]"></li>
						<li><img src="${basePath}/resources/imgs/face/vw_thumb.gif" title="[威武]"></li>
						<li><img src="${basePath}/resources/imgs/face/panda_thumb.gif" title="[熊猫]"></li>
						<li><img src="${basePath}/resources/imgs/face/rabbit_thumb.gif" title="[兔子]"></li>
						<li><img src="${basePath}/resources/imgs/face/otm_thumb.gif" title="[奥特曼]"></li>
						<li><img src="${basePath}/resources/imgs/face/j_thumb.gif" title="[囧]"></li>
						<li><img src="${basePath}/resources/imgs/face/hufen_thumb.gif" title="[互粉]"></li>
						<li><img src="${basePath}/resources/imgs/face/liwu_thumb.gif" title="[礼物]"></li>
						<li><img src="${basePath}/resources/imgs/face/smilea_thumb.gif" title="[呵呵]"></li>
						<li><img src="${basePath}/resources/imgs/face/tootha_thumb.gif" title="[嘻嘻]"></li>
						<li><img src="${basePath}/resources/imgs/face/laugh.gif" title="[哈哈]"></li>
						<li><img src="${basePath}/resources/imgs/face/tza_thumb.gif" title="[可爱]"></li>
						<li><img src="${basePath}/resources/imgs/face/kl_thumb.gif" title="[可怜]"></li>
						<li><img src="${basePath}/resources/imgs/face/kbsa_thumb.gif" title="[挖鼻屎]"></li>
						<li><img src="${basePath}/resources/imgs/face/cj_thumb.gif" title="[吃惊]"></li>
						<li><img src="${basePath}/resources/imgs/face/shamea_thumb.gif" title="[害羞]"></li>
						<li><img src="${basePath}/resources/imgs/face/zy_thumb.gif" title="[挤眼]"></li>
						<li><img src="${basePath}/resources/imgs/face/bz_thumb.gif" title="[闭嘴]"></li>
						<li><img src="${basePath}/resources/imgs/face/bs2_thumb.gif" title="[鄙视]"></li>
						<li><img src="${basePath}/resources/imgs/face/lovea_thumb.gif" title="[爱你]"></li>
						<li><img src="${basePath}/resources/imgs/face/sada_thumb.gif" title="[泪]"></li>
						<li><img src="${basePath}/resources/imgs/face/heia_thumb.gif" title="[偷笑]"></li>
						<li><img src="${basePath}/resources/imgs/face/qq_thumb.gif" title="[亲亲]"></li>
						<li><img src="${basePath}/resources/imgs/face/sb_thumb.gif" title="[生病]"></li>
						<li><img src="${basePath}/resources/imgs/face/mb_thumb.gif" title="[太开心]"></li>
						<li><img src="${basePath}/resources/imgs/face/ldln_thumb.gif" title="[懒得理你]"></li>
						<li><img src="${basePath}/resources/imgs/face/yhh_thumb.gif" title="[右哼哼]"></li>
						<li><img src="${basePath}/resources/imgs/face/zhh_thumb.gif" title="[左哼哼]"></li>
						<li><img src="${basePath}/resources/imgs/face/x_thumb.gif" title="[嘘]"></li>
						<li><img src="${basePath}/resources/imgs/face/cry.gif" title="[衰]"></li>
						<li><img src="${basePath}/resources/imgs/face/wq_thumb.gif" title="[委屈]"></li>
						<li><img src="${basePath}/resources/imgs/face/t_thumb.gif" title="[吐]"></li>
						<li><img src="${basePath}/resources/imgs/face/k_thumb.gif" title="[打哈气]"></li>
						<li><img src="${basePath}/resources/imgs/face/bba_thumb.gif" title="[抱抱]"></li>
						<li><img src="${basePath}/resources/imgs/face/angrya_thumb.gif" title="[怒]"></li>
						<li><img src="${basePath}/resources/imgs/face/yw_thumb.gif" title="[疑问]"></li>
						<li><img src="${basePath}/resources/imgs/face/cza_thumb.gif" title="[馋嘴]"></li>
						<li><img src="${basePath}/resources/imgs/face/88_thumb.gif" title="[拜拜]"></li>
						<li><img src="${basePath}/resources/imgs/face/sk_thumb.gif" title="[思考]"></li>
						<li><img src="${basePath}/resources/imgs/face/sweata_thumb.gif" title="[汗]"></li>
						<li><img src="${basePath}/resources/imgs/face/sleepya_thumb.gif" title="[困]"></li>
						<li><img src="${basePath}/resources/imgs/face/sleepa_thumb.gif" title="[睡觉]"></li>
						<li><img src="${basePath}/resources/imgs/face/money_thumb.gif" title="[钱]"></li>
						<li><img src="${basePath}/resources/imgs/face/sw_thumb.gif" title="[失望]"></li>
						<li><img src="${basePath}/resources/imgs/face/cool_thumb.gif" title="[酷]"></li>
						<li><img src="${basePath}/resources/imgs/face/hsa_thumb.gif" title="[花心]"></li>
						<li><img src="${basePath}/resources/imgs/face/hatea_thumb.gif" title="[哼]"></li>
						<li><img src="${basePath}/resources/imgs/face/gza_thumb.gif" title="[鼓掌]"></li>
						<li><img src="${basePath}/resources/imgs/face/dizzya_thumb.gif" title="[晕]"></li>
						<li><img src="${basePath}/resources/imgs/face/bs_thumb.gif" title="[悲伤]"></li>
						<li><img src="${basePath}/resources/imgs/face/crazya_thumb.gif" title="[抓狂]"></li>
						<li><img src="${basePath}/resources/imgs/face/h_thumb.gif" title="[黑线]"></li>
						<li><img src="${basePath}/resources/imgs/face/yx_thumb.gif" title="[阴险]"></li>
						<li><img src="${basePath}/resources/imgs/face/nm_thumb.gif" title="[怒骂]"></li>
						<li><img src="${basePath}/resources/imgs/face/hearta_thumb.gif" title="[心]"></li>
						<li><img src="${basePath}/resources/imgs/face/unheart.gif" title="[伤心]"></li>
						<li><img src="${basePath}/resources/imgs/face/pig.gif" title="[猪头]"></li>
						<li><img src="${basePath}/resources/imgs/face/ok_thumb.gif" title="[ok]"></li>
						<li><img src="${basePath}/resources/imgs/face/ye_thumb.gif" title="[耶]"></li>
						<li><img src="${basePath}/resources/imgs/face/good_thumb.gif" title="[good]"></li>
						<li><img src="${basePath}/resources/imgs/face/no_thumb.gif" title="[不要]"></li>
						<li><img src="${basePath}/resources/imgs/face/z2_thumb.gif" title="[赞]"></li>
						<li><img src="${basePath}/resources/imgs/face/come_thumb.gif" title="[来]"></li>
						<li><img src="${basePath}/resources/imgs/face/sad_thumb.gif" title="[弱]"></li>
						<li><img src="${basePath}/resources/imgs/face/lazu_thumb.gif" title="[蜡烛]"></li>
						<li><img src="${basePath}/resources/imgs/face/clock_thumb.gif" title="[钟]"></li>
						<li><img src="${basePath}/resources/imgs/face/cake.gif" title="[蛋糕]"></li>
						<li><img src="${basePath}/resources/imgs/face/m_thumb.gif" title="[话筒]"></li>
						<li><img src="${basePath}/resources/imgs/face/weijin_thumb.gif" title="[围脖]"></li>
						<li><img src="${basePath}/resources/imgs/face/lxhzhuanfa_thumb.gif" title="[转发]"></li>
						<li><img src="${basePath}/resources/imgs/face/lxhluguo_thumb.gif" title="[路过这儿]"></li>
						<li><img src="${basePath}/resources/imgs/face/bofubianlian_thumb.gif" title="[bofu变脸]"></li>
						<li><img src="${basePath}/resources/imgs/face/gbzkun_thumb.gif" title="[gbz困]"></li>
						<li><img src="${basePath}/resources/imgs/face/boboshengmenqi_thumb.gif" title="[生闷气]"></li>
						<li><img src="${basePath}/resources/imgs/face/chn_buyaoya_thumb.gif" title="[不要啊]"></li>
						<li><img src="${basePath}/resources/imgs/face/daxiongleibenxiong_thumb.gif" title="[dx泪奔]"></li>
						<li><img src="${basePath}/resources/imgs/face/cat_yunqizhong_thumb.gif" title="[运气中]"></li>
						<li><img src="${basePath}/resources/imgs/face/youqian_thumb.gif" title="[有钱]"></li>
						<li><img src="${basePath}/resources/imgs/face/cf_thumb.gif" title="[冲锋]"></li>
						<li><img src="${basePath}/resources/imgs/face/camera_thumb.gif" title="[照相机]"></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="t_all"></div>
		<div class="clear"></div>

	</div>
</div>
<!--end timeline-->
<%@include file="/WEB-INF/pages/common/footer.jsp"%>
<script type="text/javascript">
/*格式化时间*/
function timeFormate(time){
	return time<10 ? "0" + time:time;
};

var wH = 0;
$(window).scroll(function(e){
	var scrollTop = $(this).scrollTop();
	var allHeight = $(".t_all").height();
	scrollTop = allHeight+140;
	$(".t_line").height(scrollTop);
	
});

$(function(){
	
	var wH = $(window).height();
	$(".t_line").height(wH-130);

	// 初始化
	//var message = sessionStorage.getItem("message");
	var message = localStorage.getItem("message");
	if(message){
		$(".t_all").html(message);
	}
	// 点击显示表情
	$(".t_face_btn").click(function(e){
		$(".t_face_con").toggle(500);
		e.stopPropagation();
	});
	// 选中QQ表情添加到文本框
	$("#q_ul").find("li").click(function(){
		var img = $(this).find("img").clone();
		$(".t_msg").append(img);
	});
	// 点击发布
	$(".t_send_btn").click(function(){
		$(".t_face_con").hide(500);
		var content = $(".t_msg").html();
		if(content == ""){
			$(".t_msg").focus();
			return;
		}
		var year = new Date().getFullYear();
		var month = new Date().getMonth()+1;
		var day = new Date().getDate();
		var hours = new Date().getHours();
		var minutes = new Date().getMinutes();

		$(".t_all").prepend("<div class='t_list animated bounceIn'>"+
				"	<div class='l_header'><img src='${basePath}${sessionScope.userHeaderPic}' width='66' height='66'/></div>"+
				"	<div class='l_icon'><i class='iconfont icon-zuosanjiao'></i></div>"+
			    "	<div class='l_msg'>"+$('.t_msg').html()+
				"		<span class='time'>"+year+"-"+timeFormate(month)+"-"+timeFormate(day)+"&nbsp;"+timeFormate(hours)+":"+timeFormate(minutes)+"</span>"+
				"	</div>"+
				"</div>");
		// 存储到浏览器session中，浏览器关闭，即消失
		//sessionStorage.setItem("message",$(".t_all").html());

		$(".t_msg").text("");
		$(".t_msg").focus();

		// 本地存储，浏览器关闭仍然存在
		localStorage.setItem("message",$(".t_all").html());
		//localStorage.removeItem("message");
	});
});
$(document).click(function(){
	$(".t_face_con").hide(500);
});

</script>
</body>
</html>
