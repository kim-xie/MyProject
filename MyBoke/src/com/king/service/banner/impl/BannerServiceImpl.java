package com.king.service.banner.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.king.bean.Banner;
import com.king.bean.Params;
import com.king.dao.banner.IBannerMapper;
import com.king.service.banner.IBannerService;
import com.king.util.TmStringUtils;

/**
 * banner轮播图serviceImpl
 * IBannerService
 * 创建人:king 
 * 时间：2016年06月15日 14:00:35
 * @version 1.0.0
 */
@Service("bannerService")
public class BannerServiceImpl implements IBannerService{

	@Resource
	private IBannerMapper bannerMapper;
	
	@Override
	public List<Banner> findBanners(Params params){
		if(TmStringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return bannerMapper.findBanners(params);
	}
	
	@Override
	public int countBanner(Params params){
		return bannerMapper.countBanner(params);
	}

	@Override
	public Banner getBanner(Integer id) {
		return bannerMapper.getBanner(id);
	}

	@Override
	public boolean saveBanner(Banner banner) {
		int count = bannerMapper.saveBanner(banner);
		return count>0?true:false;
	}

	@Override
	public boolean updateBanner(Banner banner) {
		int count = bannerMapper.updateBanner(banner);
		return count>0?true:false;
	}

	@Override
	public boolean deleteBanner(Params params) {
		int count = bannerMapper.deleteBanner(params);
		return count>0?true:false;
	}
}
