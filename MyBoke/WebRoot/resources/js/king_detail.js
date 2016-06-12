/*损坏图片的处理方案*/
$(function(){
	$("img").on("error",function(){
		$(this).attr("src",basePath+"/resources/imgs/error/noimage.gif");
	});
	keRealtion.init();
	keRealtion.load();
	keRealtion.loadComment(0,5);
});

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
// 加载评论内容
var pageNo = 0;
function loadMore(obj){
	pageNo++;
	keRealtion.loadComment(pageNo,5);
	document.body.scrollTop = document.body.scrollHeight;
}

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
					}
					var slen = 4 - data.length;
					for(var j=0;j<slen;j++){
						html+="<div class='col-xs-6 col-md-3 pull-left relationPic'>"+
						" 	<a href='javascript:void(0)' class='thumbnail'>"+
						"		<img src='"+basePath+"/resources/imgs/error/noimage.gif' alt='暂无图片' style='height:165px'>"+
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
		var description = $(obj).prev().val();
		var musicId = $("body").data("opid");
		var username = $("#userName").val();
		var headerPic = $("#headerPic").val();
		
		if(isEmpty(username)){
			loading("您还没有登录请前往登录。。。",4);
			return;
		}
		
		if(!description){
			loading("请输入评论信息...",4);
			$("#content").focus();
			return;
		}
		//清空并且获取焦点
		$(obj).text("发表中");
		$("#content").val("").focus();
		$.ajax({
			type:"post",
			data:{description:description,musicId:musicId},
			url:basePath+"/comment/save.do",
			success:function(data){
				$(".comments").prepend("<li class='list-group-item animated rotateIn' style='padding:0;border:none;'>"+
				"<div class='col-md-1 headerPic'>"+
				"	<a href='#' class='thumbnail pull-left'>"+
				"		<img src='"+basePath+headerPic+"' class='img-responsive img-circle' alt='Responsive image' height='50' width='50'>"+
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
				"	<p class='replay'>"+
				"		<span class='glyphicon glyphicon-comment fs16' aria-hidden='true'>"+
				"		</span>回复"+
				"	</p>"+
				"</div>"+
			    "</li>");
				$(obj).text("发表评论");
				if(window.localStorage){
					var opid = $("body").data("opid");
					localStorage.removeItem("king_detail_"+opid);
				}
			}
		});
	},
	timer:null,
	loadComment:function(pageNo,pageSize){
		clearTimeout(this.timer);
		this.timer = setTimeout(function(){
			if(!keRealtion.mark)return;
			var musicId = $("body").data("opid");
			var params = {pageNo:pageNo*pageSize,pageSize:pageSize,musicId:musicId};
			$.ajax({
				type:"post",
				data:params,
				url:basePath+"/comment/load.do",
				success:function(dataArr){
					if(dataArr && dataArr.length>0){
						if(dataArr.length>=5)$(".loadData").css("display","block");
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
 					}else{
 						keRealtion.mark = false;
 						$(".loadData").removeAttr("onclick").html("数据加载完毕...");
					}
				}
			});
		},300);
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