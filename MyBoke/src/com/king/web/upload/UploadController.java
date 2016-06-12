package com.king.web.upload;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.king.util.ImageUtil;
import com.king.util.TmFileUtil;
import com.king.web.BaseController;

@Controller
@RequestMapping("/upload")
public class UploadController extends BaseController{
	
	@RequestMapping("/toUpload.do")
	public String index(){
		return "upload/upload";
	}
	
	/**
	 * 上传内容封面图片
	 * @Title: uploadFile 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return List<HashMap<String,Object>>  返回类型 
	 * @throws
	 */
	@ResponseBody 
	@RequestMapping(method=RequestMethod.POST,value="/PicUpload.do")
	public String uploadFile(@RequestParam("doc") MultipartFile fileObj)
			throws IllegalStateException, IOException, JSONException {
		if(!fileObj.isEmpty()){
			
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/resources/imgs/contentImg");
			File parent = new File(path);
			if(!parent.exists())parent.mkdirs();
			
			System.out.println("获取文件数据================="+fileObj.getBytes());
			System.out.println("获取文件的MINE类型================="+fileObj.getContentType());
			System.out.println("获取文件的名称================="+fileObj.getName());
			System.out.println("获取上传文件的原名================="+fileObj.getOriginalFilename());
			System.out.println("获取文件的大小================="+fileObj.getSize());
			System.out.println("判断是否有文件上传================="+fileObj.isEmpty());
			
			// 装载要返回的数据
			HashMap<String, Object> map = new HashMap<String,Object>();
			// 上传时的文件名
			String oldName = fileObj.getOriginalFilename();
			// 文件大小
			long size = fileObj.getSize();
			// 文件大小单位为KB
			String sizeString = TmFileUtil.countFileSize(size);
			// 文件后缀名
			String ext = TmFileUtil.getExtNoPoint(oldName);
			// 生成的新的文件名
			String newFileName = TmFileUtil.generateFileName(oldName, 10, "yyyyMMddHHmmss");
			// 保存路径
			String url = "/resources/imgs/contentImg/"+newFileName;
			// 转存文件
			fileObj.transferTo(new File(parent, newFileName));
			
			map.put("oldname",oldName);
			map.put("ext",ext);
			map.put("sizeString",sizeString);
			map.put("size",size);
			map.put("name",newFileName);
			map.put("url",url);
			
			return JSONUtil.serialize(map);
		}else{
			return null;
		}
	};
	
	/**
	 * @Title: upload 
	 * @Description: TODO(头像上传) 
	 * @param @param file
	 * @param @return
	 * @param @throws IllegalStateException
	 * @param @throws IOException
	 * @param @throws JSONException  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@ResponseBody 
	@RequestMapping(method=RequestMethod.POST,value="/upload.do")
	public String upload(@RequestParam("doc") MultipartFile file)
			throws IllegalStateException, IOException, JSONException {
		
		if(!file.isEmpty()){
			
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/resources/imgs/header_pic");
			File parent = new File(path);
			if(!parent.exists())parent.mkdirs();
			
			System.out.println("获取文件数据================="+file.getBytes());
			System.out.println("获取文件的MINE类型================="+file.getContentType());
			System.out.println("获取文件的名称================="+file.getName());
			System.out.println("获取上传文件的原名================="+file.getOriginalFilename());
			System.out.println("获取文件的大小================="+file.getSize());
			System.out.println("判断是否有文件上传================="+file.isEmpty());
			
			// 装载要返回的数据
			HashMap<String, Object> map = new HashMap<String,Object>();
			// 上传时的文件名
			String oldName = file.getOriginalFilename();
			// 文件大小
			long size = file.getSize();
			// 文件大小单位为KB
			String sizeString = TmFileUtil.countFileSize(size);
			// 文件后缀名
			String ext = TmFileUtil.getExtNoPoint(oldName);
			// 生成的新的文件名
			String newFileName = TmFileUtil.generateFileName(oldName, 10, "yyyyMMddHHmmss");
			// 保存路径
			String url = "/resources/imgs/header_pic/"+newFileName;
			// 转存文件
			file.transferTo(new File(parent, newFileName));
			
			map.put("oldname",oldName);
			map.put("ext",ext);
			map.put("sizeString",sizeString);
			map.put("size",size);
			map.put("name",newFileName);
			map.put("url",url);
			
			return JSONUtil.serialize(map);
		}else{
			return null;
		}
	}
	/**
	 * @Title: cutImages 
	 * @Description: TODO(头像裁剪) 
	 * @param @return
	 * @param @throws IOException  参数说明 
	 * @return HashMap<String,Object>  返回类型 
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/cutImg.do",method=RequestMethod.POST)
	public String cutImages() throws IOException{
		//拿到上传的图片
		String bigSrc = request.getParameter("bgsrc");
		//头像裁剪：必须图片是覆盖
		//拿到目标图片
		String smallSrc = request.getParameter("smallsrc");
		
		if(!bigSrc.isEmpty() && !smallSrc.isEmpty()){
			//上传图片的路径
			String realpath = contextProvider.getApplicationRealPath(bigSrc);
			//裁剪后存放的目标路径
			String targetPath = contextProvider.getApplicationRealPath(smallSrc);
			
			//根据路径创建文件
			File file = new File(targetPath);
			//拿到文件所在的目录
			File pFile = file.getParentFile();
			//如果不存在进行创建
			if(!pFile.exists())pFile.mkdirs();
			
			//获取图片裁剪的具体尺寸
			Integer x = Integer.parseInt(request.getParameter("x"));
			Integer y = Integer.parseInt(request.getParameter("y"));
			Integer w = Integer.parseInt(request.getParameter("w"));
			Integer h = Integer.parseInt(request.getParameter("h"));
			
			//裁剪图片
			ImageUtil.cutImage(realpath,targetPath,x,y,w,h);
			
			//上传的原图删除调
			new File(realpath).delete();
			
			return "success";
			
		}else{
			return "fail";
		}
	}
}
