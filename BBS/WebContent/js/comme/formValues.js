﻿(function ($) {
    $.fn.getjsonvalues = function () {
        var retVal = {};
        $(this).find(":input").each(function () {
            if ($(this).attr("type") == "text" || $(this).attr("type") == "hidden" || $(this).attr("type") == "file"||$(this)[0].tagName.toLowerCase() == "textarea")
            {
                var name = $(this).attr("name");
                var value = $.trim($(this).val());
                retVal[name] = value;
            }
            else if ($(this).attr("type") == "radio") {
                var name = $(this).attr("name");
                var value = $.trim($(this).val());
                retVal[name] = $(this).prop("checked") ? value : "";
            }
            else if ($(this)[0].tagName.toLowerCase() == "select") {
                var name = $(this).attr("name");
                var value = $.trim($(this).val());
                retVal[name] = value;
            }
        });
        return retVal;
    };
})(jQuery);


var comme={
	//type:post,get
	jsonAjax:function(url,prams,type){
		
	 }
	
};