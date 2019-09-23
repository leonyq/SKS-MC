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
		<dict:lang value="异常登记" />
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
		<bu:header formId ="2ea06dc3c4414e1db802eab7ed38e3ef"/>

    
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
		<bu:func viewId="d507edb6bdff442a834697140ffc1e5a" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="d507edb6bdff442a834697140ffc1e5a" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage2ea06dc3c4414e1db802eab7ed38e3ef" id="formPage2ea06dc3c4414e1db802eab7ed38e3ef" value="${formPage2ea06dc3c4414e1db802eab7ed38e3ef}"/>
		<input type="hidden" name="formId" id="formId1" value='2ea06dc3c4414e1db802eab7ed38e3ef'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="2ea06dc3c4414e1db802eab7ed38e3ef">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2ea06dc3c4414e1db802eab7ed38e3ef" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner2ea06dc3c4414e1db802eab7ed38e3ef">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2ea06dc3c4414e1db802eab7ed38e3ef">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="2ea06dc3c4414e1db802eab7ed38e3ef" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_2ea06dc3c4414e1db802eab7ed38e3ef" onclick="_selectAjaxTableAllData(this,'2ea06dc3c4414e1db802eab7ed38e3ef')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_TAI_PROJECT_ID" style="width:170px;" class="datagrid-cell"><bu:uitn colNo="TAI_PROJECT_ID" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_TYPE" style="width:70px;" class="datagrid-cell"><bu:uitn colNo="TAI_TYPE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="TAI_STATUS" style="width:60px;" class="datagrid-cell"><bu:uitn colNo="TAI_STATUS" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_MKDH" style="width:110px;" class="datagrid-cell"><bu:uitn colNo="TAI_MKDH" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_MKJD" style="width:50px;" class="datagrid-cell"><bu:uitn colNo="TAI_MKJD" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_MKBB" style="width:50px;" class="datagrid-cell"><bu:uitn colNo="TAI_MKBB" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_NUM" style="width:50px;" class="datagrid-cell"><bu:uitn colNo="TAI_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_MATTER_MODEL" style="width:130px;" class="datagrid-cell"><bu:uitn colNo="TAI_MATTER_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_FIND_TIME" style="width:130px;" class="datagrid-cell"><bu:uitn colNo="TAI_FIND_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_REPORT_EMP" style="width:60px;" class="datagrid-cell"><bu:uitn colNo="TAI_REPORT_EMP" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_DRAW_MARKMODEL" style="width:150px;" class="datagrid-cell"><bu:uitn colNo="TAI_DRAW_MARKMODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_DEVICE_MODEL" style="width:150px;" class="datagrid-cell"><bu:uitn colNo="TAI_DEVICE_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_SINGLE_NUM" style="width:70px;" class="datagrid-cell"><bu:uitn colNo="TAI_SINGLE_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_MISS_NUM" style="width:70px;" class="datagrid-cell"><bu:uitn colNo="TAI_MISS_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_INFO_DESCRIBE" style="width:180px;" class="datagrid-cell"><bu:uitn colNo="TAI_INFO_DESCRIBE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_HANDLE_OPTION" style="width:150px;" class="datagrid-cell"><bu:uitn colNo="TAI_HANDLE_OPTION" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_REASON" style="width:150px;" class="datagrid-cell"><bu:uitn colNo="TAI_REASON" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_HANDLE_DESCRIBE" style="width:150px;" class="datagrid-cell"><bu:uitn colNo="TAI_HANDLE_DESCRIBE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<td name="noprintset_TAI_SOLVE_TIME" style="width:130px;" class="datagrid-cell"><bu:uitn colNo="TAI_SOLVE_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv2ea06dc3c4414e1db802eab7ed38e3ef" onscroll="ajaxTableScroll(this,'2ea06dc3c4414e1db802eab7ed38e3ef')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2ea06dc3c4414e1db802eab7ed38e3ef">
		<tbody id="tbody_2ea06dc3c4414e1db802eab7ed38e3ef" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage2ea06dc3c4414e1db802eab7ed38e3ef==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=2ea06dc3c4414e1db802eab7ed38e3ef&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="d507edb6bdff442a834697140ffc1e5a" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d507edb6bdff442a834697140ffc1e5a" />
    
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
    if(formId=='2ea06dc3c4414e1db802eab7ed38e3ef'){<%--异常登记--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_PROJECT_ID' name='noprintset_TAI_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'TAI_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'TAI_PROJECT_ID')+"' "+ms.tdEvent(formId, 'TAI_PROJECT_ID')+">")
            arrHtml.push("<span colno='TAI_PROJECT_ID' class='"+ms.uiClass(formId, 'TAI_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'TAI_PROJECT_ID')+"' "+ms.uiEvent(formId, 'TAI_PROJECT_ID')+" title='"+ms.titleAttr(formId,'TAI_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['TAI_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_TYPE' name='noprintset_TAI_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TAI_TYPE')+"' style='text-align:center;"+ms.tdStyle(formId, 'TAI_TYPE')+"' "+ms.tdEvent(formId, 'TAI_TYPE')+">")
            arrHtml.push("<span colno='TAI_TYPE' class='"+ms.uiClass(formId, 'TAI_TYPE')+"' style='"+ms.uiStyle(formId, 'TAI_TYPE')+"' "+ms.uiEvent(formId, 'TAI_TYPE')+" title='"+ms.titleAttr(formId,'TAI_TYPE','IS_TITLE_ATTR',v)+"' >"+v['TAI_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_STATUS' name='TAI_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'TAI_STATUS')+"' style='text-align:center;"+ms.tdStyle(formId, 'TAI_STATUS')+"' "+ms.tdEvent(formId, 'TAI_STATUS')+">")
            arrHtml.push("<span colno='TAI_STATUS' class='"+ms.uiClass(formId, 'TAI_STATUS')+"' style='"+ms.uiStyle(formId, 'TAI_STATUS')+"' "+ms.uiEvent(formId, 'TAI_STATUS')+" title='"+ms.titleAttr(formId,'TAI_STATUS','IS_TITLE_ATTR',v)+"' >"+v['TAI_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_MKDH' name='noprintset_TAI_MKDH' class='datagrid-cell "+ms.tdClass(formId, 'TAI_MKDH')+"' style='"+ms.tdStyle(formId, 'TAI_MKDH')+"' "+ms.tdEvent(formId, 'TAI_MKDH')+">")
            arrHtml.push("<span colno='TAI_MKDH' class='"+ms.uiClass(formId, 'TAI_MKDH')+"' style='"+ms.uiStyle(formId, 'TAI_MKDH')+"' "+ms.uiEvent(formId, 'TAI_MKDH')+" title='"+ms.titleAttr(formId,'TAI_MKDH','IS_TITLE_ATTR',v)+"' >"+v['TAI_MKDH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_MKJD' name='noprintset_TAI_MKJD' class='datagrid-cell "+ms.tdClass(formId, 'TAI_MKJD')+"' style='"+ms.tdStyle(formId, 'TAI_MKJD')+"' "+ms.tdEvent(formId, 'TAI_MKJD')+">")
            arrHtml.push("<span colno='TAI_MKJD' class='"+ms.uiClass(formId, 'TAI_MKJD')+"' style='"+ms.uiStyle(formId, 'TAI_MKJD')+"' "+ms.uiEvent(formId, 'TAI_MKJD')+" title='"+ms.titleAttr(formId,'TAI_MKJD','IS_TITLE_ATTR',v)+"' >"+v['TAI_MKJD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_MKBB' name='noprintset_TAI_MKBB' class='datagrid-cell "+ms.tdClass(formId, 'TAI_MKBB')+"' style='"+ms.tdStyle(formId, 'TAI_MKBB')+"' "+ms.tdEvent(formId, 'TAI_MKBB')+">")
            arrHtml.push("<span colno='TAI_MKBB' class='"+ms.uiClass(formId, 'TAI_MKBB')+"' style='"+ms.uiStyle(formId, 'TAI_MKBB')+"' "+ms.uiEvent(formId, 'TAI_MKBB')+" title='"+ms.titleAttr(formId,'TAI_MKBB','IS_TITLE_ATTR',v)+"' >"+v['TAI_MKBB']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_NUM' name='noprintset_TAI_NUM' class='datagrid-cell "+ms.tdClass(formId, 'TAI_NUM')+"' style='"+ms.tdStyle(formId, 'TAI_NUM')+"' "+ms.tdEvent(formId, 'TAI_NUM')+">")
            arrHtml.push("<span colno='TAI_NUM' class='"+ms.uiClass(formId, 'TAI_NUM')+"' style='"+ms.uiStyle(formId, 'TAI_NUM')+"' "+ms.uiEvent(formId, 'TAI_NUM')+" title='"+ms.titleAttr(formId,'TAI_NUM','IS_TITLE_ATTR',v)+"' >"+v['TAI_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_MATTER_MODEL' name='noprintset_TAI_MATTER_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'TAI_MATTER_MODEL')+"' style='"+ms.tdStyle(formId, 'TAI_MATTER_MODEL')+"' "+ms.tdEvent(formId, 'TAI_MATTER_MODEL')+">")
            arrHtml.push("<span colno='TAI_MATTER_MODEL' class='"+ms.uiClass(formId, 'TAI_MATTER_MODEL')+"' style='"+ms.uiStyle(formId, 'TAI_MATTER_MODEL')+"' "+ms.uiEvent(formId, 'TAI_MATTER_MODEL')+" title='"+ms.titleAttr(formId,'TAI_MATTER_MODEL','IS_TITLE_ATTR',v)+"' >"+v['TAI_MATTER_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_FIND_TIME' name='noprintset_TAI_FIND_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TAI_FIND_TIME')+"' style='text-align:center;"+ms.tdStyle(formId, 'TAI_FIND_TIME')+"' "+ms.tdEvent(formId, 'TAI_FIND_TIME')+">")
            arrHtml.push("<span colno='TAI_FIND_TIME' class='"+ms.uiClass(formId, 'TAI_FIND_TIME')+"' style='"+ms.uiStyle(formId, 'TAI_FIND_TIME')+"' "+ms.uiEvent(formId, 'TAI_FIND_TIME')+" title='"+ms.titleAttr(formId,'TAI_FIND_TIME','IS_TITLE_ATTR',v)+"' >"+v['TAI_FIND_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_REPORT_EMP' name='noprintset_TAI_REPORT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'TAI_REPORT_EMP')+"' style='text-align:center;"+ms.tdStyle(formId, 'TAI_REPORT_EMP')+"' "+ms.tdEvent(formId, 'TAI_REPORT_EMP')+">")
            arrHtml.push("<span colno='TAI_REPORT_EMP' class='"+ms.uiClass(formId, 'TAI_REPORT_EMP')+"' style='"+ms.uiStyle(formId, 'TAI_REPORT_EMP')+"' "+ms.uiEvent(formId, 'TAI_REPORT_EMP')+" title='"+ms.titleAttr(formId,'TAI_REPORT_EMP','IS_TITLE_ATTR',v)+"' >"+v['TAI_REPORT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_DRAW_MARKMODEL' name='noprintset_TAI_DRAW_MARKMODEL' class='datagrid-cell "+ms.tdClass(formId, 'TAI_DRAW_MARKMODEL')+"' style='"+ms.tdStyle(formId, 'TAI_DRAW_MARKMODEL')+"' "+ms.tdEvent(formId, 'TAI_DRAW_MARKMODEL')+">")
            arrHtml.push("<span colno='TAI_DRAW_MARKMODEL' class='"+ms.uiClass(formId, 'TAI_DRAW_MARKMODEL')+"' style='"+ms.uiStyle(formId, 'TAI_DRAW_MARKMODEL')+"' "+ms.uiEvent(formId, 'TAI_DRAW_MARKMODEL')+" title='"+ms.titleAttr(formId,'TAI_DRAW_MARKMODEL','IS_TITLE_ATTR',v)+"' >"+v['TAI_DRAW_MARKMODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_DEVICE_MODEL' name='noprintset_TAI_DEVICE_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'TAI_DEVICE_MODEL')+"' style='"+ms.tdStyle(formId, 'TAI_DEVICE_MODEL')+"' "+ms.tdEvent(formId, 'TAI_DEVICE_MODEL')+">")
            arrHtml.push("<span colno='TAI_DEVICE_MODEL' class='"+ms.uiClass(formId, 'TAI_DEVICE_MODEL')+"' style='"+ms.uiStyle(formId, 'TAI_DEVICE_MODEL')+"' "+ms.uiEvent(formId, 'TAI_DEVICE_MODEL')+" title='"+ms.titleAttr(formId,'TAI_DEVICE_MODEL','IS_TITLE_ATTR',v)+"' >"+v['TAI_DEVICE_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_SINGLE_NUM' name='noprintset_TAI_SINGLE_NUM' class='datagrid-cell "+ms.tdClass(formId, 'TAI_SINGLE_NUM')+"' style='"+ms.tdStyle(formId, 'TAI_SINGLE_NUM')+"' "+ms.tdEvent(formId, 'TAI_SINGLE_NUM')+">")
            arrHtml.push("<span colno='TAI_SINGLE_NUM' class='"+ms.uiClass(formId, 'TAI_SINGLE_NUM')+"' style='"+ms.uiStyle(formId, 'TAI_SINGLE_NUM')+"' "+ms.uiEvent(formId, 'TAI_SINGLE_NUM')+" title='"+ms.titleAttr(formId,'TAI_SINGLE_NUM','IS_TITLE_ATTR',v)+"' >"+v['TAI_SINGLE_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_MISS_NUM' name='noprintset_TAI_MISS_NUM' class='datagrid-cell "+ms.tdClass(formId, 'TAI_MISS_NUM')+"' style='"+ms.tdStyle(formId, 'TAI_MISS_NUM')+"' "+ms.tdEvent(formId, 'TAI_MISS_NUM')+">")
            arrHtml.push("<span colno='TAI_MISS_NUM' class='"+ms.uiClass(formId, 'TAI_MISS_NUM')+"' style='"+ms.uiStyle(formId, 'TAI_MISS_NUM')+"' "+ms.uiEvent(formId, 'TAI_MISS_NUM')+" title='"+ms.titleAttr(formId,'TAI_MISS_NUM','IS_TITLE_ATTR',v)+"' >"+v['TAI_MISS_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_INFO_DESCRIBE' name='noprintset_TAI_INFO_DESCRIBE' class='datagrid-cell "+ms.tdClass(formId, 'TAI_INFO_DESCRIBE')+"' style='"+ms.tdStyle(formId, 'TAI_INFO_DESCRIBE')+"' "+ms.tdEvent(formId, 'TAI_INFO_DESCRIBE')+">")
            arrHtml.push("<span colno='TAI_INFO_DESCRIBE' class='"+ms.uiClass(formId, 'TAI_INFO_DESCRIBE')+"' style='"+ms.uiStyle(formId, 'TAI_INFO_DESCRIBE')+"' "+ms.uiEvent(formId, 'TAI_INFO_DESCRIBE')+" title='"+ms.titleAttr(formId,'TAI_INFO_DESCRIBE','IS_TITLE_ATTR',v)+"' >"+v['TAI_INFO_DESCRIBE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_HANDLE_OPTION' name='noprintset_TAI_HANDLE_OPTION' class='datagrid-cell "+ms.tdClass(formId, 'TAI_HANDLE_OPTION')+"' style='"+ms.tdStyle(formId, 'TAI_HANDLE_OPTION')+"' "+ms.tdEvent(formId, 'TAI_HANDLE_OPTION')+">")
            arrHtml.push("<span colno='TAI_HANDLE_OPTION' class='"+ms.uiClass(formId, 'TAI_HANDLE_OPTION')+"' style='"+ms.uiStyle(formId, 'TAI_HANDLE_OPTION')+"' "+ms.uiEvent(formId, 'TAI_HANDLE_OPTION')+" title='"+ms.titleAttr(formId,'TAI_HANDLE_OPTION','IS_TITLE_ATTR',v)+"' >"+v['TAI_HANDLE_OPTION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_REASON' name='noprintset_TAI_REASON' class='datagrid-cell "+ms.tdClass(formId, 'TAI_REASON')+"' style='"+ms.tdStyle(formId, 'TAI_REASON')+"' "+ms.tdEvent(formId, 'TAI_REASON')+">")
            arrHtml.push("<span colno='TAI_REASON' class='"+ms.uiClass(formId, 'TAI_REASON')+"' style='"+ms.uiStyle(formId, 'TAI_REASON')+"' "+ms.uiEvent(formId, 'TAI_REASON')+" title='"+ms.titleAttr(formId,'TAI_REASON','IS_TITLE_ATTR',v)+"' >"+v['TAI_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_HANDLE_DESCRIBE' name='noprintset_TAI_HANDLE_DESCRIBE' class='datagrid-cell "+ms.tdClass(formId, 'TAI_HANDLE_DESCRIBE')+"' style='"+ms.tdStyle(formId, 'TAI_HANDLE_DESCRIBE')+"' "+ms.tdEvent(formId, 'TAI_HANDLE_DESCRIBE')+">")
            arrHtml.push("<span colno='TAI_HANDLE_DESCRIBE' class='"+ms.uiClass(formId, 'TAI_HANDLE_DESCRIBE')+"' style='"+ms.uiStyle(formId, 'TAI_HANDLE_DESCRIBE')+"' "+ms.uiEvent(formId, 'TAI_HANDLE_DESCRIBE')+" title='"+ms.titleAttr(formId,'TAI_HANDLE_DESCRIBE','IS_TITLE_ATTR',v)+"' >"+v['TAI_HANDLE_DESCRIBE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TAI_SOLVE_TIME' name='noprintset_TAI_SOLVE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TAI_SOLVE_TIME')+"' style='"+ms.tdStyle(formId, 'TAI_SOLVE_TIME')+"' "+ms.tdEvent(formId, 'TAI_SOLVE_TIME')+">")
            arrHtml.push("<span colno='TAI_SOLVE_TIME' class='"+ms.uiClass(formId, 'TAI_SOLVE_TIME')+"' style='"+ms.uiStyle(formId, 'TAI_SOLVE_TIME')+"' "+ms.uiEvent(formId, 'TAI_SOLVE_TIME')+" title='"+ms.titleAttr(formId,'TAI_SOLVE_TIME','IS_TITLE_ATTR',v)+"' >"+v['TAI_SOLVE_TIME']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
