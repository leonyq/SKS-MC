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
		<dict:lang value="LEO-包装-物料对账" />
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
		<bu:header formId ="5a4ae0bc729d430dac8d2d784e4687c5"/>

    
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
		<bu:func viewId="059a524509444dcea68e986ad31d0b22" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="059a524509444dcea68e986ad31d0b22" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage5a4ae0bc729d430dac8d2d784e4687c5" id="formPage5a4ae0bc729d430dac8d2d784e4687c5" value="${formPage5a4ae0bc729d430dac8d2d784e4687c5}"/>
		<input type="hidden" name="formId" id="formId1" value='5a4ae0bc729d430dac8d2d784e4687c5'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="5a4ae0bc729d430dac8d2d784e4687c5">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax5a4ae0bc729d430dac8d2d784e4687c5" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner5a4ae0bc729d430dac8d2d784e4687c5">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable5a4ae0bc729d430dac8d2d784e4687c5">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="5a4ae0bc729d430dac8d2d784e4687c5" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center;display:none"><span><input type="checkbox" id="selectAll_5a4ae0bc729d430dac8d2d784e4687c5" onclick="_selectAjaxTableAllData(this,'5a4ae0bc729d430dac8d2d784e4687c5')" style="cursor: pointer;"title="全选"/></span></td>
	    	<td name="noprintset_PROJECT_ID" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="PROJECT_ID" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
           <td name="noprintset_T5#PRODUCT_MATERIAL" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="T5#PRODUCT_MATERIAL" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
           <td name="noprintset_T5#PRODUCT_COUNT" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="T5#PRODUCT_COUNT" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
           <td name="noprintset_T5#FINISH_COUNT" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="T5#FINISH_COUNT" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
            
           <td name="noprintset_ITEM_CODE" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="ITEM_CODE" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
			<td name="noprintset_ITEM_MANE" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="ITEM_MANE" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
			<td name="noprintset_ITEM_SPEC" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="ITEM_SPEC" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
			<td name="noprintset_WORK_SPACE" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="WORK_SPACE" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
			<td name="noprintset_WARE_HOUSE" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="WARE_HOUSE" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
			<td name="noprintset_ITEM_NUM" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="ITEM_NUM" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
            <td name="noprintset_PACK_NUM" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="PACK_NUM" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
            <td name="noprintset_EDIT_USER" class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="EDIT_USER" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
			<td name="noprintset_EDIT_TIME" class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="EDIT_TIME" formId="5a4ae0bc729d430dac8d2d784e4687c5" /></td>
			
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv5a4ae0bc729d430dac8d2d784e4687c5" onscroll="ajaxTableScroll(this,'5a4ae0bc729d430dac8d2d784e4687c5')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax5a4ae0bc729d430dac8d2d784e4687c5">
		<tbody id="tbody_5a4ae0bc729d430dac8d2d784e4687c5" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage5a4ae0bc729d430dac8d2d784e4687c5==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=5a4ae0bc729d430dac8d2d784e4687c5&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('5a4ae0bc729d430dac8d2d784e4687c5','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>SAP工单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_ID" value="" title_name="SAP工单" />px
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
 <td style="width: 100px;text-align: right;"><span>物料名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ITEM_MANE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ITEM_MANE" value="" title_name="物料名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料规格</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ITEM_SPEC" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ITEM_SPEC" value="" title_name="物料规格" />px
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
 <input type="checkbox" name="WARE_HOUSE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WARE_HOUSE" value="" title_name="仓库" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>理论产量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ITEM_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ITEM_NUM" value="" title_name="理论产量" />px
 </td>
 </tr>
 
 <tr>
 <td style="width: 100px;text-align: right;"><span>实际包装量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PACK_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PACK_NUM" value="" title_name="实际包装量" />px
 </td>
 </tr>
 <tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>包装人员</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="EDIT_USER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="EDIT_USER" value="" title_name="包装人员" />px
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
		<bu:submit viewId="059a524509444dcea68e986ad31d0b22" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="059a524509444dcea68e986ad31d0b22" />
    
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
    if(formId=='5a4ae0bc729d430dac8d2d784e4687c5'){<%--LEO-包装物料单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center; display:none;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
      arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
      arrHtml.push("<td colno='T5#PRODUCT_MATERIAL' name='noprintset_T5#PRODUCT_MATERIAL' class='datagrid-cell  "+ms.tdClass(formId, 'T5#PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'T5#PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'T5#PRODUCT_MATERIAL')+">");
            arrHtml.push("<span colno='T5#PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'T5#PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'T5#PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'T5#PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'T5#PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['T5#PRODUCT_MATERIAL']+"</span>");
            arrHtml.push("</td>");
      arrHtml.push("<td colno='T5#PRODUCT_COUNT' name='noprintset_T5#PRODUCT_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T5#PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'T5#PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'T5#PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='T5#PRODUCT_COUNT' class='"+ms.uiClass(formId, 'T5#PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'T5#PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'T5#PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'T5#PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T5#PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
      arrHtml.push("<td colno='T5#FINISH_COUNT' name='noprintset_T5#FINISH_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T5#FINISH_COUNT')+"' style='"+ms.tdStyle(formId, 'T5#FINISH_COUNT')+"' "+ms.tdEvent(formId, 'T5#FINISH_COUNT')+">");
            arrHtml.push("<span colno='T5#FINISH_COUNT' class='"+ms.uiClass(formId, 'T5#FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'T5#FINISH_COUNT')+"' "+ms.uiEvent(formId, 'T5#FINISH_COUNT')+" title='"+ms.titleAttr(formId,'T5#FINISH_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T5#FINISH_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'ITEM_CODE')+"' "+ms.tdEvent(formId, 'ITEM_CODE')+">");
            arrHtml.push("<span colno='ITEM_CODE' class='"+ms.uiClass(formId, 'ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'ITEM_CODE')+"' "+ms.uiEvent(formId, 'ITEM_CODE')+" title='"+ms.titleAttr(formId,'ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_MANE' name='noprintset_ITEM_MANE' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_MANE')+"' style='"+ms.tdStyle(formId, 'ITEM_MANE')+"' "+ms.tdEvent(formId, 'ITEM_MANE')+">");
            arrHtml.push("<span colno='ITEM_MANE' class='"+ms.uiClass(formId, 'ITEM_MANE')+"' style='"+ms.uiStyle(formId, 'ITEM_MANE')+"' "+ms.uiEvent(formId, 'ITEM_MANE')+" title='"+ms.titleAttr(formId,'ITEM_MANE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_MANE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_SPEC' name='noprintset_ITEM_SPEC' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'ITEM_SPEC')+"' "+ms.tdEvent(formId, 'ITEM_SPEC')+">");
            arrHtml.push("<span colno='ITEM_SPEC' class='"+ms.uiClass(formId, 'ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'ITEM_SPEC')+"' "+ms.uiEvent(formId, 'ITEM_SPEC')+" title='"+ms.titleAttr(formId,'ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['ITEM_SPEC']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_SPACE' name='noprintset_WORK_SPACE' class='datagrid-cell  "+ms.tdClass(formId, 'WORK_SPACE')+"' style='"+ms.tdStyle(formId, 'WORK_SPACE')+"' "+ms.tdEvent(formId, 'WORK_SPACE')+">");
            arrHtml.push("<span colno='WORK_SPACE' class='"+ms.uiClass(formId, 'WORK_SPACE')+"' style='"+ms.uiStyle(formId, 'WORK_SPACE')+"' "+ms.uiEvent(formId, 'WORK_SPACE')+" title='"+ms.titleAttr(formId,'WORK_SPACE','IS_TITLE_ATTR',v)+"' >"+v['WORK_SPACE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WARE_HOUSE' name='noprintset_WARE_HOUSE' class='datagrid-cell  "+ms.tdClass(formId, 'WARE_HOUSE')+"' style='"+ms.tdStyle(formId, 'WARE_HOUSE')+"' "+ms.tdEvent(formId, 'WARE_HOUSE')+">");
            arrHtml.push("<span colno='WARE_HOUSE' class='"+ms.uiClass(formId, 'WARE_HOUSE')+"' style='"+ms.uiStyle(formId, 'WARE_HOUSE')+"' "+ms.uiEvent(formId, 'WARE_HOUSE')+" title='"+ms.titleAttr(formId,'WARE_HOUSE','IS_TITLE_ATTR',v)+"' >"+v['WARE_HOUSE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'ITEM_NUM')+"' "+ms.tdEvent(formId, 'ITEM_NUM')+">");
            arrHtml.push("<span colno='ITEM_NUM' class='"+ms.uiClass(formId, 'ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'ITEM_NUM')+"' "+ms.uiEvent(formId, 'ITEM_NUM')+" title='"+ms.titleAttr(formId,'ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['ITEM_NUM']+"</span>");
            arrHtml.push("</td>");
          
            arrHtml.push("<td colno='PACK_NUM' name='noprintset_PACK_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'PACK_NUM')+"' style='"+ms.tdStyle(formId, 'PACK_NUM')+"' "+ms.tdEvent(formId, 'PACK_NUM')+">");
            arrHtml.push("<span colno='PACK_NUM' class='"+ms.uiClass(formId, 'PACK_NUM')+"' style='"+ms.uiStyle(formId, 'PACK_NUM')+"' "+ms.uiEvent(formId, 'PACK_NUM')+" title='"+ms.titleAttr(formId,'PACK_NUM','IS_TITLE_ATTR',v)+"' >"+v['PACK_NUM']+"</span>");
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
    if(formId=='5a4ae0bc729d430dac8d2d784e4687c5'){<%--LEO-包装物料单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
      arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
      arrHtml.push("<td colno='T5#PRODUCT_MATERIAL' name='noprintset_T5#PRODUCT_MATERIAL' class='datagrid-cell  "+ms.tdClass(formId, 'T5#PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'T5#PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'T5#PRODUCT_MATERIAL')+">");
            arrHtml.push("<span colno='T5#PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'T5#PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'T5#PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'T5#PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'T5#PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['T5#PRODUCT_MATERIAL']+"</span>");
            arrHtml.push("</td>");
      arrHtml.push("<td colno='T5#PRODUCT_COUNT' name='noprintset_T5#PRODUCT_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T5#PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'T5#PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'T5#PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='T5#PRODUCT_COUNT' class='"+ms.uiClass(formId, 'T5#PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'T5#PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'T5#PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'T5#PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T5#PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
      arrHtml.push("<td colno='T5#FINISH_COUNT' name='noprintset_T5#FINISH_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T5#FINISH_COUNT')+"' style='"+ms.tdStyle(formId, 'T5#FINISH_COUNT')+"' "+ms.tdEvent(formId, 'T5#FINISH_COUNT')+">");
            arrHtml.push("<span colno='T5#FINISH_COUNT' class='"+ms.uiClass(formId, 'T5#FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'T5#FINISH_COUNT')+"' "+ms.uiEvent(formId, 'T5#FINISH_COUNT')+" title='"+ms.titleAttr(formId,'T5#FINISH_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T5#FINISH_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'ITEM_CODE')+"' "+ms.tdEvent(formId, 'ITEM_CODE')+">");
            arrHtml.push("<span colno='ITEM_CODE' class='"+ms.uiClass(formId, 'ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'ITEM_CODE')+"' "+ms.uiEvent(formId, 'ITEM_CODE')+" title='"+ms.titleAttr(formId,'ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_MANE' name='noprintset_ITEM_MANE' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_MANE')+"' style='"+ms.tdStyle(formId, 'ITEM_MANE')+"' "+ms.tdEvent(formId, 'ITEM_MANE')+">");
            arrHtml.push("<span colno='ITEM_MANE' class='"+ms.uiClass(formId, 'ITEM_MANE')+"' style='"+ms.uiStyle(formId, 'ITEM_MANE')+"' "+ms.uiEvent(formId, 'ITEM_MANE')+" title='"+ms.titleAttr(formId,'ITEM_MANE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_MANE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_SPEC' name='noprintset_ITEM_SPEC' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'ITEM_SPEC')+"' "+ms.tdEvent(formId, 'ITEM_SPEC')+">");
            arrHtml.push("<span colno='ITEM_SPEC' class='"+ms.uiClass(formId, 'ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'ITEM_SPEC')+"' "+ms.uiEvent(formId, 'ITEM_SPEC')+" title='"+ms.titleAttr(formId,'ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['ITEM_SPEC']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_SPACE' name='noprintset_WORK_SPACE' class='datagrid-cell  "+ms.tdClass(formId, 'WORK_SPACE')+"' style='"+ms.tdStyle(formId, 'WORK_SPACE')+"' "+ms.tdEvent(formId, 'WORK_SPACE')+">");
            arrHtml.push("<span colno='WORK_SPACE' class='"+ms.uiClass(formId, 'WORK_SPACE')+"' style='"+ms.uiStyle(formId, 'WORK_SPACE')+"' "+ms.uiEvent(formId, 'WORK_SPACE')+" title='"+ms.titleAttr(formId,'WORK_SPACE','IS_TITLE_ATTR',v)+"' >"+v['WORK_SPACE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WARE_HOUSE' name='noprintset_WARE_HOUSE' class='datagrid-cell  "+ms.tdClass(formId, 'WARE_HOUSE')+"' style='"+ms.tdStyle(formId, 'WARE_HOUSE')+"' "+ms.tdEvent(formId, 'WARE_HOUSE')+">");
            arrHtml.push("<span colno='WARE_HOUSE' class='"+ms.uiClass(formId, 'WARE_HOUSE')+"' style='"+ms.uiStyle(formId, 'WARE_HOUSE')+"' "+ms.uiEvent(formId, 'WARE_HOUSE')+" title='"+ms.titleAttr(formId,'WARE_HOUSE','IS_TITLE_ATTR',v)+"' >"+v['WARE_HOUSE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'ITEM_NUM')+"' "+ms.tdEvent(formId, 'ITEM_NUM')+">");
            arrHtml.push("<span colno='ITEM_NUM' class='"+ms.uiClass(formId, 'ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'ITEM_NUM')+"' "+ms.uiEvent(formId, 'ITEM_NUM')+" title='"+ms.titleAttr(formId,'ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['ITEM_NUM']+"</span>");
            arrHtml.push("</td>");
          
            arrHtml.push("<td colno='PACK_NUM' name='noprintset_PACK_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'PACK_NUM')+"' style='"+ms.tdStyle(formId, 'PACK_NUM')+"' "+ms.tdEvent(formId, 'PACK_NUM')+">");
            arrHtml.push("<span colno='PACK_NUM' class='"+ms.uiClass(formId, 'PACK_NUM')+"' style='"+ms.uiStyle(formId, 'PACK_NUM')+"' "+ms.uiEvent(formId, 'PACK_NUM')+" title='"+ms.titleAttr(formId,'PACK_NUM','IS_TITLE_ATTR',v)+"' >"+v['PACK_NUM']+"</span>");
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
