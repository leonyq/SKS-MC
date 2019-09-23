<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="操作功能配置" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
	<style>
table,td {
	border-collapse: collapse;
}

.ellipsis_span {
	display: block;
	width: 200px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

._edit {
	display: none;
}
.new_func_table{
	width: 99%;
    /* color: #116dae; */
    /* border: solid 1px #a8c7ce; */
    margin-bottom: 15px;
    /* background-color: #ebf2f9; */
    height: 21px;
    line-height: 21px;
}
.ico-search-input {
		background: url(plf/page/fp/img/ico-search-h-c.png?_mc_res_version=<%=PlfStaticRes.ICO_SEARCH_H_C_PNG%>) no-repeat right;
		cursor: pointer;
		left: 230px;
		top: 6px; 
		height:21px;
		border: 1px solid #A9A9A9;
	}
</style>
</head>
<body>
	<div class="all">
		<table class="new_func_table">
			<tr>
				<td width="100%" align="right">
					<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="layui-btn">
					<input type="button" value="<dict:lang value="新增" />" onclick="add();" class="layui-btn">
					<input type="reset" value="<dict:lang value="重置" />" onclick="reset();" class="layui-btn layui-btn-primary"/>
					<input type="button" value="<dict:lang value="删除" />" onclick="del();" class="layui-btn layui-btn-danger">
					<input type="button" value="<dict:lang value="发布" />" onclick="publish('<s:property value="paraMap.ID" />');" class="layui-btn layui-btn-normal">
				</td>
			</tr>
		</table>

		<div>
			<form id="editForm" name="editForm" action="${path}sys/BussModelAction_cfgFunc.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.MID" />
				<s:hidden name="paraMap.VIEW_ID" value="paraMap.ID" />
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="">
				<div class="table_div">
				<table id="editTable" class="table_list mc-list-input-edit">
					<thead>
					<tr>
						<th style="width: 40px;">
							<input type="checkbox" onclick="selectAll(this);" />
						</th>
						<th style="width: 40px;" >
							<dict:lang value="序号" />
						</th>
						<th  style="width: 140px;">
							<dict:lang value="功能模型ID" />
						</th>
						<th  style="width: 100px;">
							<dict:lang value="功能模型名称" />
						</th>
						<th style="width: 60px;">
							<dict:lang value="显示" />
						</th>
						<th style="width: 60px;">
							<dict:lang value="显示顺序" />
						</th>
						<th style="width: 70px;">
							<dict:lang value="功能类型" />
						</th>
						<th style="width: 240px;">
							<dict:lang value="JS方法调用名称" />
						</th>
						<th style="width: 240px;">
							<dict:lang value="JS方法体" />
						</th>
						<th style="width: 240px;" title="<dict:lang value='样式表' />">
							<dict:lang value="功能图标" />
						</th>
						<th style="width: 240px;">
							<dict:lang value="按钮样式属性" />
						</th>
						<th style="width: 240px;">
							<dict:lang value="按钮样式表" />
						</th>
						<th style="width: 240px;">
							<dict:lang value="成功提示信息" />
						</th>
						<%-- 
						<th width="10%">
							<dict:lang value="执行SQL" />
						</th>--%>
						<th style="width: 400px;">
							<dict:lang value="自定义类" />
						</th>
						<th style="width: 60px;">
							<dict:lang value="类源码" />
						</th>
						<th style="width: 240px;">
							<dict:lang value="操作页面" />
						</th>
					</tr>
					</thead>
					<tbody>
					<s:iterator value="listData" status="index">
						<tr>
							<td class="_noedit">
								<input type="checkbox" name="paramList[<s:property value="#index.index"/>].ID" value="<s:property value="ID"/>"
									class="isSubmit" />
							</td>
							<td class="_noedit">
								<span><s:property value="#index.count" /></span>
							</td>
							<td title="<s:property value="ID" />" class="_noedit">
								<s:property value="ID" /></div>
							</td>
							<td >
								<span class="_show"><s:property value="ACT_NAME" /> </span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].ACT_NAME"
										value="<s:property value="ACT_NAME"/>" class="_VAL_NULL mc-list-input-edit"  onchange="setModify(this);" /></span>
							</td>
							<td>
								<span class="_show"><dict:viewDict dictCode="YESNO" dictValue="%{IS_SHOW}" /></span>
								<span class="_edit">
									<dict:selectDict dictCode="YESNO" dictValue="%{IS_SHOW}" name="paramList[${index.index}].IS_SHOW"
									custom_option="<option value=''>%{getText('--请选择--')}</option>" cssClass='mc-list-input-edit' onchange="setModify(this);"  />
								</span>
							</td>
							<td>
								<span class="_show"><s:property value="SHOW_ORDER" /></span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].SHOW_ORDER"
										value="<s:property value="SHOW_ORDER"/>" class="_VAL_NULL mc-list-input-edit" 
										onchange="this.value=this.value.replace(/[^1-9]/gi,'');setModify(this);" maxlength="3" /></span>
							</td>
							<td>
								<span class="_show"><dict:viewDict dictCode="FUNC_BUTTON_TYPE" dictValue="%{TYPE}" /></span>
								<span class="_edit"><!-- <input type="text" name="paramList[<s:property value="#index.index"/>].TYPE"
										value="<s:property value="TYPE" />" onchange="setModify(this);" />-->
									<dict:selectDict dictCode="FUNC_BUTTON_TYPE" dictValue="%{TYPE}" name="paramList[${index.index}].TYPE"
									custom_option="<option value=''>%{getText('--请选择--')}</option>" cssClass='mc-list-input-edit' onchange="setModify(this);"  />								
								</span>
							</td>
								<td>
									<span class="_show"><s:property value="JS_NAME" /></span>
									<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].JS_NAME"
											value="<s:property value="JS_NAME" />" class='mc-list-input-edit' onchange="setModify(this);" /></span>
								</td>							
						<!-- <s:if test="JS_NAME!='add()' && JS_NAME!='edit()' && JS_NAME!='del()'">
								<td>
									<span class="_show"><s:property value="JS_NAME" /></span>
									<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].JS_NAME"
											value="<s:property value="JS_NAME" />" onchange="setModify(this);" /></span>
								</td>
							</s:if>
							<s:else>
								<td class="_noedit">
									<span title="<dict:lang value="系统方法名，不允许修改" />"><s:property value="JS_NAME" /></span>
								</td>
							</s:else>	-->									
							
							<td class="_noedit">
								<span class="_edit ellipsis_span"></span>
								<span class="_show"><textarea name="paramList[<s:property value="#index.index"/>].JS_FUNC" rows="2" title="<dict:lang value="双击弹出编辑窗口" />"
										style="width: 100%;" onchange="setModify(this);"  ondblclick="editJsValFun(this);"><s:property value="JS_FUNC" /></textarea></span>
							</td>
							<td>
								<span class="_show"><s:property value="ICO_CLASS" /></span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].ICO_CLASS"
										value="<s:property value="ICO_CLASS" />" class='mc-list-input-edit' onchange="setModify(this);" /></span>
							</td>							
							<td>
								<span class="_show"><s:property value="CSS_STYLE" /></span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].CSS_STYLE"
										value="<s:property value="CSS_STYLE" />" class='mc-list-input-edit' onchange="setModify(this);" /></span>
							</td>
							<td>
								<span class="_show"><s:property value="CSS_CLASS" /></span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].CSS_CLASS"
										value="<s:property value="CSS_CLASS" />" class='mc-list-input-edit' onchange="setModify(this);" /></span>
							</td>
							<td>
								<span class="_show"><s:property value="DEFINED_MSG" /></span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].DEFINED_MSG"
										value="<s:property value="DEFINED_MSG" />" class="_VAL_NULL2 mc-list-input-edit" onchange="setModify(this);" /></span>
							</td>
							<%-- 
							<td class="_noedit">
								<span class="_edit ellipsis_span"></span>
								<span class="_show"><textarea name="paramList[<s:property value="#index.index"/>].SQL" rows="2" title="<dict:lang value="双击弹出编辑窗口" />"
										style="width: 100%;" onchange="setModify(this);" ondblclick="editSql(this);"><s:property value="SQL" /></textarea></span>
							</td>--%>
							<td class="_noedit" style="word-break:break-all;overflow: hidden">
								<span class="_show" id="CLASS_NAME_TEXT_<s:property value="#index.index"/>"><s:property value="CLASS_NAME" /></span>
							</td>
							<td style="text-align: center;padding-left: 3px;" class="cursor_hand">
								<span class="_show"><dict:lang value="源码" /></span>
								<span class="_edit"><input type="button" name="paramList[<s:property value="#index.index"/>].MS_CLASS_CODE_ID"  class='layui-btn layui-btn-sm'
									onclick="showEditCode('<s:property value="MS_CLASS_CODE_ID" />','CLASS_NAME_TEXT_<s:property value="#index.index"/>','<s:property value="ID" />');" value="<dict:lang value="编辑" />" /></span>								
							</td>
							<td style="padding: 0 !important;">
												 
									 
					   <div id="paraMap_SEARCH_UI_div" style="width: 100%;height: 43px;" class="layui-input-inline">
							<input id="paraMap_JSP_VIEW_ID_<s:property value="#index.index"/>"								 
								 value="<s:property value="JSP_VIEW_ID"/>"
							 class="paraMap_JSP_VIEW_ID" type="hidden" name="paramList[<s:property value="#index.index"/>].JSP_VIEW_ID" />
							 
							<input id="paraMap_VIEW_CODE_<s:property value="#index.index"/>"								 
								 value="<s:property value="FUNC_ID"/>"
							 class="paraMap_JSP_VIEW_CODE" type="hidden" name="paramList[<s:property value="#index.index"/>].FUNC_ID" />
							 
							<input id="paraMap_VIEW_NAME_<s:property value="#index.index"/>"								   
									 value="<s:property value="VIEW_NAME"/>" title="<c:out value='${whoPath}' />" 								 
							 readonly="readonly"  style="height: 100%;width:100%;border: none;padding-right:50px;" />	
							<span>	
                  		  <i class="layui-icon layui-icon-search" onclick="getViewId('paraMap_JSP_VIEW_ID_<s:property value="#index.index"/>','paraMap_VIEW_NAME_<s:property value="#index.index"/>','paraMap_VIEW_CODE_<s:property value="#index.index"/>')" style="position: absolute;right: 30px;top: 9px;"></i>
                  		   <i class="layui-icon layui-icon-close-fill" onclick="clearData('paraMap_JSP_VIEW_ID_<s:property value="#index.index"/>','paraMap_VIEW_NAME_<s:property value="#index.index"/>','paraMap_VIEW_CODE_<s:property value="#index.index"/>',this);" style="position: absolute;right: 8px;top: 9px;cursor: pointer;"></i>
                  		  </span> 	
               			 </div>
               			 <%--
									 
							<span style="width: 10%;"><img src="plf/page/fp/img/ico-search-h-c.png?_mc_res_version=<%=PlfStaticRes.ICO_SEARCH_H_C_PNG %>" style="cursor: pointer;margin-top: -2px;" onclick="getViewId('paraMap_JSP_VIEW_ID_<s:property value="#index.index"/>','paraMap_VIEW_NAME_<s:property value="#index.index"/>','paraMap_VIEW_CODE_<s:property value="#index.index"/>')"></span>
						    <span style="width: 10%;"><img src="plf/page/fp/img/ico-tab-close-h.png?_mc_res_version=<%=PlfStaticRes.ICO_TAB_CLOSE_H_PNG %>" onclick="clearData('paraMap_JSP_VIEW_ID_<s:property value="#index.index"/>','paraMap_VIEW_NAME_<s:property value="#index.index"/>','paraMap_VIEW_CODE_<s:property value="#index.index"/>',this);" style="cursor: pointer;width: 12px;margin-top: -3px"></span>
								
								
								
								--%><%--<span class="_show">
									<s:iterator value="dataMuMap.listView" status="index2">
										<s:if test="ID == JSP_VIEW_ID"><s:property value="VIEW_NAME"/></s:if>
									</s:iterator>
								</span>
								<span class="_edit">
								
								
									<s:select  id="paraMap_JSP_VIEW_ID" name="paramList[%{#index.index}].JSP_VIEW_ID" 
									onchange="setModify(this);" list="dataMuMap.listView" listKey="ID" listValue="VIEW_NAME" headerKey="" 
									headerValue="%{getText('-请选择-')}" value="JSP_VIEW_ID" />
								</span>
							--%></td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
				</div>
			</form>
		</div>
	</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.id" />
		<s:hidden name="paraMap.VIEWID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	inputFocus();
	function getViewId(viewId,viewNameId,viewCode){
		var funcid = $("#"+viewCode).val();
		var trId = $("#"+viewId).parents("tr").find("input[type='checkbox']").val();
		var funcType=$("#"+viewId).parents("tr").find("td").eq(6).find("select").val();
		//alertInfo(funcType)
		if(funcType==13)//工作流
		{
		 var url = "${path}sys/BussModelAction_flowListView.ms?paraMap.viewId="+viewId+"&paraMap.viewNameId="+viewNameId+"&paraMap.trId="+trId+"&paraMap.viewCode="+viewCode+"&paraMap.funcId="+funcid+"&mcIframeName="+window.frameElement.name;
		 showPopWin(url, 900, 550,null,"<dict:lang value="工作流"/>");
		 return false;
		}
		
	
		var url = "${path}sys/BussModelAction_viewModelFrameSet.ms?paraMap.viewId="+viewId+"&paraMap.viewNameId="+viewNameId+"&paraMap.trId="+trId+"&paraMap.viewCode="+viewCode+"&paraMap.funcId="+funcid+"&mcIframeName="+window.frameElement.name;
		
		showPopWin(url, 1000, 550,null,"<dict:lang value="视图类型"/>");
	}
	
	
	//按钮发布
	function publish(viewId){
		
		var finded = 0;
		var funcMId = "";
		var funcName = "";
		var funcType = "";
		var funcUrl = "";
		var JSP_VIEW_ID = "";
		
		editTable.find("tbody tr").each(function(seq) {
			if($(this).find("td").eq(0).find("input[type='checkbox']").prop("checked")){
				finded ++;
				funcMId = $.trim($($(this).find("td").eq(2)).text());
				funcName = $.trim($($(this).find("td").eq(3)).text());
				funcType = $($(this).find("td").eq(6)).find("select").val();
				JSP_VIEW_ID = $($(this).find("td").eq(15)).find(".paraMap_JSP_VIEW_ID").val();
			}
		});
		if("" != JSP_VIEW_ID){
			viewId=JSP_VIEW_ID;
		}
		/*editTable.find("tbody tr td input[type='checkbox']:checked").each(function(seq) {
			finded ++;
			funcMId = $(this).val();
		});	*/
		
		if(finded == 0 || finded > 1){
			util.alert("<dict:lang value="请勾选一条记录" />");
			return;
		}
		
		if(JSP_VIEW_ID != ""){
			funcUrl = "buss/bussModel_exeFunc.ms";
		}else{
			if(funcType == "5"){
				funcUrl = "buss/bussModel_forAddComm.ms";
			}else if(funcType == "6"){
				funcUrl = "buss/bussModel_forEditComm.ms";
			}else if(funcType == "7"){
				funcUrl = "buss/bussModel_delComm.ms";
			}else if(funcType == "10"){
				funcUrl = "sys/excel/ExcelAction_ImportPage.ms";
			}else if(funcType == "11"){
				funcUrl = "sys/excel/ExcelAction_ExportPage.ms";
			}
			else{
				funcUrl = "buss/bussModel_exeFunc.ms";
			}
		}
		
		if(""!=funcName){
			funcName = encodeURI(funcName);
		}
		
		var url = encodeURI("${path}sys/FuncAction_showAddPublishFuncButton.ms?funcDto.viewId="+viewId+"&funcDto.funcMId="+funcMId+"&funcDto.name="+funcName+"&funcDto.url="+funcUrl+"&jspViewId="+JSP_VIEW_ID+"&mcIframeName="+window.frameElement.name);
      	showPopWin(url, 1000, 500,null,"<dict:lang value="发布" />");
	}
	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		if("" != msg){
			util.alert(msg);
		}
		window.location.href = "${path}sys/BussModelAction_showCfgFunc.ms?paraMap.ID=<s:property value="paraMap.ID" />&mcIframeName="+window.frameElement.name;
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(){
		var url = "${path}sys/BussModelAction_forAddFunc.ms?paraMap.ID=<s:property value="paraMap.ID" />&mcIframeName="+window.frameElement.name;
    showPopWin(url, 1000, 500,null,"<dict:lang value="新增" />");
	}
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		if(!valData2()){
			return ;
		}
		isSubmit = true;
		$("#mcIframeName").val(window.frameElement.name);
		document.forms.editForm.submit();
	}
	
	function reset() {
		$(".paraMap_JSP_VIEW_ID").val("");
		document.forms.editForm.reset();
	}
	
	function clearData(viewId,viewNameId,viewCode,thisObj){
		$("#"+viewId).val("");
		$("#"+viewNameId).val("");
		$("#"+viewCode).val("");
		$(thisObj).parents("tr").find("td").eq(0).find("input[type='checkbox']").prop("checked","checked");
	}
	
	function selectAll(thisObj){
		editTable.find("tbody tr").each(function(seq) {
			$(this).find("td").eq(0).find("input[type='checkbox']").prop("checked",$(thisObj).prop("checked"));
		});
	}
		
	var curJsFunObj;	
	function getJsFunCode(){
		return curJsFunObj.value;
	}
	
	function setJsFunCode(code){
		curJsFunObj.value = code;
		setModify(curJsFunObj);
	}
	
	function setJsFunObjFoucue(){
		curJsFunObj.focus();
	}
	
	function editJsValFun(thisObj){
		curJsFunObj = thisObj;
		var url = "${path}sys/BussModelAction_forEditJsValFun.ms?mcIframeName="+window.frameElement.name;;
		showPopWin(url, '99%', '99%',null,"<dict:lang value="JS方法体"/>");
	}
	
	function editSql(thisObj){
		curJsFunObj = thisObj;
		var url = "${path}sys/BussModelAction_forEditJsValFun.ms?";
		showPopWin(url, 1000, 480,null,"<dict:lang value="执行SQL"/>");
	}
	
	function editJavaCode(thisObj){
		curJsFunObj = thisObj;
		var url = "${path}sys/BussModelAction_forEditJsValFun.ms?";
		showPopWin(url, 1000, 500,null,"<dict:lang value="类源码"/>");
	}
	
	<%-- 数据修改时选中所修改的行 --%>
	function setModify(thisObj){
		$(thisObj).parent().parent().parent().find("td").eq(0).find("input[type='checkbox']").prop("checked",true);
	}
		
	var delId = "";
	function del(){
		if(checkSelected()){
			util.confirm(delConfirm,"<dict:lang value="确定要删除选中的数据" />");
		}else{
			util.alert("<dict:lang value="请至少勾选一条记录" />");
		}
	}
	
	function delConfirm(){
		if(delRow()){
	    document.forms.submitForm.action="${path}sys/BussModelAction_delFunc.ms?mcIframeName="+window.frameElement.name;
			$("#del_id").val(delId);
			document.forms.submitForm.submit();
		}
	}
	
	<%-- 检查是否有选中记录 --%>
	function checkSelected(){
		var finded = false;
		editTable.find("tbody tr").each(function(seq) {
			if($(this).find("td").eq(0).find("input[type='checkbox']").prop("checked")){
				finded = true;
				return true;
			}
		});
		return finded;
	}
	
	<%-- 删除数据 --%>
	function delRow(){
		var delIds="";
		editTable.find("tbody tr td input[type='checkbox']:checked").each(function(seq) {
			removeAdd = true;
			delIds+=$(this).val();
			delIds+=",";
		});
		if(""==delIds){
			util.alert("<dict:lang value="未选择记录行" />");
			return false;
		}
		delId = delIds;
		return true;
	}
        
	function valData(){
	  var pass = true;
   	$("._VAL_NULL").each(function(seq) {
	   	if(val.isBlank(this)){
	   		$(this).parent().parent().click();
	   		_alertValMsg(this,"该项 -- <dict:lang value="不能为空" />");
	   		pass = false;
	   		return false;
	   	}else{
	   		if(this.value.indexOf("'")!=-1 || this.value.indexOf('"')!=-1 || this.value.indexOf('<')!=-1 || this.value.indexOf('>')!=-1 || this.value.indexOf('?')!=-1){
		      this.value = this.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\?/g,"");
		     
		      $(this).parent().parent().click();
		       _alertValMsg(this,"该项 -- <dict:lang value="不能输入单引号双引号<>?" />");
	   		  pass = false;
	   		  return false;
	   		  
		    }
	   	}   		
   	});
    
		return pass;
	}
	
	
	function valData2(){
	  var pass = true;

   	$("._VAL_NULL2").each(function(seq) {
	   	if(!val.isBlank(this)){
	   		if(this.value.indexOf("'")!=-1 || this.value.indexOf('"')!=-1 || this.value.indexOf('<')!=-1 || this.value.indexOf('>')!=-1 || this.value.indexOf('?')!=-1){
		      this.value = this.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\?/g,"");
		     
		      $(this).parent().parent().click();
		       _alertValMsg(this,"该项 -- <dict:lang value="不能输入单引号双引号<>?" />");
	   		  pass = false;
	   		  return false;
	   		  
		    }
		    
	   	}  		
   	});
    
		return pass;
	}
	
	function showEditCode(codeId,CLASS_NAME_TEXT_ID,OWNER_ID){
		var OWNER_TYPE = "<s:property value='@com.more.fw.core.common.method.ConstantsMc@FUN_REL_CODE_FUNC' />";
		var tableName = "MS_FUNC_MODEL";
		var colName = "MS_CLASS_CODE_ID";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.CLASS_NAME_TEXT_ID="
				+CLASS_NAME_TEXT_ID+"&paraMap.OWNER_ID="+OWNER_ID+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName+"&paraMap.tpl=editSuperCodeChild&mcIframeName="+window.frameElement.name+"&module=editView";
		showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
	}
	
	function updateCLASS_NAME_TEXT(id,txt){
		//$("#"+id).html(txt);
		reloadPg("");
	}

	var editTable;
	function init(){
		editTable =  $("#editTable");
		var tableTrJq =editTable.find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
	}

</script>

	<script>
<%-- 
$(function(){
    //找到所有的td节点  
    var tds=$("#editTable td");  
    //给所有的td添加点击事件  
    tds.click(function(){
        //获得当前点击的对象  
        var td=$(this);
        if(null != td.attr("class") && td.attr("class").indexOf("_noedit")>-1){
        	return ;
        }
        var showObj= td.find("._show");//-- 显示部分
        var editObj= td.find("._edit");//-- 数据部分
        var formObj= editObj.children();//-- 数据提交部分
        if(showObj.css("display") == "none"){
        	return;
        }
        //取出当前td的文本内容保存起来  
        var oldText=showObj.text();
        formObj.width("90%");
        showObj.hide();
        editObj.show();
        //当文本框得到焦点时触发全选事件    
        formObj.trigger("focus");
        formObj.select();
        //当文本框失去焦点时重新变为文本
        formObj.blur(function(){
            //保存当前文本框的内容
		        editObj.hide();
            showObj.html(formObj.val());
		        showObj.show();
        });   
        //响应键盘事件
        formObj.keyup(function(event){
            // 获取键值  
            var keyEvent=event || window.event;  
            var key=keyEvent.keyCode;  
            //获得当前对象  
            var input_blur=$(this);  
            switch(key)  
            {  
                case 13://按下回车键，保存当前文本框的内容  
				        editObj.hide();
		            showObj.html(formObj.val());
				        showObj.show();
                break;  
                  
                case 27://按下esc键，取消修改，把文本框变成文本  
				        editObj.hide();
		            showObj.html(oldText);
				        showObj.show();
                break;  
            }  
        });  
    });  
});
 --%>
	<%-- 用下面新的方式 --%>
 	$(function(){  
 		util.setEditTable("editTable");
 		window.alert=function(){};//禁用alert
 	});
 
</script>
<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
	<jsp:param name="needValidate" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>