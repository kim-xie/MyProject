function dom(id){
	return document.getElementById(id);
}
//播放器
var KingAudio = {
	audioDom:null,
	init:function(callback){//播放器初始化
		this.audioDom = dom("audio");
		this.time(callback);
	},
	
	//播放
	play:function(){
		this.audioDom.play();
	},
	
	//暂停
	stop:function(){
		this.audioDom.pause();
	},
	
	time:function(callback){//时间
		var $this = this;
		//加载完毕的函数 
		this.audioDom.addEventListener("canplaythrough",function(){
			if(callback)callback.call(this,true,$this.format(this.duration));
		});
		//播放中的函数 timeupdate
		this.audioDom.addEventListener("timeupdate",function(){
			var ctime = this.currentTime;
			var percent =Math.floor((ctime / this.duration) * 100);
			if(callback)callback.call(this,false,$this.format(ctime),percent);
		});
	},
	
	format:function(time){//日期格式化
		var m=Math.floor(time/60);
		var s =Math.floor(time%60);
		if(m<10)m="0"+m;
		if(s<10)s="0"+s;
		return m+":"+s;
	},
	
	mute:function(){//静音
		
	},
	
	next:function(){//下一首
		
	},
	
	prev:function(){//上一首
		
	},
	
	randomMusic:function(){//随机播放
		
	},
	
	loadLrc:function(){//加载歌词
		
	}
};


/*音轨*/
var Bar = {
	arr:[],//定义一个容器，装载每一个bar对象
	mw:4,/*每个一个元素的宽度*/
	init:function(){
		//获取盒子对象
		var boxDom = dom("wrapbox");
		//获取盒子对象宽度
		var bwidth = boxDom.clientWidth;
		var cells = Math.floor(bwidth / this.mw);
		boxDom.parentElement.style.width = (cells+1) * this.mw+"px";
		for(var i=0;i<=cells;i++){
			var spanDom = document.createElement("span");
			spanDom.className = "items";
			css(spanDom,{left:i*Bar.mw,width:Bar.mw-1});
			boxDom.appendChild(spanDom);
			Bar.arr.push(spanDom);
		}
	}
};

var KingMusic = {
	mark:false,
	init:function(){//ie11以上的浏览器才支持 
		//1:音频上下文===html5+ajax+audioContext   html5+audio+audioContext  
		window.AudioContext = window.AudioContext || window.webkitAudioContext || window.mozAudioContext || window.msAudioContext;
		//动画执行的兼容写法
		window.requestAnimationFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.msRequestAnimationFrame;
		//2:初始化音轨对象
		var audioContext = new window.AudioContext();
		return audioContext;
	},
	
	parse:function(audioContext,audioDom,callback){
		try{
			//拿到播放器去解析你音乐文件
			var audioBufferSouceNode = audioContext.createMediaElementSource(audioDom);
			//创建解析对象
			var analyser = audioContext.createAnalyser();
			//将source与分析器连接
			audioBufferSouceNode.connect(analyser); 
			//将分析器与destination连接，这样才能形成到达扬声器的通路
			analyser.connect(audioContext.destination);
			//调用解析音频的方法
			KingMusic.data(analyser,callback);
		}catch(e){
			
		}
	},
	
	data:function(analyser,callback){
		if(KingMusic.mark){
			//讲音频转换一个数组
			var array = new Uint8Array(analyser.frequencyBinCount);
			analyser.getByteFrequencyData(array);
			//通过回调函数返回
			if(callback)callback(array);
			requestAnimationFrame(function(){
				KingMusic.data(analyser,callback);
			});
		}
	}
};

//随机颜色,op透明度，不写就1
function randDomColor(op){
	var r = Math.floor(Math.random()*256);
	var g = Math.floor(Math.random()*256);
	var b = Math.floor(Math.random()*256);
	return "rgba("+r+","+g+","+b+","+(op||1)+")";
};

//给元素添加样式列表 
function css(dom,opts){
	for(var key in opts){
		var val = opts[key];
		if(typeof val=="number"){
		val+="px";
	}
	dom["style"][key] = val;
	}
};

window.onload = function(){
	Bar.init();
	//点击音乐播放后触发函数
	var audioDom = dom("audio");
	var audioContext = KingMusic.init();
	audioDom.onplay = function(){
		KingMusic.mark = true;
		//获取音轨解析对象
		var len = Bar.arr.length;
		KingMusic.parse(audioContext,audioDom,function(dataArr){//1024
			for(var i=0;i<len;i++){
				Bar.arr[i].style.height = dataArr[i]+"px";
				Bar.arr[i].style.background = "linear-gradient("+randDomColor(0.5)+"5%,rgba(0,255,0,0.5) 60%,#fff 100%)";
			}
		});
	};
};

//页面播放器业务
var Play = {
	init:function(){
		$(".ke_op").on("click",function(){
			var $i=$(this).find("i");
			$i.toggleClass("icon-play icon-pause");
			var field = $i.hasClass("icon-pause")?"play":"stop";
			KingAudio[field]();
			$(this).animate({top:$i.hasClass("icon-pause")?-200:0},"slow");
			$(".ke_op").toggleClass("r");
			//$("#ptime")[$i.hasClass("icon-pause")?"addClass":"toggleClass"]("sstime sc");
		});
	}
};


$(function(){
	//播放器初始化
	KingAudio.init(function(ok,ftime,percent){
		$("#"+(ok?"time":"ptime")).html(ftime);
		if(!ok){
			$("#percent").html((percent+"%"));
			$(".p_over").width(percent+"%");
		}
	});
	//业务功能初始化
	//Play.init();
	Play.init();
});