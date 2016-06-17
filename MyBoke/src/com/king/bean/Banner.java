package com.king.bean;
import java.io.Serializable;
/**
 * banner轮播图
 * Banner 
 * 创建人:king
 * 时间：2016年06月15日 14:00:35
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class Banner implements Serializable {
	/**  
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)  
	 */  
	private static final long serialVersionUID = 1L;
	// 主键
	private Integer id;
	// 名称
	private String img;
	// 用户id
	private Integer userId;
	// 删除状态
	private Integer isDelete;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	// 发布状态
	private Integer status;
	
	public Banner(){
		super();
	}

	public Integer getId() {
			return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getImg() {
			return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public Integer getUserId() {
			return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setUserName(String userName) {
		// TODO Auto-generated method stub
		
	}
	
}
