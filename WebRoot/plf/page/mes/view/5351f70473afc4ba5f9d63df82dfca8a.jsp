<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="测试模块H1前台" /></title>
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
<body scroll="auto">

	<div class="content-in">
		<div class="dlist">
			<div class="hd">

				<bu:func viewId="c8b2cb02603c49c48de83095b471a64b" />

			</div>
			<div class="bd">
				<div class="search-box">
					<form id="searchForm" name="searchForm"
						action="${path}buss/bussModel.ms" method="post">
						<input type="hidden" name="exeid" value="${exeid}" /> <input
							type="hidden" name="searchParaShowState" id="searchParaShowState"
							value="${paraMap.searchParaShowState}" />
						<s:hidden
							name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
						<bu:search viewId="c8b2cb02603c49c48de83095b471a64b" />
					</form>
					<a href="javascript:void(0);" class="more"></a>
				</div>


				<form id="listForm" name="listForm"
					action="${path}buss/bussModel.ms" method="post">
					<input type="hidden" name="exeid" value="${exeid}" />
					<s:hidden
						name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
					<bu:form viewId="c8b2cb02603c49c48de83095b471a64b"
						formId="0c0e6e03e3204524983b03f875effc80" list="dataList"
						formidFirstId="0c0e6e03e3204524983b03f875effc80"
						relColIds="24a8abc9c3c542429d15860c0f49deaa"
						subFormIds="db443a5daffd43559462ddc5bdcd26f5"
						subRelColIds="38a5d60b8bc047cd84ca8015fd822f93" />
					<%
					  if (null != request.getAttribute("page")) {
									PaginationImpl _pageTop = (PaginationImpl) request
											.getAttribute("page");
									if (_pageTop.isPage()) {
					%>
					<div class="center">
						<s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
					</div>
					<%
					  }
								}
					%>
				
			</div>

			<div style="padding:1px;"></div>

			<bu:form viewId="c8b2cb02603c49c48de83095b471a64b"
				formId="db443a5daffd43559462ddc5bdcd26f5" isSubForm="1"
				list="dataListSub" formidFirstId="0c0e6e03e3204524983b03f875effc80"
				relColIds="" subFormIds="" subRelColIds="" />
			<div class="center">
				<s:include
					value="/plf/page/fp/paginationAx.jsp?formId=db443a5daffd43559462ddc5bdcd26f5&listDataFn=_listSubDataAx&showLoading=0" />
			</div>
		</div>


		</form>

	</div>
	</div>
	</div>


	<bu:submit viewId="c8b2cb02603c49c48de83095b471a64b" />
	<bu:script viewId="c8b2cb02603c49c48de83095b471a64b" />
	<script type="text/javascript">
  	var isQuery = false;
	function query(thisObj){
    		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    		}
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg){
		//utilsFp.alert(msg,reloadPgExe);
		utilsFp.confirmIcon(2,"",reloadPgExe,"", msg,"","260","145");
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
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
