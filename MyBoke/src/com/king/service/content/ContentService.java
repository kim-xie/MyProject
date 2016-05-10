package com.king.service.content;

import java.util.List;

import com.king.bean.Content;

public interface ContentService {
	/**
	 * @Title: findAll 
	 * @Description: TODO(查询所有内容) 
	 * @param @return  参数说明 
	 * @return List<Content>  返回类型 
	 * @throws
	 */
	List<Content> findAll();
	/**
	 * @Title: findById 
	 * @Description: TODO(根据id查询内容) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return Content  返回类型 
	 * @throws
	 */
	Content findById(Integer id);
	/**
	 * @Title: save 
	 * @Description: TODO(添加内容) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return Boolean  返回类型 
	 * @throws
	 */
	boolean save(Content content);
	/**
	 * @Title: update 
	 * @Description: TODO(修改内容) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return Boolean  返回类型 
	 * @throws
	 */
	boolean update(Content content);
	/**
	 * @Title: delete 
	 * @Description: TODO(删除内容) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return Boolean  返回类型 
	 * @throws
	 */
	boolean delete(Integer id);
}
