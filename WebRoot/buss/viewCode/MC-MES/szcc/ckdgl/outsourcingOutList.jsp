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
		<dict:lang value="委外出库列表" />
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
		<bu:header formId ="9c02534e4ccd4851a2429adf56c6020a"/>

    
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
		<bu:func viewId="72b82cd5bcc840099afc6a731f49f101" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="72b82cd5bcc840099afc6a731f49f101" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage9c02534e4ccd4851a2429adf56c6020a" id="formPage9c02534e4ccd4851a2429adf56c6020a" value="${formPage9c02534e4ccd4851a2429adf56c6020a}"/>
		<input type="hidden" name="formId" id="formId1" value='9c02534e4ccd4851a2429adf56c6020a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9c02534e4ccd4851a2429adf56c6020a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9c02534e4ccd4851a2429adf56c6020a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9c02534e4ccd4851a2429adf56c6020a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9c02534e4ccd4851a2429adf56c6020a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9c02534e4ccd4851a2429adf56c6020a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9c02534e4ccd4851a2429adf56c6020a" onclick="_selectAjaxTableAllData(this,'9c02534e4ccd4851a2429adf56c6020a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_STATUS" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_ITEM_CODE" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#WOD_URGENT_FLAG" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#WOD_STATUS" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_PLAN_NUM" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_OUT_NUM" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_PACK_NUM" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_PROCESS_FACE" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_PRO_FACE" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#WOD_DISPATCH_SN" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_WH_CODE" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_ITEM_NAME" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_ITEM_SPEC" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#WOD_CUST_CODE" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_DELIVERY_DATE" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T4#NAME" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#WOD_CREATE_TIME" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_DOC_NUM" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T9#WDO_DISPATCH_NAME" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WOI_EXCEED_NUM" formId="9c02534e4ccd4851a2429adf56c6020a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9c02534e4ccd4851a2429adf56c6020a" onscroll="ajaxTableScroll(this,'9c02534e4ccd4851a2429adf56c6020a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9c02534e4ccd4851a2429adf56c6020a">
		<tbody id="tbody_9c02534e4ccd4851a2429adf56c6020a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9c02534e4ccd4851a2429adf56c6020a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9c02534e4ccd4851a2429adf56c6020a&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="72b82cd5bcc840099afc6a731f49f101" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="72b82cd5bcc840099afc6a731f49f101" />
    
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
    if(formId=='9c02534e4ccd4851a2429adf56c6020a'){<%--委外发料信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WOI_STATUS')+"' style='"+ms.tdStyle(formId, 'WOI_STATUS')+"' "+ms.tdEvent(formId, 'WOI_STATUS')+">")
            arrHtml.push("<span colno='WOI_STATUS' class='"+ms.uiClass(formId, 'WOI_STATUS')+"' style='"+ms.uiStyle(formId, 'WOI_STATUS')+"' "+ms.uiEvent(formId, 'WOI_STATUS')+" title='"+ms.titleAttr(formId,'WOI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WOI_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WOI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WOI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WOI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WOI_ITEM_CODE' class='"+ms.uiClass(formId, 'WOI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WOI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WOI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WOI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WOD_URGENT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_URGENT_FLAG')+"' style='"+ms.tdStyle(formId, 'T2#WOD_URGENT_FLAG')+"' "+ms.tdEvent(formId, 'T2#WOD_URGENT_FLAG')+">")
            arrHtml.push("<span colno='T2#WOD_URGENT_FLAG' class='"+ms.uiClass(formId, 'T2#WOD_URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'T2#WOD_URGENT_FLAG')+"' "+ms.uiEvent(formId, 'T2#WOD_URGENT_FLAG')+" title='"+ms.titleAttr(formId,'T2#WOD_URGENT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['T2#WOD_URGENT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WOD_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_STATUS')+"' style='"+ms.tdStyle(formId, 'T2#WOD_STATUS')+"' "+ms.tdEvent(formId, 'T2#WOD_STATUS')+">")
            arrHtml.push("<span colno='T2#WOD_STATUS' class='"+ms.uiClass(formId, 'T2#WOD_STATUS')+"' style='"+ms.uiStyle(formId, 'T2#WOD_STATUS')+"' "+ms.uiEvent(formId, 'T2#WOD_STATUS')+" title='"+ms.titleAttr(formId,'T2#WOD_STATUS','IS_TITLE_ATTR',v)+"' >"+v['T2#WOD_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_PLAN_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_PLAN_NUM')+"' style='"+ms.tdStyle(formId, 'WOI_PLAN_NUM')+"' "+ms.tdEvent(formId, 'WOI_PLAN_NUM')+">")
            arrHtml.push("<span colno='WOI_PLAN_NUM' class='"+ms.uiClass(formId, 'WOI_PLAN_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_PLAN_NUM')+"' "+ms.uiEvent(formId, 'WOI_PLAN_NUM')+" title='"+ms.titleAttr(formId,'WOI_PLAN_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOI_PLAN_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_OUT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_OUT_NUM')+"' style='"+ms.tdStyle(formId, 'WOI_OUT_NUM')+"' "+ms.tdEvent(formId, 'WOI_OUT_NUM')+">")
            arrHtml.push("<span colno='WOI_OUT_NUM' class='"+ms.uiClass(formId, 'WOI_OUT_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_OUT_NUM')+"' "+ms.uiEvent(formId, 'WOI_OUT_NUM')+" title='"+ms.titleAttr(formId,'WOI_OUT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOI_OUT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_PACK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_PACK_NUM')+"' style='"+ms.tdStyle(formId, 'WOI_PACK_NUM')+"' "+ms.tdEvent(formId, 'WOI_PACK_NUM')+">")
            arrHtml.push("<span colno='WOI_PACK_NUM' class='"+ms.uiClass(formId, 'WOI_PACK_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_PACK_NUM')+"' "+ms.uiEvent(formId, 'WOI_PACK_NUM')+" title='"+ms.titleAttr(formId,'WOI_PACK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOI_PACK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WOI_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'WOI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WOI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WOI_PROCESS_FACE' class='"+ms.uiClass(formId, 'WOI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WOI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WOI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WOI_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WOI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_PRO_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WOI_PRO_FACE')+"' style='"+ms.tdStyle(formId, 'WOI_PRO_FACE')+"' "+ms.tdEvent(formId, 'WOI_PRO_FACE')+">")
            arrHtml.push("<span colno='WOI_PRO_FACE' class='"+ms.uiClass(formId, 'WOI_PRO_FACE')+"' style='"+ms.uiStyle(formId, 'WOI_PRO_FACE')+"' "+ms.uiEvent(formId, 'WOI_PRO_FACE')+" title='"+ms.titleAttr(formId,'WOI_PRO_FACE','IS_TITLE_ATTR',v)+"' >"+v['WOI_PRO_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WOD_DISPATCH_SN' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_DISPATCH_SN')+"' style='"+ms.tdStyle(formId, 'T2#WOD_DISPATCH_SN')+"' "+ms.tdEvent(formId, 'T2#WOD_DISPATCH_SN')+">")
            arrHtml.push("<span colno='T2#WOD_DISPATCH_SN' class='"+ms.uiClass(formId, 'T2#WOD_DISPATCH_SN')+"' style='"+ms.uiStyle(formId, 'T2#WOD_DISPATCH_SN')+"' "+ms.uiEvent(formId, 'T2#WOD_DISPATCH_SN')+" title='"+ms.titleAttr(formId,'T2#WOD_DISPATCH_SN','IS_TITLE_ATTR',v)+"' >"+v['T2#WOD_DISPATCH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WOI_WH_CODE')+"' style='"+ms.tdStyle(formId, 'WOI_WH_CODE')+"' "+ms.tdEvent(formId, 'WOI_WH_CODE')+">")
            arrHtml.push("<span colno='WOI_WH_CODE' class='"+ms.uiClass(formId, 'WOI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WOI_WH_CODE')+"' "+ms.uiEvent(formId, 'WOI_WH_CODE')+" title='"+ms.titleAttr(formId,'WOI_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WOI_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WOI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'WOI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WOI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WOI_ITEM_NAME' class='"+ms.uiClass(formId, 'WOI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WOI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WOI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WOI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WOI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'WOI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WOI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WOI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WOI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WOI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WOI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WOI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WOD_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_CUST_CODE')+"' style='"+ms.tdStyle(formId, 'T2#WOD_CUST_CODE')+"' "+ms.tdEvent(formId, 'T2#WOD_CUST_CODE')+">")
            arrHtml.push("<span colno='T2#WOD_CUST_CODE' class='"+ms.uiClass(formId, 'T2#WOD_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'T2#WOD_CUST_CODE')+"' "+ms.uiEvent(formId, 'T2#WOD_CUST_CODE')+" title='"+ms.titleAttr(formId,'T2#WOD_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['T2#WOD_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_DELIVERY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WOI_DELIVERY_DATE')+"' style='"+ms.tdStyle(formId, 'WOI_DELIVERY_DATE')+"' "+ms.tdEvent(formId, 'WOI_DELIVERY_DATE')+">")
            arrHtml.push("<span colno='WOI_DELIVERY_DATE' class='"+ms.uiClass(formId, 'WOI_DELIVERY_DATE')+"' style='"+ms.uiStyle(formId, 'WOI_DELIVERY_DATE')+"' "+ms.uiEvent(formId, 'WOI_DELIVERY_DATE')+" title='"+ms.titleAttr(formId,'WOI_DELIVERY_DATE','IS_TITLE_ATTR',v)+"' >"+v['WOI_DELIVERY_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T4#NAME')+"' style='"+ms.tdStyle(formId, 'T4#NAME')+"' "+ms.tdEvent(formId, 'T4#NAME')+">")
            arrHtml.push("<span colno='T4#NAME' class='"+ms.uiClass(formId, 'T4#NAME')+"' style='"+ms.uiStyle(formId, 'T4#NAME')+"' "+ms.uiEvent(formId, 'T4#NAME')+" title='"+ms.titleAttr(formId,'T4#NAME','IS_TITLE_ATTR',v)+"' >"+v['T4#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#WOD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'T2#WOD_CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'T2#WOD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'T2#WOD_CREATE_TIME')+">")
            arrHtml.push("<span colno='T2#WOD_CREATE_TIME' class='"+ms.uiClass(formId, 'T2#WOD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'T2#WOD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'T2#WOD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'T2#WOD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['T2#WOD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WOI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WOI_DOC_NUM')+">")
            arrHtml.push("<span colno='WOI_DOC_NUM' class='"+ms.uiClass(formId, 'WOI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WOI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WOI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T9#WDO_DISPATCH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T9#WDO_DISPATCH_NAME')+"' style='"+ms.tdStyle(formId, 'T9#WDO_DISPATCH_NAME')+"' "+ms.tdEvent(formId, 'T9#WDO_DISPATCH_NAME')+">")
            arrHtml.push("<span colno='T9#WDO_DISPATCH_NAME' class='"+ms.uiClass(formId, 'T9#WDO_DISPATCH_NAME')+"' style='"+ms.uiStyle(formId, 'T9#WDO_DISPATCH_NAME')+"' "+ms.uiEvent(formId, 'T9#WDO_DISPATCH_NAME')+" title='"+ms.titleAttr(formId,'T9#WDO_DISPATCH_NAME','IS_TITLE_ATTR',v)+"' >"+v['T9#WDO_DISPATCH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_EXCEED_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_EXCEED_NUM')+"' style='"+ms.tdStyle(formId, 'WOI_EXCEED_NUM')+"' "+ms.tdEvent(formId, 'WOI_EXCEED_NUM')+">")
            arrHtml.push("<span colno='WOI_EXCEED_NUM' class='"+ms.uiClass(formId, 'WOI_EXCEED_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_EXCEED_NUM')+"' "+ms.uiEvent(formId, 'WOI_EXCEED_NUM')+" title='"+ms.titleAttr(formId,'WOI_EXCEED_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOI_EXCEED_NUM']+"</span>")
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
    setScroll(formId);
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
