package com.cn.bbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
				/*return "redirect:/blog/findBlogByAid.do?aid="+blog.getAid();*/
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
	
	/***
	 * 跟据type查找博客  1:发布  2:草稿
	 * @param modelMap
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/findBlogByType.do")
	public String findBlogByType(@RequestParam("type") int type,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		List<Blog> blog=blogService.getBlogByType(type+"");
		
		
		JSONArray jr = JSONArray.fromObject(blog);
		response.setContentType("text/xml;charset=UTF-8");  
		PrintWriter out =  response.getWriter();
		out.print(jr.toString());
		out.flush();
		out.close();
		return null;
		
	}
	
	
	/***
	 * 跟据id查找博客评论
	 * @param aid
	 * @param modelMap
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/findCommentByAid.do")
	public String findCommentByAid(@RequestParam("aid") String aid,ModelMap modelMap,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		
		List<Comment> coList=blogService.getCommentByAid(aid);
		
		modelMap.addAttribute("coList",coList);
		
		JSONArray jr = JSONArray.fromObject(coList);
		response.setContentType("text/xml;charset=UTF-8");  
		PrintWriter out =  response.getWriter();
		out.print(jr.toString());
		out.flush();
		out.close();
		
		return "bolgView";
		
	}
	
	/***
	 * 跟据type查找博客  1:发布  2:草稿
	 * @param modelMap
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/getBlogByTypeAndUser.do")
	public String getBlogByTypeAndUser(@RequestParam("type") int type,@RequestParam("userId") String userId,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		List<Blog> blog=blogService.getBlogByTypeAndUser(type+"", userId);
		
		JSONArray jr = JSONArray.fromObject(blog);
		response.setContentType("text/xml;charset=UTF-8");  
		PrintWriter out =  response.getWriter();
		out.print(jr.toString());
		out.flush();
		out.close();
		return null;
		
	}
	
	@RequestMapping(value="/addComment.do")
	public String addComment(@RequestParam("userId") String userId,@RequestParam("content") String content,@RequestParam("aid") String aid,ModelMap modelMap,HttpServletRequest request,HttpServletResponse response) throws IOException{
		if(!StringUtill.isEmty(userId)){
			Comment co=new Comment();
			co.setAid(aid);
			co.setContent(content);
			co.setUserId(userId);
			co.setCreateTime(DateUtil.getDateTime());
			blogService.addComment(co);
			JSONArray jr = JSONArray.fromObject(co);
			response.setContentType("text/xml;charset=UTF-8");  
			PrintWriter out =  response.getWriter();
			out.print(jr.toString());
			out.flush();
			out.close();
			
		}
		
		return null;
		
	}
	
	
	
	

}
