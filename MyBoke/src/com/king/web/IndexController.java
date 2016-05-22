package com.king.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Content;
import com.king.bean.ContentParams;
import com.king.bean.Params;
import com.king.bean.User;
import com.king.bean.UserParams;
import com.king.service.content.ContentService;
import com.king.service.music.IMusicService;
import com.king.service.user.UserService;
@Controller
public class IndexController {
	/**
	 * 注入userService
	 */
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "musicService")
	private IMusicService musicService;
	@Resource(name="contentService")
	private ContentService contentService;
	
	/**
	 * @Title: userList 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/index.do")
	public ModelAndView index(Params params,UserParams userParams,ContentParams contentparams){
		ModelAndView model = new ModelAndView();
		List<HashMap<String, Object>> musics = musicService.findMusics(params);
		List<User> users = userService.findAllUsers(userParams);
		List<Content> contents = contentService.findContents(contentparams);
		model.setViewName("index");
		model.addObject("musics", musics);
		model.addObject("users",users);
		model.addObject("contents",contents);
		return model;
	}
	
	@RequestMapping("/userList.do")
	@ResponseBody
	public ModelAndView userList(UserParams userParams){
		ModelAndView model = new ModelAndView();
		List<User> users = userService.findAllUsers(userParams);
		model.setViewName("index");
		model.addObject("users",users);
		return model;
	}
}
