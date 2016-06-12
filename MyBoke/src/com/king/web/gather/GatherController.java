package com.king.web.gather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.json.JSONUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.king.bean.Content;
import com.king.bean.Gather;
import com.king.bean.Music;
import com.king.dao.music.IMusicMapper;
import com.king.service.content.ContentService;
import com.king.util.TmStringUtils;
/**
 * 获取网络资源
 * 类名: GatherController.java
 * 创建人: king 
 * 创建时间：2016年6月3日 下午11:12:20 
 * @version 1.0.0
 */
@Controller
@RequestMapping("/gather")
public class GatherController extends com.king.web.BaseController{
	
	@Resource
	private ContentService contentService;
	
	@Resource
	private IMusicMapper musicMapper;
	
	/*列表查询*/
	@RequestMapping("/list")
	public String list(){
		return "gather/list";
	}
	
	@ResponseBody
	@RequestMapping("/data")
	public String gather(){
		
//		Gather gather = new Gather();
//		gather.setName("腾讯新闻");
//		gather.setUrl("http://www.qq.com");
//		gather.setCharset("gbk");
//		gather.setUserName("keke");
//		gather.setPrefix("http://news.qq.com/a/");
//		gather.setTitleRegex("h1");
//		gather.setTitleMark(2);//根据标签名称
//		gather.setContentMark(1);
//		gather.setContentRegex("Cnt-Main-Article-QQ");
//		gather.setImgMark(2);
//		gather.setImgRegex("img");
		
		
		/*Gather gather = new Gather();
		gather.setName("网易新闻");
		gather.setUrl("http://www.163.com/");
		gather.setCharset("gbk");
		gather.setUserName("king");
		gather.setPrefix("http://news.163.com/15/");
		gather.setTitleMark(1);//根据标签名称
		gather.setTitleRegex("h1title");
		gather.setContentMark(1);
		gather.setContentRegex("endText");
		gather.setImgMark(2);
		gather.setImgRegex("img");*/
		
		Gather gather = new Gather();
		gather.setName("ui");
		gather.setUrl("http://www.ui.cn/");
		gather.setCharset("gbk");
		gather.setUserName("king");
		gather.setPrefix("http://www.ui.cn/detail/");
		gather.setTitleMark(1);//根据标签名称
		gather.setTitleRegex("h1title");
		gather.setContentMark(1);
		gather.setContentRegex("endText");
		gather.setImgMark(2);
		gather.setImgRegex("img");
		
			
		//2：获取网页源代码
		String htmlsource = getHtmlSource(gather.getUrl(),gather.getCharset());
		Document document = Jsoup.parse(htmlsource);
//		Element e = document.getElementById(id);
		Set<String> set = new HashSet<>();
		Elements elements = document.getElementsByTag("a");
		for (Element element : elements) {
			String href = element.attr("href");
			if(TmStringUtils.isNotEmpty(href)&& href.startsWith(gather.getPrefix())){
				set.add(href);
			}
		}
		
		//URL地址循环，进行抓取
		for (String url:set) {
			try {
				Document doc = Jsoup.connect(url).get();
				if(doc!=null){
					String title  = null;
					if(gather.getTitleMark()==1){
						title= doc.getElementById(gather.getTitleRegex()).text();
					}else if(gather.getTitleMark()==2){
						title= doc.getElementsByTag(gather.getTitleRegex()).eq(0).text();
					}else if(gather.getTitleMark()==3){
						title= doc.getElementsByClass(gather.getTitleRegex()).eq(0).text();
					}
					
					Element contentDom = null;
					if(gather.getContentMark()==1){
						contentDom= doc.getElementById(gather.getContentRegex());
					}else if(gather.getContentMark()==2){
						contentDom= doc.getElementsByTag(gather.getContentRegex()).first();
					}else if(gather.getContentMark()==3){
						contentDom= doc.getElementsByClass(gather.getTitleRegex()).first();
					}
					
					String desc = contentDom.html();
					//抓取内容
					//抓取图片
					String img = contentDom.getElementsByTag("img").eq(0).attr("src");
					//根据图片的大小，后缀进一步的过滤
					Content content = new Content();
//					setContentData(content);
					content.setTitle(title);
					content.setContent(desc);
					content.setImage(img);
					contentService.saveContent(content);
				}
				
			} catch (Exception e) {
				continue;
			}
		}
		return "success";
	}
	
//	private void setContentData(Content content){
//		content.setStaticLink(null);
//		content.setIsTop(0);
//		content.setIsDelete(0);
//		content.setStatus(0);
//		content.setType(1);	
//		content.setPush(0);
//		content.setIsComment(1);
//		content.setHits(0);
//		content.setLoves(0);
//		content.setCollections(0);
//		content.setComments(0);
//		content.setHtmlCode("");
//		content.setJsCode("");
//		content.setCssCode("");
//		content.setIsCode(0);
//		content.setKeywords(content.getTag());
//	}
	
	
	public static String getHtmlSource(String netLink,String charset){
		StringBuffer buffer = new StringBuffer();
		try {
			URL url = new URL(netLink);
			URLConnection connection = url.openConnection();
			connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2547.0 Safari/537.36");
			InputStream inputStream = connection.getInputStream();
			InputStreamReader reader = new InputStreamReader(inputStream, charset);
			BufferedReader bufferedReader = new BufferedReader(reader);
			String line = null;
			while((line =bufferedReader.readLine())!=null){
				buffer.append(line+"\n");
			}
			bufferedReader.close();
			reader.close();
			inputStream.close();
			return buffer.toString();
		} catch (Exception e) {
			return "error";
		}
	}
	
	private void setContentData(Content content){
		content.setUserId(1);
		content.setUserName("king");
		content.setHeaderPic("/resources/imgs/header_pic/header_pic.jpg");
		content.setIsTop(1);
		content.setIsDelete(0);
		content.setIsComment(1);
		content.setStatus(1);
		content.setPush(1);
		content.setComments(0);
		content.setHits(0);
		content.setCollections(0);
		content.setLoves(0);
		content.setSubTitle(null);
		content.setStaticLink(null);
	}
	
	public static void main(String[] args) throws MalformedURLException, IOException {
		
		String htmlsource = getHtmlSource("http://www.ui.cn/","utf-8");
		//System.out.println(htmlsource);
		
		//1：导入jsoup.jar + javascript+jquery
		Document document = Jsoup.parse(htmlsource);

		//2：获取网页源代码
		Elements es = document.getElementsByClass("cover");
		Set<String> set = null;
		for(Element e : es){
			set = new HashSet<>();
			Elements elements = e.getElementsByTag("a");
			for (Element element : elements) {
				String href = element.attr("href");
				if(TmStringUtils.isNotEmpty(href) && href.startsWith("http://")){
					href = href.replace(href, "");
				}else{
					href = "http://www.ui.cn" + href;
					set.add(href);
				}
			}
			Elements imgs = e.getElementsByTag("img");
			for (Element element : imgs) {
				String src = element.attr("data-original");
				System.out.println("封面图片是："+src);
			}
			//URL地址循环，进行抓取
			for (String url:set) {
				try {
					Document doc = Jsoup.connect(url).get();
//					System.out.println(doc);
					if(doc!=null){
						//标题
						String title = doc.getElementsByTag("h1").eq(0).text();
						//标签
						Elements tagDoms = doc.getElementsByClass("hd-info-t");
						for(Element tagDom : tagDoms){
							String tag = tagDom.getElementsByTag("span").eq(0).text();
							System.out.println("标签是:"+tag);
						}
						
						//抓取内容
						Elements contentDom = doc.getElementsByClass("cont");
						String content = contentDom.html();
						//抓取图片
						//String img = contentDom.getElementsByTag("img").eq(0).attr("src");
						//抓取时间
	//					String time = doc.getElementsByClass("article-time").eq(0).text();
						System.out.println("标题是:"+title);
						
						System.out.println("内容是:"+content);
	//					System.out.println("图片:"+img);
	//					System.out.println("时间:"+time);
					}
				} catch (Exception e1) {
					continue;
				}
			}
		}
//		document.getElementsByAttributeValue("id", "tt")
//		//3：匹配源代码中的URL地址,img,文本
//		//4: 获取URL中的内容，保存到数据库中。

	}
	
	/**
	 * 抓取UI网页内容
	 * @Title: handlerContent 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	@Test
	public void handlerContent(){
		
		Content conten = new Content();	
		setContentData(conten);
		
	    String htmlsource = getHtmlSource("http://www.ui.cn/","utf-8");
		Document document = Jsoup.parse(htmlsource);
		
		Elements es = document.getElementsByClass("cover");
		for(Element e : es){
			Set<String> set = new HashSet<>();
			Elements elements = e.getElementsByTag("a");
			for (Element element : elements) {
				String href = element.attr("href");
				if(TmStringUtils.isNotEmpty(href) && href.startsWith("http://")){
					href = href.replace(href, "");
				}else{
					href = "http://www.ui.cn" + href;
					set.add(href);
				}
			}
			Elements imgs = e.getElementsByTag("img");
			for (Element element : imgs) {
				String src = element.attr("data-original");
				if(src != null){
					System.out.println("封面图片是:"+src);
					conten.setImage(src);
				}else{
					conten.setImage(null);
				}
			}
			//URL地址循环，进行抓取
			for (String url:set) {
				try {
					Document doc = Jsoup.connect(url).get();
					if(doc!=null){
						//标题
						String title = doc.getElementsByTag("h1").eq(0).text();
						//标签
						Elements tagDoms = doc.getElementsByClass("hd-info-t");
						for(Element tagDom : tagDoms){
							String tag = tagDom.getElementsByTag("span").eq(0).text();
							System.out.println("标签是:"+tag);
							conten.setTag(tag);
						}
						//抓取内容
						Elements contentDom = doc.getElementsByClass("cont");
						String content = contentDom.html();
						
						conten.setTitle(title);
						conten.setContent(content);
						conten.setDescription(title);
						System.out.println("标题是:"+title);
						System.out.println("内容是:"+content);
						
						System.out.println(JSONUtil.serialize(conten));
						
						boolean flay = contentService.saveContent(conten);
						
						System.out.println("采集成功--------"+flay);
					}
					
				} catch (Exception e1) {
					e1.printStackTrace();
					continue;
				}
			}
		}
	}
	/**
	 * 抓取酷我音乐网页音乐
	 * @Title: handlerMusic 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	@Test
	public void handlerMusic(){
		
	    String htmlsource = getHtmlSource("http://www.kuwo.cn/bang/index","utf-8");
		Document document = Jsoup.parse(htmlsource);
		
		Elements es = document.getElementsByClass("listMusic");
		for(Element e : es){
			Set<String> set = new HashSet<>();
			Elements elements = e.getElementsByTag("a");
			for (Element element : elements) {
				String href = element.attr("href");
				if(TmStringUtils.isNotEmpty(href) && href.startsWith("http://www.kuwo.cn/yinyue/")){
					set.add(href);
				}
			}
			Music music = new Music();
			music.setCategoryId(1);
			music.setComments(0);
			music.setHits(0);
			music.setIsDelete(0);
			music.setLoves(0);
			music.setStatus(1);
			music.setUserId(1);
			//URL地址循环，进行抓取
			for (String url:set) {
				try {
					Document doc = Jsoup.connect(url).get();
					if(doc!=null){
						//歌名
						String title = doc.getElementById("lrcName").text();
						//专辑
						Elements tagDoms = doc.getElementsByClass("album");
						for(Element tagDom:tagDoms){
							String tag = tagDom.getElementsByTag("span").eq(0).text();
							System.out.println("专辑是:"+tag);
						}
						//歌手
						String singer = doc.getElementsByClass("artist").eq(1).text();
						//歌词
						String lrc = doc.getElementById("lrcContent").html();
						if(!lrc.isEmpty()){
							music.setLrc(lrc);
							System.out.println("歌词是:"+lrc);
						}
						//封面图片
						Elements picDoms = doc.getElementsByClass("musiciPic");
						Set<String> setPic = new HashSet<>();
						for(Element picDom:picDoms){
							String href = picDom.getElementsByTag("a").attr("href");
							if(TmStringUtils.isNotEmpty(href) && href.startsWith("http://")){
								setPic.add(href);
							}
						}
						for (String picUrl:setPic) {
								Document picDoc = Jsoup.connect(picUrl).get();
								if(picDoc!=null){
									Element imgDom = picDoc.getElementById("artistContent");
									String img = imgDom.getElementsByTag("img").eq(0).attr("data-src");
									System.out.println("封面图片是:"+img);
									music.setImg(img);
								}
							}
						System.out.println("歌名是:"+title);
						System.out.println("歌手是:"+singer);
						
						music.setTitle(title);
						music.setSinger(singer);
						
						musicMapper.save(music);
					}
					
				} catch (Exception e2) {
					e2.printStackTrace();
					continue;
				}
			}
		}
	}
}
