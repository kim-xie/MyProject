function initWnl(){
	var date = new Date();
	var fyear = date.getFullYear();
	var fmonth = date.getMonth()+1;
	var fdate = date.getDate();
	$("#y").html(fyear + "&nbsp;&nbsp;年&nbsp;");
	$("#m").html(fmonth + "&nbsp;&nbsp;月");
	//向后切换时间
	$("#prev").on("click",function(){
		fmonth--;
		fmonth<1 ? fmonth = 12:fyear--;
		$("#y").html(fyear + "&nbsp;&nbsp;年&nbsp;");
		$("#m").html(fmonth + "&nbsp;&nbsp;月");
		changeDate(fyear,fmonth);
	});
	//向前切换时间
	$("#next").on("click",function(){
		fmonth++;
		fmonth>12?fmonth = 1:fyear++;
		$("#y").html(fyear + "&nbsp;&nbsp;年&nbsp;");
		$("#m").html(fmonth + "&nbsp;&nbsp;月");
		changeDate(fyear,fmonth);
	});
	//星期数
	var weekArr = ["日","一","二","三","四","五","六"];
	var whtml = "<tr>";
	for(var i=0;i<weekArr.length;i++){
		whtml += "<th>"+weekArr[i]+"</th>";
	}
	whtml += "</tr>";
	$("#theadweek").html(whtml);
	//日期切换
	function changeDate(year,month){
		//1:求每个月的天数.
		var days = getMonthDay(year,month);
		//2:每个月的第一天是星期几 11
		var week = new Date(year,month-1,1).getDay();
		//上一个月天数
		var pdates = getMonthDay(year,month-1);
		//日期填充行
		var bhtml = "";
		//日期数
		var j = 1;
		//前空标记
		var mark = false;
		//前空填充索引
		var pindex = pdates - week + 1;
		//后空填充索引
		var nindex = 1;
		//4:用穷极算法，每七个进行循环一次
		while(true){//外层是控制有多少tr
			bhtml+="<tr>";
			for(var i=0;i<7;i++){//tr有七个td
				//3:把每个月的第一天和星期数对号入座
				if(j==1 && i==week){
					bhtml+="<td>"+j+"</td>";
					j++;
					mark = true;
				}else if(j>1 && j<=days){
					bhtml+="<td class='"+(j==fdate?'on':'')+"'>"+j+"</td>";
					j++;
				}else{
					if(!mark){
						bhtml+="<td class='noon'>"+pindex+"</td>";
						pindex++;
					}else{
						bhtml+="<td class='noon'>"+nindex+"</td>";
						nindex++;
					}
				}
			}
			bhtml+="</tr>";
			if(j>days){break;}
		}
		$("#tbodybox").html(bhtml);
	};
	//初始化当前月份对应的日历 -- 默认值
	changeDate(fyear,fmonth);
	initTime();
};


//初始化时间
function initTime(){
	setInterval(function(){
		var date = new Date();
		$("#time").html(timeFormate(date.getHours())+":"+timeFormate(date.getMinutes())+":"+timeFormate(date.getSeconds()));
	},1000);
}
//时间格式化
function timeFormate(time){
	return time < 10 ? "0"+ time : time;
}
//判断是否是闰年 ===4年一闰 百年不闰 400年再闰
function isLeapYear(year) {  
	return (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0); 
};
//获取每月对应的天数
function getMonthDay(fyear,fmonth){
	var days = 31;
	if(isLeapYear(fyear) && fmonth==2){
		days = 29;
	}else if(!isLeapYear(fyear) && fmonth==2){
		days = 28
	}else if(fmonth==4 || fmonth==6 || fmonth==9 || fmonth==11 ){
		days = 30;
	}
	return days;
};
