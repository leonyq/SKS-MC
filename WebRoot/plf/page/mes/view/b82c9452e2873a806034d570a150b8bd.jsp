<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="new扩展列表2" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="240e00fb449541a98541a619412c0a7a"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="0e1e4f0bb526486e9c08529ce38cfcb6" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="0e1e4f0bb526486e9c08529ce38cfcb6" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="240e00fb449541a98541a619412c0a7a">
  <input type="hidden" name="formId" value="240e00fb449541a98541a619412c0a7a" />
		<bu:table id="table_240e00fb449541a98541a619412c0a7a" width="100%" cssClass="dlist-table table-line" viewId="0e1e4f0bb526486e9c08529ce38cfcb6" formId="240e00fb449541a98541a619412c0a7a" list="dataList" formidFirstId="240e00fb449541a98541a619412c0a7a" relColIds="c462ec8e78bb482a9b8d5817eae2a312" subFormIds="2497a3c406d548f185f6e42e2a29ca29" subRelColIds="278dac00c5a047b9958520c0a23b90da">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<th width="50px"><bu:thSeq formId="240e00fb449541a98541a619412c0a7a" i18n="1"/></th>
			<th><bu:thSBox formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="O_CODE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_DOC_NUM" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_PROVIDE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="DT_CODE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_IN_DATE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_STORE_CODE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_STATE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_SEND_DATE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_RECEIVE_NO" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_RECEIVE_DATE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_CLOSE_NO" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_CLOSE_DATE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_REMARK" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_TYPE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="ERP_DOC" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="ERP_DOC_TYPE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="PROJECT_ID" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_SEND_NO" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_INPUT_DATE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_SOURCE_DOC" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_CLIENT" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="ORDER_ID" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_SHOPRESERVOIR_CODE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="MIX_FLAG" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="RETURN_ERP_FLAG" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="URGENT_FLAG" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_RESERVOIR_CODE" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="SETTLE_ACCOUNTS" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="OQA_FLAG" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_INPUT_NO" formId="240e00fb449541a98541a619412c0a7a" /></th>
			<th><bu:uitn colNo="WR_DATE" formId="240e00fb449541a98541a619412c0a7a" /></th>
		</bu:thTr>
		</thead>
		<tbody id="tbody_240e00fb449541a98541a619412c0a7a">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<td><bu:tdSeq seq="%{#seq.count}" /></td>
			<td><bu:tdSBox formidFirstId="240e00fb449541a98541a619412c0a7a" /></td>
			<bu:td colNo="O_CODE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="O_CODE" formId="240e00fb449541a98541a619412c0a7a" value="%{O_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_DOC_NUM" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_DOC_NUM" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_DOC_NUM}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_PROVIDE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_PROVIDE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_PROVIDE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="DT_CODE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="DT_CODE" formId="240e00fb449541a98541a619412c0a7a" value="%{DT_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_IN_DATE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_IN_DATE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_IN_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_STORE_CODE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_STORE_CODE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_STORE_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_STATE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_STATE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_STATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_SEND_DATE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_SEND_DATE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_SEND_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_RECEIVE_NO" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_RECEIVE_NO" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_RECEIVE_NO}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_RECEIVE_DATE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_RECEIVE_DATE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_RECEIVE_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_CLOSE_NO" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_CLOSE_NO" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_CLOSE_NO}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_CLOSE_DATE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_CLOSE_DATE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_CLOSE_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_REMARK" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_REMARK" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_REMARK}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_TYPE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_TYPE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="ERP_DOC" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="ERP_DOC" formId="240e00fb449541a98541a619412c0a7a" value="%{ERP_DOC}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="ERP_DOC_TYPE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="ERP_DOC_TYPE" formId="240e00fb449541a98541a619412c0a7a" value="%{ERP_DOC_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="PROJECT_ID" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="PROJECT_ID" formId="240e00fb449541a98541a619412c0a7a" value="%{PROJECT_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_SEND_NO" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_SEND_NO" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_SEND_NO}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_INPUT_DATE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_INPUT_DATE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_INPUT_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_SOURCE_DOC" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_SOURCE_DOC" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_SOURCE_DOC}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_CLIENT" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_CLIENT" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_CLIENT}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="ORDER_ID" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="ORDER_ID" formId="240e00fb449541a98541a619412c0a7a" value="%{ORDER_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_SHOPRESERVOIR_CODE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_SHOPRESERVOIR_CODE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_SHOPRESERVOIR_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="MIX_FLAG" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="MIX_FLAG" formId="240e00fb449541a98541a619412c0a7a" value="%{MIX_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="RETURN_ERP_FLAG" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="RETURN_ERP_FLAG" formId="240e00fb449541a98541a619412c0a7a" value="%{RETURN_ERP_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="URGENT_FLAG" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="URGENT_FLAG" formId="240e00fb449541a98541a619412c0a7a" value="%{URGENT_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_RESERVOIR_CODE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_RESERVOIR_CODE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_RESERVOIR_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="SETTLE_ACCOUNTS" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="SETTLE_ACCOUNTS" formId="240e00fb449541a98541a619412c0a7a" value="%{SETTLE_ACCOUNTS}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="OQA_FLAG" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="OQA_FLAG" formId="240e00fb449541a98541a619412c0a7a" value="%{OQA_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_INPUT_NO" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_INPUT_NO" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_INPUT_NO}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="WR_DATE" formId="240e00fb449541a98541a619412c0a7a" >
				<bu:ui colNo="WR_DATE" formId="240e00fb449541a98541a619412c0a7a" value="%{WR_DATE}" seq="%{#seq}" />
			</bu:td>
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="0e1e4f0bb526486e9c08529ce38cfcb6" formId="2497a3c406d548f185f6e42e2a29ca29" isSubForm="1" list="dataListSub" formidFirstId="240e00fb449541a98541a619412c0a7a" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=2497a3c406d548f185f6e42e2a29ca29&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="0e1e4f0bb526486e9c08529ce38cfcb6" />
		<bu:script viewId="0e1e4f0bb526486e9c08529ce38cfcb6" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
		}
		if($("#isClearOrder").val()==1){
    		clearSelectOrder();
    	}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg){
		utilsFp.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		//document.forms.searchForm.submit();
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
 	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
