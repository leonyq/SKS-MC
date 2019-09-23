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
		<dict:lang value="物料中间表信息" />
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
		<bu:header formId ="a5c2d366015d4387b20efc4bb2d30f81"/>

    
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
		<bu:func viewId="4cfdf1a7f01f41c4b7878806fef424e3" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="4cfdf1a7f01f41c4b7878806fef424e3" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagea5c2d366015d4387b20efc4bb2d30f81" id="formPagea5c2d366015d4387b20efc4bb2d30f81" value="${formPagea5c2d366015d4387b20efc4bb2d30f81}"/>
		<input type="hidden" name="formId" id="formId1" value='a5c2d366015d4387b20efc4bb2d30f81'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="a5c2d366015d4387b20efc4bb2d30f81">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxa5c2d366015d4387b20efc4bb2d30f81" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innera5c2d366015d4387b20efc4bb2d30f81">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablea5c2d366015d4387b20efc4bb2d30f81" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="a5c2d366015d4387b20efc4bb2d30f81" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_a5c2d366015d4387b20efc4bb2d30f81" onclick="_selectAjaxTableAllData(this,'a5c2d366015d4387b20efc4bb2d30f81')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_MANUFACTURER" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_ITEM_NAME" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_ITEM_SPCE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_FOURTH_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_QUALITY_STATUS" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_PROJECT_ID" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_CUST_CODE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_MO_NUMBER" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_ITEM_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_DOC_NO" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_PO" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_SN_NUM" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_ITEM_SEQ" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_LOT_NO" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_ITEM_TYPE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_ITEM_CODE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_SUP_CODE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_SUP_LOT" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_PRODUCE_DATE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_CREATE_DATE" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_FIRST_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_SECOND_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
			<td class="datagrid-cell" style="width:30px; text-align:center;"><bu:uitn colNo="WMI_THIRD_SN" formId="a5c2d366015d4387b20efc4bb2d30f81" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiva5c2d366015d4387b20efc4bb2d30f81" onscroll="ajaxTableScroll(this,'a5c2d366015d4387b20efc4bb2d30f81')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxa5c2d366015d4387b20efc4bb2d30f81">
		<tbody id="tbody_a5c2d366015d4387b20efc4bb2d30f81" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagea5c2d366015d4387b20efc4bb2d30f81==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=a5c2d366015d4387b20efc4bb2d30f81&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="4cfdf1a7f01f41c4b7878806fef424e3" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="4cfdf1a7f01f41c4b7878806fef424e3" />
    
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
    if(formId=='a5c2d366015d4387b20efc4bb2d30f81'){<%--FM-物料中间表信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_MANUFACTURER' class='datagrid-cell "+ms.tdClass(formId, 'WMI_MANUFACTURER')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_MANUFACTURER')+"' "+ms.tdEvent(formId, 'WMI_MANUFACTURER')+">")
            arrHtml.push("<span colno='WMI_MANUFACTURER' class='"+ms.uiClass(formId, 'WMI_MANUFACTURER')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_MANUFACTURER')+"' "+ms.uiEvent(formId, 'WMI_MANUFACTURER')+" title='"+ms.titleAttr(formId,'WMI_MANUFACTURER','IS_TITLE_ATTR',v)+"' >"+v['WMI_MANUFACTURER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_NAME')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WMI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WMI_ITEM_NAME' class='"+ms.uiClass(formId, 'WMI_ITEM_NAME')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WMI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WMI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WMI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_SPCE' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_SPCE')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_ITEM_SPCE')+"' "+ms.tdEvent(formId, 'WMI_ITEM_SPCE')+">")
            arrHtml.push("<span colno='WMI_ITEM_SPCE' class='"+ms.uiClass(formId, 'WMI_ITEM_SPCE')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_ITEM_SPCE')+"' "+ms.uiEvent(formId, 'WMI_ITEM_SPCE')+" title='"+ms.titleAttr(formId,'WMI_ITEM_SPCE','IS_TITLE_ATTR',v)+"' >"+v['WMI_ITEM_SPCE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_FOURTH_SN' class='datagrid-cell "+ms.tdClass(formId, 'WMI_FOURTH_SN')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_FOURTH_SN')+"' "+ms.tdEvent(formId, 'WMI_FOURTH_SN')+">")
            arrHtml.push("<span colno='WMI_FOURTH_SN' class='"+ms.uiClass(formId, 'WMI_FOURTH_SN')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_FOURTH_SN')+"' "+ms.uiEvent(formId, 'WMI_FOURTH_SN')+" title='"+ms.titleAttr(formId,'WMI_FOURTH_SN','IS_TITLE_ATTR',v)+"' >"+v['WMI_FOURTH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_QUALITY_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WMI_QUALITY_STATUS')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_QUALITY_STATUS')+"' "+ms.tdEvent(formId, 'WMI_QUALITY_STATUS')+">")
            arrHtml.push("<span colno='WMI_QUALITY_STATUS' class='"+ms.uiClass(formId, 'WMI_QUALITY_STATUS')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_QUALITY_STATUS')+"' "+ms.uiEvent(formId, 'WMI_QUALITY_STATUS')+" title='"+ms.titleAttr(formId,'WMI_QUALITY_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WMI_QUALITY_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'WMI_PROJECT_ID')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_PROJECT_ID')+"' "+ms.tdEvent(formId, 'WMI_PROJECT_ID')+">")
            arrHtml.push("<span colno='WMI_PROJECT_ID' class='"+ms.uiClass(formId, 'WMI_PROJECT_ID')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_PROJECT_ID')+"' "+ms.uiEvent(formId, 'WMI_PROJECT_ID')+" title='"+ms.titleAttr(formId,'WMI_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['WMI_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WMI_CUST_CODE')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_CUST_CODE')+"' "+ms.tdEvent(formId, 'WMI_CUST_CODE')+">")
            arrHtml.push("<span colno='WMI_CUST_CODE' class='"+ms.uiClass(formId, 'WMI_CUST_CODE')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_CUST_CODE')+"' "+ms.uiEvent(formId, 'WMI_CUST_CODE')+" title='"+ms.titleAttr(formId,'WMI_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WMI_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WMI_MO_NUMBER')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WMI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WMI_MO_NUMBER' class='"+ms.uiClass(formId, 'WMI_MO_NUMBER')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WMI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WMI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WMI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_SN')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WMI_ITEM_SN')+">")
            arrHtml.push("<span colno='WMI_ITEM_SN' class='"+ms.uiClass(formId, 'WMI_ITEM_SN')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WMI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WMI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WMI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_DOC_NO' class='datagrid-cell "+ms.tdClass(formId, 'WMI_DOC_NO')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_DOC_NO')+"' "+ms.tdEvent(formId, 'WMI_DOC_NO')+">")
            arrHtml.push("<span colno='WMI_DOC_NO' class='"+ms.uiClass(formId, 'WMI_DOC_NO')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_DOC_NO')+"' "+ms.uiEvent(formId, 'WMI_DOC_NO')+" title='"+ms.titleAttr(formId,'WMI_DOC_NO','IS_TITLE_ATTR',v)+"' >"+v['WMI_DOC_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_PO' class='datagrid-cell "+ms.tdClass(formId, 'WMI_PO')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_PO')+"' "+ms.tdEvent(formId, 'WMI_PO')+">")
            arrHtml.push("<span colno='WMI_PO' class='"+ms.uiClass(formId, 'WMI_PO')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_PO')+"' "+ms.uiEvent(formId, 'WMI_PO')+" title='"+ms.titleAttr(formId,'WMI_PO','IS_TITLE_ATTR',v)+"' >"+v['WMI_PO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_SN_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WMI_SN_NUM')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_SN_NUM')+"' "+ms.tdEvent(formId, 'WMI_SN_NUM')+">")
            arrHtml.push("<span colno='WMI_SN_NUM' class='"+ms.uiClass(formId, 'WMI_SN_NUM')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_SN_NUM')+"' "+ms.uiEvent(formId, 'WMI_SN_NUM')+" title='"+ms.titleAttr(formId,'WMI_SN_NUM','IS_TITLE_ATTR',v)+"' >"+v['WMI_SN_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_SEQ')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_ITEM_SEQ')+"' "+ms.tdEvent(formId, 'WMI_ITEM_SEQ')+">")
            arrHtml.push("<span colno='WMI_ITEM_SEQ' class='"+ms.uiClass(formId, 'WMI_ITEM_SEQ')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_ITEM_SEQ')+"' "+ms.uiEvent(formId, 'WMI_ITEM_SEQ')+" title='"+ms.titleAttr(formId,'WMI_ITEM_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WMI_ITEM_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WMI_LOT_NO')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_LOT_NO')+"' "+ms.tdEvent(formId, 'WMI_LOT_NO')+">")
            arrHtml.push("<span colno='WMI_LOT_NO' class='"+ms.uiClass(formId, 'WMI_LOT_NO')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_LOT_NO')+"' "+ms.uiEvent(formId, 'WMI_LOT_NO')+" title='"+ms.titleAttr(formId,'WMI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WMI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_TYPE')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'WMI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='WMI_ITEM_TYPE' class='"+ms.uiClass(formId, 'WMI_ITEM_TYPE')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'WMI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'WMI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WMI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WMI_ITEM_CODE')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WMI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WMI_ITEM_CODE' class='"+ms.uiClass(formId, 'WMI_ITEM_CODE')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WMI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WMI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WMI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WMI_SUP_CODE')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_SUP_CODE')+"' "+ms.tdEvent(formId, 'WMI_SUP_CODE')+">")
            arrHtml.push("<span colno='WMI_SUP_CODE' class='"+ms.uiClass(formId, 'WMI_SUP_CODE')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_SUP_CODE')+"' "+ms.uiEvent(formId, 'WMI_SUP_CODE')+" title='"+ms.titleAttr(formId,'WMI_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WMI_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_SUP_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WMI_SUP_LOT')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_SUP_LOT')+"' "+ms.tdEvent(formId, 'WMI_SUP_LOT')+">")
            arrHtml.push("<span colno='WMI_SUP_LOT' class='"+ms.uiClass(formId, 'WMI_SUP_LOT')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_SUP_LOT')+"' "+ms.uiEvent(formId, 'WMI_SUP_LOT')+" title='"+ms.titleAttr(formId,'WMI_SUP_LOT','IS_TITLE_ATTR',v)+"' >"+v['WMI_SUP_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_PRODUCE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WMI_PRODUCE_DATE')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_PRODUCE_DATE')+"' "+ms.tdEvent(formId, 'WMI_PRODUCE_DATE')+">")
            arrHtml.push("<span colno='WMI_PRODUCE_DATE' class='"+ms.uiClass(formId, 'WMI_PRODUCE_DATE')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_PRODUCE_DATE')+"' "+ms.uiEvent(formId, 'WMI_PRODUCE_DATE')+" title='"+ms.titleAttr(formId,'WMI_PRODUCE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WMI_PRODUCE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_CREATE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WMI_CREATE_DATE')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_CREATE_DATE')+"' "+ms.tdEvent(formId, 'WMI_CREATE_DATE')+">")
            arrHtml.push("<span colno='WMI_CREATE_DATE' class='"+ms.uiClass(formId, 'WMI_CREATE_DATE')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_CREATE_DATE')+"' "+ms.uiEvent(formId, 'WMI_CREATE_DATE')+" title='"+ms.titleAttr(formId,'WMI_CREATE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WMI_CREATE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_FIRST_SN' class='datagrid-cell "+ms.tdClass(formId, 'WMI_FIRST_SN')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_FIRST_SN')+"' "+ms.tdEvent(formId, 'WMI_FIRST_SN')+">")
            arrHtml.push("<span colno='WMI_FIRST_SN' class='"+ms.uiClass(formId, 'WMI_FIRST_SN')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_FIRST_SN')+"' "+ms.uiEvent(formId, 'WMI_FIRST_SN')+" title='"+ms.titleAttr(formId,'WMI_FIRST_SN','IS_TITLE_ATTR',v)+"' >"+v['WMI_FIRST_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_SECOND_SN' class='datagrid-cell "+ms.tdClass(formId, 'WMI_SECOND_SN')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_SECOND_SN')+"' "+ms.tdEvent(formId, 'WMI_SECOND_SN')+">")
            arrHtml.push("<span colno='WMI_SECOND_SN' class='"+ms.uiClass(formId, 'WMI_SECOND_SN')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_SECOND_SN')+"' "+ms.uiEvent(formId, 'WMI_SECOND_SN')+" title='"+ms.titleAttr(formId,'WMI_SECOND_SN','IS_TITLE_ATTR',v)+"' >"+v['WMI_SECOND_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WMI_THIRD_SN' class='datagrid-cell "+ms.tdClass(formId, 'WMI_THIRD_SN')+"' style='width:30px;"+ms.tdStyle(formId, 'WMI_THIRD_SN')+"' "+ms.tdEvent(formId, 'WMI_THIRD_SN')+">")
            arrHtml.push("<span colno='WMI_THIRD_SN' class='"+ms.uiClass(formId, 'WMI_THIRD_SN')+"' style='width:30px;"+ms.uiStyle(formId, 'WMI_THIRD_SN')+"' "+ms.uiEvent(formId, 'WMI_THIRD_SN')+" title='"+ms.titleAttr(formId,'WMI_THIRD_SN','IS_TITLE_ATTR',v)+"' >"+v['WMI_THIRD_SN']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
