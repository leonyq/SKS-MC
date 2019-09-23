<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>

<title><dict:lang value="个人信息修改" /></title>
<style>
.main {
	width: 100%;
	margin-top: 30px;
}

.main tr td:nth-of-type(1) {
	vertical-align: top;
}

.main tr td:nth-of-type(2) {
	padding-left: 10px;
}

.main tr td input {
	margin-bottom: 15px;
}

.main tr td button {
	background-color: #aace36;
	font-size: 14px;
	width: 70px;
	height: 28px;
	border: none;
	color: #fff;
	margin-right: 15px;
	cursor: pointer;
}

.main tr td button:hover{
	background-color: #99b932;
}
.timeClass .active-result{
					overflow: hidden;
		    		text-overflow: ellipsis;
		   			 white-space: nowrap;
}
	

</style>
<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
	<jsp:param name="chosen" value="1" />
</jsp:include>
	
<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
</head>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
<body style="background-color: #fff;">
	<div class="edit">

		<div class="bd" style="border:none;">
			<form id="up_form" name="up_form"
				action="${path}sys/UserAction_upMyUser.ms" method="post"
				target="submit_frame" enctype="multipart/form-data">
				<div>
					<table class="main">
						<tr>
							<td style="text-align: right;width:40%"></td>
							<td style="width: 200px;">
								<div id="photoImg">
									<img id="userPhoto" title="<dict:lang value="支持图像大小在%sk以内" param1="${fn:escapeXml(photoSizeInt)}"/>" />
									<img id="preview" style="display: none;"
										title="<dict:lang value="支持图像大小在%sk以内" param1="${fn:escapeXml(photoSizeInt)}"/>"/> <input
										type="file" id="photo" name="upFile"
										onchange="javascript:setImagePreview();" /> <span class="Eng"><span
										id="userDto_photo_err"></span> </span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><span class="dot">*</span><dict:lang value="用户名称" /></td>
							<td><s:textfield id="userDto_name" name="userDto.name"
									cssClass="user-defind-input input" maxlength="15"
									cssStyle="width: 200px;"></s:textfield> <span class="Eng"><span
									id="userDto_name_err"><c:out value='${errors["userDto.name"][0]}' /></span> </span>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><dict:lang value="英文名称" /></td>
							<td><s:textfield id="userDto_englishName"
									cssClass="user-defind-input input" name="userDto.englishName"
									maxlength="30" cssStyle="width: 200px;"></s:textfield> <span
								class="Eng"><span id="userDto_englishName_err"><c:out value='${errors["userDto.englishName"][0]}' /></span>
							</span>
							</td>
						</tr>
						<tr>
				       		<td style="text-align: right;"><span class="dot">*</span><dict:lang value="所在时区" /></td>
							<td class="dec timeClass" style="padding-bottom: 15px">
							<select id ="usTimeZone" name="userDto.usTimeZone" style="cursor: pointer;width:200px;" class="dept_select IS_SELECT_FILTER ">
							<s:iterator value="@com.more.fw.core.dict.ui.DictInit@getCachedDict('TIME_ZONE')" id="ls" >
								<option value="<s:property value="code" />" title="<s:property value="%{getText(value)}"/>">GMT <s:property value="code" />(<s:property value="%{getText(value)}" />)</option>
							</s:iterator>
							</select>	
								<span class="Eng"><span id="userDto_usTimeZone_err"><c:out value='${errors["userDto.usTimeZone"][0]}' /></span></span>
							</td>
		       			</tr>
						<tr>
							<td style="text-align: right;"><dict:lang value="座机电话" /></td>
							<td class="dec" style="margin-bottom: 15px;"><s:textfield id="userDto_phone"
									cssClass="user-defind-input input" name="userDto.phone"
									maxlength="17" cssStyle="width: 200px;"></s:textfield> <span
								class="Eng"><span id="userDto_phone_err"><c:out value='${errors["userDto.phone"][0]}' /></span>
							</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><dict:lang value="移动电话" /></td>
							<td class="dec"><s:textfield id="userDto_mobile"
									cssClass="user-defind-input input" name="userDto.mobile"
									maxlength="11" cssStyle="width: 200px;"></s:textfield> <span
								class="Eng"><span id="userDto_mobile_err"><c:out value='${errors["userDto.mobile"][0]}' /></span>
							</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><dict:lang value="微信账号" /></td>
							<td class="dec"><s:textfield id="userDto_weixin"
									cssClass="user-defind-input input" name="userDto.weixin"
									maxlength="30" cssStyle="width: 200px;"></s:textfield> <span
								class="Eng"><span id="userDto_weixin_err"><c:out value='${errors["userDto.weixin"][0]}' /></span>
							</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><dict:lang value="电子邮箱" /></td>
							<td class="dec"><s:textfield id="userDto_email"
									cssClass="user-defind-input input" name="userDto.email"
									maxlength="50" cssStyle="width: 200px;"></s:textfield> <span
								class="Eng"><span id="userDto_email_err"><c:out value='${errors["userDto.email"][0]}' /></span>
							</span>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<button type="button" onclick="edit(this);">
									<i class="ico ico-save"></i>
									<dict:lang value="保存" />
								</button>
								<button type="button" onclick="resetForm();">
									<i class="ico ico-gk"></i>
									<dict:lang value="重置" />
								</button>
							</td>
						</tr>
					</table>
				</div>
	<s:hidden id="userPhotoPath" value="${path}" />
	<s:hidden id="usTz" name="paraMap.usTimeZone" />
	<s:hidden id="userDto_photoName" name="userDto.photoName" />
	<input type="hidden" id="iframeId" name="paraMap.iframeId"/>
			</form>
		</div>
	</div>
	<div style="display: none;">
		<iframe id="submit_frame" name="submit_frame" src="" width="0"
			height="0"></iframe>
	</div>
	
	<script type="text/javascript">
	 $(function(){
	    	//获取当前iframe名称
		 	$("#iframeId").val("submit_frame");
		 	var usTz=$("#usTz").val();
		  	$("#usTimeZone").val(usTz);
		  	$("#usTimeZone").trigger('chosen:updated');
		  	$('.timeClass .chosen-single span').mouseover(function(){
		  		$(this).attr('title',$(this).text())
		  	})
	    });
		window.onload = function() {
			document.getElementById("userPhoto").src = $("#userPhotoPath")
					.val()
					+ "plf/userPhoto/" + $("#userDto_photoName").val();
			if ($("#userDto_photoName").val() == "") {
				document.getElementById("userPhoto").src = $("#userPhotoPath")
						.val()
						+ "plf/images/user.png";
			}
			
		};

		function setImagePreview() {
			var hhotoObj = document.getElementById("photo");
			var imgObjPreview = document.getElementById("preview");
			document.getElementById("userPhoto").style.display = "none";
			if (hhotoObj.files && hhotoObj.files[0]) {
				//火狐下，直接設img属性
				imgObjPreview.style.display = 'block';
				imgObjPreview.src = window.URL
						.createObjectURL(hhotoObj.files[0]);
			} else {
				//IE下，使用滤镜
				//$("#photo").parent().show();
				hhotoObj.select();
				var imgSrc = document.selection.createRange().text;
				document.selection.empty();
				//$("#photo").parent().hide();
				var imgId = document.getElementById("photoImg");
				try {
					imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					imgId.filters
							.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				} catch (e) {
					utilsFp.confirmIcon(3, "", "", "",
							"<dict:lang value="您上传的图片格式不正确" />", 0, "300", "");
					return false;
				}
				imgObjPreview.style.display = 'none';
				//document.selection.empty();
			}
			return true;
		}
		//重置	
		function resetForm() {
			$("#up_form")[0].reset();
		}
		var editButObj;
		function edit(thisObj) {
			editButObj = thisObj;
			if (!valData()) {
				return;
			}
			
			//$("#photo").parent().show();
			var len = document.getElementById("photo").value.length;
			if (len != 0) {
				if ($.trim(document.getElementById("photo").value.substring(
						len - 3, len)) == "jpg"
						|| $.trim(document.getElementById("photo").value
								.substring(len - 3, len)) == "png"
						|| $.trim(document.getElementById("photo").value
								.substring(len - 3, len)) == "bmp"
						|| $.trim(document.getElementById("photo").value
								.substring(len - 3, len)) == "gif") {
					//$("#photo").parent().hide();
						document.forms.up_form.submit();
					
					
				} else {
					//$("#photo").parent().hide();
					document.getElementById("userDto_photo_err").innerHTML = "<dict:lang value='图片格式不支持，请重新选择！(.jpg,.png,.bmp,.gif)' />";
				}
			} else {
				document.forms.up_form.submit();
				//$("#photo").parent().hide();
				thisObj.onclick = function() {
					utilsFp.alert("<dict:lang value='数据正在提交，请稍候...' />");
				};
			}
		}
		function valData() {
			var userDtoName = document.getElementById("userDto_name");
			if (val.isBlank(userDtoName)) {
				_alertValMsg(userDtoName, "<dict:lang value="员工名称不能为空" />");
				userDtoName.focus();
				return false;
			}
			var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			var reg = /^[1][3578]\d{9}$/;
			var m = /^((0\d{2,3}-))(\d{7,8})(-(\d{3,}))?$/;
			var userPhone = document.getElementById("userDto_phone");
			var phone = $("#userDto_phone").val();
			if (!val.isBlank(userPhone) && phone.length > 13) {
				_alertValMsg(userPhone, "<dict:lang value="电话长度不能大于13位" />");
				userPhone.focus();
				return false;
			} else if (!val.isBlank(userPhone) && phone.length < 8) {
				_alertValMsg(userPhone, "<dict:lang value="电话长度不能小于8位" />");
				userPhone.focus();
				return false;
			} else if (!val.isBlank(userPhone) && !m.test(phone)) {
				_alertValMsg(userPhone,
						"<dict:lang value='请输入正确格式的电话号码，如：0591-83838383(-123)'/>");
				userPhone.focus();
				return false;
			}
			var userMobile = document.getElementById("userDto_mobile");
			var mobel = $("#userDto_mobile").val();
			if (!val.isBlank(userMobile) && mobel.length != 11
					&& (!reg.test(mobel))) {
				_alertValMsg(userMobile,
						"<dict:lang value="请输入正确11位有效的电话号码" />");
				userMobile.focus();
				return false;
			} else {
				document.getElementById("userDto_mobile_err").innerHTML = "";
			}
			var userEmail = document.getElementById("userDto_email");
			if (!val.isBlank(userEmail) && !myreg.test($("#userDto_email").val())) {
				_alertValMsg(userEmail,
						"<dict:lang value="请输入正确的邮箱格式，如1234@163.com" />");
				userEmail.focus();
				return false;
			}

			return true;
		}
		function reloadPg(msg){
			editButObj.onclick = function(){edit(editButObj);}
			if(undefined != msg && "" != msg){
				//util.alert(msg,reloadPgCf);
				utilsFp.confirmIcon(2,"","","", msg,0,"250","");
			}else{
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="修改出错" />",0,"250","");
			}
	    }
	</script>
<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>