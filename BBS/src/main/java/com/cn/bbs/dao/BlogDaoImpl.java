package com.cn.bbs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.cn.bbs.common.connect.sql.SqlMapSupport;
import com.cn.bbs.model.Blog;
import com.cn.bbs.model.Comment;
import com.cn.bbs.model.Section;
import com.cn.bbs.model.UserInfo;

@Component("blogdao")
public class BlogDaoImpl extends SqlMapSupport<UserInfo> implements BlogDao {

	@Override
	public String addblog(Blog blog) {
		
		String t=this.getSqlSession().insert("Blog.addblog", blog)+"";
		
		return t;
	}

	public Blog getBlogById(String id) {
		return (Blog)this.getSqlSession().selectOne("Blog.getBlogById",id);
	}

	public List<Blog> getBlogByUserId(String userId) {
		return this.getSqlSession().selectList("Blog.getBlogByUserId",userId);
	}

	public List<Blog> getBlogByType(String type) {
		return this.getSqlSession().selectList("Blog.getBlogByType",type);
	}

	public List<Blog> getBlogByTypeAndUser(Map<String, String> map) {
		return this.getSqlSession().selectList("Blog.getBlogByTypeAndUser",map);
	}

	public List<Section> getSectionList() {
		return this.getSqlSession().selectList("Blog.getSectionList");
	}

	public String addComment(Comment co) {
		String t=this.getSqlSession().insert("Blog.addComment", co)+"";
		return t;
	}

	public String addSection(Section se) {
		String t=this.getSqlSession().insert("Blog.addSection", se)+"";
		return t;
	}

	public List<Comment> getCommentByAid(String aid) {
		return this.getSqlSession().selectList("Blog.getCommentByAid",aid);
	}
	
	
	
}
