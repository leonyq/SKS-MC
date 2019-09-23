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
		<dict:lang value="VM-检验不良处理" />
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
		<bu:header formId ="fba7fc49f50e4a7d80996a6a5d0fe903"/>

    
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
		<bu:func viewId="be66c18e53b54ebf911b2b5165598b2a" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="be66c18e53b54ebf911b2b5165598b2a" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagefba7fc49f50e4a7d80996a6a5d0fe903" id="formPagefba7fc49f50e4a7d80996a6a5d0fe903" value="${formPagefba7fc49f50e4a7d80996a6a5d0fe903}"/>
		<input type="hidden" name="formId" id="formId1" value='fba7fc49f50e4a7d80996a6a5d0fe903'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="fba7fc49f50e4a7d80996a6a5d0fe903">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxfba7fc49f50e4a7d80996a6a5d0fe903" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerfba7fc49f50e4a7d80996a6a5d0fe903">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablefba7fc49f50e4a7d80996a6a5d0fe903" style="min-width:1830px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="fba7fc49f50e4a7d80996a6a5d0fe903" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_fba7fc49f50e4a7d80996a6a5d0fe903" onclick="_selectAjaxTableAllData(this,'fba7fc49f50e4a7d80996a6a5d0fe903')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="QIE_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIE_INSPECT_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIE_TEST_STEP" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIE_ITEM_CODE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIE_ITEM_NAME" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIE_ITEM_SPEC" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QIE_HANDLE_TYPE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIE_MEMO" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QIE_REPLACE_SN" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QIE_ERROR_CODE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QIE_EC_NAME" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QIE_EC_GRADE" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QIE_HANDLE_EMP" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="QIE_HANDLE_TIME" formId="fba7fc49f50e4a7d80996a6a5d0fe903" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivfba7fc49f50e4a7d80996a6a5d0fe903" onscroll="ajaxTableScroll(this,'fba7fc49f50e4a7d80996a6a5d0fe903')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxfba7fc49f50e4a7d80996a6a5d0fe903" style="min-width:1830px;">
		<tbody id="tbody_fba7fc49f50e4a7d80996a6a5d0fe903" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagefba7fc49f50e4a7d80996a6a5d0fe903==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=fba7fc49f50e4a7d80996a6a5d0fe903&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="be66c18e53b54ebf911b2b5165598b2a" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="be66c18e53b54ebf911b2b5165598b2a" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='fba7fc49f50e4a7d80996a6a5d0fe903'){<%--FM-检验单不良处理信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_SN' class='datagrid-cell "+ms.tdClass(formId, 'QIE_SN')+"' style='width:200px;"+ms.tdStyle(formId, 'QIE_SN')+"' "+ms.tdEvent(formId, 'QIE_SN')+">")
            arrHtml.push("<span colno='QIE_SN' class='"+ms.uiClass(formId, 'QIE_SN')+"' style='"+ms.uiStyle(formId, 'QIE_SN')+"' "+ms.uiEvent(formId, 'QIE_SN')+" title='"+ms.titleAttr(formId,'QIE_SN','IS_TITLE_ATTR',v)+"' >"+v['QIE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_INSPECT_SN' class='datagrid-cell "+ms.tdClass(formId, 'QIE_INSPECT_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'QIE_INSPECT_SN')+"' "+ms.tdEvent(formId, 'QIE_INSPECT_SN')+">")
            arrHtml.push("<span colno='QIE_INSPECT_SN' class='"+ms.uiClass(formId, 'QIE_INSPECT_SN')+"' style='"+ms.uiStyle(formId, 'QIE_INSPECT_SN')+"' "+ms.uiEvent(formId, 'QIE_INSPECT_SN')+" title='"+ms.titleAttr(formId,'QIE_INSPECT_SN','IS_TITLE_ATTR',v)+"' >"+v['QIE_INSPECT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QIE_TEST_STEP')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'QIE_TEST_STEP')+"' "+ms.tdEvent(formId, 'QIE_TEST_STEP')+">")
            arrHtml.push("<span colno='QIE_TEST_STEP' class='"+ms.uiClass(formId, 'QIE_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QIE_TEST_STEP')+"' "+ms.uiEvent(formId, 'QIE_TEST_STEP')+" title='"+ms.titleAttr(formId,'QIE_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QIE_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QIE_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'QIE_ITEM_CODE')+"' "+ms.tdEvent(formId, 'QIE_ITEM_CODE')+">")
            arrHtml.push("<span colno='QIE_ITEM_CODE' class='"+ms.uiClass(formId, 'QIE_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'QIE_ITEM_CODE')+"' "+ms.uiEvent(formId, 'QIE_ITEM_CODE')+" title='"+ms.titleAttr(formId,'QIE_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['QIE_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QIE_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'QIE_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QIE_ITEM_NAME')+">")
            arrHtml.push("<span colno='QIE_ITEM_NAME' class='"+ms.uiClass(formId, 'QIE_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QIE_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QIE_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QIE_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QIE_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QIE_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'QIE_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'QIE_ITEM_SPEC')+">")
            arrHtml.push("<span colno='QIE_ITEM_SPEC' class='"+ms.uiClass(formId, 'QIE_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'QIE_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'QIE_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'QIE_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['QIE_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_HANDLE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QIE_HANDLE_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'QIE_HANDLE_TYPE')+"' "+ms.tdEvent(formId, 'QIE_HANDLE_TYPE')+">")
            arrHtml.push("<span colno='QIE_HANDLE_TYPE' class='"+ms.uiClass(formId, 'QIE_HANDLE_TYPE')+"' style='"+ms.uiStyle(formId, 'QIE_HANDLE_TYPE')+"' "+ms.uiEvent(formId, 'QIE_HANDLE_TYPE')+" title='"+ms.titleAttr(formId,'QIE_HANDLE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QIE_HANDLE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'QIE_MEMO')+"' style='width:150px;"+ms.tdStyle(formId, 'QIE_MEMO')+"' "+ms.tdEvent(formId, 'QIE_MEMO')+">")
            arrHtml.push("<span colno='QIE_MEMO' class='"+ms.uiClass(formId, 'QIE_MEMO')+"' style='"+ms.uiStyle(formId, 'QIE_MEMO')+"' "+ms.uiEvent(formId, 'QIE_MEMO')+" title='"+ms.titleAttr(formId,'QIE_MEMO','IS_TITLE_ATTR',v)+"' >"+v['QIE_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_REPLACE_SN' class='datagrid-cell "+ms.tdClass(formId, 'QIE_REPLACE_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'QIE_REPLACE_SN')+"' "+ms.tdEvent(formId, 'QIE_REPLACE_SN')+">")
            arrHtml.push("<span colno='QIE_REPLACE_SN' class='"+ms.uiClass(formId, 'QIE_REPLACE_SN')+"' style='"+ms.uiStyle(formId, 'QIE_REPLACE_SN')+"' "+ms.uiEvent(formId, 'QIE_REPLACE_SN')+" title='"+ms.titleAttr(formId,'QIE_REPLACE_SN','IS_TITLE_ATTR',v)+"' >"+v['QIE_REPLACE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_ERROR_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QIE_ERROR_CODE')+"' style='width:90px;"+ms.tdStyle(formId, 'QIE_ERROR_CODE')+"' "+ms.tdEvent(formId, 'QIE_ERROR_CODE')+">")
            arrHtml.push("<span colno='QIE_ERROR_CODE' class='"+ms.uiClass(formId, 'QIE_ERROR_CODE')+"' style='"+ms.uiStyle(formId, 'QIE_ERROR_CODE')+"' "+ms.uiEvent(formId, 'QIE_ERROR_CODE')+" title='"+ms.titleAttr(formId,'QIE_ERROR_CODE','IS_TITLE_ATTR',v)+"' >"+v['QIE_ERROR_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_EC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QIE_EC_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'QIE_EC_NAME')+"' "+ms.tdEvent(formId, 'QIE_EC_NAME')+">")
            arrHtml.push("<span colno='QIE_EC_NAME' class='"+ms.uiClass(formId, 'QIE_EC_NAME')+"' style='"+ms.uiStyle(formId, 'QIE_EC_NAME')+"' "+ms.uiEvent(formId, 'QIE_EC_NAME')+" title='"+ms.titleAttr(formId,'QIE_EC_NAME','IS_TITLE_ATTR',v)+"' >"+v['QIE_EC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_EC_GRADE' class='datagrid-cell "+ms.tdClass(formId, 'QIE_EC_GRADE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'QIE_EC_GRADE')+"' "+ms.tdEvent(formId, 'QIE_EC_GRADE')+">")
            arrHtml.push("<span colno='QIE_EC_GRADE' class='"+ms.uiClass(formId, 'QIE_EC_GRADE')+"' style='"+ms.uiStyle(formId, 'QIE_EC_GRADE')+"' "+ms.uiEvent(formId, 'QIE_EC_GRADE')+" title='"+ms.titleAttr(formId,'QIE_EC_GRADE','IS_TITLE_ATTR',v)+"' >"+v['QIE_EC_GRADE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_HANDLE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QIE_HANDLE_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'QIE_HANDLE_EMP')+"' "+ms.tdEvent(formId, 'QIE_HANDLE_EMP')+">")
            arrHtml.push("<span colno='QIE_HANDLE_EMP' class='"+ms.uiClass(formId, 'QIE_HANDLE_EMP')+"' style='"+ms.uiStyle(formId, 'QIE_HANDLE_EMP')+"' "+ms.uiEvent(formId, 'QIE_HANDLE_EMP')+" title='"+ms.titleAttr(formId,'QIE_HANDLE_EMP','IS_TITLE_ATTR',v)+"' >"+v['QIE_HANDLE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QIE_HANDLE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QIE_HANDLE_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'QIE_HANDLE_TIME')+"' "+ms.tdEvent(formId, 'QIE_HANDLE_TIME')+">")
            arrHtml.push("<span colno='QIE_HANDLE_TIME' class='"+ms.uiClass(formId, 'QIE_HANDLE_TIME')+"' style='"+ms.uiStyle(formId, 'QIE_HANDLE_TIME')+"' "+ms.uiEvent(formId, 'QIE_HANDLE_TIME')+" title='"+ms.titleAttr(formId,'QIE_HANDLE_TIME','IS_TITLE_ATTR',v)+"' >"+v['QIE_HANDLE_TIME']+"</span>")
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
