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
		<dict:lang value="大数据量测试" />
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
		<bu:header formId ="c937d9cfd9754372bd5e6c0b3aae725a"/>

    
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
		<bu:func viewId="d9a7f6507bdb4b8d91805cb411a60317" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="d9a7f6507bdb4b8d91805cb411a60317" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagec937d9cfd9754372bd5e6c0b3aae725a" id="formPagec937d9cfd9754372bd5e6c0b3aae725a" value="${formPagec937d9cfd9754372bd5e6c0b3aae725a}"/>
		<input type="hidden" name="formId" id="formId1" value='c937d9cfd9754372bd5e6c0b3aae725a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="c937d9cfd9754372bd5e6c0b3aae725a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc937d9cfd9754372bd5e6c0b3aae725a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc937d9cfd9754372bd5e6c0b3aae725a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec937d9cfd9754372bd5e6c0b3aae725a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c937d9cfd9754372bd5e6c0b3aae725a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c937d9cfd9754372bd5e6c0b3aae725a" onclick="_selectAjaxTableAllData(this,'c937d9cfd9754372bd5e6c0b3aae725a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="CODE_NAME" formId="c937d9cfd9754372bd5e6c0b3aae725a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CODE_VAL" formId="c937d9cfd9754372bd5e6c0b3aae725a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CODE_TYPE" formId="c937d9cfd9754372bd5e6c0b3aae725a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CODE_TXT" formId="c937d9cfd9754372bd5e6c0b3aae725a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivc937d9cfd9754372bd5e6c0b3aae725a" onscroll="ajaxTableScroll(this,'c937d9cfd9754372bd5e6c0b3aae725a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxc937d9cfd9754372bd5e6c0b3aae725a">
		<tbody id="tbody_c937d9cfd9754372bd5e6c0b3aae725a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec937d9cfd9754372bd5e6c0b3aae725a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=c937d9cfd9754372bd5e6c0b3aae725a&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="d9a7f6507bdb4b8d91805cb411a60317" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d9a7f6507bdb4b8d91805cb411a60317" />
    
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
    if(formId=='c937d9cfd9754372bd5e6c0b3aae725a'){<%--大数据量测试--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CODE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CODE_NAME')+"' style='"+ms.tdStyle(formId, 'CODE_NAME')+"' "+ms.tdEvent(formId, 'CODE_NAME')+">")
            arrHtml.push("<span colno='CODE_NAME' class='"+ms.uiClass(formId, 'CODE_NAME')+"' style='"+ms.uiStyle(formId, 'CODE_NAME')+"' "+ms.uiEvent(formId, 'CODE_NAME')+" title='"+ms.titleAttr(formId,'CODE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CODE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CODE_VAL' class='datagrid-cell "+ms.tdClass(formId, 'CODE_VAL')+"' style='"+ms.tdStyle(formId, 'CODE_VAL')+"' "+ms.tdEvent(formId, 'CODE_VAL')+">")
            arrHtml.push("<span colno='CODE_VAL' class='"+ms.uiClass(formId, 'CODE_VAL')+"' style='"+ms.uiStyle(formId, 'CODE_VAL')+"' "+ms.uiEvent(formId, 'CODE_VAL')+" title='"+ms.titleAttr(formId,'CODE_VAL','IS_TITLE_ATTR',v)+"' >"+v['CODE_VAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CODE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CODE_TYPE')+"' style='"+ms.tdStyle(formId, 'CODE_TYPE')+"' "+ms.tdEvent(formId, 'CODE_TYPE')+">")
            arrHtml.push("<span colno='CODE_TYPE' class='"+ms.uiClass(formId, 'CODE_TYPE')+"' style='"+ms.uiStyle(formId, 'CODE_TYPE')+"' "+ms.uiEvent(formId, 'CODE_TYPE')+" title='"+ms.titleAttr(formId,'CODE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CODE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CODE_TXT' class='datagrid-cell "+ms.tdClass(formId, 'CODE_TXT')+"' style='"+ms.tdStyle(formId, 'CODE_TXT')+"' "+ms.tdEvent(formId, 'CODE_TXT')+">")
            arrHtml.push("<span colno='CODE_TXT' class='"+ms.uiClass(formId, 'CODE_TXT')+"' style='"+ms.uiStyle(formId, 'CODE_TXT')+"' "+ms.uiEvent(formId, 'CODE_TXT')+" title='"+ms.titleAttr(formId,'CODE_TXT','IS_TITLE_ATTR',v)+"' >"+v['CODE_TXT']+"</span>")
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
