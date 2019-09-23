<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="列表显示查询条件" /></title>
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

.new_func_table{
	width: 99%;
    /* color: #116dae; */
    /* border: solid 1px #a8c7ce; */
    margin-bottom: 15px;
    /* background-color: #ebf2f9; */
    height: 21px;
    line-height: 21px;
}

._edit {
	display: none;
}



</style>
</head>
<body>
	<div>
		<table class="new_func_table">
			<tr>
				<td width="100%" align="right">
					<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="layui-btn">
					<input type="button" value="<dict:lang value="新增" />" onclick="add();" class="layui-btn">
						<input type="reset" value="<dict:lang value="重置" />" onclick="reset();" class="layui-btn layui-btn-primary" />
					<input type="button" value="<dict:lang value="删除" />" onclick="del(this);" class="layui-btn layui-btn-danger">
				</td>
			</tr>
		</table>

		<div class="table_div">
			<form id="editForm" name="editForm" action="${path}sys/BussModelAction_editSearch.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.MID" />
				<s:hidden name="paraMap.VIEW_ID" value="paraMap.ID" />
				  <input type="hidden" name="mcIframeName" id="mcIframeName" value="">
				<table id="editTable" class="table_list mc-list-input-edit">
					<thead>
					<tr>
						<th style="width: 40px;">
							<input type="checkbox" onclick="selectAll(this);" />
						</th>
						<th style="width: 40px;">
							<dict:lang value="序号" />
						</th>
						<th style="width: 124px;">
							<dict:lang value="条件名称" />
						</th>
						<th style="width: 160px;">
							<dict:lang value="条件字段" />
						</th>
						<th style="width: 65px;">
							<dict:lang value="条件符号" />
						</th>
						<th style="width: 58px;">
							<dict:lang value="关联符号" />
						</th>
						<th style="width: 80px;">
							<dict:lang value="条件UI" />
						</th>
						<th style="width: 58px;">
							<dict:lang value="显示顺序" />
						</th>
						<th style="width: 80px;">
							<dict:lang value="样式属性" />
						</th>
						<th style="width: 80px;">
							<dict:lang value="样式表" />
						</th>
						<th>
							<dict:lang value="方法事件" />
						</th>
						<th style="width: 35px;">
							<dict:lang value="操作" />
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
							<td title="<s:property value="TITLE_NAME" />" class="_noedit">
								<span class="_show"><s:property value="TITLE_NAME" /> </span>
							</td>
							<td title="<s:property value="COL_NO" />" class="_noedit">
								<span class="_show"><s:property value="COL_NO" /> </span>
							</td>
							<td title="<s:property value="SEARCH_COM" />" >
						
								<input class="hiddenSearch" type="hidden" name="paramList[<s:property value="#index.index"/>].SEARCH_COM" id="ESCAPE_SEARCH_COM<s:property value="#index.index"/>"  value="<s:property value="SEARCH_COM"/>" /> 
								<span class="_show"><dict:viewDict dictCode="SEARCH_COM" dictValue="%{SEARCH_COM}"/></span>
								<span class="_edit ESCAPE_SEARCH"><dict:selectDict dictCode="SEARCH_COM" cssClass="mc-list-input-edit" dictValue="%{SEARCH_COM}" id="paraMap_SEARCH_COM"
									 onchange="setModify(this);SearchComModify(this,'%{#index.index}');" style="width:99%;" /></span>
							</td>
							<td>
								<span class="_show"><dict:viewDict dictCode="SEARCH_REL" dictValue="%{SEARCH_REL}"/></span>
								<span class="_edit"><dict:selectDict dictCode="SEARCH_REL" dictValue="%{SEARCH_REL}" id="paraMap_SEARCH_REL"
									name="paramList[%{#index.index}].SEARCH_REL" cssClass="mc-list-input-edit" onchange="setModify(this);" style="width:99%;" /></span>
							</td>
							<td>
								<span class="_show"><s:property value="UI_NAME" /> </span>
								<!-- <span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].SEARCH_UI"
										value="<s:property value="SEARCH_UI" />" onchange="setModify(this);" /> </span> -->
							</td>
							<td>
								<span class="_show"><s:property value="SHOW_ORDER" /> </span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].SHOW_ORDER"
										value="<s:property value="SHOW_ORDER" />"  
										onkeyup="this.value=this.value.replace(/[^1-9]/gi,'');setModify(this);" class="mc-list-input-edit" maxlength="3" /> </span>
							</td>
							<td>
								<span class="_show"><s:property value="SH_UI_SYTLE" /> </span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].SH_UI_SYTLE"
										value="<s:property value="SH_UI_SYTLE" />" class="mc-list-input-edit" onchange="setModify(this);" /> </span>
							</td>
							<td>
								<span class="_show"><s:property value="SH_UI_CLASS" /> </span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].SH_UI_CLASS"
										value="<s:property value="SH_UI_CLASS" />" class="mc-list-input-edit" onchange="setModify(this);" /> </span>
							</td>
							<td>
								<span class="_show"><s:property value="SH_UI_FUN" /> </span>
								<span class="_edit"><input type="text" name="paramList[<s:property value="#index.index"/>].SH_UI_FUN"
										value="<s:property value="SH_UI_FUN" />" class="mc-list-input-edit" onchange="setModify(this);" /> </span>
							</td>
							<td class="_noedit">
								<span class="_show"><a href="javascript:void(0);" class='layui-btn layui-btn-xs' onclick="update('<c:out value="${COLID}" />','<c:out value="${ID}" />','<c:out value="${TITLE_NAME }" />','<c:out value="${UI_NAME}" />');">修改</a></span>
							</td>
								
							
						</tr>
					</s:iterator>
					</tbody>
				</table>
				
				<!-- //持久模型添加子表单增加数据过滤 -->
				<input type="hidden"  name="paraMap.VIEWID" value="<s:property value='dataMap.VIEWID'/>"
				</br></br></br>
				<table id="editTable" class="table_list">
					<tr id="UI_DATA_3">
		            <td width="18%" class="tr1" >
		              <dict:lang value="传参函数名称" />
		            </td>
		            <td width="80%">
		              <input type="text" id="paraMap_FUNCNAME" style="width: 100%" class="layui-input" name="paraMap.FUNCNAME" value="<s:property value="dataMap.FUNCNAME"/>" />
		            </td>
		          </tr>
		          <tr id="UI_DATA_4" style="background-color: #FFFFFF">
		            <td width="18%"  class="tr1" >
		              <dict:lang value="传参函数体" />
		            </td>
		            <td width="80%">
		              <textarea id="paraMap_FUNCBODY" style="height: 200px;" class="layui-textarea" name="paraMap.FUNCBODY" ><s:property value="dataMap.FUNCBODY"/></textarea>
		              
		              
		              
		              
		              <blockquote class="layui-elem-quote" style="margin-top: 10px;">
              <div style="text-align:left" id="test-util-countdown-ret">	<span style='color:red;'>例如：</span></br>
		              	function ajax_crmfunc(){</br>
						var mc_crm_username=$("#MC_CRM_USERNAME").val();</br>
						var mc_crm_usertype=$("#MC_CRM_USERTYPE").val();</br>
						return '{"MC_CRM_USERNAME":"'+mc_crm_username+'","MC_CRM_USERTYPE":"'+mc_crm_usertype+'"}';</br>
						}</br></div>
            </blockquote>
		              
		            </td>
		          </tr>
		          
				</table>
				
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
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		util.alert(msg);
		window.location.href = "${path}sys/BussModelAction_listSearch.ms?paraMap.VIEWID=<s:property value="paraMap.VIEWID" />";
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(){
		var url = "${path}sys/BussModelAction_forAddSearch.ms?paraMap.VIEWID=<s:property value="paraMap.VIEWID" />&mcIframeName="+window.frameElement.name;
    showPopWin(url, 900, 500,null,"<dict:lang value="新增" />");
	}
	
	function update(thisColid,thisView,thisName,thisUiName){
	
	 var url = "${path}sys/BussModelAction_forEditSearch.ms?paraMap.VIEWID=<s:property value="paraMap.VIEWID" />&paraMap.ID="+thisView+"&paraMap.COLID="+thisColid+"&paraMap.NAME="+thisName+"&paraMap.UI_NAME="+thisUiName+"&mcIframeName="+window.frameElement.name;
    showPopWin(url, 900, 500,null,"<dict:lang value="修改" />");
	}
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		isSubmit = true;
		$("#mcIframeName").val(window.frameElement.name);
		//document.forms.submitForm.action="${path}sys/BussModelAction_editSearch.ms?mcIframeName="+window.frameElement.name;
		document.forms.editForm.submit();
	}
	
	function reset() {
		document.forms.editForm.reset();
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
		var url = "${path}sys/BussModelAction_forEditJsValFun.ms?";
		showPopWin(url, 800, 480,null,"<dict:lang value="JS方法体"/>");
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
	    document.forms.submitForm.action="${path}sys/BussModelAction_delSearch.ms?mcIframeName="+window.frameElement.name;
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
	   		_alertValMsg(this,"<dict:lang value="功能模型名称" /> -- <dict:lang value="不能为空" />");
	   		pass = false;
	   		return false;
	   	}   		
   	});
    
		return pass;
	}

	var editTable;
	function init(){
		editTable =  $("#editTable");
		var tableTrJq =editTable.find("tbody tr");
		_toClickColor(tableTrJq);
		_tongLineColor(tableTrJq);
		
		$(".hiddenSearch").each(function(){
			 var langs = _mcBase64JsToJava.getMcDealBase64Encode($(this).val());
			 $(this).val(langs);
		});
	}

	//条件符号修改（转义赋值）
	function SearchComModify(ObjThis,index){
	 var langs = _mcBase64JsToJava.getMcDealBase64Encode(ObjThis.value);
	 $("#ESCAPE_SEARCH_COM"+index).val(langs);
	}

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