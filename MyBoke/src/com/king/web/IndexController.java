package com.king.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Banner;
import com.king.bean.ContentParams;
import com.king.bean.Params;
import com.king.bean.User;
import com.king.bean.UserParams;
import com.king.service.banner.IBannerService;
import com.king.service.content.ContentService;
import com.king.service.music.IMusicService;
import com.king.service.user.UserService;
@Controller
public class IndexController extends BaseController implements ServletContextAware{
	// 注入上下文应用拿到ip和username
	private ServletContext application;
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}
	/**
	 * 注入userService
	 */
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "musicService")
	private IMusicService musicService;
	@Resource(name="contentService")
	private ContentService contentService;
	@Resource(name="bannerService")
	private IBannerService bannerService;
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
		// 音乐
		int itemCount = musicService.count(params);
		// 用户
		User user = (User) application.getAttribute("user_log");
		userParams.setFilterId(user.getUserId());
		List<User> users = userService.findAllUsers(userParams);
		// 内容
		int count = contentService.countContent(contentparams);
		//banner
		List<Banner> banners = bannerService.findBanners(params);
		
		model.setViewName("index");
		model.addObject("banners", banners);
		model.addObject("itemCount", itemCount);
		model.addObject("count", count);
		model.addObject("users",users);
		return model;
	}
	
	
}
