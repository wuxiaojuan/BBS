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
    <script type="text/javascript" src="${ctx}/js/comme/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/comme/formValues.js"></script>
    <script src="${ctx}/js/layer/layer.js"></script>
    

</head>
<body>
<style type="text/css">
.Images{padding-right: 5px;padding-bottom: 2px;}
</style>

<script type="text/javascript">
/* $(function(){
	
}); */
function deletemager(obj,id){
    //_tr.remove();
	 $.ajax({
			type: 'post',
			url: "${ctx}/user/deleteManager.do",
			data: {'id':id},
			dataType: 'json',
			success: function(result) {
				if(result<1){
                   return "删除失败！";
			    }else{
			    	$(obj).parent().parent().remove();
			    	//window.location.href="${ctx}/user/manageList.do";
			    }
			}
		}); 
}
function validdo(obj,id,valid){
	 $.ajax({
			type: 'post',
			url: "${ctx}/user/ifValidDo.do",
			data: {'id':id,"valid":valid},
			dataType: 'json',
			success: function(result) {
				if(result<1){
                   return "修改失败！";
			    }else{
			    	window.location.href="${ctx}/user/manageList.do";
			    }
			}
		});
}

function updatemanage(obj,id,qq,username){
	   layer.open({
		   type: 1,
		   title:"修改管理员",
		   skin: 'layui-layer-rim', //加上边框
		   area: ['420px', '240px'], //宽高
		   content: "<div id='abc'>"+$("#manageFormId").prop("outerHTML")+"</div>",
		   btn: ['修改','取消'],
		   yes: function(index, layero){
			   var parms=$('#abc').find("form[name=manageForm]").getjsonvalues();
				 $.ajax({
						type: 'post',
						url: "${ctx}/user/editUser.do",
						data: parms,
						dataType: 'json',
						success: function(result) {
							if(result<1){
			    			    layer.closeAll();
								layer.msg('修改失败'); 
						    }else{
						    	window.location.href="${ctx}/user/manageList.do";
				    			layer.msg('修改成功'); 
							 }
						}
					}); 
 		}
		 });

	   var vales={"id":id,"username":username,"qq":qq};
	   var form=$('#abc').find("form[name=manageForm]");
	   form.setjsonvalues(vales);

    }

</script>
<span class="cp_title">管理员列表</span>
<div class="table_con">
	<table>
    	<tr class="tb_title">
        	<td width="10%">序号</td>
            <td width="30%">管理员名称</td>
            <td width="12%">QQ</td>
            <td width="12%">是否有效</td>
            <td width="26%">操作</td>
        </tr>
        <c:forEach items="${managerList}" var="user" varStatus="xh">
        <tr>
        	<td width="10%">${xh.count}</td>
            <td width="30%"> <img src="${ctx}/images/ico_job.gif" class="Images" alt="${user.username}"><c:out value="${user.username}"/></td>
            <td width="12%">${user.qq}</td>
            <td width="12%">
	            <c:if test="${user.valid==0}">
	                                                           无效
	            </c:if>
	             <c:if test="${user.valid==1}">
	                                                           有效
	            </c:if>
            </td>
            <td width="26%">
            	<input class="bj_btn" type="button" value="编辑" onclick="updatemanage(this,${user.id},'${user.qq}','${user.username}')"/>
            	<c:if test="${user.valid==0}">
                <input class="sj_btn" type="button" value="启用" onclick="validdo(this,${user.id},${user.valid})"/>
                </c:if>
                <c:if test="${user.valid==1}">
                <input class="sj_btn" type="button" value="禁用" onclick="validdo(this,${user.id},${user.valid})"/>
                </c:if>
                <input class="del_btn" type="button" value="删除" onclick="deletemager(this,${user.id})"/>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>

<div style="display: none;">
	<div id="manageFormId" style="padding:20px 20px 20px 20px;text-align: left;">
	   <form name="manageForm">
              <div>
                 <label style="width: 60px;text-align: right;">名称:</label>
                 <input type="text" name="username"/>
                 <input type="hidden" name="id"/>
              </div>
              <div>
                <label style="width: 60px;text-align: right;">新密码:</label>
                <input type="text" name="password"/>
              </div>
              <div>
                <label style="width: 60px;text-align: right;">qq:</label>
                <input type="text" name="qq"/>
              </div>
	   </form>
	</div>
</div>

</body>
</html>