package com.king.service.fan;

import java.util.List;

import com.king.bean.Fan;
import com.king.bean.Params;
/**
 * IFanService
 * 创建人:king 
 * 时间：2016年06月04日 21:15:25
 * @version 1.0.0
 * 
 */
public interface IFanService {
	/**
	 * com.king.service.fan 
	 * 方法名：findFans
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月04日 21:15:25
	 * @param params
	 * @return 
	 * 返回类型：List<Fan>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Fan> findFans(Params params);
	
	/**
	 * 求总数
	 * com.king.dao.fan 
	 * 方法名：count
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月04日 21:15:25
	 * @param id
	 * @return 
	 * 返回类型：List<Fan>
	 * @exception 
	 * @since  1.0.0
	 */
	public int countFan(Params params);
	
	/**
	 * com.king.service.fan 
	 * 方法名：findFans
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月04日 21:15:25
	 * @param params
	 * @return 
	 * 返回类型：List<Fan>
	 * @exception 
	 * @since  1.0.0
	 */
	public Fan getFan(Integer id);
	
	/**
	 * 保存粉丝信息
	 * com.king.service.fan 
	 * 方法名：save
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月04日 21:15:25 
	 * @param fan
	 * @return 
	 * 返回类型：Fan
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean saveFan(Fan fan);
	
	/**
	 * 更新粉丝信息
	 * com.king.service.fan 
	 * 方法名：update
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月04日 21:15:25
	 * @param fan
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean updateFan(Fan fan);
	
	/**
	 * 删除粉丝信息
	 * com.king.service.fan 
	 * 方法名：delete
	 * 创建人：king 
	 * 手机号码:18378311282
	 * 时间：2016年06月04日 21:15:25
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public boolean deleteFan(Params params);
}
