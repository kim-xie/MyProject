package com.king.service;

import com.king.bean.Login;
import com.king.bean.Regist;
import com.king.bean.User;

public interface UserService {
	/**
	 * @Title: regist 
	 * @Description: TODO(注册) 
	 * @param @param regist
	 * @param @return  参数说明 
	 * @return boolean  返回类型 
	 * @throws
	 */
	boolean regist(Regist regist);
	/**
	 * @Title: findUserByUserName 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userName
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	boolean findUserByUserName(String userName); 
	/**
	 * @Title: checkUserEmail 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userEmail
	 * @param @return  参数说明 
	 * @return boolean  返回类型 
	 * @throws
	 */
	boolean checkUserEmail(String userEmail);
	/**
	 * @Title: active 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param activeCode
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	String active(String activeCode);
	
	/**
	 * @Title: loginIn 
	 * @Description: TODO(登录) 
	 * @param @param login
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	User loginIn(Login login);
}
