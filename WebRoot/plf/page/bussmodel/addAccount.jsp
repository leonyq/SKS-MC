<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="账套" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>
<body>
	<div class="all">
		<div>
			<form id="add_form" name="addForm" action="${path}sys/BussModelAction_addAccount.ms" method="post" target="submitFrame">
				<table class="add_table">
					<tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="账套号" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:textfield name="paraMap.ACC_NO" id="paraMap_ACC_NO" maxlength="15" />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="账套名称" /><span class="Eng">*</span>
						</td>
						<td width="30%" colspan="3">
							<s:textfield name="paraMap.ACC_NAME" id="paraMap_ACC_NAME" maxlength="15" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="数据库名" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:textfield name="paraMap.dbuser" id="paraMap_dbuser" maxlength="60" />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="数据库密码" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:password name="paraMap.dbpw" id="paraMap_dbpw" maxlength="60" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="显示顺序" /><span class="Eng">*</span>
						</td>
						<td width="30%" colspan=3">
							<s:textfield name="paraMap.SHOW_ORDER" id="paraMap_SHOW_ORDER" maxlength="3" />
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="连接串" /><span class="Eng">*</span>
						</td>
						<td width="30%" colspan=3">
							<s:textfield name="paraMap.jdbcUrl" id="paraMap_jdbcUrl" maxlength="300" cssStyle="width:92%;" />
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
		var paraMap_ACC_NO = document.getElementById("paraMap_ACC_NO");
   	if(val.isBlank(paraMap_ACC_NO)){
   		_alertValMsg(paraMap_ACC_NO,"<dict:lang value="账套号" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
		var paraMap_ACC_NAME = document.getElementById("paraMap_ACC_NAME");
   	if(val.isBlank(paraMap_ACC_NAME)){
   		_alertValMsg(paraMap_ACC_NAME,"<dict:lang value="账套名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
		var paraMap_dbuser = document.getElementById("paraMap_dbuser");
   	if(val.isBlank(paraMap_dbuser)){
   		_alertValMsg(paraMap_dbuser,"<dict:lang value="数据库名" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
		var paraMap_dbpw = document.getElementById("paraMap_dbpw");
   	if(val.isBlank(paraMap_dbpw)){
   		_alertValMsg(paraMap_dbpw,"<dict:lang value="数据库密码" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
		var paraMap_SHOW_ORDER = document.getElementById("paraMap_SHOW_ORDER");
   	if(val.isBlank(paraMap_SHOW_ORDER)){
   		_alertValMsg(paraMap_SHOW_ORDER,"<dict:lang value="显示顺序" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	if(isNaN(paraMap_SHOW_ORDER.value)){
   		_alertValMsg(paraMap_SHOW_ORDER,"<dict:lang value="显示顺序" /> -- <dict:lang value="只能为数字" />");
   		return false;
   	}
		var paraMap_jdbcUrl = document.getElementById("paraMap_jdbcUrl");
   	if(val.isBlank(paraMap_jdbcUrl)){
   		_alertValMsg(paraMap_jdbcUrl,"<dict:lang value="连接串" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>