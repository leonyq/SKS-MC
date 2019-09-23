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
		<dict:lang value="返工单信息" />
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
		<bu:header formId ="d23be1e0a97e488c922c8d1144b774e9"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="8ccdb0bf24b64975b81ea268cb8b28a8" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="8ccdb0bf24b64975b81ea268cb8b28a8" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPaged23be1e0a97e488c922c8d1144b774e9" id="formPaged23be1e0a97e488c922c8d1144b774e9" value="${formPaged23be1e0a97e488c922c8d1144b774e9}"/>
		<input type="hidden" name="formId" id="formId1" value='d23be1e0a97e488c922c8d1144b774e9'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='32da3e0960e54fc9b729228ad3a9a3f1'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='19a6d4f925244f01bdaf8c3ca3fca8db'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="d23be1e0a97e488c922c8d1144b774e9">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxd23be1e0a97e488c922c8d1144b774e9" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerd23be1e0a97e488c922c8d1144b774e9">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabled23be1e0a97e488c922c8d1144b774e9" style="min-width:1350px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d23be1e0a97e488c922c8d1144b774e9" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_d23be1e0a97e488c922c8d1144b774e9" onclick="_selectAjaxTableAllData(this,'d23be1e0a97e488c922c8d1144b774e9')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CRI_DOC_NUMBER" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:80px;" ><bu:uitn colNo="CRI_DOC_STATUS" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CRI_REWORK_MO" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="CRI_REWORK_MODEL" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CRI_REWORK_TECH" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CUST_CODE" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CRI_INSPECT_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:80px;" ><bu:uitn colNo="CRI_ERROR_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:100px;" ><bu:uitn colNo="CRI_HAD_NUM" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CRI_PROCESS_TIME" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CREATE_USER" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CREATE_TIME" formId="d23be1e0a97e488c922c8d1144b774e9" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivd23be1e0a97e488c922c8d1144b774e9" onscroll="ajaxTableScroll(this,'d23be1e0a97e488c922c8d1144b774e9')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxd23be1e0a97e488c922c8d1144b774e9" style="min-width:1350px;">
		<tbody id="tbody_d23be1e0a97e488c922c8d1144b774e9" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPaged23be1e0a97e488c922c8d1144b774e9==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=d23be1e0a97e488c922c8d1144b774e9&showLoading=0" />
			</div>
		</c:if>
		
		<input type="hidden" name="formPage19a6d4f925244f01bdaf8c3ca3fca8db" id="formPage19a6d4f925244f01bdaf8c3ca3fca8db" value="${formPage19a6d4f925244f01bdaf8c3ca3fca8db}"/>
		<input type="hidden" name="formId" id="formId2" value='19a6d4f925244f01bdaf8c3ca3fca8db'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="19a6d4f925244f01bdaf8c3ca3fca8db" style="margin-top:10px;">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax19a6d4f925244f01bdaf8c3ca3fca8db" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner19a6d4f925244f01bdaf8c3ca3fca8db">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable19a6d4f925244f01bdaf8c3ca3fca8db">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="19a6d4f925244f01bdaf8c3ca3fca8db" i18n="1"/></td>
		<!--	<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_19a6d4f925244f01bdaf8c3ca3fca8db" onclick="_selectAjaxTableAllData(this,'19a6d4f925244f01bdaf8c3ca3fca8db')" style="cursor: pointer;"title="全选"/></span></td> -->
			<td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CRD_SN" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CRD_DOC_STATUS" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CRD_MO_NUMBER" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CRD_REWORK_MO" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
			<td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CRD_REWORK_MODEL" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
			<td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CRD_REWORK_TECH" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
			<td class="datagrid-cell" style="width:120px;" ><bu:uitn colNo="CRD_REWORK_INPUT" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
			<td class="datagrid-cell"  style="width:80px;"><bu:uitn colNo="CRD_JUDGE_EMP" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CRD_JUDGE_TIME" formId="19a6d4f925244f01bdaf8c3ca3fca8db" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv19a6d4f925244f01bdaf8c3ca3fca8db" onscroll="ajaxTableScroll(this,'19a6d4f925244f01bdaf8c3ca3fca8db')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax19a6d4f925244f01bdaf8c3ca3fca8db">
		<tbody id="tbody_19a6d4f925244f01bdaf8c3ca3fca8db" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage19a6d4f925244f01bdaf8c3ca3fca8db==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=19a6d4f925244f01bdaf8c3ca3fca8db&showLoading=0" />
			</div>
		</c:if>
		</div>

		
		</div>

		<input type="hidden" id="relColVals" name="relColVals" value='CRI_DOC_NUMBER'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="8ccdb0bf24b64975b81ea268cb8b28a8" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="8ccdb0bf24b64975b81ea268cb8b28a8" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>

// 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CRI_DOC_STATUS\"}";
        var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
        if(isPage(formId)){
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        //util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:searchParams +"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(isPage(formId)){
                        initPage(page,formId);
                    }
                    clearChildTable();
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var uiRaw = ms.uiRaw(formId)==null?[]:ms.uiRaw(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='d23be1e0a97e488c922c8d1144b774e9'){<%--返工信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell  TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='CRI_DOC_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CRI_DOC_NUMBER')+"' style='width:120px;"+ms.tdStyle(formId, 'CRI_DOC_NUMBER')+"' "+ms.tdEvent(formId, 'CRI_DOC_NUMBER')+">")
            arrHtml.push("<span colno='CRI_DOC_NUMBER' class='"+ms.uiClass(formId, 'CRI_DOC_NUMBER')+"' style='"+ms.uiStyle(formId, 'CRI_DOC_NUMBER')+"' "+ms.uiEvent(formId, 'CRI_DOC_NUMBER')+" title='"+ms.titleAttr(formId,'CRI_DOC_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CRI_DOC_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRI_DOC_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CRI_DOC_STATUS')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CRI_DOC_STATUS')+"' "+ms.tdEvent(formId, 'CRI_DOC_STATUS')+">")
            arrHtml.push("<span colno='CRI_DOC_STATUS' class='"+ms.uiClass(formId, 'CRI_DOC_STATUS')+"' style='"+ms.uiStyle(formId, 'CRI_DOC_STATUS')+"' "+ms.uiEvent(formId, 'CRI_DOC_STATUS')+" title='"+ms.titleAttr(formId,'CRI_DOC_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CRI_DOC_STATUS']+"</span>")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+uiRaw[i].CRI_DOC_STATUS+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRI_REWORK_MO' class='datagrid-cell "+ms.tdClass(formId, 'CRI_REWORK_MO')+"' style='width:140px;"+ms.tdStyle(formId, 'CRI_REWORK_MO')+"' "+ms.tdEvent(formId, 'CRI_REWORK_MO')+">")
            arrHtml.push("<span colno='CRI_REWORK_MO' class='"+ms.uiClass(formId, 'CRI_REWORK_MO')+"' onclick='itemJump1(\""+v['CRI_REWORK_MO']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CRI_REWORK_MO')+" title='"+ms.titleAttr(formId,'CRI_REWORK_MO','IS_TITLE_ATTR',v)+"' >"+v['CRI_REWORK_MO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRI_REWORK_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'CRI_REWORK_MODEL')+"' style='width:120px;"+ms.tdStyle(formId, 'CRI_REWORK_MODEL')+"' "+ms.tdEvent(formId, 'CRI_REWORK_MODEL')+">")
            arrHtml.push("<span colno='CRI_REWORK_MODEL' class='"+ms.uiClass(formId, 'CRI_REWORK_MODEL')+"' onclick='itemJump2(\""+v['CRI_REWORK_MODEL']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CRI_REWORK_MODEL')+" title='"+ms.titleAttr(formId,'CRI_REWORK_MODEL','IS_TITLE_ATTR',v)+"' >"+v['CRI_REWORK_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRI_REWORK_TECH' class='datagrid-cell "+ms.tdClass(formId, 'CRI_REWORK_TECH')+"' style='width:120px;"+ms.tdStyle(formId, 'CRI_REWORK_TECH')+"' "+ms.tdEvent(formId, 'CRI_REWORK_TECH')+">")
            arrHtml.push("<span colno='CRI_REWORK_TECH' class='"+ms.uiClass(formId, 'CRI_REWORK_TECH')+"' onclick='itemJump3(\""+v['CRI_REWORK_TECH']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CRI_REWORK_TECH')+" title='"+ms.titleAttr(formId,'CRI_REWORK_TECH','IS_TITLE_ATTR',v)+"' >"+v['CRI_REWORK_TECH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CUST_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'CUST_CODE')+"' "+ms.tdEvent(formId, 'CUST_CODE')+">")
            arrHtml.push("<span colno='CUST_CODE' class='"+ms.uiClass(formId, 'CUST_CODE')+"' style='"+ms.uiStyle(formId, 'CUST_CODE')+"' "+ms.uiEvent(formId, 'CUST_CODE')+" title='"+ms.titleAttr(formId,'CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRI_INSPECT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'CRI_INSPECT_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'CRI_INSPECT_NUM')+"' "+ms.tdEvent(formId, 'CRI_INSPECT_NUM')+">")
            arrHtml.push("<span colno='CRI_INSPECT_NUM' class='"+ms.uiClass(formId, 'CRI_INSPECT_NUM')+"' style='"+ms.uiStyle(formId, 'CRI_INSPECT_NUM')+"' "+ms.uiEvent(formId, 'CRI_INSPECT_NUM')+" title='"+ms.titleAttr(formId,'CRI_INSPECT_NUM','IS_TITLE_ATTR',v)+"' >"+v['CRI_INSPECT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRI_ERROR_NUM' class='datagrid-cell "+ms.tdClass(formId, 'CRI_ERROR_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'CRI_ERROR_NUM')+"' "+ms.tdEvent(formId, 'CRI_ERROR_NUM')+">")
            arrHtml.push("<span colno='CRI_ERROR_NUM' class='"+ms.uiClass(formId, 'CRI_ERROR_NUM')+"' style='"+ms.uiStyle(formId, 'CRI_ERROR_NUM')+"' "+ms.uiEvent(formId, 'CRI_ERROR_NUM')+" title='"+ms.titleAttr(formId,'CRI_ERROR_NUM','IS_TITLE_ATTR',v)+"' >"+v['CRI_ERROR_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRI_HAD_NUM' class='datagrid-cell "+ms.tdClass(formId, 'CRI_HAD_NUM')+"' style='width:100px;text-align:right;"+ms.tdStyle(formId, 'CRI_HAD_NUM')+"' "+ms.tdEvent(formId, 'CRI_HAD_NUM')+">")
            arrHtml.push("<span colno='CRI_HAD_NUM' class='"+ms.uiClass(formId, 'CRI_HAD_NUM')+"' style='"+ms.uiStyle(formId, 'CRI_HAD_NUM')+"' "+ms.uiEvent(formId, 'CRI_HAD_NUM')+" title='"+ms.titleAttr(formId,'CRI_HAD_NUM','IS_TITLE_ATTR',v)+"' >"+v['CRI_HAD_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRI_PROCESS_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CRI_PROCESS_TIME')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'CRI_PROCESS_TIME')+"' "+ms.tdEvent(formId, 'CRI_PROCESS_TIME')+">")
            arrHtml.push("<span colno='CRI_PROCESS_TIME' class='"+ms.uiClass(formId, 'CRI_PROCESS_TIME')+"' style='"+ms.uiStyle(formId, 'CRI_PROCESS_TIME')+"' "+ms.uiEvent(formId, 'CRI_PROCESS_TIME')+" title='"+ms.titleAttr(formId,'CRI_PROCESS_TIME','IS_TITLE_ATTR',v)+"' >"+v['CRI_PROCESS_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='19a6d4f925244f01bdaf8c3ca3fca8db'){<%--返工产品明细信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
          //  arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
         //   arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit' style='cursor: pointer;margin:0'>");
        //    arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_SN' class='datagrid-cell "+ms.tdClass(formId, 'CRD_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'CRD_SN')+"' "+ms.tdEvent(formId, 'CRD_SN')+">")
            arrHtml.push("<span colno='CRD_SN' class='"+ms.uiClass(formId, 'CRD_SN')+"' style='"+ms.uiStyle(formId, 'CRD_SN')+"' "+ms.uiEvent(formId, 'CRD_SN')+" title='"+ms.titleAttr(formId,'CRD_SN','IS_TITLE_ATTR',v)+"' >"+v['CRD_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_DOC_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'CRD_DOC_STATUS')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CRD_DOC_STATUS')+"' "+ms.tdEvent(formId, 'CRD_DOC_STATUS')+">")
            arrHtml.push("<span colno='CRD_DOC_STATUS' class='"+ms.uiClass(formId, 'CRD_DOC_STATUS')+"' style='"+ms.uiStyle(formId, 'CRD_DOC_STATUS')+"' "+ms.uiEvent(formId, 'CRD_DOC_STATUS')+" title='"+ms.titleAttr(formId,'CRD_DOC_STATUS','IS_TITLE_ATTR',v)+"' >"+v['CRD_DOC_STATUS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'CRD_MO_NUMBER')+"' style='width:140px;"+ms.tdStyle(formId, 'CRD_MO_NUMBER')+"' "+ms.tdEvent(formId, 'CRD_MO_NUMBER')+">")
            arrHtml.push("<span colno='CRD_MO_NUMBER' class='"+ms.uiClass(formId, 'CRD_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'CRD_MO_NUMBER')+"' "+ms.uiEvent(formId, 'CRD_MO_NUMBER')+" title='"+ms.titleAttr(formId,'CRD_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['CRD_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_REWORK_MO' class='datagrid-cell "+ms.tdClass(formId, 'CRD_REWORK_MO')+"' style='width:140px;"+ms.tdStyle(formId, 'CRD_REWORK_MO')+"' "+ms.tdEvent(formId, 'CRD_REWORK_MO')+">")
            arrHtml.push("<span colno='CRD_REWORK_MO' class='"+ms.uiClass(formId, 'CRD_REWORK_MO')+"' style='"+ms.uiStyle(formId, 'CRD_REWORK_MO')+"' "+ms.uiEvent(formId, 'CRD_REWORK_MO')+" title='"+ms.titleAttr(formId,'CRD_REWORK_MO','IS_TITLE_ATTR',v)+"' >"+v['CRD_REWORK_MO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_REWORK_MODEL' class='datagrid-cell "+ms.tdClass(formId, 'CRD_REWORK_MODEL')+"' style='width:120px;"+ms.tdStyle(formId, 'CRD_REWORK_MODEL')+"' "+ms.tdEvent(formId, 'CRD_REWORK_MODEL')+">")
            arrHtml.push("<span colno='CRD_REWORK_MODEL' class='"+ms.uiClass(formId, 'CRD_REWORK_MODEL')+"' style='"+ms.uiStyle(formId, 'CRD_REWORK_MODEL')+"' "+ms.uiEvent(formId, 'CRD_REWORK_MODEL')+" title='"+ms.titleAttr(formId,'CRD_REWORK_MODEL','IS_TITLE_ATTR',v)+"' >"+v['CRD_REWORK_MODEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_REWORK_TECH' class='datagrid-cell "+ms.tdClass(formId, 'CRD_REWORK_TECH')+"' style='width:120px;"+ms.tdStyle(formId, 'CRD_REWORK_TECH')+"' "+ms.tdEvent(formId, 'CRD_REWORK_TECH')+">")
            arrHtml.push("<span colno='CRD_REWORK_TECH' class='"+ms.uiClass(formId, 'CRD_REWORK_TECH')+"' style='"+ms.uiStyle(formId, 'CRD_REWORK_TECH')+"' "+ms.uiEvent(formId, 'CRD_REWORK_TECH')+" title='"+ms.titleAttr(formId,'CRD_REWORK_TECH','IS_TITLE_ATTR',v)+"' >"+v['CRD_REWORK_TECH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_REWORK_INPUT' class='datagrid-cell "+ms.tdClass(formId, 'CRD_REWORK_INPUT')+"' style='width:120px;"+ms.tdStyle(formId, 'CRD_REWORK_INPUT')+"' "+ms.tdEvent(formId, 'CRD_REWORK_INPUT')+">")
            arrHtml.push("<span colno='CRD_REWORK_INPUT' class='"+ms.uiClass(formId, 'CRD_REWORK_INPUT')+"' style='"+ms.uiStyle(formId, 'CRD_REWORK_INPUT')+"' "+ms.uiEvent(formId, 'CRD_REWORK_INPUT')+" title='"+ms.titleAttr(formId,'CRD_REWORK_INPUT','IS_TITLE_ATTR',v)+"' >"+v['CRD_REWORK_INPUT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_JUDGE_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CRD_JUDGE_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CRD_JUDGE_EMP')+"' "+ms.tdEvent(formId, 'CRD_JUDGE_EMP')+">")
            arrHtml.push("<span colno='CRD_JUDGE_EMP' class='"+ms.uiClass(formId, 'CRD_JUDGE_EMP')+"' style='"+ms.uiStyle(formId, 'CRD_JUDGE_EMP')+"' "+ms.uiEvent(formId, 'CRD_JUDGE_EMP')+" title='"+ms.titleAttr(formId,'CRD_JUDGE_EMP','IS_TITLE_ATTR',v)+"' >"+v['CRD_JUDGE_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRD_JUDGE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CRD_JUDGE_TIME')+"' style='width:140px;"+ms.tdStyle(formId, 'CRD_JUDGE_TIME')+"' "+ms.tdEvent(formId, 'CRD_JUDGE_TIME')+">")
            arrHtml.push("<span colno='CRD_JUDGE_TIME' class='"+ms.uiClass(formId, 'CRD_JUDGE_TIME')+"' style='"+ms.uiStyle(formId, 'CRD_JUDGE_TIME')+"' "+ms.uiEvent(formId, 'CRD_JUDGE_TIME')+" title='"+ms.titleAttr(formId,'CRD_JUDGE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CRD_JUDGE_TIME']+"</span>")
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
}

    
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	//checkboxAll("joblist");
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
}  


//BOM管理
function itemJump2(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 

//工艺信息
function itemJump3(obj){
    winOptMethod.jump("ab7fd048ac884ead9706952262e9c496","F11130","jumpId",obj);
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
