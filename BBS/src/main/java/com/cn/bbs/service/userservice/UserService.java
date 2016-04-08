package com.cn.bbs.service.userservice;

import java.util.List;

import com.cn.bbs.model.UserInfo;


public interface UserService {
	String adduser(UserInfo user);

	UserInfo login(String username,String type) ;

	public long getUserInfoscount() throws Exception;


	List<UserInfo> getUserInfolist(String type);
}
