<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="测试-zm" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="16fa05eac41448b085bcf03fb3c684fe"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="8592bf867d7243c89d39fd618fc29a7a" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="8592bf867d7243c89d39fd618fc29a7a" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="16fa05eac41448b085bcf03fb3c684fe">
  <input type="hidden" name="formId" value="16fa05eac41448b085bcf03fb3c684fe" />
		<bu:table id="table_16fa05eac41448b085bcf03fb3c684fe" width="100%" cssClass="dlist-table table-line" viewId="8592bf867d7243c89d39fd618fc29a7a" formId="16fa05eac41448b085bcf03fb3c684fe" list="dataList" formidFirstId="16fa05eac41448b085bcf03fb3c684fe" relColIds="" subFormIds="" subRelColIds="">
		<s:set name="_$type" value="'view'" />
		<thead>
		<bu:thTr>
			<th width="50px"><bu:thSeq formId="16fa05eac41448b085bcf03fb3c684fe" i18n="1"/></th>
			<th><bu:thSBox formId="16fa05eac41448b085bcf03fb3c684fe" /></th>
			<th><bu:uitn colNo="STUDENT_NAME" formId="16fa05eac41448b085bcf03fb3c684fe" /></th>
			<th><bu:uitn colNo="CLASS_ID" formId="16fa05eac41448b085bcf03fb3c684fe" /></th>
		</bu:thTr>
		</thead>
		<tbody id="tbody_16fa05eac41448b085bcf03fb3c684fe">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr>
			<td><bu:tdSeq seq="%{#seq.count}" /></td>
			<td><bu:tdSBox formidFirstId="16fa05eac41448b085bcf03fb3c684fe" /></td>
			<bu:td colNo="STUDENT_NAME" formId="16fa05eac41448b085bcf03fb3c684fe" >
				<bu:ui colNo="STUDENT_NAME" formId="16fa05eac41448b085bcf03fb3c684fe" value="%{STUDENT_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td colNo="CLASS_ID" formId="16fa05eac41448b085bcf03fb3c684fe" >
				<bu:ui colNo="CLASS_ID" formId="16fa05eac41448b085bcf03fb3c684fe" value="%{CLASS_ID}" seq="%{#seq}" />
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
		<bu:submit viewId="8592bf867d7243c89d39fd618fc29a7a" />
		<bu:script viewId="8592bf867d7243c89d39fd618fc29a7a" />
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
