package com.king.web;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.king.bean.Content;
import com.king.service.ContentService;
import com.king.util.TmStringUtils;

@Controller
@RequestMapping("/content")
public class ContentController extends BaseController{
	@Resource(name="contentService")
	private ContentService contentService;
	
	@RequestMapping("/findAll.do")
	public String findall(){
		
		//List<Content> contents = contentService.findAll();
		
		return null;
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
