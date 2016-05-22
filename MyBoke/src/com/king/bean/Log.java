package com.king.bean;
import java.io.Serializable;
/**
 * 操作日志
 * Log 
 * 创建人:king
 * 时间：2016年05月20日 15:23:51
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class Log implements Serializable {
	/**  
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)  
	 */  
	private static final long serialVersionUID = 1L;
	// 主键
	private Integer id;
	// 类名
	private String classname;
	// 描述
	private String description;
	// 创建时间
	private String createTime;
	// 用户id
	private Integer userId;
	// 操作人
	private String username;
	// 操作方法
	private String method;
	// 操作时长
	private Long time;
	// 操作的ip
	private String ip;
	// ip地址
	private String ipAddress;
	// 操作的模块
	private String model;
	
	
	public Log(){
		super();
	}

	public Integer getId() {
			return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Long getTime() {
		return time;
	}

	public void setTime(Long time) {
		this.time = time;
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

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
}
