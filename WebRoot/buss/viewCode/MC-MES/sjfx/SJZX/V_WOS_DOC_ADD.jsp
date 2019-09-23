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
		<dict:lang value="产品包装信息" />
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
		<bu:header formId ="e6226ab6caf14e5db2e7d9d5537bab41"/>

    
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
		<bu:func viewId="5f66c554d6574903b7db64f8e3b90d2d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="5f66c554d6574903b7db64f8e3b90d2d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagee6226ab6caf14e5db2e7d9d5537bab41" id="formPagee6226ab6caf14e5db2e7d9d5537bab41" value="${formPagee6226ab6caf14e5db2e7d9d5537bab41}"/>
		<input type="hidden" name="formId" id="formId1" value='e6226ab6caf14e5db2e7d9d5537bab41'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="e6226ab6caf14e5db2e7d9d5537bab41">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxe6226ab6caf14e5db2e7d9d5537bab41" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innere6226ab6caf14e5db2e7d9d5537bab41">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablee6226ab6caf14e5db2e7d9d5537bab41" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="e6226ab6caf14e5db2e7d9d5537bab41" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_e6226ab6caf14e5db2e7d9d5537bab41" onclick="_selectAjaxTableAllData(this,'e6226ab6caf14e5db2e7d9d5537bab41')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_DATA_AUTH"  style="width:200px;" class=" datagrid-cell"><bu:uitn colNo="DATA_AUTH" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_SN"  style="width:100px;" class=" datagrid-cell"><bu:uitn colNo="PSI_SN" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_TAKEPLACE" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_TAKEPLACE" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_MO_NUMBER" style="width:150px;" class="datagrid-cell"><bu:uitn colNo="PSI_MO_NUMBER" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_CONTAINER_SN" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_CONTAINER_SN" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_PROJECT_ID" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_PROJECT_ID" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_MODEL_CODE" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_MODEL_CODE" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_CI_ITEM_NAME" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_NAME" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
		<!--	<td name="noprintset_CI_ITEM_SPEC" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_SPEC" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>  -->
			<td name="noprintset_PSI_AREA_SN" style="width:150px;" class="datagrid-cell"><bu:uitn colNo="PSI_AREA_SN" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_PRODUCT_STEP" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_PRODUCT_STEP" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_WORK_STATION" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_WORK_STATION" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_SN_NUM " style="width:80px;" class="datagrid-cell"><bu:uitn colNo="PSI_SN_NUM" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
		<!--	<td name="noprintset_PSI_STANDARD_WEIGHT" class="datagrid-cell"><bu:uitn colNo="PSI_STANDARD_WEIGHT" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>  -->
		<!--	<td name="noprintset_PSI_ACTUAL_WEIGHT" class="datagrid-cell"><bu:uitn colNo="PSI_ACTUAL_WEIGHT" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td> -->
			<td name="noprintset_PSI_INSPECT_SN" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_INSPECT_SN" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_TIME" style="width:140px;" class="datagrid-cell"><bu:uitn colNo="PSI_TIME" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_EMP" style="width:80px;" class="datagrid-cell"><bu:uitn colNo="PSI_EMP" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_PROCESS_FACE" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_PROCESS_FACE" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			<td name="noprintset_PSI_LOT" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="PSI_LOT" formId="e6226ab6caf14e5db2e7d9d5537bab41" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDive6226ab6caf14e5db2e7d9d5537bab41" onscroll="ajaxTableScroll(this,'e6226ab6caf14e5db2e7d9d5537bab41')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxe6226ab6caf14e5db2e7d9d5537bab41" >
		<tbody id="tbody_e6226ab6caf14e5db2e7d9d5537bab41" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagee6226ab6caf14e5db2e7d9d5537bab41==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=e6226ab6caf14e5db2e7d9d5537bab41&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('e6226ab6caf14e5db2e7d9d5537bab41','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>产品SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_SN" value="" title_name="产品SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?占位SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_TAKEPLACE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_TAKEPLACE" value="" title_name="?占位SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>制令单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_MO_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_MO_NUMBER" value="" title_name="制令单号" />px
 </td>
 </tr>
  <tr>
 <td style="width: 100px;text-align: right;"><span>?所属容器</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_CONTAINER_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_CONTAINER_SN" value="" title_name="?所属容器" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_PROJECT_ID" value="" title_name="工单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?机种代码/料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_MODEL_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_MODEL_CODE" value="" title_name="?机种代码/料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?线别(线别代码)</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_AREA_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_AREA_SN" value="" title_name="?线别(线别代码)" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产阶别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_PRODUCT_STEP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_PRODUCT_STEP" value="" title_name="生产阶别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工作中心</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_WORK_STATION" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_WORK_STATION" value="" title_name="工作中心" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>产品数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_SN_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_SN_NUM" value="" title_name="产品数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>标准重量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_STANDARD_WEIGHT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_STANDARD_WEIGHT" value="" title_name="标准重量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>实际重量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_ACTUAL_WEIGHT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_ACTUAL_WEIGHT" value="" title_name="实际重量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?校验批号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_INSPECT_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_INSPECT_SN" value="" title_name="?校验批号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>创建时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_TIME" value="" title_name="创建时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?操作员工</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_EMP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_EMP" value="" title_name="?操作员工" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?加工面（0：单面，1正面，2反面，3阴阳面）</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_PROCESS_FACE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_PROCESS_FACE" value="" title_name="?加工面（0：单面，1正面，2反面，3阴阳面）" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产批号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PSI_LOT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PSI_LOT" value="" title_name="生产批号" />px
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
		<bu:submit viewId="5f66c554d6574903b7db64f8e3b90d2d" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="5f66c554d6574903b7db64f8e3b90d2d" />
    
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
    if(formId=='e6226ab6caf14e5db2e7d9d5537bab41'){<%--FM-产品包装信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_SN' name='noprintset_PSI_SN' class='datagrid-cell "+ms.tdClass(formId, 'PSI_SN')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_SN')+"' "+ms.tdEvent(formId, 'PSI_SN')+">")
            arrHtml.push("<span colno='PSI_SN' class='"+ms.uiClass(formId, 'PSI_SN')+"' onclick='itemJump1(\""+v['PSI_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PSI_SN')+" title='"+ms.titleAttr(formId,'PSI_SN','IS_TITLE_ATTR',v)+"' >"+v['PSI_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_TAKEPLACE' name='noprintset_PSI_TAKEPLACE' class='datagrid-cell "+ms.tdClass(formId, 'PSI_TAKEPLACE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_TAKEPLACE')+"' "+ms.tdEvent(formId, 'PSI_TAKEPLACE')+">")
            arrHtml.push("<span colno='PSI_TAKEPLACE' class='"+ms.uiClass(formId, 'PSI_TAKEPLACE')+"' style='"+ms.uiStyle(formId, 'PSI_TAKEPLACE')+"' "+ms.uiEvent(formId, 'PSI_TAKEPLACE')+" title='"+ms.titleAttr(formId,'PSI_TAKEPLACE','IS_TITLE_ATTR',v)+"' >"+v['PSI_TAKEPLACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_MO_NUMBER' name='noprintset_PSI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PSI_MO_NUMBER')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'PSI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'PSI_MO_NUMBER')+">")
            arrHtml.push("<span colno='PSI_MO_NUMBER' class='"+ms.uiClass(formId, 'PSI_MO_NUMBER')+"' onclick='itemJump2(\""+v['PSI_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PSI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'PSI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PSI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
              arrHtml.push("<td colno='PSI_CONTAINER_SN' name='noprintset_PSI_CONTAINER_SN' class='datagrid-cell "+ms.tdClass(formId, 'PSI_CONTAINER_SN')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_CONTAINER_SN')+"' "+ms.tdEvent(formId, 'PSI_CONTAINER_SN')+">")
            arrHtml.push("<span colno='PSI_CONTAINER_SN' class='"+ms.uiClass(formId, 'PSI_CONTAINER_SN')+"' style='"+ms.uiStyle(formId, 'PSI_CONTAINER_SN')+"' "+ms.uiEvent(formId, 'PSI_CONTAINER_SN')+" title='"+ms.titleAttr(formId,'PSI_CONTAINER_SN','IS_TITLE_ATTR',v)+"' >"+v['PSI_CONTAINER_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_PROJECT_ID' name='noprintset_PSI_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PSI_PROJECT_ID')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PSI_PROJECT_ID')+">")
            arrHtml.push("<span colno='PSI_PROJECT_ID' class='"+ms.uiClass(formId, 'PSI_PROJECT_ID')+"' onclick='itemJump3(\""+v['PSI_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PSI_PROJECT_ID')+" title='"+ms.titleAttr(formId,'PSI_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PSI_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_MODEL_CODE' name='noprintset_PSI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PSI_MODEL_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PSI_MODEL_CODE')+">")
            arrHtml.push("<span colno='PSI_MODEL_CODE' class='"+ms.uiClass(formId, 'PSI_MODEL_CODE')+"' onclick='itemJump4(\""+v['PSI_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PSI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'PSI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['PSI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_NAME' name='noprintset_CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_NAME')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='CI_ITEM_NAME' class='"+ms.uiClass(formId, 'CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
           // arrHtml.push("<td colno='CI_ITEM_SPEC' name='noprintset_CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CI_ITEM_SPEC')+">")
           // arrHtml.push("<span colno='CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_SPEC']+"</span>")
           // arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_AREA_SN' name='noprintset_PSI_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PSI_AREA_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'PSI_AREA_SN')+"' "+ms.tdEvent(formId, 'PSI_AREA_SN')+">")
            arrHtml.push("<span colno='PSI_AREA_SN' class='"+ms.uiClass(formId, 'PSI_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PSI_AREA_SN')+"' "+ms.uiEvent(formId, 'PSI_AREA_SN')+" title='"+ms.titleAttr(formId,'PSI_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PSI_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_PRODUCT_STEP' name='noprintset_PSI_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'PSI_PRODUCT_STEP')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'PSI_PRODUCT_STEP')+">")
            arrHtml.push("<span colno='PSI_PRODUCT_STEP' class='"+ms.uiClass(formId, 'PSI_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'PSI_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'PSI_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'PSI_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['PSI_PRODUCT_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_WORK_STATION' name='noprintset_PSI_WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'PSI_WORK_STATION')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_WORK_STATION')+"' "+ms.tdEvent(formId, 'PSI_WORK_STATION')+">")
            arrHtml.push("<span colno='PSI_WORK_STATION' class='"+ms.uiClass(formId, 'PSI_WORK_STATION')+"' style='"+ms.uiStyle(formId, 'PSI_WORK_STATION')+"' "+ms.uiEvent(formId, 'PSI_WORK_STATION')+" title='"+ms.titleAttr(formId,'PSI_WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['PSI_WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_SN_NUM' name='noprintset_PSI_SN_NUM' class='datagrid-cell "+ms.tdClass(formId, 'PSI_SN_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'PSI_SN_NUM')+"' "+ms.tdEvent(formId, 'PSI_SN_NUM')+">")
            arrHtml.push("<span colno='PSI_SN_NUM' class='"+ms.uiClass(formId, 'PSI_SN_NUM')+"' style='"+ms.uiStyle(formId, 'PSI_SN_NUM')+"' "+ms.uiEvent(formId, 'PSI_SN_NUM')+" title='"+ms.titleAttr(formId,'PSI_SN_NUM','IS_TITLE_ATTR',v)+"' >"+v['PSI_SN_NUM']+"</span>")
            arrHtml.push("</td>");
           // arrHtml.push("<td colno='PSI_STANDARD_WEIGHT' name='noprintset_PSI_STANDARD_WEIGHT' class='datagrid-cell "+ms.tdClass(formId, 'PSI_STANDARD_WEIGHT')+"' style='"+ms.tdStyle(formId, 'PSI_STANDARD_WEIGHT')+"' "+ms.tdEvent(formId, 'PSI_STANDARD_WEIGHT')+">")
           // arrHtml.push("<span colno='PSI_STANDARD_WEIGHT' class='"+ms.uiClass(formId, 'PSI_STANDARD_WEIGHT')+"' style='"+ms.uiStyle(formId, 'PSI_STANDARD_WEIGHT')+"' "+ms.uiEvent(formId, 'PSI_STANDARD_WEIGHT')+" title='"+ms.titleAttr(formId,'PSI_STANDARD_WEIGHT','IS_TITLE_ATTR',v)+"' >"+v['PSI_STANDARD_WEIGHT']+"</span>")
           // arrHtml.push("</td>");
           // arrHtml.push("<td colno='PSI_ACTUAL_WEIGHT' name='noprintset_PSI_ACTUAL_WEIGHT' class='datagrid-cell "+ms.tdClass(formId, 'PSI_ACTUAL_WEIGHT')+"' style='"+ms.tdStyle(formId, 'PSI_ACTUAL_WEIGHT')+"' "+ms.tdEvent(formId, 'PSI_ACTUAL_WEIGHT')+">")
           // arrHtml.push("<span colno='PSI_ACTUAL_WEIGHT' class='"+ms.uiClass(formId, 'PSI_ACTUAL_WEIGHT')+"' style='"+ms.uiStyle(formId, 'PSI_ACTUAL_WEIGHT')+"' "+ms.uiEvent(formId, 'PSI_ACTUAL_WEIGHT')+" title='"+ms.titleAttr(formId,'PSI_ACTUAL_WEIGHT','IS_TITLE_ATTR',v)+"' >"+v['PSI_ACTUAL_WEIGHT']+"</span>")
           // arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_INSPECT_SN' name='noprintset_PSI_INSPECT_SN' class='datagrid-cell "+ms.tdClass(formId, 'PSI_INSPECT_SN')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_INSPECT_SN')+"' "+ms.tdEvent(formId, 'PSI_INSPECT_SN')+">")
            arrHtml.push("<span colno='PSI_INSPECT_SN' class='"+ms.uiClass(formId, 'PSI_INSPECT_SN')+"' style='"+ms.uiStyle(formId, 'PSI_INSPECT_SN')+"' "+ms.uiEvent(formId, 'PSI_INSPECT_SN')+" title='"+ms.titleAttr(formId,'PSI_INSPECT_SN','IS_TITLE_ATTR',v)+"' >"+v['PSI_INSPECT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_TIME' name='noprintset_PSI_TIME' class='datagrid-cell "+ms.tdClass(formId, 'PSI_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'PSI_TIME')+"' "+ms.tdEvent(formId, 'PSI_TIME')+">")
            arrHtml.push("<span colno='PSI_TIME' class='"+ms.uiClass(formId, 'PSI_TIME')+"' style='"+ms.uiStyle(formId, 'PSI_TIME')+"' "+ms.uiEvent(formId, 'PSI_TIME')+" title='"+ms.titleAttr(formId,'PSI_TIME','IS_TITLE_ATTR',v)+"' >"+v['PSI_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_EMP' name='noprintset_PSI_EMP' class='datagrid-cell "+ms.tdClass(formId, 'PSI_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'PSI_EMP')+"' "+ms.tdEvent(formId, 'PSI_EMP')+">")
            arrHtml.push("<span colno='PSI_EMP' class='"+ms.uiClass(formId, 'PSI_EMP')+"' style='"+ms.uiStyle(formId, 'PSI_EMP')+"' "+ms.uiEvent(formId, 'PSI_EMP')+" title='"+ms.titleAttr(formId,'PSI_EMP','IS_TITLE_ATTR',v)+"' >"+v['PSI_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_PROCESS_FACE' name='noprintset_PSI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'PSI_PROCESS_FACE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'PSI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='PSI_PROCESS_FACE' class='"+ms.uiClass(formId, 'PSI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'PSI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'PSI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'PSI_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['PSI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PSI_LOT' name='noprintset_PSI_LOT' class='datagrid-cell "+ms.tdClass(formId, 'PSI_LOT')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'PSI_LOT')+"' "+ms.tdEvent(formId, 'PSI_LOT')+">")
            arrHtml.push("<span colno='PSI_LOT' class='"+ms.uiClass(formId, 'PSI_LOT')+"' style='"+ms.uiStyle(formId, 'PSI_LOT')+"' "+ms.uiEvent(formId, 'PSI_LOT')+" title='"+ms.titleAttr(formId,'PSI_LOT','IS_TITLE_ATTR',v)+"' >"+v['PSI_LOT']+"</span>")
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

//产品追溯
function itemJump1(obj){
      winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//工单信息
function itemJump3(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//BOM管理
function itemJump4(obj){
  winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
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
