package com.king.bean;
import java.io.Serializable;
/**
 * 粉丝信息
 * Fan 
 * 创建人:king
 * 时间：2016年06月04日 21:15:25
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class Fan implements Serializable {
	private static final long serialVersionUID = 1L;
	// 主键
	private Integer id;
	// 名称
	private String userName;
	// 名称
	private String fanName;
	// 头像
	private String fanHeaderPic;
	// 用户id
	private Integer userId;
	// 删除状态
	private Integer fanId;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	// 是否已删除
	private Integer isDelete;
	
	public Fan(){
		super();
	}

	public Integer getId() {
			return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getUserId() {
			return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getFanHeaderPic() {
		return fanHeaderPic;
	}

	public void setFanHeaderPic(String fanHeaderPic) {
		this.fanHeaderPic = fanHeaderPic;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFanName() {
		return fanName;
	}

	public void setFanName(String fanName) {
		this.fanName = fanName;
	}

	public Integer getFanId() {
		return fanId;
	}

	public void setFanId(Integer fanId) {
		this.fanId = fanId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	
	
}
