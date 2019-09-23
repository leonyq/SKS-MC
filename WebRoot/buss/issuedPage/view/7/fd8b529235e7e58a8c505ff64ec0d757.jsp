<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="物料组-列表" />
	</title>
	<style type="text/css">
	.datagrid-header,.datagrid-div3{
	width:100% !important;
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
		<bu:func viewId="01677bc4274a4193837e94e1e07f8f9a" />
                  </div>
                  
                  <div class="bd bd-left" id="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="01677bc4274a4193837e94e1e07f8f9a" />
						</form>
                      </div>
<div class="block1" style="float:left;width:33%;overflow-y:auto;">	

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
  <input type="hidden" name="formId" id="formId" value="4e26051dfc65446098d440a56f1c41f8" />
<div class="panel datagrid datagrid-div1"  id="4e26051dfc65446098d440a56f1c41f8" >
 <div class="datagrid-div2 datagrid-div6 datagrid-view-kz" id="datagrid-view-kz"  >
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner" >
		<bu:table   cssClass="datagrid-htable fixedTable datagrid-div6" >
		<s:set name="_$type" value="'view'" />
		<tbody>
		<bu:tr cssClass="datagrid-header-row" id="datagrid-title-kz">
			<td class="datagrid-cell" style="width:20px; text-align:center;" ><bu:thSeq  formId="4e26051dfc65446098d440a56f1c41f8" i18n="1"/></td>
			<td class="datagrid-cell" style="width:20px; text-align:center"><bu:thSBox listType="2" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			
			<td class="datagrid-cell"  style="width:120px;"><bu:uitn colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
			
			<td class="datagrid-cell"  ><bu:uitn colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3" id="datagrid-body-kz"  onscroll="tableScroll()">
		<bu:table cssClass="datagrid-btable fixedTable" id="datagrid-btable-kz" >
		<tbody id="tbody_4e26051dfc65446098d440a56f1c41f8">
		<bu:loop id="ls" value="dataList" status="seq" >
		<bu:tr cssClass="datagrid-row"  onclick="showDetail('${CIG_SN}');">
			<td style="width:20px;text-align:center;" class="datagrid-cell datagrid-cell-0">
            <bu:tdSeq currentPage="${page.currentPage}" pageRecord="${page.pageRecord}" seq="%{#seq.count}" />
                <s:if test="${seq.count}==1">
					<input type="hidden" id="getNum" value="${CIG_SN}"/>
				</s:if></td>
			<td style="width:20px;text-align:center;" class="datagrid-cell datagrid-cell-1">
            <bu:tdSBox formidFirstId="4e26051dfc65446098d440a56f1c41f8" /></td>
			<bu:td cssClass="datagrid-cell datagrid-cell-2"  style="width:120px;" colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" >
				<bu:ui colNo="CIG_SN" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_SN}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-3"  style="width:120px;" colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" >
				<bu:ui colNo="CIG_NAME" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_NAME}" seq="%{#seq}" />
			</bu:td>
			<bu:td cssClass="datagrid-cell datagrid-cell-4"   colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" >
				<bu:ui colNo="CIG_TYPE" formId="4e26051dfc65446098d440a56f1c41f8" value="%{CIG_TYPE}" seq="%{#seq}" />
			</bu:td>
			
		</bu:tr>
		</bu:loop>
		</tbody>
		</bu:table>
  </div>
  </div>
  </div>
	
		</form>
  </div>		
		<div  style="width:65%;float:right;">
		
	   <div>
	   
		 <iframe id="itemiframe" name="itemiframe" frameBorder="0"	src=""  scrolling="auto" 
		     style="border-right: 1px;width: 100%;" >
		</iframe>   
		</div>
		</div>
			
  </div>
  
  </div>
		
		
</div>
	
		<bu:submit viewId="01677bc4274a4193837e94e1e07f8f9a" />
		<bu:script viewId="01677bc4274a4193837e94e1e07f8f9a" />
	<script type="text/javascript">
	
	$(function(){
		initHeight();
	})
	
	function  initHeight(){
		$('.dlist .bd-left').height($(parent.window).height() - 65 -36 - 30 + 15); 
		$('.block1').height($('#bd').height() - 35 + 16) ;
		$('#itemiframe').height($('#bd').height() - 35 + 1) ;
	}
	
	
	
	$(window).resize(function(){
		initHeight();
		
	}); 
	function lookDetails(thisId){
      		var url = "buss/bussModel_exeFunc.ms?FUNC_CODE=F1772&funcMId=de5f6c13c0274a2bbb827b66aa57ee94&formId=&dataId="+thisId;
      		 showPopWinFp(url, 800, 500,null,"<dict:lang value="详细信息" />"); 
      		 
	}
	
	//分页相关
	var ajaxPage;
	 ajaxPage = new Object();
		
		/* var firstTemp = "${page.first}";
		var lastTemp = "${page.last}";
		ajaxPage.currentPage = parseInt("${page.currentPage}");
		ajaxPage.pageRecord = parseInt("${page.pageRecord}");
		ajaxPage.totalPage = parseInt("${page.totalPage}");
		ajaxPage.totalRecord = parseInt("${page.totalRecord}");
		ajaxPage.first = firstTemp == "true" ? true : false;
		ajaxPage.last = lastTemp == "true" ? true : false;
		showPageBar(ajaxPage,"listForm1"); */
		
		//var groupSn;
		function listAx1(paginationImpl,groupSn){
		
		var url = urlDetail+"&type=0&pageRecord=20&groupSn="+groupSn;
		parentWindow = $("#itemiframe")[0].contentWindow;
		parentWindow.frameElement.src= url;
		
		
	 
	}
	
	function showDetail(thisSn){
		//alert($("#getNum").val());
		//alert(urlDetail);
    	
    	listAx1("listForm1",thisSn);
	}

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
	
	function reloadPg(msg,title,width,height,time){
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
		top.$(".dialog-close").click();
	}
	//页面刷新默认显示第一条物料组里面的物料
	$(document).ready(function () {   
    			//分页相关
		/*ajaxPage = new Object();
		var firstTemp = "${page.first}";
		var lastTemp = "${page.last}";
		ajaxPage.currentPage = parseInt("${page.currentPage}");
		ajaxPage.pageRecord = parseInt("${page.pageRecord}");
		ajaxPage.totalPage = parseInt("${page.totalPage}");
		ajaxPage.totalRecord = parseInt("${page.totalRecord}");
		ajaxPage.first = firstTemp == "true" ? true : false;
		ajaxPage.last = lastTemp == "true" ? true : false;
		showPageBar(ajaxPage,"listForm1");
		listAx1("listForm1");*/
		
			
	});
	function init(){
	
	   var  groupSn = $("#getNum").val();
		listAx1("listForm1",groupSn);
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
        
	}

</script>


<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
