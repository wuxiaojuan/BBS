package com.cn.bbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam; 
import org.springframework.web.servlet.ModelAndView;

import com.cn.bbs.common.CommonConstant;
import com.cn.bbs.model.UserInfo;
import com.cn.bbs.service.userservice.UserService;

@Controller
@RequestMapping("/home")
public class UserController {
	
	@Autowired
	UserService userservice;
	
	
	/***
	 * 
	 * ע��
	 * @param username
	 * @param password
	 * @param qq
	 * @param modelMap
	 * @return
	 * 
	 */
	@RequestMapping(value="/register.do")
	public String register(@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("qq") String qq,HttpServletRequest request,
			ModelMap modelMap){

		UserInfo user=new UserInfo();
		user.setUsername(username);
		user.setPassword(password);
		user.setQq(qq);
		String id=userservice.adduser(user);
		if(!id.equals("0")){
			request.getSession().setAttribute(CommonConstant.SESSION_USERNAME, user.getUsername());
			request.getSession().setAttribute(CommonConstant.SESSION_USERID, user.getId());
		}
		//modelMap.addAttribute("user",user); 
		
		return "index";
	}
	
	/***
	 * ��½ҳ�� 
	 * @return
	 */
	@RequestMapping(value = "/loginuser.do", method = RequestMethod.GET)
	public String loginuser() {
		return "register";
	}
	
	/***
	 * BBS��ҳ
	 * @return
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	
	/***
	 * ��½
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(String temp,HttpServletRequest request, HttpServletResponse response) {
		if ("1".equals(temp)) {
			request.setAttribute("msg", "ע��ɹ��������µ�½");
		}
		if ("2".equals(temp)) {
			request.setAttribute("msg", "�������");
		}
		if ("3".equals(temp)) {
			request.setAttribute("msg", "û�и��˻�");
		}
		if ("4".equals(temp)) {
			request.setAttribute("msg", "�˳��ɹ�	");
		}
		if ("5".equals(temp)) {
			request.setAttribute("msg", "���ȵ�¼");
		}
		return "register";
	}
	
	/***
	 * �˳�
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(String temp,HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "register";
	}
	
	
/*	*//***
	 * ��½
	 * @param modelMap
	 * @return
	 *//*
	@RequestMapping(value="/login.do")
	public ModelAndView login(HttpServletRequest request, ModelMap modelMap){

		String message="hello you register!";
		String username="wuxiaojuan";request.getParameter("name") == null ? "" : request
				.getParameter("name");
		String password="1234";request.getParameter("password") == null ? "" : request
				.getParameter("password");
		UserInfo user=new UserInfo();
		user.setId("3");
		user.setUsername(username);
		user.setPassword(password);
		userservice.adduser(user);
       
		return new ModelAndView("index","message",message);
		
		
	}*/
	

}
