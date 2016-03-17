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


@Component("userservice")
public class UserServiceImpl implements UserService {
	private static Logger log = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	UserDao userdao;

	@Transactional(propagation = Propagation.REQUIRED)
	public String adduser(UserInfo user) {
		try {
			 userdao.saveuser(user);
		} catch (Exception e) {
			log.info(e.getMessage());
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public UserInfo login(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getUserInfoscount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserInfo> getUserInfolist(String start, String end)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
