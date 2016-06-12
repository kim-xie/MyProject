package com.king.web.content;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Content;
import com.king.bean.ContentParams;
import com.king.bean.User;
import com.king.service.content.ContentService;
import com.king.web.BaseController;

@Controller
@RequestMapping("/content")
public class ContentController extends BaseController{
	
	@Resource(name="contentService")
	private ContentService contentService;
	
	/**
	 * 前往留言板页面
	 * @Title: toResponse 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/response.do")
	public String toResponse() {
		return "common/response";
	}
	/**
	 * 将数据返回模板页面
	 * @Title: index 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/template.do")
	public ModelAndView index(ContentParams Params){
		List<Content> contents = contentService.findContents(Params);
		int itemCount = contentService.countContent(Params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contents", contents);
		modelAndView.addObject("itemCount", itemCount);
		modelAndView.setViewName("content/template");
		return modelAndView;
	}
	
	/**
	 * 加载数据
	 * @Title: loadData 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return List<HashMap<String,Object>>  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/loadData.do")
	public List<Content> loadData(ContentParams Params){
		Params.setStatus(1);
		Params.setIsDelete(0);
		Params.setPageSize(12);
		List<Content> contents = contentService.findContents(Params);
		return contents;
	}
	
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
	public String delete(ContentParams Params){
		contentService.deleteContent(Params);
		return "success";
	}
}
