<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="cs-yi-b4-zm" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
		<jsp:param name="msData" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="46a69fb9850f4b81909589215ac5053a"/>

</head>
<body scroll="auto" style="overflow: auto;" >

	<div class="content-in">
              <div class="dlist">
                  <div class="hd">
		<bu:func viewId="e6c2313b6272449ab7a3daf03abd1ebc" />
                  </div>
                  
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="e6c2313b6272449ab7a3daf03abd1ebc" />
						</form>
                        <a href="javascript:void(0);" class="more"></a>
                      </div>

		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
<input type="hidden" name="formId" id="formId1" value='46a69fb9850f4b81909589215ac5053a'/>
<div class="datagrid-div6 tableContainer-ajax"  id="tableContainer46a69fb9850f4b81909589215ac5053a">
<div class="datagrid-div5 leftTable-ajax" id="leftTable-ajax46a69fb9850f4b81909589215ac5053a">
 <div class="panel-ajax datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
 <div class="datagrid-div2 datagrid-div6 left-datagrid-view-ajax" id="left-datagrid-view-ajax46a69fb9850f4b81909589215ac5053a" style="">
 <div class="datagrid-header left-datagrid-header-ajax datagrid-div6">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table   cssClass="datagrid-htable fixedTable datagrid-div6 left-datagrid-htable-ajax" id="left-datagrid-htable46a69fb9850f4b81909589215ac5053a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row left-datagrid-title-ajax" id="left-datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center" ><bu:thSeq formId="46a69fb9850f4b81909589215ac5053a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_46a69fb9850f4b81909589215ac5053a" onclick="_selectAjaxTableAllData(this,'46a69fb9850f4b81909589215ac5053a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAME" formId="46a69fb9850f4b81909589215ac5053a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div4 left-datagrid-body-ajax datagrid-div6" id="leftTableDiv46a69fb9850f4b81909589215ac5053a" >
<table class="datagrid-btable fixedTable "  id="left-datagrid-btable-ajax46a69fb9850f4b81909589215ac5053a">
<tbody id="left-tbody_46a69fb9850f4b81909589215ac5053a" class="isParents">
</tbody></table>  </div>
  </div>
  </div>
  </div>
<div class="datagrid-div7 contentTable"  id="contentTable46a69fb9850f4b81909589215ac5053a">
<input type="hidden" id="subRelColIds" name="subRelColIds" value='838ca5844aa648d193678e96bd870742,8c6a9b933e49400aaf2134d7ba44cbc3'/>
<input type="hidden" id="subFormIds" name="subFormIds" value='677346fc6b47486ba7a9164f03017738,612afe7157ae46479b87fdd32cb77485'/>
 <div class="panel-ajax datagrid datagrid-div1"  id="46a69fb9850f4b81909589215ac5053a">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax46a69fb9850f4b81909589215ac5053a" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable46a69fb9850f4b81909589215ac5053a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell"><bu:uitn colNo="SEX" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="QQ" formId="46a69fb9850f4b81909589215ac5053a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="AGE" formId="46a69fb9850f4b81909589215ac5053a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv46a69fb9850f4b81909589215ac5053a" onscroll="ajaxTableScroll(this,'46a69fb9850f4b81909589215ac5053a')">
<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax46a69fb9850f4b81909589215ac5053a">
<tbody id="tbody_46a69fb9850f4b81909589215ac5053a" class="isParents">
</tbody></table>  </div>
  </div>
  </div>
 </div>
 </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
<div class="center">
<s:include value="/plf/page/fp/paginationAx.jsp?listDataFn=listAjaxTable&formId=46a69fb9850f4b81909589215ac5053a&showLoading=0" />
</div>
  <% }}%></div>

<input type="hidden" name="formId" id="formId2" value='612afe7157ae46479b87fdd32cb77485'/>
 <div class="panel-ajax datagrid datagrid-div1"  id="612afe7157ae46479b87fdd32cb77485">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax612afe7157ae46479b87fdd32cb77485" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable612afe7157ae46479b87fdd32cb77485">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="612afe7157ae46479b87fdd32cb77485" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_612afe7157ae46479b87fdd32cb77485" onclick="_selectAjaxTableAllData(this,'612afe7157ae46479b87fdd32cb77485')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="PID" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TYPENAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TESTNAME" formId="612afe7157ae46479b87fdd32cb77485" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv612afe7157ae46479b87fdd32cb77485" onscroll="ajaxTableScroll(this,'612afe7157ae46479b87fdd32cb77485')">
<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax612afe7157ae46479b87fdd32cb77485">
<tbody id="tbody_612afe7157ae46479b87fdd32cb77485" class="isChilds">
</tbody></table>  </div>
  </div>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
<div class="center">
<s:include value="/plf/page/fp/paginationAx.jsp?listDataFn=listChildAjaxTable&formId=612afe7157ae46479b87fdd32cb77485&showLoading=0" />
</div>
  <% }}%></div>

<input type="hidden" name="formId" id="formId3" value='677346fc6b47486ba7a9164f03017738'/>
 <div class="panel-ajax datagrid datagrid-div1"  id="677346fc6b47486ba7a9164f03017738">
 <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax677346fc6b47486ba7a9164f03017738" style="">
 <div class="datagrid-header">
 <div class="datagrid-header-inner" id="datagrid-header-inner">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable677346fc6b47486ba7a9164f03017738">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="677346fc6b47486ba7a9164f03017738" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_677346fc6b47486ba7a9164f03017738" onclick="_selectAjaxTableAllData(this,'677346fc6b47486ba7a9164f03017738')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="B" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="C" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="D" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="E" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PID" formId="677346fc6b47486ba7a9164f03017738" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="A" formId="677346fc6b47486ba7a9164f03017738" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv677346fc6b47486ba7a9164f03017738" onscroll="ajaxTableScroll(this,'677346fc6b47486ba7a9164f03017738')">
<table class="datagrid-btable fixedTable"  id="datagrid-btable-ajax677346fc6b47486ba7a9164f03017738">
<tbody id="tbody_677346fc6b47486ba7a9164f03017738" class="isChilds">
</tbody></table>  </div>
  </div>
  </div>
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
<div class="center">
<s:include value="/plf/page/fp/paginationAx.jsp?listDataFn=listChildAjaxTable&formId=677346fc6b47486ba7a9164f03017738&showLoading=0" />
</div>
  <% }}%></div>

<input type="hidden" id="relColVals" name="relColVals" value='ID,ID'/>
<input type="hidden" name="tableCount" id="tableCount" value='3' />

		</form>

		</div>
	</div>
  </div>
		<bu:submit viewId="e6c2313b6272449ab7a3daf03abd1ebc" />
		<bu:script viewId="e6c2313b6272449ab7a3daf03abd1ebc" />
	<script type="text/javascript">
	
	// 主列表
	function listAjaxTable(formId){
   	 var url = "${path}buss/bussModel_listMsData.ms";
   	 var isFirstLoad = firstLoadThisPage(formId);
   	 var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
   	 var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
   	 util.showLoading("处理中...");
	 $.ajax({
			type: "POST",
		    dataType: "json",
		    url: url,
		    data:$("#searchForm").serialize()+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
			success: function(data){
				if(data.RES){
					var page = MSdata.page(formId, data);
					var uiTxt = MSdata.uiTxt(formId, data);
					createTableModel(data,formId);
					if(currentPage>20){
						setTableHeight(formId);
					}
					initPage(page,formId);
					clearChildTable();
				}else{
					utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
				}
			},
			error: function(msg){
				utilsFp.confirmIcon(3,"","","", msg,"","260","145");
			}
		});
	 	
   	}
	
	function query(thisObj){
		var formId = $("#formId1").val();
		listAjaxTable(formId);
	}
	
	function clearChildTable(){
		$(".isChilds").empty();
	}
	
	function setTableHeight(){
		$(".datagrid-htable").css("width",$(".datagrid-header").width()-20+'px');
		$(".datagrid-btable").css("width",$(".datagrid-header").width()-20+'px');
	}
	
	function alertInfo(msg){
		utilsFp.alert(msg);
	}
	
	function reloadPg(msg,title,width,height,time){
		msgPop(msg,"",title,width,height,time);
	}
	
	// 子列表
	function listChildAjaxTable(formId,paramList){
	    var data = {
   		    "page.currentPage":_GLO_FORM_PAGE_MAP[formId].currentPage,
    		"page.pageRecord":_GLO_FORM_PAGE_MAP[formId].pageRecord,
    		"paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
    		"paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
    		"paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
    		"paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
    		"paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
    		"paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
	    };
	    if(paramList != null && paramList != ""){
	    	data["paramList"] = paramList;
		}
	    util.showLoading("处理中...");
		var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}";
	    $.ajax({
			type: "POST",
		    dataType: "json",
		    url: url,
		    data:data,
			success: function(data){
				if(data.RES){
					var page = MSdata.page(formId, data);
					createTableModel(data,formId);
					initPage(page,formId);	
				}else{
					utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
				}
			},
			error: function(msg){
				utilsFp.confirmIcon(3,"","","", msg,"","260","145");
			}
		});
	}
	
	function initChildPage(formId){
		var ajaxPage = new Object();
		ajaxPage.currentPage = 1;
		ajaxPage.totalPage = 1;
		ajaxPage.totalRecord = 0;
		ajaxPage.totalPage = 1;
		ajaxPage.first = true;
		ajaxPage.last = true;
	    ajaxPage.page = true;
		showPageBar(ajaxPage,formId);
	}
	
	
	// 初始化分页插件
	function initPage(page,formId){
		var ajaxPage = new Object();
    	ajaxPage.currentPage = parseInt(page.currentPage);
    	ajaxPage.pageRecord = parseInt(page.pageRecord);
    	ajaxPage.totalPage = parseInt(page.totalPage);
    	ajaxPage.totalRecord = parseInt(page.totalRecord);
    	ajaxPage.first = page.first;
    	ajaxPage.last = page.last;
    	showPageBar(ajaxPage,formId);
	};
	
	// 判断是否首次异步访问
	function firstLoadThisPage(formId){
		if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
			return true;
		}
		return false;
	}
	
	function init(){
		if($(".leftTable-ajax").length>0){
			$(".leftTable-ajax").show();
		};
		var tableCount = $("#tableCount").val();
		for ( var i = 2; i <= tableCount; i++) {
			initChildPage($("#formId"+i).val());
		}
		listAjaxTable($("#formId1").val());
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
 	}

	$(function(){
		var colNo = $("#relColVals").val();
		var subRelColIds = $("#subRelColIds").val();
		var subFormIds = $("#subFormIds").val();
		if(subRelColIds!="null"){
			var formId1 = $("#formId1").val();
			$(".isParents tr").live("click",function(){
				var _this = $(this);
				var relColVals = "";
				var abbr = _this.attr("abbr");
				var arrColNo = colNo.split(",");
				$(arrColNo).each(function(i,v){
					var childVal = $("tr[abbr='"+abbr+"']").find("input[type='hidden']").val();
					relColVals += childVal+",";
				});
				setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
			});
		};
	});
</script>
<script>
function createTableModel(data,formId){
var arrHtml = [];
var arrLeftHtml = [];
var uiTxt = MSdata.uiTxt(formId, data)==null?[]:MSdata.uiTxt(formId, data);
var trClass = MSdata.trClass(formId, data);
var trStyle = MSdata.trStyle(formId, data);
var trEvent = MSdata.trEvent(formId, data);
if(formId=='46a69fb9850f4b81909589215ac5053a'){
$.each(uiTxt,function(i,v){
var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+(v._SEQ+1000)+"</span></td>");
arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
arrLeftHtml.push("</td>");
}else{
arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+(v._SEQ+1000)+"</span></td>");
arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
arrHtml.push("</td>");
}
arrLeftHtml.push("<td colno='NAME' class='datagrid-cell "+MSdata.tdClass(formId, 'NAME', data)+"' style='"+MSdata.tdStyle(formId, 'NAME', data)+"' "+MSdata.tdEvent(formId, 'NAME', data)+">")
arrLeftHtml.push("<span colno='NAME' class='"+MSdata.uiClass(formId, 'NAME', data)+"' style='"+MSdata.uiStyle(formId, 'NAME', data)+"' "+MSdata.uiEvent(formId, 'NAME', data)+" >"+v['NAME']+"</span>")
arrLeftHtml.push("</td>");
arrHtml.push("<td colno='SEX' class='datagrid-cell "+MSdata.tdClass(formId, 'SEX', data)+"' style='"+MSdata.tdStyle(formId, 'SEX', data)+"' "+MSdata.tdEvent(formId, 'SEX', data)+">")
arrHtml.push("<span colno='SEX' class='"+MSdata.uiClass(formId, 'SEX', data)+"' style='"+MSdata.uiStyle(formId, 'SEX', data)+"' "+MSdata.uiEvent(formId, 'SEX', data)+" >"+v['SEX']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='QQ' class='datagrid-cell "+MSdata.tdClass(formId, 'QQ', data)+"' style='"+MSdata.tdStyle(formId, 'QQ', data)+"' "+MSdata.tdEvent(formId, 'QQ', data)+">")
arrHtml.push("<span colno='QQ' class='"+MSdata.uiClass(formId, 'QQ', data)+"' style='"+MSdata.uiStyle(formId, 'QQ', data)+"' "+MSdata.uiEvent(formId, 'QQ', data)+" >"+v['QQ']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='AGE' class='datagrid-cell "+MSdata.tdClass(formId, 'AGE', data)+"' style='"+MSdata.tdStyle(formId, 'AGE', data)+"' "+MSdata.tdEvent(formId, 'AGE', data)+">")
arrHtml.push("<span colno='AGE' class='"+MSdata.uiClass(formId, 'AGE', data)+"' style='"+MSdata.uiStyle(formId, 'AGE', data)+"' "+MSdata.uiEvent(formId, 'AGE', data)+" >"+v['AGE']+"</span>")
arrHtml.push("</td>");
arrHtml.push("</tr>")
});
if($("#leftTableDiv"+formId).length>0){
$("#left-tbody_"+formId).html(arrLeftHtml.join(""));
}
$("#tbody_"+formId).html(arrHtml.join(""));
}
if(formId=='612afe7157ae46479b87fdd32cb77485'){
$.each(uiTxt,function(i,v){
var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
arrLeftHtml.push("</td>");
}else{
arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
arrHtml.push("</td>");
}
arrHtml.push("<td colno='PID' class='datagrid-cell "+MSdata.tdClass(formId, 'PID', data)+"' style='"+MSdata.tdStyle(formId, 'PID', data)+"' "+MSdata.tdEvent(formId, 'PID', data)+">")
arrHtml.push("<span colno='PID' class='"+MSdata.uiClass(formId, 'PID', data)+"' style='"+MSdata.uiStyle(formId, 'PID', data)+"' "+MSdata.uiEvent(formId, 'PID', data)+" >"+v['PID']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='NAME' class='datagrid-cell "+MSdata.tdClass(formId, 'NAME', data)+"' style='"+MSdata.tdStyle(formId, 'NAME', data)+"' "+MSdata.tdEvent(formId, 'NAME', data)+">")
arrHtml.push("<span colno='NAME' class='"+MSdata.uiClass(formId, 'NAME', data)+"' style='"+MSdata.uiStyle(formId, 'NAME', data)+"' "+MSdata.uiEvent(formId, 'NAME', data)+" >"+v['NAME']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='TYPENAME' class='datagrid-cell "+MSdata.tdClass(formId, 'TYPENAME', data)+"' style='"+MSdata.tdStyle(formId, 'TYPENAME', data)+"' "+MSdata.tdEvent(formId, 'TYPENAME', data)+">")
arrHtml.push("<span colno='TYPENAME' class='"+MSdata.uiClass(formId, 'TYPENAME', data)+"' style='"+MSdata.uiStyle(formId, 'TYPENAME', data)+"' "+MSdata.uiEvent(formId, 'TYPENAME', data)+" >"+v['TYPENAME']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='TESTNAME' class='datagrid-cell "+MSdata.tdClass(formId, 'TESTNAME', data)+"' style='"+MSdata.tdStyle(formId, 'TESTNAME', data)+"' "+MSdata.tdEvent(formId, 'TESTNAME', data)+">")
arrHtml.push("<span colno='TESTNAME' class='"+MSdata.uiClass(formId, 'TESTNAME', data)+"' style='"+MSdata.uiStyle(formId, 'TESTNAME', data)+"' "+MSdata.uiEvent(formId, 'TESTNAME', data)+" >"+v['TESTNAME']+"</span>")
arrHtml.push("</td>");
arrHtml.push("</tr>")
});
if($("#leftTableDiv"+formId).length>0){
$("#left-tbody_"+formId).html(arrLeftHtml.join(""));
}
$("#tbody_"+formId).html(arrHtml.join(""));
}
if(formId=='677346fc6b47486ba7a9164f03017738'){
$.each(uiTxt,function(i,v){
var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
arrLeftHtml.push("</td>");
}else{
arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
arrHtml.push("</td>");
}
arrHtml.push("<td colno='B' class='datagrid-cell "+MSdata.tdClass(formId, 'B', data)+"' style='"+MSdata.tdStyle(formId, 'B', data)+"' "+MSdata.tdEvent(formId, 'B', data)+">")
arrHtml.push("<span colno='B' class='"+MSdata.uiClass(formId, 'B', data)+"' style='"+MSdata.uiStyle(formId, 'B', data)+"' "+MSdata.uiEvent(formId, 'B', data)+" >"+v['B']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='C' class='datagrid-cell "+MSdata.tdClass(formId, 'C', data)+"' style='"+MSdata.tdStyle(formId, 'C', data)+"' "+MSdata.tdEvent(formId, 'C', data)+">")
arrHtml.push("<span colno='C' class='"+MSdata.uiClass(formId, 'C', data)+"' style='"+MSdata.uiStyle(formId, 'C', data)+"' "+MSdata.uiEvent(formId, 'C', data)+" >"+v['C']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='D' class='datagrid-cell "+MSdata.tdClass(formId, 'D', data)+"' style='"+MSdata.tdStyle(formId, 'D', data)+"' "+MSdata.tdEvent(formId, 'D', data)+">")
arrHtml.push("<span colno='D' class='"+MSdata.uiClass(formId, 'D', data)+"' style='"+MSdata.uiStyle(formId, 'D', data)+"' "+MSdata.uiEvent(formId, 'D', data)+" >"+v['D']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='E' class='datagrid-cell "+MSdata.tdClass(formId, 'E', data)+"' style='"+MSdata.tdStyle(formId, 'E', data)+"' "+MSdata.tdEvent(formId, 'E', data)+">")
arrHtml.push("<span colno='E' class='"+MSdata.uiClass(formId, 'E', data)+"' style='"+MSdata.uiStyle(formId, 'E', data)+"' "+MSdata.uiEvent(formId, 'E', data)+" >"+v['E']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='PID' class='datagrid-cell "+MSdata.tdClass(formId, 'PID', data)+"' style='"+MSdata.tdStyle(formId, 'PID', data)+"' "+MSdata.tdEvent(formId, 'PID', data)+">")
arrHtml.push("<span colno='PID' class='"+MSdata.uiClass(formId, 'PID', data)+"' style='"+MSdata.uiStyle(formId, 'PID', data)+"' "+MSdata.uiEvent(formId, 'PID', data)+" >"+v['PID']+"</span>")
arrHtml.push("</td>");
arrHtml.push("<td colno='A' class='datagrid-cell "+MSdata.tdClass(formId, 'A', data)+"' style='"+MSdata.tdStyle(formId, 'A', data)+"' "+MSdata.tdEvent(formId, 'A', data)+">")
arrHtml.push("<span colno='A' class='"+MSdata.uiClass(formId, 'A', data)+"' style='"+MSdata.uiStyle(formId, 'A', data)+"' "+MSdata.uiEvent(formId, 'A', data)+" >"+v['A']+"</span>")
arrHtml.push("</td>");
arrHtml.push("</tr>")
});
if($("#leftTableDiv"+formId).length>0){
$("#left-tbody_"+formId).html(arrLeftHtml.join(""));
}
$("#tbody_"+formId).html(arrHtml.join(""));
}
 setNumColWidth(formId);
}
</script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
