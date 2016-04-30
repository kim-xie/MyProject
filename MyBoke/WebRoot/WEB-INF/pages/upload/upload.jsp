<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
  
  	<title>头像上传页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/WEB-INF/pages/common/common.jsp"%>
	<style>
		*{padding: 0;margin:0}
		ul,li{list-style:none;}
		a{color:#333;text-decoration: none;}
		body{font-size:14px;font-family: "微软雅黑";background:#333}
		#box{width:400px;background:#fff;text-align:center;border:2px solid #ccc;margin:100px auto;color:#fff;padding:0px 5px 5px 5px;position:relative;}
		#box .uppadbox{margin-top:10px;height:160px;background:#eaeaea;border:2px dashed #c5c5c5;position:relative;z-index: 2}
		#box .uppadbox h3{line-height:125px;font-size:24px;color:#c5c5c5;text-shadow: 1px 1px 1px #999;}
		#box .uppadbox p{color:#c5c5c5}
		
		#box .buttons{height:75px;line-height:75px;position:relative;z-index:2}
		#box .buttons a{padding:8px 16px;background:#333;color:#fff;border-radius:2px;}
		#box .buttons a:hover{background:#111}
		
		#prograssbar{position:absolute;width:100%;height:0%;bottom:0;left:0;background:linear-gradient(green,red);z-index:1}
		
		
		#preview-pane{position:absolute;z-index:2000;top:10px;right:-280px;padding:6px;border:1px rgba(0,0,0,.4) solid;background-color:white;-webkit-border-radius:50%;-moz-border-radius:50%;border-radius:50%;-webkit-box-shadow:1px 1px 5px 2px rgba(0,0,0,0.2);-moz-box-shadow:1px 1px 5px 2px rgba(0,0,0,0.2);box-shadow:1px 1px 5px 2px rgba(0,0,0,0.2);}
		#preview-pane .preview-container{width:200px;height:200px;overflow:hidden;border-radius:50%;text-align:center;line-height:200px;font-size:24px;color:#c5c5c5;text-shadow: 1px 1px 1px #999;}
		#preview-pane .preview-container #preview{width:100%;height:100%;}
		
		
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
	
	<link rel="stylesheet" href="${basePath}/resources/css/jquery.Jcrop.min.css"/>
	<script type="text/javascript" src="${basePath}/resources/js/jquery.Jcrop.min.js"></script>
  </head>
  <body>

  	<div id="box">
		
		 <img src="" data-bgsrc="" width="400" height="400" id="target"/>
		 
		 <div id="preview-pane">
		    <div class="preview-container">
		    	<img src="" class="jcrop-preview" id="preview"/>
		    </div>
		 </div>
		 
		 <input type="hidden" size="4" id="x" name="x1"/>
		 <input type="hidden" size="4" id="y" name="y1"/>
		 <input type="hidden" size="4" id="w" name="w"/>
		 <input type="hidden" size="4" id="h" name="h"/>
  		
  		<div class="uppadbox" id="file_uploadarea">
  			<h3>将图片拖放到该区域</h3>
  			<p>请上传小于5MB的图片</p>
  		</div>
  		
  		<div class="buttons">
  			<a href="javascript:void(0)" class="sure" onclick="cut()">确认</a>
  			<a href="javascript:void(0)" class="cancle" onclick="cancle()">取消</a>
  		</div>
  		
  		<div id="prograssbar"></div>
  	</div>
  	
  	<!-- 头像裁剪 -->
  	<script type="text/javascript">
	  var jcrop_api = null;	
	  $(function(){
		var boundx,boundy,imgw,imgh,
			$preview = $('#preview-pane'),
			$pcnt = $('#preview-pane .preview-container'),
			$pimg = $('#preview-pane .preview-container img'),

			xsize = $pcnt.width(),
			ysize = $pcnt.height();
		  	
			$("#target").Jcrop({
			  onChange: updatePreview,
			  onSelect: updatePreview,
			  aspectRatio: xsize / ysize
			},function(){
			  var bounds = this.getBounds();
			  boundx = bounds[0];
			  boundy = bounds[1];
			  jcrop_api = this;
			  $preview.appendTo(jcrop_api.ui.holder);
			});

			function updatePreview(c){
			  if (parseInt(c.w) > 0){
				var rx = xsize / c.w;
				var ry = ysize / c.h;
				$pimg.css({
				  width: Math.round(rx * boundx) + 'px',
				  height: Math.round(ry * boundy) + 'px',
				  marginLeft: '-' + Math.round(rx * c.x) + 'px',
				  marginTop: '-' + Math.round(ry * c.y) + 'px'
				});
				 var ratiox = (c.imgw / 400);
				 var ratioy = (c.imgh / 400);
				 $("#x").val(c.x*ratiox);
				 $("#y").val(c.y*ratioy);
				 $("#w").val(c.w*ratiox);
				 $("#h").val(c.h*ratioy);
			  }
			};  
	  });
	  	
	  function cut(){
		  var src = $("#target").data("bgsrc");
		  var x = parseInt($("#x").val());
		  var y = parseInt($("#y").val());
		  var w = parseInt($("#w").val());
		  var h = parseInt($("#h").val());
		  var date = new Date();
		  var year = date.getFullYear();
		  var month = (date.getMonth()+1);
		  var day = date.getDate();
		  //参数打包
		  var params = {bgsrc:src,x:x,y:y,w:w,h:h,smallsrc:"resources/imgs/header_pic/"+year+"/"+month+"/"+day+"/header_pic.jpg"};
		
		  $.ajax({
			  type:"post",
			  url:basePath+"/upload/cutImg.do",
			  data:params,
			  success:function(data){
				  var data = data.trim();
				  if(data == "success"){
					  alert("头像上传成功");
				  }else{
					  alert("头像上传失败");
				  }
				  
			  }
		  });
	  }
	</script>
  	<!-- 上传头像 -->
  	<script type="text/javascript">
		  	//鼠标拖离事件
		  	document.ondragleave = function(e){
		  		e.preventDefault();//阻止浏览器的默认行为
		  	};
		  	//拖放后事件
		  	document.ondrop = function(e){
		  		e.preventDefault();//阻止浏览器的默认行为
		  	};
		  	//鼠标拖动按下去的时候
		  	document.ondragover = function(e){
		  		e.preventDefault();
		  	};
		  	//鼠标拖动按下去的时候
		  	document.ondragenter = function(e){
		  		e.preventDefault();
		  	};
		  	
		  	var index = 0;
		  	function upload(){
		  		//获取页面参数
		  		var fileboxDom = document.getElementById("file_uploadarea");
		  		var prograssbarDom = document.getElementById("prograssbar");
		  		//给目标对象绑定事件
		  		fileboxDom.addEventListener("dragenter",function(e){
		  			fileboxDom.style.background="#ccc";
		  		},false);
		  		
		  		fileboxDom.addEventListener("dragleave",function(e){
		  			fileboxDom.style.background="";
		  		},false);
		  		
		  		fileboxDom.addEventListener("drop",function(e){
		  			fileboxDom.style.background="";
		  			//file是一个文件列表
		  			var files = e.dataTransfer.files;
		  			//取第一张图片
		  			var file =files[0];
		  			//文件的名称
		  			var name = file.name;
		  			//file.name:文件名称
		  			//file.size:文件大小
		  			//file.type:文件类型
		  			//限制图片类型
		  			if(name.indexOf("jpg")==-1){
		  				alert("请选择图片....");
		  				return;
		  			}
		  			
		  			//没错通过ajax
		  			var xhr = new XMLHttpRequest();
		  			xhr.open("post",basePath+"/upload/upload.do",true);
		  			xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
		  			//设置文件数据
		  			var fd = new FormData();
		  			fd.append("doc",file);
		  			//进度条监听
			  		xhr.upload.addEventListener("progress",function(evt){
			  			if(evt.lengthComputable){
							var percent = event.loaded / event.total;
							var p = Math.floor(percent*100);
							prograssbarDom.style.height = p+"%";
							//上传完毕进度条回滚
							if(p>=100){
								var timer = null;
								timer = setInterval(function(){
									if(p>0){
										p--;
										prograssbarDom.style.height = p+"%";
									}else{
										clearInterval(timer);
										prograssbarDom.style.height = "0%";
									}
								},17);
							}
						}
			  		},true);
		  			xhr.send(fd);
		  			xhr.onreadystatechange = function(){
		  				if(xhr.readyState==4 && xhr.status == 200){
		  					var data = $.trim(xhr.responseText);
		  					var json =JSON.parse(data);
		  					var src = json.url+"?"+new Date().getTime();
		  					//var bigImg = $("<img src='' data-bgsrc='' width='400' height='400' id='target' class='target'/>");
		  					//var smallImg = $("<img src='' class='jcrop-preview' id='preview'/>");
		  					//$("#box").prepend(bigImg);
		  					//$("#box").find("#preview-pane .preview-container").append(smallImg);
		  					
		  					$("#target,#preview").data("bgsrc",json.url).attr("src",basePath+src);
		  					jcrop_api.setImage(basePath+src);
		  				}
		  			};
		  		}, false);
		  	};
		  	upload();
  	</script>
  </body>
</html>
