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

import com.king.bean.Music;
import com.king.bean.Params;
import com.king.bean.User;
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
	public ModelAndView index(Params params){
		List<HashMap<String, Object>> musics = musicService.findMusics(params);
		int itemCount = musicService.count(params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("musics", musics);
		modelAndView.addObject("itemCount", itemCount);
		modelAndView.setViewName("music/template");
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
	public ModelAndView detail(@PathVariable("id")Integer id,Params params){
		HashMap<String,Object> music = musicService.getMusic(id);
		int itemCount = musicService.count(params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemCount", itemCount);
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
		List<HashMap<String, Object>> musics = musicService.findMusics(params);
		return musics;
	}
	
	/**
	 * @Title: save 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param music
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String saveMusic(Music music){
		if(music != null){
			User user = (User) request.getSession().getAttribute("user");
			music.setUserId(user.getUserId());
			music.setIsDelete(0);
			music.setStatus(1);
			music.setComments(0);
			music.setHits(0);
			music.setCollections(0);
			music.setLoves(0);
			boolean flay = musicService.save(music);
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
	 * @Title: update 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param music
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateMusic(Music music){
		musicService.update(music);
		return "success";
	}
	
	/**
	 * @Title: delete 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public String delete(Params Params){
		musicService.delete(Params);
		return "success";
	}
	
}
