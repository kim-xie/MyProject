package com.king.service.content.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.king.bean.Content;
import com.king.bean.ContentParams;
import com.king.dao.content.ContentMapper;
import com.king.service.content.ContentService;
@Service("contentService")
public class ContentServiceImpl implements ContentService{
	
	@Resource(name="contentMapper")
	private ContentMapper contentMapper;
	
	/**
	 * 可以根据条件查找所有内容
	 */
	@Override
	public List<Content> findContents(ContentParams params) {
		List<Content> contents = contentMapper.findContents(params);
		return contents;
	}
	/**
	 * 根据id查找详细内容
	 */
	@Override
	public Content getContent(Integer id) {
		return contentMapper.getContent(id);
	}
	/**
	 * 添加内容
	 */
	@Override
	public boolean saveContent(Content content) {
		int count = contentMapper.saveContent(content);
		return count>0?true:false;
	}
	/**
	 * 修改内容
	 */
	@Override
	public boolean updateContent(Content content) {
		int count = contentMapper.updateContent(content);
		return count>0?true:false;
	}
	/**
	 * 删除内容
	 */
	@Override
	public boolean deleteContent(Integer id) {
		int count = contentMapper.deleteContent(id);
		return count>0?true:false;
	}
	/**
	 * 查询总记录数
	 */
	@Override
	public int count(ContentParams params) {
		return contentMapper.count(params);
	}

}
