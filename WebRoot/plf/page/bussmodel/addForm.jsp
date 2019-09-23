<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="表单模型" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="0" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
		
	</jsp:include>
	<link href="${path}/plf/page/fp/css/chosen.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${path}/plf/page/fp/js/iframe-design.js"></script>
	<script type="text/javascript" src="${path}/plf/page/fp/js/chosen.jquery.js"></script>
</head>
<body>
	 <div class="all">
			<div  class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_addForm.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.MID" />
				<input type="hidden" name="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<table class="add_table">
					<!--  
					<tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					-->
					
					<tr>
						<td class="tr1 title">
							<span class="Eng">*</span><dict:lang value="表单模型名称" />
						</td>
						<td class="widget">							
							<input type="text" lay-verify="formname_Verify" name="paraMap.FORM_NAME" id="paraMap_FORM_NAME" maxlength="50" class="_VAL_DATABASE" />
						</td>
						
						<td>&nbsp;</td>
						
						<td  class="tr1 title">
							<dict:lang value="持久模型" />
						</td>
						<td class="widget">
							
							<!--  
							<select id="paraMap_ORMID" name="paraMap.ORMID" autocomplete="off" class="dept_select IS_SELECT_FILTER" style="width: 50%;">
								<optgroup label="aaaa"></optgroup>
								<s:iterator value="dataMap.ormLs" status="index">
									<option value="<s:property value="ID" />">
										<s:property value="ORM_NAME" />
									</option>
								</s:iterator>
							</select>
							-->
							
							<select id="paraMap_ORMID" name="paraMap.ORMID" lay-search="" lay-verify="ormidVerify">
								<s:iterator value="dataMap.ormLs" status="index">
									<option value="<s:property value="ID" />"><s:property value="ORM_NAME" /></option>
								</s:iterator>
							</select>
							</td>
							
					</tr>
					
					<tr>
						<td  class="tr1 title">
							<dict:lang value="是否设置表格边框线" />
						</td>
						<td class="widget">
							<dict:selectDict id="paraMap_IS_BORDER" name="paraMap.IS_BORDER"  dictCode="IS_BORDER" dictValue="%{dataMap.IS_BORDER}" 
								custom_option="%{getText('-请选择-')}" style="width:153px;" onchange="changeVT(this.value);" />
						</td>
						
						<td>&nbsp;</td>
						
						
							
						<td  class="tr1 title">
							<dict:lang value="是否分页" />
						</td>
						<td  colspan="3" class="widget">
							<dict:radioDict dictCode="YESNO" dictValue="1" id="paraMap_IS_PAGE" name="paraMap.IS_PAGE" 
							 style="width:30px;" />
						</td>
						
				   </tr>
					
					<tr>
						<td class="tr1 title">
							<dict:lang value="表单样式属性" />
						</td>
						<td >
							<s:textfield name="paraMap.FORM_CSS_STYLE" id="paraMap_FORM_CSS_STYLE" maxlength="15" />
						</td>
						
						<td>&nbsp;</td>
						
						<td  class="tr1 title">
							<dict:lang value="表单样式表" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.FORMROW_CSS_CLASS" id="paraMap_FORMROW_CSS_CLASS" maxlength="60" />
						</td>
					</tr>
					
					<tr>
						<td  class="tr1 title">
							<dict:lang value="行样式属性" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.ROW_CSS_STYLE" id="paraMap_ROW_CSS_STYLE" maxlength="15" />
						</td>
						
						<td>&nbsp;</td>
						
						<td  class="tr1 title">
							<dict:lang value="行样式表" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.ROW_CSS_CLASS" id="paraMap_ROW_CSS_CLASS" maxlength="60" />
						</td>
					</tr>
					
					<tr>
						<td  class="tr1 title">
							<dict:lang value="表单事件" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.FORM_FUN" id="paraMap_FORM_FUN" maxlength="15" />
						</td>
						
						<td>&nbsp;</td>
						
						<td  class="tr1 title">
							<dict:lang value="行事件" />
						</td>
						<td class="widget">
							<s:textfield name="paraMap.ROW_FUN" id="paraMap_ROW_FUN" maxlength="60" />
						</td>
					</tr>

					<%--
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="是否多表模型" />
						</td>
						<td width="80%" colspan="3">
							<dict:checkBoxDict name="paraMap.IS_MULT_TABLE" id="paraMap_IS_MULT_TABLE" dictCode="SELECTED" dictValue="%{dataMap.IS_MULT_TABLE}"
								style="width:90px;cursor: pointer;" />						
						</td>
					</tr>
					--%>
					<%--
					<tr id="ORMID_TR">
						<td  class="tr1 title">
							<dict:lang value="关联单表模型" />
						</td>
						<td  colspan="3" class="widget">
							
							<!--  
							<select id="paraMap_ORMID" name="paraMap.ORMID" autocomplete="off" class="dept_select IS_SELECT_FILTER" style="width: 50%;">
								<optgroup label="aaaa"></optgroup>
								<s:iterator value="dataMap.ormLs" status="index">
									<option value="<s:property value="ID" />">
										<s:property value="ORM_NAME" />
									</option>
								</s:iterator>
							</select>
							-->
							
							<select id="paraMap_ORMID" name="paraMap.ORMID" lay-search="">
								<s:iterator value="dataMap.ormLs" status="index">
									<option value="<s:property value="ID" />">
										<s:property value="ORM_NAME" />
									</option>
								</s:iterator>
							</select>
							
						</td>
						
					</tr>
					--%>
					<%--	
					<tr id="COL_SQL＿TR">
						<td width="20%" class="tr1">
							<dict:lang value="多表模型SQL语句" />
						</td>
						<td width="80%" colspan="3">
							<textarea id="paraMap_COL_SQL" name="paraMap.COL_SQL" rows="6" cols="" style="width: 64%;"><s:property value="dataMap.COL_SQL"/></textarea>
							<span class="Eng">*</span>
						</td>
					</tr>
				--%>
				
				</table>
				
				<div class="ptop_10 txac">
					<!--  
					<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
					-->
					
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
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
	var form;
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
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
		
	}
        
	function valData(){
		var paraMapFORMNAME = document.getElementById("paraMap_FORM_NAME");
		//var paraMap_IS_MULT_TABLE_1 = document.getElementById("paraMap_IS_MULT_TABLE_1");
		var paraMap_COL_SQL = document.getElementById("paraMap_COL_SQL");
   	if(val.isBlank(paraMapFORMNAME)){
   		_alertValMsg(paraMapFORMNAME,"<dict:lang value="表单模型名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
   	
   	/*if(paraMap_IS_MULT_TABLE_1.checked && val.isBlank(paraMap_COL_SQL)){
   		_alertValMsg(paraMap_COL_SQL,"<dict:lang value="多表模型SQL语句" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}*/
   	
		var paraMapORMID = document.getElementById("paraMap_ORMID");
   	if(val.isBlank(paraMapORMID)){
   		_alertValMsg(paraMapORMID,"<dict:lang value="关联持久模型" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
		return true;
	}
	
	function init(){
		//$(".chosen-select").chosen();
		
		if($("#paraMap_IS_MULT_TABLE_1").attr("checked")){
			$("#COL_SQL＿TR").show();
			$("#ORMID_TR").hide();
		}else{
			$("#COL_SQL＿TR").hide();
			$("#ORMID_TR").show();			
		}
		
	}
	
	$("#COL_SQL＿TR").hide();
	
	$("#paraMap_IS_MULT_TABLE_1").click(function(){
		if(this.checked){
			$("#COL_SQL＿TR").show();
			$("#ORMID_TR").hide();
		}else{
			$("#COL_SQL＿TR").hide();
			$("#ORMID_TR").show();
		}
	});
	$(function(){
		setChosen();
		//$("#paraMap_FORM_COL_ID_D").chosen();
	});
	
	$(function(){
		layui.use('form', function(){
	    	form = layui.form;
	    	form.render();
	    	  
           	form.on('submit(filterSubmit)', function (data) {
           		document.getElementById("curIframeName").value=window.frameElement.name;
           		/*
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
		       */
		   /*  if(!val.valDataBaseSetData()){
				return false;
			} */
		       return true;
				       
			}) 
			
			 form.verify({
		   		formname_Verify: function(value,item){
					    var paraMapFORMNAME = document.getElementById("paraMap_FORM_NAME");
					   	if(val.isBlank(paraMapFORMNAME)){
					   		return "表单模型名称不能为空";
					   	}
				}
		     });
		     
		     form.verify({
		   		ormidVerify: function(value,item){
					     var paraMapORMID = document.getElementById("paraMap_ORMID");
					   	if(val.isBlank(paraMapORMID)){
					   		return "关联持久模型不能为空";
					   	}
				}
		     });
			
	    });
	    
	})
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>