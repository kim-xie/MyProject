package com.king.web.banner;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Banner;
import com.king.bean.Params;
import com.king.bean.User;
import com.king.service.banner.IBannerService;
import com.king.web.BaseController;

/**
 * banner轮播图web
 * BannerController
 * 创建人:king
 * 时间：2016年06月15日 14:00:35
 * @version 1.0.0
 */
@Controller
@RequestMapping("/banner")
public class BannerController extends BaseController{
	
	@Resource(name="bannerService")
	private IBannerService bannerService;
	
	/**
	 * 跳转到列表页面
	 * @Title: list 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/list")
	public String list(Params params){
		return "banner/list";
	}
	
	/**
	 * 查询所有Banner返回模板页面
	 * @Title: template 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/template")
	public ModelAndView template(Params params){
		ModelAndView modelAndView = new ModelAndView();
		List<Banner> banners = bannerService.findBanners(params);
		int count = bannerService.countBanner(params);
		modelAndView.setViewName("banner/template");
		modelAndView.addObject("banners",banners);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	/**
	 * 添加保存Banner
	 * @Title: saveBanner 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param banner
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String saveBanner(Banner banner){
		if(banner != null){
			User user = (User) request.getSession().getAttribute("user");
			banner.setUserId(user.getUserId());
			banner.setUserName(user.getUserName());
			banner.setIsDelete(0);
			boolean faly = bannerService.saveBanner(banner);
			if(faly){
				return "success";
			}else{
				return "fail";
			}
		}else{
			return "error";
		}
	}
	/**
	 * 查询Banner详情
	 * @Title: getBanner 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}")
	public ModelAndView getBanner(@PathVariable("id")Integer id){
		ModelAndView modelAndView = new ModelAndView();
		Banner banner = bannerService.getBanner(id);
		modelAndView.setViewName("banner/detail");
		modelAndView.addObject("banner",banner);
		return modelAndView;
	}
	/**
	 * 更新Banner
	 * @Title: updateBanner 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateBanner(Banner banner){
		return bannerService.updateBanner(banner)?"success":"fail";
	}
	
	/**
	 * 删除Banner
	 * @Title: deleteBanner 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteBanner(Params Params){
		return bannerService.deleteBanner(Params)?"success":"fail";
	}
}
