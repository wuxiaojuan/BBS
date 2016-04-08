package com.cn.bbs.back.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam; 

import com.cn.bbs.common.CommonConstant;
import com.cn.bbs.model.UserInfo;
import com.cn.bbs.service.userservice.UserService;
import com.cn.bbs.utill.StringUtill;

@Controller
@RequestMapping("/user")
public class BackUserController {
	
	@Autowired
	UserService userservice;
	
	
	
	/***
	 * BBSÖ÷Ò³
	 * @return
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(HttpServletRequest request) {
		return "back/index";
	}
	
	
	/***
	 * 
	 * ×¢²á
	 * @param username
	 * @param password
	 * @param qq
	 * @param modelMapregister.jsp
	 * @return
	 * 
	 */
	@RequestMapping(value="/manageList.do")
	public String manageList(HttpServletRequest request,ModelMap modelMap){

		List<UserInfo> userlist=userservice.getUserInfolist(CommonConstant.MANAGER_TYPE);
		
		modelMap.addAttribute("managerList",userlist);
		
		return "back/managerList";
	}
	


}
