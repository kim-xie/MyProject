package com.king.tag;

//package com.king.tag;

//import java.util.Iterator;
//import java.util.List;

//import javax.servlet.jsp.JspException;
//import javax.servlet.jsp.tagext.TagSupport;
//import com.king.dao.ContentDao;
//import com.king.model.Content;
//import com.king.util.StringUtils;

//public class ContentListTag extends TagSupport {

//	List<Content> contents = ContentDao.findContents(3, 0, 7);
//	pageContext.setAttribute("contents", contents);
//
//	// 内容Id
//	private Integer channelId;
//	private Integer pageNo;
//	private Integer pageSize;
//	private String sort;
//	private String var;
//	
//	//初始化迭代器
//	private Iterator<Content> iterator;
//	private int index = 0;
//	
//	
//	@Override
//	public int doStartTag() throws JspException {
//		//默认值的设定
//		if(pageNo==null)pageNo = 0;
//		if(pageSize==null)pageSize=10;
//		if(StringUtils.isEmpty(sort))sort="desc";
//		if(StringUtils.isEmpty(var))var="content";
//		//查询内容
//		List<Content> contents = ContentDao.findContents(channelId, pageNo,pageSize,sort);
//		//如果内容等于null
//		if(contents==null || contents.size()==0){
//			return SKIP_BODY;
//		}
//		//初始化迭代器
//		iterator = contents.iterator();
//		if(iterator.hasNext()){
//			//将每一条数据放入作用域进行返回
//			this.pageContext.setAttribute(var, iterator.next());
//			this.pageContext.setAttribute(var+"_index", index);
//			this.pageContext.setAttribute(var+"_size", contents.size());
//			return EVAL_BODY_INCLUDE;
//		}else{
//			return SKIP_BODY;
//		}
//	}
//	
//
//	@Override
//	public int doAfterBody() throws JspException {
//		//循环迭代标签体
//		if(iterator.hasNext()){
//			index++;
//			this.pageContext.setAttribute(var, iterator.next());
//			this.pageContext.setAttribute(var+"_index", index);
//			return EVAL_BODY_AGAIN;
//		}else{
//			return SKIP_BODY;
//		}
//	}
//
//	
//	//清空的，让变量重新初始化，因为在一个页面可能会出现很多同样的标签。
//	@Override
//	public int doEndTag() throws JspException {
//		var = null;
//		iterator = null;
//		channelId  = null;
//		index = 0;
//		return EVAL_BODY_AGAIN;
//	}
//	
//	
//
//	@Override
//	public void release() {
//		var = null;
//		iterator = null;
//		channelId  = null;
//		index = 0;
//	}
//
//
//	public Integer getChannelId() {
//		return channelId;
//	}
//
//	public void setChannelId(Integer channelId) {
//		this.channelId = channelId;
//	}
//
//	public Integer getPageNo() {
//		return pageNo;
//	}
//
//	public void setPageNo(Integer pageNo) {
//		this.pageNo = pageNo;
//	}
//
//	public Integer getPageSize() {
//		return pageSize;
//	}
//
//	public void setPageSize(Integer pageSize) {
//		this.pageSize = pageSize;
//	}
//
//	public String getVar() {
//		return var;
//	}
//
//	public void setVar(String var) {
//		this.var = var;
//	}
//
//
//	public String getSort() {
//		return sort;
//	}
//
//
//	public void setSort(String sort) {
//		this.sort = sort;
//	}
//}