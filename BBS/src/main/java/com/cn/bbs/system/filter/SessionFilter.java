package com.cn.bbs.system.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.filter.OncePerRequestFilter;

import com.cn.bbs.common.CommonConstant;
import com.cn.bbs.system.utill.PropertiesUtil;


public class SessionFilter extends OncePerRequestFilter {
	final static Logger log = Logger.getLogger(SessionFilter.class);
	final static String[] access = new String[] { "/home/index.do",
			"/home/login.do" };
	final static String[] types = PropertiesUtil.getproperties(
			"META-INF/requestType.properties", "request.types").split("%");

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse reqResponse, FilterChain filter)
			throws ServletException, IOException {
		boolean isaccess = false;
		boolean istype = false;
		String url = request.getServletPath();
		String type = url.substring(url.lastIndexOf(".") + 1, url.length());
		for (int i = 0; i < access.length; i++) {
			if (access[i].equals(url)) {
				isaccess = true;
				break;
			}
		}
		for (int i = 0; i < types.length; i++) {
			if (types[i].equals(type)) {
				istype = true;
				break;
			}
		}
		// 资源请求直接�?
		if (request.getSession().getAttribute(CommonConstant.SESSION_USERNAME) != null) {
			doFilter(request, reqResponse, filter);
		} else if (request.getSession().getAttribute(CommonConstant.SESSION_USERNAME) == null) {
			if(true==isaccess){
				reqResponse.sendRedirect(request.getContextPath()+"/home/logout.do");
/*				if("/home/back.do".equals(url)){
					reqResponse.sendRedirect(request.getContextPath()+"/home/index.do");	
				}else{
					doFilter(request, reqResponse, filter);
				}*/
			}else{
				reqResponse.sendRedirect(request.getContextPath()+"/home/logout.do");	
			}
		}
	}

}
