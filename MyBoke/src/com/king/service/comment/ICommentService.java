package com.king.service.comment;

import java.util.HashMap;
import java.util.List;

import com.king.bean.Comment;
import com.king.bean.Params;

/**
 * ICommentService
 * 创建人:king 
 * 时间：2016年05月29日 21:24:05
 * @version 1.0.0
 * 
 */
public interface ICommentService {
	/**
	 * com.king.service.comment 
	 * 方法名：findComments
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月29日 21:24:05
	 * @param params
	 * @return 
	 * 返回类型：List<Comment>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findComments(Params params);
	/**
	 * 查询所有内容评论
	 * @Title: findContentComments 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return List<HashMap<String,Object>>  返回类型 
	 * @throws
	 */
	public List<HashMap<String, Object>> findContentComments(Params params);
	/**
	 * 求总数
	 * com.king.dao.comment 
	 * 方法名：count
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月29日 21:24:05
	 * @param id
	 * @return 
	 * 返回类型：List<Comment>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countComment(Params params);
	
	/**
	 * com.king.service.comment 
	 * 方法名：findComments
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月29日 21:24:05
	 * @param params
	 * @return 
	 * 返回类型：List<Comment>
	 * @exception 
	 * @since  1.0.0
	 */
	public Comment getComment(Params params);
	
	/**
	 * 保存评论信息
	 * com.king.service.comment 
	 * 方法名：save
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月29日 21:24:05 
	 * @param comment
	 * @return 
	 * 返回类型：Comment
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveComment(Comment comment);
	
	/**
	 * 更新评论信息
	 * com.king.service.comment 
	 * 方法名：update
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月29日 21:24:05
	 * @param comment
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int updateComment(Comment comment);
	
	/**
	 * 删除评论信息
	 * com.king.service.comment 
	 * 方法名：delete
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月29日 21:24:05
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int deleteComment(Params params);
}
