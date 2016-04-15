package com.cn.bbs.service.userservice;

import java.util.List;

import com.cn.bbs.model.Blog;
import com.cn.bbs.model.Comment;
import com.cn.bbs.model.Section;


public interface BlogService {
	
	
	public String addblog(Blog blog);

	public int editblog(Blog blog);
	
	public String addComment(Comment co);
	
	public String addSection(Section se);
	
	public String editSection(Section se);
	
	public Blog getBlogById(String id);
	
	public List<Comment> getCommentByAid(String aid);
	
	public List<Section> getSectionList();
	
	
	public int deleteCommentById(String id);
	
	public int deleteSectionById(String id);
	
	public List<Blog> getBlogByUserId(String userId);
	
	public List<Blog> getBlogByType(String type);//1:·¢²¼  2:²Ý¸å
	
	public List<Blog> getBlogByTypeAndUser(String type,String userId);
	
	
	

}
