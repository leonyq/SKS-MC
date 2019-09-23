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
		<dict:lang value="555cjd人员列表" />
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
		<bu:header formId ="9d9f8050a76c44d5967fa121c9b132f9"/>

    
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
		<bu:func viewId="8c0a57b00ec145b795ebc300f85be769" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="8c0a57b00ec145b795ebc300f85be769" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage9d9f8050a76c44d5967fa121c9b132f9" id="formPage9d9f8050a76c44d5967fa121c9b132f9" value="${formPage9d9f8050a76c44d5967fa121c9b132f9}"/>
		<input type="hidden" name="formId" id="formId1" value='9d9f8050a76c44d5967fa121c9b132f9'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9d9f8050a76c44d5967fa121c9b132f9">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9d9f8050a76c44d5967fa121c9b132f9" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9d9f8050a76c44d5967fa121c9b132f9">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9d9f8050a76c44d5967fa121c9b132f9">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="9d9f8050a76c44d5967fa121c9b132f9" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9d9f8050a76c44d5967fa121c9b132f9" onclick="_selectAjaxTableAllData(this,'9d9f8050a76c44d5967fa121c9b132f9')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_CHECK" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SELECT4" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SELECT3" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SELECT2" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SELECT1" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SEX" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_NAME" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_ID" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="MUT_CHECK" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2TRT45999" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2TRT45" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2TRT4" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2TRT" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2DF" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW25" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2S" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="REPERSON_SW2" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2E" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2E5" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW232" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SW2" formId="9d9f8050a76c44d5967fa121c9b132f9" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9d9f8050a76c44d5967fa121c9b132f9" onscroll="ajaxTableScroll(this,'9d9f8050a76c44d5967fa121c9b132f9')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9d9f8050a76c44d5967fa121c9b132f9">
		<tbody id="tbody_9d9f8050a76c44d5967fa121c9b132f9" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9d9f8050a76c44d5967fa121c9b132f9==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9d9f8050a76c44d5967fa121c9b132f9&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="8c0a57b00ec145b795ebc300f85be769" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="8c0a57b00ec145b795ebc300f85be769" />
    
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
    if(formId=='9d9f8050a76c44d5967fa121c9b132f9'){<%--cjd人员表单名称--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_CHECK' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_CHECK')+"' style='"+ms.tdStyle(formId, 'PERSON_CHECK')+"' "+ms.tdEvent(formId, 'PERSON_CHECK')+">")
            arrHtml.push("<span colno='PERSON_CHECK' class='"+ms.uiClass(formId, 'PERSON_CHECK')+"' style='"+ms.uiStyle(formId, 'PERSON_CHECK')+"' "+ms.uiEvent(formId, 'PERSON_CHECK')+" title='"+ms.titleAttr(formId,'PERSON_CHECK','IS_TITLE_ATTR',v)+"' >"+v['PERSON_CHECK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SELECT4' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SELECT4')+"' style='"+ms.tdStyle(formId, 'PERSON_SELECT4')+"' "+ms.tdEvent(formId, 'PERSON_SELECT4')+">")
            arrHtml.push("<span colno='PERSON_SELECT4' class='"+ms.uiClass(formId, 'PERSON_SELECT4')+"' style='"+ms.uiStyle(formId, 'PERSON_SELECT4')+"' "+ms.uiEvent(formId, 'PERSON_SELECT4')+" title='"+ms.titleAttr(formId,'PERSON_SELECT4','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SELECT4']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SELECT3' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SELECT3')+"' style='"+ms.tdStyle(formId, 'PERSON_SELECT3')+"' "+ms.tdEvent(formId, 'PERSON_SELECT3')+">")
            arrHtml.push("<span colno='PERSON_SELECT3' class='"+ms.uiClass(formId, 'PERSON_SELECT3')+"' style='"+ms.uiStyle(formId, 'PERSON_SELECT3')+"' "+ms.uiEvent(formId, 'PERSON_SELECT3')+" title='"+ms.titleAttr(formId,'PERSON_SELECT3','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SELECT3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SELECT2' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SELECT2')+"' style='"+ms.tdStyle(formId, 'PERSON_SELECT2')+"' "+ms.tdEvent(formId, 'PERSON_SELECT2')+">")
            arrHtml.push("<span colno='PERSON_SELECT2' class='"+ms.uiClass(formId, 'PERSON_SELECT2')+"' style='"+ms.uiStyle(formId, 'PERSON_SELECT2')+"' "+ms.uiEvent(formId, 'PERSON_SELECT2')+" title='"+ms.titleAttr(formId,'PERSON_SELECT2','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SELECT2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SELECT1' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SELECT1')+"' style='"+ms.tdStyle(formId, 'PERSON_SELECT1')+"' "+ms.tdEvent(formId, 'PERSON_SELECT1')+">")
            arrHtml.push("<span colno='PERSON_SELECT1' class='"+ms.uiClass(formId, 'PERSON_SELECT1')+"' style='"+ms.uiStyle(formId, 'PERSON_SELECT1')+"' "+ms.uiEvent(formId, 'PERSON_SELECT1')+" title='"+ms.titleAttr(formId,'PERSON_SELECT1','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SELECT1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW')+"' style='"+ms.tdStyle(formId, 'PERSON_SW')+"' "+ms.tdEvent(formId, 'PERSON_SW')+">")
            arrHtml.push("<span colno='PERSON_SW' class='"+ms.uiClass(formId, 'PERSON_SW')+"' style='"+ms.uiStyle(formId, 'PERSON_SW')+"' "+ms.uiEvent(formId, 'PERSON_SW')+" title='"+ms.titleAttr(formId,'PERSON_SW','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SEX' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SEX')+"' style='"+ms.tdStyle(formId, 'PERSON_SEX')+"' "+ms.tdEvent(formId, 'PERSON_SEX')+">")
            arrHtml.push("<span colno='PERSON_SEX' class='"+ms.uiClass(formId, 'PERSON_SEX')+"' style='"+ms.uiStyle(formId, 'PERSON_SEX')+"' "+ms.uiEvent(formId, 'PERSON_SEX')+" title='"+ms.titleAttr(formId,'PERSON_SEX','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SEX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_NAME')+"' style='"+ms.tdStyle(formId, 'PERSON_NAME')+"' "+ms.tdEvent(formId, 'PERSON_NAME')+">")
            arrHtml.push("<span colno='PERSON_NAME' class='"+ms.uiClass(formId, 'PERSON_NAME')+"' style='"+ms.uiStyle(formId, 'PERSON_NAME')+"' "+ms.uiEvent(formId, 'PERSON_NAME')+" title='"+ms.titleAttr(formId,'PERSON_NAME','IS_TITLE_ATTR',v)+"' >"+v['PERSON_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_ID' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_ID')+"' style='"+ms.tdStyle(formId, 'PERSON_ID')+"' "+ms.tdEvent(formId, 'PERSON_ID')+">")
            arrHtml.push("<span colno='PERSON_ID' class='"+ms.uiClass(formId, 'PERSON_ID')+"' style='"+ms.uiStyle(formId, 'PERSON_ID')+"' "+ms.uiEvent(formId, 'PERSON_ID')+" title='"+ms.titleAttr(formId,'PERSON_ID','IS_TITLE_ATTR',v)+"' >"+v['PERSON_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MUT_CHECK' class='datagrid-cell "+ms.tdClass(formId, 'MUT_CHECK')+"' style='"+ms.tdStyle(formId, 'MUT_CHECK')+"' "+ms.tdEvent(formId, 'MUT_CHECK')+">")
            arrHtml.push("<span colno='MUT_CHECK' class='"+ms.uiClass(formId, 'MUT_CHECK')+"' style='"+ms.uiStyle(formId, 'MUT_CHECK')+"' "+ms.uiEvent(formId, 'MUT_CHECK')+" title='"+ms.titleAttr(formId,'MUT_CHECK','IS_TITLE_ATTR',v)+"' >"+v['MUT_CHECK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2TRT45999' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2TRT45999')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2TRT45999')+"' "+ms.tdEvent(formId, 'PERSON_SW2TRT45999')+">")
            arrHtml.push("<span colno='PERSON_SW2TRT45999' class='"+ms.uiClass(formId, 'PERSON_SW2TRT45999')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2TRT45999')+"' "+ms.uiEvent(formId, 'PERSON_SW2TRT45999')+" title='"+ms.titleAttr(formId,'PERSON_SW2TRT45999','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2TRT45999']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2TRT45' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2TRT45')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2TRT45')+"' "+ms.tdEvent(formId, 'PERSON_SW2TRT45')+">")
            arrHtml.push("<span colno='PERSON_SW2TRT45' class='"+ms.uiClass(formId, 'PERSON_SW2TRT45')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2TRT45')+"' "+ms.uiEvent(formId, 'PERSON_SW2TRT45')+" title='"+ms.titleAttr(formId,'PERSON_SW2TRT45','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2TRT45']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2TRT4' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2TRT4')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2TRT4')+"' "+ms.tdEvent(formId, 'PERSON_SW2TRT4')+">")
            arrHtml.push("<span colno='PERSON_SW2TRT4' class='"+ms.uiClass(formId, 'PERSON_SW2TRT4')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2TRT4')+"' "+ms.uiEvent(formId, 'PERSON_SW2TRT4')+" title='"+ms.titleAttr(formId,'PERSON_SW2TRT4','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2TRT4']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2TRT' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2TRT')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2TRT')+"' "+ms.tdEvent(formId, 'PERSON_SW2TRT')+">")
            arrHtml.push("<span colno='PERSON_SW2TRT' class='"+ms.uiClass(formId, 'PERSON_SW2TRT')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2TRT')+"' "+ms.uiEvent(formId, 'PERSON_SW2TRT')+" title='"+ms.titleAttr(formId,'PERSON_SW2TRT','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2TRT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2DF' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2DF')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2DF')+"' "+ms.tdEvent(formId, 'PERSON_SW2DF')+">")
            arrHtml.push("<span colno='PERSON_SW2DF' class='"+ms.uiClass(formId, 'PERSON_SW2DF')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2DF')+"' "+ms.uiEvent(formId, 'PERSON_SW2DF')+" title='"+ms.titleAttr(formId,'PERSON_SW2DF','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2DF']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW25' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW25')+"' style='"+ms.tdStyle(formId, 'PERSON_SW25')+"' "+ms.tdEvent(formId, 'PERSON_SW25')+">")
            arrHtml.push("<span colno='PERSON_SW25' class='"+ms.uiClass(formId, 'PERSON_SW25')+"' style='"+ms.uiStyle(formId, 'PERSON_SW25')+"' "+ms.uiEvent(formId, 'PERSON_SW25')+" title='"+ms.titleAttr(formId,'PERSON_SW25','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW25']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2S' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2S')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2S')+"' "+ms.tdEvent(formId, 'PERSON_SW2S')+">")
            arrHtml.push("<span colno='PERSON_SW2S' class='"+ms.uiClass(formId, 'PERSON_SW2S')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2S')+"' "+ms.uiEvent(formId, 'PERSON_SW2S')+" title='"+ms.titleAttr(formId,'PERSON_SW2S','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2S']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REPERSON_SW2' class='datagrid-cell "+ms.tdClass(formId, 'REPERSON_SW2')+"' style='"+ms.tdStyle(formId, 'REPERSON_SW2')+"' "+ms.tdEvent(formId, 'REPERSON_SW2')+">")
            arrHtml.push("<span colno='REPERSON_SW2' class='"+ms.uiClass(formId, 'REPERSON_SW2')+"' style='"+ms.uiStyle(formId, 'REPERSON_SW2')+"' "+ms.uiEvent(formId, 'REPERSON_SW2')+" title='"+ms.titleAttr(formId,'REPERSON_SW2','IS_TITLE_ATTR',v)+"' >"+v['REPERSON_SW2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2E' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2E')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2E')+"' "+ms.tdEvent(formId, 'PERSON_SW2E')+">")
            arrHtml.push("<span colno='PERSON_SW2E' class='"+ms.uiClass(formId, 'PERSON_SW2E')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2E')+"' "+ms.uiEvent(formId, 'PERSON_SW2E')+" title='"+ms.titleAttr(formId,'PERSON_SW2E','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2E']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2E5' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2E5')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2E5')+"' "+ms.tdEvent(formId, 'PERSON_SW2E5')+">")
            arrHtml.push("<span colno='PERSON_SW2E5' class='"+ms.uiClass(formId, 'PERSON_SW2E5')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2E5')+"' "+ms.uiEvent(formId, 'PERSON_SW2E5')+" title='"+ms.titleAttr(formId,'PERSON_SW2E5','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2E5']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW232' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW232')+"' style='"+ms.tdStyle(formId, 'PERSON_SW232')+"' "+ms.tdEvent(formId, 'PERSON_SW232')+">")
            arrHtml.push("<span colno='PERSON_SW232' class='"+ms.uiClass(formId, 'PERSON_SW232')+"' style='"+ms.uiStyle(formId, 'PERSON_SW232')+"' "+ms.uiEvent(formId, 'PERSON_SW232')+" title='"+ms.titleAttr(formId,'PERSON_SW232','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW232']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SW2' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SW2')+"' style='"+ms.tdStyle(formId, 'PERSON_SW2')+"' "+ms.tdEvent(formId, 'PERSON_SW2')+">")
            arrHtml.push("<span colno='PERSON_SW2' class='"+ms.uiClass(formId, 'PERSON_SW2')+"' style='"+ms.uiStyle(formId, 'PERSON_SW2')+"' "+ms.uiEvent(formId, 'PERSON_SW2')+" title='"+ms.titleAttr(formId,'PERSON_SW2','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SW2']+"</span>")
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
