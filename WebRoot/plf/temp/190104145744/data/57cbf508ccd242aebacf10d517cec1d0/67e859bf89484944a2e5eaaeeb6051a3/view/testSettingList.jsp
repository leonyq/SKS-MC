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
		<dict:lang value="检验配置列表" />
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
		<bu:header formId ="fe2f562eab2645eea5c2c4131957c06c"/>

    
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
		<bu:func viewId="67e859bf89484944a2e5eaaeeb6051a3" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="67e859bf89484944a2e5eaaeeb6051a3" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagefe2f562eab2645eea5c2c4131957c06c" id="formPagefe2f562eab2645eea5c2c4131957c06c" value="${formPagefe2f562eab2645eea5c2c4131957c06c}"/>
		<input type="hidden" name="formId" id="formId1" value='fe2f562eab2645eea5c2c4131957c06c'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="fe2f562eab2645eea5c2c4131957c06c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxfe2f562eab2645eea5c2c4131957c06c" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerfe2f562eab2645eea5c2c4131957c06c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablefe2f562eab2645eea5c2c4131957c06c" style="min-width:1560px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="fe2f562eab2645eea5c2c4131957c06c" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_fe2f562eab2645eea5c2c4131957c06c" onclick="_selectAjaxTableAllData(this,'fe2f562eab2645eea5c2c4131957c06c')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="DATA_AUTH" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivfe2f562eab2645eea5c2c4131957c06c" onscroll="ajaxTableScroll(this,'fe2f562eab2645eea5c2c4131957c06c')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxfe2f562eab2645eea5c2c4131957c06c" style="min-width:1560px;">
		<tbody id="tbody_fe2f562eab2645eea5c2c4131957c06c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagefe2f562eab2645eea5c2c4131957c06c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=fe2f562eab2645eea5c2c4131957c06c&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="67e859bf89484944a2e5eaaeeb6051a3" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="67e859bf89484944a2e5eaaeeb6051a3" />
    
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
    if(formId=='fe2f562eab2645eea5c2c4131957c06c'){<%--检验设置信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QSC_TEST_STEP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSC_TEST_STEP')+"' "+ms.tdEvent(formId, 'QSC_TEST_STEP')+">")
            arrHtml.push("<span colno='QSC_TEST_STEP' class='"+ms.uiClass(formId, 'QSC_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QSC_TEST_STEP')+"' "+ms.uiEvent(formId, 'QSC_TEST_STEP')+" title='"+ms.titleAttr(formId,'QSC_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QSC_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_SAMPLE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_SAMPLE_TYPE')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'QSC_SAMPLE_TYPE')+"' "+ms.tdEvent(formId, 'QSC_SAMPLE_TYPE')+">")
            arrHtml.push("<span colno='QSC_SAMPLE_TYPE' class='"+ms.uiClass(formId, 'QSC_SAMPLE_TYPE')+"' style='"+ms.uiStyle(formId, 'QSC_SAMPLE_TYPE')+"' "+ms.uiEvent(formId, 'QSC_SAMPLE_TYPE')+" title='"+ms.titleAttr(formId,'QSC_SAMPLE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QSC_SAMPLE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_PRICESS_MODE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_PRICESS_MODE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QSC_PRICESS_MODE')+"' "+ms.tdEvent(formId, 'QSC_PRICESS_MODE')+">")
            arrHtml.push("<span colno='QSC_PRICESS_MODE' class='"+ms.uiClass(formId, 'QSC_PRICESS_MODE')+"' style='"+ms.uiStyle(formId, 'QSC_PRICESS_MODE')+"' "+ms.uiEvent(formId, 'QSC_PRICESS_MODE')+" title='"+ms.titleAttr(formId,'QSC_PRICESS_MODE','IS_TITLE_ATTR',v)+"' >"+v['QSC_PRICESS_MODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_AUTO_EXAMINE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_AUTO_EXAMINE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSC_AUTO_EXAMINE')+"' "+ms.tdEvent(formId, 'QSC_AUTO_EXAMINE')+">")
            arrHtml.push("<span colno='QSC_AUTO_EXAMINE' class='"+ms.uiClass(formId, 'QSC_AUTO_EXAMINE')+"' style='"+ms.uiStyle(formId, 'QSC_AUTO_EXAMINE')+"' "+ms.uiEvent(formId, 'QSC_AUTO_EXAMINE')+" title='"+ms.titleAttr(formId,'QSC_AUTO_EXAMINE','IS_TITLE_ATTR',v)+"' >"+v['QSC_AUTO_EXAMINE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QSC_DEFAULT_FLAG')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSC_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'QSC_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='QSC_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'QSC_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'QSC_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'QSC_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'QSC_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QSC_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_CREATE_MODE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_CREATE_MODE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QSC_CREATE_MODE')+"' "+ms.tdEvent(formId, 'QSC_CREATE_MODE')+">")
            arrHtml.push("<span colno='QSC_CREATE_MODE' class='"+ms.uiClass(formId, 'QSC_CREATE_MODE')+"' style='"+ms.uiStyle(formId, 'QSC_CREATE_MODE')+"' "+ms.uiEvent(formId, 'QSC_CREATE_MODE')+" title='"+ms.titleAttr(formId,'QSC_CREATE_MODE','IS_TITLE_ATTR',v)+"' >"+v['QSC_CREATE_MODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_JUDGE_MODE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_JUDGE_MODE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QSC_JUDGE_MODE')+"' "+ms.tdEvent(formId, 'QSC_JUDGE_MODE')+">")
            arrHtml.push("<span colno='QSC_JUDGE_MODE' class='"+ms.uiClass(formId, 'QSC_JUDGE_MODE')+"' style='"+ms.uiStyle(formId, 'QSC_JUDGE_MODE')+"' "+ms.uiEvent(formId, 'QSC_JUDGE_MODE')+" title='"+ms.titleAttr(formId,'QSC_JUDGE_MODE','IS_TITLE_ATTR',v)+"' >"+v['QSC_JUDGE_MODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_DIVIDE_MODE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_DIVIDE_MODE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QSC_DIVIDE_MODE')+"' "+ms.tdEvent(formId, 'QSC_DIVIDE_MODE')+">")
            arrHtml.push("<span colno='QSC_DIVIDE_MODE' class='"+ms.uiClass(formId, 'QSC_DIVIDE_MODE')+"' style='"+ms.uiStyle(formId, 'QSC_DIVIDE_MODE')+"' "+ms.uiEvent(formId, 'QSC_DIVIDE_MODE')+" title='"+ms.titleAttr(formId,'QSC_DIVIDE_MODE','IS_TITLE_ATTR',v)+"' >"+v['QSC_DIVIDE_MODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_DIVIDE_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_DIVIDE_VALUE')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSC_DIVIDE_VALUE')+"' "+ms.tdEvent(formId, 'QSC_DIVIDE_VALUE')+">")
            arrHtml.push("<span colno='QSC_DIVIDE_VALUE' class='"+ms.uiClass(formId, 'QSC_DIVIDE_VALUE')+"' style='"+ms.uiStyle(formId, 'QSC_DIVIDE_VALUE')+"' "+ms.uiEvent(formId, 'QSC_DIVIDE_VALUE')+" title='"+ms.titleAttr(formId,'QSC_DIVIDE_VALUE','IS_TITLE_ATTR',v)+"' >"+v['QSC_DIVIDE_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_CTRL_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QSC_CTRL_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QSC_CTRL_FLAG')+"' "+ms.tdEvent(formId, 'QSC_CTRL_FLAG')+">")
            arrHtml.push("<span colno='QSC_CTRL_FLAG' class='"+ms.uiClass(formId, 'QSC_CTRL_FLAG')+"' style='"+ms.uiStyle(formId, 'QSC_CTRL_FLAG')+"' "+ms.uiEvent(formId, 'QSC_CTRL_FLAG')+" title='"+ms.titleAttr(formId,'QSC_CTRL_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QSC_CTRL_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_STRICT_NORMAL' class='datagrid-cell "+ms.tdClass(formId, 'QSC_STRICT_NORMAL')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QSC_STRICT_NORMAL')+"' "+ms.tdEvent(formId, 'QSC_STRICT_NORMAL')+">")
            arrHtml.push("<span colno='QSC_STRICT_NORMAL' class='"+ms.uiClass(formId, 'QSC_STRICT_NORMAL')+"' style='"+ms.uiStyle(formId, 'QSC_STRICT_NORMAL')+"' "+ms.uiEvent(formId, 'QSC_STRICT_NORMAL')+" title='"+ms.titleAttr(formId,'QSC_STRICT_NORMAL','IS_TITLE_ATTR',v)+"' >"+v['QSC_STRICT_NORMAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_NORMAL_RELAX' class='datagrid-cell "+ms.tdClass(formId, 'QSC_NORMAL_RELAX')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QSC_NORMAL_RELAX')+"' "+ms.tdEvent(formId, 'QSC_NORMAL_RELAX')+">")
            arrHtml.push("<span colno='QSC_NORMAL_RELAX' class='"+ms.uiClass(formId, 'QSC_NORMAL_RELAX')+"' style='"+ms.uiStyle(formId, 'QSC_NORMAL_RELAX')+"' "+ms.uiEvent(formId, 'QSC_NORMAL_RELAX')+" title='"+ms.titleAttr(formId,'QSC_NORMAL_RELAX','IS_TITLE_ATTR',v)+"' >"+v['QSC_NORMAL_RELAX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_RELAX_NORMAL' class='datagrid-cell "+ms.tdClass(formId, 'QSC_RELAX_NORMAL')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QSC_RELAX_NORMAL')+"' "+ms.tdEvent(formId, 'QSC_RELAX_NORMAL')+">")
            arrHtml.push("<span colno='QSC_RELAX_NORMAL' class='"+ms.uiClass(formId, 'QSC_RELAX_NORMAL')+"' style='"+ms.uiStyle(formId, 'QSC_RELAX_NORMAL')+"' "+ms.uiEvent(formId, 'QSC_RELAX_NORMAL')+" title='"+ms.titleAttr(formId,'QSC_RELAX_NORMAL','IS_TITLE_ATTR',v)+"' >"+v['QSC_RELAX_NORMAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_STRICT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QSC_STRICT_NUM')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'QSC_STRICT_NUM')+"' "+ms.tdEvent(formId, 'QSC_STRICT_NUM')+">")
            arrHtml.push("<span colno='QSC_STRICT_NUM' class='"+ms.uiClass(formId, 'QSC_STRICT_NUM')+"' style='"+ms.uiStyle(formId, 'QSC_STRICT_NUM')+"' "+ms.uiEvent(formId, 'QSC_STRICT_NUM')+" title='"+ms.titleAttr(formId,'QSC_STRICT_NUM','IS_TITLE_ATTR',v)+"' >"+v['QSC_STRICT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_STRICT_TOTAL' class='datagrid-cell "+ms.tdClass(formId, 'QSC_STRICT_TOTAL')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'QSC_STRICT_TOTAL')+"' "+ms.tdEvent(formId, 'QSC_STRICT_TOTAL')+">")
            arrHtml.push("<span colno='QSC_STRICT_TOTAL' class='"+ms.uiClass(formId, 'QSC_STRICT_TOTAL')+"' style='"+ms.uiStyle(formId, 'QSC_STRICT_TOTAL')+"' "+ms.uiEvent(formId, 'QSC_STRICT_TOTAL')+" title='"+ms.titleAttr(formId,'QSC_STRICT_TOTAL','IS_TITLE_ATTR',v)+"' >"+v['QSC_STRICT_TOTAL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_CREATE_RULE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_CREATE_RULE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSC_CREATE_RULE')+"' "+ms.tdEvent(formId, 'QSC_CREATE_RULE')+">")
            arrHtml.push("<span colno='QSC_CREATE_RULE' class='"+ms.uiClass(formId, 'QSC_CREATE_RULE')+"' style='"+ms.uiStyle(formId, 'QSC_CREATE_RULE')+"' "+ms.uiEvent(formId, 'QSC_CREATE_RULE')+" title='"+ms.titleAttr(formId,'QSC_CREATE_RULE','IS_TITLE_ATTR',v)+"' >"+v['QSC_CREATE_RULE']+"</span>")
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
