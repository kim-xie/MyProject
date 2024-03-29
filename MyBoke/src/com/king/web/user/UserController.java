package com.king.web.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.king.bean.User;
import com.king.bean.UserParams;
import com.king.service.user.UserService;
import com.king.util.TmStringUtils;
import com.king.util.ip.TmIpUtil;
import com.king.web.BaseController;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	/**
	 * 注入userService
	 */
	@Resource(name = "userService")
	private UserService userService;
	/**
	 * 前往主页
	 * @Title: toMain 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/main.do")
	public String toMain() {
		return "main";
	}
	
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
	/**
	 * 前往注册成功页面
	 * @Title: toMsg 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/toMsg.do")
	public String toMsg() {
		return "user/msg";
	}
	/**
	 * 前往个人资料页面
	 * @Title: toPerson 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @return  参数说明 
	 * @return String  返回类型 
	 * @throws
	 */
	@RequestMapping("/toPerson.do")
	public String toPerson() {
		return "user/person";
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
	public String regist(User user,ModelMap map) {
		if (user != null) {
			if (TmStringUtils.isNotEmpty(user.getUserName())
					&& TmStringUtils.isNotEmpty(user.getUserPassword())
					&& TmStringUtils.isNotEmpty(user.getUserEmail())) {
			
				if (TmStringUtils.isEmail(user.getUserEmail())) {
					boolean email = userService.checkUserEmail(user.getUserEmail());
					if(email){
						return "EmailIsAlive";
					}else{
						user.setUserPassword(TmStringUtils.md5Base64(user.getUserPassword()));
						user.setActiveCode(TmStringUtils.uuid());
						user.setHeaderPic("/resources/imgs/header_pic/header_pic.png");
						user.setIp(TmIpUtil.getIpAddress(request));
						user.setIpAddress(TmIpUtil.ipLocation(request));
						if (userService.saveUser(user)){
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
	public String loginIn(UserParams userParams) {
		if (userParams != null) {
			if (TmStringUtils.isNotEmpty(userParams.getUserName())
					&& TmStringUtils.isNotEmpty(userParams.getUserPassword())) {
				
				String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
				String verifyCode = request.getParameter("verifyCode");
				
				if(verifyCode!=null && !verifyCode.equalsIgnoreCase(code)){
					return "vrfError";
				}else{
					userParams.setUserPassword(TmStringUtils.md5Base64(userParams.getUserPassword()));
					User user = userService.getUser(userParams);
					if (user != null && user.getUserName().equals(userParams.getUserName()) && user.getUserPassword().equals(userParams.getUserPassword())) {
						if(user.getActive().equals(1)){
							session.setAttribute("user",user);
							session.setAttribute("userEmail",user.getUserEmail());
							session.setAttribute("userName",user.getUserName());
							session.setAttribute("userSex",user.getUserSex());
							session.setAttribute("userTel",user.getUserTel());
							session.setAttribute("userAge",user.getUserAge());
							session.setAttribute("userWeixin",user.getWeixin());
							session.setAttribute("userQq",user.getQq());
							session.setAttribute("userHeaderPic",user.getHeaderPic());
							session.setAttribute("userDescription",user.getDescription());
							//日记监控用户行为和获取请求参数
							request.getServletContext().setAttribute("user_log", user);
							return "success";
						}else{
							return "noActive";
						}
					} else {
						return "fail";
					}
				}
			} else {
				return "null";
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
	public String logout() {
		session.invalidate();
		return "user/login";
	}
	/**
	 * @Title: userList 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param userParams
	 * @param @return  参数说明 
	 * @return ModelAndView  返回类型 
	 * @throws
	 */
	@RequestMapping("/template.do")
	@ResponseBody
	public ModelAndView userList(UserParams userParams){
		ModelAndView model = new ModelAndView();
		List<User> users = userService.findAllUsers(userParams);
		int itemCount = userService.countUser(userParams);
		model.setViewName("user/template");
		model.addObject("users",users);
		model.addObject("itemCount",itemCount);
		return model;
	}
}
