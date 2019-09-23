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
		<dict:lang value="账户别名维护" />
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
		<bu:header formId ="1cff0c64d594438f9a60bba5bbb8a83c"/>

    
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
		<bu:func viewId="9655ba53433f4efcb5f4f353c79b7e34" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="9655ba53433f4efcb5f4f353c79b7e34" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage1cff0c64d594438f9a60bba5bbb8a83c" id="formPage1cff0c64d594438f9a60bba5bbb8a83c" value="${formPage1cff0c64d594438f9a60bba5bbb8a83c}"/>
		<input type="hidden" name="formId" id="formId1" value='1cff0c64d594438f9a60bba5bbb8a83c'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="1cff0c64d594438f9a60bba5bbb8a83c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1cff0c64d594438f9a60bba5bbb8a83c" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner1cff0c64d594438f9a60bba5bbb8a83c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1cff0c64d594438f9a60bba5bbb8a83c">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="1cff0c64d594438f9a60bba5bbb8a83c" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_1cff0c64d594438f9a60bba5bbb8a83c" onclick="_selectAjaxTableAllData(this,'1cff0c64d594438f9a60bba5bbb8a83c')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="ACCOUNT_ALIAS" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="ACCOUNT_VALIDITY" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="REMARK" formId="1cff0c64d594438f9a60bba5bbb8a83c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv1cff0c64d594438f9a60bba5bbb8a83c" onscroll="ajaxTableScroll(this,'1cff0c64d594438f9a60bba5bbb8a83c')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax1cff0c64d594438f9a60bba5bbb8a83c">
		<tbody id="tbody_1cff0c64d594438f9a60bba5bbb8a83c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage1cff0c64d594438f9a60bba5bbb8a83c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=1cff0c64d594438f9a60bba5bbb8a83c&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="9655ba53433f4efcb5f4f353c79b7e34" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="9655ba53433f4efcb5f4f353c79b7e34" />
    
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
    if(formId=='1cff0c64d594438f9a60bba5bbb8a83c'){<%--FM-账户别名--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ACCOUNT_ALIAS' class='datagrid-cell "+ms.tdClass(formId, 'ACCOUNT_ALIAS')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'ACCOUNT_ALIAS')+"' "+ms.tdEvent(formId, 'ACCOUNT_ALIAS')+">")
            arrHtml.push("<span colno='ACCOUNT_ALIAS' class='"+ms.uiClass(formId, 'ACCOUNT_ALIAS')+"' style='"+ms.uiStyle(formId, 'ACCOUNT_ALIAS')+"' "+ms.uiEvent(formId, 'ACCOUNT_ALIAS')+" title='"+ms.titleAttr(formId,'ACCOUNT_ALIAS','IS_TITLE_ATTR',v)+"' >"+v['ACCOUNT_ALIAS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ACCOUNT_VALIDITY' class='datagrid-cell "+ms.tdClass(formId, 'ACCOUNT_VALIDITY')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'ACCOUNT_VALIDITY')+"' "+ms.tdEvent(formId, 'ACCOUNT_VALIDITY')+">")
            arrHtml.push("<span colno='ACCOUNT_VALIDITY' class='"+ms.uiClass(formId, 'ACCOUNT_VALIDITY')+"' style='text-align: center;"+ms.uiStyle(formId, 'ACCOUNT_VALIDITY')+"' "+ms.uiEvent(formId, 'ACCOUNT_VALIDITY')+" title='"+ms.titleAttr(formId,'ACCOUNT_VALIDITY','IS_TITLE_ATTR',v)+"' >"+v['ACCOUNT_VALIDITY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='REMARK' class='datagrid-cell "+ms.tdClass(formId, 'REMARK')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'REMARK')+"' "+ms.tdEvent(formId, 'REMARK')+">")
            arrHtml.push("<span colno='REMARK' class='"+ms.uiClass(formId, 'REMARK')+"' style='"+ms.uiStyle(formId, 'REMARK')+"' "+ms.uiEvent(formId, 'REMARK')+" title='"+ms.titleAttr(formId,'REMARK','IS_TITLE_ATTR',v)+"' >"+v['REMARK']+"</span>")
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
