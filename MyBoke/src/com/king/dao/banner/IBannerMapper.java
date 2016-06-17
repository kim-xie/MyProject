package com.king.dao.banner;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.king.bean.Banner;
import com.king.bean.Params;

/**
 * banner轮播图Mapper
 * IBannerMapper
 * 创建人:king 
 * 时间：2016年06月15日 14:00:35
 * @version 1.0.0
 */
@Repository("bannerMapper")
public interface IBannerMapper {

	/**
	 * com.king.dao.banner 
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
	 * com.king.dao.banner 
	 * 方法名：getBanner
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月15日 14:00:35
	 * @param id
	 * @return 
	 * 返回类型：List<Banner>
	 * @exception 
	 * @since  1.0.0
	 */
	public Banner getBanner(Integer id);
	
	/**
	 * 保存banner轮播图
	 * com.king.dao.banner 
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
	public int saveBanner(Banner banner);
	
	/**
	 * 更新banner轮播图
	 * com.king.dao.banner 
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
	public int updateBanner(Banner banner);
	
	/**
	 * 删除banner轮播图
	 * com.king.dao.banner 
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
	public int deleteBanner(Params params);
	
}
