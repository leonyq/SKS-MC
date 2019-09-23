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
		<dict:lang value="设备点检" />
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
		<bu:header formId ="7e51cc6aa9ee435690126e8c25c50178"/>

    
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
		<bu:func viewId="6b2979f7b2bd41148c2b47d361ec0395" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="6b2979f7b2bd41148c2b47d361ec0395" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage7e51cc6aa9ee435690126e8c25c50178" id="formPage7e51cc6aa9ee435690126e8c25c50178" value="${formPage7e51cc6aa9ee435690126e8c25c50178}"/>
		<input type="hidden" name="formId" id="formId1" value='7e51cc6aa9ee435690126e8c25c50178'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='d6ecb86009984f57b8d7cea32de1e200'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='6194088e0d9e4294b0f17214bfdb0a60'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="7e51cc6aa9ee435690126e8c25c50178">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax7e51cc6aa9ee435690126e8c25c50178" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner7e51cc6aa9ee435690126e8c25c50178">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable7e51cc6aa9ee435690126e8c25c50178">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="7e51cc6aa9ee435690126e8c25c50178" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_7e51cc6aa9ee435690126e8c25c50178" onclick="_selectAjaxTableAllData(this,'7e51cc6aa9ee435690126e8c25c50178')" style="cursor: pointer;"title="全选"/></span></td>
	     	<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDS_DEVICE_SN" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDS_DEVICE_TYPE" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDS_DEVICE_CLASS" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><bu:uitn colNo="CDS_TASK_TIME" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center;"><bu:uitn colNo="CDS_CHECK_TIME" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDS_REPAIR_EMP" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDS_MEMO" formId="7e51cc6aa9ee435690126e8c25c50178" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv7e51cc6aa9ee435690126e8c25c50178" onscroll="ajaxTableScroll(this,'7e51cc6aa9ee435690126e8c25c50178')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax7e51cc6aa9ee435690126e8c25c50178">
		<tbody id="tbody_7e51cc6aa9ee435690126e8c25c50178" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage7e51cc6aa9ee435690126e8c25c50178==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=7e51cc6aa9ee435690126e8c25c50178&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="formPage6194088e0d9e4294b0f17214bfdb0a60" id="formPage6194088e0d9e4294b0f17214bfdb0a60" value="${formPage6194088e0d9e4294b0f17214bfdb0a60}"/>
		<input type="hidden" name="formId" id="formId2" value='6194088e0d9e4294b0f17214bfdb0a60'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6194088e0d9e4294b0f17214bfdb0a60">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6194088e0d9e4294b0f17214bfdb0a60" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6194088e0d9e4294b0f17214bfdb0a60">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6194088e0d9e4294b0f17214bfdb0a60">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6194088e0d9e4294b0f17214bfdb0a60" i18n="1"/></td>
			<!--<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6194088e0d9e4294b0f17214bfdb0a60" onclick="_selectAjaxTableAllData(this,'6194088e0d9e4294b0f17214bfdb0a60')" style="cursor: pointer;"title="全选"/></span></td>-->
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDMI_ITEM_CODE" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDMI_ITEM_NAME" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDMI_ITEM_CLASS" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDMI_ITEM_MAXVALUE" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDMI_ITEM_MINVALUE" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDMI_ITEM_REAL" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDMI_ITEM_UNIT" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CDMI_MT_CONTENT" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6194088e0d9e4294b0f17214bfdb0a60" onscroll="ajaxTableScroll(this,'6194088e0d9e4294b0f17214bfdb0a60')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6194088e0d9e4294b0f17214bfdb0a60">
		<tbody id="tbody_6194088e0d9e4294b0f17214bfdb0a60" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6194088e0d9e4294b0f17214bfdb0a60==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=6194088e0d9e4294b0f17214bfdb0a60&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="6b2979f7b2bd41148c2b47d361ec0395" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="6b2979f7b2bd41148c2b47d361ec0395" />
    
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
    if(formId=='7e51cc6aa9ee435690126e8c25c50178'){<%--FM-设备点检信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px; text-align:center;"+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDS_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDS_DEVICE_SN')+"' style='width:150px; "+ms.tdStyle(formId, 'CDS_DEVICE_SN')+"' "+ms.tdEvent(formId, 'CDS_DEVICE_SN')+">")
            arrHtml.push("<span colno='CDS_DEVICE_SN' class='"+ms.uiClass(formId, 'CDS_DEVICE_SN')+"' onclick='itemJump1(\""+v['CDS_DEVICE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CDS_DEVICE_SN')+" title='"+ms.titleAttr(formId,'CDS_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['CDS_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDS_DEVICE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CDS_DEVICE_TYPE')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CDS_DEVICE_TYPE')+"' "+ms.tdEvent(formId, 'CDS_DEVICE_TYPE')+">")
            arrHtml.push("<span colno='CDS_DEVICE_TYPE' class='"+ms.uiClass(formId, 'CDS_DEVICE_TYPE')+"' style='"+ms.uiStyle(formId, 'CDS_DEVICE_TYPE')+"' "+ms.uiEvent(formId, 'CDS_DEVICE_TYPE')+" title='"+ms.titleAttr(formId,'CDS_DEVICE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CDS_DEVICE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDS_DEVICE_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CDS_DEVICE_CLASS')+"' style='width:150px;text-align:center; "+ms.tdEvent(formId, 'CDS_DEVICE_CLASS')+">")
            arrHtml.push("<span colno='CDS_DEVICE_CLASS' class='"+ms.uiClass(formId, 'CDS_DEVICE_CLASS')+"' style='"+ms.uiStyle(formId, 'CDS_DEVICE_CLASS')+"' "+ms.uiEvent(formId, 'CDS_DEVICE_CLASS')+" title='"+ms.titleAttr(formId,'CDS_DEVICE_CLASS','IS_TITLE_ATTR',v)+"' >"+v['CDS_DEVICE_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDS_TASK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDS_TASK_TIME')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'CDS_TASK_TIME')+"' "+ms.tdEvent(formId, 'CDS_TASK_TIME')+">")
            arrHtml.push("<span colno='CDS_TASK_TIME' class='"+ms.uiClass(formId, 'CDS_TASK_TIME')+"' style='"+ms.uiStyle(formId, 'CDS_TASK_TIME')+"' "+ms.uiEvent(formId, 'CDS_TASK_TIME')+" title='"+ms.titleAttr(formId,'CDS_TASK_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDS_TASK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDS_CHECK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDS_CHECK_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CDS_CHECK_TIME')+"' "+ms.tdEvent(formId, 'CDS_CHECK_TIME')+">")
            arrHtml.push("<span colno='CDS_CHECK_TIME' class='"+ms.uiClass(formId, 'CDS_CHECK_TIME')+"' style='"+ms.uiStyle(formId, 'CDS_CHECK_TIME')+"' "+ms.uiEvent(formId, 'CDS_CHECK_TIME')+" title='"+ms.titleAttr(formId,'CDS_CHECK_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDS_CHECK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDS_REPAIR_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CDS_REPAIR_EMP')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CDS_REPAIR_EMP')+"' "+ms.tdEvent(formId, 'CDS_REPAIR_EMP')+">")
            arrHtml.push("<span colno='CDS_REPAIR_EMP' class='"+ms.uiClass(formId, 'CDS_REPAIR_EMP')+"' style='"+ms.uiStyle(formId, 'CDS_REPAIR_EMP')+"' "+ms.uiEvent(formId, 'CDS_REPAIR_EMP')+" title='"+ms.titleAttr(formId,'CDS_REPAIR_EMP','IS_TITLE_ATTR',v)+"' >"+v['CDS_REPAIR_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDS_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CDS_MEMO')+"' style='width:150px; "+ms.tdEvent(formId, 'CDS_MEMO')+">")
            arrHtml.push("<span colno='CDS_MEMO' class='"+ms.uiClass(formId, 'CDS_MEMO')+"' style='"+ms.uiStyle(formId, 'CDS_MEMO')+"' "+ms.uiEvent(formId, 'CDS_MEMO')+" title='"+ms.titleAttr(formId,'CDS_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CDS_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='6194088e0d9e4294b0f17214bfdb0a60'){<%--FM-设备保养明细信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            //arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            //arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_CODE')+"' style='width:150px;"+ms.tdEvent(formId, 'CDMI_ITEM_CODE')+">")
            arrHtml.push("<span colno='CDMI_ITEM_CODE' class='"+ms.uiClass(formId, 'CDMI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_NAME')+"' style='width:150px;"+ms.tdEvent(formId, 'CDMI_ITEM_NAME')+">")
            arrHtml.push("<span colno='CDMI_ITEM_NAME' class='"+ms.uiClass(formId, 'CDMI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_ITEM_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_CLASS')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CDMI_ITEM_CLASS')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_CLASS')+">")
            arrHtml.push("<span colno='CDMI_ITEM_CLASS' class='"+ms.uiClass(formId, 'CDMI_ITEM_CLASS')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_CLASS')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_CLASS')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_CLASS','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_ITEM_MAXVALUE' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_MAXVALUE')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_MAXVALUE')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_MAXVALUE')+">")
            arrHtml.push("<span colno='CDMI_ITEM_MAXVALUE' class='"+ms.uiClass(formId, 'CDMI_ITEM_MAXVALUE')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_MAXVALUE')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_MAXVALUE')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_MAXVALUE','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_MAXVALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_ITEM_MINVALUE' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_MINVALUE')+"' style='width:150p;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_MINVALUE')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_MINVALUE')+">")
            arrHtml.push("<span colno='CDMI_ITEM_MINVALUE' class='"+ms.uiClass(formId, 'CDMI_ITEM_MINVALUE')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_MINVALUE')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_MINVALUE')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_MINVALUE','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_MINVALUE']+"</span>")
            arrHtml.push("</td>");
            if(v['CDMI_ITEM_CLASS']=='状态值'){
                if(v['CDMI_ITEM_REAL']==0){
                  arrHtml.push("<td colno='CDMI_ITEM_REAL' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_REAL')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_REAL')+">")
                  arrHtml.push("<span colno='CDMI_ITEM_REAL' class='"+ms.uiClass(formId, 'CDMI_ITEM_REAL')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_REAL')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_REAL','IS_TITLE_ATTR',v)+"' >"+'OK'+"</span>")
                  arrHtml.push("</td>");  
                }else{
                 arrHtml.push("<td colno='CDMI_ITEM_REAL' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_REAL')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_REAL')+">")
                 arrHtml.push("<span colno='CDMI_ITEM_REAL' class='"+ms.uiClass(formId, 'CDMI_ITEM_REAL')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_REAL')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_REAL','IS_TITLE_ATTR',v)+"' >"+'NG'+"</span>")
                 arrHtml.push("</td>");
                }
            }else{
                 arrHtml.push("<td colno='CDMI_ITEM_REAL' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_REAL')+"' style='width:150px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_REAL')+">")
                 arrHtml.push("<span colno='CDMI_ITEM_REAL' class='"+ms.uiClass(formId, 'CDMI_ITEM_REAL')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_REAL')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_REAL','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_REAL']+"</span>")
                 arrHtml.push("</td>");
            }
           
            arrHtml.push("<td colno='CDMI_ITEM_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_UNIT')+"' style='width:150px;text-align:center;"+ms.tdEvent(formId, 'CDMI_ITEM_UNIT')+">")
            arrHtml.push("<span colno='CDMI_ITEM_UNIT' class='"+ms.uiClass(formId, 'CDMI_ITEM_UNIT')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_UNIT')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_UNIT')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_UNIT','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_UNIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_MT_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_MT_CONTENT')+"' style='width:150px;"+ms.tdEvent(formId, 'CDMI_MT_CONTENT')+">")
            arrHtml.push("<span colno='CDMI_MT_CONTENT' class='"+ms.uiClass(formId, 'CDMI_MT_CONTENT')+"' style='"+ms.uiStyle(formId, 'CDMI_MT_CONTENT')+"' "+ms.uiEvent(formId, 'CDMI_MT_CONTENT')+" title='"+ms.titleAttr(formId,'CDMI_MT_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['CDMI_MT_CONTENT']+"</span>")
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
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//设备建档
function itemJump1(obj){
      winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
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
