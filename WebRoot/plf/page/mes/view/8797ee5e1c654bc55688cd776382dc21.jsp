<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="辅料报废信息列表" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="536730f0f221402c8ddc9bb284b26acc"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="013c7b0369f14521b5ea7b78fef8d316" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="013c7b0369f14521b5ea7b78fef8d316" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='536730f0f221402c8ddc9bb284b26acc'/>
 <div class="panel datagrid datagrid-div1"  id="536730f0f221402c8ddc9bb284b26acc">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="min-width: 1200px;">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="536730f0f221402c8ddc9bb284b26acc" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:170px;"><bu:uitn colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
	                <td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" /></td>  
                        
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz">
		<tbody id="tbody_536730f0f221402c8ddc9bb284b26acc">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="536730f0f221402c8ddc9bb284b26acc" /></td>
            <bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" style="width:170px;">
				<bu:ui colNo="CTS_TIN_SN" formId="536730f0f221402c8ddc9bb284b26acc" value="%{CTS_TIN_SN}" seq="%{#seq}" />
			</bu:td>
            <bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" style="text-align: center;">
				<bu:ui colNo="CTS_ITEM_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" value="%{CTS_ITEM_TYPE}" seq="%{#seq}" />
			</bu:td>
            <bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" style="width:90px;">
				<bu:ui colNo="CTS_ITEM_CODE" formId="536730f0f221402c8ddc9bb284b26acc" value="%{CTS_ITEM_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" >
				<bu:ui colNo="ASSISTANTTOOLNAME" formId="536730f0f221402c8ddc9bb284b26acc" value="%{ASSISTANTTOOLNAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" >
				<bu:ui colNo="ASSISTANTTOOLSPEC" formId="536730f0f221402c8ddc9bb284b26acc" value="%{ASSISTANTTOOLSPEC}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-12" colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" style="width:100px;">
				<bu:ui colNo="CTS_LOT" formId="536730f0f221402c8ddc9bb284b26acc" value="%{CTS_LOT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" style="width:120px;">
				<bu:ui colNo="SUPPLIER_NAME" formId="536730f0f221402c8ddc9bb284b26acc" value="%{SUPPLIER_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" >
				<bu:ui colNo="CTS_SCARP_TYPE" formId="536730f0f221402c8ddc9bb284b26acc" value="%{CTS_SCARP_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc"  style="width:150px;text-overflow:ellipsis; white-space:nowrap; overflow:hidden;" ondblclick="remark(this);"  title='${CTS_SCARP_REASON}'>
				<bu:ui colNo="CTS_SCARP_REASON" formId="536730f0f221402c8ddc9bb284b26acc" value="%{CTS_SCARP_REASON}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" style="width:130px;">
				<bu:ui colNo="CTS_SCARP_TIME" formId="536730f0f221402c8ddc9bb284b26acc" value="%{CTS_SCARP_TIME}" seq="%{#seq}" />
			</bu:td>
                <bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" style="text-align: center;">
				<bu:ui colNo="CTS_SCARP_MAN" formId="536730f0f221402c8ddc9bb284b26acc" value="%{CTS_SCARP_MAN}" seq="%{#seq}" />
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


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="013c7b0369f14521b5ea7b78fef8d316" />
		<bu:script viewId="013c7b0369f14521b5ea7b78fef8d316" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
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
	function remark(obj){
	utilsFp.popRemark("",obj.title,"");
	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

