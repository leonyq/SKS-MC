<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="巡检作业日志信息" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="35085c72eb4f4a4fba44694353ef0251"/>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="a84e6a684a00469c9a9625a60a028aab" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
		<bu:search viewId="a84e6a684a00469c9a9625a60a028aab" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                   <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<input type="hidden" name="formPage35085c72eb4f4a4fba44694353ef0251" id="formPage35085c72eb4f4a4fba44694353ef0251" value="${formPage35085c72eb4f4a4fba44694353ef0251}"/>
		<input type="hidden" name="formId" id="formId1" value='35085c72eb4f4a4fba44694353ef0251'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="35085c72eb4f4a4fba44694353ef0251">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax35085c72eb4f4a4fba44694353ef0251" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner35085c72eb4f4a4fba44694353ef0251">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable35085c72eb4f4a4fba44694353ef0251" style="min-width:1680px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="35085c72eb4f4a4fba44694353ef0251" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_35085c72eb4f4a4fba44694353ef0251" onclick="_selectAjaxTableAllData(this,'35085c72eb4f4a4fba44694353ef0251')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QOL_EVENT" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QOL_ITEM_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QOL_ITEM_CODE" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QOL_MO_NUMBER" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QOL_MODEL_CODE" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QOL_MODEL_NAME" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QOL_MODEL_SPEC" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QOL_PROCESS_FACE" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QOL_AREA_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QOL_WORK_STATIONID" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QOL_DEVICE_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QOL_FEEDER_SN" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QOL_LOADPOINT" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QOL_EMP" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="QOL_ORERATE_TIME" formId="35085c72eb4f4a4fba44694353ef0251" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv35085c72eb4f4a4fba44694353ef0251" onscroll="ajaxTableScroll(this,'35085c72eb4f4a4fba44694353ef0251')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax35085c72eb4f4a4fba44694353ef0251" style="min-width:1680px;"> 
		<tbody id="tbody_35085c72eb4f4a4fba44694353ef0251" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage35085c72eb4f4a4fba44694353ef0251==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=35085c72eb4f4a4fba44694353ef0251&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="a84e6a684a00469c9a9625a60a028aab" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>		
		<bu:script viewId="a84e6a684a00469c9a9625a60a028aab" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>

<script>
function hideAuthDataCol(){
	if("1"!="1"){
    	var interval = setInterval(function(){
     		  if($(".TD_DATA_AUTH ").length>0 ){
     			  $(".TD_DATA_AUTH ").remove(); 
     			  clearInterval(interval);
     		  }
     		  //do whatever here..
     		  }, 100);
        	$(".IS_DATA_AUTH_SPAN").parent("td").remove();
    }
};

var isFirstSetScroll=0;
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    if(formId=='35085c72eb4f4a4fba44694353ef0251'){<%--巡检作业日志--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            var tempStr=""+v['QOL_DEVICE_SN']+"-"+v['QOL_TABLE_NO']+"-"+v['QOL_LOADPOINT_SN']+v['QOL_CHANEL_NO']+"";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"'>"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("<td colno='QOL_EVENT' class='datagrid-cell "+ms.tdClass(formId, 'QOL_EVENT')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QOL_EVENT')+"' "+ms.tdEvent(formId, 'QOL_EVENT')+">")
            arrHtml.push("<span colno='QOL_EVENT' class='"+ms.uiClass(formId, 'QOL_EVENT')+"' style='"+ms.uiStyle(formId, 'QOL_EVENT')+"' "+ms.uiEvent(formId, 'QOL_EVENT')+" title='"+ms.titleAttr(formId,'QOL_EVENT','IS_TITLE_ATTR',v)+"'>"+v['QOL_EVENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'QOL_ITEM_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'QOL_ITEM_SN')+"' "+ms.tdEvent(formId, 'QOL_ITEM_SN')+">")
            arrHtml.push("<span colno='QOL_ITEM_SN' class='"+ms.uiClass(formId, 'QOL_ITEM_SN')+"' onclick='itemJump1(\""+v['QOL_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QOL_ITEM_SN')+" title='"+ms.titleAttr(formId,'QOL_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['QOL_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QOL_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'QOL_ITEM_CODE')+"' "+ms.tdEvent(formId, 'QOL_ITEM_CODE')+">")
            arrHtml.push("<span colno='QOL_ITEM_CODE' class='"+ms.uiClass(formId, 'QOL_ITEM_CODE')+"' onclick='itemJump2(\""+v['QOL_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QOL_ITEM_CODE')+" title='"+ms.titleAttr(formId,'QOL_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['QOL_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'QOL_MO_NUMBER')+"' style='width:120px;"+ms.tdStyle(formId, 'QOL_MO_NUMBER')+"' "+ms.tdEvent(formId, 'QOL_MO_NUMBER')+">")
            arrHtml.push("<span colno='QOL_MO_NUMBER' class='"+ms.uiClass(formId, 'QOL_MO_NUMBER')+"' onclick='itemJump3(\""+v['QOL_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QOL_MO_NUMBER')+" title='"+ms.titleAttr(formId,'QOL_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['QOL_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QOL_MODEL_CODE')+"' style='width:100px;"+ms.tdStyle(formId, 'QOL_MODEL_CODE')+"' "+ms.tdEvent(formId, 'QOL_MODEL_CODE')+">")
            arrHtml.push("<span colno='QOL_MODEL_CODE' class='"+ms.uiClass(formId, 'QOL_MODEL_CODE')+"' onclick='itemJump4(\""+v['QOL_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QOL_MODEL_CODE')+" title='"+ms.titleAttr(formId,'QOL_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['QOL_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QOL_MODEL_NAME')+"' style='width:100px;"+ms.tdStyle(formId, 'QOL_MODEL_NAME')+"' "+ms.tdEvent(formId, 'QOL_MODEL_NAME')+">")
            arrHtml.push("<span colno='QOL_MODEL_NAME' class='"+ms.uiClass(formId, 'QOL_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'QOL_MODEL_NAME')+"' "+ms.uiEvent(formId, 'QOL_MODEL_NAME')+"title='"+ms.titleAttr(formId,'QOL_MODEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['QOL_MODEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_MODEL_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QOL_MODEL_SPEC')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QOL_MODEL_SPEC')+"' "+ms.tdEvent(formId, 'QOL_MODEL_SPEC')+">")
            arrHtml.push("<span colno='QOL_MODEL_SPEC' class='"+ms.uiClass(formId, 'QOL_MODEL_SPEC')+"' style='"+ms.uiStyle(formId, 'QOL_MODEL_SPEC')+"' "+ms.uiEvent(formId, 'QOL_MODEL_SPEC')+" title='"+ms.titleAttr(formId,'QOL_MODEL_SPEC','IS_TITLE_ATTR',v)+"' >"+v['QOL_MODEL_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'QOL_PROCESS_FACE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QOL_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'QOL_PROCESS_FACE')+">")
            arrHtml.push("<span colno='QOL_PROCESS_FACE' class='"+ms.uiClass(formId, 'QOL_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'QOL_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'QOL_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'QOL_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['QOL_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'QOL_AREA_SN')+"' style='width:80px;"+ms.tdStyle(formId, 'QOL_AREA_SN')+"' "+ms.tdEvent(formId, 'QOL_AREA_SN')+">")
            arrHtml.push("<span colno='QOL_AREA_SN' class='"+ms.uiClass(formId, 'QOL_AREA_SN')+"' style='"+ms.uiStyle(formId, 'QOL_AREA_SN')+"' "+ms.uiEvent(formId, 'QOL_AREA_SN')+" title='"+ms.titleAttr(formId,'QOL_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['QOL_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_WORK_STATIONID' class='datagrid-cell "+ms.tdClass(formId, 'QOL_WORK_STATIONID')+"' style='width:80px;"+ms.tdStyle(formId, 'QOL_WORK_STATIONID')+"' "+ms.tdEvent(formId, 'QOL_WORK_STATIONID')+">")
            arrHtml.push("<span colno='QOL_WORK_STATIONID' class='"+ms.uiClass(formId, 'QOL_WORK_STATIONID')+"' style='"+ms.uiStyle(formId, 'QOL_WORK_STATIONID')+"' "+ms.uiEvent(formId, 'QOL_WORK_STATIONID')+" title='"+ms.titleAttr(formId,'QOL_WORK_STATIONID','IS_TITLE_ATTR',v)+"' >"+v['QOL_WORK_STATIONID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'QOL_DEVICE_SN')+"' style='width:80px;"+ms.tdStyle(formId, 'QOL_DEVICE_SN')+"' "+ms.tdEvent(formId, 'QOL_DEVICE_SN')+">")
            arrHtml.push("<span colno='QOL_DEVICE_SN' class='"+ms.uiClass(formId, 'QOL_DEVICE_SN')+"' onclick='itemJump5(\""+v['QOL_DEVICE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QOL_DEVICE_SN')+" title='"+ms.titleAttr(formId,'QOL_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['QOL_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'QOL_FEEDER_SN')+"' style='width:80px;"+ms.tdStyle(formId, 'QOL_FEEDER_SN')+"' "+ms.tdEvent(formId, 'QOL_FEEDER_SN')+">")
            arrHtml.push("<span colno='QOL_FEEDER_SN' class='"+ms.uiClass(formId, 'QOL_FEEDER_SN')+"' onclick='itemJump6(\""+v['QOL_FEEDER_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QOL_FEEDER_SN')+" title='"+ms.titleAttr(formId,'QOL_FEEDER_SN','IS_TITLE_ATTR',v)+"' >"+v['QOL_FEEDER_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_LOADPOINT' class='datagrid-cell "+ms.tdClass(formId, 'QOL_LOADPOINT')+"' style='width:150px;"+ms.tdStyle(formId, 'QOL_LOADPOINT')+"' "+ms.tdEvent(formId, 'QOL_LOADPOINT')+">")
            arrHtml.push("<span colno='QOL_DEVICE_SN' class='"+ms.uiClass(formId, 'QOL_DEVICE_SN')+"'  "+ms.uiEvent(formId, 'QOL_DEVICE_SN')+"  title='"+tempStr+"'>"+v['QOL_DEVICE_SN']+"-"+v['QOL_TABLE_NO']+"-"+v['QOL_LOADPOINT_SN']+v['QOL_CHANEL_NO']+"</span>")
            //arrHtml.push("<span colno='QOL_TABLE_NO' class='"+ms.uiClass(formId, 'QOL_TABLE_NO')+"' style='"+ms.uiStyle(formId, 'QOL_TABLE_NO')+"' "+ms.uiEvent(formId, 'QOL_TABLE_NO')+" >"+v['QOL_TABLE_NO']+"-</span>")
            //arrHtml.push("<span colno='QOL_LOADPOINT_SN' class='"+ms.uiClass(formId, 'QOL_LOADPOINT_SN')+"' style='"+ms.uiStyle(formId, 'QOL_LOADPOINT_SN')+"' "+ms.uiEvent(formId, 'QOL_LOADPOINT_SN')+" >"+v['QOL_LOADPOINT_SN']+"</span>")
            //arrHtml.push("<span colno='QOL_CHANEL_NO' class='"+ms.uiClass(formId, 'QOL_CHANEL_NO')+"' style='"+ms.uiStyle(formId, 'QOL_CHANEL_NO')+"' "+ms.uiEvent(formId, 'QOL_CHANEL_NO')+" >"+v['QOL_CHANEL_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_EMP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QOL_EMP_NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QOL_EMP_NAME')+"' "+ms.tdEvent(formId, 'QOL_EMP_NAME')+">")
            arrHtml.push("<span colno='QOL_EMP_NAME' class='"+ms.uiClass(formId, 'QOL_EMP_NAME')+"' style='"+ms.uiStyle(formId, 'QOL_EMP_NAME')+"' "+ms.uiEvent(formId, 'QOL_EMP_NAME')+" title='"+ms.titleAttr(formId,'QOL_EMP_NAME','IS_TITLE_ATTR',v)+"'>"+v['QOL_EMP_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QOL_ORERATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QOL_ORERATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QOL_ORERATE_TIME')+"' "+ms.tdEvent(formId, 'QOL_ORERATE_TIME')+">")
            arrHtml.push("<span colno='QOL_ORERATE_TIME' class='"+ms.uiClass(formId, 'QOL_ORERATE_TIME')+"' style='"+ms.uiStyle(formId, 'QOL_ORERATE_TIME')+"' "+ms.uiEvent(formId, 'QOL_ORERATE_TIME')+" title='"+ms.titleAttr(formId,'QOL_ORERATE_TIME','IS_TITLE_ATTR',v)+"'>"+v['QOL_ORERATE_TIME']+"</span>")
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
    if(isFirstSetScroll == 0){
    	isFirstSetScroll =1;
    	setScroll();
    }
}
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料追溯
function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  


//物料信息
function itemJump2(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//制令单信息
function itemJump3(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//BOM管理
function itemJump4(obj){
  winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 

//设备建档
function itemJump5(obj){
    winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
} 

//物料作业报表
function itemJump6(obj){
  winOptMethod.jump("e5a8e72f4d3b4564911305406bc40129","F10170","jumpId2",obj);
} 


</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
