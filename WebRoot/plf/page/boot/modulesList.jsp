<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模块管理" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
				<jsp:param name="zTree" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/moduleMagAction_queryModuleList.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							 <div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="模块名称" /></div>
								<div class ="search_value">
								<s:textfield id="nameSh" name="paraMap.nameSh" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="queryDate(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
			<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
				<s:hidden name="paraMap.MODELS_ID" id="MODELS_ID"></s:hidden>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:hidden id="MODEL_NAME" name="paraMap.MODEL_NAME"></s:hidden>
				<s:hidden id="MODELS_SHOW_NAME" name="paraMap.MODELS_SHOW_NAME"></s:hidden>
				<s:hidden id="MODELS_VERSION" name="paraMap.MODELS_VERSION"></s:hidden>
				<s:hidden id="MODELS_NAME" name="paraMap.MODELS_NAME"></s:hidden>
				<s:textarea id="MODELS_MEMO" name="paraMap.MODELS_MEMO"  cssStyle="display:none;word-wrap: normal;" wrap="off"></s:textarea>
				<s:hidden id="codeType" name="paraMap.paraCodeType"/>
				<s:hidden id="paraCodeId" name="paraMap.paraCodeId"/>
				<s:hidden id="className" name="paraMap.paraCodeName"/>
				<s:textarea id="classCode" name="paraMap.paraClsCode" value="%{paraMap.paraClsCode}" cssStyle="display:none;word-wrap: normal;" wrap="off"/>
			</form>
    <table id="listTable" style="table-layout: fixed;"  width="1000px" class="table_list">
		<thead>
		<tr class="tdcolor">
			<th style="width:30px;text-align:center;"><input type="checkbox" id="selectAll"  style="margin:0"></th>
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="110px"><dict:lang value="模块名称" /></th>
			<th width="110px"><dict:lang value="模块展示名" /></th>
			<th width="110px"><dict:lang value="模块版本号" /></th>
			<th width="110px"><dict:lang value="模块说明" /></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="moduleDtoList" id="configPage" status="index">
		<tr id="<s:property value="ID"/>">
			<td style="width:30px;text-align:center;"><input type="checkbox" name="checkbox" id="subcheck" value="<c:out value='${id}'/>"  style="margin:0"></td>
			<td><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="name"/>><s:property value="name"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="showName"/>><s:property value="showName"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="version"/>><s:property value="version"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="memo"/>><s:property value="memo"/></td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
		<div class="ptop_10 txac">
			<input id="upButton" type="button" value="<dict:lang value="上一步" />" onclick="up(this);" class="botton_img_add">
			<input id="saveButton"type="button" value="<dict:lang value="提交" />"  onclick="save(this);" class="botton_img_add">
		</div>
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
		<form id="addModules"  method="post" >
				
		</form>
		<div style="display: none;">
			<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
		</div>
</div>
<script type="text/javascript">
	$(function(){
		var modulesId=$("#MODELS_ID").val();
		if(modulesId!=""){
			var obj = document.getElementsByName('checkbox');
			var mid=modulesId.split(",");
			for(var j=0;j<mid.length;j++){
				for(var i = 0; i < obj.length; i++)
				{
					if(obj[i].value==mid[j])
					{
						obj[i].checked=true;
					}
				}
			}
		};
		
	})
	function save(){
		var obj = document.getElementsByName('checkbox');
		var ids = "";
		
		for(var i = 0; i < obj.length; i++)
		{
			if(obj[i].checked)
			{
				ids += obj[i].value + ',';
			}
		}
		if (ids == '')
		{
			util.alert("<dict:lang value="请选择至少一条记录"/>");
		}
		$("#MODELS_ID").val(ids);
		var MODEL_ID=$("#MODEL_ID").val();
		if(MODEL_ID!=null&&MODEL_ID!=""){
			document.getElementById("searchForm").action="${path}sys/moduleMagAction_modifyModules.ms";
		}else{
			document.getElementById("searchForm").action="${path}sys/moduleMagAction_addModules.ms"
		}
		document.forms.searchForm.submit();
	}
	$("#selectAll").click(function(){
		if($(this).is(":checked"))
		{
			$("[name=checkbox]:checkbox").attr("checked",true);
		}
		else
		{
			$("[name=checkbox]:checkbox").attr("checked",false);
		}
	});
	function up(){
		var obj = document.getElementsByName('checkbox');
		var ids = "";
		for(var i = 0; i < obj.length; i++)
		{
			if(obj[i].checked)
			{
				ids += obj[i].value + ',';
			}
		}
		$("#MODELS_ID").val(ids)
		document.getElementById("addModules").action="${path}sys/moduleMagAction_toAddModules.ms"
		document.forms.addModules.submit();
	}
	function flashPage(){
		query(document.getElementById("searchButtonId"));
	}
	function alertInfo(msg){
		util.alert(msg);
	}
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchFormDel.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	function queryDate(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>