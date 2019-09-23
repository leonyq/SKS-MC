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
		<dict:lang value="VM-盘点日志作业" />
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
		<bu:header formId ="f5784c7d07bc4bec819f984e32e761e7"/>

    
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
		<bu:func viewId="ef9072a6a9d74e3dbb30235c4fa3935d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="ef9072a6a9d74e3dbb30235c4fa3935d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagef5784c7d07bc4bec819f984e32e761e7" id="formPagef5784c7d07bc4bec819f984e32e761e7" value="${formPagef5784c7d07bc4bec819f984e32e761e7}"/>
		<input type="hidden" name="formId" id="formId1" value='f5784c7d07bc4bec819f984e32e761e7'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="f5784c7d07bc4bec819f984e32e761e7">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf5784c7d07bc4bec819f984e32e761e7" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerf5784c7d07bc4bec819f984e32e761e7">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef5784c7d07bc4bec819f984e32e761e7" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="f5784c7d07bc4bec819f984e32e761e7" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_f5784c7d07bc4bec819f984e32e761e7" onclick="_selectAjaxTableAllData(this,'f5784c7d07bc4bec819f984e32e761e7')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WID_ITEM_SN" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WID_ITEM_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WID_ITEM_STATUS" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WID_UPLOAD_FLAG" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WID_DOC_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WID_SUP_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WID_CUST_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WID_WH_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WID_DISTRICT_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="WID_STORAGE_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WID_STOCK_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WID_INVENTORY_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WID_PROFIT_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WID_UPLOAD_TIME" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WID_INVENTORY_TIME" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WID_INVENTORY_EMP" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WID_MEMO" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivf5784c7d07bc4bec819f984e32e761e7" onscroll="ajaxTableScroll(this,'f5784c7d07bc4bec819f984e32e761e7')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxf5784c7d07bc4bec819f984e32e761e7">
		<tbody id="tbody_f5784c7d07bc4bec819f984e32e761e7" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagef5784c7d07bc4bec819f984e32e761e7==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=f5784c7d07bc4bec819f984e32e761e7&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="ef9072a6a9d74e3dbb30235c4fa3935d" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="ef9072a6a9d74e3dbb30235c4fa3935d" />
    
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
    if(formId=='f5784c7d07bc4bec819f984e32e761e7'){<%--FM-仓库盘点单明细日志--%>
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
            arrHtml.push("<td colno='WID_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WID_ITEM_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WID_ITEM_SN')+"' "+ms.tdEvent(formId, 'WID_ITEM_SN')+">")
            arrHtml.push("<span colno='WID_ITEM_SN' class='"+ms.uiClass(formId, 'WID_ITEM_SN')+"' onclick='itemJump1(\""+v['WID_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WID_ITEM_SN')+" title='"+ms.titleAttr(formId,'WID_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WID_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WID_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WID_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WID_ITEM_CODE')+">")
            arrHtml.push("<span colno='WID_ITEM_CODE' class='"+ms.uiClass(formId, 'WID_ITEM_CODE')+"' onclick='itemJump2(\""+v['WID_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WID_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WID_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WID_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_ITEM_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WID_ITEM_STATUS')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WID_ITEM_STATUS')+"' "+ms.tdEvent(formId, 'WID_ITEM_STATUS')+">")
            arrHtml.push("<span colno='WID_ITEM_STATUS' class='"+ms.uiClass(formId, 'WID_ITEM_STATUS')+"' style='"+ms.uiStyle(formId, 'WID_ITEM_STATUS')+"' "+ms.uiEvent(formId, 'WID_ITEM_STATUS')+" title='"+ms.titleAttr(formId,'WID_ITEM_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WID_ITEM_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_UPLOAD_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WID_UPLOAD_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'WID_UPLOAD_FLAG')+"' "+ms.tdEvent(formId, 'WID_UPLOAD_FLAG')+">")
            arrHtml.push("<span colno='WID_UPLOAD_FLAG' class='"+ms.uiClass(formId, 'WID_UPLOAD_FLAG')+"' style='"+ms.uiStyle(formId, 'WID_UPLOAD_FLAG')+"' "+ms.uiEvent(formId, 'WID_UPLOAD_FLAG')+" title='"+ms.titleAttr(formId,'WID_UPLOAD_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WID_UPLOAD_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WID_DOC_NUM')+"' style='width:70px;"+ms.tdStyle(formId, 'WID_DOC_NUM')+"' "+ms.tdEvent(formId, 'WID_DOC_NUM')+">")
            arrHtml.push("<span colno='WID_DOC_NUM' class='"+ms.uiClass(formId, 'WID_DOC_NUM')+"' onclick='itemJump3(\""+v['WID_DOC_NUM']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WID_DOC_NUM')+" title='"+ms.titleAttr(formId,'WID_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WID_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WID_SUP_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WID_SUP_CODE')+"' "+ms.tdEvent(formId, 'WID_SUP_CODE')+">")
            arrHtml.push("<span colno='WID_SUP_CODE' class='"+ms.uiClass(formId, 'WID_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'WID_SUP_CODE')+"' "+ms.uiEvent(formId, 'WID_SUP_CODE')+" title='"+ms.titleAttr(formId,'WID_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['WID_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WID_CUST_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WID_CUST_CODE')+"' "+ms.tdEvent(formId, 'WID_CUST_CODE')+">")
            arrHtml.push("<span colno='WID_CUST_CODE' class='"+ms.uiClass(formId, 'WID_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'WID_CUST_CODE')+"' "+ms.uiEvent(formId, 'WID_CUST_CODE')+" title='"+ms.titleAttr(formId,'WID_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['WID_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WID_WH_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WID_WH_CODE')+"' "+ms.tdEvent(formId, 'WID_WH_CODE')+">")
            arrHtml.push("<span colno='WID_WH_CODE' class='"+ms.uiClass(formId, 'WID_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WID_WH_CODE')+"' "+ms.uiEvent(formId, 'WID_WH_CODE')+" title='"+ms.titleAttr(formId,'WID_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WID_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_DISTRICT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WID_DISTRICT_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WID_DISTRICT_CODE')+"' "+ms.tdEvent(formId, 'WID_DISTRICT_CODE')+">")
            arrHtml.push("<span colno='WID_DISTRICT_CODE' class='"+ms.uiClass(formId, 'WID_DISTRICT_CODE')+"' style='"+ms.uiStyle(formId, 'WID_DISTRICT_CODE')+"' "+ms.uiEvent(formId, 'WID_DISTRICT_CODE')+" title='"+ms.titleAttr(formId,'WID_DISTRICT_CODE','IS_TITLE_ATTR',v)+"' >"+v['WID_DISTRICT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_STORAGE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WID_STORAGE_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'WID_STORAGE_CODE')+"' "+ms.tdEvent(formId, 'WID_STORAGE_CODE')+">")
            arrHtml.push("<span colno='WID_STORAGE_CODE' class='"+ms.uiClass(formId, 'WID_STORAGE_CODE')+"' style='"+ms.uiStyle(formId, 'WID_STORAGE_CODE')+"' "+ms.uiEvent(formId, 'WID_STORAGE_CODE')+" title='"+ms.titleAttr(formId,'WID_STORAGE_CODE','IS_TITLE_ATTR',v)+"' >"+v['WID_STORAGE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_STOCK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WID_STOCK_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WID_STOCK_NUM')+"' "+ms.tdEvent(formId, 'WID_STOCK_NUM')+">")
            arrHtml.push("<span colno='WID_STOCK_NUM' class='"+ms.uiClass(formId, 'WID_STOCK_NUM')+"' style='"+ms.uiStyle(formId, 'WID_STOCK_NUM')+"' "+ms.uiEvent(formId, 'WID_STOCK_NUM')+" title='"+ms.titleAttr(formId,'WID_STOCK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WID_STOCK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_INVENTORY_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WID_INVENTORY_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WID_INVENTORY_NUM')+"' "+ms.tdEvent(formId, 'WID_INVENTORY_NUM')+">")
            arrHtml.push("<span colno='WID_INVENTORY_NUM' class='"+ms.uiClass(formId, 'WID_INVENTORY_NUM')+"' style='"+ms.uiStyle(formId, 'WID_INVENTORY_NUM')+"' "+ms.uiEvent(formId, 'WID_INVENTORY_NUM')+" title='"+ms.titleAttr(formId,'WID_INVENTORY_NUM','IS_TITLE_ATTR',v)+"' >"+v['WID_INVENTORY_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_PROFIT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WID_PROFIT_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WID_PROFIT_NUM')+"' "+ms.tdEvent(formId, 'WID_PROFIT_NUM')+">")
            arrHtml.push("<span colno='WID_PROFIT_NUM' class='"+ms.uiClass(formId, 'WID_PROFIT_NUM')+"' style='"+ms.uiStyle(formId, 'WID_PROFIT_NUM')+"' "+ms.uiEvent(formId, 'WID_PROFIT_NUM')+" title='"+ms.titleAttr(formId,'WID_PROFIT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WID_PROFIT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_UPLOAD_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WID_UPLOAD_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WID_UPLOAD_TIME')+"' "+ms.tdEvent(formId, 'WID_UPLOAD_TIME')+">")
            arrHtml.push("<span colno='WID_UPLOAD_TIME' class='"+ms.uiClass(formId, 'WID_UPLOAD_TIME')+"' style='"+ms.uiStyle(formId, 'WID_UPLOAD_TIME')+"' "+ms.uiEvent(formId, 'WID_UPLOAD_TIME')+" title='"+ms.titleAttr(formId,'WID_UPLOAD_TIME','IS_TITLE_ATTR',v)+"' >"+v['WID_UPLOAD_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_INVENTORY_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WID_INVENTORY_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WID_INVENTORY_TIME')+"' "+ms.tdEvent(formId, 'WID_INVENTORY_TIME')+">")
            arrHtml.push("<span colno='WID_INVENTORY_TIME' class='"+ms.uiClass(formId, 'WID_INVENTORY_TIME')+"' style='"+ms.uiStyle(formId, 'WID_INVENTORY_TIME')+"' "+ms.uiEvent(formId, 'WID_INVENTORY_TIME')+" title='"+ms.titleAttr(formId,'WID_INVENTORY_TIME','IS_TITLE_ATTR',v)+"' >"+v['WID_INVENTORY_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_INVENTORY_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WID_INVENTORY_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WID_INVENTORY_EMP')+"' "+ms.tdEvent(formId, 'WID_INVENTORY_EMP')+">")
            arrHtml.push("<span colno='WID_INVENTORY_EMP' class='"+ms.uiClass(formId, 'WID_INVENTORY_EMP')+"' style='"+ms.uiStyle(formId, 'WID_INVENTORY_EMP')+"' "+ms.uiEvent(formId, 'WID_INVENTORY_EMP')+" title='"+ms.titleAttr(formId,'WID_INVENTORY_EMP','IS_TITLE_ATTR',v)+"' >"+v['WID_INVENTORY_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WID_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WID_MEMO')+"' style='width:140px;"+ms.tdStyle(formId, 'WID_MEMO')+"' "+ms.tdEvent(formId, 'WID_MEMO')+">")
            arrHtml.push("<span colno='WID_MEMO' class='"+ms.uiClass(formId, 'WID_MEMO')+"' style='"+ms.uiStyle(formId, 'WID_MEMO')+"' "+ms.uiEvent(formId, 'WID_MEMO')+" title='"+ms.titleAttr(formId,'WID_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WID_MEMO']+"</span>")
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

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WID_DOC_NUM").val(jumpId);
                  
                  } 
                  if(jumpId==''){
                      $("#WID_INVENTORY_TIME_BEGIN").val(timeBeginString());
    
$("#WID_INVENTORY_TIME_END").val(timeEndString());
                  }
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
function timeBeginString(){
		var datetime = new Date();
		//datetime.setDate(datetime.getDate()-360);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth()+ 1 ;
		var date = datetime.getDate();
		if(date-7<=0){
		    date=1;
		}
		date =date < 10 ? "0" + date : date;
		return year + "-" + month + "-" + date +" 00:00:00";
}

function timeEndString(){
	var datetime = new Date();
	//datetime.setDate(datetime.getDate()+360);
	var year = datetime.getFullYear();
	var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
	
	var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
	return year + "-" + month + "-" + date +" 23:59:59";
}
</script>
<script>

$(function(){
    
	$("#WID_WH_CODE").attr("onchange","_selectCascadNew(this.value,'WID_WH_CODE','174918da0d1e42b9a4726df4020e448a','WID_WH_CODE','WID_DISTRICT_CODE');getStorageCode();");
    $("#WID_DISTRICT_CODE").attr("onchange","getStorageCode();");
    

    
})
//根据仓库或者库区获取库位
function getStorageCode(){
    util.showLoading("处理中...");
    $.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=9b045aeef1684c1b8c968cc740b7c3cd",
			    data: {
			        "whCode" : $("#WID_WH_CODE").val(),
			        "DISTRICT_CODE" : $("#WID_DISTRICT_CODE").val()
			    },
				success: function(data){	
                        util.closeLoading();
						if(null == data){return ;}
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							var tempOption = "";
							for(var i = 0;i < rccList.length; i++){
								tempOption = tempOption + "<option value='"+rccList[i].WA_AREA_SN+"'>"+rccList[i].WA_AREA_NAME+"</option>";
							}
						    $("#WID_STORAGE_CODE").chosen("destroy");
							$("#WID_STORAGE_CODE").empty();
             				$("#WID_STORAGE_CODE").append("<option value=''>--请选择--</option>");
             				$("#WID_STORAGE_CODE").append(tempOption);
             				//setChosen();
             				//$("#WSI_STORAGE_CODE").chosen("destroy");
                        	//$("#WSI_STORAGE_CODE").trigger("chosen:updated");
                        	//Chosen.destroy().init();
                        	
                        	if(rccList.length>15){
                        	$("#WID_STORAGE_CODE").chosen({search_contains: true});
                        	$("#WID_STORAGE_CODE_chosen .chosen-search").css("display","block");
                        	}else{
                        	    $("#WID_STORAGE_CODE").chosen();
                        	    $("#WID_STORAGE_CODE_chosen .chosen-search").css("display","block");
                        	}
             				//mySetChosen();
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
