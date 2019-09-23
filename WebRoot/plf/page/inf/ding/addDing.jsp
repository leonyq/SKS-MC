<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="钉钉平台企业" /> <dict:lang value="钉钉平台企业新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>
<body>
	<div class="all">
		<div>
			<form id="add_form" name="addForm" action="${path}ding/dingAction_addDing.ms" method="post" target="submitFrame">
				<table class="add_table">
					<tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="企业编码" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:textfield name="paraMap.CORP_ID" id="CORP_ID" maxlength="64" />
						</td>
						
						<td width="20%" class="tr1">
							<dict:lang value="企业秘钥" /><span class="Eng">*</span>
						</td>
						<td width="30%" colspan="3">
							<s:textfield name="paraMap.CORP_SECRET" id="CORP_SECRET" maxlength="128" />
						</td>
						
					</tr>
					
				</table>
			</form>
		</div>
		<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		document.forms.add_form.submit();
		isSubmit = true;
	}
        
	function valData(){
		var CORP_ID = document.getElementById("CORP_ID");
	   	if(val.isBlank(CORP_ID)){
	   		_alertValMsg(CORP_ID,"<dict:lang value="企业编码" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
	   	
	   	var CORP_SECRET = document.getElementById("CORP_SECRET");
	   	if(val.isBlank(CORP_SECRET)){
	   		_alertValMsg(CORP_SECRET,"<dict:lang value="企业秘钥" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}

	   	if(CORP_ID.value.length>64){
	   		_alertValMsg(CORP_ID,"<dict:lang value="企业编码" /> -- <dict:lang value="长度不能超过64位" />");
	   		return false;
	   	}
	   	
	   	if(CORP_SECRET.value.length>128){
	   		_alertValMsg(CORP_SECRET,"<dict:lang value="企业秘钥" /> -- <dict:lang value="长度不能超过128位" />");
	   		return false;
	   	}

		return true;
	}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>