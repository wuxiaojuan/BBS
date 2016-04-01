<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${ctx}/css/home_mvc.css" rel="stylesheet">
<link href="${ctx}/css/blog.css" rel="stylesheet">
</head>
<body bgcolor="#7d8b8d;" style="background-color: #7d8b8d;">

    <div id="top">
        <div id="top_left">
            <a href="${ctx}/home/index.do">首页</a><a href="${ctx}/blog/toAddBlog.do">写博</a><a href="#">我的收藏</a><a href="#">我的博客</a><a href="${ctx}/home/logout.do">退出</a>
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
					        <a href="http://home.cnblogs.com/u/wuxiaojuan/"><img class="pfs" src="${ctx}/images/ico_question.gif" alt=""></a>
					        <a href="http://home.cnblogs.com/u/wuxiaojuan/"></a>
					        · <a href="http://www.cnblogs.com/wuxiaojuan/">我的博客</a>
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
	       </div>
	       <div class="blogContent">
            ${blog.content}
           </div>
         
        </div>
        
        <div class="comment">
              <p><img src="${ctx}/images/quote.gif" style="margin-right: 10px;">发表评论</p>
              <form action="">
                 <input type="text" value="${userId}"/>
                  <input type="text" value="${blog.aid}"/>
                 <textarea class="comment_textarea"></textarea>
                 <div class="clear"></div>
                 <div style="padding-left: 40px;">
                  <input class="Button" type="button" value="提交评论"/>
                 </div>
              </form>
        
        </div>


    </div>
</body>
</html>