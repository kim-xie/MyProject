package com.king.service.music;

import java.util.HashMap;
import java.util.List;

import com.king.bean.Music;
import com.king.bean.Params;

/**
 * IMusicService
 * 创建人:king 
 * 时间：2016年05月19日 19:45:34
 * @version 1.0.0
 * 
 */
public interface IMusicService {
	/**
	 * com.king.service.music 
	 * 方法名：findMusics
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月19日 19:45:34
	 * @param params
	 * @return 
	 * 返回类型：List<Music>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findMusics(Params params);
	
	/**
	 * 求总数
	 * com.king.dao.music 
	 * 方法名：count
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月19日 19:45:34
	 * @param id
	 * @return 
	 * 返回类型：List<Music>
	 * @exception 
	 * @since  1.0.0
	 */
	public int count(Params params);
	
	/**
	 * 
	 * com.king.service.music 
	 * 方法名：findMusics
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月19日 19:45:34
	 * @param params
	 * @return 
	 * 返回类型：List<Music>
	 * @exception 
	 * @since  1.0.0
	 */
	public HashMap<String, Object> getMusic(Integer id);
	
	/**
	 * 保存音乐主题
	 * com.king.service.music 
	 * 方法名：save
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月19日 19:45:34 
	 * @param music
	 * @return 
	 * 返回类型：Music
	 * @exception 
	 * @since  1.0.0
	 */
	public int save(Music music);
	
	/**
	 * 更新音乐主题
	 * com.king.service.music 
	 * 方法名：update
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月19日 19:45:34
	 * @param music
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int update(Music music);
	
	/**
	 * 删除音乐主题
	 * com.king.service.music 
	 * 方法名：delete
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年05月19日 19:45:34
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int delete(Params params);

}
