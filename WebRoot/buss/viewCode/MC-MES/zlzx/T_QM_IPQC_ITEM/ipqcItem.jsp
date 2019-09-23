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
		<dict:lang value="IPQC检测项" />
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
		<bu:header formId ="6c618bbd5f12409f8ebf3e8ffee81395"/>

    
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
		<bu:func viewId="58bde06ffde64b94b6805c2a30abeadb" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="58bde06ffde64b94b6805c2a30abeadb" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6c618bbd5f12409f8ebf3e8ffee81395" id="formPage6c618bbd5f12409f8ebf3e8ffee81395" value="${formPage6c618bbd5f12409f8ebf3e8ffee81395}"/>
		<input type="hidden" name="formId" id="formId1" value='6c618bbd5f12409f8ebf3e8ffee81395'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6c618bbd5f12409f8ebf3e8ffee81395">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6c618bbd5f12409f8ebf3e8ffee81395" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6c618bbd5f12409f8ebf3e8ffee81395">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6c618bbd5f12409f8ebf3e8ffee81395" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6c618bbd5f12409f8ebf3e8ffee81395" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6c618bbd5f12409f8ebf3e8ffee81395" onclick="_selectAjaxTableAllData(this,'6c618bbd5f12409f8ebf3e8ffee81395')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QII_ITEM_CODE" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QII_ITEM_NAME" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QII_ITEM_TYPE" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<td class="datagrid-cell" style="width:250px;"><bu:uitn colNo="QII_TEST_CONTENT" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QII_EFFECTIVE_FLAG" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QII_MAINTAIN_EMP" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
			<td class="datagrid-cell" style="width:140px;" ><bu:uitn colNo="QII_MAINTAIN_DATE" formId="6c618bbd5f12409f8ebf3e8ffee81395" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6c618bbd5f12409f8ebf3e8ffee81395" onscroll="ajaxTableScroll(this,'6c618bbd5f12409f8ebf3e8ffee81395')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6c618bbd5f12409f8ebf3e8ffee81395" style="min-width:1000px;">
		<tbody id="tbody_6c618bbd5f12409f8ebf3e8ffee81395" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6c618bbd5f12409f8ebf3e8ffee81395==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6c618bbd5f12409f8ebf3e8ffee81395&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="58bde06ffde64b94b6805c2a30abeadb" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="58bde06ffde64b94b6805c2a30abeadb" />
    
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
    if(formId=='6c618bbd5f12409f8ebf3e8ffee81395'){<%--IPQC检测项--%>
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
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='QII_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QII_ITEM_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'QII_ITEM_CODE')+"' "+ms.tdEvent(formId, 'QII_ITEM_CODE')+">")
            arrHtml.push("<span colno='QII_ITEM_CODE' class='"+ms.uiClass(formId, 'QII_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'QII_ITEM_CODE')+"' "+ms.uiEvent(formId, 'QII_ITEM_CODE')+" title='"+ms.titleAttr(formId,'QII_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['QII_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QII_ITEM_NAME')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'QII_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QII_ITEM_NAME')+">")
            arrHtml.push("<span colno='QII_ITEM_NAME' class='"+ms.uiClass(formId, 'QII_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QII_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QII_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QII_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QII_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QII_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QII_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'QII_ITEM_TYPE')+">")
            arrHtml.push("<span colno='QII_ITEM_TYPE' class='"+ms.uiClass(formId, 'QII_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'QII_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'QII_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'QII_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QII_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_TEST_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'QII_TEST_CONTENT')+"' style='width:250px;"+ms.tdStyle(formId, 'QII_TEST_CONTENT')+"' "+ms.tdEvent(formId, 'QII_TEST_CONTENT')+">")
            arrHtml.push("<span colno='QII_TEST_CONTENT' class='"+ms.uiClass(formId, 'QII_TEST_CONTENT')+"' style='"+ms.uiStyle(formId, 'QII_TEST_CONTENT')+"' "+ms.uiEvent(formId, 'QII_TEST_CONTENT')+" title='"+ms.titleAttr(formId,'QII_TEST_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['QII_TEST_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_EFFECTIVE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QII_EFFECTIVE_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QII_EFFECTIVE_FLAG')+"' "+ms.tdEvent(formId, 'QII_EFFECTIVE_FLAG')+">")
            arrHtml.push("<span colno='QII_EFFECTIVE_FLAG' class='"+ms.uiClass(formId, 'QII_EFFECTIVE_FLAG')+"' style='"+ms.uiStyle(formId, 'QII_EFFECTIVE_FLAG')+"' "+ms.uiEvent(formId, 'QII_EFFECTIVE_FLAG')+" title='"+ms.titleAttr(formId,'QII_EFFECTIVE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QII_EFFECTIVE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_MAINTAIN_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QII_MAINTAIN_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QII_MAINTAIN_EMP')+"' "+ms.tdEvent(formId, 'QII_MAINTAIN_EMP')+">")
            arrHtml.push("<span colno='QII_MAINTAIN_EMP' class='"+ms.uiClass(formId, 'QII_MAINTAIN_EMP')+"' style='"+ms.uiStyle(formId, 'QII_MAINTAIN_EMP')+"' "+ms.uiEvent(formId, 'QII_MAINTAIN_EMP')+" title='"+ms.titleAttr(formId,'QII_MAINTAIN_EMP','IS_TITLE_ATTR',v)+"' >"+v['QII_MAINTAIN_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QII_MAINTAIN_DATE' class='datagrid-cell "+ms.tdClass(formId, 'QII_MAINTAIN_DATE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'QII_MAINTAIN_DATE')+"' "+ms.tdEvent(formId, 'QII_MAINTAIN_DATE')+">")
            arrHtml.push("<span colno='QII_MAINTAIN_DATE' class='"+ms.uiClass(formId, 'QII_MAINTAIN_DATE')+"' style='"+ms.uiStyle(formId, 'QII_MAINTAIN_DATE')+"' "+ms.uiEvent(formId, 'QII_MAINTAIN_DATE')+" title='"+ms.titleAttr(formId,'QII_MAINTAIN_DATE','IS_TITLE_ATTR',v)+"' >"+v['QII_MAINTAIN_DATE']+"</span>")
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
