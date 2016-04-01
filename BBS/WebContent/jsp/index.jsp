<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的园子 - BBS</title>
    <link href="${ctx}/images/favicon.ico" rel="shortcut icon">
    <link href="${ctx}/css/home_mvc.css" rel="stylesheet">
    <link href="${ctx}/css/blog.css" rel="stylesheet">

    
    <link href="${ctx}/css/share.css" rel="Stylesheet" type="text/css">

    <script type="text/javascript" src="${ctx}/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/common.js"></script>
    <script src="${ctx}/js/home_mvc.js"></script>

    
<script src="${ctx}/js/favorite.js"></script>

</head>
<body>
  <%
    String username = (String)request.getSession().getAttribute("SESSION_USERNAME");
    if(username==null){
    	username="游客";
    }
   
  %>
    <div id="top">
        <div id="top_left">
            <a href="${ctx}/home/index.do">首页</a><a href="${ctx}/blog/toAddBlog.do">写博</a><a href="#">我的收藏</a><a href="#">我的博客</a><a href="${ctx}/home/logout.do">退出</a>
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
				        欢迎你，<%=username %>
				</h1>
				<div id="header_user_right">
				        <a href="http://home.cnblogs.com/u/wuxiaojuan/"><img class="pfs" src="${ctx}/images/sample_face.gif" alt=""></a>
				        <a href="http://home.cnblogs.com/u/wuxiaojuan/"><%=username %></a>
				        · <a href="http://www.cnblogs.com/wuxiaojuan/">我的博客</a>
				        · <a href="http://home.cnblogs.com/set/account/">设置</a>
				        · <a href="${ctx}/home/logout.do" onclick="return logout();">退出</a>
				</div>

	   </div>
       <div class="clear"></div>
    </div>
    
    
    
           <div id="container">
            <div id="app_bar">
	<p class="app_r_3"></p><p class="app_r_2"></p><p class="app_r_1"></p>
	<div id="app_list_wrapper">
		<ul class="app_list">
			<li>
                <img src="${ctx}/images/ico_group.gif" alt=""><a id="app_ing" href="#">版块</a><div class="clear"></div>
			</li>
			<li>
				<em><a href="${ctx}/blog/toAddBlog.do" target="_blank">写博</a></em><img src="${ctx}/images/ico_blog.gif" alt=""><a id="app_blog" href="${ctx}/blog/toAddBlog.do" target="_blank">博客</a>
			</li>
			<li>
				<em><a href="#" target="_blank">投递</a></em><img src="${ctx}/images/ico_news.gif" alt=""><a id="app_news" href="#">新闻</a>
			</li>
			<li>
				<em><a href="#" target="_self">提问</a></em><img src="${ctx}/images/ico_question.gif" alt=""><a id="app_q" href="#">博问</a>
			</li>
			<li>
				<em><a href="#" target="_blank" onclick="AddToWz();return false;">添加</a></em><img src="${ctx}/images/ico_bookmark.gif" alt=""><a id="app_wz" href="#" class="current">收藏</a>
			</li>
			<li>
				<em><a href="#" target="_blank">发布</a></em><img src="${ctx}/images/ico_job.gif" alt=""><a id="app_job" href="#">招聘</a>
			</li>
			<li>
                <img src="${ctx}/images/ico_kb.gif" alt=""><a id="app_kb" href="#">文库</a>
			</li>
		</ul>
		<div class="app_setting">
            <a href="#" class="flag_edit" target="_blank">问题反馈</a>
		</div>
	</div>
	<p class="app_r_1"></p><p class="app_r_2"></p><p class="app_r_3"></p>
</div> 
            <div id="container_content">
                
                <div id="main">
                    
<div class="topic_nav_block_wrapper">
    <div class="quick_block"></div>
    <ul class="topic_nav_block">
        <li>
            <a href="#" class="current_nav">首页</a>
        </li>
        <li>
            <a href="#" class="">我的博客</a>
        </li>
        <li>
            <a href="#" class="">精华</a>
        </li>
        <li>
            <a href="#" class="">我的收藏</a>
        </li>
        <li>
            <a href="#" class="">我的推存</a>
        </li>
    </ul>
    <div class="clear"></div>
 </div>
 <div id="main">
	<div class="feed_block">
        
        <div class="post_block">
          <div class="content">
             <h2 class="entry_title">
              <a href="http://www.cnblogs.com/yjf512/" class="title_author" target="_blank">[轩脉刃]</a>
              <a href="http://www.cnblogs.com/yjf512/p/5314345.html" target="_blank">PHP的错误机制总结</a>
             </h2>
             <div class="entry_summary">PHP
的错误机制总结 PHP的错误机制也是非常复杂的，做了几年php，也没有仔细总结过，现在就补上这一课。 特别说明：文章的PHP版本使用5.5.32
 PHP的错误级别 首先需要了解php有哪些错误。截至到php5.5，一共有 "16个错误级别" 
注意：尝试下面的代码的时候请确保打开error_lo
	          </div>
	          <div class="clear"></div>
	          <div class="entry_footer"> <span class="post_comment"><a class="grayline" title="最新评论时间：1/1/0001 12:00:00 AM" href="http://www.cnblogs.com/yjf512/p/5314345.html#commentform"> 评论(0)</a></span> <span class="post_view"><a class="grayline" href="http://www.cnblogs.com/yjf512/p/5314345.html">阅读(36)</a></span> 推荐(1) 发布于 <span class="postdate">2016-03-24 10:13</span></div>
	          <div class="clear"></div>
           </div>
           <div class="clear"></div>
       </div>
       
    </div>   
 </div>

</div>
                <div id="right_sidebar">

                </div>
                <div class="clear"></div>
</div>
            <div id="goTop"><a href="javascript:void(0)" onclick="return gotoTop()"><img src="${ctx}/images/ico_top.gif" alt="Top" title="回到页首"></a></div>
            <div class="clear"></div>
</div>
    
    
    
    
  </div>
</body>
</html>