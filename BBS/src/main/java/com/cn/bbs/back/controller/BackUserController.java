package com.cn.bbs.back.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping("/user")
public class BackUserController {
	
	private static Logger log = Logger.getLogger(BackUserController.class);
	@Autowired
	UserService userservice;
	
	
	
	/***
	 * BBSºóÌ¨Ö÷Ò³
	 * @return
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(HttpServletRequest request) {
		return "back/index";
	}
	
	
    /***
     * 
     * @param request
     * @param modelMap
     * @return
     */
	@RequestMapping(value="/manageList.do")
	public String manageList(HttpServletRequest request,ModelMap modelMap){

		List<UserInfo> userlist=userservice.getUserInfolist(CommonConstant.MANAGER_TYPE);
		
		modelMap.addAttribute("managerList",userlist);
		
		return "back/managerList";
	}
	
	
    /***
     * 
     * @param request
     * @param modelMap
     * @return
     */
	@RequestMapping(value="/userList.do")
	public String userList(HttpServletRequest request,ModelMap modelMap){

		List<UserInfo> userlist=userservice.getUserInfolist(CommonConstant.USER_TYPE);
		
		modelMap.addAttribute("userList",userlist);
		
		return "back/userList";
	}
	
	@RequestMapping(value="/deleteManager.do")
	public String deleteManager(
			@RequestParam("id") String id,HttpServletRequest request,
			HttpServletResponse response) throws IOException{
        
		if(StringUtill.isEmty(id)){
			return null;
		}
		String flag="0";
		try {
			int i=userservice.deleteUser(id);
			if(i>0){
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
	
	@RequestMapping(value="/ifValidDo.do")
	public String ifValidDo(@RequestParam("id") String id,
			@RequestParam("valid") String valid,HttpServletRequest request,
			HttpServletResponse response) throws IOException{
        
		if(StringUtill.isEmty(id)){
			return null;
		}
		String flag="0";
		try {
			int i=0;
			if(valid.equals("0")){
				 i=userservice.enable(id,null);
			}else if(valid.equals("1")){
				i=userservice.disable(id,null);
			}
			
			
			if(i>0){
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
	
	@RequestMapping(value="/editUser.do")
	public String editUser(
			@RequestParam("id") String id,@RequestParam("username") String username,@RequestParam("qq") String qq,@RequestParam("password") String password,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
        
        UserInfo user=new UserInfo();
        user.setId(id);
        user.setUsername(username);
        user.setQq(qq);
        user.setPassword(password);
		String flag="0";
		try {
			int i=userservice.updateUser(user);
			if(i>0){
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


}
