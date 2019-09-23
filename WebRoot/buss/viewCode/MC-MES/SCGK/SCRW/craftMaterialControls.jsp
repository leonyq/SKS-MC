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
		<dict:lang value="VM-工艺物料管控-new" />
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
		<bu:header formId ="99c3f63c8b62498589698545e9de3b18"/>

    
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
		<bu:func viewId="941ff4a8c7d34ee7983c8a215ef4fe27" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="941ff4a8c7d34ee7983c8a215ef4fe27" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage99c3f63c8b62498589698545e9de3b18" id="formPage99c3f63c8b62498589698545e9de3b18" value="${formPage99c3f63c8b62498589698545e9de3b18}"/>
		<input type="hidden" name="formId" id="formId1" value='99c3f63c8b62498589698545e9de3b18'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<input type="hidden" name="jumpId2" id="jumpId2" value='${param.jumpId2}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="99c3f63c8b62498589698545e9de3b18">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax99c3f63c8b62498589698545e9de3b18" >
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner99c3f63c8b62498589698545e9de3b18">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable99c3f63c8b62498589698545e9de3b18" style="min-width:1710px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="99c3f63c8b62498589698545e9de3b18" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_99c3f63c8b62498589698545e9de3b18" onclick="_selectAjaxTableAllData(this,'99c3f63c8b62498589698545e9de3b18')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CTI_MODEL_NAME" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CTI_MODEL_SPET" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_ITEM_NAME" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_ITEM_SPEC" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="CTI_PROCESS_FACE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CTI_SN_RULE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CREATE_USER" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CREATE_TIME" formId="99c3f63c8b62498589698545e9de3b18" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv99c3f63c8b62498589698545e9de3b18" onscroll="ajaxTableScroll(this,'99c3f63c8b62498589698545e9de3b18')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax99c3f63c8b62498589698545e9de3b18" style="min-width:1710px;">
		<tbody id="tbody_99c3f63c8b62498589698545e9de3b18" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage99c3f63c8b62498589698545e9de3b18==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=99c3f63c8b62498589698545e9de3b18&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="941ff4a8c7d34ee7983c8a215ef4fe27" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="941ff4a8c7d34ee7983c8a215ef4fe27" />
    
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
    if(formId=='99c3f63c8b62498589698545e9de3b18'){<%--工艺物料管控--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
                //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"'>"+v['DATA_AUTH']+"</span>")
                //arrHtml.push("</td>");
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_MODEL_CODE'  class='datagrid-cell "+ms.tdClass(formId, 'CTI_MODEL_CODE')+"' style='width:110px;"+ms.tdStyle(formId, 'CTI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CTI_MODEL_CODE')+">")
                arrHtml.push("<span colno='CTI_MODEL_CODE' class='"+ms.uiClass(formId, 'CTI_MODEL_CODE')+"' onclick='itemJump1(\""+v['CTI_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CTI_MODEL_CODE','IS_TITLE_ATTR',v)+"'>"+v['CTI_MODEL_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CTI_MODEL_NAME')+"' style='width:110px;"+ms.tdStyle(formId, 'CTI_MODEL_NAME')+"' "+ms.tdEvent(formId, 'CTI_MODEL_NAME')+">")
                arrHtml.push("<span colno='CTI_MODEL_NAME' class='"+ms.uiClass(formId, 'CTI_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'CTI_MODEL_NAME')+"' "+ms.uiEvent(formId, 'CTI_MODEL_NAME')+" title='"+ms.titleAttr(formId,'CTI_MODEL_NAME','IS_TITLE_ATTR',v)+"'>"+v['CTI_MODEL_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_MODEL_SPET' class='datagrid-cell "+ms.tdClass(formId, 'CTI_MODEL_SPET')+"' style='width:110px;"+ms.tdStyle(formId, 'CTI_MODEL_SPET')+"' "+ms.tdEvent(formId, 'CTI_MODEL_SPET')+">")
                arrHtml.push("<span colno='CTI_MODEL_SPET' class='"+ms.uiClass(formId, 'CTI_MODEL_SPET')+"' style='"+ms.uiStyle(formId, 'CTI_MODEL_SPET')+"' "+ms.uiEvent(formId, 'CTI_MODEL_SPET')+" title='"+ms.titleAttr(formId,'CTI_MODEL_SPET','IS_TITLE_ATTR',v)+"'>"+v['CTI_MODEL_SPET']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'CTI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CTI_ITEM_TYPE')+">")
                arrHtml.push("<span colno='CTI_ITEM_TYPE' class='"+ms.uiClass(formId, 'CTI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CTI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CTI_ITEM_TYPE','IS_TITLE_ATTR',v)+"'>"+v['CTI_ITEM_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_CODE'  class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CTI_ITEM_CODE')+">")
                arrHtml.push("<span colno='CTI_ITEM_CODE' class='"+ms.uiClass(formId, 'CTI_ITEM_CODE')+"' onclick='itemJump2(\""+v['CTI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CTI_ITEM_CODE','IS_TITLE_ATTR',v)+"'>"+v['CTI_ITEM_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CTI_ITEM_NAME')+">")
                arrHtml.push("<span colno='CTI_ITEM_NAME' class='"+ms.uiClass(formId, 'CTI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CTI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CTI_ITEM_NAME','IS_TITLE_ATTR',v)+"'>"+v['CTI_ITEM_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CTI_ITEM_SPEC')+">")
                arrHtml.push("<span colno='CTI_ITEM_SPEC' class='"+ms.uiClass(formId, 'CTI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CTI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'CTI_ITEM_SPEC','IS_TITLE_ATTR',v)+"'>"+v['CTI_ITEM_SPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CTI_PRODUCT_STEP')+"' style='width:90px;"+ms.tdStyle(formId, 'CTI_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CTI_PRODUCT_STEP')+">")
                arrHtml.push("<span colno='CTI_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CTI_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CTI_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CTI_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'CTI_PRODUCT_STEP','IS_TITLE_ATTR',v)+"'>"+v['CTI_PRODUCT_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_PROCESS_FACE')+"' style='width:90px;"+ms.tdStyle(formId, 'CTI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CTI_PROCESS_FACE')+">")
                arrHtml.push("<span colno='CTI_PROCESS_FACE' class='"+ms.uiClass(formId, 'CTI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CTI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CTI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CTI_PROCESS_FACE','IS_TITLE_ATTR',v)+"'>"+v['CTI_PROCESS_FACE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_GROUP'  class='datagrid-cell "+ms.tdClass(formId, 'CTI_GROUP')+"' style='width:110px;"+ms.tdStyle(formId, 'CTI_GROUP')+"' "+ms.tdEvent(formId, 'CTI_GROUP')+">")
                arrHtml.push("<span colno='CTI_GROUP' class='"+ms.uiClass(formId, 'CTI_GROUP')+"' onclick='itemJump3(\""+v['CTI_GROUP']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTI_GROUP')+" title='"+ms.titleAttr(formId,'CTI_GROUP','IS_TITLE_ATTR',v)+"'>"+v['CTI_GROUP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ASSB_QTY' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ASSB_QTY')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'CTI_ASSB_QTY')+"' "+ms.tdEvent(formId, 'CTI_ASSB_QTY')+">")
                arrHtml.push("<span colno='CTI_ASSB_QTY' class='"+ms.uiClass(formId, 'CTI_ASSB_QTY')+"' style='"+ms.uiStyle(formId, 'CTI_ASSB_QTY')+"' "+ms.uiEvent(formId, 'CTI_ASSB_QTY')+" title='"+ms.titleAttr(formId,'CTI_ASSB_QTY','IS_TITLE_ATTR',v)+"'>"+v['CTI_ASSB_QTY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_CONTROL_MODE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_CONTROL_MODE')+"' style='width:70px;"+ms.tdStyle(formId, 'CTI_CONTROL_MODE')+"' "+ms.tdEvent(formId, 'CTI_CONTROL_MODE')+">")
                arrHtml.push("<span colno='CTI_CONTROL_MODE' class='"+ms.uiClass(formId, 'CTI_CONTROL_MODE')+"' style='"+ms.uiStyle(formId, 'CTI_CONTROL_MODE')+"' "+ms.uiEvent(formId, 'CTI_CONTROL_MODE')+" title='"+ms.titleAttr(formId,'CTI_CONTROL_MODE','IS_TITLE_ATTR',v)+"'>"+v['CTI_CONTROL_MODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_ITEM_SOURCE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_ITEM_SOURCE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_ITEM_SOURCE')+"' "+ms.tdEvent(formId, 'CTI_ITEM_SOURCE')+">")
                arrHtml.push("<span colno='CTI_ITEM_SOURCE' class='"+ms.uiClass(formId, 'CTI_ITEM_SOURCE')+"' style='"+ms.uiStyle(formId, 'CTI_ITEM_SOURCE')+"' "+ms.uiEvent(formId, 'CTI_ITEM_SOURCE')+" title='"+ms.titleAttr(formId,'CTI_ITEM_SOURCE','IS_TITLE_ATTR',v)+"'>"+v['CTI_ITEM_SOURCE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CTI_SN_RULE' class='datagrid-cell "+ms.tdClass(formId, 'CTI_SN_RULE')+"' style='width:150px;"+ms.tdStyle(formId, 'CTI_SN_RULE')+"' "+ms.tdEvent(formId, 'CTI_SN_RULE')+">")
                arrHtml.push("<span colno='CTI_SN_RULE' class='"+ms.uiClass(formId, 'CTI_SN_RULE')+"' style='"+ms.uiStyle(formId, 'CTI_SN_RULE')+"' "+ms.uiEvent(formId, 'CTI_SN_RULE')+" title='"+ms.titleAttr(formId,'CTI_SN_RULE','IS_TITLE_ATTR',v)+"'>"+v['CTI_SN_RULE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:80px;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
                arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"'>"+v['CREATE_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
                arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"'>"+v['CREATE_TIME']+"</span>")
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
function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#CTI_MODEL_CODE_SHOW").val(jumpId);
                  $("#CTI_MODEL_CODE").val(jumpId);
                  }   
                  var jumpId2 = $("#jumpId2").val();  
              		if(jumpId2!=""){
                  $("#CTI_ITEM_CODE").val(jumpId2);
                  }    
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//BOM管理
function itemJump1(obj){
      winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
}  


//物料信息
function itemJump2(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//工序定义
function itemJump3(obj){
    winOptMethod.jump("b074327f728643948b734bce9a5f7fc9","F3158","jumpId",obj);
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
