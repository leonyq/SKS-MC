<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="文件域" />UI <dict:lang value="配置" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
		<div class="all">
			<div class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_ID" />
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
							<input type="hidden" name="paraMap.UI_DATA_TYPE"
								value="<s:property value="%{@com.more.fw.core.common.method.ConstantsMc@UI_DATA_TYPE_1}" />" />
							
						</td>
					</tr>
					<%--
					<tr>
						<td width="30%" class="tr1">
							<dict:lang value="文件大小" />
						</td>
						<td width="70%">
							<select id="paraMap_UI_DATA_1" name="paraMap.UI_DATA_1" style="width: 100%"></select>
						</td>
					</tr>
					--%>
					<tr>
						<td class="tr1 title">
							<dict:lang value="文件默认保存路径" />
						</td>
						<td>
						<input id="paraMap_UI_DATA_1" type="text" readonly="readonly" name="paraMap.UI_DATA_1" value="upload" >
							
						</td>
					</tr>
					
					<tr>
						<td class="tr1 title">
							<dict:lang value="文件自定义保存路径" />
						</td>
						<td>
						    <input id="paraMap_UI_DATA_2"  type="text"  name="paraMap.UI_DATA_2" value="<s:property value="dataMap.UI_DATA_2"/>" >
						</td>
					</tr>
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
		var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
		if(!validateInput(paraMap_UI_DATA_1))
		{
			return false;
		}
		if(!validateInput(paraMap_UI_DATA_2))
		{
			return false;
		}
		return true;
	}
	
	function validateInput(input)
	{
		var input_value = input.value;
	   	if(input_value != "" && input_value != null)
	   	{
	   		if(input_value.indexOf("\"") != -1 || input_value.indexOf("\'") != -1 || input_value.indexOf("<") != -1 || input_value.indexOf(">") != -1 
				|| input_value.indexOf("{") != -1 || input_value.indexOf("}") != -1 || input_value.indexOf("[") != -1 || input_value.indexOf("]") != -1 
				|| input_value.indexOf("(") != -1 || input_value.indexOf(")") != -1 )
			{
				_alertValMsg(input,"<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />");
		   		return false;	   		
		   	}
	   	}
	   	return true;
	}
	
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>