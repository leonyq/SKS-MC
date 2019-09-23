<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%
  request.setAttribute("_login_rd_time", System.currentTimeMillis());
%>
<head>
<title><dict:lang value="管理员变更" />--<dict:lang value="摩尔标签云系统" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<%--     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    --%>
<meta http-equiv="keywords"
	content="<dict:lang value="摩尔" />,<dict:lang value="标签" />,keyword3">
<meta http-equiv="description" content="<dict:lang value="摩尔标签云系统" />">
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="placeholder" value="1" />
	<jsp:param name="subStyle" value="0" />
	<jsp:param name="style" value="0" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
<link rel="stylesheet" href="${path}plf/page/mlabel/css/main.css">
<link rel="stylesheet" href="${path}plf/page/mlabel/css/frame.css">
<style>
.main .center .centerBottom .step .pic .pic1 {
	background-image: url(${path}plf/page/mlabel/img/pic1-h.png);
}

.main .center .centerBottom .step .pic .pic2 {
	background-image: url(${path}plf/page/mlabel/img/pic2-h.png);
}

.main .center .centerBottom .step .pic .pic3 {
	background-image: url(${path}plf/page/mlabel/img/pic3-h.png);
}

.main .center .centerBottom .step .char .char1 {
	color: #75c4ff;
}

.main .center .centerBottom .step .char .char2 {
	color: #75c4ff;
}

.main .center .centerBottom .step .char .char3 {
	color: #75c4ff;
}

.main .center .centerBottom .content {
	width: 100%;
}

.main .center .centerBottom .content .msg {
	margin-top: 15px;
	margin-bottom: 60px;
	text-align: center;
}

.main .center .centerBottom .content .msg p {
	margin-left: 20px;
	display: inline-block;
}

.main .center .centerBottom .content .msg p span {
	font-size: 18px;
	color: #75c4ff;
}

.main .center .centerBottom .content .tologin {
	background-color: #75c4ff;
	width: 138px;
	height: 36px;
	color: #fff;
	margin: 0 auto;
	margin-left: calc(( 100% -   138px)/2 );
	border: none;
}

.main .center .centerBottom .content .to_login:active {
	background-color: #42a7f2;
}
</style>
</head>
<body>
	<div class="top"></div>
	<div class="main">
		<script src="${path}plf/page/mlabel/js/head.js"></script>
		<div class="center">
			<div class="centerTop">
				<div class="container">
					<h3>
						<dict:lang value="管理员变更" />
					</h3>
				</div>
			</div>
			<div class="centerBottom">
				<div class="container">
					<div class="step"></div>
					<div class="content">
						<div class="msg">
							<img src="${path }plf/page/mlabel/img/ico-succeed.png" alt=""
								width="60" height="60">
							<p>
								<dict:lang value="恭喜" />
								,<span><dict:lang value="用户名" />:${userName }</span>
								<dict:lang value="管理员手机变更成功" />
								！
							</p>
						</div>
						<input type="button" class="to_login"
							value="<dict:lang value="重新登录" />">
					</div>
				</div>
			</div>
		</div>
		<script src="${path }plf/page/mlabel/js/foot.js"></script>
	</div>
	<div class="bottom"></div>
	<script src="${path }plf/page/mlabel/js/formEvents.js"></script>
	<script>
		//直接登录
		$('.to_login').click(function() {
			window.location.href = "${path}mlabel/MlAction_forMlLogin.ms";
		});
	</script>


</body>
</html>