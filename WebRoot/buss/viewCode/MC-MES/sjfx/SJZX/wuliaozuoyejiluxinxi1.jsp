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
		<dict:lang value="物料作业记录信息1" />
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
		<bu:header formId ="23c204a5e01541268502229d464b65b5"/>

    
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
		<bu:func viewId="3ae85153835841e7950c336117d3a09f" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="3ae85153835841e7950c336117d3a09f" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage23c204a5e01541268502229d464b65b5" id="formPage23c204a5e01541268502229d464b65b5" value="${formPage23c204a5e01541268502229d464b65b5}"/>
		<input type="hidden" name="formId" id="formId1" value='23c204a5e01541268502229d464b65b5'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="23c204a5e01541268502229d464b65b5">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax23c204a5e01541268502229d464b65b5" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner23c204a5e01541268502229d464b65b5">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable23c204a5e01541268502229d464b65b5" style="min-width: 3180px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="23c204a5e01541268502229d464b65b5" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_23c204a5e01541268502229d464b65b5" onclick="_selectAjaxTableAllData(this,'23c204a5e01541268502229d464b65b5')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_MO_NUMBER" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ACTIONTYPE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ITEM_TYPE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSI_MODEL_CODE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_PROCESS_FACE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_AREA_ID" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_WORKSTATION_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ONLINE_FLAG" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="WSI_ITEM_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_ITEM_CODE" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_LOT_NO" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_ITEM_COUNT" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_POINT" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_POINT_NUM" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_SUPPLIERS" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:180px;"><bu:uitn colNo="WSI_ITEM_SN_OLD" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WSI_ITEM_CODE_OLD" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_LOT_NO_OLD" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_COUNT_OLD" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_DEVICE_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_DEVICE_SEQ" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_TRUCK_NO" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_TABLE_NO" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_LOADPOINT_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="WSI_FEEDER_SN" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_CHANEL_NO" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_TRAY_FLAG" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_REPEAT_FLAG" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSI_EMP" formId="23c204a5e01541268502229d464b65b5" /></td>
			<td class="datagrid-cell" ><bu:uitn colNo="WSI_LOADTIME" formId="23c204a5e01541268502229d464b65b5" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv23c204a5e01541268502229d464b65b5" onscroll="ajaxTableScroll(this,'23c204a5e01541268502229d464b65b5')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax23c204a5e01541268502229d464b65b5" style="min-width: 3160px;">
		<tbody id="tbody_23c204a5e01541268502229d464b65b5" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage23c204a5e01541268502229d464b65b5==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=23c204a5e01541268502229d464b65b5&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3ae85153835841e7950c336117d3a09f" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3ae85153835841e7950c336117d3a09f" />
    
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
    if(formId=='23c204a5e01541268502229d464b65b5'){<%--物料作业记录视图--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WSI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WSI_MO_NUMBER' class='"+ms.uiClass(formId, 'WSI_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WSI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WSI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WSI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ACTIONTYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ACTIONTYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.tdEvent(formId, 'WSI_ACTIONTYPE')+">")
            arrHtml.push("<span colno='WSI_ACTIONTYPE' class='"+ms.uiClass(formId, 'WSI_ACTIONTYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.uiEvent(formId, 'WSI_ACTIONTYPE')+" title='"+ms.titleAttr(formId,'WSI_ACTIONTYPE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ACTIONTYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='WSI_ITEM_TYPE' class='"+ms.uiClass(formId, 'WSI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WSI_MODEL_CODE')+">")
            arrHtml.push("<span colno='WSI_MODEL_CODE' class='"+ms.uiClass(formId, 'WSI_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.uiEvent(formId, 'WSI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WSI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PROCESS_FACE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WSI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WSI_PROCESS_FACE' class='"+ms.uiClass(formId, 'WSI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WSI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WSI_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WSI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_AREA_ID' class='datagrid-cell "+ms.tdClass(formId, 'WSI_AREA_ID')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_AREA_ID')+"' "+ms.tdEvent(formId, 'WSI_AREA_ID')+">")
            arrHtml.push("<span colno='WSI_AREA_ID' class='"+ms.uiClass(formId, 'WSI_AREA_ID')+"' style='"+ms.uiStyle(formId, 'WSI_AREA_ID')+"' "+ms.uiEvent(formId, 'WSI_AREA_ID')+" title='"+ms.titleAttr(formId,'WSI_AREA_ID','IS_TITLE_ATTR',v)+"' >"+v['WSI_AREA_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_WORKSTATION_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_WORKSTATION_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.tdEvent(formId, 'WSI_WORKSTATION_SN')+">")
            arrHtml.push("<span colno='WSI_WORKSTATION_SN' class='"+ms.uiClass(formId, 'WSI_WORKSTATION_SN')+"' style='"+ms.uiStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.uiEvent(formId, 'WSI_WORKSTATION_SN')+" title='"+ms.titleAttr(formId,'WSI_WORKSTATION_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_WORKSTATION_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ONLINE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ONLINE_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.tdEvent(formId, 'WSI_ONLINE_FLAG')+">")
            arrHtml.push("<span colno='WSI_ONLINE_FLAG' class='"+ms.uiClass(formId, 'WSI_ONLINE_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.uiEvent(formId, 'WSI_ONLINE_FLAG')+" title='"+ms.titleAttr(formId,'WSI_ONLINE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_ONLINE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='width:180px;"+ms.tdStyle(formId, 'WSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_LOT_NO')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO')+">")
            arrHtml.push("<span colno='WSI_LOT_NO' class='"+ms.uiClass(formId, 'WSI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_COUNT')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.tdEvent(formId, 'WSI_ITEM_COUNT')+">")
            arrHtml.push("<span colno='WSI_ITEM_COUNT' class='"+ms.uiClass(formId, 'WSI_ITEM_COUNT')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.uiEvent(formId, 'WSI_ITEM_COUNT')+" title='"+ms.titleAttr(formId,'WSI_ITEM_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT')+"' style='width:80px;"+ms.tdStyle(formId, 'WSI_POINT')+"' "+ms.tdEvent(formId, 'WSI_POINT')+">")
            arrHtml.push("<span colno='WSI_POINT' class='"+ms.uiClass(formId, 'WSI_POINT')+"' style='"+ms.uiStyle(formId, 'WSI_POINT')+"' "+ms.uiEvent(formId, 'WSI_POINT')+" title='"+ms.titleAttr(formId,'WSI_POINT','IS_TITLE_ATTR',v)+"' >"+v['WSI_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSI_POINT_NUM')+"' "+ms.tdEvent(formId, 'WSI_POINT_NUM')+">")
            arrHtml.push("<span colno='WSI_POINT_NUM' class='"+ms.uiClass(formId, 'WSI_POINT_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_POINT_NUM')+"' "+ms.uiEvent(formId, 'WSI_POINT_NUM')+" title='"+ms.titleAttr(formId,'WSI_POINT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_POINT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUPPLIERS' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUPPLIERS')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.tdEvent(formId, 'WSI_SUPPLIERS')+">")
            arrHtml.push("<span colno='WSI_SUPPLIERS' class='"+ms.uiClass(formId, 'WSI_SUPPLIERS')+"' style='"+ms.uiStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.uiEvent(formId, 'WSI_SUPPLIERS')+" title='"+ms.titleAttr(formId,'WSI_SUPPLIERS','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUPPLIERS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN_OLD')+"' style='width:180px;"+ms.tdStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_SN_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN_OLD')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='width:120px;"+ms.tdStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE_OLD')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO_OLD')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO_OLD')+">")
            arrHtml.push("<span colno='WSI_LOT_NO_OLD' class='"+ms.uiClass(formId, 'WSI_LOT_NO_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO_OLD')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_COUNT_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_COUNT_OLD')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.tdEvent(formId, 'WSI_COUNT_OLD')+">")
            arrHtml.push("<span colno='WSI_COUNT_OLD' class='"+ms.uiClass(formId, 'WSI_COUNT_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.uiEvent(formId, 'WSI_COUNT_OLD')+" title='"+ms.titleAttr(formId,'WSI_COUNT_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_COUNT_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SN')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SN' class='"+ms.uiClass(formId, 'WSI_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SN')+" title='"+ms.titleAttr(formId,'WSI_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SEQ')+"' style='width:80px;"+ms.tdStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SEQ')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SEQ' class='"+ms.uiClass(formId, 'WSI_DEVICE_SEQ')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SEQ')+" title='"+ms.titleAttr(formId,'WSI_DEVICE_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WSI_DEVICE_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRUCK_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRUCK_NO')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.tdEvent(formId, 'WSI_TRUCK_NO')+">")
            arrHtml.push("<span colno='WSI_TRUCK_NO' class='"+ms.uiClass(formId, 'WSI_TRUCK_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.uiEvent(formId, 'WSI_TRUCK_NO')+" title='"+ms.titleAttr(formId,'WSI_TRUCK_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_TRUCK_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TABLE_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TABLE_NO')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_TABLE_NO')+"' "+ms.tdEvent(formId, 'WSI_TABLE_NO')+">")
            arrHtml.push("<span colno='WSI_TABLE_NO' class='"+ms.uiClass(formId, 'WSI_TABLE_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TABLE_NO')+"' "+ms.uiEvent(formId, 'WSI_TABLE_NO')+" title='"+ms.titleAttr(formId,'WSI_TABLE_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_TABLE_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADPOINT_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADPOINT_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.tdEvent(formId, 'WSI_LOADPOINT_SN')+">")
            arrHtml.push("<span colno='WSI_LOADPOINT_SN' class='"+ms.uiClass(formId, 'WSI_LOADPOINT_SN')+"' style='"+ms.uiStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.uiEvent(formId, 'WSI_LOADPOINT_SN')+" title='"+ms.titleAttr(formId,'WSI_LOADPOINT_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOADPOINT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FEEDER_SN')+"' style='width:100px;"+ms.tdStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.tdEvent(formId, 'WSI_FEEDER_SN')+">")
            arrHtml.push("<span colno='WSI_FEEDER_SN' class='"+ms.uiClass(formId, 'WSI_FEEDER_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.uiEvent(formId, 'WSI_FEEDER_SN')+" title='"+ms.titleAttr(formId,'WSI_FEEDER_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FEEDER_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CHANEL_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CHANEL_NO')+"' style='width:80px;"+ms.tdStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.tdEvent(formId, 'WSI_CHANEL_NO')+">")
            arrHtml.push("<span colno='WSI_CHANEL_NO' class='"+ms.uiClass(formId, 'WSI_CHANEL_NO')+"' style='"+ms.uiStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.uiEvent(formId, 'WSI_CHANEL_NO')+" title='"+ms.titleAttr(formId,'WSI_CHANEL_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_CHANEL_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRAY_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRAY_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.tdEvent(formId, 'WSI_TRAY_FLAG')+">")
            arrHtml.push("<span colno='WSI_TRAY_FLAG' class='"+ms.uiClass(formId, 'WSI_TRAY_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.uiEvent(formId, 'WSI_TRAY_FLAG')+" title='"+ms.titleAttr(formId,'WSI_TRAY_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_TRAY_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_REPEAT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_REPEAT_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_REPEAT_FLAG')+">")
            arrHtml.push("<span colno='WSI_REPEAT_FLAG' class='"+ms.uiClass(formId, 'WSI_REPEAT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_REPEAT_FLAG')+" title='"+ms.titleAttr(formId,'WSI_REPEAT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_REPEAT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_EMP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_EMP_NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSI_EMP_NAME')+"' "+ms.tdEvent(formId, 'WSI_EMP_NAME')+">")
            arrHtml.push("<span colno='WSI_EMP_NAME' class='"+ms.uiClass(formId, 'WSI_EMP_NAME')+"' style='"+ms.uiStyle(formId, 'WSI_EMP_NAME')+"' "+ms.uiEvent(formId, 'WSI_EMP_NAME')+" title='"+ms.titleAttr(formId,'WSI_EMP_NAME','IS_TITLE_ATTR',v)+"' >"+v['WSI_EMP_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADTIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADTIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'WSI_LOADTIME')+"' "+ms.tdEvent(formId, 'WSI_LOADTIME')+">")
            arrHtml.push("<span colno='WSI_LOADTIME' class='"+ms.uiClass(formId, 'WSI_LOADTIME')+"' style='"+ms.uiStyle(formId, 'WSI_LOADTIME')+"' "+ms.uiEvent(formId, 'WSI_LOADTIME')+" title='"+ms.titleAttr(formId,'WSI_LOADTIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOADTIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
     setScroll();
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
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
