function loadCurrentUserInfo(){$.ajax({url:"/ajax/user/CurrentUserInfo",type:"get",dataType:"text",success:function(n){var t=$("#header_user");t.html()!=n&&$("#header_user").html(n)}})}function htmlDecode(n){return $("<div/>").html(n).text()}function htmlEncode(n){var t=$("<div/>").text(n).html();return t.replace(/['"]/g,"&quot;")}function publish_ing(){publish_ing_new()}function publish_ing_new(){var n=$("#txt_ing").val(),i,r,t;n=$.trim(n);try{if(i=n.replace(/(http|ftp|https):\/\/([^\/:,，]+)(:\d+)?(\/[^\u0391-\uFFE5\s,]*)?/ig,"").replace(/(\s)+/ig,""),i.length>300){alert("闪存内容不能超过300个字符！当前字符数: "+i.length);return}}catch(u){}if(n==DEFAULT_ING_TIPS||n==""||n=="提示：请输入内容"){$("#txt_ing").val("提示：请输入内容");window.setTimeout(function(){$("#txt_ing").val()=="提示：请输入内容"&&$("#txt_ing").val("你在做什么？你在想什么？")},2e3);return}show_ing_tip("　发布中..");$("#btn_ing_publish").attr("disabled","true");r=1;($("#ing_type_private").attr("checked")=="checked"||$("#ing_type_private").attr("checked")==!0)&&(r=0);t={};t.content=n;t.publicFlag=r;$.ajax({url:"/ajax/ing/Publish",data:JSON.stringify(t),type:"post",dataType:"json",contentType:"application/json; charset=utf-8",success:function(n){if(n.IsSuccess){var t=n.responseText;$("#ing_current").html(t);$("#txt_ing").val("");AppendNewIngNew(t)}else show_ing_tip(n.responseText);$("#btn_ing_publish").removeAttr("disabled")},error:function(n){show_ing_tip(n.responseText);$("#last_ing").html("");$("#btn_ing_publish").removeAttr("disabled")}})}function PublicIngEnterNew(n){if(n.keyCode==13)return publish_ing_new(),!1}function show_ing_tip(n){$("#ing_publish_tip").html(n)}function AppendNewIngNew(n){if($("#feed_list")!=""){var i=$("#lnk_current_user").attr("href"),r=$("#header_user_right img").attr("src"),f=$("#lnk_current_user").html(),t="",u=$("#feed_list li").next().attr("class");t='<li class="'+u+'"><div class="feed_avatar"><img src="'+r+'"/><\/div><div class="feed_body"><a class="big_font blue" href="'+i+'">我<\/a>：<span class="ing_body">'+n+'<\/span><\/div><div class="clear"><\/div><\/li>';$("#feed_list").prepend(t);$("#ing_publish_tip").html("")}}function SearchUser(){if($("#txt_user_name").val()==""||$("#txt_user_name").val()=="先输入内容")$("#txt_user_name").val("先输入内容"),$("#txt_user_name").css("color","gray"),window.setTimeout(function(){$("#txt_user_name").val()=="先输入内容"&&($("#txt_user_name").val(""),$("#txt_user_name").css("color","#000"))},1e3);else{var n=encodeURIComponent($("#txt_user_name").val());window.location="/user/Search.aspx?key="+n}}function SearchUserEnter(n){if(n.keyCode==13)return SearchUser(),!1}function zzk_go(){var n=encodeURIComponent(document.getElementById("q").value);window.location="http://zzk.cnblogs.com/s?w="+n}function zzk_go_enter(n){if(n.keyCode==13)return zzk_go(),!1}function CheckMsg(){var n=$("#msg_count"),t;$("#msg_count").length&&(t=$.ajax({url:"/ajax/user/GetUnreadMsgCount",type:"get",dataType:"text",success:function(t){t!=="0"?n!="["+t+"]"&&n.html("["+t+"]"):n.html()!=""&&$("#msg_count").html("")}}))}function GetLastIng(){$("#last_ing_block")!=""&&$.ajax({url:"/Old/WebService/IngManage.asmx/GetLastIng",data:"{}",type:"post",dataType:"json",contentType:"application/json; charset=utf-8",cache:!1,success:function(n){n.d&&$("#last_ing_block").html(n.d)}})}function GetPassportHost(){return"http://"+location.hostname.replace("home.","passport.")+"/"}function logout_immediate(){return location.href=GetPassportHost()+"logout.aspx?ReturnUrl="+location.href,!1}function GetRecentFeed(n,t){ShowLoading();var i=30;$.ajax({url:"/Old/WebService/FeedService.asmx/GetRecentFeed",data:"{feedListType:"+n+',appId:"'+t+'",itemcount:'+i+"}",type:"post",dataType:"json",contentType:"application/json; charset=utf-8",cache:!1,success:function(n){n.d?($("#feed_list").html(n.d),$("#feed_list").show(),HideLoading()):($("#feed_list").html("<br /><span class='text_gray'>还没有动态，去看一下 <a href='/feed/all/'>全站<\/a> 的吧 :-)<\/span>"),HideLoading())},error:function(){HideLoading()}});$.ajax({url:"/Old/WebService/FeedService.asmx/GetFeedCount",data:"{feedListType:"+n+',appId:"'+t+'"}',type:"post",dataType:"json",contentType:"application/json; charset=utf-8",cache:!1,success:function(n){if(n.d>i){var t=pageUrl.replace("{0}",2);$("#feed_more_block").html('<a href="'+t+'">更多动态<\/a>')}else $("#feed_more_block").html("")}})}function setFeedTab(n){return isLogined?($(".topic_nav_block a").removeClass("current_nav"),$(".topic_nav_block #feed_"+n).addClass("current_nav"),feedListType=n=="me"?4:n=="all"?5:1,$("#sel_application").val("all"),currentAppId="",GetPagedFeed(1),!1):(login(),!1)}function RefreshFeed(){return $("#sel_application").val("all"),currentAppId="",$("#refresh_tips").html("更新中..."),$("#a_refresh").hide(),GetPagedFeed(1),!1}function GetPagedFeed(n,t){return window.scrollTo(0,0),pageSize=t,GetPagedFeed(n),!1}function GetPagedFeed(n){ShowLoading();currentAppId==""&&(currentAppId="00000000-0000-0000-0000-000000000000");var t=(new Date).getTime();return $.ajax({url:"/ajax/feed/recent",data:'{"feedListType":'+feedListType+',"appId":"'+currentAppId+'","pageIndex":'+n+',"pageSize":'+pageSize+"}",type:"post",dataType:"text",contentType:"application/json;",cache:!1,success:function(n){ShowProfiler((new Date).getTime()-t);$("#a_refresh").show();$("#refresh_tips").html("");HideLoading();n?$("#feed_list").html(n):$("#feed_list").html("<li class='nofeed'>当前无动态 :-)<\/li>")},error:function(){HideLoading()}}),$.ajax({url:"/ajax/feed/GetFeedPager",data:'{"feedListType":'+feedListType+',"appId":"'+currentAppId+'","pageIndex":'+n+',"pageSize":'+pageSize+"}",type:"post",dataType:"text",contentType:"application/json;",cache:!1,success:function(t){$("#feed_pager_block").html(t);n>1?($("#pager_top").html(t),$("#pager_top").show()):$("#pager_top").hide()},error:function(){}}),!1}function GetFeedsBySelect(n){var t="00000000-0000-0000-0000-000000000000";$.ajax({url:"/ajax/common/GetApplicationIdByName",data:'{applicatonName:"'+n+'"}',type:"post",dataType:"text",contentType:"application/json;charset=utf-8",cache:!1,async:!1,success:function(n){t=n}});currentAppId=t;GetPagedFeed(1)}function SetPageUrl(n){var t="";switch(feedTypeIndex){case 1:t="recent/";break;case 4:t="me/";break;case 5:t="all/";break;default:t="recent/"}pageUrl=n==""?"/new/feed/"+t+"{0}.html":"/new/feed/"+t+n+"/{0}.html"}function SetFeedRefreshStaus(){var n=$("#feed_list").height();$("#feed_list").html('<li class="feed_loading" id="feed_loading_block"><img src="http://static.cnblogs.com/images/loading.gif" alt=""/><\/li>');$("#feed_loading_block").css("height",n)}function HideTip(){($("#txt_ing").val()==DEFAULT_ING_TIPS||$("#txt_ing").val()=="提示：请输入内容")&&($("#txt_ing").val(""),$("#txt_ing").css("color","#222"),$("#txt_ing").css("font-size","14px"))}function IngIsEmpty(){$("#txt_ing").val()==""&&($("#txt_ing").css("color","#BBB"),$("#txt_ing").val(DEFAULT_ING_TIPS))}function cnblogs_code_collapse(n){n.children("div.cnblogs_code_open").css("display")!="none"?(n.children("div.cnblogs_code_open").css("display","none"),n.children("img.code_img_opened").css("display","none"),n.children("img.code_img_closed").css("display","inline")):(n.children("div.cnblogs_code_open").css("display","block"),n.children("img.code_img_opened").css("display","inline"),n.children("img.code_img_closed").css("display","none"))}function cnblogs_code_show(n){$("#cnblogs_code_open_"+n).css("display")=="none"&&($("#cnblogs_code_open_"+n).show(),$("#code_img_opened_"+n).show(),$("#code_img_closed_"+n).hide())}function cnblogs_code_hide(n,t){$("#cnblogs_code_open_"+n).css("display")!="none"&&($("#cnblogs_code_open_"+n).hide(),$("#code_img_opened_"+n).hide(),$("#code_img_closed_"+n).show(),t.stopPropagation())}function AddToWz(){window.open("/create?t=&u=&c=&i=0","_blank","scrollbars=auto,width=460,height=353,left=100,top=50,status=yes,resizable=yes")}function PutInWz(){var i=460,r=353,u=(screen.width-i)/2,f=(screen.height-r)/2,n=document,t=n.selection?n.selection.type!="None"?n.selection.createRange().text:"":n.getSelection?n.getSelection():"";t.length>200&&(t=t.substring(0,200));window.open("http://wz.cnblogs.com/create?t="+escape(n.title)+"&u="+encodeURIComponent(n.location.href)+"&c="+escape(t)+"&i=0","_blank","width="+i+",height="+r+",toolbars=0,resizable=1,left="+u+",top="+f)}function ShowLoading(){$("#feed_loading").html('<img align="absmiddle" src="http://static.cnblogs.com/images/loading.gif" alt=""/> 正在加载数据...');$("#feed_loading").show();$("#feed_list").hide()}function HideLoading(){$("#feed_loading").hide();$("#feed_list").show()}function ShowProfiler(n){$("#profiler_footer").html("(执行耗时"+n+"毫秒)")}function RelationController(){}function gotoTop(){return window.scrollTo(0,0),!1}var ajaxRequest={},Pager;ajaxRequest.type="post";ajaxRequest.dataType="json";ajaxRequest.contentType="application/json; charset=utf8";ajaxRequest.data="{}";$.ajaxSetup({type:"post",dataType:"json",contentType:"application/json; charset=utf8",cache:!1});var DEFAULT_ING_TIPS="你在做什么？你在想什么？",search=function(){},searchEnter=function(n){if(n.keyCode==13)return search(),!1};Pager={};Pager.PageIndex=1;Pager.PageSize=30;Pager.ShowPageCount=5;Pager.TotalCount=0;Pager.UrlFormat=location.href+"?page={0}";Pager.ClickFunctionName="";Pager.Build=function(n){var t,e;this.PageSize>=this.TotalCount;$(n).html("");var r=parseInt((this.TotalCount+this.PageSize-1)/this.PageSize),u=this.PageIndex-this.ShowPageCount,f=this.PageIndex+this.ShowPageCount;for(r>this.ShowPageCount*2-1?u<1?(u=1,f=u+2*this.ShowPageCount):f>r&&(u=r-2*this.ShowPageCount,f=r):(u=1,f=r),t=document.createDocumentFragment(),this.PageIndex>1&&(t.appendChild(this.BuildLink("&lt; Prev",this.PageIndex-1)),this.PageIndex>this.ShowPageCount+1&&u>1&&t.appendChild(this.BuildLink(1,1)),u>2&&t.appendChild(document.createTextNode("···"))),i=u;i<=f;i++)i==this.PageIndex?(e=document.createElement("span"),$(e).prop("class","current"),e.innerHTML=this.PageIndex,t.appendChild(e)):t.appendChild(this.BuildLink(i,i));this.PageIndex<r&&(f<r&&(t.appendChild(document.createTextNode("···")),t.appendChild(this.BuildLink(r,r,this.TotalCount))),t.appendChild(this.BuildLink("Next &gt;",this.PageIndex+1,this.TotalCount)));$(n).html(t)};Pager.BuildLink=function(n,t){var i=document.createElement("a"),r;return this.ClickFunctionName?(i.href="javascript:void(0);",r=this.ClickFunctionName+"("+t+");Pager.SetCurrent("+t+");",i.onclick=function(){eval(r)}):i.href=this.UrlFormat.replace("{0}",t),i.innerHTML=n,i};Pager.SetCurrent=function(n){this.PageIndex=n;this.PageIndex>1&&this.Build($("#pager_top"));this.Build($("#pager_bottom"))};RelationController.GetMyFolloweesFollowers=function(n,t){$.ajax({url:"/Relation/GetMyFolloweesFollowers",data:'{"id":'+n+"}",type:"post",dataType:"text",success:function(n){$("#"+t).html(n)}})};typeof googletag!="undefined"&&googletag.cmd.push(function(){googletag.defineSlot("/1090369/home.cnblogs.com_side",[250,250],"div-gpt-ad-1346371457607-0").addService(googletag.pubads());googletag.pubads().enableSingleRequest();googletag.enableServices()});$(function(){CheckMsg()})