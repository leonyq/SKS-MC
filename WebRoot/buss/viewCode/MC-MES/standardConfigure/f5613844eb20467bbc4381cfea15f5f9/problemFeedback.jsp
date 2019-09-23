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
		<dict:lang value="VM-问题反馈" />
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
		<bu:header formId ="00bc67ca8c8a456785891b90e2f470c3"/>

    
  
    <!-- head里面 -->
    <!-- 产品静态资源 -->

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="ffedbbfa04294d658809693b787a8728" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="ffedbbfa04294d658809693b787a8728" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage00bc67ca8c8a456785891b90e2f470c3" id="formPage00bc67ca8c8a456785891b90e2f470c3" value="${formPage00bc67ca8c8a456785891b90e2f470c3}"/>
		<input type="hidden" name="formId" id="formId1" value='00bc67ca8c8a456785891b90e2f470c3'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="00bc67ca8c8a456785891b90e2f470c3">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax00bc67ca8c8a456785891b90e2f470c3" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner head" id="datagrid-header-inner00bc67ca8c8a456785891b90e2f470c3">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable00bc67ca8c8a456785891b90e2f470c3" style="table-layout:fixed;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="00bc67ca8c8a456785891b90e2f470c3" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_00bc67ca8c8a456785891b90e2f470c3" onclick="_selectAjaxTableAllData(this,'00bc67ca8c8a456785891b90e2f470c3')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:170px;"><bu:uitn colNo="CPF_SN" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CPF_STATUS" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CPF_TYPE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
            <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CPF_PROBLEM_BELONG" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>			
            <td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CPF_PRIORITY" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="CPF_PROBLEM_PROJECT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:300px;"><bu:uitn colNo="CPF_ABSTRACT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:300px;"><bu:uitn colNo="CPF_DESCRIBE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPF_PROPOSAL_SCHEME" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CPF_REQUEST_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CPF_LAUNCH_EMP" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPF_LAUNCH_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPF_LIABILITY_DEPT" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CPF_HANDLE_EMP" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
		    <td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CPF_HANDLE_DATE" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>	
            <td class="datagrid-cell" style="width:150px;" ><bu:uitn colNo="CPF_HANDLE_WAY" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
            <td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CPF_EXPECTED_COMPLETION_TIME" formId="00bc67ca8c8a456785891b90e2f470c3" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax scroll" id="tableDiv00bc67ca8c8a456785891b90e2f470c3" onscroll="ajaxTableScroll(this,'00bc67ca8c8a456785891b90e2f470c3')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax00bc67ca8c8a456785891b90e2f470c3" stylr=" table-layout:fixed;">
		<tbody id="tbody_00bc67ca8c8a456785891b90e2f470c3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage00bc67ca8c8a456785891b90e2f470c3==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=00bc67ca8c8a456785891b90e2f470c3&showLoading=0" />
			</div>
		</c:if>

        
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="ffedbbfa04294d658809693b787a8728" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="ffedbbfa04294d658809693b787a8728" />
    
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
    if(formId=='00bc67ca8c8a456785891b90e2f470c3'){<%--FM-问题反馈信息--%>
    $('.scroll').mCustomScrollbar("destroy");
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"'  style='width:200px; text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>"); 
            arrHtml.push("<td colno='CPF_SN' class='datagrid-cell "+ms.tdClass(formId, 'CPF_SN')+"'  style='width:170px; text-align:center;"+ms.tdStyle(formId, 'CPF_SN')+"' "+ms.tdEvent(formId, 'CPF_SN')+">")
            arrHtml.push("<span colno='CPF_SN' class='"+ms.uiClass(formId, 'CPF_SN')+"' style='"+ms.uiStyle(formId, 'CPF_SN')+"' "+ms.uiEvent(formId, 'CPF_SN')+" title='"+ms.titleAttr(formId,'CPF_SN','IS_TITLE_ATTR',v)+"' >"+v['CPF_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CPF_STATUS')+"' style='width:80px; text-align:center;"+ms.tdStyle(formId, 'CPF_STATUS')+"' "+ms.tdEvent(formId, 'CPF_STATUS')+">")
            arrHtml.push("<span colno='CPF_STATUS' class='"+ms.uiClass(formId, 'CPF_STATUS')+"' style='"+ms.uiStyle(formId, 'CPF_STATUS')+"' "+ms.uiEvent(formId, 'CPF_STATUS')+" title='"+ms.titleAttr(formId,'CPF_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CPF_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CPF_TYPE')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'CPF_TYPE')+"' "+ms.tdEvent(formId, 'CPF_TYPE')+">")
            arrHtml.push("<span colno='CPF_TYPE' class='"+ms.uiClass(formId, 'CPF_TYPE')+"' style='"+ms.uiStyle(formId, 'CPF_TYPE')+"' "+ms.uiEvent(formId, 'CPF_TYPE')+" title='"+ms.titleAttr(formId,'CPF_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CPF_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_PROBLEM_BELONG' class='datagrid-cell "+ms.tdClass(formId, 'CPF_PROBLEM_BELONG')+"' style='width:80px; text-align:center;"+ms.tdStyle(formId, 'CPF_PROBLEM_BELONG')+"' "+ms.tdEvent(formId, 'CPF_PROBLEM_BELONG')+">")
            arrHtml.push("<span colno='CPF_PROBLEM_BELONG' class='"+ms.uiClass(formId, 'CPF_PROBLEM_BELONG')+"' style='"+ms.uiStyle(formId, 'CPF_PROBLEM_BELONG')+"' "+ms.uiEvent(formId, 'CPF_PROBLEM_BELONG')+" title='"+ms.titleAttr(formId,'CPF_PROBLEM_BELONG','IS_TITLE_ATTR',v)+"' >"+v['CPF_PROBLEM_BELONG']+"</span>")
            arrHtml.push("</td>");			
            arrHtml.push("<td colno='CPF_PRIORITY' class='datagrid-cell "+ms.tdClass(formId, 'CPF_PRIORITY')+"' style='width:80px; text-align:center;"+ms.tdStyle(formId, 'CPF_PRIORITY')+"' "+ms.tdEvent(formId, 'CPF_PRIORITY')+">")
            arrHtml.push("<span colno='CPF_PRIORITY' class='"+ms.uiClass(formId, 'CPF_PRIORITY')+"' style='"+ms.uiStyle(formId, 'CPF_PRIORITY')+"' "+ms.uiEvent(formId, 'CPF_PRIORITY')+" title='"+ms.titleAttr(formId,'CPF_PRIORITY','IS_TITLE_ATTR',v)+"' >"+v['CPF_PRIORITY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_PROBLEM_PROJECT' class='datagrid-cell "+ms.tdClass(formId, 'CPF_PROBLEM_PROJECT')+"'style='width:100px; text-align:center;"+ms.tdStyle(formId, 'CPF_PROBLEM_PROJECT')+"' "+ms.tdEvent(formId, 'CPF_PROBLEM_PROJECT')+">")
            arrHtml.push("<span colno='CPF_PROBLEM_PROJECT' class='"+ms.uiClass(formId, 'CPF_PROBLEM_PROJECT')+"' style='"+ms.uiStyle(formId, 'CPF_PROBLEM_PROJECT')+"' "+ms.uiEvent(formId, 'CPF_PROBLEM_PROJECT')+" title='"+ms.titleAttr(formId,'CPF_PROBLEM_PROJECT','IS_TITLE_ATTR',v)+"' >"+v['CPF_PROBLEM_PROJECT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_ABSTRACT' class='datagrid-cell "+ms.tdClass(formId, 'CPF_ABSTRACT')+"' style='width:300px;"+ms.tdStyle(formId, 'CPF_ABSTRACT')+"' "+ms.tdEvent(formId, 'CPF_ABSTRACT')+">")
            arrHtml.push("<span colno='CPF_ABSTRACT' class='"+ms.uiClass(formId, 'CPF_ABSTRACT')+"' style='"+ms.uiStyle(formId, 'CPF_ABSTRACT')+"' "+ms.uiEvent(formId, 'CPF_ABSTRACT')+" title='"+ms.titleAttr(formId,'CPF_ABSTRACT','IS_TITLE_ATTR',v)+"' >"+v['CPF_ABSTRACT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_DESCRIBE' class='datagrid-cell "+ms.tdClass(formId, 'CPF_DESCRIBE')+"' style='width:300px;padding:3px 5px;"+ms.tdStyle(formId, 'CPF_DESCRIBE')+"' "+ms.tdEvent(formId, 'CPF_DESCRIBE')+">")
            arrHtml.push("<span colno='CPF_DESCRIBE' class='"+ms.uiClass(formId, 'CPF_DESCRIBE')+"' style='height:20px;"+ms.uiStyle(formId, 'CPF_DESCRIBE')+"' "+ms.uiEvent(formId, 'CPF_DESCRIBE')+" title='"+ms.titleAttr(formId,'CPF_DESCRIBE','IS_TITLE_ATTR',v)+"' >"+v['CPF_DESCRIBE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_PROPOSAL_SCHEME' class='datagrid-cell "+ms.tdClass(formId, 'CPF_PROPOSAL_SCHEME')+"' style='width:150px;"+ms.tdStyle(formId, 'CPF_PROPOSAL_SCHEME')+"' "+ms.tdEvent(formId, 'CPF_PROPOSAL_SCHEME')+">")
            arrHtml.push("<span colno='CPF_PROPOSAL_SCHEME' class='"+ms.uiClass(formId, 'CPF_PROPOSAL_SCHEME')+"' style='height:30px;"+ms.uiStyle(formId, 'CPF_PROPOSAL_SCHEME')+"' "+ms.uiEvent(formId, 'CPF_PROPOSAL_SCHEME')+" title='"+ms.titleAttr(formId,'CPF_PROPOSAL_SCHEME','IS_TITLE_ATTR',v)+"' >"+v['CPF_PROPOSAL_SCHEME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_REQUEST_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CPF_REQUEST_DATE')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'CPF_REQUEST_DATE')+"' "+ms.tdEvent(formId, 'CPF_REQUEST_DATE')+">")
            arrHtml.push("<span colno='CPF_REQUEST_DATE' class='"+ms.uiClass(formId, 'CPF_REQUEST_DATE')+"' style='"+ms.uiStyle(formId, 'CPF_REQUEST_DATE')+"' "+ms.uiEvent(formId, 'CPF_REQUEST_DATE')+" title='"+ms.titleAttr(formId,'CPF_REQUEST_DATE','IS_TITLE_ATTR',v)+"' >"+v['CPF_REQUEST_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_LAUNCH_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CPF_LAUNCH_EMP')+"'  style='width:80px; text-align:center;"+ms.tdStyle(formId, 'CPF_LAUNCH_EMP')+"' "+ms.tdEvent(formId, 'CPF_LAUNCH_EMP')+">")
            arrHtml.push("<span colno='CPF_LAUNCH_EMP' class='"+ms.uiClass(formId, 'CPF_LAUNCH_EMP')+"' style='"+ms.uiStyle(formId, 'CPF_LAUNCH_EMP')+"' "+ms.uiEvent(formId, 'CPF_LAUNCH_EMP')+" title='"+ms.titleAttr(formId,'CPF_LAUNCH_EMP','IS_TITLE_ATTR',v)+"' >"+v['CPF_LAUNCH_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_LAUNCH_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CPF_LAUNCH_DATE')+"'  style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CPF_LAUNCH_DATE')+"' "+ms.tdEvent(formId, 'CPF_LAUNCH_DATE')+">")
            arrHtml.push("<span colno='CPF_LAUNCH_DATE' class='"+ms.uiClass(formId, 'CPF_LAUNCH_DATE')+"' style='"+ms.uiStyle(formId, 'CPF_LAUNCH_DATE')+"' "+ms.uiEvent(formId, 'CPF_LAUNCH_DATE')+" title='"+ms.titleAttr(formId,'CPF_LAUNCH_DATE','IS_TITLE_ATTR',v)+"' >"+v['CPF_LAUNCH_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_LIABILITY_DEPT' class='datagrid-cell "+ms.tdClass(formId, 'CPF_LIABILITY_DEPT')+"'style='width:150px; text-align:center;"+ms.tdStyle(formId, 'CPF_LIABILITY_DEPT')+"' "+ms.tdEvent(formId, 'CPF_LIABILITY_DEPT')+">")
            arrHtml.push("<span colno='CPF_LIABILITY_DEPT' class='"+ms.uiClass(formId, 'CPF_LIABILITY_DEPT')+"' style='"+ms.uiStyle(formId, 'CPF_LIABILITY_DEPT')+"' "+ms.uiEvent(formId, 'CPF_LIABILITY_DEPT')+" title='"+ms.titleAttr(formId,'CPF_LIABILITY_DEPT','IS_TITLE_ATTR',v)+"' >"+v['CPF_LIABILITY_DEPT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_HANDLE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CPF_HANDLE_EMP')+"'style='width:80px; text-align:center;"+ms.tdStyle(formId, 'CPF_HANDLE_EMP')+"' "+ms.tdEvent(formId, 'CPF_HANDLE_EMP')+">")
            arrHtml.push("<span colno='CPF_HANDLE_EMP' class='"+ms.uiClass(formId, 'CPF_HANDLE_EMP')+"' style='"+ms.uiStyle(formId, 'CPF_HANDLE_EMP')+"' "+ms.uiEvent(formId, 'CPF_HANDLE_EMP')+" title='"+ms.titleAttr(formId,'CPF_HANDLE_EMP','IS_TITLE_ATTR',v)+"' >"+v['CPF_HANDLE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_HANDLE_DATE' class='datagrid-cell "+ms.tdClass(formId, 'CPF_HANDLE_DATE')+"'  style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CPF_HANDLE_DATE')+"' "+ms.tdEvent(formId, 'CPF_HANDLE_DATE')+">")
            arrHtml.push("<span colno='CPF_HANDLE_DATE' class='"+ms.uiClass(formId, 'CPF_HANDLE_DATE')+"' style='"+ms.uiStyle(formId, 'CPF_HANDLE_DATE')+"' "+ms.uiEvent(formId, 'CPF_HANDLE_DATE')+" title='"+ms.titleAttr(formId,'CPF_HANDLE_DATE','IS_TITLE_ATTR',v)+"' >"+v['CPF_HANDLE_DATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_HANDLE_WAY' class='datagrid-cell "+ms.tdClass(formId, 'CPF_HANDLE_WAY')+"'  style='width:150px;padding:3px 5px;"+ms.tdStyle(formId, 'CPF_HANDLE_WAY')+"' "+ms.tdEvent(formId, 'CPF_HANDLE_WAY')+">")
            arrHtml.push("<span colno='CPF_HANDLE_WAY' class='"+ms.uiClass(formId, 'CPF_HANDLE_WAY')+"' style='height:20px;"+ms.uiStyle(formId, 'CPF_HANDLE_WAY')+"' "+ms.uiEvent(formId, 'CPF_HANDLE_WAY')+" title='"+ms.titleAttr(formId,'CPF_HANDLE_WAY','IS_TITLE_ATTR',v)+"' >"+v['CPF_HANDLE_WAY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPF_EXPECTED_COMPLETION_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CPF_EXPECTED_COMPLETION_TIME')+"'  style='width:120px; text-align:center;"+ms.tdStyle(formId, 'CPF_EXPECTED_COMPLETION_TIME')+"' "+ms.tdEvent(formId, 'CPF_EXPECTED_COMPLETION_TIME')+">")
            arrHtml.push("<span colno='CPF_EXPECTED_COMPLETION_TIME' class='"+ms.uiClass(formId, 'CPF_EXPECTED_COMPLETION_TIME')+"' style='"+ms.uiStyle(formId, 'CPF_EXPECTED_COMPLETION_TIME')+"' "+ms.uiEvent(formId, 'CPF_EXPECTED_COMPLETION_TIME')+" title='"+ms.titleAttr(formId,'CPF_EXPECTED_COMPLETION_TIME','IS_TITLE_ATTR',v)+"' >"+v['CPF_EXPECTED_COMPLETION_TIME']+"</span>")
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
    //setScroll();
    setPopScroll('.scroll','.head')
    $(".head").scrollLeft(0);
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
