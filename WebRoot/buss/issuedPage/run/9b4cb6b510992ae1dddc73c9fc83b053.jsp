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
		<dict:lang value="物料信息_Test" />
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
		<bu:header formId ="013c4606017841b6b4e7f01e2a32d0a6"/>

    
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
		<bu:func viewId="10cd13d5d95b4b308c678c053360cc7c" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="10cd13d5d95b4b308c678c053360cc7c" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage013c4606017841b6b4e7f01e2a32d0a6" id="formPage013c4606017841b6b4e7f01e2a32d0a6" value="${formPage013c4606017841b6b4e7f01e2a32d0a6}"/>
		<input type="hidden" name="formId" id="formId1" value='013c4606017841b6b4e7f01e2a32d0a6'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="013c4606017841b6b4e7f01e2a32d0a6">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax013c4606017841b6b4e7f01e2a32d0a6" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner013c4606017841b6b4e7f01e2a32d0a6">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable013c4606017841b6b4e7f01e2a32d0a6">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="013c4606017841b6b4e7f01e2a32d0a6" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_013c4606017841b6b4e7f01e2a32d0a6" onclick="_selectAjaxTableAllData(this,'013c4606017841b6b4e7f01e2a32d0a6')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_CI_ITEM_CODE" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<td name="noprintset_CI_ITEM_NAME" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<td name="noprintset_CI_ITEM_SPEC" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<td name="noprintset_CI_ITEM_TYPE" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<td name="noprintset_CI_ITEM_GENRE" class="datagrid-cell"><bu:uitn colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<td name="noprintset_CI_MIN_PACK" class="datagrid-cell"><bu:uitn colNo="CI_MIN_PACK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<td name="noprintset_CI_SUPPLIER_CODE" class="datagrid-cell"><bu:uitn colNo="CI_SUPPLIER_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
			<td name="noprintset_CI_CONTRAL_TYPE" class="datagrid-cell"><bu:uitn colNo="CI_CONTRAL_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv013c4606017841b6b4e7f01e2a32d0a6" onscroll="ajaxTableScroll(this,'013c4606017841b6b4e7f01e2a32d0a6')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax013c4606017841b6b4e7f01e2a32d0a6">
		<tbody id="tbody_013c4606017841b6b4e7f01e2a32d0a6" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage013c4606017841b6b4e7f01e2a32d0a6==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=013c4606017841b6b4e7f01e2a32d0a6&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('013c4606017841b6b4e7f01e2a32d0a6','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_ITEM_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_ITEM_CODE" value="" title_name="料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>品名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_ITEM_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_ITEM_NAME" value="" title_name="品名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>规格</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_ITEM_SPEC" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_ITEM_SPEC" value="" title_name="规格" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_ITEM_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_ITEM_TYPE" value="" title_name="物料类型" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料类别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_ITEM_GENRE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_ITEM_GENRE" value="" title_name="物料类别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>最小包装量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_MIN_PACK" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_MIN_PACK" value="" title_name="最小包装量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>录入人</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CREATE_USER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CREATE_USER" value="" title_name="录入人" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>录入时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CREATE_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CREATE_TIME" value="" title_name="录入时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>最后修改时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="EDIT_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="EDIT_TIME" value="" title_name="最后修改时间" />px
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
 <td style="width: 100px;text-align: right;"><span>修改人</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="EDIT_USER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="EDIT_USER" value="" title_name="修改人" />px
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
 <tr>
 <td style="width: 100px;text-align: right;"><span>供应商</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_SUPPLIER_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_SUPPLIER_CODE" value="" title_name="供应商" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>管控类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CI_CONTRAL_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CI_CONTRAL_TYPE" value="" title_name="管控类型" />px
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
		<bu:submit viewId="10cd13d5d95b4b308c678c053360cc7c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="10cd13d5d95b4b308c678c053360cc7c" />
    
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
    if(formId=='013c4606017841b6b4e7f01e2a32d0a6'){<%--物料信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_CODE' name='noprintset_CI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CI_ITEM_CODE')+">")
            arrHtml.push("<span colno='CI_ITEM_CODE' class='"+ms.uiClass(formId, 'CI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_NAME' name='noprintset_CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='CI_ITEM_NAME' class='"+ms.uiClass(formId, 'CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_SPEC' name='noprintset_CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_TYPE' name='noprintset_CI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_GENRE' name='noprintset_CI_ITEM_GENRE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_GENRE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_GENRE')+"' "+ms.tdEvent(formId, 'CI_ITEM_GENRE')+">")
            arrHtml.push("<span colno='CI_ITEM_GENRE' class='"+ms.uiClass(formId, 'CI_ITEM_GENRE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_GENRE')+"' "+ms.uiEvent(formId, 'CI_ITEM_GENRE')+" title='"+ms.titleAttr(formId,'CI_ITEM_GENRE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_GENRE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_MIN_PACK' name='noprintset_CI_MIN_PACK' class='datagrid-cell "+ms.tdClass(formId, 'CI_MIN_PACK')+"' style='"+ms.tdStyle(formId, 'CI_MIN_PACK')+"' "+ms.tdEvent(formId, 'CI_MIN_PACK')+">")
            arrHtml.push("<span colno='CI_MIN_PACK' class='"+ms.uiClass(formId, 'CI_MIN_PACK')+"' style='"+ms.uiStyle(formId, 'CI_MIN_PACK')+"' "+ms.uiEvent(formId, 'CI_MIN_PACK')+" title='"+ms.titleAttr(formId,'CI_MIN_PACK','IS_TITLE_ATTR',v)+"' >"+v['CI_MIN_PACK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_SUPPLIER_CODE' name='noprintset_CI_SUPPLIER_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CI_SUPPLIER_CODE')+"' style='"+ms.tdStyle(formId, 'CI_SUPPLIER_CODE')+"' "+ms.tdEvent(formId, 'CI_SUPPLIER_CODE')+">")
            arrHtml.push("<span colno='CI_SUPPLIER_CODE' class='"+ms.uiClass(formId, 'CI_SUPPLIER_CODE')+"' style='"+ms.uiStyle(formId, 'CI_SUPPLIER_CODE')+"' "+ms.uiEvent(formId, 'CI_SUPPLIER_CODE')+" title='"+ms.titleAttr(formId,'CI_SUPPLIER_CODE','IS_TITLE_ATTR',v)+"' >"+v['CI_SUPPLIER_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_CONTRAL_TYPE' name='noprintset_CI_CONTRAL_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CI_CONTRAL_TYPE')+"' style='"+ms.tdStyle(formId, 'CI_CONTRAL_TYPE')+"' "+ms.tdEvent(formId, 'CI_CONTRAL_TYPE')+">")
            arrHtml.push("<span colno='CI_CONTRAL_TYPE' class='"+ms.uiClass(formId, 'CI_CONTRAL_TYPE')+"' style='"+ms.uiStyle(formId, 'CI_CONTRAL_TYPE')+"' "+ms.uiEvent(formId, 'CI_CONTRAL_TYPE')+" title='"+ms.titleAttr(formId,'CI_CONTRAL_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CI_CONTRAL_TYPE']+"</span>")
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
    if(formId=='013c4606017841b6b4e7f01e2a32d0a6'){<%--物料信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='CI_ITEM_CODE' name='noprintset_CI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CI_ITEM_CODE')+">")
            arrHtml.push("<span colno='CI_ITEM_CODE' class='"+ms.uiClass(formId, 'CI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_NAME' name='noprintset_CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CI_ITEM_NAME')+">")
            arrHtml.push("<span colno='CI_ITEM_NAME' class='"+ms.uiClass(formId, 'CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_SPEC' name='noprintset_CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'CI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_TYPE' name='noprintset_CI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_ITEM_GENRE' name='noprintset_CI_ITEM_GENRE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_GENRE')+"' style='"+ms.tdStyle(formId, 'CI_ITEM_GENRE')+"' "+ms.tdEvent(formId, 'CI_ITEM_GENRE')+">")
            arrHtml.push("<span colno='CI_ITEM_GENRE' class='"+ms.uiClass(formId, 'CI_ITEM_GENRE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_GENRE')+"' "+ms.uiEvent(formId, 'CI_ITEM_GENRE')+" title='"+ms.titleAttr(formId,'CI_ITEM_GENRE','IS_TITLE_ATTR',v)+"' >"+v['CI_ITEM_GENRE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_MIN_PACK' name='noprintset_CI_MIN_PACK' class='datagrid-cell "+ms.tdClass(formId, 'CI_MIN_PACK')+"' style='"+ms.tdStyle(formId, 'CI_MIN_PACK')+"' "+ms.tdEvent(formId, 'CI_MIN_PACK')+">")
            arrHtml.push("<span colno='CI_MIN_PACK' class='"+ms.uiClass(formId, 'CI_MIN_PACK')+"' style='"+ms.uiStyle(formId, 'CI_MIN_PACK')+"' "+ms.uiEvent(formId, 'CI_MIN_PACK')+" title='"+ms.titleAttr(formId,'CI_MIN_PACK','IS_TITLE_ATTR',v)+"' >"+v['CI_MIN_PACK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_SUPPLIER_CODE' name='noprintset_CI_SUPPLIER_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CI_SUPPLIER_CODE')+"' style='"+ms.tdStyle(formId, 'CI_SUPPLIER_CODE')+"' "+ms.tdEvent(formId, 'CI_SUPPLIER_CODE')+">")
            arrHtml.push("<span colno='CI_SUPPLIER_CODE' class='"+ms.uiClass(formId, 'CI_SUPPLIER_CODE')+"' style='"+ms.uiStyle(formId, 'CI_SUPPLIER_CODE')+"' "+ms.uiEvent(formId, 'CI_SUPPLIER_CODE')+" title='"+ms.titleAttr(formId,'CI_SUPPLIER_CODE','IS_TITLE_ATTR',v)+"' >"+v['CI_SUPPLIER_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CI_CONTRAL_TYPE' name='noprintset_CI_CONTRAL_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CI_CONTRAL_TYPE')+"' style='"+ms.tdStyle(formId, 'CI_CONTRAL_TYPE')+"' "+ms.tdEvent(formId, 'CI_CONTRAL_TYPE')+">")
            arrHtml.push("<span colno='CI_CONTRAL_TYPE' class='"+ms.uiClass(formId, 'CI_CONTRAL_TYPE')+"' style='"+ms.uiStyle(formId, 'CI_CONTRAL_TYPE')+"' "+ms.uiEvent(formId, 'CI_CONTRAL_TYPE')+" title='"+ms.titleAttr(formId,'CI_CONTRAL_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CI_CONTRAL_TYPE']+"</span>")
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
