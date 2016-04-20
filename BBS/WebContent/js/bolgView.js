$(document).ready(function() {
	
	var userId=$('#comForm').find("input[name=userId]").val();
	
	var type=$('#blogtypeid').val();
	if(type==2){//草稿
		var parms=$('#comForm').getjsonvalues();
		$("#wrapper_comment").css('display','none'); 
		$("#wrapper_feed div.comment").html("当前为你的草稿：可<a href='/BBS/blog/toeditBlog.do?temp=1&aid="+parms.aid+"'>修改</a>");
		//$("#wrapper_feed").hide();
		
	}else if(userId==""){
		$("#wrapper_comment .comment").html("&nbsp;&nbsp;&nbsp;&nbsp;注册用户登录后才能发表评论，请 <a href='/BBS/home/logout.do'>登录</a> 或 <a href='/BBS/home/loginUser.do?temp=6'>注册</a>。");

	}
	
    /*发布评论*/
	$('#comForm').find("input[name=comButton]").click(function() {
		var parms=$('#comForm').getjsonvalues();
		 $.ajax({
				type: 'post',
				url: "/BBS/blog/addComment.do",
				data: parms,
				dataType: 'json',
				success: function(result) {
					commentAjax("/BBS/blog/findCommentByAid.do",{aid:parms.aid});
					$('#comForm').find("textarea[name=content]").val("");
					alert("评论成功！");
				}
			});
	});
	
	var aid=$('#container').find("input[name=aid]").val();
	
	if(aid!=""){
		commentAjax("/BBS/blog/findCommentByAid.do",{aid:aid});
	}
	
	/*查找评论*/
	function commentAjax(url,prame){
		 $.ajax({
				type: 'post',
				url: url,
				data: prame,
				dataType: 'json',
				success: function(result) {
					var shtml="";
					if(result.length>0){
						for(var i=0;i<result.length;i++){
							shtml+=shtmlStr1(result[i],i+1);
						}
						$("#wrapper_feed div.comment").html("<p style='padding-left: 20px;'>评论列表</p>"+shtml);
					}else{
						if(type!=2){
							$("#wrapper_feed div.comment").html("<p style='padding-left: 20px;'>暂没有评论，赶紧抢座吧！</p>");
						}
						
					}
					
				}
			});
		
	  }
	
	
	 function shtmlStr1(comment,i) {
		 var sHtml="<div class='feedList'>";
		     sHtml+="<div class='feedbackItem'>";
			 sHtml+="<div class='feedbackListSubtitle'>";
			 sHtml+="<div class='feedbackManage'>";
			 sHtml+=" <font color='#353535'>#"+i+"楼</font>";
			 sHtml+=" <span class='comment_date'>"+comment.createTime+"</span>";
			 sHtml+=" <font color='#353535'>"+comment.userName+"</font>";
			 sHtml+="</div></div>";
			 sHtml+="<div class='clear'></div>";
			 sHtml+="<div class='feedbackCon'>";
			 sHtml+="<div class='blog_comment_body'>"+comment.content+"</div>";
			 sHtml+="</div></div></div>";
			 return sHtml;
		 
	 }
	
	
});