package com.king.dao.comment;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.king.bean.Comment;
import com.king.bean.Params;

/**
 * 评论信息Mapper
 * ICommentMapper
 * 创建人:king 
 * 时间：2016年05月29日 21:24:05
 * @version 1.0.0
 */
@Repository("commentMapper")
public interface ICommentMapper {

	/**
	 * com.king.dao.comment 
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
	 * com.king.dao.comment 
	 * 方法名：getComment
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月29日 21:24:05
	 * @param id
	 * @return 
	 * 返回类型：List<Comment>
	 * @exception 
	 * @since  1.0.0
	 */
	public Comment getComment(Params params);
	
	/**
	 * 保存评论信息
	 * com.king.dao.comment 
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
	 * com.king.dao.comment 
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
	 * com.king.dao.comment 
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
