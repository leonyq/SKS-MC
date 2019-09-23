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
		<dict:lang value="前N项不良信息" />
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
		<bu:header formId ="6587fb2a1c54437cb98b5146ebf8cfbc"/>

    
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
		<bu:func viewId="98f545e0b74f424bb038a2e6f33f9bcc" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="98f545e0b74f424bb038a2e6f33f9bcc" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6587fb2a1c54437cb98b5146ebf8cfbc" id="formPage6587fb2a1c54437cb98b5146ebf8cfbc" value="${formPage6587fb2a1c54437cb98b5146ebf8cfbc}"/>
		<input type="hidden" name="formId" id="formId1" value='6587fb2a1c54437cb98b5146ebf8cfbc'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6587fb2a1c54437cb98b5146ebf8cfbc">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6587fb2a1c54437cb98b5146ebf8cfbc" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6587fb2a1c54437cb98b5146ebf8cfbc">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6587fb2a1c54437cb98b5146ebf8cfbc">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6587fb2a1c54437cb98b5146ebf8cfbc" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6587fb2a1c54437cb98b5146ebf8cfbc" onclick="_selectAjaxTableAllData(this,'6587fb2a1c54437cb98b5146ebf8cfbc')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="WE_FAULT_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WE_ERROR_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WE_ERROR_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WE_ERROR_PERCENT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6587fb2a1c54437cb98b5146ebf8cfbc" onscroll="ajaxTableScroll(this,'6587fb2a1c54437cb98b5146ebf8cfbc')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6587fb2a1c54437cb98b5146ebf8cfbc">
		<tbody id="tbody_6587fb2a1c54437cb98b5146ebf8cfbc" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6587fb2a1c54437cb98b5146ebf8cfbc==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6587fb2a1c54437cb98b5146ebf8cfbc&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="98f545e0b74f424bb038a2e6f33f9bcc" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="98f545e0b74f424bb038a2e6f33f9bcc" />
    
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
    if(formId=='6587fb2a1c54437cb98b5146ebf8cfbc'){<%--产品不良信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_FAULT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WE_FAULT_CODE')+"' style='"+ms.tdStyle(formId, 'WE_FAULT_CODE')+"' "+ms.tdEvent(formId, 'WE_FAULT_CODE')+">")
            arrHtml.push("<span colno='WE_FAULT_CODE' class='"+ms.uiClass(formId, 'WE_FAULT_CODE')+"' style='"+ms.uiStyle(formId, 'WE_FAULT_CODE')+"' "+ms.uiEvent(formId, 'WE_FAULT_CODE')+" title='"+ms.titleAttr(formId,'WE_FAULT_CODE','IS_TITLE_ATTR',v)+"' >"+v['WE_FAULT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_ERROR_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_NAME')+"' style='"+ms.tdStyle(formId, 'WE_ERROR_NAME')+"' "+ms.tdEvent(formId, 'WE_ERROR_NAME')+">")
            arrHtml.push("<span colno='WE_ERROR_NAME' class='"+ms.uiClass(formId, 'WE_ERROR_NAME')+"' style='"+ms.uiStyle(formId, 'WE_ERROR_NAME')+"' "+ms.uiEvent(formId, 'WE_ERROR_NAME')+" title='"+ms.titleAttr(formId,'WE_ERROR_NAME','IS_TITLE_ATTR',v)+"' >"+v['WE_ERROR_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_ERROR_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_COUNT')+"' style='text-align:right;"+ms.tdStyle(formId, 'WE_ERROR_COUNT')+"' "+ms.tdEvent(formId, 'WE_ERROR_COUNT')+">")
            arrHtml.push("<span colno='WE_ERROR_COUNT' class='"+ms.uiClass(formId, 'WE_ERROR_COUNT')+"' style='"+ms.uiStyle(formId, 'WE_ERROR_COUNT')+"' "+ms.uiEvent(formId, 'WE_ERROR_COUNT')+" title='"+ms.titleAttr(formId,'WE_ERROR_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WE_ERROR_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_ERROR_PERCENT' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_PERCENT')+"' style='text-align:right;"+ms.tdStyle(formId, 'WE_ERROR_PERCENT')+"' "+ms.tdEvent(formId, 'WE_ERROR_PERCENT')+">")
            arrHtml.push("<span colno='WE_ERROR_PERCENT' class='"+ms.uiClass(formId, 'WE_ERROR_PERCENT')+"' style='"+ms.uiStyle(formId, 'WE_ERROR_PERCENT')+"' "+ms.uiEvent(formId, 'WE_ERROR_PERCENT')+" title='"+ms.titleAttr(formId,'WE_ERROR_PERCENT','IS_TITLE_ATTR',v)+"' >"+v['WE_ERROR_PERCENT']+"</span>")
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
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
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
