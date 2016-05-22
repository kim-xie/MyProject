/**
 * com.king.web.music
 * MusicController.java
 * 创建人:king
 * 时间：2016年05月19日 19:45:34
 */
package com.king.web.music;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.Params;
import com.king.service.music.IMusicService;
import com.king.web.BaseController;

/**
 * 音乐主题web
 * MusicController
 * 创建人:king
 * 时间：2016年05月19日 19:45:34
 * @version 1.0.0
 */
@Controller
@RequestMapping("/music")
public class MusicController extends BaseController{
	
	@Resource(name="musicService")
	private IMusicService musicService;
	
	
	@RequestMapping("/index.do")
	public ModelAndView index(Params params){
		List<HashMap<String, Object>> musics = musicService.findMusics(params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("musics", musics);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/loadData.do")
	public List<HashMap<String, Object>> loadData(Params params){
		params.setStatus(1);
		params.setIsDelete(0);
		List<HashMap<String, Object>> musics = musicService.findMusics(params);
		return musics;
	}
	/**
	 * 前往详情页
	 * @Title: detail 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/detail/{id}")
	public ModelAndView detail(@PathVariable("id")Integer id){
		HashMap<String,Object> music = musicService.getMusic(id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("music", music);
		modelAndView.setViewName("music/detail");
		return modelAndView;
	}
	/**
	 * 根据音乐的分类查询出相关音乐
	 * 方法名：relation
	 * 创建人：king 
	 * 时间：2016年4月25日-下午9:39:09 
	 * @param typeId
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/relation")
	public List<HashMap<String, Object>> relation(Params params){
		params.setStatus(1);
		params.setIsDelete(0);
		params.setPageSize(4);
		List<HashMap<String, Object>> blogs = musicService.findMusics(params);
		return blogs;
	}
	
}
