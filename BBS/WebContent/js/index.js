
$(document).ready(function() {
	
	$("ul.topic_nav_block li a").click(function(){
		$(".topic_nav_block a").removeClass("current_nav");
		$(this).addClass("current_nav");
		var type=$(this).attr("name");
		$("#right_sidebar").find("input[name=stype11]").val(type);
		checkTab(type);
		
	});
	
	var type=$("#right_sidebar").find("input[name=stype11]").val();
	
	checkTab(type);
	
	function checkTab(type){
		var userId=$("#right_sidebar").find("input[name=userId]").val();
		
		if(type==0){//首页
			 blogAjax("/BBS/blog/findBlogByType.do",{type:1});
		}else if(userId!=""){
			if(type==1){//我的博客
				 blogAjax("/BBS/blog/getBlogByTypeAndUser.do",{type:"1",userId:userId});
			}else if(type==2){//我的草稿
				 blogAjax("/BBS/blog/getBlogByTypeAndUser.do",{type:"2",userId:userId});
			}
			
		}else if(userId==""){
			$("#main div.feed_block").html("<h2 class='entry_title'>请先登陆</h2>");
		}
		
	}
	
	
	function blogAjax(url,prame){
		 $.ajax({
				type: 'post',
				url: url,
				data: prame,
				dataType: 'json',
				success: function(result) {
					var shtml="";
					for(var i=0;i<result.length;i++){
						shtml+=shtmlStr1(result[i],1);
					}
			
					$("#main div.feed_block").html(shtml);
				}
			});
		
	}
	

	
	 function shtmlStr1(blog,type) {
		 var ss=blog.content;
		     if(type==1){
			     ss=ss.substr(0,100); 
		     }
		 var sHtml="";
		     sHtml+="<div class='post_block'>";
			 sHtml+="<div class='content'>";
			 sHtml+="<h2 class='entry_title'>";
			 sHtml+="<a href='/BBS/blog/findBlogByAid.do?aid="+blog.aid+"' class='title_author' target='_blank'>["+blog.username+"]</a>";
			 sHtml+="<a href='/BBS/blog/findBlogByAid.do?aid="+blog.aid+"' target='_blank'>"+blog.title+"</a>";
			 sHtml+="</h2>";
			 sHtml+="<div class='entry_summary'>";
			 sHtml+=ss.trim()+"......";
			 sHtml+="</div>";
			 sHtml+="<div class='clear'></div>";
			 sHtml+="<div class='entry_footer'>";
			 //sHtml+="<span class='post_comment'><a class='grayline' href='#'> 评论(0)</a></span>";
			// sHtml+="<span class='post_view'><a class='grayline' href='#'>阅读(36)</a></span>";
			 sHtml+=" 发布于 <span class='postdate'>"+blog.createTime+"</span>";
			 sHtml+="</div>";
			 sHtml+="<div class='clear'></div>";
			 sHtml+="</div>";
			 sHtml+="<div class='clear'></div>";
			 sHtml+="</div>";
			 
			 return sHtml;
		 
	 }
	
	
});
	
		