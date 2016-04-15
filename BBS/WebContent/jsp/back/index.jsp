<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的园子 后台- BBS</title>

    <link rel="stylesheet" href="${ctx}/css/back/index.css" type="text/css" media="screen" />
    
    <script type="text/javascript" src="${ctx}/js/comme/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/back/tendina.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/back/common.js"></script>

</head>
<body>
    <!--顶部-->
    <div class="top">
            <div style="float: left"><span style="font-size: 16px;line-height: 59px;padding-left: 20px;color: #fff">安琪园后台管理中心</h1></span></div>
            <div id="ad_setting" class="ad_setting">
                <a class="ad_setting_a" href="javascript:; ">834171435@qq.com</a>
                <ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-user glyph-icon"></i>个人中心</a> </li>
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-cog glyph-icon"></i>设置</a> </li>
                    <li class="ad_setting_ul_li"> <a href="${ctx}/home/logout.do"><i class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span> </a> </li>
                </ul>
                <img class="use_xl" src="${ctx}/images/back/right_menu.png" />
            </div>
    </div>
    <!--顶部结束-->
    <!--菜单-->
    <div class="left-menu">
        <ul id="menu">
            <li class="menu-list">
               <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>管理员管理<s class="sz"></s></a>
                <ul>
                    <li><a href="${ctx}/user/manageList.do" target="menuFrame"><i class="glyph-icon icon-chevron-right2"></i>管理员列表</a></li>
                    <li><a href="/BBS/jsp/back/addManager.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>添加管理员</a></li>
                </ul>
            </li>
            <li class="menu-list">
               <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>普通用户管理<s class="sz"></s></a>
                <ul>
                    <li><a href="${ctx}/user/userList.do" target="menuFrame"><i class="glyph-icon icon-chevron-right2"></i>普通用户列表</a></li>
                </ul>
            </li>
            <li class="menu-list">
               <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>版块管理<s class="sz"></s></a>
                <ul>
                    <li><a href="${ctx}/bblog/findSections.do" target="menuFrame"><i class="glyph-icon icon-chevron-right2"></i>版块列表</a></li>
                </ul>
            </li>
            <li class="menu-list">
               <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>帖子管理<s class="sz"></s></a>
                <ul>
                    <li><a href="/BBS/jsp/back/bolgList.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right2"></i>帖子列表</a></li>
                </ul>
            </li>
        </ul>
    </div>
    
    <!--菜单右边的iframe页面-->
    <div id="right-content" class="right-content">
        <div class="content">
            <div id="page_content">
                <iframe id="menuFrame" name="menuFrame" src="${ctx}/bblog/findSections.do" style="overflow:visible;"
                        scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
            </div>
        </div>
    </div>
</body>
</html>