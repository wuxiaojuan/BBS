package com.cn.bbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam; 

import com.cn.bbs.common.controller.BaseController;
import com.cn.bbs.model.Blog;
import com.cn.bbs.model.Comment;
import com.cn.bbs.model.Section;
import com.cn.bbs.service.userservice.BlogService;
import com.cn.bbs.utill.DateUtil;
import com.cn.bbs.utill.StringUtill;

@Controller
@RequestMapping("/blog")
public class BlogController extends BaseController{
	
	@Autowired
	BlogService blogService;
	
	
	
	/***
	 * 转到 发博客页面
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/toAddBlog.do")
	public String toAddBlog(HttpServletRequest request,
			ModelMap modelMap){

		String userId=getSessionUserId(request);
		if(StringUtill.isEmty(userId)){
			return "register";
		}
		List<Section> list=blogService.getSectionList();
		
		modelMap.addAttribute("sectionList",list); 
		
		
		return "editBolg";
	}
	
	
	
	/***
	 * 
	 * 新加博客
	 * @param type
	 * @param title
	 * @param content
	 * @param sectionId
	 * @param request
	 * @param reqResponse
	 * @param modelMap
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/addBlog.do")
	public String addBlog(@RequestParam("type") String type,//1:发布  2:草稿
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam("sectionId") String sectionId,HttpServletRequest request, HttpServletResponse reqResponse,
			ModelMap modelMap) throws IOException{

		String userId=getSessionUserId(request);
		if(StringUtill.isEmty(userId)){
			return "register";
		}else{
			Blog blog=new Blog();
			blog.setContent(content);
			blog.setTitle(title);
			blog.setType(type);
			blog.setSectionId(sectionId);
			blog.setCreateTime(DateUtil.getDateTime());
			blog.setUserId(userId);
			String  i=blogService.addblog(blog);
			
			if(!i.equals("0")){
				reqResponse.sendRedirect(request.getContextPath() + "/blog/findBlogByAid.do?aid="+blog.getAid());
			}
			
		}
		return "index";
	}
	
	/***
	 * 跟据id查找博客
	 * @param aid
	 * @param modelMap
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/findBlogByAid.do")
	public String findBlogByAid(@RequestParam("aid") String aid,ModelMap modelMap,HttpServletRequest request){
		
		Blog blog=blogService.getBlogById(aid);
		
		String userId=getSessionUserId(request);
		
		modelMap.addAttribute("blog",blog);
		modelMap.addAttribute("userId",userId);
		
		return "bolgView";
		
	}
	
	@RequestMapping(value="/addComment.do")
	public String addComment(@RequestParam("userId") String userId,@RequestParam("content") String content,@RequestParam("aid") String aid,ModelMap modelMap,HttpServletRequest request){
		Comment co=new Comment();
		co.setAid(aid);
		co.setContent(content);
		co.setUserId(userId);
		co.setCreateTime(DateUtil.getDateTime());
		blogService.addComment(co);
		
		
		return "bolgView";
		
	}
	
	
	
	

}
