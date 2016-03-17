package com.cn.bbs.service.userservice;

import java.util.List;

import com.cn.bbs.model.UserInfo;


public interface UserService {
	String adduser(UserInfo user);

	UserInfo login(String username) ;

	public long getUserInfoscount() throws Exception;

	public List<UserInfo> getUserInfolist(String start, String end) throws Exception;
}
