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
		<dict:lang value="LEO_投料-物料对账" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="92c585de53ff4e9f879b4e4bc0c16e8f"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="cf3deea17ad5493795eb1fe3d8225b15" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="cf3deea17ad5493795eb1fe3d8225b15" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage92c585de53ff4e9f879b4e4bc0c16e8f" id="formPage92c585de53ff4e9f879b4e4bc0c16e8f" value="${formPage92c585de53ff4e9f879b4e4bc0c16e8f}"/>
		<input type="hidden" name="formId" id="formId1" value='92c585de53ff4e9f879b4e4bc0c16e8f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="92c585de53ff4e9f879b4e4bc0c16e8f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax92c585de53ff4e9f879b4e4bc0c16e8f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner92c585de53ff4e9f879b4e4bc0c16e8f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable92c585de53ff4e9f879b4e4bc0c16e8f">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="92c585de53ff4e9f879b4e4bc0c16e8f" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center;display:none;"><span><input type="checkbox" id="selectAll_92c585de53ff4e9f879b4e4bc0c16e8f" onclick="_selectAjaxTableAllData(this,'92c585de53ff4e9f879b4e4bc0c16e8f')" style="cursor: pointer;"title="全选"/></span></td>
		    <td name="noprintset_PROJECT_ID" class="datagrid-cell" style="width:60px; text-align:center;" ><bu:uitn colNo="PROJECT_ID" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
            <td name="noprintset_T3#PRODUCT_MATERIAL" class="datagrid-cell" style="width:60px; text-align:center;" ><bu:uitn colNo="T3#PRODUCT_MATERIAL" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_T3#PRODUCT_COUNT" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="T3#PRODUCT_COUNT" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
            <td name="noprintset_T2#RECEIVE_COUNT" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="T2#RECEIVE_COUNT" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
            <td name="noprintset_ITEM_CODE" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="ITEM_CODE" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_STOCK_CODE" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="STOCK_CODE" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_ITEM_NUM" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="ITEM_NUM" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_FEED_NUM" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="FEED_NUM" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_PROCESS_ORDER" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="PROCESS_ORDER" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_T3#PRODUCT_NAME" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="T3#PRODUCT_NAME" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_WORK_SPACE" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="WORK_SPACE" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_WAREHOUSE" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="WAREHOUSE" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_EDIT_USER" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="EDIT_USER" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
            <td name="noprintset_EDIT_TIME" class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="EDIT_TIME" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv92c585de53ff4e9f879b4e4bc0c16e8f" onscroll="ajaxTableScroll(this,'92c585de53ff4e9f879b4e4bc0c16e8f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax92c585de53ff4e9f879b4e4bc0c16e8f">
		<tbody id="tbody_92c585de53ff4e9f879b4e4bc0c16e8f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage92c585de53ff4e9f879b4e4bc0c16e8f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=92c585de53ff4e9f879b4e4bc0c16e8f&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('92c585de53ff4e9f879b4e4bc0c16e8f','1');">打印</button>
 </div>
 </div>
 <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
 <table id="printset_tab" class="basic-table" style="text-align: center;margin-top:10px;">
 <tr>
 <td style="width: 100px;text-align: right;">列字段</td>
 <td style="padding-left: 5px;">是否打印</td>
 <td style="padding-left: 5px;">打印列宽</td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>序号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SEQ" value="30" title_name="序号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ITEM_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ITEM_CODE" value="" title_name="物料编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>存货代码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="STOCK_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="STOCK_CODE" value="" title_name="存货代码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>理论重量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ITEM_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ITEM_NUM" value="" title_name="理论重量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>投入数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FEED_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FEED_NUM" value="" title_name="投入数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料阈值</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="THRESHOLD_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="THRESHOLD_NUM" value="" title_name="物料阈值" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>原材批次</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RAW_LOTNUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RAW_LOTNUMBER" value="" title_name="原材批次" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工艺顺序</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROCESS_ORDER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROCESS_ORDER" value="" title_name="工艺顺序" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T3#PRODUCT_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T3#PRODUCT_NAME" value="" title_name="物料名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工厂</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WORK_SPACE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WORK_SPACE" value="" title_name="工厂" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>仓库</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WAREHOUSE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WAREHOUSE" value="" title_name="仓库" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>SAP工单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_ID" value="" title_name="SAP工单" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MODEL_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MODEL_CODE" value="" title_name="机种编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>收货重量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#RECEIVE_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#RECEIVE_COUNT" value="" title_name="收货重量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>产品编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T3#PRODUCT_MATERIAL" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T3#PRODUCT_MATERIAL" value="" title_name="产品编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>计划数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T3#PRODUCT_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T3#PRODUCT_COUNT" value="" title_name="计划数量" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="cf3deea17ad5493795eb1fe3d8225b15" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="cf3deea17ad5493795eb1fe3d8225b15" />
    
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
    if(formId=='92c585de53ff4e9f879b4e4bc0c16e8f'){<%--VOID-投料明细表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center; display:none' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
      		 arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
      		arrHtml.push("<td colno='T3#PRODUCT_MATERIAL' name='noprintset_T3#PRODUCT_MATERIAL' class='datagrid-cell  "+ms.tdClass(formId, 'T3#PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'T3#PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'T3#PRODUCT_MATERIAL')+">");
            arrHtml.push("<span colno='T3#PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'T3#PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'T3#PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'T3#PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'T3#PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['T3#PRODUCT_MATERIAL']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#PRODUCT_COUNT' name='noprintset_T3#PRODUCT_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T3#PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'T3#PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'T3#PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='T3#PRODUCT_COUNT' class='"+ms.uiClass(formId, 'T3#PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'T3#PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'T3#PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'T3#PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T3#PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
      		arrHtml.push("<td colno='T2#RECEIVE_COUNT' name='noprintset_T2#RECEIVE_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T2#RECEIVE_COUNT')+"' style='"+ms.tdStyle(formId, 'T2#RECEIVE_COUNT')+"' "+ms.tdEvent(formId, 'T2#RECEIVE_COUNT')+">");
            arrHtml.push("<span colno='T2#RECEIVE_COUNT' class='"+ms.uiClass(formId, 'T2#RECEIVE_COUNT')+"' style='"+ms.uiStyle(formId, 'T2#RECEIVE_COUNT')+"' "+ms.uiEvent(formId, 'T2#RECEIVE_COUNT')+" title='"+ms.titleAttr(formId,'T2#RECEIVE_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T2#RECEIVE_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'ITEM_CODE')+"' "+ms.tdEvent(formId, 'ITEM_CODE')+">");
            arrHtml.push("<span colno='ITEM_CODE' class='"+ms.uiClass(formId, 'ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'ITEM_CODE')+"' "+ms.uiEvent(formId, 'ITEM_CODE')+" title='"+ms.titleAttr(formId,'ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='STOCK_CODE' name='noprintset_STOCK_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'STOCK_CODE')+"' style='"+ms.tdStyle(formId, 'STOCK_CODE')+"' "+ms.tdEvent(formId, 'STOCK_CODE')+">");
            arrHtml.push("<span colno='STOCK_CODE' class='"+ms.uiClass(formId, 'STOCK_CODE')+"' style='"+ms.uiStyle(formId, 'STOCK_CODE')+"' "+ms.uiEvent(formId, 'STOCK_CODE')+" title='"+ms.titleAttr(formId,'STOCK_CODE','IS_TITLE_ATTR',v)+"' >"+v['STOCK_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'ITEM_NUM')+"' "+ms.tdEvent(formId, 'ITEM_NUM')+">");
            arrHtml.push("<span colno='ITEM_NUM' class='"+ms.uiClass(formId, 'ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'ITEM_NUM')+"' "+ms.uiEvent(formId, 'ITEM_NUM')+" title='"+ms.titleAttr(formId,'ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['ITEM_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FEED_NUM' name='noprintset_FEED_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'FEED_NUM')+"' style='"+ms.tdStyle(formId, 'FEED_NUM')+"' "+ms.tdEvent(formId, 'FEED_NUM')+">");
            arrHtml.push("<span colno='FEED_NUM' class='"+ms.uiClass(formId, 'FEED_NUM')+"' style='"+ms.uiStyle(formId, 'FEED_NUM')+"' "+ms.uiEvent(formId, 'FEED_NUM')+" title='"+ms.titleAttr(formId,'FEED_NUM','IS_TITLE_ATTR',v)+"' >"+v['FEED_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROCESS_ORDER' name='noprintset_PROCESS_ORDER' class='datagrid-cell  "+ms.tdClass(formId, 'PROCESS_ORDER')+"' style='"+ms.tdStyle(formId, 'PROCESS_ORDER')+"' "+ms.tdEvent(formId, 'PROCESS_ORDER')+">");
            arrHtml.push("<span colno='PROCESS_ORDER' class='"+ms.uiClass(formId, 'PROCESS_ORDER')+"' style='"+ms.uiStyle(formId, 'PROCESS_ORDER')+"' "+ms.uiEvent(formId, 'PROCESS_ORDER')+" title='"+ms.titleAttr(formId,'PROCESS_ORDER','IS_TITLE_ATTR',v)+"' >"+v['PROCESS_ORDER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#PRODUCT_NAME' name='noprintset_T3#PRODUCT_NAME' class='datagrid-cell  "+ms.tdClass(formId, 'T3#PRODUCT_NAME')+"' style='"+ms.tdStyle(formId, 'T3#PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'T3#PRODUCT_NAME')+">");
            arrHtml.push("<span colno='T3#PRODUCT_NAME' class='"+ms.uiClass(formId, 'T3#PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'T3#PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'T3#PRODUCT_NAME')+" title='"+ms.titleAttr(formId,'T3#PRODUCT_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#PRODUCT_NAME']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_SPACE' name='noprintset_WORK_SPACE' class='datagrid-cell  "+ms.tdClass(formId, 'WORK_SPACE')+"' style='"+ms.tdStyle(formId, 'WORK_SPACE')+"' "+ms.tdEvent(formId, 'WORK_SPACE')+">");
            arrHtml.push("<span colno='WORK_SPACE' class='"+ms.uiClass(formId, 'WORK_SPACE')+"' style='"+ms.uiStyle(formId, 'WORK_SPACE')+"' "+ms.uiEvent(formId, 'WORK_SPACE')+" title='"+ms.titleAttr(formId,'WORK_SPACE','IS_TITLE_ATTR',v)+"' >"+v['WORK_SPACE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAREHOUSE' name='noprintset_WAREHOUSE' class='datagrid-cell  "+ms.tdClass(formId, 'WAREHOUSE')+"' style='"+ms.tdStyle(formId, 'WAREHOUSE')+"' "+ms.tdEvent(formId, 'WAREHOUSE')+">");
            arrHtml.push("<span colno='WAREHOUSE' class='"+ms.uiClass(formId, 'WAREHOUSE')+"' style='"+ms.uiStyle(formId, 'WAREHOUSE')+"' "+ms.uiEvent(formId, 'WAREHOUSE')+" title='"+ms.titleAttr(formId,'WAREHOUSE','IS_TITLE_ATTR',v)+"' >"+v['WAREHOUSE']+"</span>");
            arrHtml.push("</td>");
           
            arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  "+ms.tdClass(formId, 'EDIT_USER')+"' style='"+ms.tdStyle(formId, 'EDIT_USER')+"' "+ms.tdEvent(formId, 'EDIT_USER')+">");
            arrHtml.push("<span colno='EDIT_USER' class='"+ms.uiClass(formId, 'EDIT_USER')+"' style='"+ms.uiStyle(formId, 'EDIT_USER')+"' "+ms.uiEvent(formId, 'EDIT_USER')+" title='"+ms.titleAttr(formId,'EDIT_USER','IS_TITLE_ATTR',v)+"' >"+v['EDIT_USER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  "+ms.tdClass(formId, 'EDIT_TIME')+"' style='"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">");
            arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"' >"+v['EDIT_TIME']+"</span>");
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
</script><script>
<%--生成异步表格--%>
function createTableModel_print(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='92c585de53ff4e9f879b4e4bc0c16e8f'){<%--VOID-投料明细表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
           arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center; display:none' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
      		 arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
      		arrHtml.push("<td colno='T3#PRODUCT_MATERIAL' name='noprintset_T3#PRODUCT_MATERIAL' class='datagrid-cell  "+ms.tdClass(formId, 'T3#PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'T3#PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'T3#PRODUCT_MATERIAL')+">");
            arrHtml.push("<span colno='T3#PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'T3#PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'T3#PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'T3#PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'T3#PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['T3#PRODUCT_MATERIAL']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#PRODUCT_COUNT' name='noprintset_T3#PRODUCT_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T3#PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'T3#PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'T3#PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='T3#PRODUCT_COUNT' class='"+ms.uiClass(formId, 'T3#PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'T3#PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'T3#PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'T3#PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T3#PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
      		arrHtml.push("<td colno='T2#RECEIVE_COUNT' name='noprintset_T2#RECEIVE_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T2#RECEIVE_COUNT')+"' style='"+ms.tdStyle(formId, 'T2#RECEIVE_COUNT')+"' "+ms.tdEvent(formId, 'T2#RECEIVE_COUNT')+">");
            arrHtml.push("<span colno='T2#RECEIVE_COUNT' class='"+ms.uiClass(formId, 'T2#RECEIVE_COUNT')+"' style='"+ms.uiStyle(formId, 'T2#RECEIVE_COUNT')+"' "+ms.uiEvent(formId, 'T2#RECEIVE_COUNT')+" title='"+ms.titleAttr(formId,'T2#RECEIVE_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T2#RECEIVE_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'ITEM_CODE')+"' "+ms.tdEvent(formId, 'ITEM_CODE')+">");
            arrHtml.push("<span colno='ITEM_CODE' class='"+ms.uiClass(formId, 'ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'ITEM_CODE')+"' "+ms.uiEvent(formId, 'ITEM_CODE')+" title='"+ms.titleAttr(formId,'ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='STOCK_CODE' name='noprintset_STOCK_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'STOCK_CODE')+"' style='"+ms.tdStyle(formId, 'STOCK_CODE')+"' "+ms.tdEvent(formId, 'STOCK_CODE')+">");
            arrHtml.push("<span colno='STOCK_CODE' class='"+ms.uiClass(formId, 'STOCK_CODE')+"' style='"+ms.uiStyle(formId, 'STOCK_CODE')+"' "+ms.uiEvent(formId, 'STOCK_CODE')+" title='"+ms.titleAttr(formId,'STOCK_CODE','IS_TITLE_ATTR',v)+"' >"+v['STOCK_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'ITEM_NUM')+"' "+ms.tdEvent(formId, 'ITEM_NUM')+">");
            arrHtml.push("<span colno='ITEM_NUM' class='"+ms.uiClass(formId, 'ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'ITEM_NUM')+"' "+ms.uiEvent(formId, 'ITEM_NUM')+" title='"+ms.titleAttr(formId,'ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['ITEM_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FEED_NUM' name='noprintset_FEED_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'FEED_NUM')+"' style='"+ms.tdStyle(formId, 'FEED_NUM')+"' "+ms.tdEvent(formId, 'FEED_NUM')+">");
            arrHtml.push("<span colno='FEED_NUM' class='"+ms.uiClass(formId, 'FEED_NUM')+"' style='"+ms.uiStyle(formId, 'FEED_NUM')+"' "+ms.uiEvent(formId, 'FEED_NUM')+" title='"+ms.titleAttr(formId,'FEED_NUM','IS_TITLE_ATTR',v)+"' >"+v['FEED_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THRESHOLD_NUM' name='noprintset_THRESHOLD_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_NUM')+"' "+ms.tdEvent(formId, 'THRESHOLD_NUM')+">");
            arrHtml.push("<span colno='THRESHOLD_NUM' class='"+ms.uiClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_NUM')+"' "+ms.uiEvent(formId, 'THRESHOLD_NUM')+" title='"+ms.titleAttr(formId,'THRESHOLD_NUM','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RAW_LOTNUMBER' name='noprintset_RAW_LOTNUMBER' class='datagrid-cell  "+ms.tdClass(formId, 'RAW_LOTNUMBER')+"' style='"+ms.tdStyle(formId, 'RAW_LOTNUMBER')+"' "+ms.tdEvent(formId, 'RAW_LOTNUMBER')+">");
            arrHtml.push("<span colno='RAW_LOTNUMBER' class='"+ms.uiClass(formId, 'RAW_LOTNUMBER')+"' style='"+ms.uiStyle(formId, 'RAW_LOTNUMBER')+"' "+ms.uiEvent(formId, 'RAW_LOTNUMBER')+" title='"+ms.titleAttr(formId,'RAW_LOTNUMBER','IS_TITLE_ATTR',v)+"' >"+v['RAW_LOTNUMBER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROCESS_ORDER' name='noprintset_PROCESS_ORDER' class='datagrid-cell  "+ms.tdClass(formId, 'PROCESS_ORDER')+"' style='"+ms.tdStyle(formId, 'PROCESS_ORDER')+"' "+ms.tdEvent(formId, 'PROCESS_ORDER')+">");
            arrHtml.push("<span colno='PROCESS_ORDER' class='"+ms.uiClass(formId, 'PROCESS_ORDER')+"' style='"+ms.uiStyle(formId, 'PROCESS_ORDER')+"' "+ms.uiEvent(formId, 'PROCESS_ORDER')+" title='"+ms.titleAttr(formId,'PROCESS_ORDER','IS_TITLE_ATTR',v)+"' >"+v['PROCESS_ORDER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#PRODUCT_NAME' name='noprintset_T3#PRODUCT_NAME' class='datagrid-cell  "+ms.tdClass(formId, 'T3#PRODUCT_NAME')+"' style='"+ms.tdStyle(formId, 'T3#PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'T3#PRODUCT_NAME')+">");
            arrHtml.push("<span colno='T3#PRODUCT_NAME' class='"+ms.uiClass(formId, 'T3#PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'T3#PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'T3#PRODUCT_NAME')+" title='"+ms.titleAttr(formId,'T3#PRODUCT_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#PRODUCT_NAME']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_SPACE' name='noprintset_WORK_SPACE' class='datagrid-cell  "+ms.tdClass(formId, 'WORK_SPACE')+"' style='"+ms.tdStyle(formId, 'WORK_SPACE')+"' "+ms.tdEvent(formId, 'WORK_SPACE')+">");
            arrHtml.push("<span colno='WORK_SPACE' class='"+ms.uiClass(formId, 'WORK_SPACE')+"' style='"+ms.uiStyle(formId, 'WORK_SPACE')+"' "+ms.uiEvent(formId, 'WORK_SPACE')+" title='"+ms.titleAttr(formId,'WORK_SPACE','IS_TITLE_ATTR',v)+"' >"+v['WORK_SPACE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WAREHOUSE' name='noprintset_WAREHOUSE' class='datagrid-cell  "+ms.tdClass(formId, 'WAREHOUSE')+"' style='"+ms.tdStyle(formId, 'WAREHOUSE')+"' "+ms.tdEvent(formId, 'WAREHOUSE')+">");
            arrHtml.push("<span colno='WAREHOUSE' class='"+ms.uiClass(formId, 'WAREHOUSE')+"' style='"+ms.uiStyle(formId, 'WAREHOUSE')+"' "+ms.uiEvent(formId, 'WAREHOUSE')+" title='"+ms.titleAttr(formId,'WAREHOUSE','IS_TITLE_ATTR',v)+"' >"+v['WAREHOUSE']+"</span>");
            arrHtml.push("</td>");
           
            arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  "+ms.tdClass(formId, 'EDIT_USER')+"' style='"+ms.tdStyle(formId, 'EDIT_USER')+"' "+ms.tdEvent(formId, 'EDIT_USER')+">");
            arrHtml.push("<span colno='EDIT_USER' class='"+ms.uiClass(formId, 'EDIT_USER')+"' style='"+ms.uiStyle(formId, 'EDIT_USER')+"' "+ms.uiEvent(formId, 'EDIT_USER')+" title='"+ms.titleAttr(formId,'EDIT_USER','IS_TITLE_ATTR',v)+"' >"+v['EDIT_USER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  "+ms.tdClass(formId, 'EDIT_TIME')+"' style='"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">");
            arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"' >"+v['EDIT_TIME']+"</span>");
            arrHtml.push("</td>");
            
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
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
