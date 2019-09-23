<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title>
		<dict:lang value="tab_new2_请购" />
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

</head>
<body>

	<div class="content-in">
		<bu:func viewId="033779dc2ae54e1ca99610ca820b3f01" />
			<div class="bd">
				<div id="searchDiv" name="searchDiv">
					<form id="searchForm" name="searchForm"
						action="${path}buss/bussModel.ms" method="post"></form>
				</div>
				<form id="listForm" name="listForm"
					action="${path}buss/bussModel.ms" method="post">
					<input type="hidden" name="exeid" value="${exeid}" />
					<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="033779dc2ae54e1ca99610ca820b3f01" formId="1f15fa81063949a29a9b0e87bd19c479" list="dataList" formidFirstId="1f15fa81063949a29a9b0e87bd19c479" relColIds="42af9f8bc6074d98996c0d457bb5c1ac,42af9f8bc6074d98996c0d457bb5c1ac" subFormIds="804a954de8ba4fd192669f916d73bdd2,0a1b624115ee4aceaa9b28c782b352a0" subRelColIds="6107a35b28b5468aa386133c9a0008b8,4e0dfde2ec3e4b1fa5f5422af4a7d7a5" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="033779dc2ae54e1ca99610ca820b3f01" formId="0a1b624115ee4aceaa9b28c782b352a0" isSubForm="1" list="dataListSub"  formidFirstId="1f15fa81063949a29a9b0e87bd19c479" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=0a1b624115ee4aceaa9b28c782b352a0&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>

		<div style="padding:1px;"></div>

		<bu:form viewId="033779dc2ae54e1ca99610ca820b3f01" formId="804a954de8ba4fd192669f916d73bdd2" isSubForm="1" list="dataListSub"  formidFirstId="1f15fa81063949a29a9b0e87bd19c479" relColIds="647668ed4f45429e88ac17f0d0ffb42e,8f14310c96c945fbb5be9b8c43fc9439" subFormIds="db443a5daffd43559462ddc5bdcd26f5,db443a5daffd43559462ddc5bdcd26f5" subRelColIds="38a5d60b8bc047cd84ca8015fd822f93,fa1b6f4888f84e2d9b4975270ae91393" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=804a954de8ba4fd192669f916d73bdd2&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>

		<div style="padding:1px;"></div>

		<bu:form viewId="033779dc2ae54e1ca99610ca820b3f01" formId="db443a5daffd43559462ddc5bdcd26f5" isSubForm="1" list="dataListSub"  formidFirstId="1f15fa81063949a29a9b0e87bd19c479" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=db443a5daffd43559462ddc5bdcd26f5&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>

		<div style="padding:1px;"></div>

</div>


				</form>
			</div>
	</div>
		<bu:submit viewId="033779dc2ae54e1ca99610ca820b3f01" />
		<bu:script viewId="033779dc2ae54e1ca99610ca820b3f01" />
	<script type="text/javascript">
	var searchForm;
	var isQuery = false;
	function query(thisObj){
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
		}
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		var selectObj = $(window.parent.document.forms.searchForm).clone(true);
		var pageHtml = $("#searchForm").html();
		var page_currentPage = $("#page_currentPage").val();
		var page_pageRecord = $("#page_pageRecord ").val(); 
		$("#searchDiv").html(selectObj);
		$("#searchDiv form").append(pageHtml);
		$("#searchDiv form").append("<input type='hidden' name='parentExeid' value='"+$("#searchForm input[name='exeid']").val()+"'/>");
		$("#searchForm input[name='exeid']").val($("#listForm input[name='exeid']").val());
		$("#page_currentPage").val(page_currentPage);
		$("#page_pageRecord ").val(page_pageRecord ); 
		$("#searchForm").submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg);
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		var selectObj = $(window.parent.document.forms.searchForm).clone(true);
		var pageHtml = $("#searchForm").html();
		var page_currentPage = $("#page_currentPage").val();
		var page_pageRecord = $("#page_pageRecord ").val(); 
		$("#searchDiv").html(selectObj);
		$("#searchDiv form").append(pageHtml);
		$("#searchDiv form").append("<input type='hidden' name='parentExeid' value='"+$("#searchForm input[name='exeid']").val()+"'/>");
		$("#searchForm input[name='exeid']").val($("#listForm input[name='exeid']").val());
		$("#page_currentPage").val(page_currentPage);
		$("#page_pageRecord ").val(page_pageRecord ); 
		$("#searchForm").submit();
		util.showTopLoading();
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
		//判断是否隐藏搜索框
		if($("#searchParaNull").val()=="0"){
			$(".search-box").hide();
		}
		$(".botton_img_add").hide();
		$(".dept_select").chosen();
	}

</script>

	<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
