package com.cn.bbs.dao;


import com.cn.bbs.model.UserInfo;

public interface UserDao {

	public String saveuser(UserInfo user);
	
	public UserInfo getuser(String username);
	
	public int getusercount(String username);

/*	


	*//**
	 * 分页
	 * @param map
	 * @return
	 * @throws Exception
	 *//*
	public List<UserInfo> getUserInfolist(Map<String, Object> map) throws Exception;*/
}
