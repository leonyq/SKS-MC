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
		<dict:lang value="虚拟表测试3" />
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
		<bu:header formId ="cbeb90577d2b41239454b6278bfa0e44"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="e471039334c541e4b2508c1b974f12ea" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="e471039334c541e4b2508c1b974f12ea" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagecbeb90577d2b41239454b6278bfa0e44" id="formPagecbeb90577d2b41239454b6278bfa0e44" value="${formPagecbeb90577d2b41239454b6278bfa0e44}"/>
		<input type="hidden" name="formId" id="formId1" value='cbeb90577d2b41239454b6278bfa0e44'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="cbeb90577d2b41239454b6278bfa0e44">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxcbeb90577d2b41239454b6278bfa0e44" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innercbeb90577d2b41239454b6278bfa0e44">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablecbeb90577d2b41239454b6278bfa0e44">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="cbeb90577d2b41239454b6278bfa0e44" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_cbeb90577d2b41239454b6278bfa0e44" onclick="_selectAjaxTableAllData(this,'cbeb90577d2b41239454b6278bfa0e44')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="LOGIN_NAME" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PW" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ENABLE" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PHONE" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MOBILE" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="WEIXIN" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EMAIL" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="USER_TYPE" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PHOTO" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="FINGERPRINT" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EDIT_PW_TIME" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PHOTO_NAME" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ENGLISH_NAME" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EMP_SUP_CODE" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="EMP_CUST_CODE" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="AREA" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="UP_ID" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ROLE_ID" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="JOB_ID" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="ERP_CODE" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="IS_AUTH" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PARTITION_CODE" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="DEP_SN" formId="cbeb90577d2b41239454b6278bfa0e44" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivcbeb90577d2b41239454b6278bfa0e44" onscroll="ajaxTableScroll(this,'cbeb90577d2b41239454b6278bfa0e44')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxcbeb90577d2b41239454b6278bfa0e44">
		<tbody id="tbody_cbeb90577d2b41239454b6278bfa0e44" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagecbeb90577d2b41239454b6278bfa0e44==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=cbeb90577d2b41239454b6278bfa0e44&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="e471039334c541e4b2508c1b974f12ea" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="e471039334c541e4b2508c1b974f12ea" />
    
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
    if(formId=='cbeb90577d2b41239454b6278bfa0e44'){<%--虚拟表测试3--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LOGIN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'LOGIN_NAME')+"' style='"+ms.tdStyle(formId, 'LOGIN_NAME')+"' "+ms.tdEvent(formId, 'LOGIN_NAME')+">")
            arrHtml.push("<span colno='LOGIN_NAME' class='"+ms.uiClass(formId, 'LOGIN_NAME')+"' style='"+ms.uiStyle(formId, 'LOGIN_NAME')+"' "+ms.uiEvent(formId, 'LOGIN_NAME')+" title='"+ms.titleAttr(formId,'LOGIN_NAME','IS_TITLE_ATTR',v)+"' >"+v['LOGIN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PW' class='datagrid-cell "+ms.tdClass(formId, 'PW')+"' style='"+ms.tdStyle(formId, 'PW')+"' "+ms.tdEvent(formId, 'PW')+">")
            arrHtml.push("<span colno='PW' class='"+ms.uiClass(formId, 'PW')+"' style='"+ms.uiStyle(formId, 'PW')+"' "+ms.uiEvent(formId, 'PW')+" title='"+ms.titleAttr(formId,'PW','IS_TITLE_ATTR',v)+"' >"+v['PW']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ENABLE' class='datagrid-cell "+ms.tdClass(formId, 'ENABLE')+"' style='"+ms.tdStyle(formId, 'ENABLE')+"' "+ms.tdEvent(formId, 'ENABLE')+">")
            arrHtml.push("<span colno='ENABLE' class='"+ms.uiClass(formId, 'ENABLE')+"' style='"+ms.uiStyle(formId, 'ENABLE')+"' "+ms.uiEvent(formId, 'ENABLE')+" title='"+ms.titleAttr(formId,'ENABLE','IS_TITLE_ATTR',v)+"' >"+v['ENABLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHONE' class='datagrid-cell "+ms.tdClass(formId, 'PHONE')+"' style='"+ms.tdStyle(formId, 'PHONE')+"' "+ms.tdEvent(formId, 'PHONE')+">")
            arrHtml.push("<span colno='PHONE' class='"+ms.uiClass(formId, 'PHONE')+"' style='"+ms.uiStyle(formId, 'PHONE')+"' "+ms.uiEvent(formId, 'PHONE')+" title='"+ms.titleAttr(formId,'PHONE','IS_TITLE_ATTR',v)+"' >"+v['PHONE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MOBILE' class='datagrid-cell "+ms.tdClass(formId, 'MOBILE')+"' style='"+ms.tdStyle(formId, 'MOBILE')+"' "+ms.tdEvent(formId, 'MOBILE')+">")
            arrHtml.push("<span colno='MOBILE' class='"+ms.uiClass(formId, 'MOBILE')+"' style='"+ms.uiStyle(formId, 'MOBILE')+"' "+ms.uiEvent(formId, 'MOBILE')+" title='"+ms.titleAttr(formId,'MOBILE','IS_TITLE_ATTR',v)+"' >"+v['MOBILE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEIXIN' class='datagrid-cell "+ms.tdClass(formId, 'WEIXIN')+"' style='"+ms.tdStyle(formId, 'WEIXIN')+"' "+ms.tdEvent(formId, 'WEIXIN')+">")
            arrHtml.push("<span colno='WEIXIN' class='"+ms.uiClass(formId, 'WEIXIN')+"' style='"+ms.uiStyle(formId, 'WEIXIN')+"' "+ms.uiEvent(formId, 'WEIXIN')+" title='"+ms.titleAttr(formId,'WEIXIN','IS_TITLE_ATTR',v)+"' >"+v['WEIXIN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EMAIL' class='datagrid-cell "+ms.tdClass(formId, 'EMAIL')+"' style='"+ms.tdStyle(formId, 'EMAIL')+"' "+ms.tdEvent(formId, 'EMAIL')+">")
            arrHtml.push("<span colno='EMAIL' class='"+ms.uiClass(formId, 'EMAIL')+"' style='"+ms.uiStyle(formId, 'EMAIL')+"' "+ms.uiEvent(formId, 'EMAIL')+" title='"+ms.titleAttr(formId,'EMAIL','IS_TITLE_ATTR',v)+"' >"+v['EMAIL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='USER_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'USER_TYPE')+"' style='"+ms.tdStyle(formId, 'USER_TYPE')+"' "+ms.tdEvent(formId, 'USER_TYPE')+">")
            arrHtml.push("<span colno='USER_TYPE' class='"+ms.uiClass(formId, 'USER_TYPE')+"' style='"+ms.uiStyle(formId, 'USER_TYPE')+"' "+ms.uiEvent(formId, 'USER_TYPE')+" title='"+ms.titleAttr(formId,'USER_TYPE','IS_TITLE_ATTR',v)+"' >"+v['USER_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO')+"' style='"+ms.tdStyle(formId, 'PHOTO')+"' "+ms.tdEvent(formId, 'PHOTO')+">")
            arrHtml.push("<span colno='PHOTO' class='"+ms.uiClass(formId, 'PHOTO')+"' style='"+ms.uiStyle(formId, 'PHOTO')+"' "+ms.uiEvent(formId, 'PHOTO')+" title='"+ms.titleAttr(formId,'PHOTO','IS_TITLE_ATTR',v)+"' >"+v['PHOTO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FINGERPRINT' class='datagrid-cell "+ms.tdClass(formId, 'FINGERPRINT')+"' style='"+ms.tdStyle(formId, 'FINGERPRINT')+"' "+ms.tdEvent(formId, 'FINGERPRINT')+">")
            arrHtml.push("<span colno='FINGERPRINT' class='"+ms.uiClass(formId, 'FINGERPRINT')+"' style='"+ms.uiStyle(formId, 'FINGERPRINT')+"' "+ms.uiEvent(formId, 'FINGERPRINT')+" title='"+ms.titleAttr(formId,'FINGERPRINT','IS_TITLE_ATTR',v)+"' >"+v['FINGERPRINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EDIT_PW_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_PW_TIME')+"' style='"+ms.tdStyle(formId, 'EDIT_PW_TIME')+"' "+ms.tdEvent(formId, 'EDIT_PW_TIME')+">")
            arrHtml.push("<span colno='EDIT_PW_TIME' class='"+ms.uiClass(formId, 'EDIT_PW_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_PW_TIME')+"' "+ms.uiEvent(formId, 'EDIT_PW_TIME')+" title='"+ms.titleAttr(formId,'EDIT_PW_TIME','IS_TITLE_ATTR',v)+"' >"+v['EDIT_PW_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHOTO_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PHOTO_NAME')+"' style='"+ms.tdStyle(formId, 'PHOTO_NAME')+"' "+ms.tdEvent(formId, 'PHOTO_NAME')+">")
            arrHtml.push("<span colno='PHOTO_NAME' class='"+ms.uiClass(formId, 'PHOTO_NAME')+"' style='"+ms.uiStyle(formId, 'PHOTO_NAME')+"' "+ms.uiEvent(formId, 'PHOTO_NAME')+" title='"+ms.titleAttr(formId,'PHOTO_NAME','IS_TITLE_ATTR',v)+"' >"+v['PHOTO_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ENGLISH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'ENGLISH_NAME')+"' style='"+ms.tdStyle(formId, 'ENGLISH_NAME')+"' "+ms.tdEvent(formId, 'ENGLISH_NAME')+">")
            arrHtml.push("<span colno='ENGLISH_NAME' class='"+ms.uiClass(formId, 'ENGLISH_NAME')+"' style='"+ms.uiStyle(formId, 'ENGLISH_NAME')+"' "+ms.uiEvent(formId, 'ENGLISH_NAME')+" title='"+ms.titleAttr(formId,'ENGLISH_NAME','IS_TITLE_ATTR',v)+"' >"+v['ENGLISH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EMP_SUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'EMP_SUP_CODE')+"' style='"+ms.tdStyle(formId, 'EMP_SUP_CODE')+"' "+ms.tdEvent(formId, 'EMP_SUP_CODE')+">")
            arrHtml.push("<span colno='EMP_SUP_CODE' class='"+ms.uiClass(formId, 'EMP_SUP_CODE')+"' style='"+ms.uiStyle(formId, 'EMP_SUP_CODE')+"' "+ms.uiEvent(formId, 'EMP_SUP_CODE')+" title='"+ms.titleAttr(formId,'EMP_SUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['EMP_SUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='EMP_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'EMP_CUST_CODE')+"' style='"+ms.tdStyle(formId, 'EMP_CUST_CODE')+"' "+ms.tdEvent(formId, 'EMP_CUST_CODE')+">")
            arrHtml.push("<span colno='EMP_CUST_CODE' class='"+ms.uiClass(formId, 'EMP_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'EMP_CUST_CODE')+"' "+ms.uiEvent(formId, 'EMP_CUST_CODE')+" title='"+ms.titleAttr(formId,'EMP_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['EMP_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA' class='datagrid-cell "+ms.tdClass(formId, 'AREA')+"' style='"+ms.tdStyle(formId, 'AREA')+"' "+ms.tdEvent(formId, 'AREA')+">")
            arrHtml.push("<span colno='AREA' class='"+ms.uiClass(formId, 'AREA')+"' style='"+ms.uiStyle(formId, 'AREA')+"' "+ms.uiEvent(formId, 'AREA')+" title='"+ms.titleAttr(formId,'AREA','IS_TITLE_ATTR',v)+"' >"+v['AREA']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='UP_ID' class='datagrid-cell "+ms.tdClass(formId, 'UP_ID')+"' style='"+ms.tdStyle(formId, 'UP_ID')+"' "+ms.tdEvent(formId, 'UP_ID')+">")
            arrHtml.push("<span colno='UP_ID' class='"+ms.uiClass(formId, 'UP_ID')+"' style='"+ms.uiStyle(formId, 'UP_ID')+"' "+ms.uiEvent(formId, 'UP_ID')+" title='"+ms.titleAttr(formId,'UP_ID','IS_TITLE_ATTR',v)+"' >"+v['UP_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ROLE_ID' class='datagrid-cell "+ms.tdClass(formId, 'ROLE_ID')+"' style='"+ms.tdStyle(formId, 'ROLE_ID')+"' "+ms.tdEvent(formId, 'ROLE_ID')+">")
            arrHtml.push("<span colno='ROLE_ID' class='"+ms.uiClass(formId, 'ROLE_ID')+"' style='"+ms.uiStyle(formId, 'ROLE_ID')+"' "+ms.uiEvent(formId, 'ROLE_ID')+" title='"+ms.titleAttr(formId,'ROLE_ID','IS_TITLE_ATTR',v)+"' >"+v['ROLE_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='JOB_ID' class='datagrid-cell "+ms.tdClass(formId, 'JOB_ID')+"' style='"+ms.tdStyle(formId, 'JOB_ID')+"' "+ms.tdEvent(formId, 'JOB_ID')+">")
            arrHtml.push("<span colno='JOB_ID' class='"+ms.uiClass(formId, 'JOB_ID')+"' style='"+ms.uiStyle(formId, 'JOB_ID')+"' "+ms.uiEvent(formId, 'JOB_ID')+" title='"+ms.titleAttr(formId,'JOB_ID','IS_TITLE_ATTR',v)+"' >"+v['JOB_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ERP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'ERP_CODE')+"' style='"+ms.tdStyle(formId, 'ERP_CODE')+"' "+ms.tdEvent(formId, 'ERP_CODE')+">")
            arrHtml.push("<span colno='ERP_CODE' class='"+ms.uiClass(formId, 'ERP_CODE')+"' style='"+ms.uiStyle(formId, 'ERP_CODE')+"' "+ms.uiEvent(formId, 'ERP_CODE')+" title='"+ms.titleAttr(formId,'ERP_CODE','IS_TITLE_ATTR',v)+"' >"+v['ERP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IS_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'IS_AUTH')+"' style='"+ms.tdStyle(formId, 'IS_AUTH')+"' "+ms.tdEvent(formId, 'IS_AUTH')+">")
            arrHtml.push("<span colno='IS_AUTH' class='"+ms.uiClass(formId, 'IS_AUTH')+"' style='"+ms.uiStyle(formId, 'IS_AUTH')+"' "+ms.uiEvent(formId, 'IS_AUTH')+" title='"+ms.titleAttr(formId,'IS_AUTH','IS_TITLE_ATTR',v)+"' >"+v['IS_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PARTITION_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PARTITION_CODE')+"' style='"+ms.tdStyle(formId, 'PARTITION_CODE')+"' "+ms.tdEvent(formId, 'PARTITION_CODE')+">")
            arrHtml.push("<span colno='PARTITION_CODE' class='"+ms.uiClass(formId, 'PARTITION_CODE')+"' style='"+ms.uiStyle(formId, 'PARTITION_CODE')+"' "+ms.uiEvent(formId, 'PARTITION_CODE')+" title='"+ms.titleAttr(formId,'PARTITION_CODE','IS_TITLE_ATTR',v)+"' >"+v['PARTITION_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DEP_SN' class='datagrid-cell "+ms.tdClass(formId, 'DEP_SN')+"' style='"+ms.tdStyle(formId, 'DEP_SN')+"' "+ms.tdEvent(formId, 'DEP_SN')+">")
            arrHtml.push("<span colno='DEP_SN' class='"+ms.uiClass(formId, 'DEP_SN')+"' style='"+ms.uiStyle(formId, 'DEP_SN')+"' "+ms.uiEvent(formId, 'DEP_SN')+" title='"+ms.titleAttr(formId,'DEP_SN','IS_TITLE_ATTR',v)+"' >"+v['DEP_SN']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
