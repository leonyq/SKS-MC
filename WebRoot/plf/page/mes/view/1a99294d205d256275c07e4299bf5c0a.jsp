<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="条码规则" />
	</title>
	
	<style>
		td{
			box-sizing: border-box;
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

</head>
<body scroll="auto" style="overflow: hidden;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="92315eaa696d4a43b94aa04c66fef0e6" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="92315eaa696d4a43b94aa04c66fef0e6" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="05b39a22c63b4544be3294a59d5dd767">
  <input type="hidden" name="formId" value="05b39a22c63b4544be3294a59d5dd767" />
		<div class="panel datagrid datagrid-div1"  id="05b39a22c63b4544be3294a59d5dd767">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6"  style="min-width:1180px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="05b39a22c63b4544be3294a59d5dd767" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 140px;"><bu:uitn colNo="TBR_NAME" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 90px;"><bu:uitn colNo="TBR_MATCH_CHAR" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 90px;"><bu:uitn colNo="TBR_ANALYTIC_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 70px;"><bu:uitn colNo="TBR_STATUS" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 70px;"><bu:uitn colNo="TBR_DEFAULT" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 90px;"><bu:uitn colNo="TBR_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 90px;"><bu:uitn colNo="CREATE_USER" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 140px;"><bu:uitn colNo="CREATE_TIME" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell" style="width: 140px;"><bu:uitn colNo="EDIT_TIME" formId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TBR_MEMO" formId="05b39a22c63b4544be3294a59d5dd767" /></td>

		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz"  style="min-width:1160px;">
		<tbody id="tbody_05b39a22c63b4544be3294a59d5dd767">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="05b39a22c63b4544be3294a59d5dd767" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" style="width: 140px;" colNo="TBR_NAME" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="TBR_NAME" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" style="width: 90px;" colNo="TBR_MATCH_CHAR" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="TBR_MATCH_CHAR" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_MATCH_CHAR}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" style="width: 90px;" colNo="TBR_ANALYTIC_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="TBR_ANALYTIC_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_ANALYTIC_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" style="width: 70px;text-align:center;" colNo="TBR_STATUS" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="TBR_STATUS" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_STATUS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" style="width: 70px;text-align:center;" colNo="TBR_DEFAULT" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="TBR_DEFAULT" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_DEFAULT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" style="width: 90px;" colNo="TBR_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="TBR_TYPE" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" style="width: 90px;" colNo="CREATE_USER" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="CREATE_USER" formId="2ea95967d56649819c804bb7f19c6cbc" value="%{CREATE_USER}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" style="width: 140px;text-align:center;" colNo="CREATE_TIME" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="CREATE_TIME" formId="2ea95967d56649819c804bb7f19c6cbc" value="%{CREATE_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell9" style="width: 140px;text-align:center;" colNo="EDIT_TIME" formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="EDIT_TIME" formId="2ea95967d56649819c804bb7f19c6cbc" value="%{EDIT_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td ondblclick="remark(this);" cssClass="datagrid-cell datagrid-cell-10" style="text-overflow:ellipsis; white-space:nowrap; overflow:hidden;" colNo="TBR_MEMO" title='${TBR_MEMO}' formId="05b39a22c63b4544be3294a59d5dd767" >
				<bu:ui colNo="TBR_MEMO" formId="05b39a22c63b4544be3294a59d5dd767" value="%{TBR_MEMO}" seq="%{#seq}" />
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


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="92315eaa696d4a43b94aa04c66fef0e6" />
		<bu:script viewId="92315eaa696d4a43b94aa04c66fef0e6" />
	<script type="text/javascript">
      function remark(obj){
	utilsFp.popRemark("",obj.title,"");
	}
	$(function(){
         	
      	});
	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
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
		document.forms.searchForm.submit();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
        $(".search-box .more").click(function(){
            $(".search-box").toggleClass("show");
          })
		//判断是否隐藏搜索框
		if($("#searchParaNull").val()=="0"){
			$(".search-box").hide();
		}else if($("#searchParaNull").val() <= "3"){
			$(".search-box .more").hide();
		}
	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
