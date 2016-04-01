package com.cn.bbs.common;

import java.util.ArrayList;
import java.util.List;

/**
 * 常量
 * 
 */
public class CommonConstant {
	// url集合
	public static List<String> MVCURL = new ArrayList<String>();

	final public static String[] access = new String[] { "/home/index.do?type=0", "/home/register.do", "/home/registeruser.do" };
	// session中用户名
	public static final String SESSION_USERNAME = "SESSION_USERNAME";

	// session中用户名
	public static final String SESSION_USERID = "SESSION_USERID";
	
	
	public static final int BLOG_NORMAL= 1;
	
}
