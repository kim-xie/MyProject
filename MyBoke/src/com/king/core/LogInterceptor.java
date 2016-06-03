package com.king.core;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.ServletContextAware;

import com.king.bean.Log;
import com.king.bean.User;
import com.king.dao.log.ILogMapper;
import com.king.util.TmStringUtils;
/**
 * 类名: LogInterceptor.java
 * 创建人: king 
 * 创建时间：2016年5月20日 下午2:07:41 
 * @version 1.0.0
 */
@Aspect
public class LogInterceptor implements ServletContextAware {
	// 注入上下文应用拿到ip和username
	private ServletContext application;
	// 注入mapper
	@Resource(name="logMapper")
	private ILogMapper logMapper;
	
	// 配置环绕通知
	@Around("execution(* com.king.service.*.*.*(..))")
	public Object doBasicProfiling(ProceedingJoinPoint point) throws Throwable {
		
		System.out.println("进来了吗？");
		// 获取方法名
		String methodName = point.getSignature().getName();
		// 获取模块名
		String content = null;
		if(TmStringUtils.isNotEmpty(methodName) && methodName.indexOf("User")!=-1){
			content = "user";
		}else if(TmStringUtils.isNotEmpty(methodName) && methodName.indexOf("Music")!=-1){
			content = "music";
		}else if(TmStringUtils.isNotEmpty(methodName) && methodName.indexOf("Content")!=-1){
			content = "content";
		}else if(TmStringUtils.isNotEmpty(methodName) && methodName.indexOf("Comment")!=-1){
			content = "comment";
		}else{content = "other";}
		System.out.println(content);
		// 判断是否是登录过滤登录操作
		if(TmStringUtils.isNotEmpty(methodName) && methodName.equals("getUser||findUserByUserName||checkUserEmail")){
			return  point.proceed();
		}
		// 获取目标对象
		Object classObj = point.getTarget();
		// 操作开始时间
		long start = System.currentTimeMillis();
		Object object = point.proceed();
		// 操作结束时间
		long end = System.currentTimeMillis();
		// 操作总时长
		long time = (end - start);
		// 调用方法的参数
		Object[] params = point.getArgs();
		// 字符串并接
		StringBuilder builder = new StringBuilder("");
		if(params.length>0){
			for (int i = 0; i < params.length; i++) {
				builder.append(String.valueOf(params[i]));
				if(i<params.length-1){
					builder.append(",");
				}
			}
		}
		//执行的类名
		String className = classObj.getClass().getName();
		
		//返回类型
		String returnType = null;
		if(object!=null){
			returnType = object.getClass().getName();
		}
		//保存日记到数据库
		try {
			saveLog(className,methodName,time,content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("【Tm】【Service AOP拦截】【Class："+className+"】【Method："+methodName+"】【ReturnType："+returnType+"】【Time："+time+"ms】");
		return object;
	}
	
	private void saveLog(String className,String methodName,long time,String content){
		Log log = new Log();
		User user = (User) application.getAttribute("user_log");
		//如果注册用户没有ip则需要在应用上下文中获取
		//HttpServletRequest request = (HttpServletRequest) application.getAttribute("request_log");
		//log.setIp(TmIpUtil.getIpAddress(request));
		//log.setIpAddress(TmIpUtil.ipLocation(request));
		log.setClassname(className);
		log.setUserId(user.getUserId());
		log.setMethod(methodName);
		log.setTime(time);
		log.setIp(user.getIp());
		log.setIpAddress(user.getIpAddress());
		log.setUsername(user.getUserName());
		log.setModel(content);
		log.setDescription(user.getUserName()+"调用了"+methodName+"方法");
		
		logMapper.saveLog(log);
	}
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}
}
