<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 by mmz-->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="XRAY主界面" />
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
		<bu:header formId ="389a3c9c903a4601b332dc76a18f46e6"/>

    
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
		<bu:func viewId="2da715a56617455fbb00d2ebd4b0daae" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="2da715a56617455fbb00d2ebd4b0daae" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage389a3c9c903a4601b332dc76a18f46e6" id="formPage389a3c9c903a4601b332dc76a18f46e6" value="${formPage389a3c9c903a4601b332dc76a18f46e6}"/>
		<input type="hidden" name="formId" id="formId1" value='389a3c9c903a4601b332dc76a18f46e6'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="389a3c9c903a4601b332dc76a18f46e6">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax389a3c9c903a4601b332dc76a18f46e6" style="overflow-x:hidden">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner389a3c9c903a4601b332dc76a18f46e6">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable389a3c9c903a4601b332dc76a18f46e6">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="389a3c9c903a4601b332dc76a18f46e6" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_389a3c9c903a4601b332dc76a18f46e6" onclick="_selectAjaxTableAllData(this,'389a3c9c903a4601b332dc76a18f46e6')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="389a3c9c903a4601b332dc76a18f46e6" /></td> 
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="PM_MO_NUMBER" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="PM_PROJECT_ID" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="PM_MODEL_CODE" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="PM_AREA_SN" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="PM_STATUS" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="MGS_PCS" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="MGS_OK_PCS" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="MGS_NG_PCS" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
            <%--拓展字段，关联制令单做查询使用--%>
        <%--    
        <td class="datagrid-cell"><bu:uitn colNo="XRAY_SN" formId="389a3c9c903a4601b332dc76a18f46e6" /></td>
        --%>
		
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv389a3c9c903a4601b332dc76a18f46e6" onscroll="ajaxTableScroll(this,'389a3c9c903a4601b332dc76a18f46e6')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax389a3c9c903a4601b332dc76a18f46e6">
		<tbody id="tbody_389a3c9c903a4601b332dc76a18f46e6" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage389a3c9c903a4601b332dc76a18f46e6==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=389a3c9c903a4601b332dc76a18f46e6&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="2da715a56617455fbb00d2ebd4b0daae" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="2da715a56617455fbb00d2ebd4b0daae" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
<%--生成异步表格--%>	
var check_ = "";
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='389a3c9c903a4601b332dc76a18f46e6'){<%--XRay主页--%>
     console.log(uiTxt);
       console.log($("#mmz_input").val());
        $.each(uiTxt,function(i,v){
            
             if($("#mmz_input").val()!=""){
                	
                if(check_==v['PM_MO_NUMBER']){//此处判断已无用，留作纪念。----无知是多么多么的寂寞
                   var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                   //ondblclick='mmz_showDetail(this)'
            arrHtml.push("<tr  class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td name='DATA_AUTH' colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='PM_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PM_MO_NUMBER')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_MO_NUMBER')+"' "+ms.tdEvent(formId, 'PM_MO_NUMBER')+">")
            arrHtml.push("<span colno='PM_MO_NUMBER' class='"+ms.uiClass(formId, 'PM_MO_NUMBER')+"' onclick='itemJump1(\""+v['PM_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PM_MO_NUMBER')+" title='"+ms.titleAttr(formId,'PM_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PM_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PM_PROJECT_ID')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PM_PROJECT_ID')+">")
            arrHtml.push("<span colno='PM_PROJECT_ID' class='"+ms.uiClass(formId, 'PM_PROJECT_ID')+"' onclick='itemJump2(\""+v['PM_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PM_PROJECT_ID')+" title='"+ms.titleAttr(formId,'PM_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PM_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PM_MODEL_CODE')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PM_MODEL_CODE')+">")
            arrHtml.push("<span colno='PM_MODEL_CODE' class='"+ms.uiClass(formId, 'PM_MODEL_CODE')+"' onclick='itemJump3(\""+v['PM_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'PM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['PM_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PM_AREA_SN')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_AREA_SN')+"' "+ms.tdEvent(formId, 'PM_AREA_SN')+">")
            arrHtml.push("<span colno='PM_AREA_SN' class='"+ms.uiClass(formId, 'PM_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PM_AREA_SN')+"' "+ms.uiEvent(formId, 'PM_AREA_SN')+" title='"+ms.titleAttr(formId,'PM_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PM_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'PM_STATUS')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_STATUS')+"' "+ms.tdEvent(formId, 'PM_STATUS')+">")
            arrHtml.push("<span colno='PM_STATUS' class='"+ms.uiClass(formId, 'PM_STATUS')+"' style='"+ms.uiStyle(formId, 'PM_STATUS')+"' "+ms.uiEvent(formId, 'PM_STATUS')+" title='"+ms.titleAttr(formId,'PM_STATUS','IS_TITLE_ATTR',v)+"' >"+v['PM_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MGS_PCS' class='datagrid-cell "+ms.tdClass(formId, 'MGS_PCS')+"' style='width:140px;"+ms.tdStyle(formId, 'MGS_PCS')+"' "+ms.tdEvent(formId, 'MGS_PCS')+">")
            arrHtml.push("<span colno='MGS_PCS' class='"+ms.uiClass(formId, 'MGS_PCS')+"' style='"+ms.uiStyle(formId, 'MGS_PCS')+"' "+ms.uiEvent(formId, 'MGS_PCS')+" title='"+ms.titleAttr(formId,'MGS_PCS','IS_TITLE_ATTR',v)+"' >"+v['MGS_PCS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MGS_OK_PCS' class='datagrid-cell "+ms.tdClass(formId, 'MGS_OK_PCS')+"' style='width:140px;"+ms.tdStyle(formId, 'MGS_OK_PCS')+"' "+ms.tdEvent(formId, 'MGS_OK_PCS')+">")
            arrHtml.push("<span colno='MGS_OK_PCS' class='"+ms.uiClass(formId, 'MGS_OK_PCS')+"' style='"+ms.uiStyle(formId, 'MGS_OK_PCS')+"' "+ms.uiEvent(formId, 'MGS_OK_PCS')+" title='"+ms.titleAttr(formId,'MGS_OK_PCS','IS_TITLE_ATTR',v)+"' >"+v['MGS_OK_PCS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MGS_NG_PCS' class='datagrid-cell "+ms.tdClass(formId, 'MGS_NG_PCS')+"' style='width:140px;"+ms.tdStyle(formId, 'MGS_NG_PCS')+"' "+ms.tdEvent(formId, 'MGS_NG_PCS')+">")
            arrHtml.push("<span colno='MGS_NG_PCS' class='"+ms.uiClass(formId, 'MGS_NG_PCS')+"' style='"+ms.uiStyle(formId, 'MGS_NG_PCS')+"' "+ms.uiEvent(formId, 'MGS_NG_PCS')+" title='"+ms.titleAttr(formId,'MGS_NG_PCS','IS_TITLE_ATTR',v)+"' >"+v['MGS_NG_PCS']+"</span>")
            arrHtml.push("</td>");//XRAY_SN
            <%--
            arrHtml.push("<td colno='XRAY_SN' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_SN')+"' style='"+ms.tdStyle(formId, 'XRAY_SN')+"' "+ms.tdEvent(formId, 'XRAY_SN')+">")
            arrHtml.push("<span colno='XRAY_SN' class='"+ms.uiClass(formId, 'XRAY_SN')+"' style='"+ms.uiStyle(formId, 'XRAY_SN')+"' "+ms.uiEvent(formId, 'XRAY_SN')+" title='"+ms.titleAttr(formId,'XRAY_SN','IS_TITLE_ATTR',v)+"' >"+v['XRAY_SN']+"</span>")
            arrHtml.push("</td>");//XRAY_SN
            --%>
            arrHtml.push("</tr>")
            }
             }else{
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr  ondblclick='mmz_showDetail(this)' class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td name='DATA_AUTH' colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td name='pm_no_number' colno='PM_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PM_MO_NUMBER')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_MO_NUMBER')+"' "+ms.tdEvent(formId, 'PM_MO_NUMBER')+">")
            arrHtml.push("<span colno='PM_MO_NUMBER' class='"+ms.uiClass(formId, 'PM_MO_NUMBER')+"' onclick='itemJump1(\""+v['PM_MO_NUMBER']+"\")' "+ms.uiEvent(formId, 'PM_MO_NUMBER')+" title='"+ms.titleAttr(formId,'PM_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PM_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PM_PROJECT_ID')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PM_PROJECT_ID')+">")
            arrHtml.push("<span colno='PM_PROJECT_ID' class='"+ms.uiClass(formId, 'PM_PROJECT_ID')+"' onclick='itemJump2(\""+v['PM_PROJECT_ID']+"\")' "+ms.uiEvent(formId, 'PM_PROJECT_ID')+" title='"+ms.titleAttr(formId,'PM_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PM_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PM_MODEL_CODE')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PM_MODEL_CODE')+">")
            arrHtml.push("<span colno='PM_MODEL_CODE' class='"+ms.uiClass(formId, 'PM_MODEL_CODE')+"' onclick='itemJump3(\""+v['PM_MODEL_CODE']+"\")' "+ms.uiEvent(formId, 'PM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'PM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['PM_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PM_AREA_SN')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_AREA_SN')+"' "+ms.tdEvent(formId, 'PM_AREA_SN')+">")
            arrHtml.push("<span colno='PM_AREA_SN' class='"+ms.uiClass(formId, 'PM_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PM_AREA_SN')+"' "+ms.uiEvent(formId, 'PM_AREA_SN')+" title='"+ms.titleAttr(formId,'PM_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PM_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PM_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'PM_STATUS')+"' style='width:140px;"+ms.tdStyle(formId, 'PM_STATUS')+"' "+ms.tdEvent(formId, 'PM_STATUS')+">")
            arrHtml.push("<span colno='PM_STATUS' class='"+ms.uiClass(formId, 'PM_STATUS')+"' style='"+ms.uiStyle(formId, 'PM_STATUS')+"' "+ms.uiEvent(formId, 'PM_STATUS')+" title='"+ms.titleAttr(formId,'PM_STATUS','IS_TITLE_ATTR',v)+"' >"+v['PM_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MGS_PCS' class='datagrid-cell "+ms.tdClass(formId, 'MGS_PCS')+"' style='width:140px;"+ms.tdStyle(formId, 'MGS_PCS')+"' "+ms.tdEvent(formId, 'MGS_PCS')+">")
            arrHtml.push("<span colno='MGS_PCS' class='"+ms.uiClass(formId, 'MGS_PCS')+"' style='"+ms.uiStyle(formId, 'MGS_PCS')+"' "+ms.uiEvent(formId, 'MGS_PCS')+" title='"+ms.titleAttr(formId,'MGS_PCS','IS_TITLE_ATTR',v)+"' >"+v['MGS_PCS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MGS_OK_PCS' class='datagrid-cell "+ms.tdClass(formId, 'MGS_OK_PCS')+"' style='width:140px;"+ms.tdStyle(formId, 'MGS_OK_PCS')+"' "+ms.tdEvent(formId, 'MGS_OK_PCS')+">")
            arrHtml.push("<span colno='MGS_OK_PCS' class='"+ms.uiClass(formId, 'MGS_OK_PCS')+"' style='"+ms.uiStyle(formId, 'MGS_OK_PCS')+"' "+ms.uiEvent(formId, 'MGS_OK_PCS')+" title='"+ms.titleAttr(formId,'MGS_OK_PCS','IS_TITLE_ATTR',v)+"' >"+v['MGS_OK_PCS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MGS_NG_PCS' class='datagrid-cell "+ms.tdClass(formId, 'MGS_NG_PCS')+"' style='width:140px;"+ms.tdStyle(formId, 'MGS_NG_PCS')+"' "+ms.tdEvent(formId, 'MGS_NG_PCS')+">")
            arrHtml.push("<span colno='MGS_NG_PCS' class='"+ms.uiClass(formId, 'MGS_NG_PCS')+"' style='"+ms.uiStyle(formId, 'MGS_NG_PCS')+"' "+ms.uiEvent(formId, 'MGS_NG_PCS')+" title='"+ms.titleAttr(formId,'MGS_NG_PCS','IS_TITLE_ATTR',v)+"' >"+v['MGS_NG_PCS']+"</span>")
            arrHtml.push("</td>");//XRAY_SN
            <%--
            arrHtml.push("<td colno='XRAY_SN' class='datagrid-cell "+ms.tdClass(formId, 'XRAY_SN')+"' style='"+ms.tdStyle(formId, 'XRAY_SN')+"' "+ms.tdEvent(formId, 'XRAY_SN')+">")
            arrHtml.push("<span colno='XRAY_SN' class='"+ms.uiClass(formId, 'XRAY_SN')+"' style='"+ms.uiStyle(formId, 'XRAY_SN')+"' "+ms.uiEvent(formId, 'XRAY_SN')+" title='"+ms.titleAttr(formId,'XRAY_SN','IS_TITLE_ATTR',v)+"' >"+v['XRAY_SN']+"</span>")
            arrHtml.push("</td>");//XRAY_SN
            --%>
            arrHtml.push("</tr>")
             
             }
                
            
              
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



 function check(obj){
		util.showLoading("处理中...");
		$("#completeRepairId").prop("disabled",false);
		var getProUrl="${path}buss/bussModel_exeFunc.ms?funcMId=b37168ffa0bd4419bc5807a86dac97bf"; //VM-XRAY主界面 操作功能 验证制令单
	  $.ajax({
		type: "POST",
		async:false,
	    dataType: "json",
	    url: getProUrl,
	    data: {'sn':obj.value,"model":"search"},
		success: function(data){
				console.log(data);
				check_ = data.ajaxMap.sn;//查询在制信息表得到产品sn对应的制令单好
				$("#PM_MO_NUMBER").val(check_);//且将搜索框中的制令单的实际值更改，达到隐蔽的通过产品搜索 distinct制令单x-ray过站记录
				util.closeLoading();
				
			},
		error: function(msg){
				util.closeLoading();
				utilsFp.alert("error:"+msg);
		  }
		});	
	}
	
	/*
	//测设备接口数据处
$(function(){
    
    var list=[];
    //list.push({'':'测试项目1','test_result':'OK','test_time':'201405','memo':'项目备注1','remark1':"描述1",'remark2':"",'remark3':"",'remark4':"",'remark5':""});
    //list.push({'test_item':'测试项目2','test_result':'NG','test_time':'201407','memo':'项目备注2','remark1':"描述2",'remark2':"",'remark3':"",'remark4':"",'remark5':""});
    var it ={};
    it.test_item="测试1";
    it.test_result="OK";
    it.test_time="2015";
    it.memo="备注";
    it.remark1="1";
    it.remark2="1";
    it.remark3="1";
    it.remark4="1";
    it.remark5="1";
    var it1={};
     it1.test_item="测试12";
    it1.test_result="NG";
    it1.test_time="2016";
    it1.memo="备注2";
    it1.remark1="1";
    it1.remark2="1";
    it1.remark3="1";
    it1.remark4="1";
    it1.remark5="1";
    list.push(it);
    list.push(it1);
    var js = {};
    js.serial_number = "10101";
    js.sn_type = "未知";
    js.test_way ="未知";
    js.test_result="NG";
    js.lot_no="01";
    js.work_station="010101";
    js.emp_no="12";
    js.mo_number="MO170801_004-01";//管控 批次
    js.memo="备注1";
    js.remark1="12";
    js.remark2="12";
    js.remark3="12";
    js.remark4="12";
    js.remark5="12";
    
    list=JSON.stringify(list);
    js.test_items=list;
    	
   js =JSON.stringify(js);
   console.log(js); 
 $.ajax({
		type: "POST",
	    dataType: "json",
	    url: "http://localhost:8080/mes/http/interface.ms?model=device&method=sendTestInfoToMes",
	    data: {'testObj':js},
		success: function(data){
				console.log(data);
			},
		error: function(msg){
            console.log(msg);
		  }
		});	
});
*/
//webservice 自测

var httpReq =new XMLHttpRequest();

/*
$(function RequestWebService() {          
//这是我们在第一步中创建的Web服务的地址          
var URL = "http://190.160.2.12:8080/N2/services/TestEquipment";         
            
            //在这处我们拼接
            var data;
            data = '<?xml version="1.0" encoding="utf-8"?>';
            data = data + '<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">';
            data = data + '<soap12:Body>';
            data = data + '<HelloWorld xmlns="http://tempuri.org/" />';
            data = data + '</soap12:Body>';
            data = data + '</soap12:Envelope>';
            
            //创建异步对象
            var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            xmlhttp.Open("POST", URL, false);
            xmlhttp.SetRequestHeader("Content-Type", "application/soap+xml");
            xmlhttp.Send(data);
            document.getElementById("data").innerHTML = xmlhttp.responseText;      
 var a =  xmlhttp.responseText;
 console.log(a);
})           
*/
/*测试存储过程之XML返回*/
 $.ajax({
		type: "POST",
	    dataType: "json",
	    url: "${path}buss/bussModel_exeFunc.ms?funcMId=5bf58da85b1b497db9885e20a595927f&model=search",
	    data: {'testObj':'123'},
		success: function(data){
				console.log(data);
			},
		error: function(msg){
            console.log(msg);
		  }
		});	
		
//添加自定义搜索框
$(".search_table tbody").find('tr').eq(1).append('<td><div class="group"><div class="name">产品SN</div><div class="dec"><input id="mmz_input" type="text" onchange="check(this)" style="width:240px;box-sizing: border-box;height: 25px;line-height: 25px;padding-left: 5px;border: 1px solid #dbdbdb;" /></div></div></td>');


function mmz_showDetail(obj){
            
                var msg = $(obj).find('td').eq(2).text();
                var piframeId = window.frameElement.id;//当前的ifid
			   	var url = "${path}buss/bussModel.ms?exeid=d43a150f4a37458f9371250e50c0f77d&piframeId="+piframeId+"&mo="+ msg;
                showPopWinFp(url, 800, 400,null,'X-Ray检验查看');<%--%{getText('X-Ray检验查看')}--%>    
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
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
