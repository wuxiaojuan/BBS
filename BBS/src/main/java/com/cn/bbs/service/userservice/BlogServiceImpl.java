package com.cn.bbs.service.userservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cn.bbs.dao.BlogDao;
import com.cn.bbs.model.Blog;
import com.cn.bbs.model.Comment;
import com.cn.bbs.model.Section;


@Component("blogservice")
public class BlogServiceImpl implements BlogService {
	private static Logger log = Logger.getLogger(BlogServiceImpl.class);
	
	@Autowired
	BlogDao blogdao;

	@Override
	public String addblog(Blog blog) {
		// TODO Auto-generated method stub
		return blogdao.addblog(blog);
	}

	@Override
	public Blog getBlogById(String id) {
		// TODO Auto-generated method stub
		return blogdao.getBlogById(id);
	}

	@Override
	public List<Blog> getBlogByUserId(String userId) {
		// TODO Auto-generated method stub
		return blogdao.getBlogByUserId(userId);
	}

	@Override
	public List<Blog> getBlogByType(String type) {
		// TODO Auto-generated method stub
		return blogdao.getBlogByType(type);
	}

	@Override
	public List<Blog> getBlogByTypeAndUser(String type, String userId) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String, String>();
		map.put("type", type);
		map.put("userId", userId);
		return blogdao.getBlogByTypeAndUser(map);
	}

	@Override
	public List<Section> getSectionList() {
		// TODO Auto-generated method stub
		return blogdao.getSectionList();
	}
	
	
	public String addComment(Comment co) {
		// TODO Auto-generated method stub
		return blogdao.addComment(co);
	}

	@Override
	public String addSection(Section se) {
		// TODO Auto-generated method stub
		return blogdao.addSection(se);
	}

	@Override
	public List<Comment> getCommentByAid(String aid) {
		// TODO Auto-generated method stub
		return blogdao.getCommentByAid(aid);
	}

	@Override
	public int deleteCommentById(String id) {
		// TODO Auto-generated method stub
		return blogdao.deleteCommentById(id);
	}

	@Override
	public int deleteSectionById(String id) {
		// TODO Auto-generated method stub
		return blogdao.deleteSectionById(id);
	}

	@Override
	public String editSection(Section se) {
		// TODO Auto-generated method stub
		return blogdao.editSection(se);
	}

	@Override
	public int editblog(Blog blog) {
		// TODO Auto-generated method stub
		return blogdao.editblog(blog);
	}

	
}
