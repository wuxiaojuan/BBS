<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/common.jspi"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/login2.css">
<script type="text/javascript" src="${ctx}/js/comme/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/login.js"></script>
<title>登陆注册页面</title>
</head>
<body>

  <h1>BBS用户登录</h1>
<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
          <div class="web_login" id="web_login">
           <div class="login-box">
			<div class="login_form">
			 <form action="${ctx}/home/login.do" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
			      <input type="hidden" name="did" value="${msg}" id="loginFailId"/>
                  <input type="hidden" name="to" value="log"/>
                 <!--  <div id="userLongCue" class="cue">快速登陆请注意格式</div> -->
                <div class="uinArea" id="uinArea">
                <label class="input-tips" for="u">帐号：</label>
                <div class="inputOuter" id="uArea">
                    <input type="text" id="u" name="username" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" for="p">密码：</label> 
               <div class="inputOuter" id="pArea">
                    <input type="password" id="p" name="password" class="inputstyle"/>
                </div>
                </div>
                 <div class="userType">
					普通用户
					<input checked type="radio" value="1" name="type" class="userType2"/>
					管理员
					<input type="radio" value="2" name="type" />
                </div>
                <div style="padding-left:50px;margin-top:7px;"><input type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>
              </form>
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
  </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login">
      <form name="form2" id="regUser" accept-charset="utf-8"  action="${ctx}/home/register.do" method="post">
	         <input type="hidden" name="to" value="reg"/>
		     <input  type="hidden" name="did" value="${message}" id="messageId"/>
                <ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册请注意格式</div>
                <li>
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                        <input type="text" id="user" name="username" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="password" maxlength="16" class="inputstyle2"/>
                    </div>
                    
                </li>
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="password2" maxlength="16" class="inputstyle2" />
                    </div>
                    
                </li>
                
                <li>
                 <label for="qq" class="input-tips2">QQ：</label>
                    <div class="inputOuter2">
                       
                        <input type="text" id="qq" name="qq" maxlength="10" class="inputstyle2"/>
                        <input type="hidden"  name="type" />
                    </div>
                   
                </li>
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;width:150px;" class="button_blue" value="注册"/>
                    </div>
                    
                </li><div class="cl"></div>
            </ul></form>
    </div>
    
    </div>
    <!--注册end-->
</div>
</body>
</html>