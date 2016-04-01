package com.cn.bbs.common.controller;

import javax.servlet.http.HttpServletRequest;

import com.cn.bbs.common.CommonConstant;

/***
 * 
 * @author Joy.Wu
 *
 */
public class BaseController {

	private static final long serialVersionUID = 1L;

	protected String getSessionUserName(HttpServletRequest request) {
		return (String) request.getSession().getAttribute(CommonConstant.SESSION_USERNAME);
	}

	protected String getSessionUserId(HttpServletRequest request) {
		return (String) request.getSession().getAttribute(CommonConstant.SESSION_USERID);
	}

	protected void setRequest(HttpServletRequest request, String key, Object obj) {
		request.setAttribute(key, obj);
	}
}
