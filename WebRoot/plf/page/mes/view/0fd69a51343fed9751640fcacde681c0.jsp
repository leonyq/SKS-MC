<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="禁用物料" />
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

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="4521edbd120c49f0b523fc3c0b1b51b8" />
                  </div>
                  
                  <div class="bd" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="4521edbd120c49f0b523fc3c0b1b51b8" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                        <script type="text/javascript">
                          $('.search-box .more').click(function(){
                            $('.search-box').toggleClass('show');
                            if($("#searchParaShowState").val() == "" || $("#searchParaShowState").val() == "0"){
                	$("#searchParaShowState").val("1");
                }else{
                	$("#searchParaShowState").val("0");
                }
                          })
                        </script>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <div id="09206fb514ca4b258beb531bc903334b">
  <input type="hidden" name="formId" value="09206fb514ca4b258beb531bc903334b" />
  <input type="hidden" name="flag_mm" id="flag_mm" value="111">
  		<div class="panel datagrid datagrid-div1"  id="09206fb514ca4b258beb531bc903334b">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz" >
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table  id="datagrid-htable-kz"  cssClass="datagrid-htable fixedTable datagrid-div6" style="min-width:1140px;">
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="09206fb514ca4b258beb531bc903334b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><bu:thSBox listType="2" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz" onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz" style="min-width:1120px;">
		<tbody id="tbody_09206fb514ca4b258beb531bc903334b">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row">
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-0">
<bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" /></td>
			<td style="width:30px;text-align:center;" class="datagrid-cell datagrid-cell-1">
<bu:tdSBox formidFirstId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-1" style="width:70px;text-align:center;" colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" >
				<bu:ui colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_TYPE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2" style="width:110px;" colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" >
				<bu:ui colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_PROJECT_ID}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3" style="width:110px;" colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" >
				<bu:ui colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_MODEL_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-7" style="width:70px;text-align:center;" colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" >
				<bu:ui colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_STATUS}" seq="%{#seq}" />
			</bu:td>
			
			<bu:td cssClass="datagrid-cell datagrid-cell-4" style="width:140px;" colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" >
				<bu:ui colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_ITEM_CODE}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-5" style="width:140px;" colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" >
				<bu:ui colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_ITEM_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-6" style="width:100px;" colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" >
				<bu:ui colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_ITEM_DESC}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-8" colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" ondblclick="remark(this);" title='%{CF_MEMO}'>
				<bu:ui colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_MEMO}" seq="%{#seq}" />
			</bu:td>
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
		<bu:submit viewId="4521edbd120c49f0b523fc3c0b1b51b8" />
		<bu:script viewId="4521edbd120c49f0b523fc3c0b1b51b8" />
	<script type="text/javascript">
	
	function remark(obj){
	utilsFp.popRemark("",obj.title,"");
	}
	$(function(){
          $('.dept_select').chosen();
      });
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
		//utilsFp.alert(msg,reloadPgExe);
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	
	function init(){
		$(".dlist-table").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_tongLineColor(tableTrJs);
		});
		//判断是否隐藏搜索框
		if($("#searchParaNull").val()=="0"){
			$(".search-box").hide();
		}else if($("#searchParaNull").val()<="3"){
			$(".search-box .more").hide();
			}else{
    			if($("#searchParaShowState").val() == "1"){
       				$(".search-box").addClass("show");
        			}
        		}

		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
		
	}
        function flag_m(){
         var flag_m = document.getElementById("flag_m").value;
         alert(flag_m);
         document.getElementById("flag_mm").value = flag_m;
        }
        
</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
