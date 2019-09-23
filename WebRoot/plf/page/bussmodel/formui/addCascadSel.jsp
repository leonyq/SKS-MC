<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="级联下拉框" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp" />
</head>
<body>
	<div class="all">
		<div>
			<form id="add_form" name="addForm" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				<s:hidden name="paraMap.FORM_ID" />
				<table class="add_table">
					<tr>
						<td colspan="2">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<tr>
						<td width="30%" class="tr1" >
							<dict:lang value="数据来源" />
						</td>
						<td width="70%">
							<dict:selectDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}"  id="paraMap_UI_DATA_TYPE" 
							name="paraMap.UI_DATA_TYPE"	onchange="setUiData(this);" filterVal="2,3" />
							<!-- <dict:radioDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}" id="paraMap_UI_DATA_TYPE_" 
								name="paraMap.UI_DATA_TYPE" style="width:30px;" /> -->
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr id="UI_DATA_3" style="display: none;">
						<td width="30%" class="tr1" >
							<dict:lang value="数据字典编码(key)" />
						</td>
						<td width="70%">
							<input type="text" id="paraMap_UI_DATA_3" name="paraMap.UI_DATA_3" value="<s:property value="dataMap.UI_DATA_3"/>" />
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr id="UI_DATA_4" style="display: none;">
						<td width="30%" class="tr1" >
							<dict:lang value="外键配置" />
						</td>
						<td width="70%">
							<span style="display:inline-block;width: 80px;">外键表名</span>&nbsp;&nbsp;
							<input type="text" id="paraMap_UI_DATA_4_1" name="paraMap.UI_DATA_4_1" value="<s:property value="dataMap.UI_DATA_4_1"/>" />
							<span class="Eng">*</span>
							<br>
							<span style="display:inline-block;width: 80px;">外键显示字段</span>&nbsp;&nbsp;
							<input type="text" id="paraMap_UI_DATA_4_2" name="paraMap.UI_DATA_4_2" value="<s:property value="dataMap.UI_DATA_4_2"/>" />
							<span class="Eng">*</span>
							<br>
							<span style="display:inline-block;width: 80px;">外键取值字段</span>&nbsp;&nbsp;
							<input type="text" id="paraMap_UI_DATA_4_3" name="paraMap.UI_DATA_4_3" value="<s:property value="dataMap.UI_DATA_4_3"/>" />
							<span class="Eng">*</span>
							<br>
							<span style="display:inline-block;width: 80px;">外键关联字段</span>&nbsp;&nbsp;
							<input type="text" id="paraMap_UI_DATA_4_4" name="paraMap.UI_DATA_4_4" value="<s:property value="dataMap.UI_DATA_4_4"/>" />
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr id="UI_DATA_5" >
						<td width="30%" class="tr1" >
							<dict:lang value="自定义SQL" />
						</td>
						<td width="70%">
							<textarea id="paraMap_UI_DATA_5" name="paraMap.UI_DATA_5" rows="6" cols="" style="width: 100%;"><s:property value="dataMap.UI_DATA_5"/></textarea>
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr id="UP_FORM_COL_ID">
						<td width="30%" class="tr1" >
							<dict:lang value="上级关联UI字段" />
						</td>
						<td width="70%">
							<select id="paraMap_UP_FORM_COL_ID" name="paraMap.UP_FORM_COL_ID" style="width: 100%">
								<option value=""><dict:lang value="--请选择--"/></option>
								<s:iterator value="listData">
								<option <s:if test="dataMap.UP_FORM_COL_ID == ID ">selected="selected"</s:if> value="<s:property value="ID" />" ><s:property value="TITLE_NAME" /> <s:property value="COL_NO" /></option>
								</s:iterator>
							</select>
						</td>
					</tr>
					<tr id="NEXT_FORM_COL_ID">
						<td width="30%" class="tr1" >
							<dict:lang value="下级关联UI字段" />
						</td>
						<td width="70%">
							<select id="paraMap_NEXT_FORM_COL_ID" name="paraMap.NEXT_FORM_COL_ID" style="width: 100%">
								<option value=""><dict:lang value="--请选择--"/></option>
								<s:iterator value="listData">
								<option <s:if test="dataMap.NEXT_FORM_COL_ID == ID ">selected="selected"</s:if> value="<s:property value="ID" />" ><s:property value="TITLE_NAME" /> <s:property value="COL_NO" /></option>
								</s:iterator>
							</select>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<br>
		<br>
		<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin_ui();" class="botton_img_search">
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
		//window.parent.parent.reloadPg(msg);
		window.parent.parent.add();
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
		var typeVal = $("#paraMap_UI_DATA_TYPE").val();
		if(typeVal == "2"){
			var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
	   	if(val.isBlank(paraMap_UI_DATA_2)){
	   		_alertValMsg(paraMap_UI_DATA_2,"<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}else if(typeVal == "3"){
			var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
	   	if(val.isBlank(paraMap_UI_DATA_3)){
	   		_alertValMsg(paraMap_UI_DATA_3,"<dict:lang value="数据字典编码(key)" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}else if(typeVal == "4"){
			var paraMap_UI_DATA_4_1 = document.getElementById("paraMap_UI_DATA_4_1");
	   	if(val.isBlank(paraMap_UI_DATA_4_1)){
	   		_alertValMsg(paraMap_UI_DATA_4_1,"<dict:lang value="外键表名" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_2 = document.getElementById("paraMap_UI_DATA_4_2");
	   	if(val.isBlank(paraMap_UI_DATA_4_2)){
	   		_alertValMsg(paraMap_UI_DATA_4_2,"<dict:lang value="外键显示字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_3 = document.getElementById("paraMap_UI_DATA_4_3");
	   	if(val.isBlank(paraMap_UI_DATA_4_3)){
	   		_alertValMsg(paraMap_UI_DATA_4_3,"<dict:lang value="外键取值字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_4 = document.getElementById("paraMap_UI_DATA_4_4");
	   	if(val.isBlank(paraMap_UI_DATA_4_4)){
	   		_alertValMsg(paraMap_UI_DATA_4_4,"<dict:lang value="外键关联字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}
		var paraMap_UI_DATA_5 = document.getElementById("paraMap_UI_DATA_5");
   	if(val.isBlank(paraMap_UI_DATA_5)){
   		_alertValMsg(paraMap_UI_DATA_5,"<dict:lang value="外键关联字段" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}
	
	function setUiData(thisObj){
		$('#UI_DATA_1').hide();
		$('#UI_DATA_2').hide();
		$('#UI_DATA_3').hide();
		$('#UI_DATA_4').hide();
		$('#UI_DATA_'+$(thisObj).val()).show();
	}
	
	function init(){
	}
		setUiData($("#paraMap_UI_DATA_TYPE"));

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>