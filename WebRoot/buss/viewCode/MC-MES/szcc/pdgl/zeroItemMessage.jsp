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
		<dict:lang value="VM-盘零物料信息" />
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
		<bu:header formId ="a0fd16f18c5f4cc4a84a7fb2856b4e78"/>

    
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
		<bu:func viewId="114ac084259c42c6ba4e8624ec9e5106" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="114ac084259c42c6ba4e8624ec9e5106" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagea0fd16f18c5f4cc4a84a7fb2856b4e78" id="formPagea0fd16f18c5f4cc4a84a7fb2856b4e78" value="${formPagea0fd16f18c5f4cc4a84a7fb2856b4e78}"/>
		<input type="hidden" name="formId" id="formId1" value='a0fd16f18c5f4cc4a84a7fb2856b4e78'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="a0fd16f18c5f4cc4a84a7fb2856b4e78">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxa0fd16f18c5f4cc4a84a7fb2856b4e78" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innera0fd16f18c5f4cc4a84a7fb2856b4e78">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablea0fd16f18c5f4cc4a84a7fb2856b4e78" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_a0fd16f18c5f4cc4a84a7fb2856b4e78" onclick="_selectAjaxTableAllData(this,'a0fd16f18c5f4cc4a84a7fb2856b4e78')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px"><bu:uitn colNo="DATA_AUTH" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:200px"><bu:uitn colNo="WIL_ITEM_SN" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="WIL_ITEM_CODE" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="WIL_DOC_NUM" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="WIL_SUP_CODE" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:150px"><bu:uitn colNo="WIL_CUST_CODE" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WIL_WH_CODE" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WIL_DISTRICT_CODE" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WIL_STORAGE_CODE" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WIL_STOCK_NUM" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WIL_INVENTORY_NUM" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WIL_PROFIT_NUM" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T2#CI_ITEM_NAME" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WIL_INVENTORY_TIME" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WIL_INVENTORY_EMP" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="WIL_MEMO" formId="a0fd16f18c5f4cc4a84a7fb2856b4e78" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiva0fd16f18c5f4cc4a84a7fb2856b4e78" onscroll="ajaxTableScroll(this,'a0fd16f18c5f4cc4a84a7fb2856b4e78')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxa0fd16f18c5f4cc4a84a7fb2856b4e78" >
		<tbody id="tbody_a0fd16f18c5f4cc4a84a7fb2856b4e78" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagea0fd16f18c5f4cc4a84a7fb2856b4e78==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=a0fd16f18c5f4cc4a84a7fb2856b4e78&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="114ac084259c42c6ba4e8624ec9e5106" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="114ac084259c42c6ba4e8624ec9e5106" />
    
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
    if(formId=='a0fd16f18c5f4cc4a84a7fb2856b4e78'){<%--FM-仓库盘零物料信息--%>
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
            arrHtml.push("<td colno='WIL_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WIL_ITEM_SN')+"' style='width:200px"+ms.tdStyle(formId, 'WIL_ITEM_SN')+"' "+ms.tdEvent(formId, 'WIL_ITEM_SN')+">")
            arrHtml.push("<span colno='WIL_ITEM_SN' class='"+ms.uiClass(formId, 'WIL_ITEM_SN')+"' onclick='itemJump1(\""+v['WIL_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WIL_ITEM_SN')+" title='"+ms.titleAttr(formId,'WIL_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WIL_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WIL_ITEM_CODE')+"' style='width:150px"+ms.tdStyle(formId, 'WIL_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WIL_ITEM_CODE')+">")
            arrHtml.push("<span colno='WIL_ITEM_CODE' class='"+ms.uiClass(formId, 'WIL_ITEM_CODE')+"' onclick='itemJump2(\""+v['WIL_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WIL_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WIL_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WIL_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WIL_DOC_NUM')+"' style='width:150px"+ms.tdStyle(formId, 'WIL_DOC_NUM')+"' "+ms.tdEvent(formId, 'WIL_DOC_NUM')+">")
            arrHtml.push("<span colno='WIL_DOC_NUM' class='"+ms.uiClass(formId, 'WIL_DOC_NUM')+"' onclick='itemJump3(\""+v['WIL_DOC_NUM']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WIL_DOC_NUM')+" title='"+ms.titleAttr(formId,'WIL_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WIL_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WIL_SUP_CODE')+"' style='width:150px"+ms.tdStyle(formId, 'WIL_SUP_CODE')+"' "+ms.tdEvent(formId, 'WIL_SUP_CODE')+">")
            arrHtml.push("<span colno='WIL_SUP_CODE' class='"+ms.uiClass(formId, 'WIL_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WIL_SUP_CODE')+"' "+ms.uiEvent(formId, 'WIL_SUP_CODE')+" title='"+ms.titleAttr(formId,'WIL_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WIL_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WIL_CUST_CODE')+"' style='width:150px"+ms.tdStyle(formId, 'WIL_CUST_CODE')+"' "+ms.tdEvent(formId, 'WIL_CUST_CODE')+">")
            arrHtml.push("<span colno='WIL_CUST_CODE' class='"+ms.uiClass(formId, 'WIL_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WIL_CUST_CODE')+"' "+ms.uiEvent(formId, 'WIL_CUST_CODE')+" title='"+ms.titleAttr(formId,'WIL_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WIL_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WIL_WH_CODE')+"' style='width:70px"+ms.tdStyle(formId, 'WIL_WH_CODE')+"' "+ms.tdEvent(formId, 'WIL_WH_CODE')+">")
            arrHtml.push("<span colno='WIL_WH_CODE' class='"+ms.uiClass(formId, 'WIL_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WIL_WH_CODE')+"' "+ms.uiEvent(formId, 'WIL_WH_CODE')+" title='"+ms.titleAttr(formId,'WIL_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WIL_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_DISTRICT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WIL_DISTRICT_CODE')+"' style='width:70px"+ms.tdStyle(formId, 'WIL_DISTRICT_CODE')+"' "+ms.tdEvent(formId, 'WIL_DISTRICT_CODE')+">")
            arrHtml.push("<span colno='WIL_DISTRICT_CODE' class='"+ms.uiClass(formId, 'WIL_DISTRICT_CODE')+"' style='"+ms.uiStyle(formId, 'WIL_DISTRICT_CODE')+"' "+ms.uiEvent(formId, 'WIL_DISTRICT_CODE')+" title='"+ms.titleAttr(formId,'WIL_DISTRICT_CODE','IS_TITLE_ATTR',v)+"' >"+v['WIL_DISTRICT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_STORAGE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WIL_STORAGE_CODE')+"' style='width:70px"+ms.tdStyle(formId, 'WIL_STORAGE_CODE')+"' "+ms.tdEvent(formId, 'WIL_STORAGE_CODE')+">")
            arrHtml.push("<span colno='WIL_STORAGE_CODE' class='"+ms.uiClass(formId, 'WIL_STORAGE_CODE')+"' style='"+ms.uiStyle(formId, 'WIL_STORAGE_CODE')+"' "+ms.uiEvent(formId, 'WIL_STORAGE_CODE')+" title='"+ms.titleAttr(formId,'WIL_STORAGE_CODE','IS_TITLE_ATTR',v)+"' >"+v['WIL_STORAGE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_STOCK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WIL_STOCK_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WIL_STOCK_NUM')+"' "+ms.tdEvent(formId, 'WIL_STOCK_NUM')+">")
            arrHtml.push("<span colno='WIL_STOCK_NUM' class='"+ms.uiClass(formId, 'WIL_STOCK_NUM')+"' style='"+ms.uiStyle(formId, 'WIL_STOCK_NUM')+"' "+ms.uiEvent(formId, 'WIL_STOCK_NUM')+" title='"+ms.titleAttr(formId,'WIL_STOCK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WIL_STOCK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_INVENTORY_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WIL_INVENTORY_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WIL_INVENTORY_NUM')+"' "+ms.tdEvent(formId, 'WIL_INVENTORY_NUM')+">")
            arrHtml.push("<span colno='WIL_INVENTORY_NUM' class='"+ms.uiClass(formId, 'WIL_INVENTORY_NUM')+"' style='"+ms.uiStyle(formId, 'WIL_INVENTORY_NUM')+"' "+ms.uiEvent(formId, 'WIL_INVENTORY_NUM')+" title='"+ms.titleAttr(formId,'WIL_INVENTORY_NUM','IS_TITLE_ATTR',v)+"' >"+v['WIL_INVENTORY_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_PROFIT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WIL_PROFIT_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WIL_PROFIT_NUM')+"' "+ms.tdEvent(formId, 'WIL_PROFIT_NUM')+">")
            arrHtml.push("<span colno='WIL_PROFIT_NUM' class='"+ms.uiClass(formId, 'WIL_PROFIT_NUM')+"' style='"+ms.uiStyle(formId, 'WIL_PROFIT_NUM')+"' "+ms.uiEvent(formId, 'WIL_PROFIT_NUM')+" title='"+ms.titleAttr(formId,'WIL_PROFIT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WIL_PROFIT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_NAME')+"' style='width:150px"+ms.tdStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_NAME' class='"+ms.uiClass(formId, 'T2#CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'T2#CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='' class='datagrid-cell "+ms.tdClass(formId, 'T2#CI_ITEM_SPEC')+"' style='width:150px"+ms.tdStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'T2#CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='T2#CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'T2#CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'T2#CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'T2#CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'T2#CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['T2#CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_INVENTORY_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WIL_INVENTORY_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WIL_INVENTORY_TIME')+"' "+ms.tdEvent(formId, 'WIL_INVENTORY_TIME')+">")
            arrHtml.push("<span colno='WIL_INVENTORY_TIME' class='"+ms.uiClass(formId, 'WIL_INVENTORY_TIME')+"' style='"+ms.uiStyle(formId, 'WIL_INVENTORY_TIME')+"' "+ms.uiEvent(formId, 'WIL_INVENTORY_TIME')+" title='"+ms.titleAttr(formId,'WIL_INVENTORY_TIME','IS_TITLE_ATTR',v)+"' >"+v['WIL_INVENTORY_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_INVENTORY_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WIL_INVENTORY_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WIL_INVENTORY_EMP')+"' "+ms.tdEvent(formId, 'WIL_INVENTORY_EMP')+">")
            arrHtml.push("<span colno='WIL_INVENTORY_EMP' class='"+ms.uiClass(formId, 'WIL_INVENTORY_EMP')+"' style='"+ms.uiStyle(formId, 'WIL_INVENTORY_EMP')+"' "+ms.uiEvent(formId, 'WIL_INVENTORY_EMP')+" title='"+ms.titleAttr(formId,'WIL_INVENTORY_EMP','IS_TITLE_ATTR',v)+"' >"+v['WIL_INVENTORY_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WIL_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WIL_MEMO')+"' style='width:130px"+ms.tdStyle(formId, 'WIL_MEMO')+"' "+ms.tdEvent(formId, 'WIL_MEMO')+">")
            arrHtml.push("<span colno='WIL_MEMO' class='"+ms.uiClass(formId, 'WIL_MEMO')+"' style='"+ms.uiStyle(formId, 'WIL_MEMO')+"' "+ms.uiEvent(formId, 'WIL_MEMO')+" title='"+ms.titleAttr(formId,'WIL_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WIL_MEMO']+"</span>")
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

//物料追溯
function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  


//物料信息
function itemJump2(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//盘点管理
function itemJump3(obj){
    winOptMethod.jump("d9d426c5b4604ce1a973aee0337d781a","F6937","jumpId",obj);
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
