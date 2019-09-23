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
		<dict:lang value="机种检测项目" />
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
		<bu:header formId ="39d36d92711a4c7789582bf04f5a16e3"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body  >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="d94c64ce999042d8a368188a68a73f90" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="d94c64ce999042d8a368188a68a73f90" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage39d36d92711a4c7789582bf04f5a16e3" id="formPage39d36d92711a4c7789582bf04f5a16e3" value="${formPage39d36d92711a4c7789582bf04f5a16e3}"/>
		<input type="hidden" name="formId" id="formId1" value='39d36d92711a4c7789582bf04f5a16e3'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="39d36d92711a4c7789582bf04f5a16e3">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax39d36d92711a4c7789582bf04f5a16e3" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner39d36d92711a4c7789582bf04f5a16e3">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable39d36d92711a4c7789582bf04f5a16e3">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="39d36d92711a4c7789582bf04f5a16e3" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_39d36d92711a4c7789582bf04f5a16e3" onclick="_selectAjaxTableAllData(this,'39d36d92711a4c7789582bf04f5a16e3')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center;"><bu:uitn colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="QMI_ITEM_SN" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center;"><bu:uitn colNo="QMI_ITEM_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell"  style="width:80px; text-align:center;"><bu:uitn colNo="QMI_ITEM_TYPE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell"  style="width:80px; text-align:center;"><bu:uitn colNo="QMI_RANGE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell"  style="width:80px; text-align:center;"><bu:uitn colNo="QMI_MAX" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell"  style="width:80px; text-align:center;"><bu:uitn colNo="QMI_MIN" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell"  style="width:80px; text-align:center;"><bu:uitn colNo="QMI_UNIT" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell"  style="width:80px; text-align:center;"><bu:uitn colNo="QMI_TEST_METHOD" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell"  style="width:80px; text-align:center;"><bu:uitn colNo="QMI_TEST_CONTENT" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell"  style="width:80px; text-align:center;"><bu:uitn colNo="QMI_TEST_SORT" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv39d36d92711a4c7789582bf04f5a16e3" onscroll="ajaxTableScroll(this,'39d36d92711a4c7789582bf04f5a16e3')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax39d36d92711a4c7789582bf04f5a16e3">
		<tbody id="tbody_39d36d92711a4c7789582bf04f5a16e3" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage39d36d92711a4c7789582bf04f5a16e3==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=39d36d92711a4c7789582bf04f5a16e3&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="d94c64ce999042d8a368188a68a73f90" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d94c64ce999042d8a368188a68a73f90" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
    function reloadPg(msg,title,width,height,time,isCloseWin){
    	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
    }
    function reloadPgExe(isCloseWin){
    	/* document.forms.search_form.submit();
    	util.showTopLoading(); */
    	query("formId1");
    	if ("0" == isCloseWin || undefined == isCloseWin) {
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
    if(formId=='39d36d92711a4c7789582bf04f5a16e3'){<%--机种检测项目--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='MODEL_CODE_"+v.ID+"' value='"+v['QMI_MODEL_CODE']+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");            
            arrHtml.push("<td colno='QMI_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QMI_TEST_STEP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QMI_TEST_STEP')+"' "+ms.tdEvent(formId, 'QMI_TEST_STEP')+">")
            arrHtml.push("<span colno='QMI_TEST_STEP' class='"+ms.uiClass(formId, 'QMI_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QMI_TEST_STEP')+"' "+ms.uiEvent(formId, 'QMI_TEST_STEP')+" title='"+ms.titleAttr(formId,'QMI_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QMI_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QMI_MODEL_CODE')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'QMI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'QMI_MODEL_CODE')+">")
            arrHtml.push("<span colno='QMI_MODEL_CODE' class='"+ms.uiClass(formId, 'QMI_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'QMI_MODEL_CODE')+"' "+ms.uiEvent(formId, 'QMI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'QMI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['QMI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QMI_MODEL_NAME')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'QMI_MODEL_NAME')+"' "+ms.tdEvent(formId, 'QMI_MODEL_NAME')+">")
            arrHtml.push("<span colno='QMI_MODEL_NAME' class='"+ms.uiClass(formId, 'QMI_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'QMI_MODEL_NAME')+"' "+ms.uiEvent(formId, 'QMI_MODEL_NAME')+" title='"+ms.titleAttr(formId,'QMI_MODEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['QMI_MODEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_MODEL_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QMI_MODEL_SPEC')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'QMI_MODEL_SPEC')+"' "+ms.tdEvent(formId, 'QMI_MODEL_SPEC')+">")
            arrHtml.push("<span colno='QMI_MODEL_SPEC' class='"+ms.uiClass(formId, 'QMI_MODEL_SPEC')+"' style='"+ms.uiStyle(formId, 'QMI_MODEL_SPEC')+"' "+ms.uiEvent(formId, 'QMI_MODEL_SPEC')+" title='"+ms.titleAttr(formId,'QMI_MODEL_SPEC','IS_TITLE_ATTR',v)+"' >"+v['QMI_MODEL_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_SN')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'QMI_ITEM_SN')+"' "+ms.tdEvent(formId, 'QMI_ITEM_SN')+">")
            arrHtml.push("<span colno='QMI_ITEM_SN' class='"+ms.uiClass(formId, 'QMI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_SN')+"' "+ms.uiEvent(formId, 'QMI_ITEM_SN')+" title='"+ms.titleAttr(formId,'QMI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_NAME')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'QMI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QMI_ITEM_NAME')+">")
            arrHtml.push("<span colno='QMI_ITEM_NAME' class='"+ms.uiClass(formId, 'QMI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QMI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QMI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_TYPE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QMI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'QMI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='QMI_ITEM_TYPE' class='"+ms.uiClass(formId, 'QMI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'QMI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'QMI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='F1#VALUE' class='datagrid-cell "+ms.tdClass(formId, 'F1#VALUE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'F1#VALUE')+"' "+ms.tdEvent(formId, 'F1#VALUE')+">")
            arrHtml.push("<span colno='F1#VALUE' class='"+ms.uiClass(formId, 'F1#VALUE')+"' style='"+ms.uiStyle(formId, 'F1#VALUE')+"' "+ms.uiEvent(formId, 'F1#VALUE')+" title='"+ms.titleAttr(formId,'F1#VALUE','IS_TITLE_ATTR',v)+"' >"+v['F1#VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_MAX' class='datagrid-cell "+ms.tdClass(formId, 'QMI_MAX')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QMI_MAX')+"' "+ms.tdEvent(formId, 'QMI_MAX')+">")
            arrHtml.push("<span colno='QMI_MAX' class='"+ms.uiClass(formId, 'QMI_MAX')+"' style='"+ms.uiStyle(formId, 'QMI_MAX')+"' "+ms.uiEvent(formId, 'QMI_MAX')+" title='"+ms.titleAttr(formId,'QMI_MAX','IS_TITLE_ATTR',v)+"' >"+v['QMI_MAX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_MIN' class='datagrid-cell "+ms.tdClass(formId, 'QMI_MIN')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QMI_MIN')+"' "+ms.tdEvent(formId, 'QMI_MIN')+">")
            arrHtml.push("<span colno='QMI_MIN' class='"+ms.uiClass(formId, 'QMI_MIN')+"' style='"+ms.uiStyle(formId, 'QMI_MIN')+"' "+ms.uiEvent(formId, 'QMI_MIN')+" title='"+ms.titleAttr(formId,'QMI_MIN','IS_TITLE_ATTR',v)+"' >"+v['QMI_MIN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'QMI_UNIT')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QMI_UNIT')+"' "+ms.tdEvent(formId, 'QMI_UNIT')+">")
            arrHtml.push("<span colno='QMI_UNIT' class='"+ms.uiClass(formId, 'QMI_UNIT')+"' style='"+ms.uiStyle(formId, 'QMI_UNIT')+"' "+ms.uiEvent(formId, 'QMI_UNIT')+" title='"+ms.titleAttr(formId,'QMI_UNIT','IS_TITLE_ATTR',v)+"' >"+v['QMI_UNIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_TEST_METHOD' class='datagrid-cell "+ms.tdClass(formId, 'QMI_TEST_METHOD')+"' style='width:80px;text-align:left;"+ms.tdStyle(formId, 'QMI_TEST_METHOD')+"' "+ms.tdEvent(formId, 'QMI_TEST_METHOD')+">")
            arrHtml.push("<span colno='QMI_TEST_METHOD' class='"+ms.uiClass(formId, 'QMI_TEST_METHOD')+"' style='"+ms.uiStyle(formId, 'QMI_TEST_METHOD')+"' "+ms.uiEvent(formId, 'QMI_TEST_METHOD')+" title='"+ms.titleAttr(formId,'QMI_TEST_METHOD','IS_TITLE_ATTR',v)+"' >"+v['QMI_TEST_METHOD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_TEST_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'QMI_TEST_CONTENT')+"' style='width:80px;text-align:left;"+ms.tdStyle(formId, 'QMI_TEST_CONTENT')+"' "+ms.tdEvent(formId, 'QMI_TEST_CONTENT')+">")
            arrHtml.push("<span colno='QMI_TEST_CONTENT' class='"+ms.uiClass(formId, 'QMI_TEST_CONTENT')+"' style='"+ms.uiStyle(formId, 'QMI_TEST_CONTENT')+"' "+ms.uiEvent(formId, 'QMI_TEST_CONTENT')+" title='"+ms.titleAttr(formId,'QMI_TEST_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['QMI_TEST_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_TEST_SORT' class='datagrid-cell "+ms.tdClass(formId, 'QMI_TEST_SORT')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QMI_TEST_SORT')+"' "+ms.tdEvent(formId, 'QMI_TEST_SORT')+">")
            arrHtml.push("<span colno='QMI_TEST_SORT' class='"+ms.uiClass(formId, 'QMI_TEST_SORT')+"' style='"+ms.uiStyle(formId, 'QMI_TEST_SORT')+"' "+ms.uiEvent(formId, 'QMI_TEST_SORT')+" title='"+ms.titleAttr(formId,'QMI_TEST_SORT','IS_TITLE_ATTR',v)+"' >"+v['QMI_TEST_SORT']+"</span>")
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
