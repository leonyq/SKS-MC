<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="多行文本" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
		<div>
			<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				<table class="add_table element_table">
					<tr>
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="数据来源" />
						</td>
						<td>
							<dict:lang value="常量" />
							<input type="hidden" name="paraMap.UI_DATA_TYPE" value="<s:property value="%{@com.more.fw.core.common.method.ConstantsMc@UI_DATA_TYPE_1}" />" />
							
						</td>
		 			</tr>
					
					
					<%@ include file="inc_save_mark_att.jsp"%>
					
				</table>
				<div class="ptop_10 txac">			
			
			<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin_ui();" class="layui-btn layui-btn-danger">
					
		</div>
			</form>
			</div>
		</div>
		<br>
		<br>
		

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
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
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
			var paraMap_UI_DATA_4_3 = document.getElementById("paraMap_UI_DATA_4_1");
	   	if(val.isBlank(paraMap_UI_DATA_4_3)){
	   		_alertValMsg(paraMap_UI_DATA_4_3,"<dict:lang value="外键取值字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
			var paraMap_UI_DATA_4_4 = document.getElementById("paraMap_UI_DATA_4_1");
	   	if(val.isBlank(paraMap_UI_DATA_4_4)){
	   		_alertValMsg(paraMap_UI_DATA_4_4,"<dict:lang value="外键关联字段" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
   	}
    
		return true;
	}
	
	function setUiData(thisObj){
		$('#UI_DATA_2').hide();
		$('#UI_DATA_3').hide();
		$('#UI_DATA_4').hide();
		$('#UI_DATA_'+$(thisObj).val()).show();
	}
	
	function init(){
	}
		setUiData($("#paraMap_UI_DATA_TYPE"));
		
		
var form;
$(function(){
	layui.use('form', function(){
	    	 form = layui.form;
	          
			 form.on('submit(filterSubmit)', function (data) {
			 document.getElementById("mcIframeName").value=window.parent.location.href;
			 document.getElementById("curIframeName").value=window.parent.name;
			 
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
	
	    });
	    
})

</script>
<script src="${path}plf/page/js_files/comm/chk.form.ui.control.vals.js?_mc_res_version=<%=PlfStaticRes.ChkFormUiControlVals %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>