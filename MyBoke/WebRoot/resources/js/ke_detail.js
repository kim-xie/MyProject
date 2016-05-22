
/*损坏图片的处理方案*/
$(function(){
	/*$("img").on("error",function(){
		$(this).attr("src",basePath+"/resource/images/noimage.gif");
	});*/
	
	keRealtion.init();
	keRealtion.load();
	keRealtion.loadComment();
});

var keRealtion = {
	init:function(){
		if(window.localStorage){
			var opid = $("body").data("opid");
			var text = localStorage.getItem("keke_detail_"+opid);
			$("#content").val(text);
		}
	},
	load:function(){
		var typeId = $("body").data("typeid");
		var filterId = $("body").data("opid");
		$.ajax({
			type:"post",
			data:{filterId:filterId,typeId:typeId},
			url:basePath+"/blog/relation.do",
			success:function(data){
				var html = "";
				if(data!=null && data.length>0){
					for(var i=0,len=data.length;i<len;i++){
					 	html+="<li><a href='"+basePath+"/blog/detail/"+data[i].id+".do'><img src='"+basePath+"/"+data[i].img+"' alt='"+data[i].title+"' /></a><a href='"+basePath+"/blog/detail/"+data[i].id+".do' class='rp_t'>"+data[i].title+"</a></li>";
					}
					var slen = 4 - data.length;
					for(var j=0;j<slen;j++){
						html+="<li><img src='"+basePath+"/resource/images/noimage.gif' alt='暂无' /></li>";
					}
				}else{
					$(".relation").remove();
				}
				$("#relationbox").html(html);
				
			}
		});
	},
	mark:true,
	saveComment:function(obj){
		if(!keRealtion.mark)return;
		var userName = $("#username").text();
		if(isEmpty(userName)){
			tzLogin.login();
			return false;
		}
		var description = $("#content").val();
		var blogId = $("body").data("opid");
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
			data:{description:description,blogId:blogId},
			url:basePath+"/comment/save.do",
			success:function(data){
				$("#kecommentbox").prepend("<div class='comment' data-opid='"+data.id+"'>"+
				"	<ul class='links inline'>"+
				"	<li class='comment-reply first last'><a href='javascript:void(0);' data-opid='"+data.id+"'>回复</a></li>"+
				"	</ul>"+
				"	<div class='submitted'> <span rel='sioc:has_creator'><a href='#' title='查看用户资料' class='username' >"+userName+"</a></span> <span class='marker'>老师</span> </div>"+
				"	<div class='content'>"+
				"	<span rel='sioc:reply_of' class='rdf-meta element-hidden'></span> "+description+
				"	<p class='submitted'><span>刚刚</span></p>"+
				"	</div>"+
				"	</div>");
				keRealtion.mark = true;
				$(obj).attr("onclick","keRealtion.saveComment(this)").find(".text").text("发表言论");
				if(window.localStorage){
					var opid = $("body").data("opid");
					localStorage.removeItem("keke_detail_"+opid);
				}
			}
		});
	},
	timer:null,
	loadComment:function(){
		clearTimeout(this.timer);
		this.timer = setTimeout(function(){
			var blogId = $("body").data("opid");
			$.ajax({
				type:"post",
				data:{blogId:blogId},
				url:basePath+"/comment/load.do",
				success:function(dataArr){
					if(dataArr){
						var html = "";
						for(var i=0,len=dataArr.length;i<len;i++){
							var data = dataArr[i];
							html+="<div class='comment' data-opid='"+data.id+"'>"+
							"	<ul class='links inline'>"+
							"	<li class='comment-reply first last'><a href='javascript:void(0);' data-opid='"+data.id+"'>回复</a></li>"+
							"	</ul>"+
							"	<div class='submitted'> <span rel='sioc:has_creator'><a href='#' title='查看用户资料' class='username' >"+data.username+"</a></span> <span class='marker'>老师</span> </div>"+
							"	<div class='content'>"+
							"	<span rel='sioc:reply_of' class='rdf-meta element-hidden'></span> "+data.description+
							"	<p class='submitted'><span>"+data.createTime+"</span></p>"+
							"	</div>"+
							"	</div>";
						}
						$("#kecommentbox").append(html);
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
				localStorage.setItem("keke_detail_"+opid, val);
			}
		}
	}
};