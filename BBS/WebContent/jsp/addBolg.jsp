<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的园子-写博</title>
<link href="${ctx}/css/home_mvc.css" rel="stylesheet">
<link href="${ctx}/css/blog.css" rel="stylesheet">
</head>
<script type="text/javascript" src="${ctx}/js/comme/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${ctx}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ctx}/js/bolg.js"></script>
<body>

    <div id="top">
        <div id="top_left">
            <a href="${ctx}/home/index.do?type=0">首页</a><a href="${ctx}/blog/toAddBlog.do">写博</a><a href="${ctx}/jsp/bolgList.jsp?flag=2" target="_blank">我的草稿</a><a href="${ctx}/jsp/bolgList.jsp?flag=1"  target="_blank">我的博客</a><a href="${ctx}/home/logout.do">退出</a>
        </div>
    </div>
    <div class="clear"></div>

    <div id="wrapper">
	    <div id="header">
	      <div id="logo">
	           <a href="#" title="返回博客园首页"><img src="${ctx}/images/logo_home.jpg" alt="logo"></a>
	      </div>
	      <div class="clear"></div>
	      <div id="header_user"><h1 id="header_user_left">
					<img src="${ctx}/images/ico_blog.gif" style="margin-right: 10px;">添加博客
					</h1>
					<div id="header_user_right">
					        <a href="${ctx}/jsp/bolgList.jsp?flag=1"  target="_blank"><img class="pfs" src="${ctx}/images/ico_question.gif" alt=""></a>
					        <a href="${ctx}/jsp/bolgList.jsp?flag=1"  target="_blank"></a>
					        · <a href="${ctx}/jsp/bolgList.jsp?flag=1"  target="_blank">我的博客</a>
					        · <a href="${ctx}/home/logout.do" onclick="return logout();">退出</a>
					</div>
	
		   </div>
	       <div class="clear"></div>
	    </div>
        <div id="container">
          <form action="${ctx}/blog/addBlog.do" id="bolgForm" method="post">
	           <input type="hidden" name="type" value="1"/>
	           
	           <p class="entry_title" style="font-weight: bold;">选择版块</p> 
	           <select name="sectionId" class="selectClass">
	               <option value="0" >- - - 请选择  - - -</option>
	         	   <c:forEach var="v" items="${sectionList}">
						    <option value="${v.id}">${v.name}</option>
					</c:forEach>
			    </select>
	           
	           <p class="entry_title" style="font-weight: bold;">标题</p> 
	           <input name="title" style="width: 100%;height: 30px;" />
	           <p class="entry_title" style="font-weight: bold;">内容</p> 
	           <textarea id="TextArea1" cols="20" rows="2" class="ckeditor" name="content"></textarea>
	           <div style="margin:20px 0 150px 20px;">
	             <input class="Button" id="regsubmit" type="button" value="发布"/>
	             <input class="Button" id="savedraft" type="button" value="保存草稿"/>
	             <input class="Button" name="clossbutton" type="button" value="关闭"/>
	            </div>
           </form>
        </div>


    </div>
</body>
</html>