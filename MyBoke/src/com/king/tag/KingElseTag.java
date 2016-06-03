package com.king.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * else标签
 * 类名: KingElseTag.java
 * 创建人: king 
 * 创建时间：2016年5月31日 下午1:03:17 
 * @version 1.0.0
 */
public class KingElseTag extends TagSupport{
	
	@Override
	public int doStartTag() throws JspException {
		KingIFTag parent = (KingIFTag)this.getParent();
		if(parent!=null && !parent.getTest()){
			return EVAL_BODY_INCLUDE;//继续去执行标签体的内容
		}else{
			return SKIP_BODY;
		}
	}
}
