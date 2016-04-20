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
<script type="text/javascript" src="${ctx}/js/bolgList.js"></script>

  <%
    String username = (String)request.getSession().getAttribute("SESSION_USERNAME");  
    if(username==null){
    	username="游客";
    }
   
  %>
<body>

    <div id="top">
        <div id="top_left">
            <a href="${ctx}/home/index.do?type=0">首页</a><a href="${ctx}/blog/toAddBlog.do">写博</a><a href="${ctx}/jsp/bolgList.jsp?flag=2" target="_blank">我的草稿</a><a href="${ctx}/jsp/bolgList.jsp?flag=1"  target="_blank">我的博客</a><a href="${ctx}/home/logout.do">退出</a>
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
					<img src="${ctx}/images/ico_news.gif" style="margin-right: 10px;"><font id='mypalyId'> </font> 
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

         
        </div>

    </div>  <input id="userId" name="userId" type="hidden" value="${sessionScope.SESSION_USERID}"/>
    <input type="hidden" name="flag" id="flagId" value="${param.flag}"/>
    
<div class="clear"></div>

</body>
</html>