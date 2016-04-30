package com.king.web;

import static com.king.util.TzConstant.SESSION_USER;
import static com.king.util.TzConstant.SESSION_USER_USERNAME;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.king.bean.Login;
import com.king.bean.Regist;
import com.king.bean.User;
import com.king.service.UserService;
import com.king.util.TmStringUtils;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	/**
	 * 注入userService
	 */
	@Resource(name = "userService")
	private UserService userService;

	/**
	 * 前往登录页面
	 * @Title: toLogin
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@RequestMapping("/toLogin.do")
	public String toLogin() {
		return "user/login";
	}

	/**
	 * 前往注册页面
	 * @Title: toRegist
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@RequestMapping("/toRegist.do")
	public String toRegist() {
		return "user/regist";
	}

	/**
	 * 前往找回密码页面
	 * @Title: toFindPwd
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@RequestMapping("/toFindPwd.do")
	public String toFindPwd() {
		return "user/findpwd";
	}
	@RequestMapping("/toMsg.do")
	public String toMsg() {
		return "user/msg";
	}
	/**
	 * 注册用户名校验
	 * @Title: checkUserName
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param userName
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/checkUserName.do")
	public String checkUserName(String userName) {
		boolean name = userService.findUserByUserName(userName);
		if (name) {
			return "UserIsAlive";
		} else {
			return "UserIsCorrect";
		}
	}

	/**
	 * 注册邮箱校验
	 * @Title: checkUserEmail
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param userEmail
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/checkUserEmail.do")
	public String checkUserEmail(String userEmail) {
		if (TmStringUtils.isEmail(userEmail)) {
			
			boolean email = userService.checkUserEmail(userEmail);
			if(email){
				return "EmailIsAlive";
			}else{
				return "EmailIsCorrect";
			}
		} else {
			return "emailError";
		}
	}

	/**
	 * 注册
	 * @Title: regist
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param regist
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String regist(Regist regist,ModelMap map) {
		if (regist != null) {
			if (TmStringUtils.isNotEmpty(regist.getUserName())
					&& TmStringUtils.isNotEmpty(regist.getUserPassword())
					&& TmStringUtils.isNotEmpty(regist.getUserEmail())) {
			
				if (TmStringUtils.isEmail(regist.getUserEmail())) {
					boolean email = userService.checkUserEmail(regist.getUserEmail());
					if(email){
						return "EmailIsAlive";
					}else{
						regist.setUserPassword(TmStringUtils.md5Base64(regist
								.getUserPassword()));
						regist.setActiveCode(TmStringUtils.uuid());
						regist.setCreateTime(TmStringUtils.dateFormat(new Date()));
						if (userService.regist(regist)){
							return "success";
						}
						return "EmailIsCorrect";
					}
				} else {
					return "emailError";
				}
			} else {
				return "null";
			}
		} else {
			return "error";
		}
	};
	/**
	 * 激活
	 * @Title: active 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param   参数说明 
	 * @return void  返回类型 
	 * @throws
	 */
	@RequestMapping("/active.do")
	public String active(){
		String activeCode = request.getParameter("activeCode");
		String flay = userService.active(activeCode);
		if(flay == "error"){
			return "user/activeError";
		}else if(flay == "fail"){
			return "user/activeFail";
		}else {
			return "user/activeSuccess";
		}
	}
	
	/**
	 * 登录
	 * @Title: loginIn
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param login
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginIn(Login login) {
		if (login != null) {
			if (TmStringUtils.isNotEmpty(login.getUserName())
					&& TmStringUtils.isNotEmpty(login.getPassword())) {
				
				login.setPassword(TmStringUtils.md5Base64(login.getPassword()));
				
				User user = userService.loginIn(login);
				
				if (user != null && user.getUserName().equals(login.getUserName()) && user.getUserPassword().equals(login.getPassword())) {
					if(user.getActive().equals(1)){
						session.setAttribute(SESSION_USER, user);
						session.setAttribute(SESSION_USER_USERNAME,
								user.getUserName());
						return "success";
					}else{
						return "noActive";
					}
				} else {
					return "fail";
				}
			} else {
				return "null";// 请输入账号和密码
			}
		} else {
			return "error";
		}
	};

	/**
	 * 注销登录
	 * @Title: logout
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	@RequestMapping("/loginout.do")
	@ResponseBody
	public String logout() {
		session.invalidate();
		return "success";
	}

}
