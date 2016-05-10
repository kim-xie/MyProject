package com.king.service.user.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.king.bean.Login;
import com.king.bean.MailInfo;
import com.king.bean.Regist;
import com.king.bean.User;
import com.king.dao.user.UserMapper;
import com.king.service.user.UserService;
import com.king.util.SimpleMail;
@Service("userService")
public class UserServiceImpl implements UserService{
	/**
	 * 注入映射文件
	 */
	@Resource
	private UserMapper userMapper;
	
	/**
	 * 登录方法
	 */
	@Override
	public User loginIn(Login login) {
		return userMapper.loginIn(login);
	}
	/**
	 * 注册方法
	 */
	@Override
	public boolean regist(Regist regist) {
		int count = userMapper.regist(regist);
		
		MailInfo mailInfo = new MailInfo();
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		mailInfo.setUsername("jy_xdj@163.com");
		mailInfo.setPassword("xdj123");
		mailInfo.setFromAddress("jy_xdj@163.com");
		mailInfo.setToAddress(regist.getUserEmail());
		mailInfo.setSubject("King博客激活邮箱");
				
		StringBuffer demo = new StringBuffer();
		demo.append("<!DOCTYPE html>"+
				"<html>"+
				"	<head>"+
				"		<base target='_blank'>"+
				"		<meta charset='UTF-8' />"+
				"		<style>"+
				"			body {font-size: 14px;font-family: arial, verdana, sans-serif;line-height: 1.666;padding: 0;margin: 0;overflow: auto;white-space: normal;word-wrap: break-word;min-height: 100px}"+
				"			td,input,button,select,body {font-family: Helvetica, 'Microsoft Yahei', verdana}"+
				"			pre {white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-wrap: break-word;width: 95%;}"+
				"			th,td {font-family: arial, verdana, sans-serif;line-height: 1.666}"+
				"			img {border: 0}"+
				"			header,footer,section,aside,article,nav,hgroup,figure,figcaption {display: block}"+
				"			#table1{background-color:#e5eaf1; width:100%; height:500px;}"+
				"			#table2{width:775px; margin: 40px auto 10px; border-radius: 5px;}"+
				"			#table3{margin-left:10px; width:755px;}"+
				"			#h1{margin: 10px 0 0 0; line-height:50px; color: #386fb7; font-size: 22px;  font-weight: bold; padding:30px 57px 0;}"+
				"			#dear{margin: 0; line-height:37px; color: #737373; font-size: 16px; padding:0 57px;}"+
				"			#p2{margin: 0; line-height:37px; color: #737373; font-size: 16px; padding:0 57px;}"+
				"			#active{width: 160px; height: 42px; background-color: #386fb7; font-weight: normal; "+
				"			font-size: 20px; color: white; text-align: center; text-decoration: none; "+
				"			display: block;line-height: 42px; margin:5px 0 13px; margin-left: 57px;}"+
				"			#p3{margin: 0; line-height:20px; font-size:14px; margin-bottom: 15px; color: red; padding:0 57px;}"+
				"			"+
				"		</style>"+
				"		<style id='ntes_link_color' type='text/css'>"+
				"			a,td a {color: #064977}"+
				"		</style>"+
				"		"+
				"	</head>"+
				"	<body>"+
				"		<table id='table1' cellspacing='0'>"+
				"			<tbody>"+
				"				<tr>"+
				"					<td>"+
				"						<table id='table2' align='center' cellpadding='0' cellspacing='0' >"+
				"							<tbody>"+
				"								<tr>"+
				"									<td>"+
				"										<img src='http://localhost:8080/MyBoke/resources/imgs/mail/header.png' style='display:block;'>"+
				"									</td>"+
				"								</tr>"+
				"								<tr>"+
				"									<td style='background: url('http://localhost:8080/MyBoke/resources/imgs/mail/aside.png') repeat-y;'>"+
				"										<table id='table3' align='left' bgcolor='#fff' cellpadding='0' cellspacing='0' >"+
				"											<tbody>"+
				"												<tr>"+
				"													<td style='width: 755px;'>"+
				"														<h1 id='h1'>请激活您的账号，完成注册。</h1>"+
				"													</td>"+
				"												</tr>"+
				"												<tr>"+
				"													<td>"+
				"														<p id='dear'>亲爱的 <span style='font-weight: bold;'>"+regist.getUserName()+"</span> ,您好！欢迎加入King的个人博客！</p>"+
				"													</td>"+
				"												</tr>"+
				"												<tr>"+
				"													<td style=''>"+
				"														<p id='p2' >为了更好让您享受到更好的体验，请尽快激活您的邮箱！</p>"+
				"													</td>"+
				"												</tr>"+
				"												<tr>"+
				"													<td>"+
				"														<a id='active' href = 'http://localhost:8080/MyBoke/user/active.do?activeCode="+regist.getActiveCode()+"' target='_blank'>立即激活</a>"+
				"													</td>"+
				"												</tr>"+
				"												<tr>"+
				"													<td>"+
				"														<p id='p3'>(这是一封自动产生的email，请勿回复。)</p>"+
				"													</td>"+
				"												</tr>"+
				"											</tbody>"+
				"										</table>"+
				"									</td>"+
				"								</tr>"+
				"							</tbody>"+
				"						</table>"+
				"						<table align='center' cellpadding='0' cellspacing='0' style='margin-bottom: 50px; width: 755px; '>"+
				"							<tbody>"+
				"								<tr>"+
				"									<td align='left' style='width:340px; margin-left:10px; '>"+
				"										<span style='font-size:12px; color: #bac1cb;'>"+
				"											<span style='font-weight:bold; margin-left:10px; font-size:12px; color: #bac1cb;'>King</span>"+
				"											 - 个人博客平台"+
				"										</span>"+
				"									</td>"+
				"									<td align='right' style='width:340px; margin-left:10px; font-size:12px; color: #bac1cb;'>"+
				"										<span style='margin-right:10px; font-size:12px; color: #bac1cb;'>Powered by © 2015-2016 King.com</span>"+
				"									</td>"+
				"								</tr>"+
				"							</tbody>"+
				"						</table>"+
				"					</td>"+
				"				</tr>"+
				"			</tbody>"+
				"		</table>"+
				"	</body>"+
				"</html>");
		mailInfo.setContent(demo.toString());
		SimpleMail.sendHtmlMail(mailInfo);
		
		return count > 0 ? true:false;
	}
	/**
	 * 邮箱注册校验
	 */
	@Override
	public boolean checkUserEmail(String userEmail) {
		int count = userMapper.checkUserEmail(userEmail);
		return count>0?true:false;
	}
	/**
	 * 用户名校验
	 */
	@Override
	public boolean findUserByUserName(String userName) {
		int count = userMapper.findUserByUserName(userName);
		return count>0?true:false;
	}
	/**
	 * 激活
	 */
	@Override
	public String active(String activeCode) {
		User user = userMapper.active(activeCode);
		
		if(user != null ){
			if(user.getActive()==1){
				return "fail";
			}else{
				userMapper.updateActive(activeCode);
				return "success";
			}
		}else{
			return "error";
		}
		
	}

}
