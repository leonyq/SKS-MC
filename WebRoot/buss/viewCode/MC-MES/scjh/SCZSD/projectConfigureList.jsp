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
		<dict:lang value="机种项目配置列表" />
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
		<bu:header formId ="89d3363bb50f4d9abd364d9fe2acdc9a"/>

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
		<bu:func viewId="3e4ead521ae248c48468c96b843746de" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="3e4ead521ae248c48468c96b843746de" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage89d3363bb50f4d9abd364d9fe2acdc9a" id="formPage89d3363bb50f4d9abd364d9fe2acdc9a" value="${formPage89d3363bb50f4d9abd364d9fe2acdc9a}"/>
		<input type="hidden" name="formId" id="formId1" value='89d3363bb50f4d9abd364d9fe2acdc9a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="89d3363bb50f4d9abd364d9fe2acdc9a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax89d3363bb50f4d9abd364d9fe2acdc9a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner89d3363bb50f4d9abd364d9fe2acdc9a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable89d3363bb50f4d9abd364d9fe2acdc9a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="89d3363bb50f4d9abd364d9fe2acdc9a" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_89d3363bb50f4d9abd364d9fe2acdc9a" onclick="_selectAjaxTableAllData(this,'89d3363bb50f4d9abd364d9fe2acdc9a')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CO_ITEM_CODE" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CO_ITEM_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CO_ITEM_SPEC" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CO_TEMPLATE_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CO_PROJECT_CODE" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn  colNo="CO_STATE" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T2#CO_PROJECT_NAME" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T3#VALUE" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T2#CO_AFFECT_INFO" formId="89d3363bb50f4d9abd364d9fe2acdc9a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv89d3363bb50f4d9abd364d9fe2acdc9a" onscroll="ajaxTableScroll(this,'89d3363bb50f4d9abd364d9fe2acdc9a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax89d3363bb50f4d9abd364d9fe2acdc9a">
		<tbody id="tbody_89d3363bb50f4d9abd364d9fe2acdc9a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage89d3363bb50f4d9abd364d9fe2acdc9a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=89d3363bb50f4d9abd364d9fe2acdc9a&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3e4ead521ae248c48468c96b843746de" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3e4ead521ae248c48468c96b843746de" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	checkboxAll("joblist");
}
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='89d3363bb50f4d9abd364d9fe2acdc9a'){<%--机种项目配置信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_TEMPLATE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_TEMPLATE_NAME')+"' style='"+ms.tdStyle(formId, 'CO_TEMPLATE_NAME')+"' "+ms.tdEvent(formId, 'CO_TEMPLATE_NAME')+">")
            //arrHtml.push("<span colno='CO_TEMPLATE_NAME' class='"+ms.uiClass(formId, 'CO_TEMPLATE_NAME')+"' style='"+ms.uiStyle(formId, 'CO_TEMPLATE_NAME')+"' "+ms.uiEvent(formId, 'CO_TEMPLATE_NAME')+"  >"+v['CO_TEMPLATE_NAME']+"</span>")
            //arrHtml.push("</td>");
            //arrHtml.push("<td colno='CO_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CO_PRODUCT_STEP')+"' style='"+ms.tdStyle(formId, 'CO_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CO_PRODUCT_STEP')+">")
            //arrHtml.push("<span colno='CO_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CO_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CO_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CO_PRODUCT_STEP')+"  >"+v['CO_PRODUCT_STEP']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;  "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"'  >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_CODE')+"' style='width:150px; ' "+ms.tdEvent(formId, 'CO_ITEM_CODE')+">")
            arrHtml.push("<span colno='CO_ITEM_CODE' class='"+ms.uiClass(formId, 'CO_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CO_ITEM_CODE')+"  title='"+ms.titleAttr(formId,'CO_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CO_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_NAME')+"' style='width:150px; ' "+ms.tdEvent(formId, 'CO_ITEM_NAME')+">")
            arrHtml.push("<span colno='CO_ITEM_NAME' class='"+ms.uiClass(formId, 'CO_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CO_ITEM_NAME')+"  title='"+ms.titleAttr(formId,'CO_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CO_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CO_ITEM_SPEC')+"' style='width:150px; ' "+ms.tdEvent(formId, 'CO_ITEM_SPEC')+">")
            arrHtml.push("<span colno='CO_ITEM_SPEC' class='"+ms.uiClass(formId, 'CO_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CO_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CO_ITEM_SPEC')+"  title='"+ms.titleAttr(formId,'CO_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['CO_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_TEMPLATE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CO_TEMPLATE_NAME')+"' style='width:150px; text-align:center;' "+ms.tdEvent(formId, 'CO_TEMPLATE_NAME')+">")
            arrHtml.push("<span colno='CO_TEMPLATE_NAME' class='"+ms.uiClass(formId, 'CO_TEMPLATE_NAME')+"' style='"+ms.uiStyle(formId, 'CO_TEMPLATE_NAME')+"' "+ms.uiEvent(formId, 'CO_TEMPLATE_NAME')+"  title='"+ms.titleAttr(formId,'CO_TEMPLATE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CO_TEMPLATE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_PROJECT_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CO_PROJECT_CODE')+"' style='width:150px; text-align:center;' "+ms.tdEvent(formId, 'CO_PROJECT_CODE')+">")
            arrHtml.push("<span colno='CO_PROJECT_CODE' class='"+ms.uiClass(formId, 'CO_PROJECT_CODE')+"' style='"+ms.uiStyle(formId, 'CO_PROJECT_CODE')+"' "+ms.uiEvent(formId, 'CO_PROJECT_CODE')+"  title='"+ms.titleAttr(formId,'CO_PROJECT_CODE','IS_TITLE_ATTR',v)+"' >"+v['CO_PROJECT_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CO_STATE' class='datagrid-cell "+ms.tdClass(formId, 'CO_STATE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CO_STATE')+"' "+ms.tdEvent(formId, 'CO_STATE')+">")
            arrHtml.push("<span colno='CO_STATE' class='"+ms.uiClass(formId, 'CO_STATE')+"' style='"+ms.uiStyle(formId, 'CO_STATE')+"' "+ms.uiEvent(formId, 'CO_STATE')+"  title='"+ms.titleAttr(formId,'CO_STATE','IS_TITLE_ATTR',v)+"' >"+v['CO_STATE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CO_PROJECT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CO_PROJECT_NAME')+"' style='width:150px; text-align:center;' "+ms.tdEvent(formId, 'T2#CO_PROJECT_NAME')+">")
            arrHtml.push("<span colno='T2#CO_PROJECT_NAME' class='"+ms.uiClass(formId, 'T2#CO_PROJECT_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CO_PROJECT_NAME')+"' "+ms.uiEvent(formId, 'T2#CO_PROJECT_NAME')+"  title='"+ms.titleAttr(formId,'T2#CO_PROJECT_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CO_PROJECT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#VALUE' class='datagrid-cell "+ms.tdClass(formId, 'T3#VALUE')+"' style='width:150px;text-align:center; "+ms.tdStyle(formId, 'T3#VALUE')+"' "+ms.tdEvent(formId, 'T3#VALUE')+">")
            arrHtml.push("<span colno='T3#VALUE' class='"+ms.uiClass(formId, 'T3#VALUE')+"' style='"+ms.uiStyle(formId, 'T3#VALUE')+"' "+ms.uiEvent(formId, 'T3#VALUE')+"  title='"+ms.titleAttr(formId,'T3#VALUE','IS_TITLE_ATTR',v)+"' >"+v['T3#VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#VALUE' class='datagrid-cell "+ms.tdClass(formId, 'T4#VALUE')+"' style='width:150px; "+ms.tdStyle(formId, 'T4#VALUE')+"' "+ms.tdEvent(formId, 'T4#VALUE')+">")
            arrHtml.push("<span colno='T4#VALUE' class='"+ms.uiClass(formId, 'T4#VALUE')+"' style='"+ms.uiStyle(formId, 'T4#VALUE')+"' "+ms.uiEvent(formId, 'T4#VALUE')+" title='"+ms.titleAttr(formId,'T4#VALUE','IS_TITLE_ATTR',v)+"'  >"+v['T4#VALUE']+"</span>")
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
