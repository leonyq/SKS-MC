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
		<dict:lang value="手插料关联记录" />
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
		<bu:header formId ="8c048b8e35874c168fbff6ab0fee4d69"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	<script>
	   function showMessage(){
	       
	   }
	   function getMoItem(){}
	</script>
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="b42c41aeb3024789bd2aeeb0bac38461" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="b42c41aeb3024789bd2aeeb0bac38461" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage8c048b8e35874c168fbff6ab0fee4d69" id="formPage8c048b8e35874c168fbff6ab0fee4d69" value="${formPage8c048b8e35874c168fbff6ab0fee4d69}"/>
		<input type="hidden" name="formId" id="formId1" value='8c048b8e35874c168fbff6ab0fee4d69'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="8c048b8e35874c168fbff6ab0fee4d69">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax8c048b8e35874c168fbff6ab0fee4d69" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner8c048b8e35874c168fbff6ab0fee4d69">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable8c048b8e35874c168fbff6ab0fee4d69">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="8c048b8e35874c168fbff6ab0fee4d69" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_8c048b8e35874c168fbff6ab0fee4d69" onclick="_selectAjaxTableAllData(this,'8c048b8e35874c168fbff6ab0fee4d69')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_WHL_MO_NUMBER" style="width:180px; " class="datagrid-cell"><bu:uitn colNo="WHL_MO_NUMBER" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_WHL_SN" style="width:130px; " class="datagrid-cell"><bu:uitn colNo="WHL_SN" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_WHL_ITEM_SN" style="width:230px; " class="datagrid-cell"><bu:uitn colNo="WHL_ITEM_SN" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_WHL_POINT" style="width:130px; " class="datagrid-cell"><bu:uitn colNo="WHL_POINT" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_WHL_ITEM_CODE" style="width:130px; " class="datagrid-cell"><bu:uitn colNo="WHL_ITEM_CODE" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_WHL_ITEM_LOT" style="width:80px; " class="datagrid-cell"><bu:uitn colNo="WHL_ITEM_LOT" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_WHL_ITEM_NUM" style="width:80px; " class="datagrid-cell"><bu:uitn colNo="WHL_ITEM_NUM" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_WHL_POINT_NUM" style="width:80px; " class="datagrid-cell"><bu:uitn colNo="WHL_POINT_NUM" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_WHL_WORKCENTER" style="width:80px; " class="datagrid-cell"><bu:uitn colNo="WHL_WORKCENTER" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_CREATE_USER" style="width:80px; " class="datagrid-cell"><bu:uitn colNo="CREATE_USER" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<td name="noprintset_CREATE_TIME" style="width:130px; " class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv8c048b8e35874c168fbff6ab0fee4d69" onscroll="ajaxTableScroll(this,'8c048b8e35874c168fbff6ab0fee4d69')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax8c048b8e35874c168fbff6ab0fee4d69">
		<tbody id="tbody_8c048b8e35874c168fbff6ab0fee4d69" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage8c048b8e35874c168fbff6ab0fee4d69==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=8c048b8e35874c168fbff6ab0fee4d69&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('8c048b8e35874c168fbff6ab0fee4d69','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>制令单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_MO_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_MO_NUMBER" value="" title_name="制令单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>产品SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_SN" value="" title_name="产品SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_ITEM_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_ITEM_SN" value="" title_name="物料SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>点位</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_POINT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_POINT" value="" title_name="点位" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_ITEM_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_ITEM_CODE" value="" title_name="料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?物料批次号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_ITEM_LOT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_ITEM_LOT" value="" title_name="?物料批次号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_ITEM_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_ITEM_NUM" value="" title_name="物料数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>点数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_POINT_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_POINT_NUM" value="" title_name="点数" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工作中心</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WHL_WORKCENTER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WHL_WORKCENTER" value="" title_name="工作中心" />px
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
		<bu:submit viewId="b42c41aeb3024789bd2aeeb0bac38461" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="b42c41aeb3024789bd2aeeb0bac38461" />
    
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
    if(formId=='8c048b8e35874c168fbff6ab0fee4d69'){<%--手插料记录--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_MO_NUMBER' name='noprintset_WHL_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WHL_MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'WHL_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WHL_MO_NUMBER')+">")
            arrHtml.push("<span colno='WHL_MO_NUMBER' class='"+ms.uiClass(formId, 'WHL_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WHL_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WHL_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WHL_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WHL_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_SN' name='noprintset_WHL_SN' class='datagrid-cell "+ms.tdClass(formId, 'WHL_SN')+"' style='"+ms.tdStyle(formId, 'WHL_SN')+"' "+ms.tdEvent(formId, 'WHL_SN')+">")
            arrHtml.push("<span colno='WHL_SN' class='"+ms.uiClass(formId, 'WHL_SN')+"' style='"+ms.uiStyle(formId, 'WHL_SN')+"' "+ms.uiEvent(formId, 'WHL_SN')+" title='"+ms.titleAttr(formId,'WHL_SN','IS_TITLE_ATTR',v)+"' >"+v['WHL_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_ITEM_SN' name='noprintset_WHL_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WHL_ITEM_SN')+"' style='"+ms.tdStyle(formId, 'WHL_ITEM_SN')+"' "+ms.tdEvent(formId, 'WHL_ITEM_SN')+">")
            arrHtml.push("<span colno='WHL_ITEM_SN' class='"+ms.uiClass(formId, 'WHL_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WHL_ITEM_SN')+"' "+ms.uiEvent(formId, 'WHL_ITEM_SN')+" title='"+ms.titleAttr(formId,'WHL_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WHL_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_POINT' name='noprintset_WHL_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WHL_POINT')+"' style='"+ms.tdStyle(formId, 'WHL_POINT')+"' "+ms.tdEvent(formId, 'WHL_POINT')+">")
            arrHtml.push("<span colno='WHL_POINT' class='"+ms.uiClass(formId, 'WHL_POINT')+"' style='"+ms.uiStyle(formId, 'WHL_POINT')+"' "+ms.uiEvent(formId, 'WHL_POINT')+" title='"+ms.titleAttr(formId,'WHL_POINT','IS_TITLE_ATTR',v)+"' >"+v['WHL_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_ITEM_CODE' name='noprintset_WHL_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WHL_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WHL_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WHL_ITEM_CODE')+">")
            arrHtml.push("<span colno='WHL_ITEM_CODE' class='"+ms.uiClass(formId, 'WHL_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WHL_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WHL_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WHL_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WHL_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_ITEM_LOT' name='noprintset_WHL_ITEM_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WHL_ITEM_LOT')+"' style='"+ms.tdStyle(formId, 'WHL_ITEM_LOT')+"' "+ms.tdEvent(formId, 'WHL_ITEM_LOT')+">")
            arrHtml.push("<span colno='WHL_ITEM_LOT' class='"+ms.uiClass(formId, 'WHL_ITEM_LOT')+"' style='"+ms.uiStyle(formId, 'WHL_ITEM_LOT')+"' "+ms.uiEvent(formId, 'WHL_ITEM_LOT')+" title='"+ms.titleAttr(formId,'WHL_ITEM_LOT','IS_TITLE_ATTR',v)+"' >"+v['WHL_ITEM_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_ITEM_NUM' name='noprintset_WHL_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WHL_ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'WHL_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WHL_ITEM_NUM')+">")
            arrHtml.push("<span colno='WHL_ITEM_NUM' class='"+ms.uiClass(formId, 'WHL_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WHL_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WHL_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WHL_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WHL_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_POINT_NUM' name='noprintset_WHL_POINT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WHL_POINT_NUM')+"' style='"+ms.tdStyle(formId, 'WHL_POINT_NUM')+"' "+ms.tdEvent(formId, 'WHL_POINT_NUM')+">")
            arrHtml.push("<span colno='WHL_POINT_NUM' class='"+ms.uiClass(formId, 'WHL_POINT_NUM')+"' style='"+ms.uiStyle(formId, 'WHL_POINT_NUM')+"' "+ms.uiEvent(formId, 'WHL_POINT_NUM')+" title='"+ms.titleAttr(formId,'WHL_POINT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WHL_POINT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_WORKCENTER' name='noprintset_WHL_WORKCENTER' class='datagrid-cell "+ms.tdClass(formId, 'WHL_WORKCENTER')+"' style='"+ms.tdStyle(formId, 'WHL_WORKCENTER')+"' "+ms.tdEvent(formId, 'WHL_WORKCENTER')+">")
            arrHtml.push("<span colno='WHL_WORKCENTER' class='"+ms.uiClass(formId, 'WHL_WORKCENTER')+"' style='"+ms.uiStyle(formId, 'WHL_WORKCENTER')+"' "+ms.uiEvent(formId, 'WHL_WORKCENTER')+" title='"+ms.titleAttr(formId,'WHL_WORKCENTER','IS_TITLE_ATTR',v)+"' >"+v['WHL_WORKCENTER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
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
    if(formId=='8c048b8e35874c168fbff6ab0fee4d69'){<%--手插料记录--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='WHL_MO_NUMBER' name='noprintset_WHL_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WHL_MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'WHL_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WHL_MO_NUMBER')+">")
            arrHtml.push("<span colno='WHL_MO_NUMBER' class='"+ms.uiClass(formId, 'WHL_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WHL_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WHL_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WHL_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WHL_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_SN' name='noprintset_WHL_SN' class='datagrid-cell "+ms.tdClass(formId, 'WHL_SN')+"' style='"+ms.tdStyle(formId, 'WHL_SN')+"' "+ms.tdEvent(formId, 'WHL_SN')+">")
            arrHtml.push("<span colno='WHL_SN' class='"+ms.uiClass(formId, 'WHL_SN')+"' style='"+ms.uiStyle(formId, 'WHL_SN')+"' "+ms.uiEvent(formId, 'WHL_SN')+" title='"+ms.titleAttr(formId,'WHL_SN','IS_TITLE_ATTR',v)+"' >"+v['WHL_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_ITEM_SN' name='noprintset_WHL_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WHL_ITEM_SN')+"' style='"+ms.tdStyle(formId, 'WHL_ITEM_SN')+"' "+ms.tdEvent(formId, 'WHL_ITEM_SN')+">")
            arrHtml.push("<span colno='WHL_ITEM_SN' class='"+ms.uiClass(formId, 'WHL_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WHL_ITEM_SN')+"' "+ms.uiEvent(formId, 'WHL_ITEM_SN')+" title='"+ms.titleAttr(formId,'WHL_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WHL_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_POINT' name='noprintset_WHL_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WHL_POINT')+"' style='"+ms.tdStyle(formId, 'WHL_POINT')+"' "+ms.tdEvent(formId, 'WHL_POINT')+">")
            arrHtml.push("<span colno='WHL_POINT' class='"+ms.uiClass(formId, 'WHL_POINT')+"' style='"+ms.uiStyle(formId, 'WHL_POINT')+"' "+ms.uiEvent(formId, 'WHL_POINT')+" title='"+ms.titleAttr(formId,'WHL_POINT','IS_TITLE_ATTR',v)+"' >"+v['WHL_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_ITEM_CODE' name='noprintset_WHL_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WHL_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WHL_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WHL_ITEM_CODE')+">")
            arrHtml.push("<span colno='WHL_ITEM_CODE' class='"+ms.uiClass(formId, 'WHL_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WHL_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WHL_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WHL_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WHL_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_ITEM_LOT' name='noprintset_WHL_ITEM_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WHL_ITEM_LOT')+"' style='"+ms.tdStyle(formId, 'WHL_ITEM_LOT')+"' "+ms.tdEvent(formId, 'WHL_ITEM_LOT')+">")
            arrHtml.push("<span colno='WHL_ITEM_LOT' class='"+ms.uiClass(formId, 'WHL_ITEM_LOT')+"' style='"+ms.uiStyle(formId, 'WHL_ITEM_LOT')+"' "+ms.uiEvent(formId, 'WHL_ITEM_LOT')+" title='"+ms.titleAttr(formId,'WHL_ITEM_LOT','IS_TITLE_ATTR',v)+"' >"+v['WHL_ITEM_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_ITEM_NUM' name='noprintset_WHL_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WHL_ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'WHL_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WHL_ITEM_NUM')+">")
            arrHtml.push("<span colno='WHL_ITEM_NUM' class='"+ms.uiClass(formId, 'WHL_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WHL_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WHL_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WHL_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WHL_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_POINT_NUM' name='noprintset_WHL_POINT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WHL_POINT_NUM')+"' style='"+ms.tdStyle(formId, 'WHL_POINT_NUM')+"' "+ms.tdEvent(formId, 'WHL_POINT_NUM')+">")
            arrHtml.push("<span colno='WHL_POINT_NUM' class='"+ms.uiClass(formId, 'WHL_POINT_NUM')+"' style='"+ms.uiStyle(formId, 'WHL_POINT_NUM')+"' "+ms.uiEvent(formId, 'WHL_POINT_NUM')+" title='"+ms.titleAttr(formId,'WHL_POINT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WHL_POINT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WHL_WORKCENTER' name='noprintset_WHL_WORKCENTER' class='datagrid-cell "+ms.tdClass(formId, 'WHL_WORKCENTER')+"' style='"+ms.tdStyle(formId, 'WHL_WORKCENTER')+"' "+ms.tdEvent(formId, 'WHL_WORKCENTER')+">")
            arrHtml.push("<span colno='WHL_WORKCENTER' class='"+ms.uiClass(formId, 'WHL_WORKCENTER')+"' style='"+ms.uiStyle(formId, 'WHL_WORKCENTER')+"' "+ms.uiEvent(formId, 'WHL_WORKCENTER')+" title='"+ms.titleAttr(formId,'WHL_WORKCENTER','IS_TITLE_ATTR',v)+"' >"+v['WHL_WORKCENTER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
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
