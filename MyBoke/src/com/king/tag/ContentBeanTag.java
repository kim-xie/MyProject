package com.king.tag;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.king.bean.Content;
import com.king.service.content.ContentService;
import com.king.util.TmStringUtils;
/**
 * 实体标签
 * 类名: ContentBeanTag.java
 * 创建人: king 
 * 创建时间：2016年5月31日 下午1:09:36 
 * @version 1.0.0
 */
public class ContentBeanTag extends BodyTagSupport {
	private String var;// 变量的对象名称
	private Integer cid;

	public int doStartTag() throws JspException {
		//获取serlet上下文
		ServletContext context = this.pageContext.getServletContext();
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
		ContentService contentService = (ContentService) ctx.getBean("contentServiceImpl");
		//根据id获取内容
		Content content = contentService.getContent(cid);
		if (TmStringUtils.isEmpty(var))var = "content";
		pageContext.setAttribute(var, content);
		return SKIP_BODY;
	}

	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	public void setVar(String var) {
		this.var = var;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}
}
