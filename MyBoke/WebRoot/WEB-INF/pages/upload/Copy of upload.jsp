<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
  
  	<title>文件上传</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
		*{padding: 0;margin:0}
		body{font-size:14px;font-family: "微软雅黑";background:#333}
		#box{width:460px;height:180px;background:#888;text-align:center;border:1px solid #ccc;margin:100px auto;line-height: 180px;color:#fff}
	</style>
  </head>
  <body>
  	
  	<div id="box">
  		<h1>文件拖放到此区域，进行上传....</h1>
  	</div>
  	
  	
  	<script type="text/javascript" src="http://localhost/tzupload/js/jquery-1.11.2.min.js"></script>
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
		  	
		  	
		  	function tzupload(){
		  		var fileboxDom = document.getElementById("box");
		  		fileboxDom.addEventListener("dragenter",function(e){
		  			fileboxDom.style.background="green";
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
		  			if(name.indexOf("jpg")==-1){
		  				alert("请选择图片....");
		  				return;
		  			}
		  			
		  			//没错通过ajax
		  			var xhr = new XMLHttpRequest();
		  			xhr.open("post","http://localhost/tzupload/up/file.html",true);
		  			xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
		  			//设置文件数据
		  			var fd = new FormData();
		  			fd.append("doc",file);
			  		xhr.upload.addEventListener("progress",function(evt){
			  			if(evt.lengthComputable){
							var percent = event.loaded / event.total;
						}
			  		},true);
		  			xhr.send(fd);
		  			xhr.onreadystatechange = function(){
		  				if(xhr.readyState==4 && xhr.status == 200){
		  					var data = $.trim(xhr.responseText);
		  					alert(data);
		  				}
		  			};
		  		}, false);
		  	};
		  	
		  	tzupload();
  	</script>
  </body>
</html>
