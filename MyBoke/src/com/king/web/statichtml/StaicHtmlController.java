package com.king.web.statichtml;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Content;
import com.king.bean.ContentParams;
import com.king.service.content.ContentService;
import com.king.util.TmStringUtils;
import com.king.web.BaseController;

@Controller
@RequestMapping("/static")
public class StaicHtmlController extends BaseController{

	@Resource
	public ContentService contentService;
	
	/**
	 * 难点：静态化得同一条数据是静态页面是覆盖而不是新增.
	 */
	
	@RequestMapping("/html/{id}")
	@ResponseBody
	public String staticHtml(@PathVariable("id")Integer id){
		Content content = contentService.getContent(id);
		if(content!=null){
			//模板页面1
			String temppath = "/WEB-INF/pages/index.jsp";
//			//模板页面2
//			String temppath = "/WEB-INF/pages/template/content2.jsp";
//			//模板页面3
//			String temppath = "/WEB-INF/pages/template/content2.jsp";
			String name = StaticHtmlUtils.staticContent(id,content.getStaticLink(),temppath,request,response);
			if(TmStringUtils.isNotEmpty(name)){
				//静态化成功,更改路径
				content.setStaticLink(name);
				content.setUpdateTime(TmStringUtils.dateFormat(new Date()));
				contentService.updateContent(content);
				return "success";
			}else{
				return "fail";
			}
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/content/{id}")
	public ModelAndView content(@PathVariable("id")Integer id){
		ModelAndView andView = new ModelAndView();
		//根据内容id查询内容信息
		Content content = contentService.getContent(id);
		//放入作用域
		andView.addObject("content", content); //request.setAttribute("content",content);
		andView.setViewName("content/detail");//request.getRequestDispatcher("template/content./jsp").forward(request,reponse);
		return andView;
	}
	
	@RequestMapping("/content/index")
	public ModelAndView contentlist(){
		ModelAndView andView = new ModelAndView();
		//根据内容id查询内容信息
		ContentParams params = new ContentParams();
		params.setIsDelete(0);
		params.setPageNo(0);
		params.setPageSize(100);
		List<Content> contents = contentService.findContents(params);
		//放入作用域
		andView.addObject("contents", contents); //request.setAttribute("content",content);
		andView.setViewName("index");//request.getRequestDispatcher("template/content./jsp").forward(request,reponse);
		return andView;
	}
	
	
	@RequestMapping("/content2/{id}")
	public ModelAndView content2(@PathVariable("id")Integer id){
		ModelAndView andView = new ModelAndView();
		andView.addObject("id", id);
		andView.setViewName("content/detail");//request.getRequestDispatcher("template/content./jsp").forward(request,reponse);
		return andView;
	}
}
