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
		<dict:lang value="车间信息2" />
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
		<bu:header formId ="4cebf85514984e61b05a9214165d9239"/>

    
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
		<bu:func viewId="501c8ac20a044606b4e86b985e38b1f0" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="501c8ac20a044606b4e86b985e38b1f0" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage4cebf85514984e61b05a9214165d9239" id="formPage4cebf85514984e61b05a9214165d9239" value="${formPage4cebf85514984e61b05a9214165d9239}"/>
		<input type="hidden" name="formId" id="formId1" value='4cebf85514984e61b05a9214165d9239'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4cebf85514984e61b05a9214165d9239">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4cebf85514984e61b05a9214165d9239" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4cebf85514984e61b05a9214165d9239">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4cebf85514984e61b05a9214165d9239">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4cebf85514984e61b05a9214165d9239" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4cebf85514984e61b05a9214165d9239" onclick="_selectAjaxTableAllData(this,'4cebf85514984e61b05a9214165d9239')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="Z_CAR_ID" formId="4cebf85514984e61b05a9214165d9239" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="Z_CAR_EMP_NAME" formId="4cebf85514984e61b05a9214165d9239" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="Z_CAR_MACHINE" formId="4cebf85514984e61b05a9214165d9239" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4cebf85514984e61b05a9214165d9239" onscroll="ajaxTableScroll(this,'4cebf85514984e61b05a9214165d9239')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4cebf85514984e61b05a9214165d9239">
		<tbody id="tbody_4cebf85514984e61b05a9214165d9239" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4cebf85514984e61b05a9214165d9239==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4cebf85514984e61b05a9214165d9239&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="501c8ac20a044606b4e86b985e38b1f0" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="501c8ac20a044606b4e86b985e38b1f0" />
    
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
    if(formId=='4cebf85514984e61b05a9214165d9239'){<%--车间信息1--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='Z_CAR_ID' class='datagrid-cell "+ms.tdClass(formId, 'Z_CAR_ID')+"' style='"+ms.tdStyle(formId, 'Z_CAR_ID')+"' "+ms.tdEvent(formId, 'Z_CAR_ID')+">")
            arrHtml.push("<span colno='Z_CAR_ID' class='"+ms.uiClass(formId, 'Z_CAR_ID')+"' style='"+ms.uiStyle(formId, 'Z_CAR_ID')+"' "+ms.uiEvent(formId, 'Z_CAR_ID')+" title='"+ms.titleAttr(formId,'Z_CAR_ID','IS_TITLE_ATTR',v)+"' >"+v['Z_CAR_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='Z_CAR_EMP_NAME' class='datagrid-cell "+ms.tdClass(formId, 'Z_CAR_EMP_NAME')+"' style='"+ms.tdStyle(formId, 'Z_CAR_EMP_NAME')+"' "+ms.tdEvent(formId, 'Z_CAR_EMP_NAME')+">")
            arrHtml.push("<span colno='Z_CAR_EMP_NAME' class='"+ms.uiClass(formId, 'Z_CAR_EMP_NAME')+"' style='"+ms.uiStyle(formId, 'Z_CAR_EMP_NAME')+"' "+ms.uiEvent(formId, 'Z_CAR_EMP_NAME')+" title='"+ms.titleAttr(formId,'Z_CAR_EMP_NAME','IS_TITLE_ATTR',v)+"' >"+v['Z_CAR_EMP_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='Z_CAR_MACHINE' class='datagrid-cell "+ms.tdClass(formId, 'Z_CAR_MACHINE')+"' style='"+ms.tdStyle(formId, 'Z_CAR_MACHINE')+"' "+ms.tdEvent(formId, 'Z_CAR_MACHINE')+">")
            arrHtml.push("<span colno='Z_CAR_MACHINE' class='"+ms.uiClass(formId, 'Z_CAR_MACHINE')+"' style='"+ms.uiStyle(formId, 'Z_CAR_MACHINE')+"' "+ms.uiEvent(formId, 'Z_CAR_MACHINE')+" title='"+ms.titleAttr(formId,'Z_CAR_MACHINE','IS_TITLE_ATTR',v)+"' >"+v['Z_CAR_MACHINE']+"</span>")
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
