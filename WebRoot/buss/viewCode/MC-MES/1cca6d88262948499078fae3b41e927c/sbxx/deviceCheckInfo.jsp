<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="VM-设备校验信息" />
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
		<bu:header formId ="1d564e83df4f4eabbbafb0813b189d69"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="45f1730ccbb741998a50495ffdbd475e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="45f1730ccbb741998a50495ffdbd475e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage1d564e83df4f4eabbbafb0813b189d69" id="formPage1d564e83df4f4eabbbafb0813b189d69" value="${formPage1d564e83df4f4eabbbafb0813b189d69}"/>
		<input type="hidden" name="formId" id="formId1" value='1d564e83df4f4eabbbafb0813b189d69'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='d6ecb86009984f57b8d7cea32de1e200'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='6194088e0d9e4294b0f17214bfdb0a60'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="1d564e83df4f4eabbbafb0813b189d69">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1d564e83df4f4eabbbafb0813b189d69" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner1d564e83df4f4eabbbafb0813b189d69">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1d564e83df4f4eabbbafb0813b189d69" style="min-width:1390px">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="1d564e83df4f4eabbbafb0813b189d69" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_1d564e83df4f4eabbbafb0813b189d69" onclick="_selectAjaxTableAllData(this,'1d564e83df4f4eabbbafb0813b189d69')" style="cursor: pointer;"title="全选"/></span></td>
	    	<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CDC_DEVICE_SN" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CDC_DEVICE_TYPE" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CDC_CHECK_TYPE" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:130px;"><bu:uitn colNo="CDC_DEVICE_NAME" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CDC_DEVICE_CLASS" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CDC_TASK_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CDC_CHECK_COMPANY" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CDC_OUT_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CDC_RETURN_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CDC_CHECK_CONTANT" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CDC_REPAIR_EMP" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CDC_CHECK_TIME" formId="1d564e83df4f4eabbbafb0813b189d69" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv1d564e83df4f4eabbbafb0813b189d69" onscroll="ajaxTableScroll(this,'1d564e83df4f4eabbbafb0813b189d69')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax1d564e83df4f4eabbbafb0813b189d69" style="min-width:1390px">
		<tbody id="tbody_1d564e83df4f4eabbbafb0813b189d69" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage1d564e83df4f4eabbbafb0813b189d69==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=1d564e83df4f4eabbbafb0813b189d69&showLoading=0" />
			</div>
		</c:if>
		<div class="panel-ajax datagrid datagrid-div1" style="table-layout: fixed;margin-top:10px;" id="6194088e0d9e4294b0f17214bfdb0a60">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6194088e0d9e4294b0f17214bfdb0a60" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6194088e0d9e4294b0f17214bfdb0a60">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6194088e0d9e4294b0f17214bfdb0a60">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6194088e0d9e4294b0f17214bfdb0a60" i18n="1"/></td>
			<!--<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6194088e0d9e4294b0f17214bfdb0a60" onclick="_selectAjaxTableAllData(this,'6194088e0d9e4294b0f17214bfdb0a60')" style="cursor: pointer;"title="全选"/></span></td>-->
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDMI_ITEM_CODE" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDMI_ITEM_NAME" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDMI_ITEM_CLASS" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDMI_ITEM_MAXVALUE" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDMI_ITEM_MINVALUE" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDMI_ITEM_REAL" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CDMI_ITEM_UNIT" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CDMI_MT_CONTENT" formId="6194088e0d9e4294b0f17214bfdb0a60" /></td>
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
		</div>

		<input type="hidden" name="formPage6194088e0d9e4294b0f17214bfdb0a60" id="formPage6194088e0d9e4294b0f17214bfdb0a60" value="${formPage6194088e0d9e4294b0f17214bfdb0a60}"/>
		<input type="hidden" name="formId" id="formId2" value='6194088e0d9e4294b0f17214bfdb0a60'/>
	
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="45f1730ccbb741998a50495ffdbd475e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="45f1730ccbb741998a50495ffdbd475e" />
    
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
    if(formId=='1d564e83df4f4eabbbafb0813b189d69'){<%--FM-设备校验信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDC_DEVICE_SN')+"' style='width:130px;"+ms.tdStyle(formId, 'CDC_DEVICE_SN')+"' "+ms.tdEvent(formId, 'CDC_DEVICE_SN')+">")
            arrHtml.push("<span colno='CDC_DEVICE_SN' class='"+ms.uiClass(formId, 'CDC_DEVICE_SN')+"' onclick='itemJump1(\""+v['CDC_DEVICE_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CDC_DEVICE_SN')+" title='"+ms.titleAttr(formId,'CDC_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['CDC_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_DEVICE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CDC_DEVICE_TYPE')+"' style='width:130px;"+ms.tdStyle(formId, 'CDC_DEVICE_TYPE')+"' "+ms.tdEvent(formId, 'CDC_DEVICE_TYPE')+">")
            arrHtml.push("<span colno='CDC_DEVICE_TYPE' class='"+ms.uiClass(formId, 'CDC_DEVICE_TYPE')+"' style='"+ms.uiStyle(formId, 'CDC_DEVICE_TYPE')+"' "+ms.uiEvent(formId, 'CDC_DEVICE_TYPE')+" title='"+ms.titleAttr(formId,'CDC_DEVICE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CDC_DEVICE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_CHECK_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CDC_CHECK_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CDC_CHECK_TYPE')+"' "+ms.tdEvent(formId, 'CDC_CHECK_TYPE')+">")
            arrHtml.push("<span colno='CDC_CHECK_TYPE' class='"+ms.uiClass(formId, 'CDC_CHECK_TYPE')+"' style='"+ms.uiStyle(formId, 'CDC_CHECK_TYPE')+"' "+ms.uiEvent(formId, 'CDC_CHECK_TYPE')+" title='"+ms.titleAttr(formId,'CDC_CHECK_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CDC_CHECK_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CDC_DEVICE_NAME')+"' style='width:130px;"+ms.tdStyle(formId, 'CDC_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'CDC_DEVICE_NAME')+">")
            arrHtml.push("<span colno='CDC_DEVICE_NAME' class='"+ms.uiClass(formId, 'CDC_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'CDC_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'CDC_DEVICE_NAME')+" title='"+ms.titleAttr(formId,'CDC_DEVICE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CDC_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_DEVICE_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CDC_DEVICE_CLASS')+"' style='width:110px;"+ms.tdStyle(formId, 'CDC_DEVICE_CLASS')+"' "+ms.tdEvent(formId, 'CDC_DEVICE_CLASS')+">")
            arrHtml.push("<span colno='CDC_DEVICE_CLASS' class='"+ms.uiClass(formId, 'CDC_DEVICE_CLASS')+"' style='"+ms.uiStyle(formId, 'CDC_DEVICE_CLASS')+"' "+ms.uiEvent(formId, 'CDC_DEVICE_CLASS')+" title='"+ms.titleAttr(formId,'CDC_DEVICE_CLASS','IS_TITLE_ATTR',v)+"' >"+v['CDC_DEVICE_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_TASK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDC_TASK_TIME')+"' style='width:90px;text-align:right;"+ms.tdStyle(formId, 'CDC_TASK_TIME')+"' "+ms.tdEvent(formId, 'CDC_TASK_TIME')+">")
            arrHtml.push("<span colno='CDC_TASK_TIME' class='"+ms.uiClass(formId, 'CDC_TASK_TIME')+"' style='"+ms.uiStyle(formId, 'CDC_TASK_TIME')+"' "+ms.uiEvent(formId, 'CDC_TASK_TIME')+" title='"+ms.titleAttr(formId,'CDC_TASK_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDC_TASK_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_CHECK_COMPANY' class='datagrid-cell "+ms.tdClass(formId, 'CDC_CHECK_COMPANY')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CDC_CHECK_COMPANY')+"' "+ms.tdEvent(formId, 'CDC_CHECK_COMPANY')+">")
            arrHtml.push("<span colno='CDC_CHECK_COMPANY' class='"+ms.uiClass(formId, 'CDC_CHECK_COMPANY')+"' style='"+ms.uiStyle(formId, 'CDC_CHECK_COMPANY')+"' "+ms.uiEvent(formId, 'CDC_CHECK_COMPANY')+" title='"+ms.titleAttr(formId,'CDC_CHECK_COMPANY','IS_TITLE_ATTR',v)+"' >"+v['CDC_CHECK_COMPANY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_OUT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDC_OUT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CDC_OUT_TIME')+"' "+ms.tdEvent(formId, 'CDC_OUT_TIME')+">")
            arrHtml.push("<span colno='CDC_OUT_TIME' class='"+ms.uiClass(formId, 'CDC_OUT_TIME')+"' style='"+ms.uiStyle(formId, 'CDC_OUT_TIME')+"' "+ms.uiEvent(formId, 'CDC_OUT_TIME')+" title='"+ms.titleAttr(formId,'CDC_OUT_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDC_OUT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_RETURN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDC_RETURN_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CDC_RETURN_TIME')+"' "+ms.tdEvent(formId, 'CDC_RETURN_TIME')+">")
            arrHtml.push("<span colno='CDC_RETURN_TIME' class='"+ms.uiClass(formId, 'CDC_RETURN_TIME')+"' style='"+ms.uiStyle(formId, 'CDC_RETURN_TIME')+"' "+ms.uiEvent(formId, 'CDC_RETURN_TIME')+" title='"+ms.titleAttr(formId,'CDC_RETURN_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDC_RETURN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_CHECK_CONTANT' class='datagrid-cell "+ms.tdClass(formId, 'CDC_CHECK_CONTANT')+"' style='width:120px;"+ms.tdStyle(formId, 'CDC_CHECK_CONTANT')+"' "+ms.tdEvent(formId, 'CDC_CHECK_CONTANT')+">")
            arrHtml.push("<span colno='CDC_CHECK_CONTANT' class='"+ms.uiClass(formId, 'CDC_CHECK_CONTANT')+"' style='"+ms.uiStyle(formId, 'CDC_CHECK_CONTANT')+"' "+ms.uiEvent(formId, 'CDC_CHECK_CONTANT')+" title='"+ms.titleAttr(formId,'CDC_CHECK_CONTANT','IS_TITLE_ATTR',v)+"' >"+v['CDC_CHECK_CONTANT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_REPAIR_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CDC_REPAIR_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CDC_REPAIR_EMP')+"' "+ms.tdEvent(formId, 'CDC_REPAIR_EMP')+">")
            arrHtml.push("<span colno='CDC_REPAIR_EMP' class='"+ms.uiClass(formId, 'CDC_REPAIR_EMP')+"' style='"+ms.uiStyle(formId, 'CDC_REPAIR_EMP')+"' "+ms.uiEvent(formId, 'CDC_REPAIR_EMP')+" title='"+ms.titleAttr(formId,'CDC_REPAIR_EMP','IS_TITLE_ATTR',v)+"' >"+v['CDC_REPAIR_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDC_CHECK_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CDC_CHECK_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CDC_CHECK_TIME')+"' "+ms.tdEvent(formId, 'CDC_CHECK_TIME')+">")
            arrHtml.push("<span colno='CDC_CHECK_TIME' class='"+ms.uiClass(formId, 'CDC_CHECK_TIME')+"' style='"+ms.uiStyle(formId, 'CDC_CHECK_TIME')+"' "+ms.uiEvent(formId, 'CDC_CHECK_TIME')+" title='"+ms.titleAttr(formId,'CDC_CHECK_TIME','IS_TITLE_ATTR',v)+"' >"+v['CDC_CHECK_TIME']+"</span>")
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
            arrHtml.push("<td colno='CDMI_ITEM_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_CLASS')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CDMI_ITEM_CLASS')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_CLASS')+">")
            arrHtml.push("<span colno='CDMI_ITEM_CLASS' class='"+ms.uiClass(formId, 'CDMI_ITEM_CLASS')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_CLASS')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_CLASS')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_CLASS','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_ITEM_MAXVALUE' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_MAXVALUE')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_MAXVALUE')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_MAXVALUE')+">")
            arrHtml.push("<span colno='CDMI_ITEM_MAXVALUE' class='"+ms.uiClass(formId, 'CDMI_ITEM_MAXVALUE')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_MAXVALUE')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_MAXVALUE')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_MAXVALUE','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_MAXVALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_ITEM_MINVALUE' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_MINVALUE')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_MINVALUE')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_MINVALUE')+">")
            arrHtml.push("<span colno='CDMI_ITEM_MINVALUE' class='"+ms.uiClass(formId, 'CDMI_ITEM_MINVALUE')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_MINVALUE')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_MINVALUE')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_MINVALUE','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_MINVALUE']+"</span>")
            arrHtml.push("</td>");
            if(v['CDMI_ITEM_CLASS'] =='状态值'){
                if(v['CDMI_ITEM_REAL']==0){
                     arrHtml.push("<td colno='CDMI_ITEM_REAL' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_REAL')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_REAL')+">")
                    arrHtml.push("<span colno='CDMI_ITEM_REAL' class='"+ms.uiClass(formId, 'CDMI_ITEM_REAL')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_REAL')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_REAL','IS_TITLE_ATTR',v)+"' >"+'OK'+"</span>")
                    arrHtml.push("</td>"); 
                }		else{
                     arrHtml.push("<td colno='CDMI_ITEM_REAL' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_REAL')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_REAL')+">")
                    arrHtml.push("<span colno='CDMI_ITEM_REAL' class='"+ms.uiClass(formId, 'CDMI_ITEM_REAL')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_REAL')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_REAL','IS_TITLE_ATTR',v)+"' >"+'NG'+"</span>")
                    arrHtml.push("</td>"); 
                }
                
            }else{
             arrHtml.push("<td colno='CDMI_ITEM_REAL' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_REAL')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_REAL')+">")
            arrHtml.push("<span colno='CDMI_ITEM_REAL' class='"+ms.uiClass(formId, 'CDMI_ITEM_REAL')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_REAL')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_REAL')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_REAL','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_REAL']+"</span>")
            arrHtml.push("</td>"); 
            }
            
            arrHtml.push("<td colno='CDMI_ITEM_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_ITEM_UNIT')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CDMI_ITEM_UNIT')+"' "+ms.tdEvent(formId, 'CDMI_ITEM_UNIT')+">")
            arrHtml.push("<span colno='CDMI_ITEM_UNIT' class='"+ms.uiClass(formId, 'CDMI_ITEM_UNIT')+"' style='"+ms.uiStyle(formId, 'CDMI_ITEM_UNIT')+"' "+ms.uiEvent(formId, 'CDMI_ITEM_UNIT')+" title='"+ms.titleAttr(formId,'CDMI_ITEM_UNIT','IS_TITLE_ATTR',v)+"' >"+v['CDMI_ITEM_UNIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDMI_MT_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'CDMI_MT_CONTENT')+"' style='width:150px; "+ms.tdEvent(formId, 'CDMI_MT_CONTENT')+">")
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
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
    
$(function(){
$("#5a7e08bd3f5246519851f99d42e3f581").attr("style","display:none;");
})
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//设备建档
function itemJump1(obj){
      winOptMethod.jump("574da5a0885547d58d4ea2db64af2158","F3181","jumpId",obj);
}  

</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
