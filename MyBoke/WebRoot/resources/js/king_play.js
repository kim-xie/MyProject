//页面播放器业务
var Play = {
	init:function(){
		$(".ke_op").on("click",function(){
			var $i=$(this).find("i");
			$i.toggleClass("icon-play icon-pause");
			var field = $i.hasClass("icon-pause")?"play":"stop";
			Audio[field]();
			$(".ke_op").toggleClass("r");
		});
	}
};


$(function(){
	//播放器初始化
	Audio.init(function(ok,ftime,percent){
		$("#"+(ok?"time":"ptime")).html(ftime);
		if(!ok){
			$("#percent").html((percent+"%"));
			$(".p_over").width(percent+"%");
		}
	});
	//业务功能初始化
	Play.init();
});