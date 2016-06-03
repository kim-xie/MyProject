package com.king.dao.content;

import java.util.List;

import com.king.bean.Content;
import com.king.bean.ContentParams;

public interface ContentMapper {
	/**
	 * @Title: findContents 
	 * @Description: TODO(查询所有内容) 
	 * @param @return  参数说明 
	 * @return List<Content>  返回类型 
	 * @throws
	 */
	List<Content> findContents(ContentParams params);
	/**
	 * @Title: getContent 
	 * @Description: TODO(根据id查询内容) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return Content  返回类型 
	 * @throws
	 */
	Content getContent(Integer id);
	/**
	 * @Title: saveContent 
	 * @Description: TODO(添加内容) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return Boolean  返回类型 
	 * @throws
	 */
	int saveContent(Content content);
	/**
	 * @Title: updateContent 
	 * @Description: TODO(修改内容) 
	 * @param @param content
	 * @param @return  参数说明 
	 * @return Boolean  返回类型 
	 * @throws
	 */
	int updateContent(Content content);
	/**
	 * @Title: deleteContent 
	 * @Description: TODO(删除内容) 
	 * @param @param id
	 * @param @return  参数说明 
	 * @return Boolean  返回类型 
	 * @throws
	 */
	int deleteContent(ContentParams params);
	/**
	 * @Title: count 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param params
	 * @param @return  参数说明 
	 * @return int  返回类型 
	 * @throws
	 */
	int countContent(ContentParams params);
}
