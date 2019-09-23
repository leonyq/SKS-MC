<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="锡膏胶水列表" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="6c64c25e45214328b6adbec0abc8f34f"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="1c9a1ee8eadf45f8ab4cd590687fbc9e" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="1c9a1ee8eadf45f8ab4cd590687fbc9e" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>
     <div>
 	    </div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='6c64c25e45214328b6adbec0abc8f34f'/>
 <div class="panel datagrid datagrid-div1"  id="6c64c25e45214328b6adbec0abc8f34f">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" >
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner" >
 	    
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" list="dataList"  style="min-width: 1565px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6c64c25e45214328b6adbec0abc8f34f" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			 
			
			<td class="datagrid-cell" style="width:170px"><bu:uitn colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:80px"><bu:uitn colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			
			<td class="datagrid-cell" style="width:100px""><bu:uitn colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:100px"><bu:uitn colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			
			<td class="datagrid-cell" style="width:100px"><bu:uitn colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:130px"><bu:uitn colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			
			<td class="datagrid-cell" style="width:85px"><bu:uitn colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell" style="width:130px"><bu:uitn colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" /></td>
			
			
			 
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()" >
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz"   style="min-width: 1545px;">
		<tbody id="tbody_6c64c25e45214328b6adbec0abc8f34f">
		<bu:loop id="ls" value="dataList" status="seq" >
		
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
            <bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1" >
            <bu:tdSBox formidFirstId="6c64c25e45214328b6adbec0abc8f34f" onclick="seq()"/></td>
			
			 
			
			<bu:td cssClass="datagrid-cell datagrid-cell-25" colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:170px">
				<bu:ui colNo="CTI_TIN_SN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TIN_SN}" seq="%{#seq}" />
				<input type="hidden" id="state_${ID}" value="${CTI_TIN_STATUS}">
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-13" colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:80px;text-align:center">
				<bu:ui colNo="CTI_TIN_STATUS" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_TIN_STATUS}" seq="%{#seq}" />
			</bu:td>
		
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:80px">
				<bu:ui colNo="CTI_ITEM_TYPE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ITEM_TYPE}" seq="%{#seq}" /> 
			</bu:td><!--value="%{assistype}"  CTI_ASSISTANTTOOLTYPE-->
			
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:80px">
				<bu:ui colNo="CTI_ITEM_CODE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ITEM_CODE}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:80px">
				<bu:ui colNo="CTI_ASSISTANTTOOLNAME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLNAME}" seq="%{#seq}" />
			</bu:td><!--value="%{assistanttoolname}" CTI_ASSISTANTTOOLNAME-->
			
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:80px">
				<bu:ui colNo="CTI_ASSISTANTTOOLSPEC" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_ASSISTANTTOOLSPEC}" seq="%{#seq}" />
			</bu:td>
			<!--value="%{assistanttoolspec}" CTI_ASSISTANTTOOLSPEC-->
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:100px">
				<bu:ui colNo="CTI_LOT" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_LOT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:90px">
				<bu:ui colNo="CTI_THAWING_TIME_TOTAL" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_TIME_TOTAL}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:100px;text-align:right">
				<bu:ui colNo="CTI_THAWING_TIME_MAX" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_THAWING_TIME_MAX}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:100px">
				<bu:ui colNo="CTI_SUPPLIER" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_SUPPLIER}" seq="%{#seq}" />
			</bu:td><!--value="%{CTI_SUPPLIER}"  %{supplier_name}-->
			<bu:td cssClass="datagrid-cell datagrid-cell-12" colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:130px">
				<bu:ui colNo="CTI_INSTOCK_TIME" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-13" colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:85px;text-align:right">
				<bu:ui colNo="CTI_QULITY_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_QULITY_DATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-14" colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" style="width:130px">
				<bu:ui colNo="CTI_EXPIRE_DATE" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_EXPIRE_DATE}" seq="%{#seq}" />
			</bu:td>
			  <bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" style="text-align:center">
				<bu:ui colNo="CTI_INSTOCK_MAN" formId="6c64c25e45214328b6adbec0abc8f34f" value="%{CTI_INSTOCK_MAN}" seq="%{#seq}" />
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
		<bu:submit viewId="1c9a1ee8eadf45f8ab4cd590687fbc9e" />
		<bu:script viewId="1c9a1ee8eadf45f8ab4cd590687fbc9e" />
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
    
    function seq(){
    //	alert(0);
    }
</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
