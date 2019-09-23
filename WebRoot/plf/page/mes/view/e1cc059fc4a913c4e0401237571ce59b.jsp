<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="ff" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
                    <div class="tit">
                      <div class="group">
                        <div class="dec">
                          <select name="dept" data-placeholder="开单日期"  id="dept" class="dept_select" >
                            <option value="-1"></option>
                            <option value="开单日期">开单日期</option>
                            <option value="开单日期">开单日期</option>
                          </select>
                        </div>
                      </div>
                      <div class="group">
                        <div class="dec">
                          <input type="" name="" class="input" value="2016-03-03"><span class="ico ico-date"></span>
                        </div><span class="txt">至</span>
                        <div class="dec">
                          <input type="" name="" class="input" value="2016-03-03"><span class="ico ico-date"></span>
                        </div>
                      </div>
                    </div>
                    <div class="optn">
		<bu:func viewId="bab95abc09b144e4a15c8e4974179acf" />
                    </div>
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="bab95abc09b144e4a15c8e4974179acf" />
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
		<bu:table id="table_81020f8751264246b22d7335795a141d" width="100%" cssClass="dlist-table" viewId="bab95abc09b144e4a15c8e4974179acf" formId="81020f8751264246b22d7335795a141d" list="dataList" formidFirstId="81020f8751264246b22d7335795a141d" relColIds="682399edb37e439b97edca87fc110640" subFormIds="2fc75c6d985a46a1996156f151c522a2" subRelColIds="0f2abf2de97f45e8afc1dc2ca1a9cdd5">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<bu:thSeq formId="81020f8751264246b22d7335795a141d" i18n="1"></bu:thSeq>
			<bu:thSBox formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="O_CODE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_DOC_NUM" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_TYPE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_IN_DATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_STORE_CODE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_STATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="OQA_FLAG" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_CLIENT" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_INPUT_NO" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_PROVIDE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="DT_CODE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_DATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_SHOPRESERVOIR_CODE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_SOURCE_DOC" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_INPUT_DATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_SEND_NO" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_SEND_DATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_RECEIVE_NO" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_RECEIVE_DATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_CLOSE_NO" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_CLOSE_DATE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_REMARK" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="ORDER_ID" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="ERP_DOC" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="ERP_DOC_TYPE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="PROJECT_ID" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="SETTLE_ACCOUNTS" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="WR_RESERVOIR_CODE" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="MIX_FLAG" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="RETURN_ERP_FLAG" formId="81020f8751264246b22d7335795a141d" />
			<bu:th colNo="URGENT_FLAG" formId="81020f8751264246b22d7335795a141d" />
		</bu:thTr>
		</thead>
		<tbody id="tbody_81020f8751264246b22d7335795a141d">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<bu:tdSeq seq="%{#seq.count}"></bu:tdSeq>
			<bu:tdSBox formidFirstId="81020f8751264246b22d7335795a141d"></bu:tdSBox>
			<bu:td colNo="O_CODE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="O_CODE" formId="81020f8751264246b22d7335795a141d" value="%{O_CODE}" seq="%{#seq}" />
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
			<bu:td colNo="WR_STATE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_STATE" formId="81020f8751264246b22d7335795a141d" value="%{WR_STATE}" seq="%{#seq}" />
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
			<bu:td colNo="DT_CODE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="DT_CODE" formId="81020f8751264246b22d7335795a141d" value="%{DT_CODE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_DATE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_DATE" formId="81020f8751264246b22d7335795a141d" value="%{WR_DATE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_SHOPRESERVOIR_CODE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_SHOPRESERVOIR_CODE" formId="81020f8751264246b22d7335795a141d" value="%{WR_SHOPRESERVOIR_CODE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_SOURCE_DOC" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_SOURCE_DOC" formId="81020f8751264246b22d7335795a141d" value="%{WR_SOURCE_DOC}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_INPUT_DATE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_INPUT_DATE" formId="81020f8751264246b22d7335795a141d" value="%{WR_INPUT_DATE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_SEND_NO" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_SEND_NO" formId="81020f8751264246b22d7335795a141d" value="%{WR_SEND_NO}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_SEND_DATE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_SEND_DATE" formId="81020f8751264246b22d7335795a141d" value="%{WR_SEND_DATE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_RECEIVE_NO" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_RECEIVE_NO" formId="81020f8751264246b22d7335795a141d" value="%{WR_RECEIVE_NO}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_RECEIVE_DATE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_RECEIVE_DATE" formId="81020f8751264246b22d7335795a141d" value="%{WR_RECEIVE_DATE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_CLOSE_NO" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_CLOSE_NO" formId="81020f8751264246b22d7335795a141d" value="%{WR_CLOSE_NO}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_CLOSE_DATE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_CLOSE_DATE" formId="81020f8751264246b22d7335795a141d" value="%{WR_CLOSE_DATE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_REMARK" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_REMARK" formId="81020f8751264246b22d7335795a141d" value="%{WR_REMARK}" seq="%{#seq}" />
			</td>
			<bu:td colNo="ORDER_ID" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="ORDER_ID" formId="81020f8751264246b22d7335795a141d" value="%{ORDER_ID}" seq="%{#seq}" />
			</td>
			<bu:td colNo="ERP_DOC" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="ERP_DOC" formId="81020f8751264246b22d7335795a141d" value="%{ERP_DOC}" seq="%{#seq}" />
			</td>
			<bu:td colNo="ERP_DOC_TYPE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="ERP_DOC_TYPE" formId="81020f8751264246b22d7335795a141d" value="%{ERP_DOC_TYPE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="PROJECT_ID" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="PROJECT_ID" formId="81020f8751264246b22d7335795a141d" value="%{PROJECT_ID}" seq="%{#seq}" />
			</td>
			<bu:td colNo="SETTLE_ACCOUNTS" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="SETTLE_ACCOUNTS" formId="81020f8751264246b22d7335795a141d" value="%{SETTLE_ACCOUNTS}" seq="%{#seq}" />
			</td>
			<bu:td colNo="WR_RESERVOIR_CODE" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="WR_RESERVOIR_CODE" formId="81020f8751264246b22d7335795a141d" value="%{WR_RESERVOIR_CODE}" seq="%{#seq}" />
			</td>
			<bu:td colNo="MIX_FLAG" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="MIX_FLAG" formId="81020f8751264246b22d7335795a141d" value="%{MIX_FLAG}" seq="%{#seq}" />
			</td>
			<bu:td colNo="RETURN_ERP_FLAG" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="RETURN_ERP_FLAG" formId="81020f8751264246b22d7335795a141d" value="%{RETURN_ERP_FLAG}" seq="%{#seq}" />
			</td>
			<bu:td colNo="URGENT_FLAG" formId="81020f8751264246b22d7335795a141d" />
				<bu:ui colNo="URGENT_FLAG" formId="81020f8751264246b22d7335795a141d" value="%{URGENT_FLAG}" seq="%{#seq}" />
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
    <s:include value="/plf/common/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>

		<div style="padding:1px;"></div>

		<bu:form viewId="bab95abc09b144e4a15c8e4974179acf" formId="2fc75c6d985a46a1996156f151c522a2" isSubForm="1" list="dataListSub" formidFirstId="81020f8751264246b22d7335795a141d" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/common/paginationAx.jsp?formId=2fc75c6d985a46a1996156f151c522a2&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>
<ul class="paging">
                        <li>
                          <a class="it" href="#">&laquo;首页</a>
                        </li>
                        <li>
                          <a class="it" href="#">&lt;</a>
                        </li>
                        <li class="active">
                          <a class="it" href="#">1</a>
                        </li>
                        <li>
                          <a class="it" href="#">2</a>
                        </li>
                        <li>
                          <a class="it" href="#">3</a>
                        </li>
                        <li>
                          <a class="it" href="#">…</a>
                        </li>
                        <li>
                          <a class="it" href="#">8</a>
                        </li>
                        <li>
                          <a class="it" href="#">9</a>
                        </li>
                        <li>
                          <a class="it" href="#">&gt;</a>
                        </li>
                        <li>
                          <a class="it" href="#">最后一页&raquo;</a>
                        </li>
                        <li>
                          <select name="dept" data-placeholder="每页显示15条"  id="dept" class="dept_select" >
                            <option value="-1"></option>
                            <option value="pcb">每页显示20条</option>
                            <option value="pcb">每页显示15条</option>
                            <option value="pcb">每页显示10条</option>
                          </select>共计<span class="count"></span> 968 条
                        </li>
                      </ul>
		
		</div>
	</div>
  </div>
		<bu:submit viewId="bab95abc09b144e4a15c8e4974179acf" />
		<bu:script viewId="bab95abc09b144e4a15c8e4974179acf" />
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
