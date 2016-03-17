package com.cn.bbs.common.connect.sql;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 
 * @ClassName: SqlSessionDaoSupport
 * @Description: 注入sqlsessionclient
 * 
 * @author Joy.Wu
 */
public class SqlMapSupport<T> extends SqlSessionDaoSupport {
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
}
