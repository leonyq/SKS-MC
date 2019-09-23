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
		<dict:lang value="SPI测试信息" />
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
		<bu:header formId ="b04a5bfab87c479a8db180b069a13b50"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    <style>
    .none{
        display:none;
    }
    </style>
	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>
    <script type = "text/javascript" src = "${path}plf/page/timer/perforMonit/js/echarts.min.js"></script>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="a2229f4401544682ba960b0437ac2bc4" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="a2229f4401544682ba960b0437ac2bc4" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageb04a5bfab87c479a8db180b069a13b50" id="formPageb04a5bfab87c479a8db180b069a13b50" value="${formPageb04a5bfab87c479a8db180b069a13b50}"/>
		<input type="hidden" name="formId" id="formId1" value='b04a5bfab87c479a8db180b069a13b50'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="datagrid datagrid-div1" id="b04a5bfab87c479a8db180b069a13b50">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb04a5bfab87c479a8db180b069a13b50">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb04a5bfab87c479a8db180b069a13b50">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb04a5bfab87c479a8db180b069a13b50">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="b04a5bfab87c479a8db180b069a13b50" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b04a5bfab87c479a8db180b069a13b50" onclick="_selectAjaxTableAllData(this,'b04a5bfab87c479a8db180b069a13b50')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_RESULTINFILENAME" style="width:80px"  class="datagrid-cell"><bu:uitn colNo="RESULTINFILENAME" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_PROGRAMNAME" style="width:160px" class="datagrid-cell"><bu:uitn colNo="PROGRAMNAME" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_PRODUCTIONLINE" style="width:80px"  class="datagrid-cell none"><bu:uitn colNo="PRODUCTIONLINE" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_OPERATOR" style="width:80px"  class="datagrid-cell"><bu:uitn colNo="OPERATOR" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_NGCOUNT" style="width:80px"  class="datagrid-cell"><bu:uitn colNo="NGCOUNT" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_MACHINENAME" style="width:190px"  class="datagrid-cell"><bu:uitn colNo="MACHINENAME" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_INSPECTAT"  style="width:130px" class="datagrid-cell"><bu:uitn colNo="INSPECTAT" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_BARCODE"  style="width:130px"  class="datagrid-cell"><bu:uitn colNo="BARCODE" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_AREA_NAME" style="width:80px"  class="datagrid-cell"><bu:uitn colNo="AREA_NAME" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_MO_NUMBER"   style="width:180px"  class="datagrid-cell"><bu:uitn colNo="MO_NUMBER" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
			<td name="noprintset_TOTAL_COUNT" style="width:80px"  class="datagrid-cell"><bu:uitn colNo="TOTAL_COUNT" formId="b04a5bfab87c479a8db180b069a13b50" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb04a5bfab87c479a8db180b069a13b50" onscroll="ajaxTableScroll(this,'b04a5bfab87c479a8db180b069a13b50')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb04a5bfab87c479a8db180b069a13b50">
		<tbody id="tbody_b04a5bfab87c479a8db180b069a13b50" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb04a5bfab87c479a8db180b069a13b50==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b04a5bfab87c479a8db180b069a13b50&showLoading=0" />
			</div>
		</c:if>
 <div id="printset_div"  style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('b04a5bfab87c479a8db180b069a13b50','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>测试结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RESULTINFILENAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RESULTINFILENAME" value="" title_name="测试结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>程序名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROGRAMNAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROGRAMNAME" value="" title_name="程序名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产线别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCTIONLINE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCTIONLINE" value="" title_name="生产线别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>操作人</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OPERATOR" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OPERATOR" value="" title_name="操作人" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>不良数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NGCOUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NGCOUNT" value="" title_name="不良数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机器名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MACHINENAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MACHINENAME" value="" title_name="机器名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="INSPECTAT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="INSPECTAT" value="" title_name="时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>条码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="BARCODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="BARCODE" value="" title_name="条码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>线别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AREA_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AREA_NAME" value="" title_name="线别" />px
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
 <td style="width: 100px;text-align: right;"><span>焊点数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TOTAL_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TOTAL_COUNT" value="" title_name="焊点数" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
               
    
 <div class="chart_area" style="display:none;margin-top:20px;margin-left:10px;margin-right:10px;">
  <div id="echartsLine" style="width: 50%;float:left;height:250px;"></div>
  <div id="echartsPie" style="width: 50%;float:left;height:250px;"></div>
 </div>
            </div>
        </div>
    </div>
		<bu:submit viewId="a2229f4401544682ba960b0437ac2bc4" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="a2229f4401544682ba960b0437ac2bc4" />
    
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
    if(formId=='b04a5bfab87c479a8db180b069a13b50'){<%--SPI测试主表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESULTINFILENAME' name='noprintset_RESULTINFILENAME' class='datagrid-cell "+ms.tdClass(formId, 'RESULTINFILENAME')+"' style='"+ms.tdStyle(formId, 'RESULTINFILENAME')+"' "+ms.tdEvent(formId, 'RESULTINFILENAME')+">")
            arrHtml.push("<span colno='RESULTINFILENAME' class='"+ms.uiClass(formId, 'RESULTINFILENAME')+"' style='"+ms.uiStyle(formId, 'RESULTINFILENAME')+"' "+ms.uiEvent(formId, 'RESULTINFILENAME')+" title='"+ms.titleAttr(formId,'RESULTINFILENAME','IS_TITLE_ATTR',v)+"' >"+v['RESULTINFILENAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROGRAMNAME' name='noprintset_PROGRAMNAME' class='datagrid-cell "+ms.tdClass(formId, 'PROGRAMNAME')+"' style='"+ms.tdStyle(formId, 'PROGRAMNAME')+"' "+ms.tdEvent(formId, 'PROGRAMNAME')+">")
            arrHtml.push("<span colno='PROGRAMNAME' class='"+ms.uiClass(formId, 'PROGRAMNAME')+"' style='"+ms.uiStyle(formId, 'PROGRAMNAME')+"' "+ms.uiEvent(formId, 'PROGRAMNAME')+" title='"+ms.titleAttr(formId,'PROGRAMNAME','IS_TITLE_ATTR',v)+"' >"+v['PROGRAMNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCTIONLINE' name='noprintset_PRODUCTIONLINE' class='datagrid-cell none "+ms.tdClass(formId, 'PRODUCTIONLINE')+"' style='"+ms.tdStyle(formId, 'PRODUCTIONLINE')+"' "+ms.tdEvent(formId, 'PRODUCTIONLINE')+">")
            arrHtml.push("<span colno='PRODUCTIONLINE' class='"+ms.uiClass(formId, 'PRODUCTIONLINE')+"' style='"+ms.uiStyle(formId, 'PRODUCTIONLINE')+"' "+ms.uiEvent(formId, 'PRODUCTIONLINE')+" title='"+ms.titleAttr(formId,'PRODUCTIONLINE','IS_TITLE_ATTR',v)+"' >"+v['PRODUCTIONLINE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OPERATOR' name='noprintset_OPERATOR' class='datagrid-cell "+ms.tdClass(formId, 'OPERATOR')+"' style='"+ms.tdStyle(formId, 'OPERATOR')+"' "+ms.tdEvent(formId, 'OPERATOR')+">")
            arrHtml.push("<span colno='OPERATOR' class='"+ms.uiClass(formId, 'OPERATOR')+"' style='"+ms.uiStyle(formId, 'OPERATOR')+"' "+ms.uiEvent(formId, 'OPERATOR')+" title='"+ms.titleAttr(formId,'OPERATOR','IS_TITLE_ATTR',v)+"' >"+v['OPERATOR']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NGCOUNT' name='noprintset_NGCOUNT' class='datagrid-cell "+ms.tdClass(formId, 'NGCOUNT')+"' style='"+ms.tdStyle(formId, 'NGCOUNT')+"' "+ms.tdEvent(formId, 'NGCOUNT')+">")
            arrHtml.push("<span colno='NGCOUNT' class='"+ms.uiClass(formId, 'NGCOUNT')+"' style='"+ms.uiStyle(formId, 'NGCOUNT')+"' "+ms.uiEvent(formId, 'NGCOUNT')+" title='"+ms.titleAttr(formId,'NGCOUNT','IS_TITLE_ATTR',v)+"' >"+v['NGCOUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MACHINENAME' name='noprintset_MACHINENAME' class='datagrid-cell "+ms.tdClass(formId, 'MACHINENAME')+"' style='"+ms.tdStyle(formId, 'MACHINENAME')+"' "+ms.tdEvent(formId, 'MACHINENAME')+">")
            arrHtml.push("<span colno='MACHINENAME' class='"+ms.uiClass(formId, 'MACHINENAME')+"' style='"+ms.uiStyle(formId, 'MACHINENAME')+"' "+ms.uiEvent(formId, 'MACHINENAME')+" title='"+ms.titleAttr(formId,'MACHINENAME','IS_TITLE_ATTR',v)+"' >"+v['MACHINENAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='INSPECTAT' name='noprintset_INSPECTAT' class='datagrid-cell "+ms.tdClass(formId, 'INSPECTAT')+"' style='"+ms.tdStyle(formId, 'INSPECTAT')+"' "+ms.tdEvent(formId, 'INSPECTAT')+">")
            arrHtml.push("<span colno='INSPECTAT' class='"+ms.uiClass(formId, 'INSPECTAT')+"' style='"+ms.uiStyle(formId, 'INSPECTAT')+"' "+ms.uiEvent(formId, 'INSPECTAT')+" title='"+ms.titleAttr(formId,'INSPECTAT','IS_TITLE_ATTR',v)+"' >"+v['INSPECTAT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BARCODE' name='noprintset_BARCODE' class='datagrid-cell "+ms.tdClass(formId, 'BARCODE')+"' style='"+ms.tdStyle(formId, 'BARCODE')+"' "+ms.tdEvent(formId, 'BARCODE')+">")
            arrHtml.push("<span colno='BARCODE' class='"+ms.uiClass(formId, 'BARCODE')+"' style='"+ms.uiStyle(formId, 'BARCODE')+"' "+ms.uiEvent(formId, 'BARCODE')+" title='"+ms.titleAttr(formId,'BARCODE','IS_TITLE_ATTR',v)+"' >"+v['BARCODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NAME' name='noprintset_AREA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NAME')+"' style='"+ms.tdStyle(formId, 'AREA_NAME')+"' "+ms.tdEvent(formId, 'AREA_NAME')+">")
            arrHtml.push("<span colno='AREA_NAME' class='"+ms.uiClass(formId, 'AREA_NAME')+"' style='"+ms.uiStyle(formId, 'AREA_NAME')+"' "+ms.uiEvent(formId, 'AREA_NAME')+" title='"+ms.titleAttr(formId,'AREA_NAME','IS_TITLE_ATTR',v)+"' >"+v['AREA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' name='noprintset_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'MO_NUMBER')+"' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TOTAL_COUNT' name='noprintset_TOTAL_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'TOTAL_COUNT')+"' style='"+ms.tdStyle(formId, 'TOTAL_COUNT')+"' "+ms.tdEvent(formId, 'TOTAL_COUNT')+">")
            arrHtml.push("<span colno='TOTAL_COUNT' class='"+ms.uiClass(formId, 'TOTAL_COUNT')+"' style='"+ms.uiStyle(formId, 'TOTAL_COUNT')+"' "+ms.uiEvent(formId, 'TOTAL_COUNT')+" title='"+ms.titleAttr(formId,'TOTAL_COUNT','IS_TITLE_ATTR',v)+"' >"+v['TOTAL_COUNT']+"</span>")
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
    if(formId=='b04a5bfab87c479a8db180b069a13b50'){<%--SPI测试主表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='RESULTINFILENAME' name='noprintset_RESULTINFILENAME' class='datagrid-cell "+ms.tdClass(formId, 'RESULTINFILENAME')+"' style='"+ms.tdStyle(formId, 'RESULTINFILENAME')+"' "+ms.tdEvent(formId, 'RESULTINFILENAME')+">")
            arrHtml.push("<span colno='RESULTINFILENAME' class='"+ms.uiClass(formId, 'RESULTINFILENAME')+"' style='"+ms.uiStyle(formId, 'RESULTINFILENAME')+"' "+ms.uiEvent(formId, 'RESULTINFILENAME')+" title='"+ms.titleAttr(formId,'RESULTINFILENAME','IS_TITLE_ATTR',v)+"' >"+v['RESULTINFILENAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROGRAMNAME' name='noprintset_PROGRAMNAME' class='datagrid-cell "+ms.tdClass(formId, 'PROGRAMNAME')+"' style='"+ms.tdStyle(formId, 'PROGRAMNAME')+"' "+ms.tdEvent(formId, 'PROGRAMNAME')+">")
            arrHtml.push("<span colno='PROGRAMNAME' class='"+ms.uiClass(formId, 'PROGRAMNAME')+"' style='"+ms.uiStyle(formId, 'PROGRAMNAME')+"' "+ms.uiEvent(formId, 'PROGRAMNAME')+" title='"+ms.titleAttr(formId,'PROGRAMNAME','IS_TITLE_ATTR',v)+"' >"+v['PROGRAMNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PRODUCTIONLINE' name='noprintset_PRODUCTIONLINE' class='datagrid-cell none "+ms.tdClass(formId, 'PRODUCTIONLINE')+"' style='"+ms.tdStyle(formId, 'PRODUCTIONLINE')+"' "+ms.tdEvent(formId, 'PRODUCTIONLINE')+">")
            arrHtml.push("<span colno='PRODUCTIONLINE' class='"+ms.uiClass(formId, 'PRODUCTIONLINE')+"' style='"+ms.uiStyle(formId, 'PRODUCTIONLINE')+"' "+ms.uiEvent(formId, 'PRODUCTIONLINE')+" title='"+ms.titleAttr(formId,'PRODUCTIONLINE','IS_TITLE_ATTR',v)+"' >"+v['PRODUCTIONLINE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OPERATOR' name='noprintset_OPERATOR' class='datagrid-cell "+ms.tdClass(formId, 'OPERATOR')+"' style='"+ms.tdStyle(formId, 'OPERATOR')+"' "+ms.tdEvent(formId, 'OPERATOR')+">")
            arrHtml.push("<span colno='OPERATOR' class='"+ms.uiClass(formId, 'OPERATOR')+"' style='"+ms.uiStyle(formId, 'OPERATOR')+"' "+ms.uiEvent(formId, 'OPERATOR')+" title='"+ms.titleAttr(formId,'OPERATOR','IS_TITLE_ATTR',v)+"' >"+v['OPERATOR']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NGCOUNT' name='noprintset_NGCOUNT' class='datagrid-cell "+ms.tdClass(formId, 'NGCOUNT')+"' style='"+ms.tdStyle(formId, 'NGCOUNT')+"' "+ms.tdEvent(formId, 'NGCOUNT')+">")
            arrHtml.push("<span colno='NGCOUNT' class='"+ms.uiClass(formId, 'NGCOUNT')+"' style='"+ms.uiStyle(formId, 'NGCOUNT')+"' "+ms.uiEvent(formId, 'NGCOUNT')+" title='"+ms.titleAttr(formId,'NGCOUNT','IS_TITLE_ATTR',v)+"' >"+v['NGCOUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MACHINENAME' name='noprintset_MACHINENAME' class='datagrid-cell "+ms.tdClass(formId, 'MACHINENAME')+"' style='"+ms.tdStyle(formId, 'MACHINENAME')+"' "+ms.tdEvent(formId, 'MACHINENAME')+">")
            arrHtml.push("<span colno='MACHINENAME' class='"+ms.uiClass(formId, 'MACHINENAME')+"' style='"+ms.uiStyle(formId, 'MACHINENAME')+"' "+ms.uiEvent(formId, 'MACHINENAME')+" title='"+ms.titleAttr(formId,'MACHINENAME','IS_TITLE_ATTR',v)+"' >"+v['MACHINENAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='INSPECTAT' name='noprintset_INSPECTAT' class='datagrid-cell "+ms.tdClass(formId, 'INSPECTAT')+"' style='"+ms.tdStyle(formId, 'INSPECTAT')+"' "+ms.tdEvent(formId, 'INSPECTAT')+">")
            arrHtml.push("<span colno='INSPECTAT' class='"+ms.uiClass(formId, 'INSPECTAT')+"' style='"+ms.uiStyle(formId, 'INSPECTAT')+"' "+ms.uiEvent(formId, 'INSPECTAT')+" title='"+ms.titleAttr(formId,'INSPECTAT','IS_TITLE_ATTR',v)+"' >"+v['INSPECTAT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BARCODE' name='noprintset_BARCODE' class='datagrid-cell "+ms.tdClass(formId, 'BARCODE')+"' style='"+ms.tdStyle(formId, 'BARCODE')+"' "+ms.tdEvent(formId, 'BARCODE')+">")
            arrHtml.push("<span colno='BARCODE' class='"+ms.uiClass(formId, 'BARCODE')+"' style='"+ms.uiStyle(formId, 'BARCODE')+"' "+ms.uiEvent(formId, 'BARCODE')+" title='"+ms.titleAttr(formId,'BARCODE','IS_TITLE_ATTR',v)+"' >"+v['BARCODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NAME' name='noprintset_AREA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NAME')+"' style='"+ms.tdStyle(formId, 'AREA_NAME')+"' "+ms.tdEvent(formId, 'AREA_NAME')+">")
            arrHtml.push("<span colno='AREA_NAME' class='"+ms.uiClass(formId, 'AREA_NAME')+"' style='"+ms.uiStyle(formId, 'AREA_NAME')+"' "+ms.uiEvent(formId, 'AREA_NAME')+" title='"+ms.titleAttr(formId,'AREA_NAME','IS_TITLE_ATTR',v)+"' >"+v['AREA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' name='noprintset_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'MO_NUMBER')+"' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TOTAL_COUNT' name='noprintset_TOTAL_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'TOTAL_COUNT')+"' style='"+ms.tdStyle(formId, 'TOTAL_COUNT')+"' "+ms.tdEvent(formId, 'TOTAL_COUNT')+">")
            arrHtml.push("<span colno='TOTAL_COUNT' class='"+ms.uiClass(formId, 'TOTAL_COUNT')+"' style='"+ms.uiStyle(formId, 'TOTAL_COUNT')+"' "+ms.uiEvent(formId, 'TOTAL_COUNT')+" title='"+ms.titleAttr(formId,'TOTAL_COUNT','IS_TITLE_ATTR',v)+"' >"+v['TOTAL_COUNT']+"</span>")
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
<script>

    
var echartsPie;
var echartsLine;
$(function(){
    $('.datagrid-div1').height($(window).height()-170);
  	echartsLine = echarts.init(document.getElementById('echartsLine'));
    echartsLine.setOption({
        title: {
            text: '数据统计'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['高度（um微米）', '面积（(cm^2)*100）', '体积（(cm^3)*1000）']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                //saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: []
        },
        yAxis: {
            type: 'value'
        },
    
        series: [
            {
                name: "高度（um微米）",
                type: 'line',
                data: []
            },
            {
                name: "面积（(cm^2)*100）",
                type: 'line',
                data: []
            },
            {
                name: "体积（(cm^3)*1000）",
                type: 'line',
                data: []
            }
    
        ]
    });
    echartsPie = echarts.init(document.getElementById('echartsPie'));
    echartsPie.setOption({
        title: {
            text: '测试结果',
            x: 'center'
        },
        tooltip: {
            trigger: 'item', 
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {  
            bottom: 10,
            left: 'center',
            data: ['OK数量', 'WARN数量', 'NG数量']
        },
        toolbox: {
            show: true,
            feature: {
                mark: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: true,
        series: [
            {
                title: "",
                type: 'pie',
                radius: '55%',//饼图的半径大小  
                center: ['50%', '50%'],//饼图的位置  
                data: []
            }
        ]
    });    
});

function query(){
    queryPie();
    queryLine();
    listAjaxTable($("#formId1").val());
}
function queryPie(){ 
    var dataUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=25f02fcec5a944158ee255b7dc1fb9f4";  //VM-SPI测试信息 操作功能 查询饼图
    var json=null; 
    echartsPie.showLoading();
    $.ajax({
     type: "POST",
        dataType: "json",
        url: dataUrl,
        data: { mo_number:$("#MO_NUMBER").val(),
                area_name:$("#AREA_NAME").val(),
                programname:$("#PROGRAMNAME").val(),
                resultinfilename:$("#RESULTINFILENAME").val()
        },
        success:function(data){
            if(null == data){
                return ;
            }  
            echartsPie.hideLoading();
            if("" != data.ajaxList){ 
            	var dateList = eval(data.ajaxList);
            	var ok_count=0,ng_count=0,wn_count=0;
                for(var i = 0;i < dateList.length; i++){
                	ok_count+=dateList[i].OK_COUNT;
                	ng_count+=dateList[i].NG_COUNT;
                	wn_count+=dateList[i].WN_COUNT;
                }
                json = [
                            {
                                value: ok_count, name: 'OK数量',
                                itemStyle: {
                                    normal: { color: '#6aa84f' }
                                }
                            },
                            {
                                value: ng_count, name: 'NG数量',
                                itemStyle: {
                                    normal: { color: '#a61c00' }
                                }
                            },
                            {
                                value: wn_count, name: 'WARN数量',
                                itemStyle: {
                                    normal: { color: '#ff9900' }
                                }
                            }];
             }else{
                 json = [];
             }
            echartsPie.setOption({
                        series: [{
                            // 根据名字对应到相应的系列
                            data: json
                        }]
                    });
            
          
            
        }
     
    });
}
function queryLine(){
    
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
