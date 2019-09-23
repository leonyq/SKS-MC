<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<% //String pathTmp = request.getContextPath() + "/";
    String basePathTmp = new StringBuilder()
            .append(request.getScheme()).append("://")
            .append(request.getServerName()).append(":")
            .append(request.getServerPort())
            .append(request.getContextPath()).append("/").toString();
    final String JS_PATH = basePathTmp + "plf/js";

    String alertMsg1 = CommMethodMc.getText("验证信息对象为空");

    //if (null != request.getParameter("popConfirm")) {
    StringBuilder outSb = new StringBuilder();
    outSb.append("		<script type=\"text/javascript\" >var _popmenu_js_msg=\""
    ).append(CommMethodMc.getText("确定要删除")
    ).append("<font class='hzt'>“"
    ).append(CommMethodMc.getText("所选择的数据")).append("”</font>\";</script>");
    outSb.append("<script type=\"text/javascript\" src=\""
    ).append(JS_PATH).append("/popmenu.js?_mc_res_version=").append(PlfStaticRes.POPMENU_JS).append("\"></script>");
		/*
		outSb.append("<div class=\"popmenu\" id=\"msgDiv1\">");
		//outSb.append("<iframe src=\"\" frameborder=\"0\" style=\"position:absolute;visibility:inherit;top:0px;left:0px;width:expression(this.parentNode.offsetWidth);height:expression(this.parentNode.offsetHeight);z-index:-1;filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';\"></iframe> ");
		outSb.append("	<div style=\"z-index: 99998;height:60px; line-height:60px; margin-top:50px; font-size:14px;\">");
		outSb.append("		<img src=\""
		).append( basePathTmp
		).append( "plf/style/css2/images/tb.gif\" /><span id='popmenu_msg'></span></div>");
		outSb.append("	<div>");
		outSb.append("	<input type=\"button\" value=\"&nbsp;"
		).append( CommMethodMc.getText("确定")
		).append( "&nbsp;\" class=\"botton_img_add\" id=\"msgShut1\">");
		outSb.append("	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" value=\"&nbsp;"
		).append( CommMethodMc.getText("取消")
		).append("&nbsp;\" class=\"botton_img_search\" id=\"msgShut2\">");
		outSb.append("	</div>");
		outSb.append("</div>");
		outSb.append("<div id=\"bgDiv1\"></div>");
		*/
    out.println(outSb.toString());
    //}
    if (null != request.getParameter("needValidate")) {
        out.println("<div id=\"_alertValMsgDiv\" style=\"color: #ff0000;background-color: #FEE0B2;left:127px; position: absolute; top:0px; z-index: 10; display: none;\" ></div>");%>
<script type="text/javascript">
    var _alertValMsgCount = 0;

    function _alertValMsg(obj, msg) {//显示验证信息
        if (null == obj) {
            util.alert("<%=CommMethodMc.escapeJs(alertMsg1)%>!");
            return false;
        }
        var isShow = $("#_alertValMsgDiv").css("display");
        var offset = $(obj).offset(); //  计算文本框的偏移量
        var location = _getScroll();//新加的代码，计算滚动条的位置
        $("#_alertValMsgDiv").css("left", "0px");
        $("#_alertValMsgDiv").css("top", "0px");
        if (_alertValMsgCount == 0) {
            $("#_alertValMsgDiv").offset({
                top: offset.top + location.top + $(obj).height() + 5,
                left: offset.left + location.left
            });
        } else {
            $("#_alertValMsgDiv").offset({
                top: offset.top + $(obj).height() + 5,
                left: offset.left
            });
        }
        //重新设置弹出框的偏移量，根据文本框的位置和滚动条的位置
        $("#_alertValMsgDiv").html(msg);
        $("#_alertValMsgDiv").show();//显示弹出框
        window.setTimeout("_closeValMsg()", 3000);
        <%-- 3秒后自动关闭提示框 --%>
        obj.focus();
        _alertValMsgCount++;
    }

    function _alertWarningMsg(obj, msg) {//显示验证信息
        if (null == obj) {
            util.alert("<%=CommMethodMc.escapeJs(alertMsg1)%>!");
            return false;
        }
        var isShow = $("#_alertValMsgDiv").css("display");
        var offset = $(obj).offset(); //  计算文本框的偏移量
        var location = _getScroll();//新加的代码，计算滚动条的位置
        $("#_alertValMsgDiv").css("left", "0px");
        $("#_alertValMsgDiv").css("top", "0px");
        if (_alertValMsgCount == 0) {
            $("#_alertValMsgDiv").offset({
                top: offset.top + location.top + $(obj).height() + 5,
                left: offset.left + location.left
            });
        } else {
            $("#_alertValMsgDiv").offset({
                top: offset.top + $(obj).height() + 5,
                left: offset.left
            });
        }
        //重新设置弹出框的偏移量，根据文本框的位置和滚动条的位置
        $("#_alertValMsgDiv").html(msg);
        $("#_alertValMsgDiv").show();//显示弹出框
        window.setTimeout("_closeValMsg()", 3000);
        <%-- 3秒后自动关闭提示框 --%>
        obj.focus();
        _alertValMsgCount++;
    }

    <%-- 关闭提示框,并发时需要优化 --%>

    function _closeValMsg() {
        _alertValMsgCount--;
        if (_alertValMsgCount < 1) {
            $("#_alertValMsgDiv").hide();
        }
    }

    function _getScroll() { //计算滚动条的位置
        var t, l;
        if (document.documentElement && document.documentElement.scrollTop) {
            t = document.documentElement.scrollTop;
            l = document.documentElement.scrollLeft;
        } else if (document.body) {
            t = document.body.scrollTop;
            l = document.body.scrollLeft;
        } else {
            t = 0;
            l = 0;
        }
        return {
            top: t,
            left: l
        };
    }
</script>
<% }%>
