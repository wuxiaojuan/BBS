<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的园子 后台- 管理员列表</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/css/back/Iframe.css" />
    <link rel="stylesheet" href="${ctx}/css/comme/bootstrap.min.css" type="text/css" media="screen" />

</head>
<body>
<span class="cp_title">管理员列表</span>
<!-- <div class="add_cp">
	<a href="logo.html">+添加产品</a>
</div> -->
<div class="table_con">
	<table>
    	<tr class="tb_title">
        	<td width="10%">ID</td>
            <td width="30%">管理员名称</td>
            <td width="12%">QQ</td>
            <td width="12%">是否有效</td>
            <td width="26%">操作</td>
        </tr>
        <tr>
        	<td width="10%">445</td>
            <td width="30%">意大利黑金花 石材产品</td>
            <td width="12%">19/100</td>
            <td width="12%">78/100</td>
            <td width="26%">
            	<input class="bj_btn" type="button" value="编辑" />
                <input class="sj_btn" type="button" value="启用" />
                <input class="del_btn" type="button" value="删除" />
            </td>
        </tr>
    </table>
</div>
</body>
</html>