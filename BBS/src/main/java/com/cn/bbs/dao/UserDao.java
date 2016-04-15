package com.cn.bbs.dao;


import java.util.List;
import java.util.Map;

import com.cn.bbs.model.UserInfo;

public interface UserDao {

	public String saveuser(UserInfo user);
	
	public UserInfo getuser(Map<String, String> map);
	
	public int getusercount(String username,String type);
	public List<UserInfo> getUserInfolist(String type);
	
	
	public int deleteUser(String id);
	
	public int updateUser(UserInfo user);
	
	public int valid(Map<String, String> map);

/*	


	*//**
	 * 分页
	 * @param map
	 * @return
	 * @throws Exception
	 *//*
	public List<UserInfo> getUserInfolist(Map<String, Object> map) throws Exception;*/
}
