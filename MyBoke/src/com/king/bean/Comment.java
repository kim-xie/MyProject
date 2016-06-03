package com.king.bean;
import java.io.Serializable;
/**
 * 评论信息
 * Comment 
 * 创建人:king
 * 时间：2016年05月29日 21:24:05
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
public class Comment implements Serializable {
	/**  
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)  
	 */  
	private static final long serialVersionUID = 1L;
	// 主键
	private Integer id;
	// 名称
	private String name;
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
	// 评论内容
	private String description;
	// 音乐id
	private Integer musicId;
	// 内容id
	private Integer contentId;
	// 回复用户id
	private Integer replyUserId;
	// 父id
	private Integer parentId;
	
	public Comment(){
		super();
	}

	public Integer getId() {
			return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
			return name;
	}
	public void setName(String name) {
		this.name = name;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getMusicId() {
		return musicId;
	}

	public void setMusicId(Integer musicId) {
		this.musicId = musicId;
	}

	public Integer getContentId() {
		return contentId;
	}

	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}

	public Integer getReplyUserId() {
		return replyUserId;
	}

	public void setReplyUserId(Integer replyUserId) {
		this.replyUserId = replyUserId;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	
}
