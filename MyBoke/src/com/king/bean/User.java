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
	private Integer userId;
	// 角色id
	private Integer roleId;
	// 用户名
	private String userName;
	// 密码
	private String userPassword;
	// 性别 2--保密 1--男性 0--女性
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
	// 是否明星用户 1--明星用户 0--普通用户
	private Integer state;
	// 是否禁用   1--禁用 0--未禁用
	private Integer forbiden;
	// 激活码
	private String activeCode;
	// qq
	private String qq;
	// 微信
	private String weixin;
	// 生日
	private String birthday;
	// 地址
	private String address;
	// 描述
	private String description;
	//用户ip
	private String ip;
	//用户ip地址
	private String ipAddress;

	// 无参构造器
	public User() {

	}
	// 有参构造器
	public User(Integer userId) {
		this.userId = userId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
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

	public Integer getForbiden() {
		return forbiden;
	}

	public void setForbiden(Integer forbiden) {
		this.forbiden = forbiden;
	}

	public String getActiveCode() {
		return activeCode;
	}

	public void setActiveCode(String activeCode) {
		this.activeCode = activeCode;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
