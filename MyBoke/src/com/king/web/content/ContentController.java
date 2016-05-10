package com.king.web.content;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Content;
import com.king.service.content.ContentService;
import com.king.util.TmStringUtils;
import com.king.web.BaseController;

@Controller
@RequestMapping("/content")
public class ContentController extends BaseController{
	@Resource(name="contentService")
	private ContentService contentService;
	
	@RequestMapping("/findAll.do")
	public ModelAndView findall(){
		ModelAndView modelAndView = new ModelAndView();
		List<Content> contents = contentService.findAll();
		modelAndView.setViewName("index");
		modelAndView.addObject("content",contents);
		return modelAndView;
	}
	@RequestMapping("/save.do")
	@ResponseBody
	public String saveContent(Content content){
		if(content != null){
			content.setCreateTime(TmStringUtils.dateFormat(new Date()));
			
			boolean flay = contentService.save(content);
			
			if(flay){
				return "success";
			}else{
				return "fail";
			}
		}else{
			return "error";
		}
	}
}
