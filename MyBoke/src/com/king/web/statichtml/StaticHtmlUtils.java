package com.king.web.statichtml;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.WriteListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.king.util.TmStringUtils;
/**
 * 类名: StaticHtmlUtils.java
 * 创建人: king 
 * 创建时间：2016年5月31日 下午12:25:34 
 * @version 1.0.0
 */
public class StaticHtmlUtils {
	public static void main(String[] args) {
		try {
			for (int i=71;i<80;i++) {
				Document document = Jsoup.connect("http://localhost:8080/MyBoke/static/content/"+i).get();
				FileOutputStream outputStream = new FileOutputStream("d://"+getRandomString(20)+".html");
				PrintWriter writer = new PrintWriter(outputStream);
				writer.write(document.html());
				writer.close();
				outputStream.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * @Title: getRandomString 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param length
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	private static String getRandomString(int length) {
		StringBuffer bu = new StringBuffer();
		String[] arr = { "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c",
				"d", "e", "f", "g", "h", "i", "j", "k", "m", "n", "p", "q",
				"r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C",
				"D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "P",
				"Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
		Random random = new Random();
		while (bu.length() < length) {
			String temp = arr[random.nextInt(57)];
			if (bu.indexOf(temp) == -1) {
				bu.append(temp);
			}
		}
		return bu.toString();
	}
	/**
	 * @Title: staticContent 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param id
	 * @param @param link
	 * @param @param templatePath
	 * @param @param request
	 * @param @param response
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	public static  String  staticContent(Integer id,String link,String templatePath,HttpServletRequest request,HttpServletResponse response){
		//写入的静态目标文件
		File targetFile  = null;
		//返回的相对路径
		String fileNamePath =null;
		//判断是否存在静态页面
		if(TmStringUtils.isNotEmpty(link)){//你已经生成了静态页面，就用原来生成静态页面文件进行覆盖操作
			@SuppressWarnings("deprecation")
			String rootPath = request.getRealPath("/");//获取根目录
			File  rootFile = new File(rootPath);
			targetFile = new File(rootFile,link);//目标文件
			File parentPath = targetFile.getParentFile();//防止父级目录丢失，而造成静态化失败，判断是否父亲文件夹存在
			if(!parentPath.exists())parentPath.mkdirs();//如果不存在，就创建父级目录
			fileNamePath =  link;//返回相对路径
		}else{
			//如果没有静态页面
			//长生一个新的目录
			String filePath = "pages/"+TmStringUtils.formatDate(new Date(), "yyyy/MM/dd");
			//获取服务器根目录
			@SuppressWarnings("deprecation")
			String rootPath = request.getRealPath(filePath);
			File rootFile = new File(rootPath);
			//如果不存在，就创建
			if(!rootFile.exists())rootFile.mkdirs();
			//长生新的静态文件名称
			String name = getRandomString(20)+".html";
			targetFile = new File(rootFile,name);
			//返回的名称
			fileNamePath =  filePath +"/"+ name;
		}
		
		FileOutputStream fos = null;
		ServletContext sc = request.getServletContext();
		//组装返回的路径
		try {
			//设定你的模板路径,内容模板三个，显示风格都不一样，
			RequestDispatcher rd = sc.getRequestDispatcher(templatePath);
			final ByteArrayOutputStream os = new ByteArrayOutputStream();
			final ServletOutputStream stream = new ServletOutputStream() {//匿名内部类，回调函数
				public void write(byte[] data, int offset, int length) {
					os.write(data, offset, length);
				}
				public void write(int b) throws IOException {
					os.write(b);
				}
				@Override
				public boolean isReady() {
					return false;
				}
				@Override
				public void setWriteListener(WriteListener arg0) {
					
				}
			};
			final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os,"utf-8"));
			HttpServletResponse rep = new HttpServletResponseWrapper(response) {
				public ServletOutputStream getOutputStream() {
					return stream;
				}

				public PrintWriter getWriter() {
					return pw;
				}
			};
			
			//将id放入到作用域中
			request.setAttribute("id", id);
			request.setAttribute("username", "king");
			request.setAttribute("age", 20);
			
			rd.include(request, rep);//发起请求
			pw.flush();
			fos = new FileOutputStream(targetFile);
			os.writeTo(fos);//讲源代码写入磁盘文件中
			return fileNamePath;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (ServletException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				fos.close();
			} catch (Exception e) {
			}
		}
	}
}
