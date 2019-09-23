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
		<dict:lang value="LEO-当日已质检new" />
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
		<bu:header formId ="541d3515e85544be83e239b158f30ab4"/>

    
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
		<bu:func viewId="e489d1bfa9a34597be207df1976f144d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="e489d1bfa9a34597be207df1976f144d" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage541d3515e85544be83e239b158f30ab4" id="formPage541d3515e85544be83e239b158f30ab4" value="${formPage541d3515e85544be83e239b158f30ab4}"/>
		<input type="hidden" name="formId" id="formId1" value='541d3515e85544be83e239b158f30ab4'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="541d3515e85544be83e239b158f30ab4">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax541d3515e85544be83e239b158f30ab4" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner541d3515e85544be83e239b158f30ab4">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable541d3515e85544be83e239b158f30ab4">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="541d3515e85544be83e239b158f30ab4" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_541d3515e85544be83e239b158f30ab4" onclick="_selectAjaxTableAllData(this,'541d3515e85544be83e239b158f30ab4')" style="cursor: pointer;"title="全选"/></span></td>
			<!--<td name="noprintset_DATA_AUTH" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="541d3515e85544be83e239b158f30ab4" /></td>-->
			<td name="noprintset_PROJECT_ID" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="PROJECT_ID" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_T2#PROJECT_STATUS" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="T2#PROJECT_STATUS" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_T2#LOT_NUMBER" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="T2#LOT_NUMBER" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_T2#PRODUCT_MATERIAL" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="T2#PRODUCT_MATERIAL" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_T2#PRODUCT_NAME" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="T2#PRODUCT_NAME" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_T2#PRODUCT_COUNT" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="T2#PRODUCT_COUNT" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_T2#FINISH_COUNT" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="T2#FINISH_COUNT" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_CHECK_STATUS" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CHECK_STATUS" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_QT_MON" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="QT_MON" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_CHECK_USER" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="CHECK_USER" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<td name="noprintset_EDIT_TIME" class="datagrid-cell" style="width:70px; text-align:center"><bu:uitn colNo="EDIT_TIME" formId="541d3515e85544be83e239b158f30ab4" /></td>
			<!--<td name="noprintset_DEPT_ID" class="datagrid-cell"><bu:uitn colNo="DEPT_ID" formId="541d3515e85544be83e239b158f30ab4" /></td>-->
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv541d3515e85544be83e239b158f30ab4" onscroll="ajaxTableScroll(this,'541d3515e85544be83e239b158f30ab4')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax541d3515e85544be83e239b158f30ab4">
		<tbody id="tbody_541d3515e85544be83e239b158f30ab4" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage541d3515e85544be83e239b158f30ab4==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=541d3515e85544be83e239b158f30ab4&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('541d3515e85544be83e239b158f30ab4','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>组织机构</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DATA_AUTH" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DATA_AUTH" value="" title_name="组织机构" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?SAP工单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_ID" value="" title_name="?SAP工单" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工单状态</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PROJECT_STATUS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PROJECT_STATUS" value="" title_name="工单状态" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产批号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#LOT_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#LOT_NUMBER" value="" title_name="生产批号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?产品编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PRODUCT_MATERIAL" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PRODUCT_MATERIAL" value="" title_name="?产品编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?产品名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PRODUCT_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PRODUCT_NAME" value="" title_name="?产品名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>计划数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PRODUCT_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PRODUCT_COUNT" value="" title_name="计划数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?收货数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#FINISH_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#FINISH_COUNT" value="" title_name="?收货数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?质检判定</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CHECK_STATUS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CHECK_STATUS" value="" title_name="?质检判定" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?质检备注</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="QT_MON" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="QT_MON" value="" title_name="?质检备注" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>检验员</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CHECK_USER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CHECK_USER" value="" title_name="检验员" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>修改时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="EDIT_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="EDIT_TIME" value="" title_name="修改时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>部门</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DEPT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DEPT_ID" value="" title_name="部门" />px
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
		<bu:submit viewId="e489d1bfa9a34597be207df1976f144d" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="e489d1bfa9a34597be207df1976f144d" />
    
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
    if(formId=='541d3515e85544be83e239b158f30ab4'){<%--LEO-质检-待处理表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
           // arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  "+ms.tdClass(formId, 'PROJECT_ID')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell  "+ms.tdClass(formId, 'T2#PROJECT_STATUS')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'T2#PROJECT_STATUS')+"' "+ms.tdEvent(formId, 'T2#PROJECT_STATUS')+">");
            arrHtml.push("<span colno='T2#PROJECT_STATUS' class='"+ms.uiClass(formId, 'T2#PROJECT_STATUS')+"' style='"+ms.uiStyle(formId, 'T2#PROJECT_STATUS')+"' "+ms.uiEvent(formId, 'T2#PROJECT_STATUS')+" title='"+ms.titleAttr(formId,'T2#PROJECT_STATUS','IS_TITLE_ATTR',v)+"' >"+v['T2#PROJECT_STATUS']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell  "+ms.tdClass(formId, 'T2#LOT_NUMBER')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'T2#LOT_NUMBER')+"' "+ms.tdEvent(formId, 'T2#LOT_NUMBER')+">");
            arrHtml.push("<span colno='T2#LOT_NUMBER' class='"+ms.uiClass(formId, 'T2#LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'T2#LOT_NUMBER')+"' "+ms.uiEvent(formId, 'T2#LOT_NUMBER')+" title='"+ms.titleAttr(formId,'T2#LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['T2#LOT_NUMBER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell  "+ms.tdClass(formId, 'T2#PRODUCT_MATERIAL')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'T2#PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_MATERIAL')+">");
            arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'T2#PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_MATERIAL']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell  "+ms.tdClass(formId, 'T2#PRODUCT_NAME')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'T2#PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_NAME')+">");
            arrHtml.push("<span colno='T2#PRODUCT_NAME' class='"+ms.uiClass(formId, 'T2#PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_NAME')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_NAME']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T2#PRODUCT_COUNT')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'T2#PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='"+ms.uiClass(formId, 'T2#PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#FINISH_COUNT' name='noprintset_T2#FINISH_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T2#FINISH_COUNT')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'T2#FINISH_COUNT')+"' "+ms.tdEvent(formId, 'T2#FINISH_COUNT')+">");
            arrHtml.push("<span colno='T2#FINISH_COUNT' class='"+ms.uiClass(formId, 'T2#FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'T2#FINISH_COUNT')+"' "+ms.uiEvent(formId, 'T2#FINISH_COUNT')+" title='"+ms.titleAttr(formId,'T2#FINISH_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T2#FINISH_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CHECK_STATUS' name='noprintset_CHECK_STATUS' class='datagrid-cell  "+ms.tdClass(formId, 'CHECK_STATUS')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'CHECK_STATUS')+"' "+ms.tdEvent(formId, 'CHECK_STATUS')+">");
            arrHtml.push("<span colno='CHECK_STATUS' class='"+ms.uiClass(formId, 'CHECK_STATUS')+"' style='"+ms.uiStyle(formId, 'CHECK_STATUS')+"' "+ms.uiEvent(formId, 'CHECK_STATUS')+" title='"+ms.titleAttr(formId,'CHECK_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CHECK_STATUS']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QT_MON' name='noprintset_QT_MON' class='datagrid-cell  "+ms.tdClass(formId, 'QT_MON')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'QT_MON')+"' "+ms.tdEvent(formId, 'QT_MON')+">");
            arrHtml.push("<span colno='QT_MON' class='"+ms.uiClass(formId, 'QT_MON')+"' style='"+ms.uiStyle(formId, 'QT_MON')+"' "+ms.uiEvent(formId, 'QT_MON')+" title='"+ms.titleAttr(formId,'QT_MON','IS_TITLE_ATTR',v)+"' >"+v['QT_MON']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CHECK_USER' name='noprintset_CHECK_USER' class='datagrid-cell  "+ms.tdClass(formId, 'CHECK_USER')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'CHECK_USER')+"' "+ms.tdEvent(formId, 'CHECK_USER')+">");
            arrHtml.push("<span colno='CHECK_USER' class='"+ms.uiClass(formId, 'CHECK_USER')+"' style='"+ms.uiStyle(formId, 'CHECK_USER')+"' "+ms.uiEvent(formId, 'CHECK_USER')+" title='"+ms.titleAttr(formId,'CHECK_USER','IS_TITLE_ATTR',v)+"' >"+v['CHECK_USER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  "+ms.tdClass(formId, 'EDIT_TIME')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">");
            arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+ms.titleAttr(formId,'EDIT_TIME','IS_TITLE_ATTR',v)+"' >"+v['EDIT_TIME']+"</span>");
            arrHtml.push("</td>");
           // arrHtml.push("<td colno='DEPT_ID' name='noprintset_DEPT_ID' class='datagrid-cell  "+ms.tdClass(formId, 'DEPT_ID')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'DEPT_ID')+"' "+ms.tdEvent(formId, 'DEPT_ID')+">")
           // arrHtml.push("<span colno='DEPT_ID' class='"+ms.uiClass(formId, 'DEPT_ID')+"' style='"+ms.uiStyle(formId, 'DEPT_ID')+"' "+ms.uiEvent(formId, 'DEPT_ID')+" title='"+ms.titleAttr(formId,'DEPT_ID','IS_TITLE_ATTR',v)+"' >"+v['DEPT_ID']+"</span>")
            //arrHtml.push("</td>");
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
    if(formId=='541d3515e85544be83e239b158f30ab4'){<%--LEO-质检-待处理表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PROJECT_STATUS' name='noprintset_T2#PROJECT_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'T2#PROJECT_STATUS')+"' style='"+ms.tdStyle(formId, 'T2#PROJECT_STATUS')+"' "+ms.tdEvent(formId, 'T2#PROJECT_STATUS')+">");
            arrHtml.push("<span colno='T2#PROJECT_STATUS' class='"+ms.uiClass(formId, 'T2#PROJECT_STATUS')+"' style='"+ms.uiStyle(formId, 'T2#PROJECT_STATUS')+"' "+ms.uiEvent(formId, 'T2#PROJECT_STATUS')+" title='"+ms.titleAttr(formId,'T2#PROJECT_STATUS','IS_TITLE_ATTR',v)+"' >"+v['T2#PROJECT_STATUS']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#LOT_NUMBER' name='noprintset_T2#LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'T2#LOT_NUMBER')+"' style='"+ms.tdStyle(formId, 'T2#LOT_NUMBER')+"' "+ms.tdEvent(formId, 'T2#LOT_NUMBER')+">");
            arrHtml.push("<span colno='T2#LOT_NUMBER' class='"+ms.uiClass(formId, 'T2#LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'T2#LOT_NUMBER')+"' "+ms.uiEvent(formId, 'T2#LOT_NUMBER')+" title='"+ms.titleAttr(formId,'T2#LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['T2#LOT_NUMBER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'T2#PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_MATERIAL')+">");
            arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'T2#PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_MATERIAL']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_NAME')+"' style='"+ms.tdStyle(formId, 'T2#PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_NAME')+">");
            arrHtml.push("<span colno='T2#PRODUCT_NAME' class='"+ms.uiClass(formId, 'T2#PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_NAME')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_NAME']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_COUNT' name='noprintset_T2#PRODUCT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'T2#PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='T2#PRODUCT_COUNT' class='"+ms.uiClass(formId, 'T2#PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#FINISH_COUNT' name='noprintset_T2#FINISH_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'T2#FINISH_COUNT')+"' style='"+ms.tdStyle(formId, 'T2#FINISH_COUNT')+"' "+ms.tdEvent(formId, 'T2#FINISH_COUNT')+">");
            arrHtml.push("<span colno='T2#FINISH_COUNT' class='"+ms.uiClass(formId, 'T2#FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'T2#FINISH_COUNT')+"' "+ms.uiEvent(formId, 'T2#FINISH_COUNT')+" title='"+ms.titleAttr(formId,'T2#FINISH_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T2#FINISH_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CHECK_STATUS' name='noprintset_CHECK_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CHECK_STATUS')+"' style='"+ms.tdStyle(formId, 'CHECK_STATUS')+"' "+ms.tdEvent(formId, 'CHECK_STATUS')+">");
            arrHtml.push("<span colno='CHECK_STATUS' class='"+ms.uiClass(formId, 'CHECK_STATUS')+"' style='"+ms.uiStyle(formId, 'CHECK_STATUS')+"' "+ms.uiEvent(formId, 'CHECK_STATUS')+" title='"+ms.titleAttr(formId,'CHECK_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CHECK_STATUS']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QT_MON' name='noprintset_QT_MON' class='datagrid-cell "+ms.tdClass(formId, 'QT_MON')+"' style='"+ms.tdStyle(formId, 'QT_MON')+"' "+ms.tdEvent(formId, 'QT_MON')+">");
            arrHtml.push("<span colno='QT_MON' class='"+ms.uiClass(formId, 'QT_MON')+"' style='"+ms.uiStyle(formId, 'QT_MON')+"' "+ms.uiEvent(formId, 'QT_MON')+" title='"+ms.titleAttr(formId,'QT_MON','IS_TITLE_ATTR',v)+"' >"+v['QT_MON']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CHECK_USER' name='noprintset_CHECK_USER' class='datagrid-cell "+ms.tdClass(formId, 'CHECK_USER')+"' style='"+ms.tdStyle(formId, 'CHECK_USER')+"' "+ms.tdEvent(formId, 'CHECK_USER')+">");
            arrHtml.push("<span colno='CHECK_USER' class='"+ms.uiClass(formId, 'CHECK_USER')+"' style='"+ms.uiStyle(formId, 'CHECK_USER')+"' "+ms.uiEvent(formId, 'CHECK_USER')+" title='"+ms.titleAttr(formId,'CHECK_USER','IS_TITLE_ATTR',v)+"' >"+v['CHECK_USER']+"</span>");
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
