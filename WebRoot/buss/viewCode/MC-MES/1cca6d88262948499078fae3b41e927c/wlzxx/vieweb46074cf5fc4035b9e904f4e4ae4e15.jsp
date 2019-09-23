<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="物料组信息_test" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="42499fa82ddc44d5a2f6722d22cb65b1"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="eb46074cf5fc4035b9e904f4e4ae4e15" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="eb46074cf5fc4035b9e904f4e4ae4e15" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='42499fa82ddc44d5a2f6722d22cb65b1'/>
 <div class="panel datagrid" style="overflow-x: auto" id="42499fa82ddc44d5a2f6722d22cb65b1">
 <div class="datagrid-view-kz" id="datagrid-view-kz" style="overflow-x: auto;overflow-y:hidden; ;width:100%;">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner" style="display: block;">
		<bu:table  id="datagrid-htable-kz" style="width:100%" cssClass="datagrid-htable fixedTable" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px; text-align:center;" ><bu:thSeq  formId="42499fa82ddc44d5a2f6722d22cb65b1" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox listType="2" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_ITEM_RULE" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_STORE_MIN" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_STORE_MAX" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_GUARANTEE_PERIOD" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_WARM_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_MSD_FLAG" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_MSD_RULE" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_TEC_ID" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_REJ_FLAG" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_REPAIR_MAX" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_AUTO_FQC" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_FQC_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_SN_RULE_B" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_SN_RULE_S" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_LINK_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_SN_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_PRINT_TEMPLATE" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_TYPE" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_NAME" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_SN" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_TEST" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_PROCESS_FACE" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CIG_CONTRAL_TYPE" formId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body" id="datagrid-body-kz" style="margin-top: 0px;overflow-y: auto;overflow-x: hidden;" onscroll="tableScroll()">
		<bu:table style="width:100%" cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz">
		<tbody id="tbody_42499fa82ddc44d5a2f6722d22cb65b1">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:15px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="42499fa82ddc44d5a2f6722d22cb65b1" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="CIG_ITEM_RULE" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_ITEM_RULE" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_ITEM_RULE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="CIG_STORE_MIN" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_STORE_MIN" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_STORE_MIN}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="CIG_STORE_MAX" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_STORE_MAX" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_STORE_MAX}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="CIG_GUARANTEE_PERIOD" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_GUARANTEE_PERIOD" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_GUARANTEE_PERIOD}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="CIG_WARM_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_WARM_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_WARM_NUM}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="CIG_MSD_FLAG" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_MSD_FLAG" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_MSD_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="CIG_MSD_RULE" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_MSD_RULE" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_MSD_RULE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="CIG_TEC_ID" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_TEC_ID" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_TEC_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="CIG_REJ_FLAG" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_REJ_FLAG" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_REJ_FLAG}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" colNo="CIG_REPAIR_MAX" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_REPAIR_MAX" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_REPAIR_MAX}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="CIG_AUTO_FQC" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_AUTO_FQC" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_AUTO_FQC}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-12" colNo="CIG_FQC_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_FQC_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_FQC_NUM}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-13" colNo="CIG_SN_RULE_B" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_SN_RULE_B" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_SN_RULE_B}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-14" colNo="CIG_SN_RULE_S" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_SN_RULE_S" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_SN_RULE_S}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-15" colNo="CIG_LINK_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_LINK_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_LINK_NUM}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-16" colNo="CIG_SN_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_SN_NUM" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_SN_NUM}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-17" colNo="CIG_PRINT_TEMPLATE" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_PRINT_TEMPLATE" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_PRINT_TEMPLATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-18" colNo="CIG_TYPE" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_TYPE" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-19" colNo="CIG_NAME" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_NAME" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-20" colNo="CIG_SN" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_SN" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_SN}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-21" colNo="CIG_TEST" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_TEST" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_TEST}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-22" colNo="CIG_PROCESS_FACE" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_PROCESS_FACE" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_PROCESS_FACE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-23" colNo="CIG_CONTRAL_TYPE" formId="42499fa82ddc44d5a2f6722d22cb65b1" >
				<bu:ui colNo="CIG_CONTRAL_TYPE" formId="42499fa82ddc44d5a2f6722d22cb65b1" value="%{CIG_CONTRAL_TYPE}" seq="%{#seq}" />
			</bu:td>
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
  </div>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="eb46074cf5fc4035b9e904f4e4ae4e15" formId="134dbf5683354177987d15d34d0d3875" isSubForm="1" list="dataListSub" formidFirstId="42499fa82ddc44d5a2f6722d22cb65b1" relColIds="ba2a0da9df1c470bb9c1d7814e7157c5" subFormIds="013c4606017841b6b4e7f01e2a32d0a6" subRelColIds="eaca83211d3b4e04aff2fe41684f3904" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=134dbf5683354177987d15d34d0d3875&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>

		<div style="padding:1px;"></div>

		<bu:form viewId="eb46074cf5fc4035b9e904f4e4ae4e15" formId="013c4606017841b6b4e7f01e2a32d0a6" isSubForm="1" list="dataListSub" formidFirstId="42499fa82ddc44d5a2f6722d22cb65b1" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=013c4606017841b6b4e7f01e2a32d0a6&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="eb46074cf5fc4035b9e904f4e4ae4e15" />
		<bu:script viewId="eb46074cf5fc4035b9e904f4e4ae4e15" />
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
	
	function reloadPg(msg,title,width,height,time){
		//utilsFp.alert(msg,reloadPgExe);
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		//document.forms.searchForm.submit();
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
 	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
