<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="csj知识库" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="eb80ecea7f894fadab4d944dd970b7ad"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="65021acb53724966a8d950e4a6888bee" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="65021acb53724966a8d950e4a6888bee" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='eb80ecea7f894fadab4d944dd970b7ad'/>
 <div class="panel datagrid datagrid-div1"  id="eb80ecea7f894fadab4d944dd970b7ad">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" style="min-width:1580px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz" >
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="eb80ecea7f894fadab4d944dd970b7ad" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td class="datagrid-cell" style="width:8%;"><bu:uitn colNo="STATE" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td class="datagrid-cell" style="width:16%;"><bu:uitn colNo="THEME" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td class="datagrid-cell" style="width:16%;"><bu:uitn colNo="PROJECT" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td class="datagrid-cell" style="width:22%;"><bu:uitn colNo="MODNAME" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td class="datagrid-cell" style="width:12%;"><bu:uitn colNo="TYPE" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz" style="min-width:1580px;">
		<tbody id="tbody_eb80ecea7f894fadab4d944dd970b7ad">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
		
			<td style="width:30px; text-align:center" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" />
<input type="hidden" value="${STATE}" id="state_${ID}"/>
</td>
			<td style="width:30px; text-align:center" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="eb80ecea7f894fadab4d944dd970b7ad" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="STATE" formId="eb80ecea7f894fadab4d944dd970b7ad" style="width:8%;">
				<bu:ui colNo="STATE" formId="eb80ecea7f894fadab4d944dd970b7ad"  value="%{STATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="THEME" formId="eb80ecea7f894fadab4d944dd970b7ad" style="width:16%;">
				<bu:ui colNo="THEME" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{THEME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="PROJECT" formId="eb80ecea7f894fadab4d944dd970b7ad" style="width:16%;">
				<bu:ui colNo="PROJECT" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{PROJECT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="MODNAME" formId="eb80ecea7f894fadab4d944dd970b7ad" style="width:22%;">
				<bu:ui colNo="MODNAME" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{MODNAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="TYPE" formId="eb80ecea7f894fadab4d944dd970b7ad" style="width:12%;">
				<bu:ui colNo="TYPE" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="CREATE_TIME" formId="eb80ecea7f894fadab4d944dd970b7ad">
				<bu:ui colNo="CREATE_TIME" formId="eb80ecea7f894fadab4d944dd970b7ad" value="%{CREATE_TIME}" seq="%{#seq}" />
			</bu:td>
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
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
		<bu:submit viewId="65021acb53724966a8d950e4a6888bee" />
		<bu:script viewId="65021acb53724966a8d950e4a6888bee" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
		}
		if($("#isClearOrder").val()==1){
    		clearSelectOrder();
    	}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg,title,width,height,time){
		//utilsFp.alert(msg,reloadPgExe);
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		//document.forms.searchForm.submit();
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
 	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
