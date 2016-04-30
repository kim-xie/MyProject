package com.king.bean;

import java.io.Serializable;

/**
 * User实体类 类名: User.java 
 * 创建人: king 
 * 创建时间：2016年4月7日 下午5:07:44
 * @version 1.0.0
 */
public class User implements Serializable {
	// 实现IO序列化 可以以流的形式输出
	private static final long serialVersionUID = 1L;
	// 主键
	private String userId;
	// 用户名
	private String userName;
	// 密码
	private String userPassword;
	// 性别 1--男性 0--女性
	private Integer userSex;
	// 年龄
	private Integer userAge;
	// 邮箱
	private String userEmail;
	// 电话
	private Integer userTel;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	// 头像
	private String headerPic;
	// 是否激活 1--已激活 0--未激活
	private Integer active;
	// 是否删除 1--已删除 0--未删除
	private Integer isDelete;
	// 是否是明星用户 1--明星用户 0--普通用户
	private Integer state;
	// 激活码
	private String activeCode;

	// 无参构造器
	public User() {

	}

	// 有参构造器
	public User(String userId) {
		this.userId = userId;
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

	public Integer getUserSex() {
		return userSex;
	}

	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getUserTel() {
		return userTel;
	}

	public void setUserTel(Integer userTel) {
		this.userTel = userTel;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getHeaderPic() {
		return headerPic;
	}

	public void setHeaderPic(String headerPic) {
		this.headerPic = headerPic;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
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
