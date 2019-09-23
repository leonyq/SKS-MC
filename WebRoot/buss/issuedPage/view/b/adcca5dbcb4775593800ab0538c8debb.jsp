<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="vm" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="62aabb92147842e1983bcfcda04f9a1d"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="f2a460676a584cb2a31b31e54cacceae" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="f2a460676a584cb2a31b31e54cacceae" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" value='62aabb92147842e1983bcfcda04f9a1d'/>
 <div class="panel datagrid datagrid-div1"  id="62aabb92147842e1983bcfcda04f9a1d">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="62aabb92147842e1983bcfcda04f9a1d" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--1-->
			<td class="datagrid-cell" style="width:170px;"><bu:uitn colNo="CTO_TIN_SN" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--2-->
			<td class="datagrid-cell"><bu:uitn colNo="CTO_OPERATE_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--3-->
			<td class="datagrid-cell"><bu:uitn colNo="CTO_ITEM_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--4-->
			<td class="datagrid-cell"><bu:uitn colNo="CTO_TIN_CODEE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--5-->
			<td class="datagrid-cell"><bu:uitn colNo="CTO_TIN_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--6-->
			<td class="datagrid-cell"><bu:uitn colNo="CTO_TIN_SPEC" formId="62aabb92147842e1983bcfcda04f9a1d"/></td>
			<!--7-->
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CTO_TIN_LOT" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--8-->
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTO_SUPPLIER_NAME" formId="62aabb92147842e1983bcfcda04f9a1d"/></td>
			<!--9-->
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTO_OPERATE_TIME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<!--10-->
			<td class="datagrid-cell"><bu:uitn colNo="CTO_OPEATOR" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			
			 
			 
			
			
				
			
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz">
		<tbody id="tbody_62aabb92147842e1983bcfcda04f9a1d">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="62aabb92147842e1983bcfcda04f9a1d" /></td>

                         <bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="CTO_TIN_SN" formId="62aabb92147842e1983bcfcda04f9a1d" style="display:none">
                         <bu:ui colNo="ID"   formId="62aabb92147842e1983bcfcda04f9a1d" value="%{ID}"  seq="%{#seq}"/>
                         </bu:td>
                         
                         
			<bu:td cssClass="datagrid-cell datagrid-cell-1" colNo="CTO_TIN_SN" formId="62aabb92147842e1983bcfcda04f9a1d" style="width:170px;">
				<bu:ui colNo="CTO_TIN_SN" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_TIN_SN}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-2" colNo="CTO_OPERATE_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" style="text-align:center">
				<bu:ui colNo="CTO_OPERATE_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_OPERATE_TYPE}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-3" colNo="CTO_ITEM_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" style="text-align:center">
				<bu:ui colNo="CTO_ITEM_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_ITEM_TYPE}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-4" colNo="CTO_TIN_CODEE" formId="62aabb92147842e1983bcfcda04f9a1d" >
				<bu:ui colNo="CTO_TIN_CODEE" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_TIN_CODEE}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-5" colNo="CTO_TIN_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" >
				<bu:ui colNo="CTO_TIN_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_TIN_NAME}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-6" colNo="CTO_TIN_SPEC" formId="62aabb92147842e1983bcfcda04f9a1d">
				<bu:ui colNo="CTO_TIN_SPEC" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_TIN_SPEC}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-7" colNo="CTO_TIN_LOT" formId="62aabb92147842e1983bcfcda04f9a1d" style="width:100px;">
				<bu:ui colNo="CTO_TIN_LOT" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_TIN_LOT}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="CTO_SUPPLIER_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" style="width:150px;">
				<bu:ui colNo="CTO_SUPPLIER_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_SUPPLIER_NAME}" seq="%{#seq}" />
			</bu:td>
			
			 
			
			<bu:td cssClass="datagrid-cell datagrid-cell-10" colNo="CTO_OPERATE_TIME" formId="62aabb92147842e1983bcfcda04f9a1d" style="width:150px;text-align:center">
				<bu:ui colNo="CTO_OPERATE_TIME" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_OPERATE_TIME}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-11" colNo="CTO_OPEATOR" formId="62aabb92147842e1983bcfcda04f9a1d" style="text-align:center">
				<bu:ui colNo="CTO_OPEATOR" formId="62aabb92147842e1983bcfcda04f9a1d" value="%{CTO_OPEATOR}" seq="%{#seq}" />
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
		<bu:submit viewId="f2a460676a584cb2a31b31e54cacceae" />
		<bu:script viewId="f2a460676a584cb2a31b31e54cacceae" />
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
		$('#bd5a1f51c96a40aaa4e244c556ae1538').css('display','none');
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
 	}

</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
