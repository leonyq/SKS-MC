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
		<dict:lang value="ts" />
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
		<bu:header formId ="2c453cec84254fc68c340bce60d21439"/>

    
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
		<bu:func viewId="788e3919e8814ad4b9e3f657505961da" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="788e3919e8814ad4b9e3f657505961da" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage2c453cec84254fc68c340bce60d21439" id="formPage2c453cec84254fc68c340bce60d21439" value="${formPage2c453cec84254fc68c340bce60d21439}"/>
		<input type="hidden" name="formId" id="formId1" value='2c453cec84254fc68c340bce60d21439'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="2c453cec84254fc68c340bce60d21439">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2c453cec84254fc68c340bce60d21439" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner2c453cec84254fc68c340bce60d21439">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2c453cec84254fc68c340bce60d21439">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="2c453cec84254fc68c340bce60d21439" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_2c453cec84254fc68c340bce60d21439" onclick="_selectAjaxTableAllData(this,'2c453cec84254fc68c340bce60d21439')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_WRI_DOC_NUM" class="datagrid-cell"><bu:uitn colNo="WRI_DOC_NUM" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_ITEM_SEQ" class="datagrid-cell"><bu:uitn colNo="WRI_ITEM_SEQ" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_ITEM_CODE" class="datagrid-cell"><bu:uitn colNo="WRI_ITEM_CODE" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_PACK_NUM" class="datagrid-cell"><bu:uitn colNo="WRI_PACK_NUM" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_PLAN_NUM" class="datagrid-cell"><bu:uitn colNo="WRI_PLAN_NUM" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_RECEIVE_NUM" class="datagrid-cell"><bu:uitn colNo="WRI_RECEIVE_NUM" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_GIFT_NUM" class="datagrid-cell"><bu:uitn colNo="WRI_GIFT_NUM" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_DELIVERY_DATE" class="datagrid-cell"><bu:uitn colNo="WRI_DELIVERY_DATE" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_CONNECT_DOC" class="datagrid-cell"><bu:uitn colNo="WRI_CONNECT_DOC" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_WH_CODE" class="datagrid-cell"><bu:uitn colNo="WRI_WH_CODE" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_VMI_FLAG" class="datagrid-cell"><bu:uitn colNo="WRI_VMI_FLAG" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_MEMO" class="datagrid-cell"><bu:uitn colNo="WRI_MEMO" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_LOT_NO" class="datagrid-cell"><bu:uitn colNo="WRI_LOT_NO" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_PRODUCE_DATE" class="datagrid-cell"><bu:uitn colNo="WRI_PRODUCE_DATE" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_STATUS" class="datagrid-cell"><bu:uitn colNo="WRI_STATUS" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRI_IS_ADD" class="datagrid-cell"><bu:uitn colNo="WRI_IS_ADD" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRD_ERP_FLAG" class="datagrid-cell"><bu:uitn colNo="WRD_ERP_FLAG" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRD_URGENT_FLAG" class="datagrid-cell"><bu:uitn colNo="WRD_URGENT_FLAG" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WDT_TYPE_NAME" class="datagrid-cell"><bu:uitn colNo="WDT_TYPE_NAME" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WDO_DISPATCH_NAME" class="datagrid-cell"><bu:uitn colNo="WDO_DISPATCH_NAME" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_SUPPLIER_NAME" class="datagrid-cell"><bu:uitn colNo="SUPPLIER_NAME" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_USERNAME" class="datagrid-cell"><bu:uitn colNo="USERNAME" formId="2c453cec84254fc68c340bce60d21439" /></td>
			<td name="noprintset_WRD_CREATE_TIME" class="datagrid-cell"><bu:uitn colNo="WRD_CREATE_TIME" formId="2c453cec84254fc68c340bce60d21439" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv2c453cec84254fc68c340bce60d21439" onscroll="ajaxTableScroll(this,'2c453cec84254fc68c340bce60d21439')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2c453cec84254fc68c340bce60d21439">
		<tbody id="tbody_2c453cec84254fc68c340bce60d21439" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage2c453cec84254fc68c340bce60d21439==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=2c453cec84254fc68c340bce60d21439&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('2c453cec84254fc68c340bce60d21439','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?WRI_DOC_NUM</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_DOC_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_DOC_NUM" value="" title_name="?WRI_DOC_NUM" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_ITEM_SEQ</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_ITEM_SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_ITEM_SEQ" value="" title_name="?WRI_ITEM_SEQ" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_ITEM_CODE</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_ITEM_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_ITEM_CODE" value="" title_name="?WRI_ITEM_CODE" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_PACK_NUM</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_PACK_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_PACK_NUM" value="" title_name="?WRI_PACK_NUM" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_PLAN_NUM</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_PLAN_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_PLAN_NUM" value="" title_name="?WRI_PLAN_NUM" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_RECEIVE_NUM</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_RECEIVE_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_RECEIVE_NUM" value="" title_name="?WRI_RECEIVE_NUM" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_GIFT_NUM</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_GIFT_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_GIFT_NUM" value="" title_name="?WRI_GIFT_NUM" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_DELIVERY_DATE</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_DELIVERY_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_DELIVERY_DATE" value="" title_name="?WRI_DELIVERY_DATE" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_CONNECT_DOC</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_CONNECT_DOC" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_CONNECT_DOC" value="" title_name="?WRI_CONNECT_DOC" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_WH_CODE</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_WH_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_WH_CODE" value="" title_name="?WRI_WH_CODE" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_VMI_FLAG</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_VMI_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_VMI_FLAG" value="" title_name="?WRI_VMI_FLAG" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_MEMO</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_MEMO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_MEMO" value="" title_name="?WRI_MEMO" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_LOT_NO</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_LOT_NO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_LOT_NO" value="" title_name="?WRI_LOT_NO" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_PRODUCE_DATE</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_PRODUCE_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_PRODUCE_DATE" value="" title_name="?WRI_PRODUCE_DATE" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_STATUS</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_STATUS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_STATUS" value="" title_name="?WRI_STATUS" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRI_IS_ADD</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRI_IS_ADD" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRI_IS_ADD" value="" title_name="?WRI_IS_ADD" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRD_ERP_FLAG</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRD_ERP_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRD_ERP_FLAG" value="" title_name="?WRD_ERP_FLAG" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRD_URGENT_FLAG</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRD_URGENT_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRD_URGENT_FLAG" value="" title_name="?WRD_URGENT_FLAG" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WDT_TYPE_NAME</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WDT_TYPE_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WDT_TYPE_NAME" value="" title_name="?WDT_TYPE_NAME" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WDO_DISPATCH_NAME</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WDO_DISPATCH_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WDO_DISPATCH_NAME" value="" title_name="?WDO_DISPATCH_NAME" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?SUPPLIER_NAME</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SUPPLIER_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SUPPLIER_NAME" value="" title_name="?SUPPLIER_NAME" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?USERNAME</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="USERNAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="USERNAME" value="" title_name="?USERNAME" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WRD_CREATE_TIME</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WRD_CREATE_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WRD_CREATE_TIME" value="" title_name="?WRD_CREATE_TIME" />px
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
		<bu:submit viewId="788e3919e8814ad4b9e3f657505961da" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="788e3919e8814ad4b9e3f657505961da" />
    
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
    if(formId=='2c453cec84254fc68c340bce60d21439'){<%--FM-其他入库表单测试--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_DOC_NUM' name='noprintset_WRI_DOC_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WRI_DOC_NUM')+">")
            arrHtml.push("<span colno='WRI_DOC_NUM' class='"+ms.uiClass(formId, 'WRI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WRI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WRI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_ITEM_SEQ' name='noprintset_WRI_ITEM_SEQ' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_ITEM_SEQ')+"' style='"+ms.tdStyle(formId, 'WRI_ITEM_SEQ')+"' "+ms.tdEvent(formId, 'WRI_ITEM_SEQ')+">")
            arrHtml.push("<span colno='WRI_ITEM_SEQ' class='"+ms.uiClass(formId, 'WRI_ITEM_SEQ')+"' style='"+ms.uiStyle(formId, 'WRI_ITEM_SEQ')+"' "+ms.uiEvent(formId, 'WRI_ITEM_SEQ')+" title='"+ms.titleAttr(formId,'WRI_ITEM_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WRI_ITEM_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_ITEM_CODE' name='noprintset_WRI_ITEM_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WRI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WRI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WRI_ITEM_CODE' class='"+ms.uiClass(formId, 'WRI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WRI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WRI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WRI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_PACK_NUM' name='noprintset_WRI_PACK_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_PACK_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_PACK_NUM')+"' "+ms.tdEvent(formId, 'WRI_PACK_NUM')+">")
            arrHtml.push("<span colno='WRI_PACK_NUM' class='"+ms.uiClass(formId, 'WRI_PACK_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_PACK_NUM')+"' "+ms.uiEvent(formId, 'WRI_PACK_NUM')+" title='"+ms.titleAttr(formId,'WRI_PACK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_PACK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_PLAN_NUM' name='noprintset_WRI_PLAN_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_PLAN_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_PLAN_NUM')+"' "+ms.tdEvent(formId, 'WRI_PLAN_NUM')+">")
            arrHtml.push("<span colno='WRI_PLAN_NUM' class='"+ms.uiClass(formId, 'WRI_PLAN_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_PLAN_NUM')+"' "+ms.uiEvent(formId, 'WRI_PLAN_NUM')+" title='"+ms.titleAttr(formId,'WRI_PLAN_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_PLAN_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_RECEIVE_NUM' name='noprintset_WRI_RECEIVE_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_RECEIVE_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_RECEIVE_NUM')+"' "+ms.tdEvent(formId, 'WRI_RECEIVE_NUM')+">")
            arrHtml.push("<span colno='WRI_RECEIVE_NUM' class='"+ms.uiClass(formId, 'WRI_RECEIVE_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_RECEIVE_NUM')+"' "+ms.uiEvent(formId, 'WRI_RECEIVE_NUM')+" title='"+ms.titleAttr(formId,'WRI_RECEIVE_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_RECEIVE_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_GIFT_NUM' name='noprintset_WRI_GIFT_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_GIFT_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_GIFT_NUM')+"' "+ms.tdEvent(formId, 'WRI_GIFT_NUM')+">")
            arrHtml.push("<span colno='WRI_GIFT_NUM' class='"+ms.uiClass(formId, 'WRI_GIFT_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_GIFT_NUM')+"' "+ms.uiEvent(formId, 'WRI_GIFT_NUM')+" title='"+ms.titleAttr(formId,'WRI_GIFT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_GIFT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_DELIVERY_DATE' name='noprintset_WRI_DELIVERY_DATE' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_DELIVERY_DATE')+"' style='"+ms.tdStyle(formId, 'WRI_DELIVERY_DATE')+"' "+ms.tdEvent(formId, 'WRI_DELIVERY_DATE')+">")
            arrHtml.push("<span colno='WRI_DELIVERY_DATE' class='"+ms.uiClass(formId, 'WRI_DELIVERY_DATE')+"' style='"+ms.uiStyle(formId, 'WRI_DELIVERY_DATE')+"' "+ms.uiEvent(formId, 'WRI_DELIVERY_DATE')+" title='"+ms.titleAttr(formId,'WRI_DELIVERY_DATE','IS_TITLE_ATTR',v)+"' >"+v['WRI_DELIVERY_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_CONNECT_DOC' name='noprintset_WRI_CONNECT_DOC' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_CONNECT_DOC')+"' style='"+ms.tdStyle(formId, 'WRI_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'WRI_CONNECT_DOC')+">")
            arrHtml.push("<span colno='WRI_CONNECT_DOC' class='"+ms.uiClass(formId, 'WRI_CONNECT_DOC')+"' style='"+ms.uiStyle(formId, 'WRI_CONNECT_DOC')+"' "+ms.uiEvent(formId, 'WRI_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'WRI_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['WRI_CONNECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_WH_CODE' name='noprintset_WRI_WH_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_WH_CODE')+"' style='"+ms.tdStyle(formId, 'WRI_WH_CODE')+"' "+ms.tdEvent(formId, 'WRI_WH_CODE')+">")
            arrHtml.push("<span colno='WRI_WH_CODE' class='"+ms.uiClass(formId, 'WRI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WRI_WH_CODE')+"' "+ms.uiEvent(formId, 'WRI_WH_CODE')+" title='"+ms.titleAttr(formId,'WRI_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRI_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_VMI_FLAG' name='noprintset_WRI_VMI_FLAG' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_VMI_FLAG')+"' style='"+ms.tdStyle(formId, 'WRI_VMI_FLAG')+"' "+ms.tdEvent(formId, 'WRI_VMI_FLAG')+">")
            arrHtml.push("<span colno='WRI_VMI_FLAG' class='"+ms.uiClass(formId, 'WRI_VMI_FLAG')+"' style='"+ms.uiStyle(formId, 'WRI_VMI_FLAG')+"' "+ms.uiEvent(formId, 'WRI_VMI_FLAG')+" title='"+ms.titleAttr(formId,'WRI_VMI_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WRI_VMI_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_MEMO' name='noprintset_WRI_MEMO' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_MEMO')+"' style='"+ms.tdStyle(formId, 'WRI_MEMO')+"' "+ms.tdEvent(formId, 'WRI_MEMO')+">")
            arrHtml.push("<span colno='WRI_MEMO' class='"+ms.uiClass(formId, 'WRI_MEMO')+"' style='"+ms.uiStyle(formId, 'WRI_MEMO')+"' "+ms.uiEvent(formId, 'WRI_MEMO')+" title='"+ms.titleAttr(formId,'WRI_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WRI_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_LOT_NO' name='noprintset_WRI_LOT_NO' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_LOT_NO')+"' style='"+ms.tdStyle(formId, 'WRI_LOT_NO')+"' "+ms.tdEvent(formId, 'WRI_LOT_NO')+">")
            arrHtml.push("<span colno='WRI_LOT_NO' class='"+ms.uiClass(formId, 'WRI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WRI_LOT_NO')+"' "+ms.uiEvent(formId, 'WRI_LOT_NO')+" title='"+ms.titleAttr(formId,'WRI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WRI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_PRODUCE_DATE' name='noprintset_WRI_PRODUCE_DATE' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_PRODUCE_DATE')+"' style='"+ms.tdStyle(formId, 'WRI_PRODUCE_DATE')+"' "+ms.tdEvent(formId, 'WRI_PRODUCE_DATE')+">")
            arrHtml.push("<span colno='WRI_PRODUCE_DATE' class='"+ms.uiClass(formId, 'WRI_PRODUCE_DATE')+"' style='"+ms.uiStyle(formId, 'WRI_PRODUCE_DATE')+"' "+ms.uiEvent(formId, 'WRI_PRODUCE_DATE')+" title='"+ms.titleAttr(formId,'WRI_PRODUCE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WRI_PRODUCE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_STATUS' name='noprintset_WRI_STATUS' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_STATUS')+"' style='"+ms.tdStyle(formId, 'WRI_STATUS')+"' "+ms.tdEvent(formId, 'WRI_STATUS')+">")
            arrHtml.push("<span colno='WRI_STATUS' class='"+ms.uiClass(formId, 'WRI_STATUS')+"' style='"+ms.uiStyle(formId, 'WRI_STATUS')+"' "+ms.uiEvent(formId, 'WRI_STATUS')+" title='"+ms.titleAttr(formId,'WRI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WRI_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_IS_ADD' name='noprintset_WRI_IS_ADD' class='datagrid-cell  "+ms.tdClass(formId, 'WRI_IS_ADD')+"' style='"+ms.tdStyle(formId, 'WRI_IS_ADD')+"' "+ms.tdEvent(formId, 'WRI_IS_ADD')+">")
            arrHtml.push("<span colno='WRI_IS_ADD' class='"+ms.uiClass(formId, 'WRI_IS_ADD')+"' style='"+ms.uiStyle(formId, 'WRI_IS_ADD')+"' "+ms.uiEvent(formId, 'WRI_IS_ADD')+" title='"+ms.titleAttr(formId,'WRI_IS_ADD','IS_TITLE_ATTR',v)+"' >"+v['WRI_IS_ADD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ERP_FLAG' name='noprintset_WRD_ERP_FLAG' class='datagrid-cell  "+ms.tdClass(formId, 'WRD_ERP_FLAG')+"' style='"+ms.tdStyle(formId, 'WRD_ERP_FLAG')+"' "+ms.tdEvent(formId, 'WRD_ERP_FLAG')+">")
            arrHtml.push("<span colno='WRD_ERP_FLAG' class='"+ms.uiClass(formId, 'WRD_ERP_FLAG')+"' style='"+ms.uiStyle(formId, 'WRD_ERP_FLAG')+"' "+ms.uiEvent(formId, 'WRD_ERP_FLAG')+" title='"+ms.titleAttr(formId,'WRD_ERP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WRD_ERP_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_URGENT_FLAG' name='noprintset_WRD_URGENT_FLAG' class='datagrid-cell  "+ms.tdClass(formId, 'WRD_URGENT_FLAG')+"' style='"+ms.tdStyle(formId, 'WRD_URGENT_FLAG')+"' "+ms.tdEvent(formId, 'WRD_URGENT_FLAG')+">")
            arrHtml.push("<span colno='WRD_URGENT_FLAG' class='"+ms.uiClass(formId, 'WRD_URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'WRD_URGENT_FLAG')+"' "+ms.uiEvent(formId, 'WRD_URGENT_FLAG')+" title='"+ms.titleAttr(formId,'WRD_URGENT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WRD_URGENT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_TYPE_NAME' name='noprintset_WDT_TYPE_NAME' class='datagrid-cell  "+ms.tdClass(formId, 'WDT_TYPE_NAME')+"' style='"+ms.tdStyle(formId, 'WDT_TYPE_NAME')+"' "+ms.tdEvent(formId, 'WDT_TYPE_NAME')+">")
            arrHtml.push("<span colno='WDT_TYPE_NAME' class='"+ms.uiClass(formId, 'WDT_TYPE_NAME')+"' style='"+ms.uiStyle(formId, 'WDT_TYPE_NAME')+"' "+ms.uiEvent(formId, 'WDT_TYPE_NAME')+" title='"+ms.titleAttr(formId,'WDT_TYPE_NAME','IS_TITLE_ATTR',v)+"' >"+v['WDT_TYPE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDO_DISPATCH_NAME' name='noprintset_WDO_DISPATCH_NAME' class='datagrid-cell  "+ms.tdClass(formId, 'WDO_DISPATCH_NAME')+"' style='"+ms.tdStyle(formId, 'WDO_DISPATCH_NAME')+"' "+ms.tdEvent(formId, 'WDO_DISPATCH_NAME')+">")
            arrHtml.push("<span colno='WDO_DISPATCH_NAME' class='"+ms.uiClass(formId, 'WDO_DISPATCH_NAME')+"' style='"+ms.uiStyle(formId, 'WDO_DISPATCH_NAME')+"' "+ms.uiEvent(formId, 'WDO_DISPATCH_NAME')+" title='"+ms.titleAttr(formId,'WDO_DISPATCH_NAME','IS_TITLE_ATTR',v)+"' >"+v['WDO_DISPATCH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SUPPLIER_NAME' name='noprintset_SUPPLIER_NAME' class='datagrid-cell  "+ms.tdClass(formId, 'SUPPLIER_NAME')+"' style='"+ms.tdStyle(formId, 'SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'SUPPLIER_NAME')+">")
            arrHtml.push("<span colno='SUPPLIER_NAME' class='"+ms.uiClass(formId, 'SUPPLIER_NAME')+"' style='"+ms.uiStyle(formId, 'SUPPLIER_NAME')+"' "+ms.uiEvent(formId, 'SUPPLIER_NAME')+" title='"+ms.titleAttr(formId,'SUPPLIER_NAME','IS_TITLE_ATTR',v)+"' >"+v['SUPPLIER_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='USERNAME' name='noprintset_USERNAME' class='datagrid-cell  "+ms.tdClass(formId, 'USERNAME')+"' style='"+ms.tdStyle(formId, 'USERNAME')+"' "+ms.tdEvent(formId, 'USERNAME')+">")
            arrHtml.push("<span colno='USERNAME' class='"+ms.uiClass(formId, 'USERNAME')+"' style='"+ms.uiStyle(formId, 'USERNAME')+"' "+ms.uiEvent(formId, 'USERNAME')+" title='"+ms.titleAttr(formId,'USERNAME','IS_TITLE_ATTR',v)+"' >"+v['USERNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_CREATE_TIME' name='noprintset_WRD_CREATE_TIME' class='datagrid-cell  "+ms.tdClass(formId, 'WRD_CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'WRD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'WRD_CREATE_TIME')+">")
            arrHtml.push("<span colno='WRD_CREATE_TIME' class='"+ms.uiClass(formId, 'WRD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'WRD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'WRD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'WRD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WRD_CREATE_TIME']+"</span>")
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
    if(formId=='2c453cec84254fc68c340bce60d21439'){<%--FM-其他入库表单测试--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='WRI_DOC_NUM' name='noprintset_WRI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WRI_DOC_NUM')+">")
            arrHtml.push("<span colno='WRI_DOC_NUM' class='"+ms.uiClass(formId, 'WRI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WRI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WRI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_ITEM_SEQ' name='noprintset_WRI_ITEM_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WRI_ITEM_SEQ')+"' style='"+ms.tdStyle(formId, 'WRI_ITEM_SEQ')+"' "+ms.tdEvent(formId, 'WRI_ITEM_SEQ')+">")
            arrHtml.push("<span colno='WRI_ITEM_SEQ' class='"+ms.uiClass(formId, 'WRI_ITEM_SEQ')+"' style='"+ms.uiStyle(formId, 'WRI_ITEM_SEQ')+"' "+ms.uiEvent(formId, 'WRI_ITEM_SEQ')+" title='"+ms.titleAttr(formId,'WRI_ITEM_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WRI_ITEM_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_ITEM_CODE' name='noprintset_WRI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WRI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WRI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WRI_ITEM_CODE' class='"+ms.uiClass(formId, 'WRI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WRI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WRI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WRI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_PACK_NUM' name='noprintset_WRI_PACK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_PACK_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_PACK_NUM')+"' "+ms.tdEvent(formId, 'WRI_PACK_NUM')+">")
            arrHtml.push("<span colno='WRI_PACK_NUM' class='"+ms.uiClass(formId, 'WRI_PACK_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_PACK_NUM')+"' "+ms.uiEvent(formId, 'WRI_PACK_NUM')+" title='"+ms.titleAttr(formId,'WRI_PACK_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_PACK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_PLAN_NUM' name='noprintset_WRI_PLAN_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_PLAN_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_PLAN_NUM')+"' "+ms.tdEvent(formId, 'WRI_PLAN_NUM')+">")
            arrHtml.push("<span colno='WRI_PLAN_NUM' class='"+ms.uiClass(formId, 'WRI_PLAN_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_PLAN_NUM')+"' "+ms.uiEvent(formId, 'WRI_PLAN_NUM')+" title='"+ms.titleAttr(formId,'WRI_PLAN_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_PLAN_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_RECEIVE_NUM' name='noprintset_WRI_RECEIVE_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_RECEIVE_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_RECEIVE_NUM')+"' "+ms.tdEvent(formId, 'WRI_RECEIVE_NUM')+">")
            arrHtml.push("<span colno='WRI_RECEIVE_NUM' class='"+ms.uiClass(formId, 'WRI_RECEIVE_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_RECEIVE_NUM')+"' "+ms.uiEvent(formId, 'WRI_RECEIVE_NUM')+" title='"+ms.titleAttr(formId,'WRI_RECEIVE_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_RECEIVE_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_GIFT_NUM' name='noprintset_WRI_GIFT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRI_GIFT_NUM')+"' style='"+ms.tdStyle(formId, 'WRI_GIFT_NUM')+"' "+ms.tdEvent(formId, 'WRI_GIFT_NUM')+">")
            arrHtml.push("<span colno='WRI_GIFT_NUM' class='"+ms.uiClass(formId, 'WRI_GIFT_NUM')+"' style='"+ms.uiStyle(formId, 'WRI_GIFT_NUM')+"' "+ms.uiEvent(formId, 'WRI_GIFT_NUM')+" title='"+ms.titleAttr(formId,'WRI_GIFT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRI_GIFT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_DELIVERY_DATE' name='noprintset_WRI_DELIVERY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WRI_DELIVERY_DATE')+"' style='"+ms.tdStyle(formId, 'WRI_DELIVERY_DATE')+"' "+ms.tdEvent(formId, 'WRI_DELIVERY_DATE')+">")
            arrHtml.push("<span colno='WRI_DELIVERY_DATE' class='"+ms.uiClass(formId, 'WRI_DELIVERY_DATE')+"' style='"+ms.uiStyle(formId, 'WRI_DELIVERY_DATE')+"' "+ms.uiEvent(formId, 'WRI_DELIVERY_DATE')+" title='"+ms.titleAttr(formId,'WRI_DELIVERY_DATE','IS_TITLE_ATTR',v)+"' >"+v['WRI_DELIVERY_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_CONNECT_DOC' name='noprintset_WRI_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WRI_CONNECT_DOC')+"' style='"+ms.tdStyle(formId, 'WRI_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'WRI_CONNECT_DOC')+">")
            arrHtml.push("<span colno='WRI_CONNECT_DOC' class='"+ms.uiClass(formId, 'WRI_CONNECT_DOC')+"' style='"+ms.uiStyle(formId, 'WRI_CONNECT_DOC')+"' "+ms.uiEvent(formId, 'WRI_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'WRI_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['WRI_CONNECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_WH_CODE' name='noprintset_WRI_WH_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRI_WH_CODE')+"' style='"+ms.tdStyle(formId, 'WRI_WH_CODE')+"' "+ms.tdEvent(formId, 'WRI_WH_CODE')+">")
            arrHtml.push("<span colno='WRI_WH_CODE' class='"+ms.uiClass(formId, 'WRI_WH_CODE')+"' style='"+ms.uiStyle(formId, 'WRI_WH_CODE')+"' "+ms.uiEvent(formId, 'WRI_WH_CODE')+" title='"+ms.titleAttr(formId,'WRI_WH_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRI_WH_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_VMI_FLAG' name='noprintset_WRI_VMI_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WRI_VMI_FLAG')+"' style='"+ms.tdStyle(formId, 'WRI_VMI_FLAG')+"' "+ms.tdEvent(formId, 'WRI_VMI_FLAG')+">")
            arrHtml.push("<span colno='WRI_VMI_FLAG' class='"+ms.uiClass(formId, 'WRI_VMI_FLAG')+"' style='"+ms.uiStyle(formId, 'WRI_VMI_FLAG')+"' "+ms.uiEvent(formId, 'WRI_VMI_FLAG')+" title='"+ms.titleAttr(formId,'WRI_VMI_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WRI_VMI_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_MEMO' name='noprintset_WRI_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WRI_MEMO')+"' style='"+ms.tdStyle(formId, 'WRI_MEMO')+"' "+ms.tdEvent(formId, 'WRI_MEMO')+">")
            arrHtml.push("<span colno='WRI_MEMO' class='"+ms.uiClass(formId, 'WRI_MEMO')+"' style='"+ms.uiStyle(formId, 'WRI_MEMO')+"' "+ms.uiEvent(formId, 'WRI_MEMO')+" title='"+ms.titleAttr(formId,'WRI_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WRI_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_LOT_NO' name='noprintset_WRI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WRI_LOT_NO')+"' style='"+ms.tdStyle(formId, 'WRI_LOT_NO')+"' "+ms.tdEvent(formId, 'WRI_LOT_NO')+">")
            arrHtml.push("<span colno='WRI_LOT_NO' class='"+ms.uiClass(formId, 'WRI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WRI_LOT_NO')+"' "+ms.uiEvent(formId, 'WRI_LOT_NO')+" title='"+ms.titleAttr(formId,'WRI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WRI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_PRODUCE_DATE' name='noprintset_WRI_PRODUCE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'WRI_PRODUCE_DATE')+"' style='"+ms.tdStyle(formId, 'WRI_PRODUCE_DATE')+"' "+ms.tdEvent(formId, 'WRI_PRODUCE_DATE')+">")
            arrHtml.push("<span colno='WRI_PRODUCE_DATE' class='"+ms.uiClass(formId, 'WRI_PRODUCE_DATE')+"' style='"+ms.uiStyle(formId, 'WRI_PRODUCE_DATE')+"' "+ms.uiEvent(formId, 'WRI_PRODUCE_DATE')+" title='"+ms.titleAttr(formId,'WRI_PRODUCE_DATE','IS_TITLE_ATTR',v)+"' >"+v['WRI_PRODUCE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_STATUS' name='noprintset_WRI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'WRI_STATUS')+"' style='"+ms.tdStyle(formId, 'WRI_STATUS')+"' "+ms.tdEvent(formId, 'WRI_STATUS')+">")
            arrHtml.push("<span colno='WRI_STATUS' class='"+ms.uiClass(formId, 'WRI_STATUS')+"' style='"+ms.uiStyle(formId, 'WRI_STATUS')+"' "+ms.uiEvent(formId, 'WRI_STATUS')+" title='"+ms.titleAttr(formId,'WRI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['WRI_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRI_IS_ADD' name='noprintset_WRI_IS_ADD' class='datagrid-cell "+ms.tdClass(formId, 'WRI_IS_ADD')+"' style='"+ms.tdStyle(formId, 'WRI_IS_ADD')+"' "+ms.tdEvent(formId, 'WRI_IS_ADD')+">")
            arrHtml.push("<span colno='WRI_IS_ADD' class='"+ms.uiClass(formId, 'WRI_IS_ADD')+"' style='"+ms.uiStyle(formId, 'WRI_IS_ADD')+"' "+ms.uiEvent(formId, 'WRI_IS_ADD')+" title='"+ms.titleAttr(formId,'WRI_IS_ADD','IS_TITLE_ATTR',v)+"' >"+v['WRI_IS_ADD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ERP_FLAG' name='noprintset_WRD_ERP_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ERP_FLAG')+"' style='"+ms.tdStyle(formId, 'WRD_ERP_FLAG')+"' "+ms.tdEvent(formId, 'WRD_ERP_FLAG')+">")
            arrHtml.push("<span colno='WRD_ERP_FLAG' class='"+ms.uiClass(formId, 'WRD_ERP_FLAG')+"' style='"+ms.uiStyle(formId, 'WRD_ERP_FLAG')+"' "+ms.uiEvent(formId, 'WRD_ERP_FLAG')+" title='"+ms.titleAttr(formId,'WRD_ERP_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WRD_ERP_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_URGENT_FLAG' name='noprintset_WRD_URGENT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WRD_URGENT_FLAG')+"' style='"+ms.tdStyle(formId, 'WRD_URGENT_FLAG')+"' "+ms.tdEvent(formId, 'WRD_URGENT_FLAG')+">")
            arrHtml.push("<span colno='WRD_URGENT_FLAG' class='"+ms.uiClass(formId, 'WRD_URGENT_FLAG')+"' style='"+ms.uiStyle(formId, 'WRD_URGENT_FLAG')+"' "+ms.uiEvent(formId, 'WRD_URGENT_FLAG')+" title='"+ms.titleAttr(formId,'WRD_URGENT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WRD_URGENT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_TYPE_NAME' name='noprintset_WDT_TYPE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WDT_TYPE_NAME')+"' style='"+ms.tdStyle(formId, 'WDT_TYPE_NAME')+"' "+ms.tdEvent(formId, 'WDT_TYPE_NAME')+">")
            arrHtml.push("<span colno='WDT_TYPE_NAME' class='"+ms.uiClass(formId, 'WDT_TYPE_NAME')+"' style='"+ms.uiStyle(formId, 'WDT_TYPE_NAME')+"' "+ms.uiEvent(formId, 'WDT_TYPE_NAME')+" title='"+ms.titleAttr(formId,'WDT_TYPE_NAME','IS_TITLE_ATTR',v)+"' >"+v['WDT_TYPE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDO_DISPATCH_NAME' name='noprintset_WDO_DISPATCH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WDO_DISPATCH_NAME')+"' style='"+ms.tdStyle(formId, 'WDO_DISPATCH_NAME')+"' "+ms.tdEvent(formId, 'WDO_DISPATCH_NAME')+">")
            arrHtml.push("<span colno='WDO_DISPATCH_NAME' class='"+ms.uiClass(formId, 'WDO_DISPATCH_NAME')+"' style='"+ms.uiStyle(formId, 'WDO_DISPATCH_NAME')+"' "+ms.uiEvent(formId, 'WDO_DISPATCH_NAME')+" title='"+ms.titleAttr(formId,'WDO_DISPATCH_NAME','IS_TITLE_ATTR',v)+"' >"+v['WDO_DISPATCH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SUPPLIER_NAME' name='noprintset_SUPPLIER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'SUPPLIER_NAME')+"' style='"+ms.tdStyle(formId, 'SUPPLIER_NAME')+"' "+ms.tdEvent(formId, 'SUPPLIER_NAME')+">")
            arrHtml.push("<span colno='SUPPLIER_NAME' class='"+ms.uiClass(formId, 'SUPPLIER_NAME')+"' style='"+ms.uiStyle(formId, 'SUPPLIER_NAME')+"' "+ms.uiEvent(formId, 'SUPPLIER_NAME')+" title='"+ms.titleAttr(formId,'SUPPLIER_NAME','IS_TITLE_ATTR',v)+"' >"+v['SUPPLIER_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='USERNAME' name='noprintset_USERNAME' class='datagrid-cell "+ms.tdClass(formId, 'USERNAME')+"' style='"+ms.tdStyle(formId, 'USERNAME')+"' "+ms.tdEvent(formId, 'USERNAME')+">")
            arrHtml.push("<span colno='USERNAME' class='"+ms.uiClass(formId, 'USERNAME')+"' style='"+ms.uiStyle(formId, 'USERNAME')+"' "+ms.uiEvent(formId, 'USERNAME')+" title='"+ms.titleAttr(formId,'USERNAME','IS_TITLE_ATTR',v)+"' >"+v['USERNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_CREATE_TIME' name='noprintset_WRD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WRD_CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'WRD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'WRD_CREATE_TIME')+">")
            arrHtml.push("<span colno='WRD_CREATE_TIME' class='"+ms.uiClass(formId, 'WRD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'WRD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'WRD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'WRD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WRD_CREATE_TIME']+"</span>")
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
