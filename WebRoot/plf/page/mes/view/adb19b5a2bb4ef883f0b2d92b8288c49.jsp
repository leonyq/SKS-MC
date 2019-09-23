<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="知识库-列表" />
	</title>
	<style>
		td{
			box-sizing:border-box;
		}
		
	</style>
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
		<bu:func viewId="317fa974b10b468ab73dadc44a004d33" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="317fa974b10b468ab73dadc44a004d33" />
						</form>
                        <a href="javascript:;" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="fe095434a96d487688e6bcb3ff6dc09b">
  <input type="hidden" name="formId" value="fe095434a96d487688e6bcb3ff6dc09b" />
		<div class="panel datagrid datagrid-div1"  id="fe095434a96d487688e6bcb3ff6dc09b">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6"   style="min-width:1600px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="fe095434a96d487688e6bcb3ff6dc09b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:60px; text-align:center"><bu:uitn colNo="STATE" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="THEME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PROJECT" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="MODNAME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="TYPE" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:90px; text-align:center"><bu:uitn colNo="EXAMINE_USER" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="EXAMINE_TIME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="EXAMINE_DETAILS" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="COUNTERMOVE" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="REASON" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="datagrid-cell" style="text-align:center;"><bu:uitn colNo="DETAIL" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-kz" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz"  style="min-width:1580px;">
		<tbody id="tbody_fe095434a96d487688e6bcb3ff6dc09b">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="STATE" formId="fe095434a96d487688e6bcb3ff6dc09b" style="width:60px; text-align:center;">
				<bu:ui colNo="STATE" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{STATE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="THEME" formId="fe095434a96d487688e6bcb3ff6dc09b" style="width:150px; text-align:left">
				<bu:ui colNo="THEME" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{THEME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="PROJECT" formId="fe095434a96d487688e6bcb3ff6dc09b" style="width:150px; text-align:left">
				<bu:ui colNo="PROJECT" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{PROJECT}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="MODNAME" formId="fe095434a96d487688e6bcb3ff6dc09b" style="width:150px; text-align:left">
				<bu:ui colNo="MODNAME" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{MODNAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="TYPE" formId="fe095434a96d487688e6bcb3ff6dc09b" style="width:150px; text-align:left">
				<bu:ui colNo="TYPE" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="EXAMINE_USER" formId="fe095434a96d487688e6bcb3ff6dc09b" style="width:90px; text-align:left">
				<bu:ui colNo="EXAMINE_USER" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{EXAMINE_USER}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="EXAMINE_TIME" formId="fe095434a96d487688e6bcb3ff6dc09b" style="width:140px; text-align:center;">
				<bu:ui colNo="EXAMINE_TIME" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{EXAMINE_TIME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="EXAMINE_DETAILS" formId="fe095434a96d487688e6bcb3ff6dc09b" style="width:150px; text-align:left">
				<bu:ui colNo="EXAMINE_DETAILS" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{EXAMINE_DETAILS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-9" colNo="COUNTERMOVE" formId="fe095434a96d487688e6bcb3ff6dc09b"  style="width:150px; text-align:left">
				<bu:ui colNo="COUNTERMOVE" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{COUNTERMOVE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-10" colNo="REASON" formId="fe095434a96d487688e6bcb3ff6dc09b"  style="width:150px;text-align:left;">
				<bu:ui colNo="REASON" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{REASON}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="DETAIL" formId="fe095434a96d487688e6bcb3ff6dc09b"  style="text-align:left;">
				<bu:ui colNo="DETAIL" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{DETAIL}" seq="%{#seq}" />
			</bu:td>
			<td style="display: none;" > <input type="hidden" id="state_${ID}" value="${STATE}"/></td>
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
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
		<bu:submit viewId="317fa974b10b468ab73dadc44a004d33" />
		<bu:script viewId="317fa974b10b468ab73dadc44a004d33" />
	<script type="text/javascript">
	    
      
    	var isQuery = false;
    	function query(thisObj){
    		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    			$("#searchForm").find("#timeBucketId").wrap("<div id=\"timeBucketIdDiv\" style=\"display:none;\"></div>");
    		}
    		if(isQuery){//utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
    		utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
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
		query();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			//_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});

		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
		
}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
