/***
 * 
 * wuxiaojuan
 */
var ctx="/BBS";
$(document).ready(function(){
	$("#menu li a.firsta").click(function(){
			var status=$(this).next("ul").css("display");
			var firstchild_a=$(this).find("i");
			var all_lis=$(this).parents("ul").find("a.firsta i");
			all_lis.removeClass("xlcddown");
			all_lis.addClass("xlcd");
				
			if(status=="none"){
				firstchild_a.removeClass("xlcd");
				firstchild_a.addClass("xlcddown");
			}else{
				firstchild_a.removeClass("xlcddown");
				firstchild_a.addClass("xlcd");	
			}
		
		});
});
	
$(function(){
    $("#ad_setting").click(function(){
        $("#ad_setting_ul").show();
    });
    $("#ad_setting_ul").mouseleave(function(){
        $(this).hide();
    });
    $("#ad_setting_ul li").mouseenter(function(){
        $(this).find("a").attr("class","ad_setting_ul_li_a");
    });
    $("#ad_setting_ul li").mouseleave(function(){
        $(this).find("a").attr("class","");
    });
});

