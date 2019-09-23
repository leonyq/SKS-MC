<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="性能测试-扩展" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>

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
		<bu:func viewId="6624e7d1aa8d402baf50dcef6636988e" />
                    </div>
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="6624e7d1aa8d402baf50dcef6636988e" />
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
  <div id="9be6d0e38a8b4458951573db75f47ff7">
  <input type="hidden" name="formId" value="9be6d0e38a8b4458951573db75f47ff7" />
		<bu:table id="table_9be6d0e38a8b4458951573db75f47ff7" width="100%" cssClass="dlist-table" viewId="6624e7d1aa8d402baf50dcef6636988e" formId="9be6d0e38a8b4458951573db75f47ff7" list="dataList" formidFirstId="9be6d0e38a8b4458951573db75f47ff7" relColIds="" subFormIds="" subRelColIds="">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<bu:thSeq formId="9be6d0e38a8b4458951573db75f47ff7" i18n="1"></bu:thSeq>
			<bu:thSBox formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A7" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A8" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A9" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A6" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A5" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A4" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A3" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A0" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A1" formId="9be6d0e38a8b4458951573db75f47ff7" />
			<bu:th colNo="A2" formId="9be6d0e38a8b4458951573db75f47ff7" />
		</bu:thTr>
		</thead>
		<tbody id="tbody_9be6d0e38a8b4458951573db75f47ff7">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<bu:tdSeq seq="%{#seq.count}"></bu:tdSeq>
			<bu:tdSBox formidFirstId="9be6d0e38a8b4458951573db75f47ff7"></bu:tdSBox>
			<bu:td colNo="A7" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A7" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A7}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A8" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A8" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A8}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A9" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A9" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A9}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A6" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A6" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A6}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A5" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A5" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A5}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A4" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A4" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A4}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A3" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A3" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A3}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A0" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A0" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A0}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A1" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A1" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A1}" seq="%{#seq}" />
			</td>
			<bu:td colNo="A2" formId="9be6d0e38a8b4458951573db75f47ff7" />
				<bu:ui colNo="A2" formId="9be6d0e38a8b4458951573db75f47ff7" value="%{A2}" seq="%{#seq}" />
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
		<bu:submit viewId="6624e7d1aa8d402baf50dcef6636988e" />
		<bu:script viewId="6624e7d1aa8d402baf50dcef6636988e" />
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
