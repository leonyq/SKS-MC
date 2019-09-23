<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="testFrameTable" />
	</title>
	<%@ include file="/common/pub_meta.jsp"%>
	<jsp:include page="/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<script type = "text/javascript" src = "/mes/js/ui/include.js"></script>
	<%@ include file="/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/page/common/buss/listCommJs.jsp"%>
	<script src="/mes/js/ui/textform/js/jquery.validate.js"></script>

</head>
<body>

	<div class="all">
		<bu:func viewId="ab81f433abfd4de3a96662e340d564d7" />
		<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="ab81f433abfd4de3a96662e340d564d7" />
		</form>
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="5487d6c77efb44528c56b3b6027e48df">
  <input type="hidden" name="formId" value="5487d6c77efb44528c56b3b6027e48df" />
    <table id="table_5487d6c77efb44528c56b3b6027e48df" class="table_list  " >
    <thead>
    <tr class="tdcolor">
<th width="3%"><input type="checkbox" id="selectAll_5487d6c77efb44528c56b3b6027e48df" onclick="selectAll(this,'5487d6c77efb44528c56b3b6027e48df');" /></th>
      <th width="50px;">序号</th>
      <th>frame_br</th>
      <th>frame_name</th>
    </tr>
    </thead>
    <tbody id="tbody_5487d6c77efb44528c56b3b6027e48df">
    </tbody>
  </table>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/common/ajaxPagination.jsp?formId=searchForm&id=ab81f433abfd4de3a96662e340d564d7&form=5487d6c77efb44528c56b3b6027e48df&formidFirstId=5487d6c77efb44528c56b3b6027e48df&List=dataList&relColIds=94370fb093ee4bf6bc9bcc8540484547&subFormIds=107e69bca6da44a2a241a65ac203e148&subRelColIds=6d3f3ad7c7014683b2b9b0bce129eb0d" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

  <div id="107e69bca6da44a2a241a65ac203e148">
  <input type="hidden" name="formId" value="107e69bca6da44a2a241a65ac203e148" />
    <table id="table_107e69bca6da44a2a241a65ac203e148" class="table_list  " >
    <thead>
    <tr class="tdcolor">
<th width="3%"><input type="checkbox" id="selectAll_107e69bca6da44a2a241a65ac203e148" onclick="selectAll(this,'107e69bca6da44a2a241a65ac203e148');" /></th>
      <th width="50px;">序号</th>
      <th>生产者</th>
      <th width="标题宽" height="标题高" style="标题样式属性" class="标题样式表" 标题事件 onClick="_subSortData('107e69bca6da44a2a241a65ac203e148','DEPARTMENT',this);">生产者所属部门名称 <img class="_sortImg" style="vertical-align:middle;cursor: pointer;" src="/messtyle/css1/images/sort_16x16.gif" title="?点击排序" /></th>
      <th>修改人</th>
      <th>创建人</th>
      <th>部门</th>
      <th>创建时间</th>
      <th>修改时间</th>
      <th>主键</th>
    </tr>
    </thead>
    <tbody id="tbody_107e69bca6da44a2a241a65ac203e148">
    </tbody>
  </table>
  </div>
  <div class="center">
    <s:include value="/common/paginationAx.jsp?formId=107e69bca6da44a2a241a65ac203e148&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>
		</div>
	</div>
		<bu:submit viewId="ab81f433abfd4de3a96662e340d564d7" />
	<script src="/mes/js/jquery/jquery-1.7.2.js"></script>
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
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>

	}
	
	$(function()
	{
		var viewId = "ab81f433abfd4de3a96662e340d564d7";
		var list = "dataList";
		var formId = "5487d6c77efb44528c56b3b6027e48df";//静态，一个页面只有一个
		var isSubForm = "";//静态，一个页面只有一个
		var formidFirstId = "5487d6c77efb44528c56b3b6027e48df";// 第一级表单ID 静态，一个页面只有一个
		var relColIds = "94370fb093ee4bf6bc9bcc8540484547";// 表单关联字段id 静态，一个页面只有一个
		var subFormIds = "107e69bca6da44a2a241a65ac203e148";// 下级表单id 静态，一个页面只有一个
		var subRelColIds = "6d3f3ad7c7014683b2b9b0bce129eb0d";// 下级表单关联字段ID 静态，一个页面只有一个
		var currentPage = "";
		var pageRocord = "";
		var sortColMap = "";
		var result ;//todo 未完成
		var params = 
		{
			viewId:viewId,
			list:list,
			formId:formId,
			isSubForm:isSubForm,
			formidFirstId:formidFirstId,
			relColIds:relColIds,
			subFormIds:subFormIds,
			subRelColIds:subRelColIds,
			currentPage:currentPage,
			pageRocord:pageRocord,
			sortColMap:sortColMap
		}
		showUi(params);
	});

</script>
		<bu:script viewId="ab81f433abfd4de3a96662e340d564d7" />
	<jsp:include page="/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/common/pub_end.jsp"%>
