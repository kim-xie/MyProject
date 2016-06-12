package com.king.service.fan.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.king.bean.Fan;
import com.king.bean.Params;
import com.king.dao.fan.IFanMapper;
import com.king.service.fan.IFanService;
import com.king.util.TmStringUtils;

/**
 * 粉丝信息serviceImpl
 * IFanService
 * 创建人:king 
 * 时间：2016年06月04日 21:15:25
 * @version 1.0.0
 */
@Service("fanService")
public class FanServiceImpl implements IFanService{

	@Resource
	private IFanMapper fanMapper;
	
	@Override
	public List<Fan> findFans(Params params){
		if(TmStringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return fanMapper.findFans(params);
	}
	
	@Override
	public int countFan(Params params){
		return fanMapper.countFan(params);
	}

	@Override
	public Fan getFan(Integer id) {
		return fanMapper.getFan(id);
	}

	@Override
	public boolean saveFan(Fan fan) {
		int count = fanMapper.saveFan(fan);
		return count>0? true:false;
	}

	@Override
	public boolean updateFan(Fan fan) {
		int count = fanMapper.updateFan(fan);
		return count>0? true:false;
	}

	@Override
	public boolean deleteFan(Params params) {
		int count = fanMapper.deleteFan(params);
		return count>0? true:false;
	}
}
