<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="库存复检" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="c408f3497e29446eb0d2f546ff63868b"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="90a3a2e3dc54419c98715ea778d62255" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="90a3a2e3dc54419c98715ea778d62255" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagec408f3497e29446eb0d2f546ff63868b" id="formPagec408f3497e29446eb0d2f546ff63868b" value="${formPagec408f3497e29446eb0d2f546ff63868b}"/>
		<input type="hidden" name="formId" id="formId1" value='c408f3497e29446eb0d2f546ff63868b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='56be054c8eab4ca1b5759c6f01b65147'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='c2bca7b7c2094a2495a26e6ca72b7bbc'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="c408f3497e29446eb0d2f546ff63868b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc408f3497e29446eb0d2f546ff63868b" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc408f3497e29446eb0d2f546ff63868b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec408f3497e29446eb0d2f546ff63868b" style="min-width:1480px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c408f3497e29446eb0d2f546ff63868b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c408f3497e29446eb0d2f546ff63868b" onclick="_selectAjaxTableAllData(this,'c408f3497e29446eb0d2f546ff63868b')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_DOC_NUM" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_TEST_DOC" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="T2#QII_LIST_FLAG" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_ITEM_CODE" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_ITEM_NAME" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_ITEM_SPEC" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WRD_ITEM_NUM" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WRD_CREATE_MAN" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WRD_CREATE_TIME" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WRD_MEMO" formId="c408f3497e29446eb0d2f546ff63868b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivc408f3497e29446eb0d2f546ff63868b" onscroll="ajaxTableScroll(this,'c408f3497e29446eb0d2f546ff63868b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxc408f3497e29446eb0d2f546ff63868b" style="min-width:1480px;">
		<tbody id="tbody_c408f3497e29446eb0d2f546ff63868b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec408f3497e29446eb0d2f546ff63868b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=c408f3497e29446eb0d2f546ff63868b&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="formPagec2bca7b7c2094a2495a26e6ca72b7bbc" id="formPagec2bca7b7c2094a2495a26e6ca72b7bbc" value="${formPagec2bca7b7c2094a2495a26e6ca72b7bbc}"/>
		<input type="hidden" name="formId" id="formId2" value='c2bca7b7c2094a2495a26e6ca72b7bbc'/>
		<div class="panel-ajax datagrid datagrid-div1" style="margin-top:10px;" id="c2bca7b7c2094a2495a26e6ca72b7bbc">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc2bca7b7c2094a2495a26e6ca72b7bbc" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc2bca7b7c2094a2495a26e6ca72b7bbc">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec2bca7b7c2094a2495a26e6ca72b7bbc" style="min-width:1600px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c2bca7b7c2094a2495a26e6ca72b7bbc" i18n="1"/></td>
		<!--	<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c2bca7b7c2094a2495a26e6ca72b7bbc" onclick="_selectAjaxTableAllData(this,'c2bca7b7c2094a2495a26e6ca72b7bbc')" style="cursor: pointer;"title="全选"/></span></td> -->
			<td class="datagrid-cell" style="width:250px;"><bu:uitn colNo="WRD_ITEM_SN" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_ITEM_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_ITEM_NAME" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_ITEM_SPEC" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="WRD_ITEM_NUM" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WRD_LOT_NO" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_SUP_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WRD_CUST_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WRD_WH_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WRD_DISTRICT_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WRD_STORAGE_CODE" formId="c2bca7b7c2094a2495a26e6ca72b7bbc" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivc2bca7b7c2094a2495a26e6ca72b7bbc" onscroll="ajaxTableScroll(this,'c2bca7b7c2094a2495a26e6ca72b7bbc')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxc2bca7b7c2094a2495a26e6ca72b7bbc" style="min-width:1600px;">
		<tbody id="tbody_c2bca7b7c2094a2495a26e6ca72b7bbc" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec2bca7b7c2094a2495a26e6ca72b7bbc==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=c2bca7b7c2094a2495a26e6ca72b7bbc&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" id="relColVals" name="relColVals" value='WRD_DOC_NUM'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="90a3a2e3dc54419c98715ea778d62255" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="90a3a2e3dc54419c98715ea778d62255" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExeAx(isCloseWin){
  	query("formId1");//alert(_currentFrame);
  	//document.getElementById(_currentFrame).contentWindow.clearInfo();
  	//window.frames[_currentFrame].document.getElementByIdx_x("addItemInfo").empty();
  	//window.top.$("#addItemInfo").empty();console.log(window.top);
  	
  	//$("#popupFrameFpId")[0].contentWindow().clearInfo();
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}else{
  	    top.document.getElementById("popupFrameFpId").contentWindow.clearInfo();
  	}
   	//checkboxAll("joblist");
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	
}
function listAjaxTable(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/mes/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,T2#WRD_STATUS\"}";
                    //var url = "${path}buss/bussModel_listMsData.ms";
                     var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER,DATA_AUTH\"}";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	util.closeLoading();
                            utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                        }
                    });
                }
<%--生成异步表格--%>
 function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='c408f3497e29446eb0d2f546ff63868b'){<%--仓库库存复检信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='WRD_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRD_DOC_NUM')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_DOC_NUM')+"' "+ms.tdEvent(formId, 'WRD_DOC_NUM')+">")
            arrHtml.push("<span colno='WRD_DOC_NUM' class='"+ms.uiClass(formId, 'WRD_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WRD_DOC_NUM')+"' "+ms.uiEvent(formId, 'WRD_DOC_NUM')+" title='"+ms.titleAttr(formId,'WRD_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRD_DOC_NUM']+"</span>")
            arrHtml.push("<input type='hidden' id='WRD_DOC_NUM"+v.ID+"' value='"+v['WRD_DOC_NUM']+"' /></td></td>");
            arrHtml.push("<td colno='WRD_TEST_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WRD_TEST_DOC')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_TEST_DOC')+"' "+ms.tdEvent(formId, 'WRD_TEST_DOC')+">")
            arrHtml.push("<span colno='WRD_TEST_DOC' class='"+ms.uiClass(formId, 'WRD_TEST_DOC')+"' style='"+ms.uiStyle(formId, 'WRD_TEST_DOC')+"' "+ms.uiEvent(formId, 'WRD_TEST_DOC')+" title='"+ms.titleAttr(formId,'WRD_TEST_DOC','IS_TITLE_ATTR',v)+"' >"+v['WRD_TEST_DOC']+"</span>")
            arrHtml.push("<input type='hidden' id='WRD_TEST_DOC"+v.ID+"' value='"+v['WRD_TEST_DOC']+"' /></td>");
            arrHtml.push("<td colno='T2#QII_LIST_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#QII_LIST_FLAG')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'T2#QII_LIST_FLAG')+"' "+ms.tdEvent(formId, 'T2#QII_LIST_FLAG')+">")
            arrHtml.push("<span colno='T2#QII_LIST_FLAG' class='"+ms.uiClass(formId, 'T2#QII_LIST_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#QII_LIST_FLAG')+"' "+ms.uiEvent(formId, 'T2#QII_LIST_FLAG')+" title='"+ms.titleAttr(formId,'T2#QII_LIST_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#QII_LIST_FLAG']+"</span>")
            arrHtml.push("<input type='hidden' id='WRD_LIST_FLAG"+v.ID+"' value='"+v['WRD_LIST_FLAG']+"' /></td>");
            arrHtml.push("<td colno='WRD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WRD_ITEM_CODE')+">")
            arrHtml.push("<span colno='WRD_ITEM_CODE' class='"+ms.uiClass(formId, 'WRD_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WRD_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WRD_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_CODE']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_"+v.ID+"' value='"+uiRaw[i].DATA_AUTH+"' /></td>");
            arrHtml.push("<td colno='WRD_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WRD_ITEM_NAME')+">")
            arrHtml.push("<span colno='WRD_ITEM_NAME' class='"+ms.uiClass(formId, 'WRD_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WRD_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WRD_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WRD_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WRD_ITEM_SPEC' class='"+ms.uiClass(formId, 'WRD_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WRD_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WRD_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_NUM')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'WRD_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WRD_ITEM_NUM')+">")
            arrHtml.push("<span colno='WRD_ITEM_NUM' class='"+ms.uiClass(formId, 'WRD_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WRD_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WRD_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_CREATE_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WRD_CREATE_MAN')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'WRD_CREATE_MAN')+"' "+ms.tdEvent(formId, 'WRD_CREATE_MAN')+">")
            arrHtml.push("<span colno='WRD_CREATE_MAN' class='"+ms.uiClass(formId, 'WRD_CREATE_MAN')+"' style='"+ms.uiStyle(formId, 'WRD_CREATE_MAN')+"' "+ms.uiEvent(formId, 'WRD_CREATE_MAN')+" title='"+ms.titleAttr(formId,'WRD_CREATE_MAN','IS_TITLE_ATTR',v)+"' >"+v['WRD_CREATE_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WRD_CREATE_TIME')+"' style='width:130px;text-align:center;"+ms.tdStyle(formId, 'WRD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'WRD_CREATE_TIME')+">")
            arrHtml.push("<span colno='WRD_CREATE_TIME' class='"+ms.uiClass(formId, 'WRD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'WRD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'WRD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'WRD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WRD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WRD_MEMO')+"' style='"+ms.tdStyle(formId, 'WRD_MEMO')+"' "+ms.tdEvent(formId, 'WRD_MEMO')+">")
            arrHtml.push("<span colno='WRD_MEMO' class='"+ms.uiClass(formId, 'WRD_MEMO')+"' style='"+ms.uiStyle(formId, 'WRD_MEMO')+"' "+ms.uiEvent(formId, 'WRD_MEMO')+" title='"+ms.titleAttr(formId,'WRD_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WRD_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='c2bca7b7c2094a2495a26e6ca72b7bbc'){<%--仓库库存复检单明细信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
           // arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
           // arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
           // arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_SN')+"' style='width:250px;text-align:center;"+ms.tdStyle(formId, 'WRD_ITEM_SN')+"' "+ms.tdEvent(formId, 'WRD_ITEM_SN')+">")
            arrHtml.push("<span colno='WRD_ITEM_SN' class='"+ms.uiClass(formId, 'WRD_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_SN')+"' "+ms.uiEvent(formId, 'WRD_ITEM_SN')+" title='"+ms.titleAttr(formId,'WRD_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WRD_ITEM_CODE')+">")
            arrHtml.push("<span colno='WRD_ITEM_CODE' class='"+ms.uiClass(formId, 'WRD_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WRD_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WRD_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WRD_ITEM_NAME')+">")
            arrHtml.push("<span colno='WRD_ITEM_NAME' class='"+ms.uiClass(formId, 'WRD_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WRD_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WRD_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WRD_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WRD_ITEM_SPEC' class='"+ms.uiClass(formId, 'WRD_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WRD_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WRD_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_NUM')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'WRD_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WRD_ITEM_NUM')+">")
            arrHtml.push("<span colno='WRD_ITEM_NUM' class='"+ms.uiClass(formId, 'WRD_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WRD_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WRD_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WRD_LOT_NO')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'WRD_LOT_NO')+"' "+ms.tdEvent(formId, 'WRD_LOT_NO')+">")
            arrHtml.push("<span colno='WRD_LOT_NO' class='"+ms.uiClass(formId, 'WRD_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WRD_LOT_NO')+"' "+ms.uiEvent(formId, 'WRD_LOT_NO')+" title='"+ms.titleAttr(formId,'WRD_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WRD_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRD_SUP_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_SUP_CODE')+"' "+ms.tdEvent(formId, 'WRD_SUP_CODE')+">")
            arrHtml.push("<span colno='WRD_SUP_CODE' class='"+ms.uiClass(formId, 'WRD_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WRD_SUP_CODE')+"' "+ms.uiEvent(formId, 'WRD_SUP_CODE')+" title='"+ms.titleAttr(formId,'WRD_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRD_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRD_CUST_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WRD_CUST_CODE')+"' "+ms.tdEvent(formId, 'WRD_CUST_CODE')+">")
            arrHtml.push("<span colno='WRD_CUST_CODE' class='"+ms.uiClass(formId, 'WRD_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WRD_CUST_CODE')+"' "+ms.uiEvent(formId, 'WRD_CUST_CODE')+" title='"+ms.titleAttr(formId,'WRD_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRD_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRD_WH_CODE')+"' style='width:110px;"+ms.tdStyle(formId, 'WRD_WH_CODE')+"' "+ms.tdEvent(formId, 'WRD_WH_CODE')+">")
            arrHtml.push("<span colno='WRD_WH_CODE' class='"+ms.uiClass(formId, 'WRD_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WRD_WH_CODE')+"' "+ms.uiEvent(formId, 'WRD_WH_CODE')+" title='"+ms.titleAttr(formId,'WRD_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRD_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_DISTRICT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRD_DISTRICT_CODE')+"' style='width:110px;"+ms.tdStyle(formId, 'WRD_DISTRICT_CODE')+"' "+ms.tdEvent(formId, 'WRD_DISTRICT_CODE')+">")
            arrHtml.push("<span colno='WRD_DISTRICT_CODE' class='"+ms.uiClass(formId, 'WRD_DISTRICT_CODE')+"' style='"+ms.uiStyle(formId, 'WRD_DISTRICT_CODE')+"' "+ms.uiEvent(formId, 'WRD_DISTRICT_CODE')+" title='"+ms.titleAttr(formId,'WRD_DISTRICT_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRD_DISTRICT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_STORAGE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRD_STORAGE_CODE')+"' style='"+ms.tdStyle(formId, 'WRD_STORAGE_CODE')+"' "+ms.tdEvent(formId, 'WRD_STORAGE_CODE')+">")
            arrHtml.push("<span colno='WRD_STORAGE_CODE' class='"+ms.uiClass(formId, 'WRD_STORAGE_CODE')+"' style='"+ms.uiStyle(formId, 'WRD_STORAGE_CODE')+"' "+ms.uiEvent(formId, 'WRD_STORAGE_CODE')+" title='"+ms.titleAttr(formId,'WRD_STORAGE_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRD_STORAGE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll();
}

function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    //initTableWidth();
                    //$(document.getElementById('T2#WPD_DELIVERY_DATE_BEGIN')).val(timeBeginString());
                    //$(document.getElementById('T2#WPD_DELIVERY_DATE_END')).val(timeEndString());
                     //$(document.getElementById('T2#WRD_DOC_TYPE')).val('DJ02');
                     var datetime = new Date();
                     $(document.getElementById('WRD_CREATE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('WRD_CREATE_TIME_END')).val(timeEndString());
                    listAjaxTable($("#formId1").val());
                    console.log(datetime.getDate());
                      console.log(datetime.getTime());
                 }

function timeBeginString(){
			var datetime = new Date();
			//datetime.setDate(datetime.getDate()-360);
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth()+ 1 ;
			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
			date =date < 10 ? "0" + date : date;
			if(0>=date<=30){
			  //  console.log(getEndDay());
			    date=getEndDay(date);
			    month = datetime.getMonth()  < 10 ? "0" + (datetime.getMonth() ) : datetime.getMonth() ;
			}
			return year + "-" + month + "-" + date +" 00:00:00";
	}

	function timeEndString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()+360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
		
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
		
		//return year + "-" + month + "-" + date +" 23:59:59";
		return year + "-" + month + "-" + date+" 23:59:59";
	} 
		function getEndDay(date1){
             //构造当前日期对象
           var date = new Date();
           var year = date.getFullYear();
            //获取当前月份
           var mouth = date.getMonth();
           var days;
           if (mouth == 2) {
               days = year %4 == 0 ? 29: 28;
           }else if(mouth == 1 || mouth == 3 || mouth == 5 || mouth == 7 ||mouth == 8 ||mouth == 8 ||mouth == 12){
               days = 31;
           }else{
               days = 30;
           }
           return Number(days)+Number(date1)-30;
        }

</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
