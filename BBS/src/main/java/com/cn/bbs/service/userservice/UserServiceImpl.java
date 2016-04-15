package com.cn.bbs.service.userservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cn.bbs.dao.UserDao;
import com.cn.bbs.model.UserInfo;
import com.cn.bbs.system.utill.MD5Util;


@Component("userservice")
public class UserServiceImpl implements UserService {
	private static Logger log = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	UserDao userdao;

	@Transactional(propagation = Propagation.REQUIRED)
	public String adduser(UserInfo user) {
		String id = null;
		int uesercout = userdao.getusercount(user.getUsername(),user.getType());
		try {
			if (uesercout > 0) {
				id = "0";
			} else {
				user.setPassword(MD5Util.md5Encode(user.getPassword()));
				id = userdao.saveuser(user);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			e.printStackTrace();
		}
		return id;
	
	}

	@Override
	public UserInfo login(String username,String type) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("username", username);
		map.put("type", type);
		return userdao.getuser(map);
	}

	@Override
	public long getUserInfoscount() throws Exception {
	    	return userdao.getusercount("",null);
	}

	/***
	 * 1为普通用户，2为管理员
	 */
	public List<UserInfo> getUserInfolist(String type){
		
		return userdao.getUserInfolist(type);
	}

	@Override
	public int deleteUser(String id) {
		// TODO Auto-generated method stub
		 return userdao.deleteUser(id);
	}

	@Override
	public int updateUser(UserInfo user) {
		user.setPassword(MD5Util.md5Encode(user.getPassword()));
		return userdao.updateUser(user);
	}

	@Override
	public int disable(String id,String type) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("valid", "0");
		map.put("type", type);
		return userdao.valid(map);
	}

	@Override
	public int enable(String id,String type) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("valid", "1");
		map.put("type", type);
		return userdao.valid(map);
	}



}
