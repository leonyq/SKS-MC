<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="设备信息" />
	</title>
	
	<style>
		td{
			box-sizing:border-box;
		}
		
		#datagrid-htable-kz,#datagrid-btable-kz{
			width:100% !important;
		}
	</style>		
	
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="99338dfb95df4eec8d5714a4e773b127"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="d2af383b097a416f8b262cfa42372795" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="d2af383b097a416f8b262cfa42372795" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="99338dfb95df4eec8d5714a4e773b127">
  <input type="hidden" name="formId" value="99338dfb95df4eec8d5714a4e773b127" />
		<div class="panel datagrid datagrid-div1" id="99338dfb95df4eec8d5714a4e773b127">
                                    <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" >
                                        <div class="datagrid-header">
                                            <div class="datagrid-header-inner" id="datagrid-header-inner">
                                                <bu:table id="datagrid-htable-kz" cssClass="datagrid-htable fixedTable datagrid-div6" style="min-width:1600px">
                                                    <s:set name="_$type" value="'view'" />
                                                    <tbody>
                                                        <bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
                                                            <td class="datagrid-cell" style="width:30px; text-align:center;">
                                                                <bu:thSeq formId="99338dfb95df4eec8d5714a4e773b127" i18n="1"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:30px; text-align:center">
                                                                <bu:thSBox listType="2" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:130px;">
                                                                <bu:uitn colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:130px;">
                                                                <bu:uitn colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:130px;">
                                                                <bu:uitn colNo="CD_DEVICE_NAME" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:70px;">
                                                                <bu:uitn colNo="CD_STATUS" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:70px;">
                                                                <bu:uitn colNo="CD_VALID_FLAG" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:110px;">
                                                                <bu:uitn colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:110px;">
                                                                <bu:uitn colNo="CD_PRODECT_DATE" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:110px;">
                                                                <bu:uitn colNo="CD_BUY_DATE" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:110px;">
                                                                <bu:uitn colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell" style="width:90px;">
                                                                <bu:uitn colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                            <td class="datagrid-cell">
                                                                <bu:uitn colNo="CD_SUPPLIER_ID" formId="99338dfb95df4eec8d5714a4e773b127"
                                                                />
                                                            </td>
                                                        </bu:tr>
                                                    </tbody>
                                                </bu:table>
                                            </div>
                                        </div>
                                        <div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
                                            <bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz" style="min-width:1580px">
                                                <tbody id="tbody_99338dfb95df4eec8d5714a4e773b127">
                                                    <bu:loop id="ls" value="dataList" status="seq">
                                                        <bu:tr cssClass="datagrid-row">
                                                            <td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
                                                                <bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" />
                                                            </td>
                                                            <td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
                                                                <bu:tdSBox formidFirstId="99338dfb95df4eec8d5714a4e773b127" />
                                                            </td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-1" style="width:130px;" colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_DEVICE_TYPE" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_DEVICE_TYPE}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-2" style="width:130px;" colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_DEVICE_SN" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_DEVICE_SN}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-3" style="width:130px;" colNo="CD_DEVICE_NAME" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_DEVICE_NAME" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_DEVICE_NAME}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-8" style="width:70px;text-align:center;" colNo="CD_STATUS" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_STATUS" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_STATUS}" seq="%{#seq}" />
                                                            </bu:td>
                                                             <bu:td cssClass="datagrid-cell datagrid-cell-10" style="width:70px;text-align:center;" colNo="CD_VALID_FLAG" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_VALID_FLAG" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_VALID_FLAG}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-11" style="width:110px;" colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_DEVICE_CLASS" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_DEVICE_CLASS}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-4" style="width:110px;text-align:center;" colNo="CD_PRODECT_DATE" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_PRODECT_DATE" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_PRODECT_DATE}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-5" style="width:110px;text-align:center;" colNo="CD_BUY_DATE" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_BUY_DATE" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_BUY_DATE}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-6" style="width:110px;" colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_USE_DEP" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_USE_DEP}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-7" style="width:90px;" colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_CHARGE_MAN" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_CHARGE_MAN}" seq="%{#seq}" />
                                                            </bu:td>
                                                            <bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="CD_SUPPLIER_ID" formId="99338dfb95df4eec8d5714a4e773b127">
                                                                <bu:ui colNo="CD_SUPPLIER_ID" formId="99338dfb95df4eec8d5714a4e773b127" value="%{CD_SUPPLIER_ID}" seq="%{#seq}" />
                                                            </bu:td>
                                                            
                                                            
                                                        </bu:tr>
                                                    </bu:loop>
                                                </tbody>
                                            </bu:table>
                                        </div>
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

</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="d2af383b097a416f8b262cfa42372795" />
		<bu:script viewId="d2af383b097a416f8b262cfa42372795" />
	<script type="text/javascript">
	

	$('#bd').height($(window).height()-68);
	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
		}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg,title,width,height,time){
		msgPop(msg,reloadPgExe,title,width,height,time);
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
