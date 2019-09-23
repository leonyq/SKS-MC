<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="BOM清单_列表" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="b90cc2e47a064117883be211049b722f" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="b90cc2e47a064117883be211049b722f" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="881411561f8f4940ac22575c4b8f02ef">
  <input type="hidden" name="formId" value="881411561f8f4940ac22575c4b8f02ef" />
		<div class="panel datagrid datagrid-div1"  id="881411561f8f4940ac22575c4b8f02ef">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="881411561f8f4940ac22575c4b8f02ef" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<td class="datagrid-cell"><dict:lang value="明细信息" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz">
		<tbody id="tbody_881411561f8f4940ac22575c4b8f02ef">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" >
				<bu:ui colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" value="%{CB_ITEM_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" >
				<bu:ui colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" >
				<bu:ui colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" value="%{T2#CI_ITEM_SPEC}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" style="text-align:right;">
				<bu:ui colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" value="%{CB_VER}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" style="text-align:center;">
				<bu:ui colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" value="%{CB_STATUS}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" style="text-align:center;">
				<bu:ui colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" value="%{CB_DEFAULT}" seq="%{#seq}" />
			</bu:td>
			<td style="text-align:center;"><a href="javascript:void(0);" onclick="lookDetail('${ID}');" ><dict:lang value="详细信息" /></a></td>
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

		<div style="padding:1px;"></div>

		
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=b9f80468a9fe4b74ada4fceff23db738&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="b90cc2e47a064117883be211049b722f" />
		<bu:script viewId="b90cc2e47a064117883be211049b722f" />
	<script type="text/javascript">
	function lookDetail(dataId){
		var url=detailUrl+"&dataId="+dataId;
		showPopWinFp(url, 800, 400,null,"<dict:lang value="明细" />");
	}
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
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
        $(".search-box .more").click(function(){
            $(".search-box").toggleClass("show");
          })
		//判断是否隐藏搜索框
		if($("#searchParaNull").val()=="0"){
			$(".search-box").hide();
		}else if($("#searchParaNull").val() <= "3"){
			$(".search-box .more").hide();
		}
	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
