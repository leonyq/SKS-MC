<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="new扩展测试1" />
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
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="7649498b799b4c18969dce0ca2f66ee1" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="7649498b799b4c18969dce0ca2f66ee1" />
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
  <div id="f3ccf2b66c9c4a9f927ed0cd2a8c5089">
  <input type="hidden" name="formId" value="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
		<bu:table id="table_f3ccf2b66c9c4a9f927ed0cd2a8c5089" width="100%" cssClass="dlist-table table-line" viewId="7649498b799b4c18969dce0ca2f66ee1" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" list="dataList" formidFirstId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" relColIds="" subFormIds="" subRelColIds="">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<bu:thSeq formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" i18n="1"></bu:thSeq>
			<bu:thSBox formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="U_ID2" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="POP_SEL_S" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="UP_FILE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="POP_SEL_M" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="BUTTON" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="UP_FILE_SIZE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="UP_FILE_SAVE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="USER_POP" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="UNAME" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="STATE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="M_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="S_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="TIMES" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="TT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="MU_TEXT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
			<bu:th colNo="AGE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
		</bu:thTr>
		</thead>
		<tbody id="tbody_f3ccf2b66c9c4a9f927ed0cd2a8c5089">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<bu:tdSeq seq="%{#seq.count}"></bu:tdSeq>
			<bu:tdSBox formidFirstId="f3ccf2b66c9c4a9f927ed0cd2a8c5089"></bu:tdSBox>
			<bu:td colNo="U_ID2" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="U_ID2" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{U_ID2}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="POP_SEL_S" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="POP_SEL_S" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{POP_SEL_S}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="UP_FILE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="UP_FILE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UP_FILE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="POP_SEL_M" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="POP_SEL_M" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{POP_SEL_M}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="BUTTON" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="BUTTON" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{BUTTON}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="UP_FILE_SIZE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="UP_FILE_SIZE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UP_FILE_SIZE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="UP_FILE_SAVE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="UP_FILE_SAVE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UP_FILE_SAVE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="USER_POP" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="USER_POP" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{USER_POP}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="UNAME" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="UNAME" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UNAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="STATE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="STATE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{STATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="M_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="M_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{M_CHECK}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="S_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="S_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{S_CHECK}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="TIMES" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="TIMES" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{TIMES}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="TT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="TT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{TT}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="MU_TEXT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="MU_TEXT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{MU_TEXT}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="AGE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" >
				<bu:ui colNo="AGE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{AGE}" seq="%{#seq}" />
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
		<bu:submit viewId="7649498b799b4c18969dce0ca2f66ee1" />
		<bu:script viewId="7649498b799b4c18969dce0ca2f66ee1" />
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
	}
	
	function init(){
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			//_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
		//判断是否隐藏搜索框
		if($("#searchParaNull").val()=="0"){
			$(".search-box").hide();
		}
	}

</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
<script src="${path}plf/page/fp/js/iframe-design.js"></script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
