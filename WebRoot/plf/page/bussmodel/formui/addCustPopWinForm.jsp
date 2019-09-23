<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="弹出自定义选择窗口" />UI <dict:lang value="配置" />
	</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
</head>
<body>
	<div class="all">
		<div>
			<form id="add_form" name="addForm" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				
				
				<table class="add_table">
					<tr>
						<td colspan="2">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<tr>
						<td width="30%" class="tr1" >
							<dict:lang value="数据来源" />
							<span class="Eng">*</span>
						</td>
						<td width="70%">
							<dict:selectDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}"  id="paraMap_UI_DATA_TYPE" 
								name="paraMap.UI_DATA_TYPE"	onchange="setUiData(this);"  filterVal="2,3,4"/>
						</td>
					</tr>
					<tr id="UI_DATA_2">
						<td width="30%" class="tr1" >
							<dict:lang value="执行函数名称" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<input type="text" id="paraMap_UI_DATA_2" name="paraMap.UI_DATA_2" 
								value="<s:property value="dataMap.UI_DATA_2"/>" maxlength="120" />
						</td>
					</tr>
					<tr id="UI_DATA_3">
						<td width="30%" class="tr1" >
							<dict:lang value="执行函数内容" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<textarea id="paraMap_UI_DATA_3" name="paraMap.UI_DATA_3" rows="15" 
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_3"/></textarea>
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
		var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
   	if(val.isBlank(paraMap_UI_DATA_2)){
   		_alertValMsg(paraMap_UI_DATA_2,"<dict:lang value="执行函数名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
		var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
   	if(val.isBlank(paraMap_UI_DATA_3)){
   		_alertValMsg(paraMap_UI_DATA_3,"<dict:lang value="执行函数内容" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}

	function init(){}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>