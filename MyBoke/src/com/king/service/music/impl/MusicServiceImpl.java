package com.king.service.music.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.king.bean.Music;
import com.king.bean.Params;
import com.king.dao.music.IMusicMapper;
import com.king.service.music.IMusicService;
import com.king.util.TmStringUtils;
/**
 * 音乐主题serviceImpl
 * IMusicService
 * 创建人:king 
 * 时间：2016年05月19日 19:45:34
 * @version 1.0.0
 */
@Service("musicService")
public class MusicServiceImpl implements IMusicService{

	@Resource
	private IMusicMapper musicMapper;
	
	@Override
	public List<HashMap<String, Object>> findMusics(Params params){
		if(TmStringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return musicMapper.findMusics(params);
	}
	
	@Override
	public int count(Params params){
		return musicMapper.count(params);
	}

	@Override
	public HashMap<String, Object> getMusic(Integer id) {
		return musicMapper.getMusic(id);
	}

	@Override
	public boolean save(Music music) {
		int count = musicMapper.save(music);
		return count>0?true:false;
	}

	@Override
	public int update(Music music) {
		return musicMapper.update(music);
	}

	@Override
	public int delete(Params params) {
		return musicMapper.delete(params);
	}
}
