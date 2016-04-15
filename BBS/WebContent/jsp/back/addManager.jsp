<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/comme/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/comme/formValues.js"></script>
<script type="text/javascript">

$(function(){
	$('#addManagerForm').find("input[name=addButton]").click(function() {
		var parms=$('#addManagerForm').getjsonvalues();
		if(parms.username==""){
            $("#wrongText").html("Name不能为空！");  
            return 
			}
		if(parms.password==""){
			$("#wrongText").html("password不能为空！");  
            return 
		}
		if(parms.qq==""){
			$("#wrongText").html("qq不能为空！");  
            return 
		}
		
		 $.ajax({
				type: 'post',
				url: "${ctx}/home/registerManage.do",
				data: parms,
				dataType: 'json',
				success: function(result) {
					if(result!=1){
                        return "该用户名已经存在！";
				    }else{
				    	window.location.href="${ctx}/user/manageList.do";
					    }
				}
			});
	});

	
	
});

</script>
<title>我的园子 后台- 管理员列表</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/css/back/form.css" />

</head>
<body>
<div class="cp_title">添加管理员</div>
<div style="margin: 20px 0 0px 100px;border-left:0px solid #D7D7D7;">
 <form class="form"  id="addManagerForm">
 <p style="color: red;" id="wrongText"></p>
  <p class="name">
    <input type="text" name="username" id="name" />
    <label for="name">Name</label>
  </p>
  <p class="email">
    <input type="text" name="password" id="email" />
    <label for="email">password</label>
  </p>
  <p class="web">
    <input type="text" name="qq" id="web" />
    <label for="web">qq</label>
    <input type="hidden" name="type" value="2" />
  </p>
  <p class="submit">
    <input type="button" value="Send" name="addButton"/>
  </p>
</form>

</div>
</body>
</html>