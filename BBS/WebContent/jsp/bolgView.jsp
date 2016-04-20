<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${blog.title}</title>
<link href="${ctx}/css/home_mvc.css" rel="stylesheet">
<link href="${ctx}/css/blogView.css" rel="stylesheet">
</head>
<script type="text/javascript" src="${ctx}/js/comme/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/comme/formValues.js"></script>
<script type="text/javascript" src="${ctx}/js/bolgView.js"></script>

  <%
    String username = (String)request.getSession().getAttribute("SESSION_USERNAME");  
    if(username==null){
    	username="游客";
    }
   
  %>
<body >
<div >

    <div id="top">
        <div id="top_left">
            <a href="${ctx}/home/index.do?type=0">首页</a><a href="${ctx}/blog/toAddBlog.do">写博</a><a <a href="${ctx}/jsp/bolgList.jsp?flag=2" target="_blank">我的草稿</a><a href="${ctx}/jsp/bolgList.jsp?flag=1"  target="_blank">我的博客</a><a href="${ctx}/home/logout.do">退出</a>
        </div>
    </div>
    <div class="clear"></div>

    <div id="wrapper" style="background-color:white;">
	    <div id="header">
	      <div id="logo">
	           <a href="#" title="返回博客园首页"><img src="${ctx}/images/logo_home.jpg" alt="logo"></a>
	      </div>
	      <div class="clear"></div>
	      <div id="header_user"><h1 id="section_left">
					<img src="${ctx}/images/ico_news.gif" style="margin-right: 10px;">当前版块 &nbsp;<font color="green;">-</font>&nbsp;${blog.sectionName}
					</h1>
					<div id="header_user_right">
					        <a href="#"><img class="pfs" src="${ctx}/images/ico_question.gif" alt=""></a>
					        <a href="#"></a>
					        · <a href="${ctx}/jsp/bolgList.jsp?flag=1"  target="_blank">我的博客</a>
					        · <a href="${ctx}/home/logout.do" onclick="return logout();">退出</a>
					</div>
	
		   </div>
	       <div class="clear"></div>
	    </div>
        <div id="container">
           <div class="blogTitle">
                 <div class="blogTitle1">
	            ${blog.title}
	            </div>
	            <div class="blogUser">
	                                                  发布人：${blog.username} &nbsp;&nbsp;&nbsp;发布于：${blog.createTime}
	            </div>
	             <input type="hidden" name="aid" value="${blog.aid}"/>
	       </div>
	       <div class="blogContent">
            ${blog.content}
           </div>
         
        </div>

    </div>
    
<div class="clear"></div>
<input type="hidden" value="${blog.type}" id="blogtypeid"/> 
<div id="wrapper_feed">
    <div class="comment">
        
    </div>
</div>
    
    <div id="wrapper_comment">
        <div class="comment">
              <p><img src="${ctx}/images/quote.gif" style="margin-right: 10px;">发表评论</p>
              <form action="${ctx}/blog/addComment.do" id="comForm" method="post">
                  <input type="hidden" name="userId" value="${sessionScope.SESSION_USERID}"/>
                  <div class="author_div">
                                                                           昵称：<input type="text" disabled="disabled" name="userName" size="35" class="author" value="${sessionScope.SESSION_USERNAME}"/>
                  </div>
                  <input type="hidden" name="aid" value="${blog.aid}"/>
                  <div class='textArea'>
                     <textarea name="content" class="comment_textarea"></textarea>
                 </div>
                 <div class="clear"></div>
                 <div class="textarButton">
                  <input class="Button" name="comButton" type="button" value="提交评论"/>
                 </div>
              </form>
        
        </div>
     </div>
     </div>
</body>
</html>