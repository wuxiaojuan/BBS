package com.cn.bbs.system.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.cn.bbs.common.CommonConstant;


public class OperateFilter extends OncePerRequestFilter {

	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		boolean flag = false;
		for (int i = 0; i < CommonConstant.access.length; i++) {
			if (CommonConstant.access[i].equals(request.getServletPath())) {
				doFilter(request, response, filterChain);
			} else {

			}
		}
	}

}
