package com.king.dao.user;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.king.bean.User;
import com.king.bean.UserParams;
/**
 * UserMapper接口
 * 类名: UserMapper.java
 * 创建人: king 
 * 创建时间：2016年4月8日 下午5:28:46 
 * @version 1.0.0
 */
@Repository
public interface UserMapper {	
	/**
	 * Regist
	 * @Title: regist 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param regist  参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	int saveUser(User user);
	/**
	 * @Title: findUserByUserName 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userName
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	int findUserByUserName(String userName); 
	
	/**
	 * @Title: checkUserEmail 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userEmail
	 * @param @return  参数说明 
	 * @return boolean  返回类型 
	 * @throws
	 */
	int checkUserEmail(String userEmail);
	/**
	 * @Title: active 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param activeCode
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	User active(String activeCode);
	/**
	 * @Title: updateActive 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param activeCode
	 * @param @return  参数说明 
	 * @return int  返回类型 
	 * @throws
	 */
	void updateActive(String activeCode);
	
	/**
	 * @Title: loginIn 
	 * @Description: TODO(登录) 
	 * @param @param login
	 * @param @return  参数说明 
	 * @return User  返回类型 
	 * @throws
	 */
	User getUser(UserParams userParams);
	
	/**
	 * @Title: findAllUsers 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return List<User>  返回类型 
	 * @throws
	 */
	List<User> findAllUsers(UserParams userParams);
	
	/**
	 * @Title: count 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userParams
	 * @param @return  参数说明 
	 * @return int  返回类型 
	 * @throws
	 */
	int countUser(UserParams userParams);
}
