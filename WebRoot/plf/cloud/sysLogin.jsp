<%@page import="com.more.fw.core.common.method.XssFilterUtil"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%
  request.setAttribute("_login_rd_time", System.currentTimeMillis());
			response.setDateHeader("Expires", 0);
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-store");
			String loadMark = StringUtilsMc.toString(request
					.getAttribute("loadMark"));
%>
<head>
<title><dict:lang value="单点登录后台" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="placeholder" value="1" />
	<jsp:param name="subStyle" value="0" />
</jsp:include>
<script
	src="${path}plf/page/fp/js/jquery-ui.js?_mc_res_version=<%=PlfStaticRes.JQUERY_UI_JS %>"></script>
<script
	src="${path}plf/page/fp/js/select-widget-min.js?_mc_res_version=<%=PlfStaticRes.SELECT_WIDGET_MIN_JS %>"></script>
<link rel="stylesheet"
	href="${path}plf/page/fp/css/style.css?_mc_res_version=<%=PlfStaticRes.STYLE_CSS %>"
	type="text/css" />
<script type="text/javascript"
	src="${basePath}plf/js/login.js?_mc_res_version=<%=PlfStaticRes.LOGIN_JS %>"></script>
<link rel=stylesheet type=text/css
	href="${path}plf/style/css2/login/css.css?_mc_res_version=<%=PlfStaticRes.LOGIN_CSS_CSS %>" />
<link rel="stylesheet"
	href="${path}plf/page/fp/css/fp-confirm.css?_mc_res_version=<%=PlfStaticRes.FP_CONFIRM_CSS %>">
<style>
/* 火狐 placeholder属性 */
:-moz-placeholder {
	color: #ccc !important;
}

::-moz-placeholder {
	color: #ccc !important;
}

/* ie placeholder属性 */
:-ms-input-placeholder {
	color: #ccc !important;
}
/* 谷歌 placeholder属性 */
::-webkit-input-placeholder {
	color: #ccc !important;
}

/* 去掉ie下input后面的X 眼睛 */
::-ms-clear,::-ms-reveal {
	display: none;
}

* {
	margin: 0;
	padding: 0;
}

html,body {
	height: 100%;
	font-size: 14px;
}

body {
	overflow: auto;
}

input {
	background-color: transparent;
}

.bg_image {
	width: 100%;
	height: 100%;
	float: left;
	position: relative;
	min-width: 400px;
	min-height: 500px;
}

.bg_image>p {
	position: absolute;
	color: #999;
	font-size: 12px;
	text-align: center;
	bottom: 10%;
	width: 100%;
}

.login {
	height: 70%;
	position: relative;
	top: 15%;
}

.login .content {
	width: 280px;
	margin: 0 auto;
	margin-top: 50px;
}

.login>h3 {
	text-align: center;
}

.login>h3>img {
	vertical-align: middle;
	margin-right: 20px;
	margin-top: -10px;
}

.login>h3>span {
	font-size: 40px;
	color: #333;
	font-weight: bold;
}

.username,.password,.language {
	border-bottom: 1px solid #ccc;
	height: 46px;
	box-sizing: border-box;
	background-color: #fff;
}

.username {
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
}

.language {
	border-bottom: 0;
	border-bottom-left-radius: 4px;
	border-bottom-right-radius: 4px;
}

.username>*,.password>* {
	float: left;
}

.username img,.password img {
	margin-left: 15px;
	margin-right: 15px;
	margin-top: 13px;
	vertical-align: middle;
}

.username input,.password input {
	width: calc(100% -                       51px);
	height: 100%;
	line-height: 46px;
	color: #333;
	border: none;
	outline: none;
	box-sizing: border-box;
}

.button {
	height: 40px;
	width: 100%;
	margin-top: 20px;
	border: none;
	outline: none;
	color: #fff;
	font-size: 16px;
	border-radius: 20px;
	cursor: pointer;
	background-color: #aace36;
}

.button:hover {
	background-color: #99b932;
}

.select-main {
	position: relative;
}

.select-set {
	height: 46px;
	line-height: 46px;
	text-align: left;
	margin-left: 17px;
}

.select-block {
	position: relative;
	margin-top: -2px;
	border: 1px solid #cdcdcd;
	width: 280px;
	margin-left: -1px;
	box-sizing: border-box;
}

li.select-items:hover {
	background-color: #aace36;
	color: #fff;
	width: 280px;
	margin-left: -1px;
}

.select-arrow {
	width: 10px;
	height: 5px;
	background-image:
		url(${path}plf/page/fp/img/login/ico-more.png?_mc_res_version=<%=PlfStaticRes.ICO_MORE_PNG%>);
	position: absolute;
	right: 10px;
	top: 20px;
}

.select-arrow.reverse {
	background-image:
		url(${path}plf/page/fp/img/login/ico-more-h.png?_mc_res_version=<%=PlfStaticRes.ICO_MORE_H_PNG%>);
}

input:-webkit-autofill,textarea:-webkit-autofill,select:-webkit-autofill
	{
	-webkit-box-shadow: 0 0 0 26px #fff inset;
}

canvas {
	display: block;
}

#particles-js {
	width: 100%;
	height: 100%;
	background-color: #f6f5f7;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
}

._frame {
	border: 1px solid #ccc;
	margin-top: 60px;
	border-radius: 4px;
}
</style>




</head>


<script
	src="${path}plf/page/fp/js/login/particles.min.js?_mc_res_version=<%=PlfStaticRes.PARTICLES_MIN_JS %>"></script>
<script
	src="${path}plf/page/fp/js/login/app.js?_mc_res_version=<%=PlfStaticRes.LOGIN_APP_JS %>"></script>
<script type="text/javascript">
	window.location.href = "${path}sys/LoginAction_mainFrame.ms";
</script>
<script type="text/javascript"
	src="${path}plf/page/js_files/comm/chk.session.id.state.utils.prev.js">
	
</script>
<%@ include file="/plf/common/pub_end.jsp"%>