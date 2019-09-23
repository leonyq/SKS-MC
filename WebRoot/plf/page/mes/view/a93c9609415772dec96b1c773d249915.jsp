<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="工序信息" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>
	<link href="${path}buss/taskCenter/css/taskCenter.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="c5a470e4e9874f90bd7a1eb9fbcaebf5" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="c5a470e4e9874f90bd7a1eb9fbcaebf5" />
						</form>
                        <a href="javascript:;" class="more"></a>
                        <script type="text/javascript">
                          $('.search-box .more').click(function(){
                            $('.search-box').toggleClass('show');
                          })
                        </script>
                      </div>
		
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="c5a470e4e9874f90bd7a1eb9fbcaebf5" formId="f4bff8054eec43dd9b7ffe75eb0f03ac" list="dataList" formidFirstId="f4bff8054eec43dd9b7ffe75eb0f03ac" relColIds="" subFormIds="" subRelColIds="" />
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
	</div>
		<bu:submit viewId="c5a470e4e9874f90bd7a1eb9fbcaebf5" />
		<bu:script viewId="c5a470e4e9874f90bd7a1eb9fbcaebf5" />
	<script type="text/javascript">
	$(function(){
          $('.dept_select').chosen();
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
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}

</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
