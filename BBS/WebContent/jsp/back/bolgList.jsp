<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的园子 后台- 贴子列表</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/css/back/Iframe.css" />
    <link rel="stylesheet" href="${ctx}/css/comme/bootstrap.min.css" type="text/css" media="screen" />
    <script type="text/javascript" src="${ctx}/js/comme/jquery-1.9.0.min.js"></script>
     <script src="${ctx}/js/layer/layer.js"></script>

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	blogAjax("/BBS/blog/findBlogByType.do",{type:1});
	function blogAjax(url,prame){
		 $.ajax({
				type: 'post',
				url: url,
				data: prame,
				dataType: 'json',
				success: function(result) {
					for(var i=0;i<result.length;i++){
						$("#blogId").append(trStr1(result[i]));
					}
			
				}
			});
            
        
		 function trStr1(blog) {//blog.content
			 var sHtml="<tr>";
			     sHtml+="<td width='8%'>445</td>";
			     sHtml+="<td width='30%'>"+blog.title.substr(0,17)+"...</td>";
			     sHtml+="<td width='20%'>"+blog.createTime+"</td>";
			     sHtml+="<td width='12%'>"+blog.username+"</td>";
			     sHtml+="<td width='26%'>";
			     sHtml+=" <input class='del_btn' onclick='deleteblog(this,"+blog.aid+")' type='button' value='删除' />";
			     //sHtml+=" <input class='bj_btn' type='button' style='width: 100px;' value='查看详情' />";
			     sHtml+="</td>";
			     sHtml+="</tr>";
			     
				 return sHtml;
			 
		 }
		
	}
})

function deleteblog(obj,aid){
	 $.ajax({
			type: 'post',
			url: "${ctx}/bblog/deleteBlog.do",
			data: {id:aid},
			dataType: 'json',
			success: function(result) {
				if(result>0){
					$(obj).parent().parent().remove();
					layer.msg('删除成功！'); 
					}		
			}
		});
}

function openDetail(aid){
	 $.ajax({
			type: 'post',
			url: url,
			data: prame,
			dataType: 'json',
			success: function(result) {
		    	layer.open({
		          title:title,
				  type: 1,
				  skin: 'layui-layer-rim', //加上边框
				  area: ['420px', '240px'], //宽高
				  content: content
				});
		
			}
		});
}

</script>
<span class="cp_title">贴子列表</span>
<div class="table_con">
	<table id="blogId">
    	<tr class="tb_title">
        	<td width="8%" >序号</td>
            <td width="30%">贴子标题</td>
            <td width="20%">创建时间</td>
            <td width="12%">创建人</td>
            <td width="26%">操作</td>
        </tr>
    </table>
</div>
</body>
</html>