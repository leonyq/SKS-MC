

<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.mes.common.model.dao.PaginationImpl"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="配置__页面2" />
	</title>
	<%@ include file="/common/pub_meta.jsp"%>
	<jsp:include page="/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/page/common/buss/listCommJs.jsp"%>
</head>
<body>

	<div class="all">
		<bu:funcsi viewId="d2684a37e12c40708ce198513f0a5f7b" funcId="" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.mes.common.method.Constants@FUNC_CODE}" />
		</form>
		<div>

		<form id="addForm" name="addForm" action="${path}buss/bussModel.ms" method="post" target="submitFrame">
			<input type="hidden" name="exeid" value="${exeid}" />
			
			<table class="add_table">
				<tr>
				  <th colspan="2"><dict:lang value="xx配置页面" /><span class="Eng">* </span><dict:lang value="为必填写项" /></th>
				</tr>
					<tr>
						<td width="35%" class="tr1">配置项1</td>
						<td width="65%">
							<s:textfield id="dictValDto_code" name="dictValDto.code" maxlength="20" cssClass="text_input_150" />
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr>
						<td class="tr1">配置项2</td>
						<td>
							<s:textfield id="dictValDto_value" name="dictValDto.value" maxlength="20" cssClass="text_input_150" />
							<span class="Eng">*</span>
						</td>
					</tr>
					<tr>
						<td class="tr1">下拉列表项：</td>
						<td>
							<dict:selectDict name="dictValDto.type" dictCode="YESNO" dictValue="" />
						</td>
					</tr>
			</table>
		   <br />
		   <br />
		   <br />
		   <div class="ptop_10 txac">
				<input type="button" value="提 交" onclick="add(this);" class="botton_img_add">
				
				<input type="reset" value="重 置"class="botton_img_search" />
			</div>
			
		</form>
		</div>
	</div>
		<bu:submit viewId="d2684a37e12c40708ce198513f0a5f7b" />
		<bu:script viewId="d2684a37e12c40708ce198513f0a5f7b" />

	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function add(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		document.forms.addForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	<%-- 这里验证合法性 --%>
	function valData(){
		return true;
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
	}

</script>

	<jsp:include page="/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/common/pub_end.jsp"%>