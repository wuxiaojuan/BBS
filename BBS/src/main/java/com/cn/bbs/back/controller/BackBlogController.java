package com.cn.bbs.back.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
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
@RequestMapping("/bblog")
public class BackBlogController extends BaseController{
	
	private static Logger log = Logger.getLogger(BackBlogController.class);
	
	@Autowired
	BlogService blogService;
	
	
	
	/***
	 * �鵽���
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/findSections.do")
	public String findSections(HttpServletRequest request,
			ModelMap modelMap){

/*		String userId=getSessionUserId(request);
		if(StringUtill.isEmty(userId)){
			return "register";
		}*/
		List<Section> list=blogService.getSectionList();
		
		modelMap.addAttribute("sectionList",list); 
		
		
		return "back/sectionList";
	}
	
	/***
	 * ��Ӱ��
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/addSection.do")
	public String addSection(@RequestParam("name") String name,@RequestParam("remarks") String remarks,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		
		Section se=new Section();
		se.setCreateDate(DateUtil.getDateTime());
        se.setCreateUser(getSessionUserId(request));
        se.setName(name);
        se.setRemarks(remarks);
        
		String i=blogService.addSection(se);
		String flag="0";
		if(!i.equals("0")){
			flag="1";
		}
		PrintWriter out =  response.getWriter();
		out.print(flag);
		out.flush();
		out.close();
		return null;
		
	}
	
	/***
	 * �޸İ��
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/editSection.do")
	public String editSection(@RequestParam("name") String name,@RequestParam("remarks") String remarks,@RequestParam("sectionId") String sectionId,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		
		Section se=new Section();
        se.setName(name);
        se.setRemarks(remarks);
        se.setId(sectionId);
		String i=blogService.editSection(se);
		String flag="0";
		if(!i.equals("0")){
			flag="1";
		}
		PrintWriter out =  response.getWriter();
		out.print(flag);
		out.flush();
		out.close();
		return null;
		
	}
	
	/***
	 * ɾ�����
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/deleteSection.do")
	public String deleteSection(@RequestParam("sectionId") String sectionId,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		
		int i=blogService.deleteSectionById(sectionId);
		String flag="0";
		if(i>0){
			flag="1";
		}
		PrintWriter out =  response.getWriter();
		out.print(flag);
		out.flush();
		out.close();
		return null;
		
	}
	
	/***
	 * ����type���Ҳ���  1:����  2:�ݸ�
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
	 * ����id���Ҳ�������
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
	 * ����type���Ҳ���  1:����  2:�ݸ�
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
	

	
	
	
	

}
