package com.king.service.content.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.king.bean.Content;
import com.king.dao.content.ContentMapper;
import com.king.service.content.ContentService;
@Service("contentService")
public class ContentServiceImpl implements ContentService{
	
	@Resource(name="contentMapper")
	private ContentMapper contentMapper;
	
	@Override
	public List<Content> findAll() {
		List<Content> contents = contentMapper.findAll();
		for(Content content:contents){
			System.out.println(content.getContent()+"=="+content.getTitle());
		}
		return contents;
	}

	@Override
	public Content findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean save(Content content) {
		int count = contentMapper.save(content);
		return count>0?true:false;
	}

	@Override
	public boolean update(Content content) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

}
