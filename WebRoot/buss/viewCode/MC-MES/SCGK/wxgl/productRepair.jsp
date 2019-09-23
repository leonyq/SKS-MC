<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="产品维修报表" />
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
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="81798ec755fe4098bcb9e5b2213f5fd5" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="81798ec755fe4098bcb9e5b2213f5fd5" />
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
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6587fb2a1c54437cb98b5146ebf8cfbc" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6587fb2a1c54437cb98b5146ebf8cfbc" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6587fb2a1c54437cb98b5146ebf8cfbc" onclick="_selectAjaxTableAllData(this,'6587fb2a1c54437cb98b5146ebf8cfbc')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_AREA_SN" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell"   style="width:80px;"><bu:uitn colNo="WE_REPAIR_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WE_MO_NUMBER" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_MODEL_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_MODEL_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_MODEL_STANDARD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WE_PROCESS_FACE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_LOT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:70px; text-align:center" ><bu:uitn colNo="WE_RECORD_TYPE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WE_REPEAT_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_ERROR_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="T2#CEC_NAME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_ERROR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_POINT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center" ><bu:uitn colNo="WE_POINT_COUNT" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center" ><bu:uitn colNo="WE_ERROR_NUM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WE_MISJUDGE_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WE_SCARP_FLAG" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			
			
			
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_WORK_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_PERIOD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_ITEM_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_WORK_STATION" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WE_TEST_GROUP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WE_TEST_EMP" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WE_TEST_TIME" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="T3#WR_ERROR_ITEM" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="T3#WR_REASON_CODE" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="T3#WR_REPAIR_DESC" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="T3#WR_REPAIR_METHOD" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="T3#WR_MEMO" formId="6587fb2a1c54437cb98b5146ebf8cfbc" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6587fb2a1c54437cb98b5146ebf8cfbc" onscroll="ajaxTableScroll(this,'6587fb2a1c54437cb98b5146ebf8cfbc')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6587fb2a1c54437cb98b5146ebf8cfbc" >
		<tbody id="tbody_6587fb2a1c54437cb98b5146ebf8cfbc" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6587fb2a1c54437cb98b5146ebf8cfbc==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6587fb2a1c54437cb98b5146ebf8cfbc&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="81798ec755fe4098bcb9e5b2213f5fd5" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="81798ec755fe4098bcb9e5b2213f5fd5" />
    
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
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WE_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_SN')+"' "+ms.tdEvent(formId, 'WE_SN')+">")
            arrHtml.push("<span colno='WE_SN' class='"+ms.uiClass(formId, 'WE_SN')+"' onclick='itemJump1(\""+v['WE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WE_SN')+" title='"+ms.titleAttr(formId,'WE_SN','IS_TITLE_ATTR',v)+"' >"+v['WE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'WE_AREA_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_AREA_SN')+"' "+ms.tdEvent(formId, 'WE_AREA_SN')+">")
            arrHtml.push("<span colno='WE_AREA_SN' class='"+ms.uiClass(formId, 'WE_AREA_SN')+"' style='"+ms.uiStyle(formId, 'WE_AREA_SN')+"' "+ms.uiEvent(formId, 'WE_AREA_SN')+" title='"+ms.titleAttr(formId,'WE_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['WE_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_REPAIR_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WE_REPAIR_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WE_REPAIR_FLAG')+"' "+ms.tdEvent(formId, 'WE_REPAIR_FLAG')+">")
            arrHtml.push("<span colno='WE_REPAIR_FLAG' class='"+ms.uiClass(formId, 'WE_REPAIR_FLAG')+"' style='"+ms.uiStyle(formId, 'WE_REPAIR_FLAG')+"' "+ms.uiEvent(formId, 'WE_REPAIR_FLAG')+" title='"+ms.titleAttr(formId,'WE_REPAIR_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WE_REPAIR_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WE_MO_NUMBER')+"' style='width:130px;"+ms.tdStyle(formId, 'WE_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WE_MO_NUMBER')+">")
            arrHtml.push("<span colno='WE_MO_NUMBER' class='"+ms.uiClass(formId, 'WE_MO_NUMBER')+"' onclick='itemJump2(\""+v['WE_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WE_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WE_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WE_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WE_MODEL_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WE_MODEL_CODE')+">")
            arrHtml.push("<span colno='WE_MODEL_CODE' class='"+ms.uiClass(formId, 'WE_MODEL_CODE')+"' onclick='itemJump3(\""+v['WE_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WE_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WE_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WE_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WE_MODEL_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_MODEL_NAME')+"' "+ms.tdEvent(formId, 'WE_MODEL_NAME')+">")
            arrHtml.push("<span colno='WE_MODEL_NAME' class='"+ms.uiClass(formId, 'WE_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'WE_MODEL_NAME')+"' "+ms.uiEvent(formId, 'WE_MODEL_NAME')+" title='"+ms.titleAttr(formId,'WE_MODEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['WE_MODEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MODEL_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'WE_MODEL_STANDARD')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_MODEL_STANDARD')+"' "+ms.tdEvent(formId, 'WE_MODEL_STANDARD')+">")
            arrHtml.push("<span colno='WE_MODEL_STANDARD' class='"+ms.uiClass(formId, 'WE_MODEL_STANDARD')+"' style='"+ms.uiStyle(formId, 'WE_MODEL_STANDARD')+"' "+ms.uiEvent(formId, 'WE_MODEL_STANDARD')+" title='"+ms.titleAttr(formId,'WE_MODEL_STANDARD','IS_TITLE_ATTR',v)+"' >"+v['WE_MODEL_STANDARD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WE_PROCESS_FACE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WE_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WE_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WE_PROCESS_FACE' class='"+ms.uiClass(formId, 'WE_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WE_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WE_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WE_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WE_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WE_LOT')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_LOT')+"' "+ms.tdEvent(formId, 'WE_LOT')+">")
            arrHtml.push("<span colno='WE_LOT' class='"+ms.uiClass(formId, 'WE_LOT')+"' style='"+ms.uiStyle(formId, 'WE_LOT')+"' "+ms.uiEvent(formId, 'WE_LOT')+" title='"+ms.titleAttr(formId,'WE_LOT','IS_TITLE_ATTR',v)+"' >"+v['WE_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_RECORD_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WE_RECORD_TYPE')+"' style='width:70px;"+ms.tdStyle(formId, 'WE_RECORD_TYPE')+"' "+ms.tdEvent(formId, 'WE_RECORD_TYPE')+">")
            arrHtml.push("<span colno='WE_RECORD_TYPE' class='"+ms.uiClass(formId, 'WE_RECORD_TYPE')+"' style='"+ms.uiStyle(formId, 'WE_RECORD_TYPE')+"' "+ms.uiEvent(formId, 'WE_RECORD_TYPE')+" title='"+ms.titleAttr(formId,'WE_RECORD_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WE_RECORD_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_REPEAT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WE_REPEAT_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WE_REPEAT_FLAG')+"' "+ms.tdEvent(formId, 'WE_REPEAT_FLAG')+">")
            arrHtml.push("<span colno='WE_REPEAT_FLAG' class='"+ms.uiClass(formId, 'WE_REPEAT_FLAG')+"' style='"+ms.uiStyle(formId, 'WE_REPEAT_FLAG')+"' "+ms.uiEvent(formId, 'WE_REPEAT_FLAG')+" title='"+ms.titleAttr(formId,'WE_REPEAT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WE_REPEAT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_ERROR_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_ERROR_CODE')+"' "+ms.tdEvent(formId, 'WE_ERROR_CODE')+">")
            arrHtml.push("<span colno='WE_ERROR_CODE' class='"+ms.uiClass(formId, 'WE_ERROR_CODE')+"' onclick='itemJump4(\""+v['WE_ERROR_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WE_ERROR_CODE')+" title='"+ms.titleAttr(formId,'WE_ERROR_CODE','IS_TITLE_ATTR',v)+"' >"+v['WE_ERROR_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CEC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CEC_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'T2#CEC_NAME')+"' "+ms.tdEvent(formId, 'T2#CEC_NAME')+">")
            arrHtml.push("<span colno='T2#CEC_NAME' class='"+ms.uiClass(formId, 'T2#CEC_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CEC_NAME')+"' "+ms.uiEvent(formId, 'T2#CEC_NAME')+" title='"+ms.titleAttr(formId,'T2#CEC_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CEC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_ERROR_DESC' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_DESC')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_ERROR_DESC')+"' "+ms.tdEvent(formId, 'WE_ERROR_DESC')+">")
            arrHtml.push("<span colno='WE_ERROR_DESC' class='"+ms.uiClass(formId, 'WE_ERROR_DESC')+"' style='"+ms.uiStyle(formId, 'WE_ERROR_DESC')+"' "+ms.uiEvent(formId, 'WE_ERROR_DESC')+" title='"+ms.titleAttr(formId,'WE_ERROR_DESC','IS_TITLE_ATTR',v)+"' >"+v['WE_ERROR_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WE_POINT')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_POINT')+"' "+ms.tdEvent(formId, 'WE_POINT')+">")
            arrHtml.push("<span colno='WE_POINT' class='"+ms.uiClass(formId, 'WE_POINT')+"' style='"+ms.uiStyle(formId, 'WE_POINT')+"' "+ms.uiEvent(formId, 'WE_POINT')+" title='"+ms.titleAttr(formId,'WE_POINT','IS_TITLE_ATTR',v)+"' >"+v['WE_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_POINT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WE_POINT_COUNT')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WE_POINT_COUNT')+"' "+ms.tdEvent(formId, 'WE_POINT_COUNT')+">")
            arrHtml.push("<span colno='WE_POINT_COUNT' class='"+ms.uiClass(formId, 'WE_POINT_COUNT')+"' style='"+ms.uiStyle(formId, 'WE_POINT_COUNT')+"' "+ms.uiEvent(formId, 'WE_POINT_COUNT')+" title='"+ms.titleAttr(formId,'WE_POINT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WE_POINT_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_ERROR_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WE_ERROR_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WE_ERROR_NUM')+"' "+ms.tdEvent(formId, 'WE_ERROR_NUM')+">")
            arrHtml.push("<span colno='WE_ERROR_NUM' class='"+ms.uiClass(formId, 'WE_ERROR_NUM')+"' style='"+ms.uiStyle(formId, 'WE_ERROR_NUM')+"' "+ms.uiEvent(formId, 'WE_ERROR_NUM')+" title='"+ms.titleAttr(formId,'WE_ERROR_NUM','IS_TITLE_ATTR',v)+"' >"+v['WE_ERROR_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_MISJUDGE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WE_MISJUDGE_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WE_MISJUDGE_FLAG')+"' "+ms.tdEvent(formId, 'WE_MISJUDGE_FLAG')+">")
            arrHtml.push("<span colno='WE_MISJUDGE_FLAG' class='"+ms.uiClass(formId, 'WE_MISJUDGE_FLAG')+"' style='"+ms.uiStyle(formId, 'WE_MISJUDGE_FLAG')+"' "+ms.uiEvent(formId, 'WE_MISJUDGE_FLAG')+" title='"+ms.titleAttr(formId,'WE_MISJUDGE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WE_MISJUDGE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_SCARP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WE_SCARP_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WE_SCARP_FLAG')+"' "+ms.tdEvent(formId, 'WE_SCARP_FLAG')+">")
            arrHtml.push("<span colno='WE_SCARP_FLAG' class='"+ms.uiClass(formId, 'WE_SCARP_FLAG')+"' style='"+ms.uiStyle(formId, 'WE_SCARP_FLAG')+"' "+ms.uiEvent(formId, 'WE_SCARP_FLAG')+" title='"+ms.titleAttr(formId,'WE_SCARP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WE_SCARP_FLAG']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WE_WORK_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'WE_WORK_GROUP')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_WORK_GROUP')+"' "+ms.tdEvent(formId, 'WE_WORK_GROUP')+">")
            arrHtml.push("<span colno='WE_WORK_GROUP' class='"+ms.uiClass(formId, 'WE_WORK_GROUP')+"' style='"+ms.uiStyle(formId, 'WE_WORK_GROUP')+"' "+ms.uiEvent(formId, 'WE_WORK_GROUP')+" title='"+ms.titleAttr(formId,'WE_WORK_GROUP','IS_TITLE_ATTR',v)+"' >"+v['WE_WORK_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_PERIOD' class='datagrid-cell "+ms.tdClass(formId, 'WE_PERIOD')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_PERIOD')+"' "+ms.tdEvent(formId, 'WE_PERIOD')+">")
            arrHtml.push("<span colno='WE_PERIOD' class='"+ms.uiClass(formId, 'WE_PERIOD')+"' style='"+ms.uiStyle(formId, 'WE_PERIOD')+"' "+ms.uiEvent(formId, 'WE_PERIOD')+" title='"+ms.titleAttr(formId,'WE_PERIOD','IS_TITLE_ATTR',v)+"' >"+v['WE_PERIOD']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WE_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WE_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WE_ITEM_CODE')+">")
            arrHtml.push("<span colno='WE_ITEM_CODE' class='"+ms.uiClass(formId, 'WE_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WE_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WE_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WE_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WE_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='WE_WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'WE_WORK_STATION')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_WORK_STATION')+"' "+ms.tdEvent(formId, 'WE_WORK_STATION')+">")
            arrHtml.push("<span colno='WE_WORK_STATION' class='"+ms.uiClass(formId, 'WE_WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WE_WORK_STATION')+"' "+ms.uiEvent(formId, 'WE_WORK_STATION')+" title='"+ms.titleAttr(formId,'WE_WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WE_WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_TEST_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'WE_TEST_GROUP')+"' style='width:120px;"+ms.tdStyle(formId, 'WE_TEST_GROUP')+"' "+ms.tdEvent(formId, 'WE_TEST_GROUP')+">")
            arrHtml.push("<span colno='WE_TEST_GROUP' class='"+ms.uiClass(formId, 'WE_TEST_GROUP')+"' style='"+ms.uiStyle(formId, 'WE_TEST_GROUP')+"' "+ms.uiEvent(formId, 'WE_TEST_GROUP')+" title='"+ms.titleAttr(formId,'WE_TEST_GROUP','IS_TITLE_ATTR',v)+"' >"+v['WE_TEST_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_TEST_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WE_TEST_EMP')+"' style='width:80px;text-align:center"+ms.tdStyle(formId, 'WE_TEST_EMP')+"' "+ms.tdEvent(formId, 'WE_TEST_EMP')+">")
            arrHtml.push("<span colno='WE_TEST_EMP' class='"+ms.uiClass(formId, 'WE_TEST_EMP')+"' style='"+ms.uiStyle(formId, 'WE_TEST_EMP')+"' "+ms.uiEvent(formId, 'WE_TEST_EMP')+" title='"+ms.titleAttr(formId,'WE_TEST_EMP','IS_TITLE_ATTR',v)+"' >"+v['WE_TEST_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WE_TEST_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WE_TEST_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WE_TEST_TIME')+"' "+ms.tdEvent(formId, 'WE_TEST_TIME')+">")
            arrHtml.push("<span colno='WE_TEST_TIME' class='"+ms.uiClass(formId, 'WE_TEST_TIME')+"' style='"+ms.uiStyle(formId, 'WE_TEST_TIME')+"' "+ms.uiEvent(formId, 'WE_TEST_TIME')+" title='"+ms.titleAttr(formId,'WE_TEST_TIME','IS_TITLE_ATTR',v)+"' >"+v['WE_TEST_TIME']+"</span>")
            arrHtml.push("</td>");
            
            
             arrHtml.push("<td colno='T3#WR_ERROR_ITEM' class='datagrid-cell "+ms.tdClass(formId, 'T3#WR_ERROR_ITEM')+"' style='width:120px;"+ms.tdStyle(formId, 'T3#WR_ERROR_ITEM')+"' "+ms.tdEvent(formId, 'T3#WR_ERROR_ITEM')+">")
            arrHtml.push("<span colno='T3#WR_ERROR_ITEM' class='"+ms.uiClass(formId, 'T3#WR_ERROR_ITEM')+"' style='"+ms.uiStyle(formId, 'T3#WR_ERROR_ITEM')+"' "+ms.uiEvent(formId, 'T3#WR_ERROR_ITEM')+" title='"+ms.titleAttr(formId,'T3#WR_ERROR_ITEM','IS_TITLE_ATTR',v)+"' >"+v['T3#WR_ERROR_ITEM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#WR_REASON_CODE' class='datagrid-cell "+ms.tdClass(formId, 'T3#WR_REASON_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'T3#WR_REASON_CODE')+"' "+ms.tdEvent(formId, 'T3#WR_REASON_CODE')+">")
            arrHtml.push("<span colno='T3#WR_REASON_CODE' class='"+ms.uiClass(formId, 'T3#WR_REASON_CODE')+"' style='"+ms.uiStyle(formId, 'T3#WR_REASON_CODE')+"' "+ms.uiEvent(formId, 'T3#WR_REASON_CODE')+" title='"+ms.titleAttr(formId,'T3#WR_REASON_CODE','IS_TITLE_ATTR',v)+"' >"+v['T3#WR_REASON_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#WR_REPAIR_DESC' class='datagrid-cell "+ms.tdClass(formId, 'T3#WR_REPAIR_DESC')+"' style='width:120px;"+ms.tdStyle(formId, 'T3#WR_REPAIR_DESC')+"' "+ms.tdEvent(formId, 'T3#WR_REPAIR_DESC')+">")
            arrHtml.push("<span colno='T3#WR_REPAIR_DESC' class='"+ms.uiClass(formId, 'T3#WR_REPAIR_DESC')+"' style='"+ms.uiStyle(formId, 'T3#WR_REPAIR_DESC')+"' "+ms.uiEvent(formId, 'T3#WR_REPAIR_DESC')+" title='"+ms.titleAttr(formId,'T3#WR_REPAIR_DESC','IS_TITLE_ATTR',v)+"' >"+v['T3#WR_REPAIR_DESC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#WR_REPAIR_METHOD' class='datagrid-cell "+ms.tdClass(formId, 'T3#WR_REPAIR_METHOD')+"' style='width:120px;text-align:center"+ms.tdStyle(formId, 'T3#WR_REPAIR_METHOD')+"' "+ms.tdEvent(formId, 'T3#WR_REPAIR_METHOD')+">")
            arrHtml.push("<span colno='T3#WR_REPAIR_METHOD' class='"+ms.uiClass(formId, 'T3#WR_REPAIR_METHOD')+"' style='"+ms.uiStyle(formId, 'T3#WR_REPAIR_METHOD')+"' "+ms.uiEvent(formId, 'T3#WR_REPAIR_METHOD')+" title='"+ms.titleAttr(formId,'T3#WR_REPAIR_METHOD','IS_TITLE_ATTR',v)+"' >"+v['T3#WR_REPAIR_METHOD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#WR_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'T3#WR_MEMO')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'T3#WR_MEMO')+"' "+ms.tdEvent(formId, 'T3#WR_MEMO')+">")
            arrHtml.push("<span colno='T3#WR_MEMO' class='"+ms.uiClass(formId, 'T3#WR_MEMO')+"' style='"+ms.uiStyle(formId, 'T3#WR_MEMO')+"' "+ms.uiEvent(formId, 'T3#WR_MEMO')+" title='"+ms.titleAttr(formId,'T3#WR_MEMO','IS_TITLE_ATTR',v)+"' >"+v['T3#WR_MEMO']+"</span>")
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
$("#WE_TEST_TIME_BEGIN").val(timeBeginString());
    
$("#WE_TEST_TIME_END").val(timeEndString());

function timeBeginString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()-360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth()+ 1 ;
		var date = datetime.getDate();
		if(date-7<=0){
		    date=getEndDay(date);
		}
		date =date < 10 ? "0" + date : date;
		return year + "-" + month + "-" + date +" 00:00:01";
}

function timeEndString(){
	var datetime = new Date();
	//datetime.setDate(datetime.getDate()+360);
	var year = datetime.getFullYear();
	var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
	
	var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
	return year + "-" + month + "-" + date +" 23:59:59";
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
           return Number(days)+Number(date1)-7;
        }
/*
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
	return year + "-" + month + "-" + date +" 23:59:59";
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
        */

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

//不良代码
function itemJump4(obj){
  winOptMethod.jump("0ca7cd10e18b43bfb72a9e038bc9e16b","F5485","jumpId",obj);
} 


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
