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
		<dict:lang value="标准工时" />
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
		<bu:header formId ="9b6074af91db439aa8e73c486b484970"/>

    
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
		<bu:func viewId="cd59b28c5b4e417584007b236fac435e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="cd59b28c5b4e417584007b236fac435e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage9b6074af91db439aa8e73c486b484970" id="formPage9b6074af91db439aa8e73c486b484970" value="${formPage9b6074af91db439aa8e73c486b484970}"/>
		<input type="hidden" name="formId" id="formId1" value='9b6074af91db439aa8e73c486b484970'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9b6074af91db439aa8e73c486b484970">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9b6074af91db439aa8e73c486b484970" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9b6074af91db439aa8e73c486b484970">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9b6074af91db439aa8e73c486b484970">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9b6074af91db439aa8e73c486b484970" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9b6074af91db439aa8e73c486b484970" onclick="_selectAjaxTableAllData(this,'9b6074af91db439aa8e73c486b484970')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CST_MODEL_CODE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CST_STEP_CODE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="CST_PROCESS_FACE" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CST_AREA_SN" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CST_STANDARD_TIME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="CREATE_TIME" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center"><bu:uitn colNo="CREATE_USER" formId="9b6074af91db439aa8e73c486b484970" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="CST_TRACK" formId="9b6074af91db439aa8e73c486b484970" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9b6074af91db439aa8e73c486b484970" onscroll="ajaxTableScroll(this,'9b6074af91db439aa8e73c486b484970')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9b6074af91db439aa8e73c486b484970">
		<tbody id="tbody_9b6074af91db439aa8e73c486b484970" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9b6074af91db439aa8e73c486b484970==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9b6074af91db439aa8e73c486b484970&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="cd59b28c5b4e417584007b236fac435e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="cd59b28c5b4e417584007b236fac435e" />
    
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
    if(formId=='9b6074af91db439aa8e73c486b484970'){<%--标准工时--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CST_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CST_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CST_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CST_MODEL_CODE')+">")
            arrHtml.push("<span colno='CST_MODEL_CODE' class='"+ms.uiClass(formId, 'CST_MODEL_CODE')+"' onclick='itemJump1(\""+v['CST_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CST_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CST_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['CST_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='CST_STEP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CST_STEP_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CST_STEP_CODE')+"' "+ms.tdEvent(formId, 'CST_STEP_CODE')+">")
            arrHtml.push("<span colno='CST_STEP_CODE' class='"+ms.uiClass(formId, 'CST_STEP_CODE')+"' style='"+ms.uiStyle(formId, 'CST_STEP_CODE')+"' "+ms.uiEvent(formId, 'CST_STEP_CODE')+" title='"+ms.titleAttr(formId,'CST_STEP_CODE','IS_TITLE_ATTR',v)+"' >"+v['CST_STEP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CST_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CST_PROCESS_FACE')+"' style='width:100px;"+ms.tdStyle(formId, 'CST_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CST_PROCESS_FACE')+">")
            arrHtml.push("<span colno='CST_PROCESS_FACE' class='"+ms.uiClass(formId, 'CST_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CST_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CST_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CST_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['CST_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CST_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CST_AREA_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CST_AREA_SN')+"' "+ms.tdEvent(formId, 'CST_AREA_SN')+">")
            arrHtml.push("<span colno='CST_AREA_SN' class='"+ms.uiClass(formId, 'CST_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CST_AREA_SN')+"' "+ms.uiEvent(formId, 'CST_AREA_SN')+" title='"+ms.titleAttr(formId,'CST_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CST_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CST_STANDARD_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CST_STANDARD_TIME')+"' style='width:140px;text-align:right;"+ms.tdStyle(formId, 'CST_STANDARD_TIME')+"' "+ms.tdEvent(formId, 'CST_STANDARD_TIME')+">")
            arrHtml.push("<span colno='CST_STANDARD_TIME' class='"+ms.uiClass(formId, 'CST_STANDARD_TIME')+"' style='"+ms.uiStyle(formId, 'CST_STANDARD_TIME')+"' "+ms.uiEvent(formId, 'CST_STANDARD_TIME')+" title='"+ms.titleAttr(formId,'CST_STANDARD_TIME','IS_TITLE_ATTR',v)+"' >"+v['CST_STANDARD_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CST_TRACK' class='datagrid-cell "+ms.tdClass(formId, 'CST_TRACK')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CST_TRACK')+"' "+ms.tdEvent(formId, 'CST_TRACK')+">")
            arrHtml.push("<span colno='CST_TRACK' class='"+ms.uiClass(formId, 'CST_TRACK')+"' style='"+ms.uiStyle(formId, 'CST_TRACK')+"' "+ms.uiEvent(formId, 'CST_TRACK')+" title='"+ms.titleAttr(formId,'CST_TRACK','IS_TITLE_ATTR',v)+"' >"+v['CST_TRACK']+"</span>")
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//BOM管理
function itemJump1(obj){
      winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
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
