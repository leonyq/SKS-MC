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
		<dict:lang value="VM-看板配置-列表" />
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
		<bu:header formId ="011bf0a0f9964a5f97d9493fb3a51e1b"/>

    
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
		<bu:func viewId="8291703f5f9b4077bf0fb3d1674fb68c" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="8291703f5f9b4077bf0fb3d1674fb68c" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage011bf0a0f9964a5f97d9493fb3a51e1b" id="formPage011bf0a0f9964a5f97d9493fb3a51e1b" value="${formPage011bf0a0f9964a5f97d9493fb3a51e1b}"/>
		<input type="hidden" name="formId" id="formId1" value='011bf0a0f9964a5f97d9493fb3a51e1b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="011bf0a0f9964a5f97d9493fb3a51e1b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax011bf0a0f9964a5f97d9493fb3a51e1b" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head2" id="datagrid-header-inner011bf0a0f9964a5f97d9493fb3a51e1b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable011bf0a0f9964a5f97d9493fb3a51e1b" > 
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="011bf0a0f9964a5f97d9493fb3a51e1b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_011bf0a0f9964a5f97d9493fb3a51e1b" onclick="_selectAjaxTableAllData(this,'011bf0a0f9964a5f97d9493fb3a51e1b')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CKC_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CKC_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CKC_AREA_SN" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CKC_AREA_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="CKC_GROUP" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="CKC_EMP_NO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="CKC_EMP_NAME" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="CKC_GROUP_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="CKC_EMP_NO_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="CKC_EMP_NAME_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:60px; text-align:center;"><bu:uitn colNo="CKC_GROUP_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="CKC_EMP_NO_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="CKC_EMP_NAME_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CKC_RESERVE_ONE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CKC_RESERVE_TWO" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CKC_RESERVE_THREE" formId="011bf0a0f9964a5f97d9493fb3a51e1b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll2" id="tableDiv011bf0a0f9964a5f97d9493fb3a51e1b" onscroll="ajaxTableScroll(this,'011bf0a0f9964a5f97d9493fb3a51e1b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax011bf0a0f9964a5f97d9493fb3a51e1b">
		<tbody id="tbody_011bf0a0f9964a5f97d9493fb3a51e1b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage011bf0a0f9964a5f97d9493fb3a51e1b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=011bf0a0f9964a5f97d9493fb3a51e1b&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="8291703f5f9b4077bf0fb3d1674fb68c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="8291703f5f9b4077bf0fb3d1674fb68c" />
    
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
    if(formId=='011bf0a0f9964a5f97d9493fb3a51e1b'){<%--FM-看板配置信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='CKC_SN' class='datagrid-cell "+ms.tdClass(formId, 'CKC_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CKC_SN')+"' "+ms.tdEvent(formId, 'CKC_SN')+">")
            arrHtml.push("<span colno='CKC_SN' class='"+ms.uiClass(formId, 'CKC_SN')+"' style='"+ms.uiStyle(formId, 'CKC_SN')+"' "+ms.uiEvent(formId, 'CKC_SN')+" title='"+ms.titleAttr(formId,'CKC_SN','IS_TITLE_ATTR',v)+"' >"+v['CKC_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CKC_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CKC_NAME')+"' "+ms.tdEvent(formId, 'CKC_NAME')+">")
            arrHtml.push("<span colno='CKC_NAME' class='"+ms.uiClass(formId, 'CKC_NAME')+"' style='"+ms.uiStyle(formId, 'CKC_NAME')+"' "+ms.uiEvent(formId, 'CKC_NAME')+" title='"+ms.titleAttr(formId,'CKC_NAME','IS_TITLE_ATTR',v)+"' >"+v['CKC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CKC_AREA_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'CKC_AREA_SN')+"' "+ms.tdEvent(formId, 'CKC_AREA_SN')+">")
            arrHtml.push("<span colno='CKC_AREA_SN' class='"+ms.uiClass(formId, 'CKC_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CKC_AREA_SN')+"' "+ms.uiEvent(formId, 'CKC_AREA_SN')+" title='"+ms.titleAttr(formId,'CKC_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CKC_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_AREA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CKC_AREA_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CKC_AREA_NAME')+"' "+ms.tdEvent(formId, 'CKC_AREA_NAME')+">")
            arrHtml.push("<span colno='CKC_AREA_NAME' class='"+ms.uiClass(formId, 'CKC_AREA_NAME')+"' style='"+ms.uiStyle(formId, 'CKC_AREA_NAME')+"' "+ms.uiEvent(formId, 'CKC_AREA_NAME')+" title='"+ms.titleAttr(formId,'CKC_AREA_NAME','IS_TITLE_ATTR',v)+"' >"+v['CKC_AREA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'CKC_GROUP')+"' style='width:60px;"+ms.tdStyle(formId, 'CKC_GROUP')+"' "+ms.tdEvent(formId, 'CKC_GROUP')+">")
            arrHtml.push("<span colno='CKC_GROUP' class='"+ms.uiClass(formId, 'CKC_GROUP')+"' style='"+ms.uiStyle(formId, 'CKC_GROUP')+"' "+ms.uiEvent(formId, 'CKC_GROUP')+" title='"+ms.titleAttr(formId,'CKC_GROUP','IS_TITLE_ATTR',v)+"' >"+v['CKC_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_EMP_NO' class='datagrid-cell "+ms.tdClass(formId, 'CKC_EMP_NO')+"' style='width:120px;"+ms.tdStyle(formId, 'CKC_EMP_NO')+"' "+ms.tdEvent(formId, 'CKC_EMP_NO')+">")
            arrHtml.push("<span colno='CKC_EMP_NO' class='"+ms.uiClass(formId, 'CKC_EMP_NO')+"' style='"+ms.uiStyle(formId, 'CKC_EMP_NO')+"' "+ms.uiEvent(formId, 'CKC_EMP_NO')+" title='"+ms.titleAttr(formId,'CKC_EMP_NO','IS_TITLE_ATTR',v)+"' >"+v['CKC_EMP_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_EMP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CKC_EMP_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'CKC_EMP_NAME')+"' "+ms.tdEvent(formId, 'CKC_EMP_NAME')+">")
            arrHtml.push("<span colno='CKC_EMP_NAME' class='"+ms.uiClass(formId, 'CKC_EMP_NAME')+"' style='"+ms.uiStyle(formId, 'CKC_EMP_NAME')+"' "+ms.uiEvent(formId, 'CKC_EMP_NAME')+" title='"+ms.titleAttr(formId,'CKC_EMP_NAME','IS_TITLE_ATTR',v)+"' >"+v['CKC_EMP_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_GROUP_TWO' class='datagrid-cell "+ms.tdClass(formId, 'CKC_GROUP_TWO')+"' style='width:60px;"+ms.tdStyle(formId, 'CKC_GROUP_TWO')+"' "+ms.tdEvent(formId, 'CKC_GROUP_TWO')+">")
            arrHtml.push("<span colno='CKC_GROUP_TWO' class='"+ms.uiClass(formId, 'CKC_GROUP_TWO')+"' style='"+ms.uiStyle(formId, 'CKC_GROUP_TWO')+"' "+ms.uiEvent(formId, 'CKC_GROUP_TWO')+" title='"+ms.titleAttr(formId,'CKC_GROUP_TWO','IS_TITLE_ATTR',v)+"' >"+v['CKC_GROUP_TWO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_EMP_NO_TWO' class='datagrid-cell "+ms.tdClass(formId, 'CKC_EMP_NO_TWO')+"' style='width:120px;"+ms.tdStyle(formId, 'CKC_EMP_NO_TWO')+"' "+ms.tdEvent(formId, 'CKC_EMP_NO_TWO')+">")
            arrHtml.push("<span colno='CKC_EMP_NO_TWO' class='"+ms.uiClass(formId, 'CKC_EMP_NO_TWO')+"' style='"+ms.uiStyle(formId, 'CKC_EMP_NO_TWO')+"' "+ms.uiEvent(formId, 'CKC_EMP_NO_TWO')+" title='"+ms.titleAttr(formId,'CKC_EMP_NO_TWO','IS_TITLE_ATTR',v)+"' >"+v['CKC_EMP_NO_TWO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_EMP_NAME_TWO' class='datagrid-cell "+ms.tdClass(formId, 'CKC_EMP_NAME_TWO')+"' style='width:120px;"+ms.tdStyle(formId, 'CKC_EMP_NAME_TWO')+"' "+ms.tdEvent(formId, 'CKC_EMP_NAME_TWO')+">")
            arrHtml.push("<span colno='CKC_EMP_NAME_TWO' class='"+ms.uiClass(formId, 'CKC_EMP_NAME_TWO')+"' style='"+ms.uiStyle(formId, 'CKC_EMP_NAME_TWO')+"' "+ms.uiEvent(formId, 'CKC_EMP_NAME_TWO')+" title='"+ms.titleAttr(formId,'CKC_EMP_NAME_TWO','IS_TITLE_ATTR',v)+"' >"+v['CKC_EMP_NAME_TWO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_GROUP_THREE' class='datagrid-cell "+ms.tdClass(formId, 'CKC_GROUP_THREE')+"' style='width:60px;"+ms.tdStyle(formId, 'CKC_GROUP_THREE')+"' "+ms.tdEvent(formId, 'CKC_GROUP_THREE')+">")
            arrHtml.push("<span colno='CKC_GROUP_THREE' class='"+ms.uiClass(formId, 'CKC_GROUP_THREE')+"' style='"+ms.uiStyle(formId, 'CKC_GROUP_THREE')+"' "+ms.uiEvent(formId, 'CKC_GROUP_THREE')+" title='"+ms.titleAttr(formId,'CKC_GROUP_THREE','IS_TITLE_ATTR',v)+"' >"+v['CKC_GROUP_THREE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_EMP_NO_THREE' class='datagrid-cell "+ms.tdClass(formId, 'CKC_EMP_NO_THREE')+"' style='width:120px;"+ms.tdStyle(formId, 'CKC_EMP_NO_THREE')+"' "+ms.tdEvent(formId, 'CKC_EMP_NO_THREE')+">")
            arrHtml.push("<span colno='CKC_EMP_NO_THREE' class='"+ms.uiClass(formId, 'CKC_EMP_NO_THREE')+"' style='"+ms.uiStyle(formId, 'CKC_EMP_NO_THREE')+"' "+ms.uiEvent(formId, 'CKC_EMP_NO_THREE')+" title='"+ms.titleAttr(formId,'CKC_EMP_NO_THREE','IS_TITLE_ATTR',v)+"' >"+v['CKC_EMP_NO_THREE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_EMP_NAME_THREE' class='datagrid-cell "+ms.tdClass(formId, 'CKC_EMP_NAME_THREE')+"' style='width:120px;"+ms.tdStyle(formId, 'CKC_EMP_NAME_THREE')+"' "+ms.tdEvent(formId, 'CKC_EMP_NAME_THREE')+">")
            arrHtml.push("<span colno='CKC_EMP_NAME_THREE' class='"+ms.uiClass(formId, 'CKC_EMP_NAME_THREE')+"' style='"+ms.uiStyle(formId, 'CKC_EMP_NAME_THREE')+"' "+ms.uiEvent(formId, 'CKC_EMP_NAME_THREE')+" title='"+ms.titleAttr(formId,'CKC_EMP_NAME_THREE','IS_TITLE_ATTR',v)+"' >"+v['CKC_EMP_NAME_THREE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_RESERVE_ONE' class='datagrid-cell "+ms.tdClass(formId, 'CKC_RESERVE_ONE')+"' style='width:150px;"+ms.tdStyle(formId, 'CKC_RESERVE_ONE')+"' "+ms.tdEvent(formId, 'CKC_RESERVE_ONE')+">")
            arrHtml.push("<span colno='CKC_RESERVE_ONE' class='"+ms.uiClass(formId, 'CKC_RESERVE_ONE')+"' style='"+ms.uiStyle(formId, 'CKC_RESERVE_ONE')+"' "+ms.uiEvent(formId, 'CKC_RESERVE_ONE')+" title='"+ms.titleAttr(formId,'CKC_RESERVE_ONE','IS_TITLE_ATTR',v)+"' >"+v['CKC_RESERVE_ONE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_RESERVE_TWO' class='datagrid-cell "+ms.tdClass(formId, 'CKC_RESERVE_TWO')+"' style='width:150px;"+ms.tdStyle(formId, 'CKC_RESERVE_TWO')+"' "+ms.tdEvent(formId, 'CKC_RESERVE_TWO')+">")
            arrHtml.push("<span colno='CKC_RESERVE_TWO' class='"+ms.uiClass(formId, 'CKC_RESERVE_TWO')+"' style='"+ms.uiStyle(formId, 'CKC_RESERVE_TWO')+"' "+ms.uiEvent(formId, 'CKC_RESERVE_TWO')+" title='"+ms.titleAttr(formId,'CKC_RESERVE_TWO','IS_TITLE_ATTR',v)+"' >"+v['CKC_RESERVE_TWO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CKC_RESERVE_THREE' class='datagrid-cell "+ms.tdClass(formId, 'CKC_RESERVE_THREE')+"' style='width:150px;"+ms.tdStyle(formId, 'CKC_RESERVE_THREE')+"' "+ms.tdEvent(formId, 'CKC_RESERVE_THREE')+">")
            arrHtml.push("<span colno='CKC_RESERVE_THREE' class='"+ms.uiClass(formId, 'CKC_RESERVE_THREE')+"' style='"+ms.uiStyle(formId, 'CKC_RESERVE_THREE')+"' "+ms.uiEvent(formId, 'CKC_RESERVE_THREE')+" title='"+ms.titleAttr(formId,'CKC_RESERVE_THREE','IS_TITLE_ATTR',v)+"' >"+v['CKC_RESERVE_THREE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        //setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    /*if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;*/
    
   
    //$(".scroll2").scrollLeft(0);
    //showItemDetail($("#firstItemId").val());
}
</script>
<script>(function($){
  $(window).on('load',function(){
 $(".head2").scrollLeft(0);
setPopScroll('.scroll2','.head2');
  })
})(jQuery)</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
