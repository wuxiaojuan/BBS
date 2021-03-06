package com.cn.bbs.system.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.cn.bbs.common.CommonConstant;
import com.cn.bbs.model.UserInfo;
import com.cn.bbs.service.userservice.UserService;
import com.cn.bbs.system.utill.MD5Util;

/***
 * 
 * ��½������
 * 
 * @author Joy.Wu
 *
 */
public class LoginFilter extends OncePerRequestFilter {
	
	private static Logger log = Logger.getLogger(LoginFilter.class);

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse reqResponse, FilterChain filter)
			throws ServletException, IOException {
		log.debug("wuxiaojuan-------------------");
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		UserService userservice = (UserService) wac.getBean("userservice");
		String username = request.getParameter("username");
		String type = request.getParameter("type");
		String password = request.getParameter("password");
		UserInfo user = userservice.login(username,type);
		if (user != null) {
			if (MD5Util.md5Encode(password).equals(user.getPassword())) {
				user.setPassword(null);
				request.getSession().setAttribute(CommonConstant.SESSION_USERNAME, user.getUsername());
				request.getSession().setAttribute(CommonConstant.SESSION_USERID, user.getId());
				if(type.equals("1")){
					reqResponse.sendRedirect(request.getContextPath() + "/home/index.do?type=0");	
				}else{
					reqResponse.sendRedirect(request.getContextPath() + "/user/index.do");
				}
			} else {
				reqResponse.sendRedirect(request.getContextPath() + "/home/loginUser.do?temp=2");
			}
		} else {
			reqResponse.sendRedirect(request.getContextPath() + "/home/loginUser.do?temp=3");
		}

	}
}
