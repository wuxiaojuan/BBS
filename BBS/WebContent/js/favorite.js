function searchFavorite() {
    if ($('#txt_wz_search').val() == '') {
        alert('请输入搜索关键字！');
    }
    else {
        $("#wz_search").val("提交中...");
        var keystr = encodeURIComponent($('#txt_wz_search').val());
        window.location = "/my/search/?q=" + keystr;
    }
}

function searchFavoriteEnter(event) {
    if (event.keyCode == 13) {
        searchFavorite();
        return false;
    }
}

function getMyTags() {
    var dataHolder = $("#mytags_list");
    dataHolder.html('加载中...');
    $.ajax({
        url: '/ajax/wz/GetMyTags',
        type: 'get',
        dataType: 'text',
        contentType: 'application/json; charset=utf8',
        success: function (data) {
            dataHolder.html(data);
        },
        error: function (xhr) {
            dataHolder.html('加载失败');
        }
    });
}

function copyUserLink(linkID) {
    window.open('/copy/' + linkID + "/", '', 'scrollbars=auto,width=460,height=353,left=100,top=50,status=yes,resizable=yes');
}
function titleOnly() {
    if ($(".link_content").css("display") == "none") {
        $(".link_content").show();
        $("#btnTitleOnly").text("只看标题");
        $(".img_on").attr("title", "折叠");
        $(".img_on").attr("src", "/images/wz/icon_up.gif");

    }
    else {
        $(".link_content").hide();
        $("#btnTitleOnly").text("展开浏览");
        $(".img_on").attr("title", "展开");
        $(".img_on").attr("src", "/images/wz/icon_down.gif");
    }
}
function headerclick(linkId, index) {
    $("#link_" + linkId + " .link_content").toggle();

    if ($("#link_" + linkId + " .link_content").css("display") == "none") {
        $("#link_" + linkId + " .img_on").attr("title", "展开");
        $("#link_" + linkId + " .img_on").attr("src", "/images/icon_down.gif");
    }
    else {
        $("#link_" + linkId + " .img_on").attr("title", "折叠");
        $("#link_" + linkId + " .img_on").attr("src", "/images/icon_up.gif");
    }
}
function editLink(linkID) {
    window.open('/modify/' + linkID + "/", '', 'scrollbars=auto,width=460,height=353,left=100,top=50,status=yes,resizable=yes');
}
function delLink(linkID) {
    var con = confirm("你确定删除该收藏吗？");
    if (con) {
        $("#wzdel_" + linkID).css("color", "#FF0000").text("删除中...");
        $.ajax({
            url: '/ajax/wz/DeleteWzlink',
            data: '{linkId:' + linkID + '}',
            type: 'post',
            dataType: 'text',
            contentType: 'application/json; charset=utf-8',
            cache: false,
            success: function (data) {
                var result = data;
                if (result == "-2")
                    $("#wzdel_" + linkID).css("color", "#FF0000").text("您没有权限删除！");
                else if (result == "1")
                    $("#link_" + linkID).parent().parent().remove();
                else
                    $("#wzdel_" + linkID).css("color", "#FF0000").text("删除失败：" + data);
            },
            error: function (xhr) {
                $("#wzdel_" + linkID).css("color", "#FF0000").text(xhr.responseText);
            }
        });
    }
}

function editTag(index, sOldTagName, sNewTagName) {
    var item = $("#mywztag li:eq(" + index + ")");
    if (sOldTagName === sNewTagName || sNewTagName === "") {
        $(item).children("span").remove();
        $("a,em", $(item)).show();
        return true;
    }
    var data = {
        oldTagName: sOldTagName,
        newTagName: sNewTagName
    };

    $("a.W_btn_b", $(item)).off("click").html("<span>正在提交</span>").css({ "background": "#888", "cursor": "default" });
    //JSON.stringify
    $.ajax({
        url: "/ajax/wz/EditTag",
        data: JSON.stringify(data),
        type: 'post',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (data) {
            if (data.success) {
                $(item).children("span").remove();
                $("a span", $(item)).text(sNewTagName);
                $("a,em", $(item)).show();
            } else {
                $("a.W_btn_b", $(item)).on("click").html("<span>保存</span>").css({ "background": "#7BCA00", "cursor": "pointer" });
                alert("修改失败，异常信息：" + data.message);
            }
        },
        error: function (xhr) {
            $("a.W_btn_b", $(item)).on("click").html("<span>保存</span>").css({ "background": "#7BCA00", "cursor": "pointer" });
            alert("服务器出现异常，请稍后再试");
        }
    });
}

function deleteWzTag(index, sTagName) {
    if (sTagName === "") {
        return false;
    }
    var $item = $("#mywztag li:eq(" + index + ")"),
        data = { tagName: sTagName };
    $("span.icon_del_s", $($item)).off("click");
    $.ajax({
        url: "/ajax/wz/DeleteTag",
        data: JSON.stringify(data),
        type: 'post',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (data) {
            if (data.success) {
                $item.remove();
            } else {
                $("span.icon_del_s", $($item)).on("click");
                alert("删除失败，异常信息：" + data.message);
            }
        },
        error: function (xhr) {
            $("span.icon_del_s", $($item)).on("click");
            alert("服务器出现异常，请稍后再试");
        }
    });
}