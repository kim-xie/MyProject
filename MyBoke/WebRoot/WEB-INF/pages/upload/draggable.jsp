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
		#box{width:60px;height:80px;background:#888;text-align:center;border:1px solid #ccc;}
		#box2{width:320px;height:420px;background:#fff;position:absolute;right:0;bottom:0}
	</style>
  </head>
  <body>
  	
  	<div id="box" draggable="true">
  		<a href="#">点我</a>
  	</div>
  	
  	<div id="box2" draggable="true">
  	
  	</div>
  	
  	
  	
  	<script type="text/javascript" src="http://localhost/tzupload/js/jquery-1.11.2.min.js"></script>
  	<script type="text/javascript">
  	
  		/*
  			在html5新特性：元素的拖放draggable ,在页面只有两样东西是默认是打开：img和链接 true
  			ondragstart:
  			ondrag:
  			ondragend:
  			
  			//针对当一些进入目标时候执行的回调函数 购物车
  			ondraglevea:
  			ondragenter:
  			ondragover:
  			ondrop:
  				
  				
  			//拖放的元素
  			dragstart:拖拽开始 onmousedown
  			drag:拖动中 onmonsemove
  			dragend:拖放结束:onmouseup
  		
  		*/
  		
  		window.onload = function(){
  			var boxDom = document.getElementById("box");
  			var boxDom2 = document.getElementById("box2");
  			
  			boxDom.addEventListener("dragstart", function(e){
  				//key命名必须交：text,url ie下不允许用其他的名称
  				//e.dataTransfer.setData("text",this.id);
 	  			//e.dataTransfer.setData("text",this.outerHTML);
  				var json = {};
  				json.name = "我爱你吗";
  				json.age = 31;
  				json.address = "湖南长沙";
  				json.prie = 12345;
  				e.dataTransfer.setData("text",JSON.stringify(json));
  			}, false);
  			
  			
  			boxDom2.addEventListener("drop", function(e){
  				var html = e.dataTransfer.getData("text");
  				var json = JSON.parse(html);
  				boxDom2.innerHTML +=json.name+"=="+json.age;
  				//var id = e.dataTransfer.getData("text");
  				//boxDom2.appendChild(document.getElementById(id));
  			}, false);
  			
  			
  			boxDom2.addEventListener("dragover", function(e){
  				e.preventDefault();
  			}, false);
  			
  			boxDom.addEventListener("dragover", function(e){
  				e.preventDefault();
  			}, false);
  			
  			
  			
//   		boxDom.ondragstart = 
  			/*boxDom.addEventListener("dragstart", function(){
  				console.log("1开始了拖拽了--dragstart");
  				
  			}, false);
  			
  			boxDom.addEventListener("drag", function(e){
  				console.log("2拖拽中--drag");
  			}, false);
  			
  			
  			boxDom.addEventListener("dragend", function(){
  				console.log("3拖放结束--dragend");
  				
  			}, false);
  			
  			
  			boxDom2.addEventListener("dragover", function(e){
  				e.preventDefault();
  			}, false);
  			
  			boxDom.addEventListener("dragover", function(e){
  				e.preventDefault();
  			}, false);
  			
  			
  			boxDom2.addEventListener("dragenter", function(){
  				console.log("boxDom2==5有元素进入的时候--dragenter");
  			}, false);
  			
  			boxDom2.addEventListener("dragleave", function(){
  				console.log("boxDom2==4有元素进入的时候--dragleave");
  			}, false);
  			
  			
  			boxDom2.addEventListener("drop", function(){
  				console.log("boxDom2==7有元素进入的时候--drop");
  			}, false);
  			*/
  			
  			
  			
  			
  		};
  	
  	
  	
  	</script>
  </body>
</html>
