package com.king.bean;
import java.io.Serializable;
/**
 * 音乐主题
 * Music 
 * 创建人:king
 * 时间：2016年05月19日 19:45:34
 * qq：1134771121
 * email：1134771121@qq.com
 * @version 1.0.0
 */
@SuppressWarnings("serial")
public class Music implements Serializable {
	// 主键
	private Integer id;
	// 标题
	private String title;
	// 描述
	private String description;
	// 分类
	private Integer categoryId;
	// 封面图
	private String img;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	// 音乐播放地址
	private String src;
	// 歌者
	private String singer;
	// 音乐标题
	private String lrc;
	// 音乐大小
	private Integer size;
	// 音乐时长
	private String time;
	// 点击数
	private Integer hits;
	// 评论数
	private Integer comments;
	// 发布状态0未发布1发布
	private Integer status;
	// 删除状态0未删除1删除
	private Integer isDelete;
	// 添加用户
	private Integer userId;
	
	public Music(){
		super();
	}

	public Integer getId() {
			return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getLrc() {
		return lrc;
	}
	public void setLrc(String lrc) {
		this.lrc = lrc;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getHits() {
		return hits;
	}
	public void setHits(Integer hits) {
		this.hits = hits;
	}
	public Integer getComments() {
		return comments;
	}
	public void setComments(Integer comments) {
		this.comments = comments;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
}
