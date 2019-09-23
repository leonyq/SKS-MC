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
		<dict:lang value="VM-产品老化信息表" />
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
		<bu:header formId ="310f27f9bede4effbbf9cd0759a4dcb3"/>

    
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
		<bu:func viewId="0915d7bfc99348a9a2ae12bd03a59eab" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="0915d7bfc99348a9a2ae12bd03a59eab" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage310f27f9bede4effbbf9cd0759a4dcb3" id="formPage310f27f9bede4effbbf9cd0759a4dcb3" value="${formPage310f27f9bede4effbbf9cd0759a4dcb3}"/>
		<input type="hidden" name="formId" id="formId1" value='310f27f9bede4effbbf9cd0759a4dcb3'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="310f27f9bede4effbbf9cd0759a4dcb3">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax310f27f9bede4effbbf9cd0759a4dcb3" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner310f27f9bede4effbbf9cd0759a4dcb3">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable310f27f9bede4effbbf9cd0759a4dcb3" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="310f27f9bede4effbbf9cd0759a4dcb3" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_310f27f9bede4effbbf9cd0759a4dcb3" onclick="_selectAjaxTableAllData(this,'310f27f9bede4effbbf9cd0759a4dcb3')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="WAI_SN" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_AREA_SN" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_MO_NUMBER" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_MODEL_CODE" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_LOT" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:70px; text-align:center"><bu:uitn colNo="WAI_PROCESS_FACE" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_CUST_CODE" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:80px; text-align:center"><bu:uitn colNo="WAI_NUM" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_BEGIN_GROUP" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:140px; text-align:center"><bu:uitn colNo="WAI_BEGIN_SEQ" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_END_GROUP" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:140px; text-align:center"><bu:uitn colNo="WAI_END_SEQ" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:140px; text-align:center"><bu:uitn colNo="WAI_BEGIN_WORK_STATION" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:140px; text-align:center"><bu:uitn colNo="WAI_END_WORK_STATION" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:100px; text-align:center"><bu:uitn colNo="CI_AGING_TIME" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:100px; text-align:center"><bu:uitn colNo="CI_AGING_ACTUAL_TIME" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:140px; text-align:center"><bu:uitn colNo="WAI_BEGIN_TIME" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:140px; text-align:center"><bu:uitn colNo="WAI_END_TIME" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_BEGIN_EMP" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
			<td class="datagrid-cell"style="width:120px; text-align:center"><bu:uitn colNo="WAI_END_EMP" formId="310f27f9bede4effbbf9cd0759a4dcb3" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv310f27f9bede4effbbf9cd0759a4dcb3" onscroll="ajaxTableScroll(this,'310f27f9bede4effbbf9cd0759a4dcb3')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax310f27f9bede4effbbf9cd0759a4dcb3" >
		<tbody id="tbody_310f27f9bede4effbbf9cd0759a4dcb3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage310f27f9bede4effbbf9cd0759a4dcb3==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=310f27f9bede4effbbf9cd0759a4dcb3&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="0915d7bfc99348a9a2ae12bd03a59eab" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="0915d7bfc99348a9a2ae12bd03a59eab" />
    
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
    if(formId=='310f27f9bede4effbbf9cd0759a4dcb3'){<%--FM-产品老化信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_SN' class='datagrid-cell "+ms.tdClass(formId, 'WAI_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WAI_SN')+"' "+ms.tdEvent(formId, 'WAI_SN')+">")
            arrHtml.push("<span colno='WAI_SN' class='"+ms.uiClass(formId, 'WAI_SN')+"' onclick='itemJump1(\""+v['WAI_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WAI_SN')+" title='"+ms.titleAttr(formId,'WAI_SN','IS_TITLE_ATTR',v)+"' >"+v['WAI_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'WAI_AREA_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WAI_AREA_SN')+"' "+ms.tdEvent(formId, 'WAI_AREA_SN')+">")
            arrHtml.push("<span colno='WAI_AREA_SN' class='"+ms.uiClass(formId, 'WAI_AREA_SN')+"' style='"+ms.uiStyle(formId, 'WAI_AREA_SN')+"' "+ms.uiEvent(formId, 'WAI_AREA_SN')+" title='"+ms.titleAttr(formId,'WAI_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['WAI_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WAI_MO_NUMBER')+"' style='width:120px;"+ms.tdStyle(formId, 'WAI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WAI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WAI_MO_NUMBER' class='"+ms.uiClass(formId, 'WAI_MO_NUMBER')+"' onclick='itemJump2(\""+v['WAI_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WAI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WAI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WAI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WAI_MODEL_CODE')+"' style=width:120px;'"+ms.tdStyle(formId, 'WAI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WAI_MODEL_CODE')+">")
            arrHtml.push("<span colno='WAI_MODEL_CODE' class='"+ms.uiClass(formId, 'WAI_MODEL_CODE')+"' onclick='itemJump3(\""+v['WAI_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WAI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WAI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WAI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WAI_LOT')+"' style='width:120px;"+ms.tdStyle(formId, 'WAI_LOT')+"' "+ms.tdEvent(formId, 'WAI_LOT')+">")
            arrHtml.push("<span colno='WAI_LOT' class='"+ms.uiClass(formId, 'WAI_LOT')+"' style='"+ms.uiStyle(formId, 'WAI_LOT')+"' "+ms.uiEvent(formId, 'WAI_LOT')+" title='"+ms.titleAttr(formId,'WAI_LOT','IS_TITLE_ATTR',v)+"' >"+v['WAI_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WAI_PROCESS_FACE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WAI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WAI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WAI_PROCESS_FACE' class='"+ms.uiClass(formId, 'WAI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WAI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WAI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WAI_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WAI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WAI_CUST_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WAI_CUST_CODE')+"' "+ms.tdEvent(formId, 'WAI_CUST_CODE')+">")
            arrHtml.push("<span colno='WAI_CUST_CODE' class='"+ms.uiClass(formId, 'WAI_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WAI_CUST_CODE')+"' "+ms.uiEvent(formId, 'WAI_CUST_CODE')+" title='"+ms.titleAttr(formId,'WAI_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WAI_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WAI_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WAI_NUM')+"' "+ms.tdEvent(formId, 'WAI_NUM')+">")
            arrHtml.push("<span colno='WAI_NUM' class='"+ms.uiClass(formId, 'WAI_NUM')+"' style='"+ms.uiStyle(formId, 'WAI_NUM')+"' "+ms.uiEvent(formId, 'WAI_NUM')+" title='"+ms.titleAttr(formId,'WAI_NUM','IS_TITLE_ATTR',v)+"' >"+v['WAI_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_BEGIN_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'WAI_BEGIN_GROUP')+"' style='width:120px;"+ms.tdStyle(formId, 'WAI_BEGIN_GROUP')+"' "+ms.tdEvent(formId, 'WAI_BEGIN_GROUP')+">")
            arrHtml.push("<span colno='WAI_BEGIN_GROUP' class='"+ms.uiClass(formId, 'WAI_BEGIN_GROUP')+"' style='"+ms.uiStyle(formId, 'WAI_BEGIN_GROUP')+"' "+ms.uiEvent(formId, 'WAI_BEGIN_GROUP')+" title='"+ms.titleAttr(formId,'WAI_BEGIN_GROUP','IS_TITLE_ATTR',v)+"' >"+v['WAI_BEGIN_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_BEGIN_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WAI_BEGIN_SEQ')+"' style='width:140px;text-align:right;"+ms.tdStyle(formId, 'WAI_BEGIN_SEQ')+"' "+ms.tdEvent(formId, 'WAI_BEGIN_SEQ')+">")
            arrHtml.push("<span colno='WAI_BEGIN_SEQ' class='"+ms.uiClass(formId, 'WAI_BEGIN_SEQ')+"' style='"+ms.uiStyle(formId, 'WAI_BEGIN_SEQ')+"' "+ms.uiEvent(formId, 'WAI_BEGIN_SEQ')+" title='"+ms.titleAttr(formId,'WAI_BEGIN_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WAI_BEGIN_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_END_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'WAI_END_GROUP')+"' style='width:120px;"+ms.tdStyle(formId, 'WAI_END_GROUP')+"' "+ms.tdEvent(formId, 'WAI_END_GROUP')+">")
            arrHtml.push("<span colno='WAI_END_GROUP' class='"+ms.uiClass(formId, 'WAI_END_GROUP')+"' style='"+ms.uiStyle(formId, 'WAI_END_GROUP')+"' "+ms.uiEvent(formId, 'WAI_END_GROUP')+" title='"+ms.titleAttr(formId,'WAI_END_GROUP','IS_TITLE_ATTR',v)+"' >"+v['WAI_END_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_END_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WAI_END_SEQ')+"' style='width:140px;text-align:right;"+ms.tdStyle(formId, 'WAI_END_SEQ')+"' "+ms.tdEvent(formId, 'WAI_END_SEQ')+">")
            arrHtml.push("<span colno='WAI_END_SEQ' class='"+ms.uiClass(formId, 'WAI_END_SEQ')+"' style='"+ms.uiStyle(formId, 'WAI_END_SEQ')+"' "+ms.uiEvent(formId, 'WAI_END_SEQ')+" title='"+ms.titleAttr(formId,'WAI_END_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WAI_END_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_BEGIN_WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'WAI_BEGIN_WORK_STATION')+"' style='width:140px;"+ms.tdStyle(formId, 'WAI_BEGIN_WORK_STATION')+"' "+ms.tdEvent(formId, 'WAI_BEGIN_WORK_STATION')+">")
            arrHtml.push("<span colno='WAI_BEGIN_WORK_STATION' class='"+ms.uiClass(formId, 'WAI_BEGIN_WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WAI_BEGIN_WORK_STATION')+"' "+ms.uiEvent(formId, 'WAI_BEGIN_WORK_STATION')+" title='"+ms.titleAttr(formId,'WAI_BEGIN_WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WAI_BEGIN_WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_END_WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'WAI_END_WORK_STATION')+"' style='width:140px;"+ms.tdStyle(formId, 'WAI_END_WORK_STATION')+"' "+ms.tdEvent(formId, 'WAI_END_WORK_STATION')+">")
            arrHtml.push("<span colno='WAI_END_WORK_STATION' class='"+ms.uiClass(formId, 'WAI_END_WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WAI_END_WORK_STATION')+"' "+ms.uiEvent(formId, 'WAI_END_WORK_STATION')+" title='"+ms.titleAttr(formId,'WAI_END_WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WAI_END_WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_AGING_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CI_AGING_TIME')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CI_AGING_TIME')+"' "+ms.tdEvent(formId, 'CI_AGING_TIME')+">")
            arrHtml.push("<span colno='CI_AGING_TIME' class='"+ms.uiClass(formId, 'CI_AGING_TIME')+"' style='"+ms.uiStyle(formId, 'CI_AGING_TIME')+"' "+ms.uiEvent(formId, 'CI_AGING_TIME')+" title='"+ms.titleAttr(formId,'CI_AGING_TIME','IS_TITLE_ATTR',v)+"' >"+v['CI_AGING_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_AGING_ACTUAL_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CI_AGING_ACTUAL_TIME')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CI_AGING_ACTUAL_TIME')+"' "+ms.tdEvent(formId, 'CI_AGING_ACTUAL_TIME')+">")
            arrHtml.push("<span colno='CI_AGING_ACTUAL_TIME' class='"+ms.uiClass(formId, 'CI_AGING_ACTUAL_TIME')+"' style='"+ms.uiStyle(formId, 'CI_AGING_ACTUAL_TIME')+"' "+ms.uiEvent(formId, 'CI_AGING_ACTUAL_TIME')+" title='"+ms.titleAttr(formId,'CI_AGING_ACTUAL_TIME','IS_TITLE_ATTR',v)+"' >"+v['CI_AGING_ACTUAL_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_BEGIN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WAI_BEGIN_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WAI_BEGIN_TIME')+"' "+ms.tdEvent(formId, 'WAI_BEGIN_TIME')+">")
            arrHtml.push("<span colno='WAI_BEGIN_TIME' class='"+ms.uiClass(formId, 'WAI_BEGIN_TIME')+"' style='"+ms.uiStyle(formId, 'WAI_BEGIN_TIME')+"' "+ms.uiEvent(formId, 'WAI_BEGIN_TIME')+" title='"+ms.titleAttr(formId,'WAI_BEGIN_TIME','IS_TITLE_ATTR',v)+"' >"+v['WAI_BEGIN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_END_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WAI_END_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WAI_END_TIME')+"' "+ms.tdEvent(formId, 'WAI_END_TIME')+">")
            arrHtml.push("<span colno='WAI_END_TIME' class='"+ms.uiClass(formId, 'WAI_END_TIME')+"' style='"+ms.uiStyle(formId, 'WAI_END_TIME')+"' "+ms.uiEvent(formId, 'WAI_END_TIME')+" title='"+ms.titleAttr(formId,'WAI_END_TIME','IS_TITLE_ATTR',v)+"' >"+v['WAI_END_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_BEGIN_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WAI_BEGIN_EMP')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'WAI_BEGIN_EMP')+"' "+ms.tdEvent(formId, 'WAI_BEGIN_EMP')+">")
            arrHtml.push("<span colno='WAI_BEGIN_EMP' class='"+ms.uiClass(formId, 'WAI_BEGIN_EMP')+"' style='"+ms.uiStyle(formId, 'WAI_BEGIN_EMP')+"' "+ms.uiEvent(formId, 'WAI_BEGIN_EMP')+" title='"+ms.titleAttr(formId,'WAI_BEGIN_EMP','IS_TITLE_ATTR',v)+"' >"+v['WAI_BEGIN_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAI_END_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WAI_END_EMP')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'WAI_END_EMP')+"' "+ms.tdEvent(formId, 'WAI_END_EMP')+">")
            arrHtml.push("<span colno='WAI_END_EMP' class='"+ms.uiClass(formId, 'WAI_END_EMP')+"' style='"+ms.uiStyle(formId, 'WAI_END_EMP')+"' "+ms.uiEvent(formId, 'WAI_END_EMP')+" title='"+ms.titleAttr(formId,'WAI_END_EMP','IS_TITLE_ATTR',v)+"' >"+v['WAI_END_EMP']+"</span>")
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//产品追溯
function itemJump1(obj){
      winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//BOM管理
function itemJump3(obj){
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
