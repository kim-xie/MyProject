package com.king.web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class VerifyCodeController extends BaseController {
	/**
	 * 获取验证码
	 * 
	 * @Title: yzm
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param res
	 * @param @return
	 * @param @throws IOException 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@RequestMapping("/yzm.do")
	
	public String yzm() throws IOException {
		// 创建内存印象
		BufferedImage image = new BufferedImage(80, 30,
				BufferedImage.TYPE_INT_BGR);
		// 获得画笔
		Graphics g = image.getGraphics();
		// 给画笔设置颜色
		g.setColor(new Color(255, 255, 255));
		// 设置背景颜色
		g.fillRect(0, 0, 80, 30);
		// 重置
		Random r = new Random();
		g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
		// 给画笔设置字体
		g.setFont(new Font(null, Font.ITALIC, 24));
		// 生成随机数
		char[] cc = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
				'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
				'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		String number = "";
		for (int i = 0; i < 4; i++) {
			number += String.valueOf(cc[r.nextInt(cc.length)]);
		}
		// 绘制图片
		g.drawString(number, 5, 26);
		// 加干扰线
		for (int i = 0; i < 8; i++) {
			g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
			g.drawLine(r.nextInt(80), r.nextInt(30), r.nextInt(80),
					r.nextInt(30));
		}
		// 压缩图片并输出
		response.setContentType("image/jpeg");
		// 使用字节流输出
		OutputStream os = response.getOutputStream();
		// 压缩并输出
		ImageIO.write(image, "jpeg", os);

		return "user/findpwd";
	}
}
