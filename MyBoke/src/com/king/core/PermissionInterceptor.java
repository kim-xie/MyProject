package com.king.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.User;

/**
 * 类名: PermissionInterceptor.java
 * 创建人: king 
 * 创建时间：2016年5月20日 下午2:09:53 
 * @version 1.0.0
 */
public class PermissionInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("进来了吗..........");
		User user =(User)request.getSession().getAttribute("user");
		if(user!=null && user.getUserName().equals("king")){
			return true;
		}else{
			response.sendRedirect(request.getContextPath()+"/success.jsp");	
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("请求结束执行的方法..........");
		
	}
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("响应已经被渲染成功后执行的方法..........");
		
	}

}