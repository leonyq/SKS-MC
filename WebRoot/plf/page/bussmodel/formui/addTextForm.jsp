<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="单行文本" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			
		</jsp:include>
	<style type="text/css">
	.radio{margin:0;padding:0;height:13px;vertical-align:text-top;margin-top:0;}
	</style>
</head>
<body>
		<div class="all">
			<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${mcIframeName}">
				
				<table class="add_table element_table">
					<!--  
					<tr>
						<td colspan="2">	
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					-->
					
					<tr>
						<s:if test="dataMap.COL_SCENE == \"1\"">
						<td class="title tr1" >
							<dict:lang value="扩展关联字段" />
						</td>
						<td>
							<select id="paraMap_COL_SCENE_FORM_COL_ID" name="paraMap.COL_SCENE_FORM_COL_ID" style="width: 100%">
								<option value=""><dict:lang value="--请选择--"/></option>
								<s:iterator value="listData">
								<option <s:if test="dataMap.COL_SCENE_FORM_COL_ID == ID ">selected="selected"</s:if> value="<s:property value="ID" />" ><s:property value="TITLE_NAME" /> <s:property value="COL_NO" /></option>
								</s:iterator>
							</select>
						</td>
						</s:if>
					</tr>
					<tr>
						<td class="title tr1" >
							<span class="Eng">*</span><dict:lang value="数据来源" />
						</td>
						<td>
							<!--  
							<dict:selectDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}"  id="paraMap_UI_DATA_TYPE" 
							name="paraMap.UI_DATA_TYPE"	onchange="setUiData(this);" filterVal="2"/>
							-->
							
							<dict:selectDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}"  id="paraMap_UI_DATA_TYPE" 
							name="paraMap.UI_DATA_TYPE"	 bindEvent="setUiData" filterVal="2"/>
							
							<!-- <dict:radioDict dictCode="UI_DATA_TYPE" dictValue="%{dataMap.UI_DATA_TYPE}" id="paraMap_UI_DATA_TYPE_" 
								name="paraMap.UI_DATA_TYPE" style="width:30px;" /> -->
						</td>
					</tr>
					<c:if test="${mcIsOpenAuth eq '1' || (mcIsOpenAuth eq '0' && isOldAuthDataPattern eq '1')}">
					<tr id = "showIsByDataAuthFilter" style="display: none;">
						<td class="title tr1" >
							<span class="Eng">*</span><dict:lang value="组织机构过滤数据" />
						</td>
						<td>
						<select id="paraMap_IS_BY_DATA_AUTH_FILTER"    name="paraMap.isByDataAuthFilter">
								<option  <s:if test="dataMap.isByDataAuthFilter == 1 ">selected="selected"</s:if> value="1"><dict:lang value="是"/></option>
								<option  <s:if test="dataMap.isByDataAuthFilter == 2 ">selected="selected"</s:if> value="2"><dict:lang value="否"/></option>
							</select>
						</td>
					</tr>
					
					<%--<tr id = "showIsByDataAuthFkFilter" style="display: none;">
						<td width="30%" class="tr1" >
							<span class="Eng">*</span><dict:lang value="主表组织机构等于外键表组织机构过滤" />
						</td>
						<td width="70%">
						<select id="paraMap_IS_BY_DATA_AUTH_FK_FILTER" name="paraMap.isByDataAuthAndFkFilter">
								<option  <s:if test="dataMap.isByDataAuthAndFkFilter == 1 ">selected="selected"</s:if> value="1"><dict:lang value="是"/></option>
								<option  <s:if test="dataMap.isByDataAuthAndFkFilter == 2 ">selected="selected"</s:if> value="2"><dict:lang value="否"/></option>
							</select>
						</td>
					</tr>
					--%></c:if>
					
					<%@ include file="inc_save_mark_att.jsp"%>	
					
					<tr>
						<td class="title tr1" >
							<span class="Eng"></span><dict:lang value="输入提示" />
						</td>
						<td>
							<input type="text" id="textTip" name="paraMap.textTip" value="<s:property value="dataMap.UI_TEXT_TIP"/>"></input>
						</td>
					</tr>
					
					<tr id="UI_DATA_1" >
						<td class="title tr1" >
							有效性校验
						</td>
						<td>
						<div>
						<input type="radio" lay-filter="valfunc" checked="checked" name="paraMap.ruler" id="unlimited" value = "unlimited" class="radio" style="width:15px;" title="不限制"></input>
						<br/>
						<input type="radio" lay-filter="valfunc" name="paraMap.ruler" id="letters" value="letters" class="radio" style="width:15px;" title="仅允许输入字母"></input>
						<br/>
						<input type="radio" lay-filter="valfunc" name="paraMap.ruler" id="capital" value="capital" class="radio" style="width:15px;" title="仅允许输入大写字母"></input>
						<br/>
						<input type="radio" lay-filter="valfunc" name="paraMap.ruler" id="lower_case" value="lower_case" class="radio" style="width:15px;" title="仅允许输入小写字母"></input>
						<br/>
						<input type="radio" lay-filter="valfunc" name="paraMap.ruler" id="number" value="number" class="radio" style="width:15px;" title="仅允许输入数字"></input>
						<br/>
						<div id="checkNum" style="display:none;">
						取值范围
						<input type="text" name="paraMap.numberleft" id="left" style="width:60px" disabled value="<s:property value="dataMap.UI_RULE_LEFT"/>"></input>
						～
						<input type="text" name="paraMap.numberright" id="right" style="width:60px" disabled value="<s:property value="dataMap.UI_RULE_RIGHT"/>"></input>
						<br/>
						</div>
						<input type="radio" lay-filter="valfunc" name="paraMap.ruler" id="regex" value="regex" class="radio" style="width:15px;" title="正则表达式"></input>
						<br/>
						<div id="checkRegex" style="display:none;">
						<input type="text" id="regular_expression" name="paraMap.regex" disabled value="<s:property value="dataMap.UI_RULE_REGEX"/>"></input>
						<div>
							<p style="margin:10px 0 5px 0;">正则验证非法提示信息</p>
							<input type="text" id="tip" name="paraMap.tip" value="<s:property value="dataMap.UI_RULE_TIP"/>"></input>
						</div>
						
						<br/>
						</div>
						</div>
						</td>
					</tr>
					<tr id="UI_DATA_2" style="display: none;">
						<td class="title tr1" >
							<dict:lang value="SQL语句" />
						</td>
						<td>
							<textarea  lay-verify="paraMap_UI_DATA_2_verify" id="paraMap_UI_DATA_2" name="paraMap.UI_DATA_2" rows="6" cols="" style="width: 100%;"><s:property value="dataMap.UI_DATA_2"/></textarea>
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr id="UI_DATA_3" style="display: none;">
						<td class="title tr1" >
							<span class="Eng">*</span><dict:lang value="数据字典编码(key)" />
						</td>
						<td>
							
							<!--  
							<input type="button" style="width:66px" value="<dict:lang value="选择" />" onclick="selToDict(this);" class="botton_img_add">
							-->
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
                			<input type="text" class="p_r_30" lay-verify="paraMap_UI_DATA_3_verify" id="paraMap_UI_DATA_3"  readonly="readonly" name="paraMap.UI_DATA_3" value="<s:property value="dataMap.UI_DATA_3"/>" />
							
                            <i class="layui-icon layui-icon-search" onclick="selToDict(this);" style="position: absolute;top:11px;right: 8px;"></i>
                     		</div>
				
						</td>
					</tr>
					
					<tr class="UI_DATA_4" style="display: none;">
	<td class="title tr1" >
		<span class="Eng">*</span><dict:lang value="外键表名" />
	</td>
	<td>
		<input type="text" id="paraMap_UI_DATA_4_1" lay-verify="paraMap_UI_DATA_4_1_verify" name="paraMap.UI_DATA_4_1" value="<s:property value="dataMap.UI_DATA_4_1"/>"  onkeyup="javascript:replaceLikeVal(this)" />
	</td>
</tr>
<tr class="UI_DATA_4" style="display: none;">
	<td class="title tr1" >
		<span class="Eng">*</span><dict:lang value="外键显示字段" />
	</td>
	<td>
		<input type="text" id="paraMap_UI_DATA_4_2" lay-verify="paraMap_UI_DATA_4_2_verify" name="paraMap.UI_DATA_4_2" value="<s:property value="dataMap.UI_DATA_4_2"/>" onkeyup="javascript:replaceLikeVal(this)"/>
	</td>
</tr>
<tr class="UI_DATA_4" style="display: none;">
	<td class="title tr1" >
		<span class="Eng">*</span><dict:lang value="外键取值字段" />
	</td>
	<td>
		<input type="text" id="paraMap_UI_DATA_4_3" lay-verify="paraMap_UI_DATA_4_3_verify" name="paraMap.UI_DATA_4_3" value="<s:property value="dataMap.UI_DATA_4_3"/>" onkeyup="javascript:replaceLikeVal(this)"/>
	</td>
</tr>
<tr class="UI_DATA_4" style="display: none;">
	<td class="title tr1" >
		<span class="Eng">*</span><dict:lang value="外键关联字段" />
	</td>
	<td>
		<input type="text" id="paraMap_UI_DATA_4_4" name="paraMap.UI_DATA_4_4" lay-verify="paraMap_UI_DATA_4_4_verify" value="<s:property value="dataMap.UI_DATA_4_4"/>" onkeyup="javascript:replaceLikeVal(this)"/>
	</td>
</tr>
					
					 				
					
				</table>
				
				<div class="ptop_10 txac">
					<!--  
					<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
					-->
					
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
	
	 

	var form;
	function replaceLikeVal(comp){ 
		var regx=/[^A-Za-z0-9^_]/g
	    if (comp.value.match(regx)) {  
	    	comp.value=comp.value.replace(/[^A-Za-z0-9^_]/g,'')
	        _alertValMsg(comp,"<dict:lang value="只能输入A-Za-z0-9_" />");
	    }  
	}  
		function selToDict(obj){
			var iframeId=window.name;
			var paraMap_UI_DATA_3=$("#paraMap_UI_DATA_3").val();
			url="${path}sys/BussModelAction_showDict.ms?paraMap.UI_DATA_3="+paraMap_UI_DATA_3+"&mcIframeName="+window.parent.name;
			showPopWin(url, 950, 550,null,''+"<dict:lang value="数据字典" /> <dict:lang value="配置" />");
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
		    chkFormUiControlUtils.getSaveMakVal();
			return true;
		}
		
		function setUiData(thisObj)
		{
			$('#UI_DATA_1').hide();
			$('#UI_DATA_2').hide();
			$('#UI_DATA_3').hide();
			$('.UI_DATA_4').hide();
			
			$('.UI_DATA_'+$(thisObj).val()).show();
			if($(thisObj).val()=="4"){
				$('.UI_DATA_'+$(thisObj).val()).show();
				if("1"=="<c:out value='${mcIsOpenAuth}' />" || ("0"=="<c:out value='${mcIsOpenAuth}' />"  && "1" =="<c:out value='${isOldAuthDataPattern}' />")){
					$("#showIsByDataAuthFilter").show();
				}else{
					$("#showIsByDataAuthFilter").hide();
				}
			}else{
				$('#UI_DATA_'+$(thisObj).val()).show();
				$("#showIsByDataAuthFilter").hide();
			}
		}
		
		function init(){
		}
			setUiData($("#paraMap_UI_DATA_TYPE"));
			</script>
	<script type="text/javascript" src="${path}plf/js/jquery/jquery-1.7.2.js?_mc_res_version=<%=PlfStaticRes.JQUERY_172_JS %>"></script>
	<script type="text/javascript">
	$(function()
	{
			var left = document.getElementById("left");
			var right = document.getElementById("right");
			var regular_expression = document.getElementById("regular_expression");
			var target = document.getElementById("target");
			var sel = null;
			var leftval = null;
			var rightval = null;
			var regex_o = null;
			if("<s:property value="dataMap.UI_RULE"/>" == "unlimited")
			{
				$("#unlimited").attr("checked",true);
				unlimitedSelect();
			}
			else if("<s:property value="dataMap.UI_RULE"/>" == "letters")
			{
				$("#letters").attr("checked",true);
				lettersSelect();
			}
			else if("<s:property value="dataMap.UI_RULE"/>" == "capital")
			{
				$("#capital").attr("checked",true);
				capitalSelect();
			}
			else if("<s:property value="dataMap.UI_RULE"/>" == "lower_case")
			{
				$("#lower_case").attr("checked",true);
				lower_caseSelect();
			}
			else if("<s:property value="dataMap.UI_RULE"/>" == "number")
			{
				$("#number").attr("checked",true);
				numberSelect();
			}
			else if("<s:property value="dataMap.UI_RULE"/>" == "regex")
			{
				$("#regex").attr("checked",true);
				regexSelect();
			}
			if(left.addEventListener){
				left.addEventListener("input",function()
				{
					$("#left").attr("value",$("#left").attr("value").replace(/\D+/g,""));
					if($('#left').attr("value") != null && $('#right').attr("value") != null)
					{
						var templeftval = parseFloat($('#left').attr("value"));
						var temprightval = parseFloat($('#right').attr("value"));
						if(templeftval >= temprightval)
						{
							$("#left").attr("value",$("#left").attr("value").substring(0,$("#left").attr("value").length-1));
						}
					}
				},true);
				right.addEventListener("input",function()
				{
					$("#right").attr("value",$("#right").attr("value").replace(/\D+/g,""));
				},true);
			}else{
				left.attachEvent("input",function()
						{
							$("#left").attr("value",$("#left").attr("value").replace(/\D+/g,""));
							if($('#left').attr("value") != null && $('#right').attr("value") != null)
							{
								var templeftval = parseFloat($('#left').attr("value"));
								var temprightval = parseFloat($('#right').attr("value"));
								if(templeftval >= temprightval)
								{
									$("#left").attr("value",$("#left").attr("value").substring(0,$("#left").attr("value").length-1));
								}
							}
						},true);
						right.attachEvent("input",function()
						{
							$("#right").attr("value",$("#right").attr("value").replace(/\D+/g,""));
						},true);				
			}
			//<!--$("#sub").click(function()
			//{
			//	leftval = $('#left').val();
			//	rightval = $('#right').val();
			//	configRuler(sel,leftval,rightval，regex_0);
			//});-->
			function unlimitedSelect()
			{
				disabledALL();
				sel = "unlimited";
			}
			$("#unlimited").click(function()
			{
				unlimitedSelect();
			});
			function lettersSelect()
			{
				disabledALL();
				sel = "letters";
			}
			$("#letters").click(function()
			{
				lettersSelect();
			});
			function capitalSelect()
			{
				disabledALL();
				sel = "capital";
			}
			$("#capital").click(function()
			{
				capitalSelect();
			});
			function lower_caseSelect()
			{
				disabledALL();
				sel = "lower_case";
			}
			$("#lower_case").click(function()
			{
				lower_caseSelect();
			});
			function numberSelect()
			{
				$('#left').attr("disabled",false);
				$('#right').attr("disabled",false);
				$('#regular_expression').attr("disabled",true);
				$("#checkNum").show();
				sel = "number";
				leftval = $('#left').val();
				rightval = $('#right').val();
			}
			$("#number").click(function()
			{
				numberSelect();
			});
			$('#left').blur(function()
			{
				if($('#right').attr("value") != null && $('#left').attr("value") != null)
				{
					var templeftval = parseFloat($('#left').attr("value"));
					var temprightval = parseFloat($('#right').attr("value"));
					if(templeftval >= temprightval)
					{
						$("#left").focus();
						_alertValMsg(left,"数字上限必须大于下限");
					}
				}
			});
			$('#right').blur(function()
			{
				if($('#right').attr("value") != null && $('#left').attr("value") != null)
				{
					var templeftval = parseFloat($('#left').attr("value"));
					var temprightval = parseFloat($('#right').attr("value"));
					if(templeftval >= temprightval)
					{
						$("#right").focus();
						_alertValMsg(right,"数字下限必须小于上限");
					}
				}
			});
			function regexSelect()
			{
				$('#left').attr("disabled",true);
				$('#right').attr("disabled",true);
				$('#regular_expression').attr("disabled",false);
				$("#checkRegex").show();
				leftval = null;
				rightval = null;
				sel = "regex";
				regex_o = $('#regular_expression').attr("value");
			}
			
			$("#regex").click(function()
			{
				regexSelect();
			});
			function disabledALL()
			{
				$('#left').attr("disabled", true);
				$('#right').attr("disabled", true);
				$('#regular_expression').attr("disabled", true);
				leftval = null;
				rightval = null;
			}
			
			layui.use('form', function(){
	    	  form = layui.form;
	    	  
	          var typeVal = $("#paraMap_UI_DATA_TYPE").val();
	          
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
		       chkFormUiControlUtils.getSaveMakVal();
		       return true;
				       
			}) 
		
		
			form.on('select(setUiData)', function(data){
				//console.log(data.elem); //得到select原始DOM对象
				//console.log(data.value); //得到被选中的值
				//console.log(data.othis); //得到美化后的DOM对象
				
				//alert(data.value);
				setUiData(data.elem);
			
		 	});
			 
			 
		 	form.on('radio(valfunc)', function(data){
				//alert(data.value);
				$("#checkRegex").hide();
				$("#checkNum").hide();
				if(data.value == "unlimited")
				{
					$("#unlimited").attr("checked",true);
					unlimitedSelect();
				}
				else if(data.value == "letters")
				{
					$("#letters").attr("checked",true);
					lettersSelect();
				}
				else if(data.value == "capital")
				{
					$("#capital").attr("checked",true);
					capitalSelect();
				}
				else if(data.value == "lower_case")
				{
					$("#lower_case").attr("checked",true);
					lower_caseSelect();
				}
				else if(data.value == "number")
				{
					$("#checkNum").show();
					$("#number").attr("checked",true);
					numberSelect();
				}
				else if(data.value == "regex")
				{
					$("#checkRegex").show();
					$("#regex").attr("checked",true);
					regexSelect();
				}
			
		 	});
		 	
		 	 form.verify({
		   		 paraMap_UI_DATA_2_verify: function(value,item){
		   		 		typeVal = $("#paraMap_UI_DATA_TYPE").val();
					   if(typeVal == "2"){
							var paraMap_UI_DATA_2 = document.getElementById("paraMap_UI_DATA_2");
							if(val.isBlank(paraMap_UI_DATA_2)){
								return "<dict:lang value="SQL语句" /> -- <dict:lang value="不能为空" />";
							}
						}
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_3_verify: function(value,item){
		   		 		typeVal = $("#paraMap_UI_DATA_TYPE").val();
					   if(typeVal == "3"){
							var paraMap_UI_DATA_3 = document.getElementById("paraMap_UI_DATA_3");
							if(val.isBlank(paraMap_UI_DATA_3)){
								return "<dict:lang value="数据字典编码(key)" /> -- <dict:lang value="不能为空" />";
							}
						}
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_1_verify: function(value,item){
		   		 		typeVal = $("#paraMap_UI_DATA_TYPE").val();
					   if(typeVal == "4"){
					   		var paraMap_UI_DATA_4_1 = document.getElementById("paraMap_UI_DATA_4_1");
							if(val.isBlank(paraMap_UI_DATA_4_1)){
								return "<dict:lang value="外键表名" /> -- <dict:lang value="不能为空" />";
							}
					   }
					   
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_2_verify: function(value,item){
		   		 		typeVal = $("#paraMap_UI_DATA_TYPE").val();
					   if(typeVal == "4"){
					   		var paraMap_UI_DATA_4_2 = document.getElementById("paraMap_UI_DATA_4_2");
							if(val.isBlank(paraMap_UI_DATA_4_2)){
								return "<dict:lang value="外键显示字段" /> -- <dict:lang value="不能为空" />";
							}
					   }
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_3_verify: function(value,item){
		   		 		typeVal = $("#paraMap_UI_DATA_TYPE").val();
					   if(typeVal == "4"){
					   		var paraMap_UI_DATA_4_3 = document.getElementById("paraMap_UI_DATA_4_3");
							if(val.isBlank(paraMap_UI_DATA_4_3)){
								return "<dict:lang value="外键取值字段" /> -- <dict:lang value="不能为空" />";
							}
					   }
				 }
		     });
		     
		     form.verify({
		   		 paraMap_UI_DATA_4_4_verify: function(value,item){
		   		 		typeVal = $("#paraMap_UI_DATA_TYPE").val();
					   if(typeVal == "4"){
					   		var paraMap_UI_DATA_4_4 = document.getElementById("paraMap_UI_DATA_4_4");
							if(val.isBlank(paraMap_UI_DATA_4_4)){
								return "<dict:lang value="外键关联字段" /> -- <dict:lang value="不能为空" />";
							}
					   }
				 }
		     });
      
	
	    });
			
	});
	

</script>
<script src="${path}plf/page/js_files/comm/chk.form.ui.control.vals.js?_mc_res_version=<%=PlfStaticRes.ChkFormUiControlVals %>"></script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>