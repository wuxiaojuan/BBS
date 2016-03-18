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
		int uesercout = userdao.getusercount(user.getUsername());
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
	public UserInfo login(String username) {
		return userdao.getuser(username);
	}

	@Override
	public long getUserInfoscount() throws Exception {
	    	return userdao.getusercount("");
	}

	@Override
	public List<UserInfo> getUserInfolist(String start, String end)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
