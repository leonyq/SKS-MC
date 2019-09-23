<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="测试1-zm" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="b698450bc8a243f38edcd1e22f534753"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="7d1847782a024242af338d8d32fb7497" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="7d1847782a024242af338d8d32fb7497" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="b698450bc8a243f38edcd1e22f534753">
  <input type="hidden" name="formId" value="b698450bc8a243f38edcd1e22f534753" />
		<bu:table id="table_b698450bc8a243f38edcd1e22f534753" width="100%" cssClass="dlist-table table-line" viewId="7d1847782a024242af338d8d32fb7497" formId="b698450bc8a243f38edcd1e22f534753" list="dataList" formidFirstId="b698450bc8a243f38edcd1e22f534753" relColIds="e848ba4c2e3d45378446ec9441dc43d3" subFormIds="16fa05eac41448b085bcf03fb3c684fe" subRelColIds="e12ffb44b5b84593ad1f1d87813f1b48">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<th width="50px"><bu:thSeq formId="b698450bc8a243f38edcd1e22f534753" i18n="1"/></th>
			<th><bu:thSBox formId="b698450bc8a243f38edcd1e22f534753" /></th>
			<th><bu:uitn colNo="CLASS_NAME" formId="b698450bc8a243f38edcd1e22f534753" /></th>
		</bu:thTr>
		</thead>
		<tbody id="tbody_b698450bc8a243f38edcd1e22f534753">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<td><bu:tdSeq seq="%{#seq.count}" /></td>
			<td><bu:tdSBox formidFirstId="b698450bc8a243f38edcd1e22f534753" /></td>
			<bu:td colNo="CLASS_NAME" formId="b698450bc8a243f38edcd1e22f534753" >
				<bu:ui colNo="CLASS_NAME" formId="b698450bc8a243f38edcd1e22f534753" value="%{CLASS_NAME}" seq="%{#seq}" />
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

		<div style="padding:1px;"></div>

		<bu:form viewId="7d1847782a024242af338d8d32fb7497" formId="16fa05eac41448b085bcf03fb3c684fe" isSubForm="1" list="dataListSub" formidFirstId="b698450bc8a243f38edcd1e22f534753" relColIds="" subFormIds="" subRelColIds="" />
  <div class="center">
    <s:include value="/plf/page/fp/paginationAx.jsp?formId=16fa05eac41448b085bcf03fb3c684fe&listDataFn=_listSubDataAx&showLoading=0" />
  </div>
</div>


		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="7d1847782a024242af338d8d32fb7497" />
		<bu:script viewId="7d1847782a024242af338d8d32fb7497" />
	<script type="text/javascript">

	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		//如果有时间段的存在，则复制到搜索表单中
		if($("#timeBucketId")){
			$("#searchForm").append($("#timeBucketId").clone());
		}
		document.forms.searchForm.submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg){
		utilsFp.alert(msg,reloadPgExe);
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
            if($("#searchParaShowState").val() == "" || $("#searchParaShowState").val() == "0"){
            	$("#searchParaShowState").val("1");
            }else{
            	$("#searchParaShowState").val("0");
            }
          })
		//判断是否隐藏搜索框
		if($("#searchParaNull").val()=="0"){
			$(".search-box").hide();
		}else if($("#searchParaNull").val() <= "3"){
			$(".search-box .more").hide();
		}else{
    		if($("#searchParaShowState").val() == "1"){
   				$(".search-box").addClass("show");
    		}
    	}
	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
