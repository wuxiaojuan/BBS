(function ($) {
    $.fn.getjsonvalues = function () {
        var retVal = new Array();
        $(this).find(":input").each(function () {
            if ($(this).attr("type") == "text" || $(this).attr("type") == "hidden" || $(this).attr("type") == "file")
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
        console.log(retVal);
        return retVal;
    };
})(jQuery);