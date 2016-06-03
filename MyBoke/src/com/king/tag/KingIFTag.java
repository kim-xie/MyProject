package com.king.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * if标签
 * 类名: KingIFTag.java
 * 创建人: king 
 * 创建时间：2016年5月31日 下午12:51:19 
 * @version 1.0.0
 */
public class KingIFTag extends TagSupport{
	
	private Boolean test;

	public Boolean getTest() {
		return test;
	}

	public void setTest(Boolean test) {
		this.test = test;
	}

	@Override
	public int doStartTag() throws JspException {
		return EVAL_BODY_INCLUDE;//继续去执行标签体的内容
		//SKIP_BODY====默认值就是skip_body---忽略标签体直接进入doEndTag()
	}
	
}
