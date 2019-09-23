<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="扩展测试" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="46c1c43da79146c98132980ad26bd980" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="46c1c43da79146c98132980ad26bd980" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="cbf03836bb0348aca9f40ef9665c6e2b">
  <input type="hidden" name="formId" value="cbf03836bb0348aca9f40ef9665c6e2b" />
		<bu:table id="table_cbf03836bb0348aca9f40ef9665c6e2b" width="100%" cssClass="dlist-table table-line" viewId="46c1c43da79146c98132980ad26bd980" formId="cbf03836bb0348aca9f40ef9665c6e2b" list="dataList" formidFirstId="cbf03836bb0348aca9f40ef9665c6e2b" relColIds="" subFormIds="" subRelColIds="">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<th width="50px"><bu:thSeq formId="cbf03836bb0348aca9f40ef9665c6e2b" i18n="1"/></th>
			<th><bu:thSBox formId="cbf03836bb0348aca9f40ef9665c6e2b" /></th>
			<th><bu:uitn colNo="LIST_ID" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></th>
			<th><bu:uitn colNo="LIST_NAME" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></th>
			<th><bu:uitn colNo="LIST_TIME" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></th>
			<th><bu:uitn colNo="LIST_CONTENT" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></th>
			<th><bu:uitn colNo="LIST_PHOTO" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></th>
		</bu:thTr>
		</thead>
		<tbody id="tbody_cbf03836bb0348aca9f40ef9665c6e2b">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<td><bu:tdSeq seq="%{#seq.count}" /></td>
			<td><bu:tdSBox formidFirstId="cbf03836bb0348aca9f40ef9665c6e2b" /></td>
			<bu:td colNo="LIST_ID" formId="cbf03836bb0348aca9f40ef9665c6e2b" >
				<bu:ui colNo="LIST_ID" formId="cbf03836bb0348aca9f40ef9665c6e2b" value="%{LIST_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="LIST_NAME" formId="cbf03836bb0348aca9f40ef9665c6e2b" >
				<bu:ui colNo="LIST_NAME" formId="cbf03836bb0348aca9f40ef9665c6e2b" value="%{LIST_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="LIST_TIME" formId="cbf03836bb0348aca9f40ef9665c6e2b" >
				<bu:ui colNo="LIST_TIME" formId="cbf03836bb0348aca9f40ef9665c6e2b" value="%{LIST_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="LIST_CONTENT" formId="cbf03836bb0348aca9f40ef9665c6e2b" >
				<bu:ui colNo="LIST_CONTENT" formId="cbf03836bb0348aca9f40ef9665c6e2b" value="%{LIST_CONTENT}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="LIST_PHOTO" formId="cbf03836bb0348aca9f40ef9665c6e2b" >
				<bu:ui colNo="LIST_PHOTO" formId="cbf03836bb0348aca9f40ef9665c6e2b" value="%{LIST_PHOTO}" seq="%{#seq}" />
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


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="46c1c43da79146c98132980ad26bd980" />
		<bu:script viewId="46c1c43da79146c98132980ad26bd980" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
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
