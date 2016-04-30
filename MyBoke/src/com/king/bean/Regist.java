package com.king.bean;

import java.io.Serializable;

public class Regist implements Serializable{
	/**  
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)  
	 */  
	private static final long serialVersionUID = 1L;
	// 主键
	private String userId;
	//用户名
	private String userName;
	//密码
	private String userPassword;
	//确认密码
	private String confirmPassword;
	//注册邮箱
	private String userEmail;
	// 创建时间
	private String createTime;
	// 是否激活 1--已激活 0--未激活
	private Integer active;
	// 激活码
	private String activeCode;
	
	
	public Regist() {
	
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getActive() {
		return active;
	}
	public void setActive(Integer active) {
		this.active = active;
	}
	public String getActiveCode() {
		return activeCode;
	}
	public void setActiveCode(String activeCode) {
		this.activeCode = activeCode;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
