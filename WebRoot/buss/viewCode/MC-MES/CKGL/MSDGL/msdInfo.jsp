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
		<dict:lang value="VM-MSD信息" />
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
		<bu:header formId ="862fd67fe05f4b32a421197aaaab281d"/>

    
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
		<bu:func viewId="6131b514e7034aaebf54838b46395427" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="6131b514e7034aaebf54838b46395427" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage862fd67fe05f4b32a421197aaaab281d" id="formPage862fd67fe05f4b32a421197aaaab281d" value="${formPage862fd67fe05f4b32a421197aaaab281d}"/>
		<input type="hidden" name="formId" id="formId1" value='862fd67fe05f4b32a421197aaaab281d'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="862fd67fe05f4b32a421197aaaab281d">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax862fd67fe05f4b32a421197aaaab281d" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner862fd67fe05f4b32a421197aaaab281d">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable862fd67fe05f4b32a421197aaaab281d" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="862fd67fe05f4b32a421197aaaab281d" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_862fd67fe05f4b32a421197aaaab281d" onclick="_selectAjaxTableAllData(this,'862fd67fe05f4b32a421197aaaab281d')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="WMI_ITEM_SN" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_STATUS" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_PASS_FLAG" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_STORAGE_FLAG" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WMI_ITEM_CODE" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="T2#CI_ITEM_NAME" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="T3#WSR_RULE_NAME" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_ITEM_LOT" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_ITEM_NUM" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_WORK_AREA" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="T3#WSR_EXPOSE_LIMIT" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:130px"><bu:uitn colNo="WMI_EXPOSURE_TOTAL" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_BAKE_LIMIT" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
		<!--	<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WMI_BAKE_MAX" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WMI_BAKE_LENGTH" formId="862fd67fe05f4b32a421197aaaab281d" /></td>-->
			<td class="datagrid-cell" style="width:130px"><bu:uitn colNo="WMI_BAKE_TOTAL" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:110px"><bu:uitn colNo="T3#WSR_BAKE_TIMES" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:110px"><bu:uitn colNo="WMI_BAKE_TIMES" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:110px"><bu:uitn colNo="WMI_BAKE_DECAY" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:140px"><bu:uitn colNo="WMI_EXPIRE_TIME" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WMI_RECEIVE_TIME" formId="862fd67fe05f4b32a421197aaaab281d" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv862fd67fe05f4b32a421197aaaab281d" onscroll="ajaxTableScroll(this,'862fd67fe05f4b32a421197aaaab281d')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax862fd67fe05f4b32a421197aaaab281d" >
		<tbody id="tbody_862fd67fe05f4b32a421197aaaab281d" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage862fd67fe05f4b32a421197aaaab281d==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=862fd67fe05f4b32a421197aaaab281d&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="6131b514e7034aaebf54838b46395427" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="6131b514e7034aaebf54838b46395427" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
$(function(){
    
    	//$(document.getElementById('WMI_STATUS')).closest('.group').attr("style","display:none;");
});



<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='862fd67fe05f4b32a421197aaaab281d'){<%--FM-MSD信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v['DATA_AUTH']+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='WMI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_SN')+"' style='width:200px;"+ms.tdStyle(formId, 'WMI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WMI_ITEM_SN')+">")
            arrHtml.push("<span colno='WMI_ITEM_SN' class='"+ms.uiClass(formId, 'WMI_ITEM_SN')+"' onclick='itemJump1(\""+v['WMI_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WMI_ITEM_SN')+" title='"+v['WMI_ITEM_SN']+"' >"+v['WMI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WMI_STATUS')+"' style='width:100PX;text-align:center"+ms.tdStyle(formId, 'WMI_STATUS')+"' "+ms.tdEvent(formId, 'WMI_STATUS')+">")
            arrHtml.push("<span colno='WMI_STATUS' class='"+ms.uiClass(formId, 'WMI_STATUS')+"' style='"+ms.uiStyle(formId, 'WMI_STATUS')+"' "+ms.uiEvent(formId, 'WMI_STATUS')+"  >"+v['WMI_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_PASS_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WMI_PASS_FLAG')+"' style='width:100PX;text-align:center"+ms.tdStyle(formId, 'WMI_PASS_FLAG')+"' "+ms.tdEvent(formId, 'WMI_PASS_FLAG')+">")
            arrHtml.push("<span colno='WMI_PASS_FLAG' class='"+ms.uiClass(formId, 'WMI_PASS_FLAG')+"' style='"+ms.uiStyle(formId, 'WMI_PASS_FLAG')+"' "+ms.uiEvent(formId, 'WMI_PASS_FLAG')+"  >"+v['WMI_PASS_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_STORAGE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WMI_STORAGE_FLAG')+"' style='width:100PX;text-align:center"+ms.tdStyle(formId, 'WMI_STORAGE_FLAG')+"' "+ms.tdEvent(formId, 'WMI_STORAGE_FLAG')+">")
            arrHtml.push("<span colno='WMI_STORAGE_FLAG' class='"+ms.uiClass(formId, 'WMI_STORAGE_FLAG')+"' style='"+ms.uiStyle(formId, 'WMI_STORAGE_FLAG')+"' "+ms.uiEvent(formId, 'WMI_STORAGE_FLAG')+"  >"+v['WMI_STORAGE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_CODE')+"' style='width:150px;text-align:left"+ms.tdStyle(formId, 'WMI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WMI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WMI_ITEM_CODE' class='"+ms.uiClass(formId, 'WMI_ITEM_CODE')+"' onclick='itemJump2(\""+v['WMI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WMI_ITEM_CODE')+" title='"+v['WMI_ITEM_CODE']+"' >"+v['WMI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_NAME')+"' style='width:130px;text-align:left"+ms.tdStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T2#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_NAME')+" title='"+v['T2#CI_ITEM_NAME']+"' >"+v['T2#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_SPEC')+"' style='width:130px;"+ms.tdStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T2#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_SPEC')+" title='"+v['T2#CI_ITEM_SPEC']+"' >"+v['T2#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#WSR_RULE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#WSR_RULE_NAME')+"' style='width:130px;text-align:center"+ms.tdStyle(formId, 'T3#WSR_RULE_NAME')+"' "+ms.tdEvent(formId, 'T3#WSR_RULE_NAME')+">")
            arrHtml.push("<span colno='T3#WSR_RULE_NAME' class='"+ms.uiClass(formId, 'T3#WSR_RULE_NAME')+"' onclick='itemJump3(\""+v['T3#WSR_RULE_NAME']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'T3#WSR_RULE_NAME')+" title='"+v['T3#WSR_RULE_NAME']+"' >"+v['T3#WSR_RULE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_LOT')+"' style='width:100PX;text-align:right;"+ms.tdStyle(formId, 'WMI_ITEM_LOT')+"' "+ms.tdEvent(formId, 'WMI_ITEM_LOT')+">")
            arrHtml.push("<span colno='WMI_ITEM_LOT' class='"+ms.uiClass(formId, 'WMI_ITEM_LOT')+"' style='"+ms.uiStyle(formId, 'WMI_ITEM_LOT')+"' "+ms.uiEvent(formId, 'WMI_ITEM_LOT')+" title='"+v['WMI_ITEM_LOT']+"' >"+v['WMI_ITEM_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_NUM')+"' style='width:100PX;text-align:right;"+ms.tdStyle(formId, 'WMI_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WMI_ITEM_NUM')+">")
            arrHtml.push("<span colno='WMI_ITEM_NUM' class='"+ms.uiClass(formId, 'WMI_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WMI_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WMI_ITEM_NUM')+" title='"+v['WMI_ITEM_NUM']+"' >"+v['WMI_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_WORK_AREA' class='datagrid-cell "+ms.tdClass(formId, 'WMI_WORK_AREA')+"' style='width:100PX;text-align:left"+ms.tdStyle(formId, 'WMI_WORK_AREA')+"' "+ms.tdEvent(formId, 'WMI_WORK_AREA')+">")
            arrHtml.push("<span colno='WMI_WORK_AREA' class='"+ms.uiClass(formId, 'WMI_WORK_AREA')+"' style='"+ms.uiStyle(formId, 'WMI_WORK_AREA')+"' "+ms.uiEvent(formId, 'WMI_WORK_AREA')+" title='"+v['WMI_WORK_AREA']+"' >"+v['WMI_WORK_AREA']+"</span>")
            arrHtml.push("</td>");
            
            
            arrHtml.push("<td colno='T3#WSR_EXPOSE_LIMIT' class='datagrid-cell "+ms.tdClass(formId, 'T3#WSR_EXPOSE_LIMIT')+"' style='width:100PX;text-align:right;"+ms.tdStyle(formId, 'T3#WSR_EXPOSE_LIMIT')+"' "+ms.tdEvent(formId, 'T3#WSR_EXPOSE_LIMIT')+">")
            arrHtml.push("<span colno='T3#WSR_EXPOSE_LIMIT' class='"+ms.uiClass(formId, 'T3#WSR_EXPOSE_LIMIT')+"' style='"+ms.uiStyle(formId, 'T3#WSR_EXPOSE_LIMIT')+"' "+ms.uiEvent(formId, 'T3#WSR_EXPOSE_LIMIT')+" title='"+v['T3#WSR_EXPOSE_LIMIT']+"' >"+v['T3#WSR_EXPOSE_LIMIT']+"</span>")
            arrHtml.push("</td>");
            
            
           // <!-- 这里改 -->
            arrHtml.push("<td colno='WMI_EXPOSURE_TOTAL' class='datagrid-cell "+ms.tdClass(formId, 'WMI_EXPOSURE_TOTAL')+"' style='width:130px;text-align:right;"+ms.tdStyle(formId, 'WMI_EXPOSURE_TOTAL')+"' "+ms.tdEvent(formId, 'WMI_EXPOSURE_TOTAL')+">")
            arrHtml.push("<span colno='WMI_EXPOSURE_TOTAL' class='"+ms.uiClass(formId, 'WMI_EXPOSURE_TOTAL')+"' style='"+ms.uiStyle(formId, 'WMI_EXPOSURE_TOTAL')+"' "+ms.uiEvent(formId, 'WMI_EXPOSURE_TOTAL')+" title='"+v['WMI_EXPOSURE_TOTAL']+"' >"+v['WMI_EXPOSURE_TOTAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_BAKE_LIMIT' class='datagrid-cell "+ms.tdClass(formId, 'WMI_BAKE_LIMIT')+"' style='width:100px;text-align:right"+ms.tdStyle(formId, 'WMI_BAKE_LIMIT')+"' "+ms.tdEvent(formId, 'WMI_BAKE_LIMIT')+">")
            arrHtml.push("<span colno='WMI_BAKE_LIMIT' class='"+ms.uiClass(formId, 'WMI_BAKE_LIMIT')+"' style='"+ms.uiStyle(formId, 'WMI_BAKE_LIMIT')+"' "+ms.uiEvent(formId, 'WMI_BAKE_LIMIT')+" title='"+v['WMI_BAKE_LIMIT']+"' >"+v['WMI_BAKE_LIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_BAKE_TOTAL' class='datagrid-cell "+ms.tdClass(formId, 'WMI_BAKE_TOTAL')+"' style='width:130px;text-align:right;"+ms.tdStyle(formId, 'WMI_BAKE_TOTAL')+"' "+ms.tdEvent(formId, 'WMI_BAKE_TOTAL')+">")
            arrHtml.push("<span colno='WMI_BAKE_TOTAL' class='"+ms.uiClass(formId, 'WMI_BAKE_TOTAL')+"' style='"+ms.uiStyle(formId, 'WMI_BAKE_TOTAL')+"' "+ms.uiEvent(formId, 'WMI_BAKE_TOTAL')+" title='"+v['WMI_BAKE_TOTAL']+"' >"+v['WMI_BAKE_TOTAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#WSR_BAKE_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'T3#WSR_BAKE_TIMES')+"' style='width:110px;text-align:right;"+ms.tdStyle(formId, 'T3#WSR_BAKE_TIMES')+"' "+ms.tdEvent(formId, 'T3#WSR_BAKE_TIMES')+">")
            arrHtml.push("<span colno='T3#WSR_BAKE_TIMES' class='"+ms.uiClass(formId, 'T3#WSR_BAKE_TIMES')+"' style='"+ms.uiStyle(formId, 'T3#WSR_BAKE_TIMES')+"' "+ms.uiEvent(formId, 'T3#WSR_BAKE_TIMES')+" title='"+v['T3#WSR_BAKE_TIMES']+"' >"+v['T3#WSR_BAKE_TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_BAKE_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'WMI_BAKE_TIMES')+"' style='width:110px;text-align:right"+ms.tdStyle(formId, 'WMI_BAKE_TIMES')+"' "+ms.tdEvent(formId, 'WMI_BAKE_TIMES')+">")
            arrHtml.push("<span colno='WMI_BAKE_TIMES' class='"+ms.uiClass(formId, 'WMI_BAKE_TIMES')+"' style='"+ms.uiStyle(formId, 'WMI_BAKE_TIMES')+"' "+ms.uiEvent(formId, 'WMI_BAKE_TIMES')+" title='"+v['WMI_BAKE_TIMES']+"' >"+v['WMI_BAKE_TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_BAKE_DECAY' class='datagrid-cell "+ms.tdClass(formId, 'WMI_BAKE_DECAY')+"' style='width:110px;text-align:right"+ms.tdStyle(formId, 'WMI_BAKE_DECAY')+"' "+ms.tdEvent(formId, 'WMI_BAKE_DECAY')+">")
            arrHtml.push("<span colno='WMI_BAKE_DECAY' class='"+ms.uiClass(formId, 'WMI_BAKE_DECAY')+"' style='"+ms.uiStyle(formId, 'WMI_BAKE_DECAY')+"' "+ms.uiEvent(formId, 'WMI_BAKE_DECAY')+" title='"+v['WMI_BAKE_DECAY']+"' >"+v['WMI_BAKE_DECAY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_EXPIRE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WMI_EXPIRE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WMI_EXPIRE_TIME')+"' "+ms.tdEvent(formId, 'WMI_EXPIRE_TIME')+">")
            arrHtml.push("<span colno='WMI_EXPIRE_TIME' class='"+ms.uiClass(formId, 'WMI_EXPIRE_TIME')+"' style='"+ms.uiStyle(formId, 'WMI_EXPIRE_TIME')+"' "+ms.uiEvent(formId, 'WMI_EXPIRE_TIME')+" title='"+v['WMI_EXPIRE_TIME']+"' >"+v['WMI_EXPIRE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_RECEIVE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WMI_RECEIVE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WMI_RECEIVE_TIME')+"' "+ms.tdEvent(formId, 'WMI_RECEIVE_TIME')+">")
            arrHtml.push("<span colno='WMI_RECEIVE_TIME' class='"+ms.uiClass(formId, 'WMI_RECEIVE_TIME')+"' style='"+ms.uiStyle(formId, 'WMI_RECEIVE_TIME')+"' "+ms.uiEvent(formId, 'WMI_RECEIVE_TIME')+" title='"+v['WMI_RECEIVE_TIME']+"' >"+v['WMI_RECEIVE_TIME']+"</span>")
            arrHtml.push("</td>");
    	
    
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        //setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    //setTableWidth(formId);
    setScroll();
}
    function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
     query(this);
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	//checkboxAll("joblist");
}

                function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    $(document.getElementById('WMI_RECEIVE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('WMI_RECEIVE_TIME_END')).val(timeEndString());
                     
                    listAjaxTable($("#formId1").val());
                    
                 }

</script>
<script type="text/javascript">
$(function(){
    //init();
})
//function init(){
 //                  
//      $(document.getElementById('WMI_RECEIVE_TIME_BEGIN')).val(timeBeginString());
//        $(document.getElementById('WMI_RECEIVE_TIME_END')).val(timeEndString());
//        listAjaxTable($("#formId1").val());
        
                
// }
 
 function init(){
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    $(document.getElementById('WMI_RECEIVE_TIME_BEGIN')).val(timeBeginString());
                    $(document.getElementById('WMI_RECEIVE_TIME_END')).val(timeEndString());
                     //$(document.getElementById('WMI_BAKE_STATE')).val('3');
                    listAjaxTable($("#formId1").val());
                    
                 }
            function timeBeginString(){
    			var datetime = new Date();
    			datetime.setDate(datetime.getDate()-30);
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			return year + "-" + month + "-" + date+" 00:00:00";
    		}
    
    		function timeEndString(){
    			var datetime = new Date();
    			
    			var year = datetime.getFullYear();
    			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    			
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//MSD作业日志
function itemJump1(obj){
      winOptMethod.jump("9d08f2000ba34d05bcc700706532326a","F7151","jumpId",obj);
}  


//物料信息
function itemJump2(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//MSD管控规则
function itemJump3(obj){
    winOptMethod.jump("8eaf6497a2404891945f03d179bcb062","F7028","jumpId",obj);
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
