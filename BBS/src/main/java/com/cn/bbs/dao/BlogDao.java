package com.cn.bbs.dao;

import java.util.List;
import java.util.Map;

import com.cn.bbs.model.Blog;
import com.cn.bbs.model.Comment;
import com.cn.bbs.model.Section;

public interface BlogDao {
	
	String addblog(Blog blog);
	
	String addComment(Comment co);
	
	String addSection(Section se);
	
	Blog getBlogById(String id);
	
	public List<Blog> getBlogByUserId(String userId);
	
	public List<Blog> getBlogByType(String type);//1:·¢²¼  2:²Ý¸å
	
	public List<Blog> getBlogByTypeAndUser(Map<String, String> map);
	
	public List<Section> getSectionList();
	
	public List<Comment> getCommentByAid(String aid);
	
	
}
