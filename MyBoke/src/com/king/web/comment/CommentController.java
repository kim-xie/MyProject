package com.king.web.comment;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;

import com.king.bean.Comment;
import com.king.bean.Params;
import com.king.bean.User;
import com.king.service.comment.ICommentService;
import com.king.web.BaseController;

/**
 * 评论信息web
 * CommentController
 * 创建人:king
 * 时间：2016年05月29日 21:24:05
 * @version 1.0.0
 */
@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController implements ServletContextAware{
	// 注入上下文应用拿到ip和username
	private ServletContext application;
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}
	@Resource(name="commentService")
	private ICommentService commentService;
	
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/save")
	public Comment saveComment(Comment comment){
		User user = (User) application.getAttribute("user_log");
		Integer userId = user.getUserId();
		comment.setStatus(1);
		comment.setUserId(userId);
		commentService.saveComment(comment);
		return comment;
	}
	
	/**
	 * 查询评论信息
	 * 方法名：saveComment
	 * 创建人：king 
	 * 时间：2016年5月29日-上午12:03:10 
	 * @param comment
	 * @param request
	 * @return Comment
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/load")
	public List<HashMap<String, Object>>  saveComment(Params params){
		params.setStatus(1);
		List<HashMap<String, Object>> comments = commentService.findComments(params);
		return comments;
	}
}
