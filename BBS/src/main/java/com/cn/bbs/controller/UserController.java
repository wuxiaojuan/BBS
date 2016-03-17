package com.cn.bbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bbs.model.UserInfo;
import com.cn.bbs.service.userservice.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userservice;
	
	@RequestMapping(value="/register")
	public ModelAndView sayHello(/*HttpServletRequest request,*/ ModelMap modelMap){

		String message="hello you register!";
		String username="wuxiaojuan";/*request.getParameter("name") == null ? "" : request
				.getParameter("name");*/
		String password="1234";/*request.getParameter("password") == null ? "" : request
				.getParameter("password");*/
		UserInfo user=new UserInfo();
		user.setId("1");
		user.setUsername(username);
		user.setPassword(password);
		userservice.adduser(user);
       
		return new ModelAndView("hello","message",message);
		
		
	}
	

}
