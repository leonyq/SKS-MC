<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="CSJ_表单测试扩展列表" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="04c2952aa89e452eb59b19362e8efb69"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="c74e33c6689542d1b2414a2ce0ac3dc3" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="c74e33c6689542d1b2414a2ce0ac3dc3" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='04c2952aa89e452eb59b19362e8efb69'/>
 <div class="panel datagrid datagrid-div1"  id="04c2952aa89e452eb59b19362e8efb69">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:15px; text-align:center;" ><bu:thSeq  formId="04c2952aa89e452eb59b19362e8efb69" i18n="1"/></td>
			<td class="datagrid-cell" style="width:15px; text-align:center"><bu:thSBox listType="2" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAME" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="SEX" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDUCATIONAL" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="HOBBY" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="REMARK" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="BIRTHPLACE" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FIREND" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MYFILE" formId="04c2952aa89e452eb59b19362e8efb69" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz">
		<tbody id="tbody_04c2952aa89e452eb59b19362e8efb69">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:15px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:15px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="04c2952aa89e452eb59b19362e8efb69" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="NAME" formId="04c2952aa89e452eb59b19362e8efb69" >
				<bu:ui colNo="NAME" formId="04c2952aa89e452eb59b19362e8efb69" value="%{NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="SEX" formId="04c2952aa89e452eb59b19362e8efb69" >
				<bu:ui colNo="SEX" formId="04c2952aa89e452eb59b19362e8efb69" value="%{SEX}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="EDUCATIONAL" formId="04c2952aa89e452eb59b19362e8efb69" >
				<bu:ui colNo="EDUCATIONAL" formId="04c2952aa89e452eb59b19362e8efb69" value="%{EDUCATIONAL}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="HOBBY" formId="04c2952aa89e452eb59b19362e8efb69" >
				<bu:ui colNo="HOBBY" formId="04c2952aa89e452eb59b19362e8efb69" value="%{HOBBY}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="REMARK" formId="04c2952aa89e452eb59b19362e8efb69" >
				<bu:ui colNo="REMARK" formId="04c2952aa89e452eb59b19362e8efb69" value="%{REMARK}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="BIRTHDATE" formId="04c2952aa89e452eb59b19362e8efb69" >
				<bu:ui colNo="BIRTHDATE" formId="04c2952aa89e452eb59b19362e8efb69" value="%{BIRTHDATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="FIREND" formId="04c2952aa89e452eb59b19362e8efb69" >
				<bu:ui colNo="FIREND" formId="04c2952aa89e452eb59b19362e8efb69" value="%{FIREND}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="MYFILE" formId="04c2952aa89e452eb59b19362e8efb69" >
				<bu:ui colNo="MYFILE" formId="04c2952aa89e452eb59b19362e8efb69" value="%{MYFILE}" seq="%{#seq}" />
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

		<bu:form viewId="c74e33c6689542d1b2414a2ce0ac3dc3" formId="034d781caa1f40a099c204b6e0e046e1" isSubForm="1" list="dataListSub" formidFirstId="04c2952aa89e452eb59b19362e8efb69" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=034d781caa1f40a099c204b6e0e046e1&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="c74e33c6689542d1b2414a2ce0ac3dc3" />
		<bu:script viewId="c74e33c6689542d1b2414a2ce0ac3dc3" />
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

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
