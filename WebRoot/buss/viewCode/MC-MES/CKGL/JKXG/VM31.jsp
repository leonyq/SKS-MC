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
		<dict:lang value="VM测试定时插入数据" />
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
		<bu:header formId ="37036d913d0840dab5dea28aa5e4a7b3"/>

    
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
		<bu:func viewId="a241786d98304e8aa48e94323f87fbf0" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="a241786d98304e8aa48e94323f87fbf0" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage37036d913d0840dab5dea28aa5e4a7b3" id="formPage37036d913d0840dab5dea28aa5e4a7b3" value="${formPage37036d913d0840dab5dea28aa5e4a7b3}"/>
		<input type="hidden" name="formId" id="formId1" value='37036d913d0840dab5dea28aa5e4a7b3'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="37036d913d0840dab5dea28aa5e4a7b3">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax37036d913d0840dab5dea28aa5e4a7b3" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner37036d913d0840dab5dea28aa5e4a7b3">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable37036d913d0840dab5dea28aa5e4a7b3">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="37036d913d0840dab5dea28aa5e4a7b3" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_37036d913d0840dab5dea28aa5e4a7b3" onclick="_selectAjaxTableAllData(this,'37036d913d0840dab5dea28aa5e4a7b3')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="ERRORDATE" formId="37036d913d0840dab5dea28aa5e4a7b3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ERRORMESSAGE" formId="37036d913d0840dab5dea28aa5e4a7b3" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEXT1" formId="37036d913d0840dab5dea28aa5e4a7b3" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv37036d913d0840dab5dea28aa5e4a7b3" onscroll="ajaxTableScroll(this,'37036d913d0840dab5dea28aa5e4a7b3')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax37036d913d0840dab5dea28aa5e4a7b3">
		<tbody id="tbody_37036d913d0840dab5dea28aa5e4a7b3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage37036d913d0840dab5dea28aa5e4a7b3==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=37036d913d0840dab5dea28aa5e4a7b3&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="a241786d98304e8aa48e94323f87fbf0" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="a241786d98304e8aa48e94323f87fbf0" />
    
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
    if(formId=='37036d913d0840dab5dea28aa5e4a7b3'){<%--测试定时插入数据--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ERRORDATE' class='datagrid-cell "+ms.tdClass(formId, 'ERRORDATE')+"' style='"+ms.tdStyle(formId, 'ERRORDATE')+"' "+ms.tdEvent(formId, 'ERRORDATE')+">")
            arrHtml.push("<span colno='ERRORDATE' class='"+ms.uiClass(formId, 'ERRORDATE')+"' style='"+ms.uiStyle(formId, 'ERRORDATE')+"' "+ms.uiEvent(formId, 'ERRORDATE')+" title='"+ms.titleAttr(formId,'ERRORDATE','IS_TITLE_ATTR',v)+"' >"+v['ERRORDATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ERRORMESSAGE' class='datagrid-cell "+ms.tdClass(formId, 'ERRORMESSAGE')+"' style='"+ms.tdStyle(formId, 'ERRORMESSAGE')+"' "+ms.tdEvent(formId, 'ERRORMESSAGE')+">")
            arrHtml.push("<span colno='ERRORMESSAGE' class='"+ms.uiClass(formId, 'ERRORMESSAGE')+"' style='"+ms.uiStyle(formId, 'ERRORMESSAGE')+"' "+ms.uiEvent(formId, 'ERRORMESSAGE')+" title='"+ms.titleAttr(formId,'ERRORMESSAGE','IS_TITLE_ATTR',v)+"' >"+v['ERRORMESSAGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEXT1' class='datagrid-cell "+ms.tdClass(formId, 'TEXT1')+"' style='"+ms.tdStyle(formId, 'TEXT1')+"' "+ms.tdEvent(formId, 'TEXT1')+">")
            arrHtml.push("<span colno='TEXT1' class='"+ms.uiClass(formId, 'TEXT1')+"' style='"+ms.uiStyle(formId, 'TEXT1')+"' "+ms.uiEvent(formId, 'TEXT1')+" title='"+ms.titleAttr(formId,'TEXT1','IS_TITLE_ATTR',v)+"' >"+v['TEXT1']+"</span>")
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
