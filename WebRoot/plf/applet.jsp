<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title><s:property value="%{getText('login.title')}" /></title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp" />
	<script type="text/javascript" src="${basePath}plf/js/login.js" ></script>
	<link rel=stylesheet type=text/css
		href="${path}plf/style/css2/login/css.css" />

	<style type=text/css>
		body {
			BACKGROUND-COLOR: #325192
		}
		
		td img,td input { vertical-align:middle;}
		
		.borderyRightGray {
			BORDER-RIGHT: #ccc 1px solid
		}
		
		.botton_img_reset {
			background: url(${path}plf/style/css2/login/admin_login_11.jpg) no-repeat;
			cursor: pointer;
			border: 0;
			width: 71px;
			height: 29px;
			color: #da4901;
			font-size: 12px;
			line-height: 24px;
		}
	</style>
</head>

<body onload=document.login_form.userDto_loginName.focus();>
<c:import url="/plf/common/selectLanguage.jsp"/>
	
	<div style="width: 100%; margin-left: 20px;">
		<applet name="myapplet" mayscript="mayscript"
			code="com.ms.mes.cs.aplet.MesApplet.class" archive="mes.jar"
			codebase="." width="510" height="310" align="bottom">
			<param name="text" value="java swing 测试">
			<font color="ff0000">请安装JRE插件</font><a href="${basePath}jre-6u43-windows-i586.exe" target="_blank">下载</a>
		</applet>
	</div>
	
	<table border=0 cellSpacing=0 cellPadding=0 width="100%" height="100%">
		<tbody>
			<tr>
				<td height=500 align=middle>
					<table border=0 cellSpacing=0 cellPadding=0 width=444>
						<tbody>
							<tr>
								<td>
									<img alt="" src="${path}plf/style/css2/login/admin_login_03.jpg"
										width=444 height=102>
								</td>
							</tr>
							<tr>
								<td background=${path}plf/style/css2/login/admin_login_05.jpg
									align=middle>
									<form id="login_form" name="login_form"
										action="${path}sys/LoginAction_login.ms" method="post"
										onsubmit="return submitEvn(this);">
										<s:token />
										<table border=0 cellSpacing=10 cellPadding=0 width="95%">
											<tbody>
												<tr>
													<td class=borderyRightGray width="65%">
														<table border=0 cellSpacing=0 cellPadding=3 width="95%">
															<tbody>
																<tr>
																	<td height=30 width="34%" align=right>
																		<s:property value="%{getText('login.loginName')}"/>：
																	</td>
																	<td width="66%" align=left>
																		<s:textfield id="userDto_loginName"
																			name="userDto.loginName" maxlength="30"
																			cssClass="borderGray" cssStyle="FONT-SIZE: 14px;LINE-HEIGHT:16px;" />
																		<span class="required_sign">${errors["userDto.loginName"][0]}</span>
																	</td>
																</tr>
																<tr>
																	<td height=30 align=right>
																		<s:property value="%{getText('login.loginPw')}"/>：
																	</td>
																	<td align=left>
																		<s:password id="userDto_pw" name="userDto.pw"
																			maxlength="32" cssClass="borderGray" cssStyle="FONT-SIZE: 14px;LINE-HEIGHT:16px;" />
																		<span class="required_sign">${errors["userDto.pw"][0]}</span>
																	</td>
																</tr>
																<tr>
																	<td height=30 align=right>
																		<s:property value="%{getText('login.validateCode')}"/>：
																	</td>
																	<td align=left valign="middle">
																		<input type="text" id="validate_code" name="userDto.validateCode" 
																			maxlength="5" class="borderGray" style="width:70px;FONT-SIZE: 14px;LINE-HEIGHT:16px;" 
																			title="<s:property  value="%{getText('login.codeAlert')}" escape="false" />"/>
																		&nbsp;<img src="${basePath}plf/common/imagevalid.jsp" onclick="getCkImg(this);" 
																				title="<s:property value="%{getText('login.codeTip')}" />" 
																				style="cursor:pointer;width:68;height:22px;" />
																		<span class="required_sign">${errors["userDto.pw"][0]}</span>
																	</td>
																</tr>
																<tr>
																	<td height=30 align=center colspan="2">
																		<span id="error_msg" class="required_sign"><s:property
																				value="checkUser.msg" /> </span>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
													<td width="35%" align="middle" >
														<table border=0 cellSpacing=5 cellPadding=5>
															<tbody>
																<tr>
																	<td>
																		<input
																			src="${path}plf/style/css2/login/admin_login_08.jpg"
																			type=image />
																	</td>
																</tr>
																<tr>
																	<td>
																		<img src="${path}plf/style/css2/login/admin_login_11.jpg"
																			onclick="document.login_form.reset();"
																			style="cursor: pointer;" />
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</form>
								</td>
							</tr>
							<tr>
								<td>
									<img alt="" src="${path}plf/style/css2/login/admin_login_13.jpg"
										width=444 height=12>
								</td>
							</tr>
							<tr>
								<td>
									<img alt="" src="${path}plf/style/css2/login/admin_login_14.jpg"
										width=444 height=105>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>

<script type="text/javascript">
       	var login_random_key = "${login_random_key}";
       	
       	function getCkImg(thisObj){
        	thisObj.src = "${basePath}plf/common/imagevalid.jsp?_radomTime="+new Date();
        }
        
       	function submitEvn(thisObj){
       		if("" == document.login_form.userDto_loginName.value){
    			document.getElementById("error_msg").innerHTML = "登录名称-不能为空";
       			document.login_form.userDto_loginName.focus();
       			return false;       			
       		}
       		if("" == document.login_form.userDto_pw.value){
    			document.getElementById("error_msg").innerHTML = "登录密码-不能为空";
       			document.login_form.userDto_pw.focus();
       			return false;       			
       		}
       		if("" == document.login_form.validate_code.value){
    			document.getElementById("error_msg").innerHTML = "验证码-不能为空";
       			document.login_form.validate_code.focus();
       			return false;       			
       		}
       		document.login_form.userDto_pw.value=encrypt(login_random_key,document.login_form.userDto_pw.value);
       		$("#submitBtn").attr("disabled","disabled");
       		return true;
       	}
       	
</script>

<%@ include file="/plf/common/pub_end.jsp"%>
