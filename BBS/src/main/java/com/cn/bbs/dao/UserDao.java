package com.cn.bbs.dao;

import java.util.List;
import java.util.Map;

import com.cn.bbs.model.UserInfo;

public interface UserDao {

	public String saveuser(UserInfo user);

/*	public int getusercount(String username);

	public UserInfo getuser(String username);

	*//**
	 * 分页
	 * @param map
	 * @return
	 * @throws Exception
	 *//*
	public List<UserInfo> getUserInfolist(Map<String, Object> map) throws Exception;*/
}
