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
		<dict:lang value="复检超期" />
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
		<bu:header formId ="c408f3497e29446eb0d2f546ff63868b"/>

    
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
		<bu:func viewId="31f0afecd74c40b9b434d0e768784928" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="31f0afecd74c40b9b434d0e768784928" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagec408f3497e29446eb0d2f546ff63868b" id="formPagec408f3497e29446eb0d2f546ff63868b" value="${formPagec408f3497e29446eb0d2f546ff63868b}"/>
		<input type="hidden" name="formId" id="formId1" value='c408f3497e29446eb0d2f546ff63868b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='56be054c8eab4ca1b5759c6f01b65147'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='c2bca7b7c2094a2495a26e6ca72b7bbc'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="c408f3497e29446eb0d2f546ff63868b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc408f3497e29446eb0d2f546ff63868b" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc408f3497e29446eb0d2f546ff63868b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec408f3497e29446eb0d2f546ff63868b" style="min-width:1480px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c408f3497e29446eb0d2f546ff63868b" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c408f3497e29446eb0d2f546ff63868b" onclick="_selectAjaxTableAllData(this,'c408f3497e29446eb0d2f546ff63868b')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:250px;" ><dict:lang value="物料/产品SN" /></td >
			<td class="datagrid-cell" style="width:70px;" ><dict:lang value="状态" /></td >
			<td class="datagrid-cell" style="width:110px;" ><dict:lang value="仓库" /></td >
			<td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料数量" /></td >
			<td class="datagrid-cell" style="width:90px;" ><dict:lang value="复检周期" /></td >
			<td class="datagrid-cell" style="width:130px;" ><dict:lang value="复检到期时间" /></td >
			<td class="datagrid-cell" style="width:130px;" ><dict:lang value="检验时间" /></td >
			<td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料料号" /></td >
			<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料名称" /></td >
			<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料规格" /></td >
			<td class="datagrid-cell" style="width:120px;" ><dict:lang value="物料批次" /></td >
			<td class="datagrid-cell" style="width:110px;" ><dict:lang value="客户" /></td >
			<td class="datagrid-cell" style="width:110px;" ><dict:lang value="供应商" /></td >
			<td class="datagrid-cell"><dict:lang value="入库时间" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivc408f3497e29446eb0d2f546ff63868b" onscroll="ajaxTableScroll(this,'c408f3497e29446eb0d2f546ff63868b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxc408f3497e29446eb0d2f546ff63868b" style="min-width:1480px;">
		<tbody id="tbody_c408f3497e29446eb0d2f546ff63868b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec408f3497e29446eb0d2f546ff63868b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=c408f3497e29446eb0d2f546ff63868b&showLoading=0" />
			</div>
		</c:if>


		<input type="hidden" id="relColVals" name="relColVals" value='WRD_DOC_NUM'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="31f0afecd74c40b9b434d0e768784928" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="31f0afecd74c40b9b434d0e768784928" />
    
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
    if(formId=='c408f3497e29446eb0d2f546ff63868b'){<%--仓库库存复检信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRD_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WRD_DOC_NUM')+"' "+ms.tdEvent(formId, 'WRD_DOC_NUM')+">")
            arrHtml.push("<span colno='WRD_DOC_NUM' class='"+ms.uiClass(formId, 'WRD_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WRD_DOC_NUM')+"' "+ms.uiEvent(formId, 'WRD_DOC_NUM')+" title='"+ms.titleAttr(formId,'WRD_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRD_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_TEST_DOC' class='datagrid-cell "+ms.tdClass(formId, 'WRD_TEST_DOC')+"' style='"+ms.tdStyle(formId, 'WRD_TEST_DOC')+"' "+ms.tdEvent(formId, 'WRD_TEST_DOC')+">")
            arrHtml.push("<span colno='WRD_TEST_DOC' class='"+ms.uiClass(formId, 'WRD_TEST_DOC')+"' style='"+ms.uiStyle(formId, 'WRD_TEST_DOC')+"' "+ms.uiEvent(formId, 'WRD_TEST_DOC')+" title='"+ms.titleAttr(formId,'WRD_TEST_DOC','IS_TITLE_ATTR',v)+"' >"+v['WRD_TEST_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WRD_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WRD_ITEM_CODE')+">")
            arrHtml.push("<span colno='WRD_ITEM_CODE' class='"+ms.uiClass(formId, 'WRD_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WRD_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WRD_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'WRD_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WRD_ITEM_NAME')+">")
            arrHtml.push("<span colno='WRD_ITEM_NAME' class='"+ms.uiClass(formId, 'WRD_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WRD_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WRD_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'WRD_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WRD_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WRD_ITEM_SPEC' class='"+ms.uiClass(formId, 'WRD_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WRD_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WRD_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WRD_ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'WRD_ITEM_NUM')+"' "+ms.tdEvent(formId, 'WRD_ITEM_NUM')+">")
            arrHtml.push("<span colno='WRD_ITEM_NUM' class='"+ms.uiClass(formId, 'WRD_ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'WRD_ITEM_NUM')+"' "+ms.uiEvent(formId, 'WRD_ITEM_NUM')+" title='"+ms.titleAttr(formId,'WRD_ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['WRD_ITEM_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_CREATE_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WRD_CREATE_MAN')+"' style='"+ms.tdStyle(formId, 'WRD_CREATE_MAN')+"' "+ms.tdEvent(formId, 'WRD_CREATE_MAN')+">")
            arrHtml.push("<span colno='WRD_CREATE_MAN' class='"+ms.uiClass(formId, 'WRD_CREATE_MAN')+"' style='"+ms.uiStyle(formId, 'WRD_CREATE_MAN')+"' "+ms.uiEvent(formId, 'WRD_CREATE_MAN')+" title='"+ms.titleAttr(formId,'WRD_CREATE_MAN','IS_TITLE_ATTR',v)+"' >"+v['WRD_CREATE_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WRD_CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'WRD_CREATE_TIME')+"' "+ms.tdEvent(formId, 'WRD_CREATE_TIME')+">")
            arrHtml.push("<span colno='WRD_CREATE_TIME' class='"+ms.uiClass(formId, 'WRD_CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'WRD_CREATE_TIME')+"' "+ms.uiEvent(formId, 'WRD_CREATE_TIME')+" title='"+ms.titleAttr(formId,'WRD_CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['WRD_CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WRD_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'WRD_MEMO')+"' style='"+ms.tdStyle(formId, 'WRD_MEMO')+"' "+ms.tdEvent(formId, 'WRD_MEMO')+">")
            arrHtml.push("<span colno='WRD_MEMO' class='"+ms.uiClass(formId, 'WRD_MEMO')+"' style='"+ms.uiStyle(formId, 'WRD_MEMO')+"' "+ms.uiEvent(formId, 'WRD_MEMO')+" title='"+ms.titleAttr(formId,'WRD_MEMO','IS_TITLE_ATTR',v)+"' >"+v['WRD_MEMO']+"</span>")
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
$(function(){
   getInfo(); 
});

function getInfo(){
    $.ajax({
        
        
    });
    
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
