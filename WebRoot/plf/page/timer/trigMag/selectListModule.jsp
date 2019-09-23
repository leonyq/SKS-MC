<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="任务管理" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		
		<style>
			html,body{
				height:100%;
			}
		</style>
		
	</head>
<body>

<div class="all">	
	<div >
	<form id="searchForm" name="searchForm" action="${path}sys/workMagAction_selectListModuleDate.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
		        <input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		        <input type="hidden" id="mcIframeName" name="mcIframeName" value="${mcIframeName}"  />
		         <input type="hidden" id="userDataAuth" name="userDataAuth" value="${userDataAuth}"  />
				<table class="search_table">
					<tr>
						<!-- 
						<td width="100%" style="text-align:center;">
							 <div class="search_div" style="display:inline-block;float: none;">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="模块名称" /></div>
								<div class ="search_value">
								<s:textfield id="MODEL_NAME" name="paraMap.MODEL_NAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="queryDate(this)"  class="botton_img_add" style="vertical-align: top;"/>
							<input type="button" id="searchButtonId" value="<dict:lang value="保存" />" onclick="add(this)"  class="botton_img_add"  style="vertical-align: top;"/>
						</td>
						 -->
						 <td >
						
					  	<div class="search_table_wrap">
				         <span><dict:lang value="模块名称" /></span>
				          <div class="layui-input-inline">
				            <s:textfield id="MODEL_NAME" name="paraMap.MODEL_NAME"
							cssClass="input_sh" maxlength="300"  onkeyup="javascript:util.replaceLikeVal(this)" />
				          </div>
				        </div>

					  	<div class="search_table_wrap">
				         
				          <div class="layui-input-inline">
				            <input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this);" class="layui-btn"> 
						     						     
						     <bu:funOper cssClass="layui-btn" id="searchButtonId" funcNo="F143" type="a" href="javascript:add();" >保存</bu:funOper>
						     
				          </div>
				        </div>
					  	
					  </td>
					</tr>
				</table>
			<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
			<s:hidden name="paraMap.queryType" id="queryTyep" value="checkTask"></s:hidden>
			</form>
	<form id="searchFormDel" name="searchFormDel" action="${path}sys/workMagAction_listModule.ms" method="post">
		<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	</form>
	<div style="height:calc(100% - 40px);overflow:auto;">
	
	<div class="table_div">
    <table id="listTable"  class="table_list">
		<thead>
		<tr class="tdcolor">
			<th width="20px"></th>
			<th width="40px"><dict:lang value="序号" /></th>
			<th width="80px"><dict:lang value="编号" /></th>
			<th width="100px"><dict:lang value="模块名称" /></th>
			<th width="100px"><dict:lang value="模块说明" /></th>
			<th width="75px"><dict:lang value="接口类型" /></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="configPage" status="index">
			<s:if test="paraMap.id==#configPage.id">
			<tr id="<s:property value="ID"/>" onclick="tr_click(this,'<s:property value='id'/>','<s:property value='workId'/>','<c:out value='${MODEL_NAME}'/>','<s:property value='FLAG'/>','<c:out value='${TYPE}'/>')">
			<td><input type="radio" name="button"  onClick="check('<s:property value='id'/>','<s:property value='workId'/>','<c:out value='${MODEL_NAME}'/>','<s:property value='FLAG'/>','<c:out value='${TYPE}'/>');"  checked="checked"/></td>
			</s:if>
			
			<s:else>
			<tr id="<s:property value="ID"/>" onclick="tr_click(this,'<s:property value='id'/>','<s:property value='workId'/>','<c:out value='${MODEL_NAME}'/>','<s:property value='FLAG'/>','<c:out value='${TYPE}'/>')">
			<td><input type="radio" name="button"  onClick="check('<s:property value='id'/>','<s:property value='workId'/>','<c:out value='${MODEL_NAME}'/>','<s:property value='FLAG'/>','<c:out value='${TYPE}'/>');" /></td>
			</s:else>
			
			<td><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="ID"/>><s:property value="ID"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title='<c:out value='${MODEL_NAME}'/>'><c:out value='${MODEL_NAME}'/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title='<c:out value='${MODEL_MEMO}'/>'><c:out value='${MODEL_MEMO}'/></td>
			<td><dict:viewDict dictCode="MC_WORK_TYPE" dictValue="%{#configPage.FLAG}" /></td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>	
	</div>
	<input type="hidden" id="up_id" name="paraMap.UP_ID" value="<s:property value="ajaxMap.up_id"/>">
	<input type="hidden" id="name" value="<s:property value="ajaxMap.name"/>">
	<s:hidden name="paraMap.checkId" id="checkId"></s:hidden>
	<s:hidden name="paraMap.checkType" id="checkType"></s:hidden>
	<s:hidden name="paraMap.modelName" id="modelName"></s:hidden>
	<s:hidden name="paraMap.workModuleId" id="workModuleId"></s:hidden>
	<s:hidden name="paraMap.type" id="type"></s:hidden>
	
	<%--
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
	--%>
	
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />
	
</div>

</div>
<script type="text/javascript">
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchFormDel.submit();
		util.showTopLoading();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	function query(thisObj){
	/*
		_pageCurrentPageObj.value="1";
		document.forms.searchFormDel.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	*/
	queryDate(thisObj);
	
	}
	function queryDate(thisObj){
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	function check(moduleId,checkId,modelName,type,checkType){
		$("#checkId").val(checkId);
		$("#modelName").val(modelName);
		$("#workModuleId").val(moduleId);

		if(type==""){
			$("#checkType").val("0");
			return false;	
		}
		if(type=="0"){
			$("#type").val("2");
			$("#checkType").val(checkType);
			return false;	
		}
		if(type=="1"){
			$("#type").val("1");
			$("#checkType").val(checkType);
			return false;	
		}
		if(type=="2"){
			$("#type").val("3");
			$("#checkType").val(checkType);
			return false;	
		}
		if(type=="3"){
			$("#type").val("4");
			$("#checkType").val(checkType);
			return false;	
		}
	}
	function add(){
		var checkType=$("#checkType").val();
		if(checkType=='0'){
			util.alert("请选择接口");
			return;
		}
		
		var mcIframeName=$("#mcIframeName").val();
		var obj={"mcIframeName":mcIframeName,"type":"window"};
		var par_obj=getSrcByIframeName(obj);
		par_obj.updateCheckData($("#type").val(), $("#checkId").val(), $("#modelName").val(),$("#workModuleId").val());
		
		var curIframeName = window.parent.name; //外层iframe的name
		obj={"mcIframeName":curIframeName,"type":"window"};
		par_obj=getSrcByIframeName(obj);
		par_obj.closePage();
	}
	
	function tr_click(obj,id,workId,MODEL_NAME,FLAG,TYPE){
		$(obj).children().children().attr("checked","checked");
		check(id,workId,MODEL_NAME,FLAG,TYPE);
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>