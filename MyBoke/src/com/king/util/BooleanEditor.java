package com.king.util;

import java.beans.PropertyEditorSupport;
/**
 * 
 * 类名: BooleanEditor.java
 * 创建人: king 
 * 创建时间：2016年4月21日 下午2:16:18 
 * @version 1.0.0
 */
public class BooleanEditor extends PropertyEditorSupport{
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if(TmStringUtils.isNotEmpty(text)){
			if(text.equalsIgnoreCase("3"))setValue(true);
			if(text.equalsIgnoreCase("4"))setValue(false);
		}else{
			setValue(false);
		}
	}
}
