package com.ictwsn.action.login;

import java.io.UnsupportedEncodingException; 

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import com.ictwsn.bean.UserBean;
import com.ictwsn.service.role.RoleService;
import com.ictwsn.service.user.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ictwsn.bean.RoleBean;
import com.ictwsn.util.GetHttp;


/**
 * 系统用户登录控制类
 * @author YangYanan
 * @desc 包含系统用户登录注销的请求处理
 * @date 2017-8-18
 */
@Controller
public class LoginAction{

	static Logger logger = Logger.getLogger(LoginAction.class.getName());

	@Resource UserService userService;
	@Resource RoleService loginService;

	/**
	 * 用户登录请求
	 * @param request
	 * @param session
	 * @param model
	 * @param userNumber 手机号码
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/userlogin.do", method = RequestMethod.POST)
	public String userlogin(HttpServletRequest request,HttpSession session,Model model,
			@RequestParam(value="userNumber",required=true) String userNumber) throws UnsupportedEncodingException{
		try{
			if(session.getAttribute("RoleBean")!=null){
				return GetHttp.isMobileDevice(request)? "pages/userManageCenter" :"MobilePages/userManageCenter";
			}
			RoleBean rb = loginService.login(userNumber);
			if(rb.getUserNumber()!=null&&!rb.getUserNumber().equals("")){
				session.setAttribute("RoleBean",rb);
				return GetHttp.isMobileDevice(request)?"pages/userManageCenter":"MobilePages/userManageCenter";
			}else{
				model.addAttribute("message",-1);//-1 手机号码错误
				return "login";
			}
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("message",-1);
			return "login";
		}
	}

	/**
	 * 签到登录请求
	 * @param request
	 * @param session
	 * @param model
	 * @param userNumber 手机号码
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="/attendlogin.do", method = RequestMethod.POST)
	public String attendlogin(HttpServletRequest request,HttpSession session,Model model,
			@RequestParam(value="userNumber",required=true) String userNumber) throws UnsupportedEncodingException{
		try{

			UserBean db = userService.searchUserByUserNumber(userNumber);
			RoleBean rb = loginService.login(userNumber);

			if(db.getUserName()!=null && !db.getUserName().equals("")){
				model.addAttribute("db",db);
				session.setAttribute("RoleBean",rb);
				return "MobilePages/user/attend";
			}else{
				model.addAttribute("message",-1);//-1 手机号码错误
				return "attendlogin";
			}
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("message",-1);//-1 手机号码错误
			return "attendlogin";
		}
	}

	/**
	 * 登录请求get版
	 * 实现页面跳转,提升用户友好性
	 * @param request
	 * @param session
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/userlogin.do", method = RequestMethod.GET)
	public String userlogin_(HttpServletRequest request,HttpSession session,Model model) throws UnsupportedEncodingException{
		try{	
			if(session.getAttribute("RoleBean")!=null){
				return GetHttp.isMobileDevice(request)?"pages/userManageCenter":"MobilePages/userManageCenter";
			}else{
				return "redirect:/login.jsp";
			}
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error/404";
		}
	}
	@RequestMapping("/logoff.do")
	public String logoff(HttpServletRequest request,HttpSession session){
		try{
			session.removeAttribute("RoleBean");
			return "redirect:/login.jsp";
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error/404";
		}
	}

	@RequestMapping("/attendlogoff.do")
	public String attendlogoff(HttpServletRequest request,HttpSession session){
		try{
			session.removeAttribute("RoleBean");
			return "redirect:/attendlogin.jsp";
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error/404";
		}
	}


}
