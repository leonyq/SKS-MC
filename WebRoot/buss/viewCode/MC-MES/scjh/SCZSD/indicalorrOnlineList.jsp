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
		<dict:lang value="制令单上线指示单信息列表" />
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
		<bu:header formId ="0ba4f69d14b442ec95bba6ace4d8247d"/>

    
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
		<bu:func viewId="e2782c33d92e45ec91a70cd4e7070297" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="e2782c33d92e45ec91a70cd4e7070297" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0ba4f69d14b442ec95bba6ace4d8247d" id="formPage0ba4f69d14b442ec95bba6ace4d8247d" value="${formPage0ba4f69d14b442ec95bba6ace4d8247d}"/>
		<input type="hidden" name="formId" id="formId1" value='0ba4f69d14b442ec95bba6ace4d8247d'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0ba4f69d14b442ec95bba6ace4d8247d">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0ba4f69d14b442ec95bba6ace4d8247d" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0ba4f69d14b442ec95bba6ace4d8247d">
		
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0ba4f69d14b442ec95bba6ace4d8247d" style="min-width:1410px;">
		
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="0ba4f69d14b442ec95bba6ace4d8247d" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0ba4f69d14b442ec95bba6ace4d8247d" onclick="_selectAjaxTableAllData(this,'0ba4f69d14b442ec95bba6ace4d8247d')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_INDICATORR_SN" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CO_STATE" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_MO_NUMBER" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_MODEL_CODE" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_ITEM_NAME" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_ITEM_SPEC" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CO_TEMPLATE_NAME" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_ONLINE_TIME" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CO_MEMO" formId="0ba4f69d14b442ec95bba6ace4d8247d" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0ba4f69d14b442ec95bba6ace4d8247d" onscroll="ajaxTableScroll(this,'0ba4f69d14b442ec95bba6ace4d8247d')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0ba4f69d14b442ec95bba6ace4d8247d" style="min-width:1410px;">
		<tbody id="tbody_0ba4f69d14b442ec95bba6ace4d8247d" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0ba4f69d14b442ec95bba6ace4d8247d==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0ba4f69d14b442ec95bba6ace4d8247d&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="e2782c33d92e45ec91a70cd4e7070297" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="e2782c33d92e45ec91a70cd4e7070297" />
    
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
    if(formId=='0ba4f69d14b442ec95bba6ace4d8247d'){<%--制令单上线指示单信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_INDICATORR_SN' class='datagrid-cell "+ms.tdClass(formId, 'CO_INDICATORR_SN')+"' style='"+ms.tdStyle(formId, 'CO_INDICATORR_SN')+"' "+ms.tdEvent(formId, 'CO_INDICATORR_SN')+">")
            //arrHtml.push("<span colno='CO_INDICATORR_SN' class='"+ms.uiClass(formId, 'CO_INDICATORR_SN')+"' style='"+ms.uiStyle(formId, 'CO_INDICATORR_SN')+"' "+ms.uiEvent(formId, 'CO_INDICATORR_SN')+" title='"+ms.titleAttr(formId,'CO_INDICATORR_SN','IS_TITLE_ATTR',v)+"' >"+v['CO_INDICATORR_SN']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CO_MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'CO_MO_NUMBER')+"' "+ms.tdEvent(formId, 'CO_MO_NUMBER')+">")
            //arrHtml.push("<span colno='CO_MO_NUMBER' class='"+ms.uiClass(formId, 'CO_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'CO_MO_NUMBER')+"' "+ms.uiEvent(formId, 'CO_MO_NUMBER')+" title='"+ms.titleAttr(formId,'CO_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CO_MO_NUMBER']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_STATE' class='datagrid-cell "+ms.tdClass(formId, 'CO_STATE')+"' style='"+ms.tdStyle(formId, 'CO_STATE')+"' "+ms.tdEvent(formId, 'CO_STATE')+">")
            //arrHtml.push("<span colno='CO_STATE' class='"+ms.uiClass(formId, 'CO_STATE')+"' style='"+ms.uiStyle(formId, 'CO_STATE')+"' "+ms.uiEvent(formId, 'CO_STATE')+" title='"+ms.titleAttr(formId,'CO_STATE','IS_TITLE_ATTR',v)+"' >"+v['CO_STATE']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_SECTION_NO' class='datagrid-cell "+ms.tdClass(formId, 'CO_SECTION_NO')+"' style='"+ms.tdStyle(formId, 'CO_SECTION_NO')+"' "+ms.tdEvent(formId, 'CO_SECTION_NO')+">")
            //arrHtml.push("<span colno='CO_SECTION_NO' class='"+ms.uiClass(formId, 'CO_SECTION_NO')+"' style='"+ms.uiStyle(formId, 'CO_SECTION_NO')+"' "+ms.uiEvent(formId, 'CO_SECTION_NO')+" title='"+ms.titleAttr(formId,'CO_SECTION_NO','IS_TITLE_ATTR',v)+"' >"+v['CO_SECTION_NO']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_ARCHIVAL_FILE_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' style='"+ms.tdStyle(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' "+ms.tdEvent(formId, 'CO_ARCHIVAL_FILE_NUMBER')+">")
            //arrHtml.push("<span colno='CO_ARCHIVAL_FILE_NUMBER' class='"+ms.uiClass(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' style='"+ms.uiStyle(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' "+ms.uiEvent(formId, 'CO_ARCHIVAL_FILE_NUMBER')+" title='"+ms.titleAttr(formId,'CO_ARCHIVAL_FILE_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CO_ARCHIVAL_FILE_NUMBER']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'CO_LOT_NO')+"' style='"+ms.tdStyle(formId, 'CO_LOT_NO')+"' "+ms.tdEvent(formId, 'CO_LOT_NO')+">")
            //arrHtml.push("<span colno='CO_LOT_NO' class='"+ms.uiClass(formId, 'CO_LOT_NO')+"' style='"+ms.uiStyle(formId, 'CO_LOT_NO')+"' "+ms.uiEvent(formId, 'CO_LOT_NO')+" title='"+ms.titleAttr(formId,'CO_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['CO_LOT_NO']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_TEMPLATE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_TEMPLATE_NAME')+"' style='"+ms.tdStyle(formId, 'CO_TEMPLATE_NAME')+"' "+ms.tdEvent(formId, 'CO_TEMPLATE_NAME')+">")
            //arrHtml.push("<span colno='CO_TEMPLATE_NAME' class='"+ms.uiClass(formId, 'CO_TEMPLATE_NAME')+"' style='"+ms.uiStyle(formId, 'CO_TEMPLATE_NAME')+"' "+ms.uiEvent(formId, 'CO_TEMPLATE_NAME')+" title='"+ms.titleAttr(formId,'CO_TEMPLATE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CO_TEMPLATE_NAME']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CO_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'CO_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CO_MODEL_CODE')+">")
            //arrHtml.push("<span colno='CO_MODEL_CODE' class='"+ms.uiClass(formId, 'CO_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'CO_MODEL_CODE')+"' "+ms.uiEvent(formId, 'CO_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CO_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['CO_MODEL_CODE']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CO_MEMO')+"' style='"+ms.tdStyle(formId, 'CO_MEMO')+"' "+ms.tdEvent(formId, 'CO_MEMO')+">")
            //arrHtml.push("<span colno='CO_MEMO' class='"+ms.uiClass(formId, 'CO_MEMO')+"' style='"+ms.uiStyle(formId, 'CO_MEMO')+"' "+ms.uiEvent(formId, 'CO_MEMO')+" title='"+ms.titleAttr(formId,'CO_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CO_MEMO']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_INDICATORR_SN' class='datagrid-cell "+ms.tdClass(formId, 'CO_INDICATORR_SN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_INDICATORR_SN')+"' "+ms.tdEvent(formId, 'CO_INDICATORR_SN')+">")
            arrHtml.push("<span colno='CO_INDICATORR_SN' class='"+ms.uiClass(formId, 'CO_INDICATORR_SN')+"' style='"+ms.uiStyle(formId, 'CO_INDICATORR_SN')+"' "+ms.uiEvent(formId, 'CO_INDICATORR_SN')+" title='"+ms.titleAttr(formId,'CO_INDICATORR_SN','IS_TITLE_ATTR',v)+"' >"+v['CO_INDICATORR_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_STATE' class='datagrid-cell "+ms.tdClass(formId, 'CO_STATE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CO_STATE')+"' "+ms.tdEvent(formId, 'CO_STATE')+">")
            arrHtml.push("<span colno='CO_STATE' class='"+ms.uiClass(formId, 'CO_STATE')+"' style='"+ms.uiStyle(formId, 'CO_STATE')+"' "+ms.uiEvent(formId, 'CO_STATE')+" title='"+ms.titleAttr(formId,'CO_STATE','IS_TITLE_ATTR',v)+"' >"+v['CO_STATE']+"</span>")
            arrHtml.push("<td colno='CO_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CO_MO_NUMBER')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_MO_NUMBER')+"' "+ms.tdEvent(formId, 'CO_MO_NUMBER')+">")
            arrHtml.push("<span colno='CO_MO_NUMBER' class='"+ms.uiClass(formId, 'CO_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'CO_MO_NUMBER')+"' "+ms.uiEvent(formId, 'CO_MO_NUMBER')+" title='"+ms.titleAttr(formId,'CO_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CO_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CO_MODEL_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CO_MODEL_CODE')+">")
            arrHtml.push("<span colno='CO_MODEL_CODE' class='"+ms.uiClass(formId, 'CO_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'CO_MODEL_CODE')+"' "+ms.uiEvent(formId, 'CO_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CO_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['CO_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CO_ITEM_NAME')+">")
            arrHtml.push("<span colno='CO_ITEM_NAME' class='"+ms.uiClass(formId, 'CO_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CO_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CO_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CO_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CO_ITEM_SPEC')+">")
            arrHtml.push("<span colno='CO_ITEM_SPEC' class='"+ms.uiClass(formId, 'CO_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CO_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'CO_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['CO_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_TEMPLATE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_TEMPLATE_NAME')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'CO_TEMPLATE_NAME')+"' "+ms.tdEvent(formId, 'CO_TEMPLATE_NAME')+">")
            arrHtml.push("<span colno='CO_TEMPLATE_NAME' class='"+ms.uiClass(formId, 'CO_TEMPLATE_NAME')+"' style='"+ms.uiStyle(formId, 'CO_TEMPLATE_NAME')+"' "+ms.uiEvent(formId, 'CO_TEMPLATE_NAME')+" title='"+ms.titleAttr(formId,'CO_TEMPLATE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CO_TEMPLATE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ARCHIVAL_FILE_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' "+ms.tdEvent(formId, 'CO_ARCHIVAL_FILE_NUMBER')+">")
            arrHtml.push("<span colno='CO_ARCHIVAL_FILE_NUMBER' class='"+ms.uiClass(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' style='"+ms.uiStyle(formId, 'CO_ARCHIVAL_FILE_NUMBER')+"' "+ms.uiEvent(formId, 'CO_ARCHIVAL_FILE_NUMBER')+" title='"+ms.titleAttr(formId,'CO_ARCHIVAL_FILE_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CO_ARCHIVAL_FILE_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ONLINE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CO_ONLINE_TIME')+"' style='text-align:center;width:150px;"+ms.tdStyle(formId, 'CO_ONLINE_TIME')+"' "+ms.tdEvent(formId, 'CO_ONLINE_TIME')+">")
            arrHtml.push("<span colno='CO_ONLINE_TIME' class='"+ms.uiClass(formId, 'CO_ONLINE_TIME')+"' style='"+ms.uiStyle(formId, 'CO_ONLINE_TIME')+"' "+ms.uiEvent(formId, 'CO_ONLINE_TIME')+" title='"+ms.titleAttr(formId,'CO_ONLINE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CO_ONLINE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CO_MEMO')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'CO_MEMO')+"' "+ms.tdEvent(formId, 'CO_MEMO')+">")
            arrHtml.push("<span colno='CO_MEMO' class='"+ms.uiClass(formId, 'CO_MEMO')+"' style='"+ms.uiStyle(formId, 'CO_MEMO')+"' "+ms.uiEvent(formId, 'CO_MEMO')+" title='"+ms.titleAttr(formId,'CO_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CO_MEMO']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
