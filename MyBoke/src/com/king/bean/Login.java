package com.king.bean;

import java.io.Serializable;
/**
 * 登录类
 * 类名: Login.java
 * 创建人: king 
 * 创建时间：2016年4月13日 下午1:32:27 
 * @version 1.0.0
 */
public class Login implements Serializable{
	/**  
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)  
	 */  
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String userName;
	private String password;
	
	
	public Login() {
	}
	
	public Login(Integer id) {
		this.id = id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
