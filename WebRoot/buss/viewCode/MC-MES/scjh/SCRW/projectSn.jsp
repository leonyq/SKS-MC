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
		<dict:lang value="PROJECT_SN" />
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
		<bu:header formId ="188c0e9fb61a41a0872be4c595438431"/>

    
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
		<bu:func viewId="5e3934d60fb54130965f3074a69c0bb7" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="5e3934d60fb54130965f3074a69c0bb7" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage188c0e9fb61a41a0872be4c595438431" id="formPage188c0e9fb61a41a0872be4c595438431" value="${formPage188c0e9fb61a41a0872be4c595438431}"/>
		<input type="hidden" name="formId" id="formId1" value='188c0e9fb61a41a0872be4c595438431'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="188c0e9fb61a41a0872be4c595438431">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax188c0e9fb61a41a0872be4c595438431" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner188c0e9fb61a41a0872be4c595438431">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable188c0e9fb61a41a0872be4c595438431">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="188c0e9fb61a41a0872be4c595438431" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_188c0e9fb61a41a0872be4c595438431" onclick="_selectAjaxTableAllData(this,'188c0e9fb61a41a0872be4c595438431')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="PROJECT_ID" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="MO_NUMBER" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="PRODUCT_SN" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="T2#PRODUCT_MATERIAL" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="T2#PRODUCT_NAME" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="T2#PRODUCT_STANDARD" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="T2#PRODUCT_SN_PREFIX" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="BOX_SN" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="IN_BOX" formId="188c0e9fb61a41a0872be4c595438431" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="LOT_NUMBER" formId="188c0e9fb61a41a0872be4c595438431" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv188c0e9fb61a41a0872be4c595438431" onscroll="ajaxTableScroll(this,'188c0e9fb61a41a0872be4c595438431')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax188c0e9fb61a41a0872be4c595438431">
		<tbody id="tbody_188c0e9fb61a41a0872be4c595438431" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage188c0e9fb61a41a0872be4c595438431==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=188c0e9fb61a41a0872be4c595438431&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('188c0e9fb61a41a0872be4c595438431','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>工单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_ID" value="" title_name="工单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>制令单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MO_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MO_NUMBER" value="" title_name="制令单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>产品SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_SN" value="" title_name="产品SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PRODUCT_MATERIAL" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PRODUCT_MATERIAL" value="" title_name="机种" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>品名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PRODUCT_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PRODUCT_NAME" value="" title_name="品名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>规格</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PRODUCT_STANDARD" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PRODUCT_STANDARD" value="" title_name="规格" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?号段前缀</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PRODUCT_SN_PREFIX" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PRODUCT_SN_PREFIX" value="" title_name="?号段前缀" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?号段起始</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_SN_START" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_SN_START" value="" title_name="?号段起始" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?号段结束</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_SN_END" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_SN_END" value="" title_name="?号段结束" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?箱SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="BOX_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="BOX_SN" value="" title_name="?箱SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?是否装箱</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="IN_BOX" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="IN_BOX" value="" title_name="?是否装箱" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?批次号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="LOT_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="LOT_NUMBER" value="" title_name="?批次号" />px
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
		<bu:submit viewId="5e3934d60fb54130965f3074a69c0bb7" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="5e3934d60fb54130965f3074a69c0bb7" />
    
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
    if(formId=='188c0e9fb61a41a0872be4c595438431'){<%--工单SN号段--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v['DATA_AUTH']+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">")
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' onclick='itemJump1(\""+v['PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+v['PROJECT_ID']+"' >"+v['PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' onclick='itemJump2(\""+v['MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+v['MO_NUMBER']+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_SN' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'PRODUCT_SN')+"' "+ms.tdEvent(formId, 'PRODUCT_SN')+">")
            arrHtml.push("<span colno='PRODUCT_SN' class='"+ms.uiClass(formId, 'PRODUCT_SN')+"' onclick='itemJump3(\""+v['PRODUCT_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PRODUCT_SN')+" title='"+v['PRODUCT_SN']+"' >"+v['PRODUCT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_MATERIAL')+"' style='width:150px;"+ms.tdStyle(formId, 'T2#PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_MATERIAL')+">")
            arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'T2#PRODUCT_MATERIAL')+"' onclick='itemJump4(\""+v['T2#PRODUCT_MATERIAL']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'T2#PRODUCT_MATERIAL')+" title='"+v['T2#PRODUCT_MATERIAL']+"' >"+v['T2#PRODUCT_MATERIAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'T2#PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_NAME')+">")
            arrHtml.push("<span colno='T2#PRODUCT_NAME' class='"+ms.uiClass(formId, 'T2#PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_NAME')+" title='"+v['T2#PRODUCT_NAME']+"' >"+v['T2#PRODUCT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_STANDARD')+"' style='width:150px;"+ms.tdStyle(formId, 'T2#PRODUCT_STANDARD')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_STANDARD')+">")
            arrHtml.push("<span colno='T2#PRODUCT_STANDARD' class='"+ms.uiClass(formId, 'T2#PRODUCT_STANDARD')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_STANDARD')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_STANDARD')+" title='"+v['T2#PRODUCT_STANDARD']+"' >"+v['T2#PRODUCT_STANDARD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_SN_PREFIX' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_SN_PREFIX')+"' style='width:150px;"+ms.tdStyle(formId, 'T2#PRODUCT_SN_PREFIX')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_SN_PREFIX')+">")
            arrHtml.push("<span colno='T2#PRODUCT_SN_PREFIX' class='"+ms.uiClass(formId, 'T2#PRODUCT_SN_PREFIX')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_SN_PREFIX')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_SN_PREFIX')+" title='"+v['T2#PRODUCT_SN_PREFIX']+"' >"+v['T2#PRODUCT_SN_PREFIX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BOX_SN' class='datagrid-cell "+ms.tdClass(formId, 'BOX_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'BOX_SN')+"' "+ms.tdEvent(formId, 'BOX_SN')+">")
            arrHtml.push("<span colno='BOX_SN' class='"+ms.uiClass(formId, 'BOX_SN')+"' style='"+ms.uiStyle(formId, 'BOX_SN')+"' "+ms.uiEvent(formId, 'BOX_SN')+" title='"+v['BOX_SN']+"' >"+v['BOX_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IN_BOX' class='datagrid-cell "+ms.tdClass(formId, 'IN_BOX')+"' style='width:150px;"+ms.tdStyle(formId, 'IN_BOX')+"' "+ms.tdEvent(formId, 'IN_BOX')+">")
            arrHtml.push("<span colno='IN_BOX' class='"+ms.uiClass(formId, 'IN_BOX')+"' style='"+ms.uiStyle(formId, 'IN_BOX')+"' "+ms.uiEvent(formId, 'IN_BOX')+" title='"+v['IN_BOX']+"' >"+v['IN_BOX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'LOT_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'LOT_NUMBER')+"' "+ms.tdEvent(formId, 'LOT_NUMBER')+">")
            arrHtml.push("<span colno='LOT_NUMBER' class='"+ms.uiClass(formId, 'LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'LOT_NUMBER')+"' "+ms.uiEvent(formId, 'LOT_NUMBER')+" title='"+v['LOT_NUMBER']+"' >"+v['LOT_NUMBER']+"</span>")
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
    if(formId=='188c0e9fb61a41a0872be4c595438431'){<%--工单SN号段--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">")
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' name='noprintset_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'MO_NUMBER')+"' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_SN' name='noprintset_PRODUCT_SN' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN')+"' "+ms.tdEvent(formId, 'PRODUCT_SN')+">")
            arrHtml.push("<span colno='PRODUCT_SN' class='"+ms.uiClass(formId, 'PRODUCT_SN')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN')+"' "+ms.uiEvent(formId, 'PRODUCT_SN')+" title='"+ms.titleAttr(formId,'PRODUCT_SN','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_MATERIAL' name='noprintset_T2#PRODUCT_MATERIAL' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'T2#PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_MATERIAL')+">")
            arrHtml.push("<span colno='T2#PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'T2#PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_MATERIAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_NAME' name='noprintset_T2#PRODUCT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_NAME')+"' style='"+ms.tdStyle(formId, 'T2#PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_NAME')+">")
            arrHtml.push("<span colno='T2#PRODUCT_NAME' class='"+ms.uiClass(formId, 'T2#PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_NAME')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_STANDARD' name='noprintset_T2#PRODUCT_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_STANDARD')+"' style='"+ms.tdStyle(formId, 'T2#PRODUCT_STANDARD')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_STANDARD')+">")
            arrHtml.push("<span colno='T2#PRODUCT_STANDARD' class='"+ms.uiClass(formId, 'T2#PRODUCT_STANDARD')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_STANDARD')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_STANDARD')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_STANDARD','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_STANDARD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PRODUCT_SN_PREFIX' name='noprintset_PRODUCT_SN_PREFIX' class='datagrid-cell "+ms.tdClass(formId, 'T2#PRODUCT_SN_PREFIX')+"' style='"+ms.tdStyle(formId, 'T2#PRODUCT_SN_PREFIX')+"' "+ms.tdEvent(formId, 'T2#PRODUCT_SN_PREFIX')+">")
            arrHtml.push("<span colno='T2#PRODUCT_SN_PREFIX' class='"+ms.uiClass(formId, 'T2#PRODUCT_SN_PREFIX')+"' style='"+ms.uiStyle(formId, 'T2#PRODUCT_SN_PREFIX')+"' "+ms.uiEvent(formId, 'T2#PRODUCT_SN_PREFIX')+" title='"+ms.titleAttr(formId,'T2#PRODUCT_SN_PREFIX','IS_TITLE_ATTR',v)+"' >"+v['T2#PRODUCT_SN_PREFIX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_SN_START' name='noprintset_PRODUCT_SN_START' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN_START')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN_START')+"' "+ms.tdEvent(formId, 'PRODUCT_SN_START')+">")
            arrHtml.push("<span colno='PRODUCT_SN_START' class='"+ms.uiClass(formId, 'PRODUCT_SN_START')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN_START')+"' "+ms.uiEvent(formId, 'PRODUCT_SN_START')+" title='"+ms.titleAttr(formId,'PRODUCT_SN_START','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN_START']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCT_SN_END' name='noprintset_PRODUCT_SN_END' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN_END')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN_END')+"' "+ms.tdEvent(formId, 'PRODUCT_SN_END')+">")
            arrHtml.push("<span colno='PRODUCT_SN_END' class='"+ms.uiClass(formId, 'PRODUCT_SN_END')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN_END')+"' "+ms.uiEvent(formId, 'PRODUCT_SN_END')+" title='"+ms.titleAttr(formId,'PRODUCT_SN_END','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN_END']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BOX_SN' name='noprintset_BOX_SN' class='datagrid-cell "+ms.tdClass(formId, 'BOX_SN')+"' style='"+ms.tdStyle(formId, 'BOX_SN')+"' "+ms.tdEvent(formId, 'BOX_SN')+">")
            arrHtml.push("<span colno='BOX_SN' class='"+ms.uiClass(formId, 'BOX_SN')+"' style='"+ms.uiStyle(formId, 'BOX_SN')+"' "+ms.uiEvent(formId, 'BOX_SN')+" title='"+ms.titleAttr(formId,'BOX_SN','IS_TITLE_ATTR',v)+"' >"+v['BOX_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IN_BOX' name='noprintset_IN_BOX' class='datagrid-cell "+ms.tdClass(formId, 'IN_BOX')+"' style='"+ms.tdStyle(formId, 'IN_BOX')+"' "+ms.tdEvent(formId, 'IN_BOX')+">")
            arrHtml.push("<span colno='IN_BOX' class='"+ms.uiClass(formId, 'IN_BOX')+"' style='"+ms.uiStyle(formId, 'IN_BOX')+"' "+ms.uiEvent(formId, 'IN_BOX')+" title='"+ms.titleAttr(formId,'IN_BOX','IS_TITLE_ATTR',v)+"' >"+v['IN_BOX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LOT_NUMBER' name='noprintset_LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'LOT_NUMBER')+"' style='"+ms.tdStyle(formId, 'LOT_NUMBER')+"' "+ms.tdEvent(formId, 'LOT_NUMBER')+">")
            arrHtml.push("<span colno='LOT_NUMBER' class='"+ms.uiClass(formId, 'LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'LOT_NUMBER')+"' "+ms.uiEvent(formId, 'LOT_NUMBER')+" title='"+ms.titleAttr(formId,'LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['LOT_NUMBER']+"</span>")
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//工单信息
function itemJump1(obj){
      winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//产品追溯
function itemJump3(obj){
    winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
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
