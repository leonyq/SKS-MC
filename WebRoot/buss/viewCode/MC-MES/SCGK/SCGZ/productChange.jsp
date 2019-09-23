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
		<dict:lang value="生产变更" />
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
		<bu:header formId ="1e5141623c2d4d3aa23484e30ff9d772"/>

    
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
		<bu:func viewId="dd1b27b7837746d3a843fdf8b4489d1e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="dd1b27b7837746d3a843fdf8b4489d1e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage1e5141623c2d4d3aa23484e30ff9d772" id="formPage1e5141623c2d4d3aa23484e30ff9d772" value="${formPage1e5141623c2d4d3aa23484e30ff9d772}"/>
		<input type="hidden" name="formId" id="formId1" value='1e5141623c2d4d3aa23484e30ff9d772'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="1e5141623c2d4d3aa23484e30ff9d772">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1e5141623c2d4d3aa23484e30ff9d772" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner1e5141623c2d4d3aa23484e30ff9d772">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1e5141623c2d4d3aa23484e30ff9d772">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="1e5141623c2d4d3aa23484e30ff9d772" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_1e5141623c2d4d3aa23484e30ff9d772" onclick="_selectAjaxTableAllData(this,'1e5141623c2d4d3aa23484e30ff9d772')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_TPC_TIME" style="width:130px;" class="datagrid-cell"><bu:uitn colNo="TPC_TIME" formId="1e5141623c2d4d3aa23484e30ff9d772" /></td>
			<td name="noprintset_TPC_TYPE" style="width:130px;" class="datagrid-cell"><bu:uitn colNo="TPC_TYPE" formId="1e5141623c2d4d3aa23484e30ff9d772" /></td>
			<td name="noprintset_TPC_REASON" style="width:180px;" class="datagrid-cell"><bu:uitn colNo="TPC_REASON" formId="1e5141623c2d4d3aa23484e30ff9d772" /></td>
			<td name="noprintset_TPC_MEMO" style="width:180px;" class="datagrid-cell"><bu:uitn colNo="TPC_MEMO" formId="1e5141623c2d4d3aa23484e30ff9d772" /></td>
			<td name="noprintset_TPC_CONTENT_FIRST" style="width:180px;" class="datagrid-cell"><bu:uitn colNo="TPC_CONTENT_FIRST" formId="1e5141623c2d4d3aa23484e30ff9d772" /></td>
			<td name="noprintset_TPC_CONTENT_AFTER" style="width:180px;" class="datagrid-cell"><bu:uitn colNo="TPC_CONTENT_AFTER" formId="1e5141623c2d4d3aa23484e30ff9d772" /></td>
			<td name="noprintset_TPC_EMP" style="width:100px;" class="datagrid-cell"><bu:uitn colNo="TPC_EMP" formId="1e5141623c2d4d3aa23484e30ff9d772" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv1e5141623c2d4d3aa23484e30ff9d772" onscroll="ajaxTableScroll(this,'1e5141623c2d4d3aa23484e30ff9d772')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax1e5141623c2d4d3aa23484e30ff9d772">
		<tbody id="tbody_1e5141623c2d4d3aa23484e30ff9d772" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage1e5141623c2d4d3aa23484e30ff9d772==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=1e5141623c2d4d3aa23484e30ff9d772&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="dd1b27b7837746d3a843fdf8b4489d1e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="dd1b27b7837746d3a843fdf8b4489d1e" />
    
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
    if(formId=='1e5141623c2d4d3aa23484e30ff9d772'){<%--生产变更--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TPC_TIME' name='noprintset_TPC_TIME' class='datagrid-cell "+ms.tdClass(formId, 'TPC_TIME')+"' style='"+ms.tdStyle(formId, 'TPC_TIME')+"' "+ms.tdEvent(formId, 'TPC_TIME')+">")
            arrHtml.push("<span colno='TPC_TIME' class='"+ms.uiClass(formId, 'TPC_TIME')+"' style='"+ms.uiStyle(formId, 'TPC_TIME')+"' "+ms.uiEvent(formId, 'TPC_TIME')+" title='"+ms.titleAttr(formId,'TPC_TIME','IS_TITLE_ATTR',v)+"' >"+v['TPC_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TPC_TYPE' name='noprintset_TPC_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TPC_TYPE')+"' style='"+ms.tdStyle(formId, 'TPC_TYPE')+"' "+ms.tdEvent(formId, 'TPC_TYPE')+">")
            arrHtml.push("<span colno='TPC_TYPE' class='"+ms.uiClass(formId, 'TPC_TYPE')+"' style='"+ms.uiStyle(formId, 'TPC_TYPE')+"' "+ms.uiEvent(formId, 'TPC_TYPE')+" title='"+ms.titleAttr(formId,'TPC_TYPE','IS_TITLE_ATTR',v)+"' >"+v['TPC_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TPC_REASON' name='noprintset_TPC_REASON' class='datagrid-cell "+ms.tdClass(formId, 'TPC_REASON')+"' style='"+ms.tdStyle(formId, 'TPC_REASON')+"' "+ms.tdEvent(formId, 'TPC_REASON')+">")
            arrHtml.push("<span colno='TPC_REASON' class='"+ms.uiClass(formId, 'TPC_REASON')+"' style='"+ms.uiStyle(formId, 'TPC_REASON')+"' "+ms.uiEvent(formId, 'TPC_REASON')+" title='"+ms.titleAttr(formId,'TPC_REASON','IS_TITLE_ATTR',v)+"' >"+v['TPC_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TPC_MEMO' name='noprintset_TPC_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'TPC_MEMO')+"' style='"+ms.tdStyle(formId, 'TPC_MEMO')+"' "+ms.tdEvent(formId, 'TPC_MEMO')+">")
            arrHtml.push("<span colno='TPC_MEMO' class='"+ms.uiClass(formId, 'TPC_MEMO')+"' style='"+ms.uiStyle(formId, 'TPC_MEMO')+"' "+ms.uiEvent(formId, 'TPC_MEMO')+" title='"+ms.titleAttr(formId,'TPC_MEMO','IS_TITLE_ATTR',v)+"' >"+v['TPC_MEMO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TPC_CONTENT_FIRST' name='noprintset_TPC_CONTENT_FIRST' class='datagrid-cell "+ms.tdClass(formId, 'TPC_CONTENT_FIRST')+"' style='"+ms.tdStyle(formId, 'TPC_CONTENT_FIRST')+"' "+ms.tdEvent(formId, 'TPC_CONTENT_FIRST')+">")
            arrHtml.push("<span colno='TPC_CONTENT_FIRST' class='"+ms.uiClass(formId, 'TPC_CONTENT_FIRST')+"' style='"+ms.uiStyle(formId, 'TPC_CONTENT_FIRST')+"' "+ms.uiEvent(formId, 'TPC_CONTENT_FIRST')+" title='"+ms.titleAttr(formId,'TPC_CONTENT_FIRST','IS_TITLE_ATTR',v)+"' >"+v['TPC_CONTENT_FIRST']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TPC_CONTENT_AFTER' name='noprintset_TPC_CONTENT_AFTER' class='datagrid-cell "+ms.tdClass(formId, 'TPC_CONTENT_AFTER')+"' style='"+ms.tdStyle(formId, 'TPC_CONTENT_AFTER')+"' "+ms.tdEvent(formId, 'TPC_CONTENT_AFTER')+">")
            arrHtml.push("<span colno='TPC_CONTENT_AFTER' class='"+ms.uiClass(formId, 'TPC_CONTENT_AFTER')+"' style='"+ms.uiStyle(formId, 'TPC_CONTENT_AFTER')+"' "+ms.uiEvent(formId, 'TPC_CONTENT_AFTER')+" title='"+ms.titleAttr(formId,'TPC_CONTENT_AFTER','IS_TITLE_ATTR',v)+"' >"+v['TPC_CONTENT_AFTER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TPC_EMP' name='noprintset_TPC_EMP' class='datagrid-cell "+ms.tdClass(formId, 'TPC_EMP')+"' style='"+ms.tdStyle(formId, 'TPC_EMP')+"' "+ms.tdEvent(formId, 'TPC_EMP')+">")
            arrHtml.push("<span colno='TPC_EMP' class='"+ms.uiClass(formId, 'TPC_EMP')+"' style='"+ms.uiStyle(formId, 'TPC_EMP')+"' "+ms.uiEvent(formId, 'TPC_EMP')+" title='"+ms.titleAttr(formId,'TPC_EMP','IS_TITLE_ATTR',v)+"' >"+v['TPC_EMP']+"</span>")
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
