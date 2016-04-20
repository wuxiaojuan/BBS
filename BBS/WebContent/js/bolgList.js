
$(document).ready(function() {
	
	var userId=$("#userId").val();
	var flagId=$("#flagId").val();
	if(userId!=null&&userId!=""){
		var type=1;
		if(flagId==2){
			type=2;
			$("#mypalyId").html("我的草稿");
		}else if(flagId==1){
			$("#mypalyId").html("我的博客");
		}
		blogAjax("/BBS/blog/getBlogByTypeAndUser.do",{type:type,userId:userId});
		
		
	}else{
		$("#mypalyId").html("登陆用户已失效，请先<a href='/BBS/home/logout.do'>登陆</a>");
	}


	
	
});
	
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
				$("#container").html(shtml);
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