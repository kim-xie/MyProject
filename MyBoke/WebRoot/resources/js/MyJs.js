
//封装id
function $(id){
	return document.getElementById(id);
};

//封装样式若在样式列表中找不到则返回NaN所有一般为了方便起见用--||0;
function getstyle(obj,attr){
	return obj.currentStyle ? obj.currentStyle[attr]:window.getComputedStyle(obj,false)[attr];
};
/*通过className获取dom元素进行过滤*/
function domClass(pid,cName){
	var allEle = $(pid).getElementsByTagName('*');
	var arrs = [];
	for(var i=0;i<allEle.length;i++){
		if(allEle[i].className.indexOf(cName)!=-1){
			arrs.push(allEle[i]);
		}
	}
	return arrs;
};

/**
 * 判断非空
 * 
 * @param val
 * @returns {Boolean}
 */
function isEmpty(val) {
	val = $.trim(val);
	if (val == null)
		return true;
	if (val == undefined || val == 'undefined')
		return true;
	if (val == "")
		return true;
	if (val.length == 0)
		return true;
	if (!/[^(^\s*)|(\s*$)]/.test(val))
		return true;
	return false;
}

function isNotEmpty(val) {
	return !isEmpty(val);
}

//简单混入 -- 一对象混入如果原对象与混入对象相同则保留，否则原对象会被覆盖
function mixin(obj,obj2){
	for(var key in obj2){
		if(obj2.hasOwnProperty(key)){
			obj[key] = obj2[key];
		}
	}
	return obj;
};

//多对象混入
function mix(target,source){
	var arr = [];
	var args = arr.slice.call(arguments);
	
	var i = 1;
	if(args.length==1){
		return target;
	};

	while((source = args[i++])){
		for(var key in source){
			if(source.hasOwnProperty(key)){
				target[key] = source[key];
			}
		}
	}
	return target;
};

//阻止事件冒泡
function stopPropagation(e){
	if(e && e.stopPropagation){
		e.stopPropagation();
	}else{
		window.event.cancelBubble = true;
	}
};

//判断两个元素是否相等
function eqauls(str,tstr){
	if(str == tstr){
		return true;
	}
	return false;
};

//获取鼠标的位置。兼容ie678
function getXY(e){
	var ev = e || window.event;
	var x=0,y=0;
	if(ev.pageX){
		x = ev.pageX;
		y = ev.pageY;
	}else{
		//拿到scrollTop 和scrollLeft
		var sleft = 0,stop = 0;
		//ie678---
		if(document.documentElement){
			stop =document.documentElement.scrollTop;
			sleft = document.documentElement.scrollLeft;
		}else{
		//ie9+ 谷歌 
			stop = document.body.scrollTop;
			sleft = document.body.scrollLeft;
		}	
		x = ev.clientX + sleft;
		y = ev.clientY + stop;
	}
	return {x:x,y:y};
};


//范围随机数
function randomRange(start,end){
	return Math.floor(Math.random()*(end-start+1))+start;
};

function randomNum(num){
	return Math.floor(Math.random()*(num+1));
};

function randomColor(){
	var r = Math.floor(Math.random()*256);
	var g = Math.floor(Math.random()*256);
	var b = Math.floor(Math.random()*256);
	return "rgb("+r+","+g+","+b+")";//IE7不支出rgb
};

function randomColor16(){
	//0-255	
	var r = Math.random(255).toString(16);
	var g = Math.random(255).toString(16);
	var b = Math.random(255).toString(16);
	//255的数字转换成十六进制
	if(r.length<2)r = "0"+r;
	if(g.length<2)g = "0"+g;
	if(b.length<2)b = "0"+b;
	return "#"+r+g+b;
};



//元素居中
function centerElement(id){
	var boxDom = $(id);
	var sw = boxDom.offsetWidth;
	var sh = boxDom.offsetHeight;
	var dw = window.innerWidth;
	var dh = window.innerHeight;
	var cleft = (dw - sw)/2;
	var ctop = (dh - sh)/2;
	boxDom.style.left = cleft+"px";
	boxDom.style.top = ctop+"px";
	window.onresize = function(){
		centerElement(id);
	};
};

//数组循环
function each(dom,callback){
	var domArr = Array.prototype.slice.call(dom);
	domArr.forEach(function(obj,index){
		if(callback)callback.call(obj,index);
	});
};

//获取索引
function getIndex(doms,dom){
	var index = -1;
	var domArr = Array.prototype.slice.call(doms);
	domArr.forEach(function(obj,i){
		if(obj==dom){
			index = i;
			return false;
		}
	});
	return index;
};


function getIndex(dom){
	var index = -1;
	var domArr = Array.prototype.slice.call(dom.parentElement.children);
	domArr.forEach(function(obj,i){
		if(obj==dom){
			index = i;
			return false;
		}
	});
	return index;
};


/*
 对Date的扩展:
 将Date转化为指定格式的String月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q)
 可以用(1-2)个占位符年(y)可以用1-4个占位符,毫秒(S)只能用1个占位符(是 1-3 位的数字)eg:
 (new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
 (new Date()).format("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04 
 (new Date()).format("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04 
 (new Date()).format("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04 
 (new Date()).format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
 */
Date.prototype.format = function(fmt) {
	var o = {
		// 年
		"Y+" : this.getFullYear(),
		// 月份
		"M+" : this.getMonth() + 1,
		// 日
		"d+" : this.getDate(),
		// 12小时制
		"h+" : this.getHours() % 12 == 0 ? 12 : this.getHours() % 12,
		// 24小时制
		"H+" : this.getHours(),
		// 分
		"m+" : this.getMinutes(),
		// 秒
		"s+" : this.getSeconds(),
		// 季度
		"q+" : Math.floor((this.getMonth() + 3) / 3),
		// 毫秒
		"S" : this.getMilliseconds()
	};
	var week = {
		"0" : "/u65e5",
		"1" : "/u4e00",
		"2" : "/u4e8c",
		"3" : "/u4e09",
		"4" : "/u56db",
		"5" : "/u4e94",
		"6" : "/u516d"
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	if (/(E+)/.test(fmt)) {
		fmt = fmt
				.replace(
						RegExp.$1,
						((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f"
								: "/u5468")
								: "")
								+ week[this.getDay() + ""]);
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
};


/*array*/


/*手机*/
function is_cellphoneNum(str){
    var regExp = /^(\+86)?(13|18|15)\d{9}(?!\d)$/;
    return regExp.test(str);
}

 /*邮件格式*/ 
function is_email(str){ 
    var regExp = /^([\w\.])+@\w+\.([\w\.])+$/;
    return regExp.test(str);
}
/*array end*/



/*--------------------------------------动画的封装------------------------------------*/

//动画函数
function animate(dom,json,time,callback){
	//执行动画前清除之前执行的所有动画
	if(dom.timer)clearInterval(dom.timer);
	//设置定时器
	dom.timer = setInterval(function(){
		//添加一个标记锁
		var mark = true;
		//循环对象中的属性
		for(var attr in json){
			//获取元素当前状态--样式列表中获取不到样式则返回NaN所以0
			var pos = null;
			if(attr.toLowerCase() == "opacity"){
				pos = getstyle(dom,attr)*100;
			}else{
				pos = parseInt(getstyle(dom,attr))||0;
			}
			//获取元素目标状态 -- 一般是调用者传入的值
			var target = json[attr]; 
			//获取一个减速度，避免外面传进来的速度的影响
			var speed = (target - pos)*0.5;//--->摩擦系数
			speed = speed > 0 ? Math.ceil(speed):Math.floor(speed);
			//判断当前状态和目标状态
			if(pos != target){
				//锁住 -- 只有执行完里面的业务才解锁
				mark = false;
				//执行业务代码
				if(attr == "opacity"){
					dom.style.opacity = (pos+speed)/100;
					dom.style.filter = "alpha(opacity="+(pos+speed)+")";
				}else{
					dom.style[attr] = pos+speed+"px";
				}
			}
		}
		if(mark){
			clearInterval(dom.timer);
			//清除动画后执行回调函数 dom改变回调函数中this的指向
			if(callback)callback.call(dom);
		}
	},time);
};



function animateIn(index){
	var animateIn = [];
	animateIn.push("animated bounce");//0
	animateIn.push("animated tada");//1
	animateIn.push("animated swing");//2
	animateIn.push("animated wobble");//3
	animateIn.push("animated flip");//4
	animateIn.push("animated flipInX");//5
	animateIn.push("animated flipInY");//6
	animateIn.push("animated fadeIn");//7
	animateIn.push("animated fadeInUp");//8
	animateIn.push("animated fadeInDown");//9
	animateIn.push("animated fadeInLeft");//10
	animateIn.push("animated fadeInRight");//11
	animateIn.push("animated fadeInUpBig");//12
	animateIn.push("animated fadeInDownBig");//13
	animateIn.push("animated fadeInLeftBig");//14
	animateIn.push("animated fadeInRightBig");//15
	animateIn.push("animated bounceIn");//16
	animateIn.push("animated bounceInUp");//17
	animateIn.push("animated bounceInDown");//18
	animateIn.push("animated bounceInLeft");//19
	animateIn.push("animated bounceInRight");//20
	animateIn.push("animated rotateIn");//21
	animateIn.push("animated rotateInUpLeft");//22
	animateIn.push("animated rotateInDownLeft");//23
	animateIn.push("animated rotateInUpRight");//24
	animateIn.push("animated rotateInDownRight");//25
	animateIn.push("animated rollIn");//26
	if(!index){
		var len = animateIn.length;
		var r = Math.floor(Math.random()*(len-1)+1);
		return animateIn[r];
	}else{
		return animateIn[index];
	}
}

function animateOut(index){
	var animateOut = [];
	animateOut.push("animated flipOutX");//0
	animateOut.push("animated flipOutY");//1
	animateOut.push("animated fadeOut");//2
	animateOut.push("animated fadeOutUp");//3
	animateOut.push("animated fadeOutDown");//4
	animateOut.push("animated fadeOutLeft");//5
	animateOut.push("animated fadeOutRight");//6
	animateOut.push("animated fadeOutUpBig");//7
	animateOut.push("animated fadeOutDownBig");//8
	animateOut.push("animated fadeOutLeftBig");//9
	animateOut.push("animated fadeOutRightBig");//10
	animateOut.push("animated bounceOut");//11
	animateOut.push("animated bounceOutUp");//12
	animateOut.push("animated bounceOutDown");//13
	animateOut.push("animated bounceOutLeft");//14
	animateOut.push("animated bounceOutRight");//15
	animateOut.push("animated rotateOut");//16
	animateOut.push("animated rotateOutUpLeft");//17
	animateOut.push("animated rotateOutDownLeft");//18
	animateOut.push("animated rotateOutDownRight");//19
	animateOut.push("animated rollOut");//21
//	animateOut.push("animated hinge");//20
	if(!index){
		var len = animateOut.length;
		var r = Math.floor(Math.random()*(len-1)+1);
		return animateOut[r];
	}else{
		return animateOut[index];
	}
}


//加密
function encryption(str,k){
	var string = "";
	for (var i = 0; i < str.length; i++) {
		var c= str.charCodeAt(i);
		if(c>=97 && c<=122){
			c += k%26;
			if(c<97){
				c+=26;
			}
			if(c>122){
				c-=26;
			}
		}else if(c>=65 && c<=90){
			c+=k%26;
			if(c<65){
				c+=26;
			}
			if(c>122){
				c-=26;
			}
		}
		string+=String.fromCharCode(c);
	}
	return string;
}

//解密
function dencryption(str,n){
	var string = "";
	var k = parseInt("-"+n);
	for (var i = 0; i < str.length; i++) {
		var c= str.charCodeAt(i);
		if(c>=97 && c<=122){
			c += k%26;
			if(c<97){
				c+=26;
			}
			if(c>122){
				c-=26;
			}
		}else if(c>=65 && c<=90){
			c+=k%26;
			if(c<65){
				c+=26;
			}
			if(c>122){
				c-=26;
			}
		}
		string+=String.fromCharCode(c);
	}
	return string;
};


/*--------------------------------------DOM元素的封装------------------------------------*/
//jquery中的siblings的原理
function siblings(dom,callback){
	//获取传入对象的父元素
	var pdom = dom.parentElement;
	//获取其同级元素
	var childrens = pdom.children;
	var len = childrens.length;
	//遍历父元素下的所有子元素返回传入元素的兄弟元素
	for(var i=0;i<len;i++){
		if(childrens[i] != dom){
			if(callback)callback.call(childrens[i]);
		}
	}
};


/*--------------------------------------FORM元素的封装------------------------------------*/

//获取表单元素的值ele用于表单验证
function getFormValue(formDom){
	//获取form表单下的所有元素
	var formElements = formDom.elements;
	var json = {};
	for(var i=0,len=formElements.length;i<len;i++){
		//获取form表单下的元素对应的类型
		var type = formElements[i].type.toLowerCase();
		//过滤
		if(type != "button" && type != "submit" && type != "reset"){
			//复选框会有多个值需要用对象去接收
			if(type=="checkbox" && formElements[i].checked){
				var value = json[formElements[i].name]||formElements[i].value;
				if(formElements[i].name in json ){
					value += "," + formElements[i].value;
				}
				json[formElements[i].name] = {value:value,ele:formElements[i]};
			}else if(type=="radio" && formElements[i].checked){
				json[formElements[i].name] = {
					value:formElements[i].value,
					ele:formElements[i]
				};
			}
			if(type!="radio" && type!="checkbox"){
				json[formElements[i].name] = {
					value:formElements[i].value,
					ele:formElements[i]
				};
			}
		}
	}
	return json;
};

//jquery中的serialize的原理  encodeURIComponent(参数);--对参数进行加密防止注入
function serialize(formDom){
	var formElements = formDom.elements;
	var params = "";
	for(var i=0,len=formElements.length;i<len;i++){
		var type = formElements[i].type.toLowerCase();
		if(type!="button" && type!="submit" && type!="reset"){
			if((type=="radio" || type=="checkbox") && formElements[i].checked){
				params+=((i>0)?"&":"")+formElements[i].name+"="+encodeURIComponent(formElements[i].value);
			}else{
				if(type!="radio" && type!="checkbox"){
					params+=((i>0)?"&":"")+formElements[i].name+"="+encodeURIComponent(formElements[i].value);
				}
			}
		}
	}
	return params;
};

//jquery中的serializeArray的原理  encodeURIComponent(参数);--对参数进行加密防止注入
function serializeArray(formDom){
	var formElements = formDom.elements;
	var params = [];
	for(var i=0,len=formElements.length;i<len;i++){
		var type = formElements[i].type.toLowerCase();
		if(type!="button" && type!="submit" && type!="reset"){
			if((type=="radio" || type=="checkbox") && formElements[i].checked){
				params.push({"name":formElements[i].name,"value":encodeURIComponent(formElements[i].value)})
			}else{
				if(type!="radio" && type!="checkbox"){
					params.push({"name":formElements[i].name,"value":encodeURIComponent(formElements[i].value)})
				}
			}
		}
	}
	return params;
};

//封装$.ajax({})
function ajax(json){
	var xhr = window.XMLHttpRequest?new XMLHttpRequest():new ActiveXObject("Microsoft.XMLHTTP");
	xhr.open(json.type||"get",json.url,json.ansy||true);
	if(json.type == "get" && json.data){
		json.url += "?" + json.data + "&" + Math.random();
	}
	if(json.type == "post" && json.data){
		xhr.setRequestHeader = ("content-type","application/x-www-form-urlencoded");
		xhr.send(json.data);
	}else{
		xhr.send();
	}
	xhr.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
			if(json.success)json.success(this.responseText);
		}
	};
};