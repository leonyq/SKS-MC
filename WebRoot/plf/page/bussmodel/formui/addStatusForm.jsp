<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>

<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="状态显示控件" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
		<div class="all">
			<div class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				<table class="add_table element_table">

					<tr>
						<tr>
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="开启状态图标映射内容" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_1" lay-verify="paraMap_UI_DATA_1_verify" name="paraMap.UI_DATA_1"  value="<s:property value="dataMap.UI_DATA_1"/>" style="width: calc( 100% - 40px )"></input>
							<img src="${path}plf/page/fp/img/ico-state-h.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_H_PNG %>" width="35" height="15">
							
						</td>
						
						
					</tr>
					<tr>
						<tr>
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="关闭状态图标映射内容" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_2" name="paraMap.UI_DATA_2"  lay-verify="paraMap_UI_DATA_2_verify" value="<s:property value="dataMap.UI_DATA_2"/>" style="width: calc( 100% - 40px )"></input>
							<img src="${path}plf/page/fp/img/ico-state.png?_mc_res_version=<%=PlfStaticRes.ICO_STATE_PNG %>" width="35" height="15">
							
						</td>
						
					</tr>
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
		var paraMap_UI_DATA_1 = document.getElementById("paraMap_UI_DATA_1");
	   	if(val.isBlank(paraMap_UI_DATA_1)){
	   		_alertValMsg(paraMap_UI_DATA_1,"<dict:lang value="开启状态图标映射内容" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
		var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
	   	if(val.isBlank(paraMap_UI_DATA_2)){
	   		_alertValMsg(paraMap_UI_DATA_2,"<dict:lang value="关闭状态图标映射内容" /> -- <dict:lang value="不能为空" />");
	   		return false;
      	}
		return true;
	}
		function validateInput(input){
		var input_value = input.value;
	   	if(input_value != "" && input_value != null)
	   	{
	   		if(input_value.indexOf("\"") != -1 || input_value.indexOf("\'") != -1 || input_value.indexOf("<") != -1 || input_value.indexOf(">") != -1 
				|| input_value.indexOf("{") != -1  || input_value.indexOf("}") != -1  || input_value.indexOf("[") != -1  || input_value.indexOf("]") != -1 
				|| input_value.indexOf("(") != -1  || input_value.indexOf(")") != -1 )
			{
				_alertValMsg(input,"<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />");
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
			 /*
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
		       */
		       return true;
				       
			}) 
			
			form.verify({
		   		 paraMap_UI_DATA_1_verify: function(value,item){
		   		 		var paraMap_UI_DATA_1 = document.getElementById("paraMap_UI_DATA_1");
					   	if(val.isBlank(paraMap_UI_DATA_1)){
					   		return "<dict:lang value="开启状态图标映射内容" /> -- <dict:lang value="不能为空" />";
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_2_verify: function(value,item){
						var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
					   	if(val.isBlank(paraMap_UI_DATA_2)){
					   		return "<dict:lang value="关闭状态图标映射内容" /> -- <dict:lang value="不能为空" />";
				      	}
		   		 		
				 }
		     });
	
	    });
	    
})

</script>
<script src="${path}plf/page/js_files/comm/chk.form.ui.control.vals.js?_mc_res_version=<%=PlfStaticRes.ChkFormUiControlVals %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>