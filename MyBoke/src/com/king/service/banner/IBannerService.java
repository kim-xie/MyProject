package com.king.service.banner;

import java.util.List;

import com.king.bean.Banner;
import com.king.bean.Params;

/**
 * IBannerService
 * 创建人:king 
 * 时间：2016年06月15日 14:00:35
 * @version 1.0.0
 * 
 */
public interface IBannerService {
	/**
	 * com.king.service.banner 
	 * 方法名：findBanners
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月15日 14:00:35
	 * @param params
	 * @return 
	 * 返回类型：List<Banner>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Banner> findBanners(Params params);
	
	/**
	 * 求总数
	 * com.king.dao.banner 
	 * 方法名：count
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月15日 14:00:35
	 * @param id
	 * @return 
	 * 返回类型：List<Banner>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countBanner(Params params);
	
	/**
	 * com.king.service.banner 
	 * 方法名：findBanners
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月15日 14:00:35
	 * @param params
	 * @return 
	 * 返回类型：List<Banner>
	 * @exception 
	 * @since  1.0.0
	 */
	public Banner getBanner(Integer id);
	
	/**
	 * 保存banner轮播图
	 * com.king.service.banner 
	 * 方法名：save
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月15日 14:00:35 
	 * @param banner
	 * @return 
	 * 返回类型：Banner
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean saveBanner(Banner banner);
	
	/**
	 * 更新banner轮播图
	 * com.king.service.banner 
	 * 方法名：update
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月15日 14:00:35
	 * @param banner
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean updateBanner(Banner banner);
	
	/**
	 * 删除banner轮播图
	 * com.king.service.banner 
	 * 方法名：delete
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月15日 14:00:35
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean deleteBanner(Params params);
}
