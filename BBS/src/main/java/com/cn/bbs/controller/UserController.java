package com.cn.bbs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
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
@RequestMapping("/home")
public class UserController {

private static Logger log = Logger.getLogger(UserController.class);


	@Autowired
	UserService userservice;
	
	
	/***
	 * 
	 * 注册
	 * @param username
	 * @param password
	 * @param qq
	 * @param modelMapregister.jsp
	 * @return
	 * 
	 */
	@RequestMapping(value="/register.do")
	public String register(@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("type") String type,
			@RequestParam("qq") String qq,HttpServletRequest request,
			ModelMap modelMap){
		
		log.info("开始注册------------------");
        
		UserInfo user=new UserInfo();
		if(StringUtill.isEmty(type)){
			type="1";
		}
		user.setUsername(username);
		user.setPassword(password);
		user.setQq(qq);
		user.setType(type);
		String id=userservice.adduser(user);
		if(!id.equals("0")){
			request.getSession().setAttribute(CommonConstant.SESSION_USERNAME, user.getUsername());
			request.getSession().setAttribute(CommonConstant.SESSION_USERID, user.getId());
		}else{
		    modelMap.addAttribute("message","该用户名已存在！"); 
			return "register";
		}
		
		modelMap.addAttribute("message","注册成功，请登陆！"); 
		return "redirect:/home/logout.do";
/*		if(type.equals("1")){
			return "index";
		}else{
			return "back/index";
		}*/
		
	}
	
	
	/***
	 * 
	 * 注册 管理员
	 * @param username
	 * @param password
	 * @param qq
	 * @param addManager.jsp
	 * @return
	 * @throws IOException 
	 * 
	 */
	@RequestMapping(value="/registerManage.do")
	public String registerManage(@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("type") String type,
			@RequestParam("qq") String qq,HttpServletRequest request,
			ModelMap modelMap,HttpServletResponse response) throws IOException{
		
		log.info("开始注册------管理员------------");
        
		UserInfo user=new UserInfo();
		if(StringUtill.isEmty(type)){
			type="2";
		}

		String flag="0";
		try {
			user.setUsername(username);
			user.setPassword(password);
			user.setQq(qq);
			user.setType(type);
			String id=userservice.adduser(user);
			
			if(!id.equals("0")){
				flag="1";
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
		}

		
		response.setContentType("text/xml;charset=UTF-8");  
		PrintWriter out =  response.getWriter();
		out.print(flag);
		out.flush();
		out.close();
		
        return null;		
	}
	
	
	/***
	 * BBS主页
	 * @return
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(String type,HttpServletRequest request) {
		if(StringUtill.isEmty(type)){
			type="0";
		}
		    request.setAttribute("stype11", type);
		return "index";
	}
	
	
	/***
	 * 登陆
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/loginUser.do", method = RequestMethod.GET)
	public String login(String temp,HttpServletRequest request, HttpServletResponse response) {
		if ("1".equals(temp)) {
			request.setAttribute("msg", "注册成功，请重新登陆");
		}
		if ("2".equals(temp)) {
			request.setAttribute("msg", "密码错误");
		}
		if ("3".equals(temp)) {
			request.setAttribute("msg", "没有该账户");
		}
		if ("4".equals(temp)) {
			request.setAttribute("msg", "退出成功	");
		}
		if ("5".equals(temp)) {
			request.setAttribute("msg", "请先登录");
		}
		if ("6".equals(temp)) {
			request.setAttribute("message", "请注册");
		}
		return "register";
	}
	
	/***
	 * 退出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(String temp,HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "register";
	}
	

}
