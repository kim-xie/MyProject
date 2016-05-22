package com.king.web.content;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Content;
import com.king.bean.User;
import com.king.service.content.ContentService;
import com.king.util.TmStringUtils;
import com.king.web.BaseController;

@Controller
@RequestMapping("/content")
public class ContentController extends BaseController{
	
	@Resource(name="contentService")
	private ContentService contentService;
	
	/**
	 * 添加内容
	 * @Title: saveContent 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/save.do")
	@ResponseBody
	public String saveContent(Content content){
		if(content != null){
			User user = (User) request.getSession().getAttribute("user");
			content.setCreateTime(TmStringUtils.dateFormat(new Date()));
			content.setUserId(user.getUserId());
			content.setUserName(user.getUserName());
			content.setHeaderPic(user.getHeaderPic());
			content.setIsTop(1);
			content.setIsDelete(0);
			content.setIsComment(1);
			content.setStatus(1);
			content.setPush(1);
			content.setComments(0);
			content.setHits(0);
			content.setCollections(0);
			content.setLoves(0);
			boolean flay = contentService.saveContent(content);
			if(flay){
				return "success";
			}else{
				return "fail";
			}
		}else{
			return "error";
		}
	}
	/**
	 * 查询详情
	 * @Title: template 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}.do")
	public ModelAndView template(@PathVariable("id")Integer id){
		ModelAndView modelAndView = new ModelAndView();
		Content content = contentService.getContent(id);
		System.out.println(content.getContent());
		modelAndView.setViewName("content/detail");
		modelAndView.addObject("content",content);
		return modelAndView;
	}
	/**
	 * 更新内容
	 * @Title: update 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public String update(Content content){
		contentService.updateContent(content);
		return "success";
	}
	
	/**
	 * 删除内容
	 * @Title: delete 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public String delete(Integer id){
		contentService.deleteContent(id);
		return "success";
	}
}
