
/*损坏图片的处理方案*/
$(function(){
	$("img").on("error",function(){
		$(this).attr("src",basePath+"/resources/imgs/error/noimage.gif");
	});
	
	keRealtion.init();
	keRealtion.load();
	keRealtion.loadComment();
});

var keRealtion = {
	init:function(){
		if(window.localStorage){
			var opid = $("body").data("opid");
			var text = localStorage.getItem("king_detail_"+opid);
			$("#content").val(text);
		}
	},
	load:function(){
		var typeId = $("body").data("typeid");
		var filterId = $("body").data("opid");
		$.ajax({
			type:"post",
			data:{filterId:filterId,typeId:typeId},
			url:basePath+"/music/relation.do",
			success:function(data){
				var html = "";
				if(data!=null && data.length>0){
					for(var i=0,len=data.length;i<len;i++){
						html+="<div class='col-xs-6 col-md-3 pull-left relationPic'>"+
								" 	<a href='"+basePath+"/music/detail/"+data[i].id+".do' class='thumbnail'>"+
								"		<img src='"+basePath+"/"+data[i].img+"' alt='"+data[i].title+"'>"+
								"	</a>"+
								"</div>"+
								"<div class='clearfix visible-xs-block'></div>";
						//html+="<li><a href='"+basePath+"/music/detail/"+data[i].id+".do'><img src='"+basePath+"/"+data[i].img+"' alt='"+data[i].title+"' /></a><a href='"+basePath+"/blog/detail/"+data[i].id+".do' class='rp_t'>"+data[i].title+"</a></li>";
					}
					var slen = 4 - data.length;
					for(var j=0;j<slen;j++){
						html+="<div class='col-xs-6 col-md-3 pull-left relationPic'>"+
						" 	<a href='javascript:void(0)' class='thumbnail'>"+
						"		<img src='"+basePath+"'/resources/imgs/error/noimage.gif' alt='暂无图片'>"+
						"	</a>"+
						"</div>"+
						"<div class='clearfix visible-xs-block'></div>";
					}
				}else{
					$(".relationPic").remove();
				}
				$(".relation .row").html(html);
				
			}
		});
	},
	mark:true,
	saveComment:function(obj){
		if(!keRealtion.mark)return;
		var userName = $("#username").text();
		if(isEmpty(userName)){
			loading("您还未登录...",5);
			return false;
		}
		var description = $("#content").val();
		var musicId = $("body").data("opid");
		if(isEmpty(description)){
			tzMessage.tip("请输入评论信息...");
			$("#content").focus();
			return;
		}
		//清空并且获取焦点
		$("#content").val("").focus();
		keRealtion.mark = false;
		$(obj).removeAttr("onclick").find(".text").text("发表中");
		$.ajax({
			type:"post",
			data:{description:description,musicId:musicId},
			url:basePath+"/comment/save.do",
			success:function(data){
				$(".comments").prepend("<li class='list-group-item' style='padding:0;border:none;'>"+
							"<div class='col-md-1 headerPic'>"+
							"	<a href='#' class='thumbnail pull-left'>"+
							"		<img src='basePath+sessionScope.userHeaderPic' class='img-responsive img-circle' alt='Responsive image' height='50' width='50'>"+
							"	</a>"+
							"</div>"+
							"<div class='col-md-11' style='padding-right:0;'>"+
							"	<p>"+
							"		<span class='name'><a href=''>"+username+"</a></span> "+
							"		<span class='plTime pull-right' style='color: #bdbdbd;'>"+
							"			<span class='glyphicon glyphicon-time fs16' aria-hidden='true'>"+
							"			</span>刚刚"+
							"		</span>"+
							"	</p>"+
							"	<p class='text'>"+description+
							"	</p>"+
							"	<p class='replay' data-opid='"+data.id+"'>"+
							"		<span class='glyphicon glyphicon-comment fs16' aria-hidden='true'>"+
							"		</span>回复"+
							"	</p>"+
							"</div>"+
						    "</li>");
				keRealtion.mark = true;
				$(obj).attr("onclick","keRealtion.saveComment(this)").find(".text").text("发表评论");
				if(window.localStorage){
					var opid = $("body").data("opid");
					localStorage.removeItem("king_detail_"+opid);
				}
			}
		});
	},
	timer:null,
	loadComment:function(){
		clearTimeout(this.timer);
		this.timer = setTimeout(function(){
			var musicId = $("body").data("opid");
			$.ajax({
				type:"post",
				data:{musicId:musicId},
				url:basePath+"/comment/load.do",
				success:function(dataArr){
					if(dataArr){
						var html = "";
						for(var i=0,len=dataArr.length;i<len;i++){
							var data = dataArr[i];
							html+="<li class='list-group-item' style='padding:0;border:none;'>"+
							"<div class='col-md-1 headerPic'>"+
							"	<a href='#' class='thumbnail pull-left'>"+
							"		<img src='"+basePath+data.headerPic+"' class='img-responsive img-circle' alt='Responsive image' height='50' width='50'>"+
							"	</a>"+
							"</div>"+
							"<div class='col-md-11' style='padding-right:0;'>"+
							"	<p>"+
							"		<span class='name'><a href=''>"+data.username+"</a></span> "+
							"		<span class='plTime pull-right' style='color: #bdbdbd;'>"+
							"			<span class='glyphicon glyphicon-time fs16' aria-hidden='true'>"+
							"			</span>"+data.createTime+
							"		</span>"+
							"	</p>"+
							"	<p class='text'>"+data.description+
							"	</p>"+
							"	<p class='replay' data-opid='"+data.id+"'>"+
							"		<span class='glyphicon glyphicon-comment fs16' aria-hidden='true'>"+
							"		</span>回复"+
							"	</p>"+
							"</div>"+
						    "</li>";
						}
						$(".comments").append(html);
					}
				}
			});
		},200);
	},
	setCacheData:function(obj){
		var val = obj.value;
		if(isNotEmpty(val)){
			if(window.localStorage){
				var opid = $("body").data("opid");
				localStorage.setItem("king_detail_"+opid, val);
			}
		}
	}
};