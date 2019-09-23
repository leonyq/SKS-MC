<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="弹出自定义选择窗口" />UI <dict:lang value="配置" />
	</title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
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
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="数据来源" />
							
						</td>
						<td >
							<dict:selectDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}"  id="paraMap_UI_DATA_TYPE" 
								name="paraMap.UI_DATA_TYPE"	onchange="setUiData(this);"  filterVal="2,3,4"/>
						</td>
					</tr>
					<tr id="UI_DATA_4">
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="按钮名称" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_4" lay-verify="paraMap_UI_DATA_4_verify" name="paraMap.UI_DATA_4" 
								value="<s:property value="dataMap.UI_DATA_4"/>" maxlength="120" />
						</td>
					</tr>					
					<tr id="UI_DATA_2">
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="执行函数名称" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_2"  lay-verify="paraMap_UI_DATA_2_verify" name="paraMap.UI_DATA_2" 
								value="<s:property value="dataMap.UI_DATA_2"/>" maxlength="120" />
						</td>
					</tr>
					<tr id="UI_DATA_7">
						<td  class="tr1 title" >
							<dict:lang value="单击前事件函数名称" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_7" lay-verify="paraMap_UI_DATA_7_verify" name="paraMap.UI_DATA_7" 
								value="<s:property value="dataMap.UI_DATA_7"/>" maxlength="120" />
						</td>
					</tr>
					<tr id="UI_DATA_8">
						<td  class="tr1 title" >
							<dict:lang value="单击后事件函数名称" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_8" lay-verify="paraMap_UI_DATA_8_verify" name="paraMap.UI_DATA_8" 
								value="<s:property value="dataMap.UI_DATA_8"/>" maxlength="120" />
						</td>
					</tr>					
					<tr id="UI_DATA_3">
						<td  class="tr1 title" >
							<span class="Eng">*</span><dict:lang value="函数内容" />
							<br>
			<i class="editCode" style="float: right;margin-right:20px;" id="editCode" onclick="editJsValFun('paraMap_UI_DATA_3');"></i> 
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_3"  lay-verify="paraMap_UI_DATA_3_verify" name="paraMap.UI_DATA_3" rows="6" 
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_3"/></textarea>
						</td>
					</tr>
				<%--<tr id="UI_DATA_5">
						<td  class="tr1 title" >
							<dict:lang value="自定义样式名称" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_5" name="paraMap.UI_DATA_5" 
								value="<s:property value="dataMap.UI_DATA_5"/>" maxlength="120" />
						</td>
					</tr>
					<tr id="UI_DATA_6">
						<td  class="tr1 title" >
							<dict:lang value="自定义样式内容" />
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_6" name="paraMap.UI_DATA_6" rows="15" 
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_6"/></textarea>
						</td>
					</tr>					
				--%>
				
				<!-- <tr id="UI_DATA_7">
						<td  class="tr1 title" >
							<dict:lang value="单击前事件函数" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_7" name="paraMap.UI_DATA_7" 
								value="<s:property value="dataMap.UI_DATA_7"/>" maxlength="120" />
						</td>
					</tr>
					<tr id="UI_DATA_8">
						<td  class="tr1 title" >
							<dict:lang value="单击前事件函数内容" />
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_8" name="paraMap.UI_DATA_8" rows="15" 
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_8"/></textarea>
						</td>
					</tr>	
					
					<tr id="UI_DATA_9">
						<td  class="tr1 title" >
							<dict:lang value="单击后事件函数" />
						</td>
						<td >
							<input type="text" id="paraMap_UI_DATA_9" name="paraMap.UI_DATA_9" 
								value="<s:property value="dataMap.UI_DATA_9"/>" maxlength="120" />
						</td>
					</tr>
					<tr id="UI_DATA_10">
						<td  class="tr1 title" >
							<dict:lang value="单击后事件函数内容" />
						</td>
						<td >
							<textarea id="paraMap_UI_DATA_10" name="paraMap.UI_DATA_10" rows="15" 
								style="width: 100%;overflow:scroll;word-wrap:normal;"><s:property value="dataMap.UI_DATA_10"/></textarea>
						</td>
					</tr>	 -->										
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
	var curJsFunObj;
	
	function editJsValFun(thisObj){
		curJsFunObj = $("#"+thisObj);
		var url = "${path}sys/BussModelAction_forEditJsValFun.ms?funcFlag=control&mcIframeName="+parent.frameElement.name;
		showPopWin(url, '99%', '99%',null,"修改 "); 
	}
	function getJsFunCode(){
		return curJsFunObj.val();//curJsFunObj.value;
	}
	
	function setJsFunCode(code){
		curJsFunObj.val(code) ;
	}
	
	function setJsFunObjFoucue(){
		//curJsFunObj.focus();
	}
	
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
   	
	var paraMap_UI_DATA_4 = document.getElementById("paraMap_UI_DATA_4");
   	if(val.isBlank(paraMap_UI_DATA_4)){
   		_alertValMsg(paraMap_UI_DATA_4,"<dict:lang value="按钮名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	
   	var paraMap_UI_DATA_7 = document.getElementById("paraMap_UI_DATA_7");
   	var paraMap_UI_DATA_8 = document.getElementById("paraMap_UI_DATA_8");
   	
   	   	
   	if(!validateInput(paraMap_UI_DATA_4))
   	{
   		return false;
   	}
   	
   	if(!validateInput(paraMap_UI_DATA_2))
   	{
   		return false;
   	}
   	
   	if(!validateInput(paraMap_UI_DATA_7))
   	{
   		return false;
   	}
   	
   	if(!validateInput(paraMap_UI_DATA_8))
   	{
   		return false;
   	}
   	/*var paraMap_UI_DATA_5 = document.getElementById("paraMap_UI_DATA_5");
	var paraMap_UI_DATA_6 = document.getElementById("paraMap_UI_DATA_6");
	
	if(!val.isBlank(paraMap_UI_DATA_5)){
	   	if(!val.isBlank(paraMap_UI_DATA_6)){
	   		var _data5 = paraMap_UI_DATA_5.value;
	   		var _data6 = paraMap_UI_DATA_6.value;
	   		var _index5 = _data6.indexOf(_data5);
	   		if(_data6.substring(_index5-1,_index5) != "."){
		   		_alertValMsg(paraMap_UI_DATA_6,"<dict:lang value="自定义样式内容" /> -- <dict:lang value="样式体命名应以.开始" />");
		   		return false;
	   		}
	   	}   			
	}*/
		return true;
	}
	
	function validateInput(input)
	{
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

	function init(){}
	
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
		   		 paraMap_UI_DATA_2_verify: function(value,item){
		   		 		var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
					   	if(val.isBlank(paraMap_UI_DATA_2)){
					   		return "<dict:lang value="执行函数名称" /> -- <dict:lang value="不能为空" />";
					   	}
					   	
					   	if(!validateInput(paraMap_UI_DATA_2))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_3_verify: function(value,item){
		   		 		var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
					   	if(val.isBlank(paraMap_UI_DATA_3)){
					   		return "<dict:lang value="执行函数内容" /> -- <dict:lang value="不能为空" />";
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_verify: function(value,item){
		   		 		var paraMap_UI_DATA_4 = document.getElementById("paraMap_UI_DATA_4");
					   	if(val.isBlank(paraMap_UI_DATA_4)){
					   		return "<dict:lang value="按钮名称" /> -- <dict:lang value="不能为空" />";
					   	}
					   	
					   	if(!validateInput(paraMap_UI_DATA_4))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
					   	}
		   		 		
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_7_verify: function(value,item){
		   		 		var paraMap_UI_DATA_7 = document.getElementById("paraMap_UI_DATA_7");
		   		 		if(!validateInput(paraMap_UI_DATA_7))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
					   	}
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_8_verify: function(value,item){
		   		 		var paraMap_UI_DATA_8 = document.getElementById("paraMap_UI_DATA_8");
		   		 		if(!validateInput(paraMap_UI_DATA_8))
					   	{
					   		return "<dict:lang value="不能包含敏感字符:如引号,括号等特殊符号" />";
					   	}
				 }
		     });
	
	    });
	    
})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>