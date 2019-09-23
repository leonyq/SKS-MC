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
		<dict:lang value="检测项目类型列表" />
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
		<bu:header formId ="be5d3c53cd2b455fa480961d1f3e7b86"/>

    
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
		<bu:func viewId="76997923e6674206859221b7e5e2d5dc" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="76997923e6674206859221b7e5e2d5dc" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagebe5d3c53cd2b455fa480961d1f3e7b86" id="formPagebe5d3c53cd2b455fa480961d1f3e7b86" value="${formPagebe5d3c53cd2b455fa480961d1f3e7b86}"/>
		<input type="hidden" name="formId" id="formId1" value='be5d3c53cd2b455fa480961d1f3e7b86'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="be5d3c53cd2b455fa480961d1f3e7b86">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxbe5d3c53cd2b455fa480961d1f3e7b86" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerbe5d3c53cd2b455fa480961d1f3e7b86">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablebe5d3c53cd2b455fa480961d1f3e7b86" style="min-width:1170px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="be5d3c53cd2b455fa480961d1f3e7b86" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_be5d3c53cd2b455fa480961d1f3e7b86" onclick="_selectAjaxTableAllData(this,'be5d3c53cd2b455fa480961d1f3e7b86')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QST_TEST_STEP" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QST_SAMPLE_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QST_ITEM_TYPE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QST_SAMPLE_PLAN" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QST_ERROR_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QST_TEST_LEVEL" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QST_TEST_GRADE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QST_ALQ_VALUE" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QST_DEFAULT_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QST_FULL_FLAG" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QST_THRESHOLD" formId="be5d3c53cd2b455fa480961d1f3e7b86" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivbe5d3c53cd2b455fa480961d1f3e7b86" onscroll="ajaxTableScroll(this,'be5d3c53cd2b455fa480961d1f3e7b86')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxbe5d3c53cd2b455fa480961d1f3e7b86" style="min-width:1170px;">
		<tbody id="tbody_be5d3c53cd2b455fa480961d1f3e7b86" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagebe5d3c53cd2b455fa480961d1f3e7b86==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=be5d3c53cd2b455fa480961d1f3e7b86&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="76997923e6674206859221b7e5e2d5dc" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="76997923e6674206859221b7e5e2d5dc" />
    
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
    	//checkboxAll("joblist");
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
    if(formId=='be5d3c53cd2b455fa480961d1f3e7b86'){<%--检验项目类型信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QST_TEST_STEP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QST_TEST_STEP')+"' "+ms.tdEvent(formId, 'QST_TEST_STEP')+">")
            arrHtml.push("<span colno='QST_TEST_STEP' class='"+ms.uiClass(formId, 'QST_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QST_TEST_STEP')+"' "+ms.uiEvent(formId, 'QST_TEST_STEP')+" title='"+ms.titleAttr(formId,'QST_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QST_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_SAMPLE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QST_SAMPLE_TYPE')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'QST_SAMPLE_TYPE')+"' "+ms.tdEvent(formId, 'QST_SAMPLE_TYPE')+">")
            arrHtml.push("<span colno='QST_SAMPLE_TYPE' class='"+ms.uiClass(formId, 'QST_SAMPLE_TYPE')+"' style='"+ms.uiStyle(formId, 'QST_SAMPLE_TYPE')+"' "+ms.uiEvent(formId, 'QST_SAMPLE_TYPE')+" title='"+ms.titleAttr(formId,'QST_SAMPLE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QST_SAMPLE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QST_ITEM_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QST_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'QST_ITEM_TYPE')+">")
            arrHtml.push("<span colno='QST_ITEM_TYPE' class='"+ms.uiClass(formId, 'QST_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'QST_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'QST_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'QST_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QST_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_SAMPLE_PLAN' class='datagrid-cell "+ms.tdClass(formId, 'QST_SAMPLE_PLAN')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QST_SAMPLE_PLAN')+"' "+ms.tdEvent(formId, 'QST_SAMPLE_PLAN')+">")
            arrHtml.push("<span colno='QST_SAMPLE_PLAN' class='"+ms.uiClass(formId, 'QST_SAMPLE_PLAN')+"' style='"+ms.uiStyle(formId, 'QST_SAMPLE_PLAN')+"' "+ms.uiEvent(formId, 'QST_SAMPLE_PLAN')+" title='"+ms.titleAttr(formId,'QST_SAMPLE_PLAN','IS_TITLE_ATTR',v)+"' >"+v['QST_SAMPLE_PLAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_ERROR_GRADE' class='datagrid-cell "+ms.tdClass(formId, 'QST_ERROR_GRADE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QST_ERROR_GRADE')+"' "+ms.tdEvent(formId, 'QST_ERROR_GRADE')+">")
            arrHtml.push("<span colno='QST_ERROR_GRADE' class='"+ms.uiClass(formId, 'QST_ERROR_GRADE')+"' style='"+ms.uiStyle(formId, 'QST_ERROR_GRADE')+"' "+ms.uiEvent(formId, 'QST_ERROR_GRADE')+" title='"+ms.titleAttr(formId,'QST_ERROR_GRADE','IS_TITLE_ATTR',v)+"' >"+v['QST_ERROR_GRADE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_TEST_LEVEL' class='datagrid-cell "+ms.tdClass(formId, 'QST_TEST_LEVEL')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QST_TEST_LEVEL')+"' "+ms.tdEvent(formId, 'QST_TEST_LEVEL')+">")
            arrHtml.push("<span colno='QST_TEST_LEVEL' class='"+ms.uiClass(formId, 'QST_TEST_LEVEL')+"' style='"+ms.uiStyle(formId, 'QST_TEST_LEVEL')+"' "+ms.uiEvent(formId, 'QST_TEST_LEVEL')+" title='"+ms.titleAttr(formId,'QST_TEST_LEVEL','IS_TITLE_ATTR',v)+"' >"+v['QST_TEST_LEVEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_TEST_GRADE' class='datagrid-cell "+ms.tdClass(formId, 'QST_TEST_GRADE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QST_TEST_GRADE')+"' "+ms.tdEvent(formId, 'QST_TEST_GRADE')+">")
            arrHtml.push("<span colno='QST_TEST_GRADE' class='"+ms.uiClass(formId, 'QST_TEST_GRADE')+"' style='"+ms.uiStyle(formId, 'QST_TEST_GRADE')+"' "+ms.uiEvent(formId, 'QST_TEST_GRADE')+" title='"+ms.titleAttr(formId,'QST_TEST_GRADE','IS_TITLE_ATTR',v)+"' >"+v['QST_TEST_GRADE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_ALQ_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'QST_ALQ_VALUE')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QST_ALQ_VALUE')+"' "+ms.tdEvent(formId, 'QST_ALQ_VALUE')+">")
            arrHtml.push("<span colno='QST_ALQ_VALUE' class='"+ms.uiClass(formId, 'QST_ALQ_VALUE')+"' style='"+ms.uiStyle(formId, 'QST_ALQ_VALUE')+"' "+ms.uiEvent(formId, 'QST_ALQ_VALUE')+" title='"+ms.titleAttr(formId,'QST_ALQ_VALUE','IS_TITLE_ATTR',v)+"' >"+v['QST_ALQ_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QST_DEFAULT_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QST_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'QST_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='QST_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'QST_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'QST_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'QST_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'QST_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QST_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_FULL_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QST_FULL_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QST_FULL_FLAG')+"' "+ms.tdEvent(formId, 'QST_FULL_FLAG')+">")
            arrHtml.push("<span colno='QST_FULL_FLAG' class='"+ms.uiClass(formId, 'QST_FULL_FLAG')+"' style='"+ms.uiStyle(formId, 'QST_FULL_FLAG')+"' "+ms.uiEvent(formId, 'QST_FULL_FLAG')+" title='"+ms.titleAttr(formId,'QST_FULL_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QST_FULL_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QST_THRESHOLD' class='datagrid-cell "+ms.tdClass(formId, 'QST_THRESHOLD')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QST_THRESHOLD')+"' "+ms.tdEvent(formId, 'QST_THRESHOLD')+">")
            arrHtml.push("<span colno='QST_THRESHOLD' class='"+ms.uiClass(formId, 'QST_THRESHOLD')+"' style='"+ms.uiStyle(formId, 'QST_THRESHOLD')+"' "+ms.uiEvent(formId, 'QST_THRESHOLD')+" title='"+ms.titleAttr(formId,'QST_THRESHOLD','IS_TITLE_ATTR',v)+"' >"+v['QST_THRESHOLD']+"</span>")
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
