package com.cn.bbs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cn.bbs.common.connect.sql.SqlMapSupport;
import com.cn.bbs.model.UserInfo;

@Component("userdao")
public class UserDaoImpl extends SqlMapSupport<UserInfo> implements UserDao {

	public  String saveuser(UserInfo user) {
		
		String t=this.getSqlSession().insert("User.saveuser", user)+"";
		
		return t;
	}

	@Override
	public UserInfo getuser(Map<String, String> map) {
		return (UserInfo) this.getSqlSession().selectOne("User.getuserbyname",map);
	}
	
	
	public int getusercount(String username) {
		return (Integer) this.getSqlSession().selectOne(
				"User.getusercountbyname", username);
	}
	
	public List<UserInfo> getUserInfolist(String type) {
		return this.getSqlSession().selectList("User.getUserInfolist", type);
	}

	/*public int getusercount(String username) {
		return (Integer) this.getSqlSession().selectOne(
				"User.getusercountbyname", username);
	}

	public UserInfo getuser(String username) {
		return (UserInfo) this.getSqlSession().selectOne("User.getuserbyname",
				username);
	}


*/
}
