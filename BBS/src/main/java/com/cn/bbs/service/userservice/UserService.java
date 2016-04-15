package com.cn.bbs.service.userservice;

import java.util.List;

import com.cn.bbs.model.UserInfo;


public interface UserService {
	String adduser(UserInfo user);

	UserInfo login(String username,String type) ;

	public long getUserInfoscount() throws Exception;


	List<UserInfo> getUserInfolist(String type);
	
	public int deleteUser(String id);
	
	public int updateUser(UserInfo user);
	
	/***
	 * type 1普通用户  2管理员
	 * @param id
	 * @param type
	 * @return
	 */
	public int disable(String id,String type);
	
	public int enable(String id,String type);
	
}
