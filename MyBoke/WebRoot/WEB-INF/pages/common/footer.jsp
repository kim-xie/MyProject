<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <style type="text/css">
	/*gotop start*/
	.gotop{display:none;position:fixed;right:30px;bottom:90px;cursor:pointer;z-index:100;}
	.gotop .icon-top{font-size:50px;color:#999;transition:1s;}
	.gotop .icon-top:hover{color:#990000;transition:1s;}
	.gotop .shart{display:block;width:50px;height:38px;border:3px solid #999;border-radius:5px;margin-top:5px;text-align:center;line-height:30px;}
	.gotop .shart:hover{color:#990000;transition:1s;border-color:#990000;}
	/*gotop end*/
	
	/*footer start*/
	.footer{width:100%;height:50px;padding:20px 0;}
	.footer .copyright{width:1000px;height:50px;margin:0 auto;text-align:center;line-height:50px;color:#999;font-size:16px;}
	.footer .copyright a{color:#999;font-size:16px;}
	/*footer end*/
  </style>
  
  <body>
  	 <!--gotop start-->
	 <span class="gotop">
	 	<i class="iconfont icon-top"></i>
	 	<span class="shart">分享</span>
	 	<span class="shart" onclick="window.open(basePath+'/content/response.do')">反馈</span>
	 </span>
	 <!--gotop end-->
	 
     <!--footer start-->
	 <div class="footer">
		 <div class="copyright">
			<span title="Copyright" style="cursor:pointer;">Copyright ©</span>&nbsp;
			<a href="javascript:void(0)">2016</a> All rights by king | 手写的从前
			<a href="javascript:void(0)">&nbsp;|&nbsp;联系邮箱:1134771121@qq.com</a>
		</div>
	 </div>
	 <!--footer end-->
	 <script>
			/*top*/
			$(".nav").find("ul li").click(function(){
				$(this).addClass("on").siblings().removeClass("on");
			}); 

			/*gotop start*/
			$(".gotop .icon-top").click(function(){
				$(document.body).stop(true,true).animate({"scrollTop":0},1000,
				function(){$(".gotop").stop(true,true).fadeOut(1000);});
			});
			$(window).scroll(function(){
				var scrollTop = $(this).scrollTop();
				if(scrollTop >= 200){
					$(".gotop").stop(true,true).fadeIn(1000);
				}else{
					$(".gotop").stop(true,true).fadeOut(1000);
				}
			});
			/*gotop end*/
	 </script>
  </body>

