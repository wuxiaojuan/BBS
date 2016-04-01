package com.cn.bbs.system.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.filter.OncePerRequestFilter;

import com.cn.bbs.common.CommonConstant;


public class SessionFilter extends OncePerRequestFilter {
	final static Logger log = Logger.getLogger(SessionFilter.class);

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse reqResponse, FilterChain filter)
			throws ServletException, IOException {
		// 观察session是否有值
		if (request.getSession().getAttribute(CommonConstant.SESSION_USERNAME) != null) {
			doFilter(request, reqResponse, filter);
		} else if (request.getSession().getAttribute(CommonConstant.SESSION_USERNAME) == null) {
			//reqResponse.sendRedirect(request.getContextPath()+"/home/logout.do");
		}
	}

}
