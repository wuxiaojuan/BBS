(function ($) {
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
    $.fn.setjsonvalues = function (jsonValue) {
        for (var key in jsonValue) {
            var input = $(this).find("[name='" + key + "']");
            if (typeof (input) != "undefined") {
                $(input).val(jsonValue[key]);
            }
        }
    };
})(jQuery);


