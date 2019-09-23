<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>       
	<title>
		<dict:lang value="tt" />
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
		<bu:func viewId="1d87e7a79e8b4ddd8d69beb52dfecd8c" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="1d87e7a79e8b4ddd8d69beb52dfecd8c" />
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
  <div id="81020f8751264246b22d7335795a141d">
  <input type="hidden" name="formId" value="81020f8751264246b22d7335795a141d" />
		<bu:table id="table_81020f8751264246b22d7335795a141d" width="100%" cssClass="dlist-table table-line" viewId="1d87e7a79e8b4ddd8d69beb52dfecd8c" formId="81020f8751264246b22d7335795a141d" list="dataList" formidFirstId="81020f8751264246b22d7335795a141d" relColIds="682399edb37e439b97edca87fc110640" subFormIds="2fc75c6d985a46a1996156f151c522a2" subRelColIds="0f2abf2de97f45e8afc1dc2ca1a9cdd5">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<bu:thSeq formId="81020f8751264246b22d7335795a141d" i18n="1"></bu:thSeq>
			<bu:thSBox formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_STATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_DOC_NUM" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_TYPE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_IN_DATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_STORE_CODE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="O_CODE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="OQA_FLAG" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_CLIENT" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_INPUT_NO" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_PROVIDE" formId="81020f8751264246b22d7335795a141d" />
			
		</bu:thTr>
		</thead>
		<tbody id="tbody_81020f8751264246b22d7335795a141d">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<bu:tdSeq seq="%{#seq.count}"></bu:tdSeq>
			<bu:tdSBox formidFirstId="81020f8751264246b22d7335795a141d"></bu:tdSBox>
			<bu:td colNo="WR_STATE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_STATE" formId="81020f8751264246b22d7335795a141d" value="%{WR_STATE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_DOC_NUM" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_DOC_NUM" formId="81020f8751264246b22d7335795a141d" value="%{WR_DOC_NUM}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_TYPE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_TYPE" formId="81020f8751264246b22d7335795a141d" value="%{WR_TYPE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_IN_DATE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_IN_DATE" formId="81020f8751264246b22d7335795a141d" value="%{WR_IN_DATE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_STORE_CODE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_STORE_CODE" formId="81020f8751264246b22d7335795a141d" value="%{WR_STORE_CODE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="O_CODE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="O_CODE" formId="81020f8751264246b22d7335795a141d" value="%{O_CODE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="OQA_FLAG" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="OQA_FLAG" formId="81020f8751264246b22d7335795a141d" value="%{OQA_FLAG}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_CLIENT" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_CLIENT" formId="81020f8751264246b22d7335795a141d" value="%{WR_CLIENT}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_INPUT_NO" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_INPUT_NO" formId="81020f8751264246b22d7335795a141d" value="%{WR_INPUT_NO}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_PROVIDE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_PROVIDE" formId="81020f8751264246b22d7335795a141d" value="%{WR_PROVIDE}" seq="%{#seq}" />
			</td>
			
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

		<div style="padding:1px;"></div>

		<bu:form viewId="1d87e7a79e8b4ddd8d69beb52dfecd8c" formId="2fc75c6d985a46a1996156f151c522a2" isSubForm="1" list="dataListSub" formidFirstId="81020f8751264246b22d7335795a141d" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=2fc75c6d985a46a1996156f151c522a2&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="1d87e7a79e8b4ddd8d69beb52dfecd8c" />
		<bu:script viewId="1d87e7a79e8b4ddd8d69beb52dfecd8c" />
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
