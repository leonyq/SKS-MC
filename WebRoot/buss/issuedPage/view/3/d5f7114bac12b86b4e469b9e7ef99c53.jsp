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
		<dict:lang value="vm_czh" />
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
		<bu:header formId ="283c6cad1a45423497cd56aee829ad38"/>

    
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
		<bu:func viewId="e283b25acf5245458e1ffa8a69e5c246" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="e283b25acf5245458e1ffa8a69e5c246" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage283c6cad1a45423497cd56aee829ad38" id="formPage283c6cad1a45423497cd56aee829ad38" value="${formPage283c6cad1a45423497cd56aee829ad38}"/>
		<input type="hidden" name="formId" id="formId1" value='283c6cad1a45423497cd56aee829ad38'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="283c6cad1a45423497cd56aee829ad38">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax283c6cad1a45423497cd56aee829ad38" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner283c6cad1a45423497cd56aee829ad38">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable283c6cad1a45423497cd56aee829ad38">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="283c6cad1a45423497cd56aee829ad38" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_283c6cad1a45423497cd56aee829ad38" onclick="_selectAjaxTableAllData(this,'283c6cad1a45423497cd56aee829ad38')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="SNAME" formId="283c6cad1a45423497cd56aee829ad38" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="AGE" formId="283c6cad1a45423497cd56aee829ad38" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="D_ID" formId="283c6cad1a45423497cd56aee829ad38" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv283c6cad1a45423497cd56aee829ad38" onscroll="ajaxTableScroll(this,'283c6cad1a45423497cd56aee829ad38')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax283c6cad1a45423497cd56aee829ad38">
		<tbody id="tbody_283c6cad1a45423497cd56aee829ad38" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage283c6cad1a45423497cd56aee829ad38==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=283c6cad1a45423497cd56aee829ad38&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="e283b25acf5245458e1ffa8a69e5c246" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="e283b25acf5245458e1ffa8a69e5c246" />
    
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
    if(formId=='283c6cad1a45423497cd56aee829ad38'){<%--fm_czh_test--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SNAME' class='datagrid-cell "+ms.tdClass(formId, 'SNAME')+"' style='"+ms.tdStyle(formId, 'SNAME')+"' "+ms.tdEvent(formId, 'SNAME')+">")
            arrHtml.push("<span colno='SNAME' class='"+ms.uiClass(formId, 'SNAME')+"' style='"+ms.uiStyle(formId, 'SNAME')+"' "+ms.uiEvent(formId, 'SNAME')+" title='"+ms.titleAttr(formId,'SNAME','IS_TITLE_ATTR',v)+"' >"+v['SNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" title='"+ms.titleAttr(formId,'AGE','IS_TITLE_ATTR',v)+"' >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='D_ID' class='datagrid-cell "+ms.tdClass(formId, 'D_ID')+"' style='"+ms.tdStyle(formId, 'D_ID')+"' "+ms.tdEvent(formId, 'D_ID')+">")
            arrHtml.push("<span colno='D_ID' class='"+ms.uiClass(formId, 'D_ID')+"' style='"+ms.uiStyle(formId, 'D_ID')+"' "+ms.uiEvent(formId, 'D_ID')+" title='"+ms.titleAttr(formId,'D_ID','IS_TITLE_ATTR',v)+"' >"+v['D_ID']+"</span>")
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
