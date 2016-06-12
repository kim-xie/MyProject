package com.king.web.fan;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Fan;
import com.king.bean.Params;
import com.king.bean.User;
import com.king.service.fan.IFanService;
import com.king.web.BaseController;
/**
 * 粉丝信息web
 * FanController
 * 创建人:king
 * 时间：2016年06月04日 21:15:25
 * @version 1.0.0
 */
@Controller
@RequestMapping("/fan")
public class FanController extends BaseController implements ServletContextAware{
	// 注入上下文应用拿到ip和username
	private ServletContext application;
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}
	
	@Resource(name="fanService")
	private IFanService fanService;
	
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
	public ModelAndView list(Params params){
		ModelAndView modelAndView = new ModelAndView();
		User user = (User) application.getAttribute("user_log");
		params.setFanId(user.getUserId());
		List<Fan> fans = fanService.findFans(params);
		int count = fanService.countFan(params);
		modelAndView.setViewName("fan/list");
		modelAndView.addObject("fans",fans);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	
	/**
	 * 查询所有Fan返回模板页面
	 * @Title: template 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/template")
	public ModelAndView template(Params params){
		ModelAndView modelAndView = new ModelAndView();
		List<Fan> fans = fanService.findFans(params);
		int count = fanService.countFan(params);
		modelAndView.setViewName("fan/template");
		modelAndView.addObject("fans",fans);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	/**
	 * 添加保存Fan
	 * @Title: saveFan 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param fan
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String saveFan(Fan fan){
		if(fan != null){
			User user = (User) application.getAttribute("user_log");
			fan.setFanId(user.getUserId());
			fan.setFanName(user.getUserName());
			fan.setIsDelete(0);
			boolean flay = fanService.saveFan(fan);
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
	 * 查询Fan详情
	 * @Title: detail 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}")
	public ModelAndView getFan(@PathVariable("id")Integer id){
		ModelAndView modelAndView = new ModelAndView();
		Fan fan = fanService.getFan(id);
		modelAndView.setViewName("fan/detail");
		modelAndView.addObject("fan",fan);
		return modelAndView;
	}
	/**
	 * 更新Fan
	 * @Title: update 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateFan(Fan fan){
		
		return fanService.updateFan(fan)?"success":"fail";
	}
	
	/**
	 * 删除Fan
	 * @Title: delete 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteFan(Params Params){
		return fanService.deleteFan(Params)?"success":"fail";
	}
}
