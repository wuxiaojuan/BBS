<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的园子 后台- 管理员列表</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/css/back/form.css" />

</head>
<body>
<div class="cp_title">添加管理员</div>
<div style="margin: 20px 0 0 80px;">
 <form class="form" action="${ctx}/home/register.do" method="post">
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
  </p>
  <p class="submit">
    <input type="submit" value="Send" />
  </p>
</form>

</div>
</body>
</html>