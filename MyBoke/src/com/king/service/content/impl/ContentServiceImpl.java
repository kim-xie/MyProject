package com.king.service.content.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.king.bean.Content;
import com.king.bean.ContentParams;
import com.king.dao.content.ContentMapper;
import com.king.service.content.ContentService;
import com.king.util.TmStringUtils;
@Service("contentService")
public class ContentServiceImpl implements ContentService{
	
	@Resource(name="contentMapper")
	private ContentMapper contentMapper;
	
	/**
	 * 可以根据条件查找所有内容
	 */
	@Override
	public List<Content> findContents(ContentParams params) {
		if(TmStringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
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
	public boolean deleteContent(ContentParams params) {
		int count = contentMapper.deleteContent(params);
		return count>0?true:false;
	}
	/**
	 * 查询总记录数
	 */
	@Override
	public int countContent(ContentParams params) {
		return contentMapper.countContent(params);
	}

}
