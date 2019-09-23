<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="公用页面" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>
<body>
	<div class="all">
		<div>
			<form id="addForm" name="addForm" action="${path}sys/MClzMgrAction_addCommPage.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.MID" />
				<table class="add_table">
					<tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="页面名称" /><span class="Eng">*</span>
						</td>
						<td width="30%" colspan="3">
							<s:textfield name="paraMap.PAGE_NAME" id="paraMap_PAGE_NAME" maxlength="15" />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="页面类型" /><span class="Eng">*</span>
						</td>
						<td width="30%" colspan="3">
							<dict:selectDict dictCode="COMM_PAGE_TYPE" dictValue="%{COMM_PAGE_TYPE}" name="paraMap.COMM_PAGE_TYPE" custom_option="<option value=''>%{getText('--请选择--')}</option>" />
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
		document.forms.addForm.submit();
		isSubmit = true;
	}
        
	function valData(){
		var paraMap_PAGE_NAME = document.getElementById("paraMap_PAGE_NAME");
   	if(val.isBlank(paraMap_PAGE_NAME)){
   		_alertValMsg(paraMap_PAGE_NAME,"<dict:lang value="页面名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>