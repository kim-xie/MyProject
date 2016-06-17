package com.king.service.comment.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.king.bean.Comment;
import com.king.bean.Params;
import com.king.dao.comment.ICommentMapper;
import com.king.service.comment.ICommentService;
import com.king.util.TmStringUtils;

/**
 * 评论信息serviceImpl
 * ICommentService
 * 创建人:king 
 * 时间：2016年05月29日 21:24:05
 * @version 1.0.0
 */
@Service("commentService")
public class CommentServiceImpl implements ICommentService{

	@Resource
	private ICommentMapper commentMapper;
	
	@Override
	public List<HashMap<String, Object>> findComments(Params params){
		if(TmStringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return commentMapper.findComments(params);
	}
	
	@Override
	public int countComment(Params params){
		return commentMapper.countComment(params);
	}

	@Override
	public Comment getComment(Params params) {
		return commentMapper.getComment(params);
	}

	@Override
	public int saveComment(Comment comment) {
		return commentMapper.saveComment(comment);
	}

	@Override
	public int updateComment(Comment comment) {
		return commentMapper.updateComment(comment);
	}

	@Override
	public int deleteComment(Params params) {
		return commentMapper.deleteComment(params);
	}

	@Override
	public List<HashMap<String, Object>> findContentComments(Params params) {
		return commentMapper.findContentComments(params);
	}
}
