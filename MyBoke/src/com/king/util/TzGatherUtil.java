
package com.king.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;

/**
 * 类名: TzGatherUtil.java
 * 创建人: king 
 * 创建时间：2016年4月25日 下午3:42:02 
 * @version 1.0.0
 */
public class TzGatherUtil {

	public static void donwload(String netUrl,String path,String fileName) {
		try {
			URL url = new URL(netUrl);
			URLConnection connection = url.openConnection();
			//文本和内容都是字符流
			//图片，音频，视频--字节流
			InputStream in = connection.getInputStream();//打开程序和网络的一个连接
			//开始下载，一4KB下载图片
			byte[] bs = new byte[4048];
			//记录下载的位置
			int len = 0;
			int clen = 0;
			//写入磁盘--输出 outputstream
			int tlen = connection.getContentLength();
			FileOutputStream outputStream = new FileOutputStream(new File(path,fileName));
			while((len = in.read(bs))!=-1){//==-1代表文件下载完毕了
				clen+=len;
				System.out.println("====你已经下载了："+clen+"，还剩余："+(tlen-clen)+",百分比:"+((clen/(float)tlen))*100);
				outputStream.write(bs, 0, len);//写入磁盘
			}
			outputStream.close();
			in.close();
		} catch (Exception e) {
		}
	}
	
	public static void main(String[] args) {
		donwload("http://7xkszy.com2.z0.glb.qiniucdn.com/pics/vol/5676f1710283b.jpg?imageView2/1/w/640/h/452", "d:/", new Date().getTime()+".jpg");
		for (int i = 0; i < 10; i++) {
			String mark = i+"";
			if(i<10)mark = "0"+i;
			String href ="http://luoo-mp3.kssws.ks-cdn.com/low/luoo/radio781/"+mark+".mp3";
			System.out.println(href);
			donwload(href, "d:/", mark+".mp3");
		}
	}
}

