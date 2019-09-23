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
/* 高度重调 */
.main {
	height: 400px;
}

.bottom {
	height: calc(100% -   1510px);
}

.main .center {
	height: 205px;
	border: 1px solid white;
}

.main .centerTop h3 {
	margin-left: 15px;
}

/* 每块的样式 */
.main .centerBottom .content .block {
	margin-top: 45px;
}

/* 每块的标题 */
.main .centerBottom .content .title h4 {
	font-size: 16px;
	color: #0068b5;
	font-weight: normal;
	margin-left: 20px;
}

.main .centerBottom .content .title .line {
	height: 1px;
	width: 100%;
	margin-top: 5px;
	background-color: #eee;
}

/* 每块的内容 */
.main .center .content .cont>div {
	margin-bottom: 15px;
}

.main .center .content .cont>div:nth-of-type(1) {
	margin-top: 35px;
}

.main .center .content .cont>div:nth-last-of-type(1) {
	margin-bottom: 0;
}

.main .center .content .cont>div input {
	width: 300px;
}

/* 文本域 */
.main .center .content .cont>div textarea {
	width: 300px;
	height: 90px;
}

.main .center .content .cont .suggestion,.main .center .content .cont .address
	{
	height: 90px;
}

/* 图片 */
.main .center .content .license {
	height: 110px;
}

.main .center .content .license .uploading {
	display: inline-block;
	width: 200px;
	height: 110px;
	background-color: #f2f2f2;
	background-size: 100% 100%;
	cursor: pointer;
}

/* 城市 */
.main .center .content .cont .city {
	height: 30px;
}

.main .center .content .cont .city input {
	width: 140px;
	float: left;
}

.main .center .content .city input:nth-of-type(2) {
	margin-left: 20px;
}

/* 按钮样式 */
.main .center .centerBottom .content .operate {
	margin-left: calc(( 100% -   150px)/2 );
}

.main .center .centerBottom .content .operate input[type='button'] {
	width: 140px;
	float: left;
	height: 36px;
	background-color: #75c4ff;
	color: #fff;
	font-size: 14px;
	border: none;
}

.main .center .centerBottom .content .operate input[type='button']:active
	{
	background-color: #42a7f2;
}

.main .center .centerBottom .content .operate .fail {
	margin-left: 20px;
}

/* 查看原图 */
.master_map {
	position: fixed;
	background-color: #fff;
	cursor: move;
	z-index: 101;
}

.shadow_div {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: #000;
	opacity: 0.35;
	z-index: 100;
}

.tip {
	font-size: 12px;
	color: red;
	display: none;
}


.to_login:active{
            background-color: #42a7f2;
}

</style>
</head>
<body>
	<div class="top"></div>
	<div class="main">
        <input id="iframeId" type="hidden">
		<div class="center">
			<div class="centerBottom">
				<div class="container">
					<div class="content">
						<div class="block">
							<div class="title">
								<div class="line"></div>
							</div>
							<div class="cont">
								<div class="tel">
									<div class="name">
										<span>*</span><dict:lang value="原管理员手机" />
									</div>
									<input type="text" class="readonly" id="old_tel"
										readonly="readonly" value="15588865941">
								</div>
								<div class="tel">
									<div class="name">
										<span>*</span><dict:lang value="新管理员手机" />
									</div>
									<input type="text" id="new_tel" placeholder="请输入手机号">
									<span class="tip" id="new_tel_tip">手机号已注册</span>
								</div>
								<div class="IDNumber">
									<div class="name">
										<span>*</span><dict:lang value="短信验证码" />
									</div>
									<div>
										<input type="text" id="message_code" style="width:160px"
											placeholder="请输入短信验证码" maxlength="4"> <input type="button"
											class="get_message_code" id="message_code_btn"
											value="获取短信验证码" onclick="getMessageCode()"
											disabled="disabled"
											style="width:135px;background-color: #ccc;color: #fff;font-size: 14px;border: none;	">
										<span class="tip" id="message_code_tip"></span>
									</div>
								</div>
								<div class="email">
									<div class="name">
										<span>*</span><dict:lang value="注册邮箱" />
									</div>
									<input type="text" id="email" class="readonly" readonly="readonly" > <span
										class="tip" id="email_tip">邮箱非法</span>
								</div>

								<div class="cont">
									<p class="operate">
										<input type="button" class="pass" value="提交"
											onclick="emailAjaxVal()">
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		var _oldTel = "${dataMap['oldTel']}";
		var _email = "${dataMap['email']}";
         
   function tologin(){
      window.top.location.href = "${path}mlabel/MlAction_forMlLogin.ms";
   } 
        
		//页面加载完成后执行的事件
		$(function() {
			$("#old_tel").val(_oldTel);
			$("#email").val(_email);
		});

		$('.license .uploading').click(
				function() {
					$("<div class='shadow_div'>").appendTo('body');

					$("<img class ='master_map' src='" + url + "'>").appendTo(
							'body');
					$('.master_map').css(
							'left',
							'calc((100% - ' + $('.master_map').width()
									+ 'px)/2)');
					$('.master_map').css(
							'top',
							'calc((100% - ' + $('.master_map').height()
									+ 'px)/2)');

					$("<div class='close_img'>").appendTo('body');
				});

		var timer = 0; //清楚超时调用
		function newTelVal() {
			var newTel = $("#new_tel").val();
			var reg = /^1[3|4|5|7|8][0-9]{9}$/;

			if (!reg.test(newTel)) {
				if (newTel == "") {
					showMessage("#new_tel_tip",
							"<dict:lang value="手机号不可为空" />", "#new_tel");
				} else {
					showMessage("#new_tel_tip",
							"<dict:lang value="手机号格式有误" />", "#new_tel");
				}
				return false;
			} else if (_oldTel == newTel) {
				showMessage("#new_tel_tip",
						"<dict:lang value="新手机号与原手机号一致，请修改" />", "#new_tel");
				return false;
			} else {
				return true;
			}
		}

		function emailVal() {
			var email = $("#email").val();
			var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
			if(!reg.test(email)) {
				if(email == "") {
					showMessage("#email",
						"<dict:lang value="尚未填写邮箱，请您去[ 资料完善 ]中填写邮箱信息" />", "#email");
				}else {
					showMessage("#email",
						"<dict:lang value="非法邮箱地址" />", "#email");
				}
				return false;
			}else {
			    return true;
			}
		}

		function showMessage(doc, msg, focDoc) {
		        $(".tip").css("display", "none");
			clearTimeout(timer);
			timer = setTimeout(function() {
				$(".tip").css("display", "none");
			}, 5000);
			$(doc).css("display", "inline");
			$(doc).text(msg);
			$(focDoc).focus();
		}

		$("#new_tel").bind("input propertychange", function() {
			if ($("#new_tel").val().length != 0) {
				enableBtn();
			} else {
				disableBtn();
			}
		});

		function disableBtn() {
			$("#message_code_btn").attr("disabled", "disabled");
			$("#message_code_btn").css("background-color", "#ccc");

		}


		function enableBtn() {
			_time = 60;
			$("#message_code_btn").val("获取短信验证码");
			$("#message_code_btn").removeAttr("disabled");
			$("#message_code_btn").css("background-color", "#75c4ff");
		}
		$(function() {
			//获取当前iframe名称

			var ptfs = window.parent.frames;
			for ( var i = 0; i < ptfs.length; i++) {
				if (ptfs[i] == window) {
					$("#iframeId").val(window.name);
				}
			}
		});

	</script>
	<bu:submit viewId="f1de680545784f10ae0fbf4d042e16e6" />
	<bu:script viewId="f1de680545784f10ae0fbf4d042e16e6" />
</body>
</html>