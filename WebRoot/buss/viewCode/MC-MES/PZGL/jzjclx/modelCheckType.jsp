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
		<dict:lang value="VM-机种检测类型" />
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
		<bu:header formId ="95f9041534d84ce2ab92935d2ade0945"/>

    
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
		<bu:func viewId="b4ca247f26114d1587f7c677754525b3" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="b4ca247f26114d1587f7c677754525b3" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage95f9041534d84ce2ab92935d2ade0945" id="formPage95f9041534d84ce2ab92935d2ade0945" value="${formPage95f9041534d84ce2ab92935d2ade0945}"/>
		<input type="hidden" name="formId" id="formId1" value='95f9041534d84ce2ab92935d2ade0945'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="95f9041534d84ce2ab92935d2ade0945">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax95f9041534d84ce2ab92935d2ade0945" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner95f9041534d84ce2ab92935d2ade0945">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable95f9041534d84ce2ab92935d2ade0945">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="95f9041534d84ce2ab92935d2ade0945" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_95f9041534d84ce2ab92935d2ade0945" onclick="_selectAjaxTableAllData(this,'95f9041534d84ce2ab92935d2ade0945')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMT_TEST_STEP" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QMT_ITEM_GENRE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QMT_MODEL_CODE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="MODEL_CODE_NAME" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="MODEL_CODE_SPEC" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMT_ITEM_TYPE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QMT_SAMPLE_PLAN" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QMT_ERROR_GRADE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QMT_TEST_LEVEL" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QMT_TEST_GRADE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMT_ALQ_VALUE" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<!--<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMT_FULL_FLAG" formId="95f9041534d84ce2ab92935d2ade0945" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMT_THRESHOLD" formId="95f9041534d84ce2ab92935d2ade0945" /></td>-->
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv95f9041534d84ce2ab92935d2ade0945" onscroll="ajaxTableScroll(this,'95f9041534d84ce2ab92935d2ade0945')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax95f9041534d84ce2ab92935d2ade0945">
		<tbody id="tbody_95f9041534d84ce2ab92935d2ade0945" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage95f9041534d84ce2ab92935d2ade0945==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=95f9041534d84ce2ab92935d2ade0945&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="b4ca247f26114d1587f7c677754525b3" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="b4ca247f26114d1587f7c677754525b3" />
    
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
    if(formId=='95f9041534d84ce2ab92935d2ade0945'){<%--FM-机种检测类型--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='MODEL_CODE_"+v.ID+"' value='"+v['QMT_MODEL_CODE']+"' />");
            arrHtml.push("<input type='hidden' id='ITEM_GENRE_"+v.ID+"' value='"+v['QMT_ITEM_GENRE']+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px; text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='QMT_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QMT_TEST_STEP')+"' style='width:70px; text-align:center;"+ms.tdStyle(formId, 'QMT_TEST_STEP')+"' "+ms.tdEvent(formId, 'QMT_TEST_STEP')+">")
            arrHtml.push("<span colno='QMT_TEST_STEP' class='"+ms.uiClass(formId, 'QMT_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QMT_TEST_STEP')+"' "+ms.uiEvent(formId, 'QMT_TEST_STEP')+" title='"+ms.titleAttr(formId,'QMT_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QMT_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMT_ITEM_GENRE' class='datagrid-cell "+ms.tdClass(formId, 'QMT_ITEM_GENRE')+"' style='width:100px;"+ms.tdStyle(formId, 'QMT_ITEM_GENRE')+"' "+ms.tdEvent(formId, 'QMT_ITEM_GENRE')+">")
            arrHtml.push("<span colno='QMT_ITEM_GENRE' class='"+ms.uiClass(formId, 'QMT_ITEM_GENRE')+"' style='"+ms.uiStyle(formId, 'QMT_ITEM_GENRE')+"' "+ms.uiEvent(formId, 'QMT_ITEM_GENRE')+" title='"+ms.titleAttr(formId,'QMT_ITEM_GENRE','IS_TITLE_ATTR',v)+"' >"+v['QMT_ITEM_GENRE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMT_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QMT_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'QMT_MODEL_CODE')+"' "+ms.tdEvent(formId, 'QMT_MODEL_CODE')+">")
            arrHtml.push("<span colno='QMT_MODEL_CODE' class='"+ms.uiClass(formId, 'QMT_MODEL_CODE')+"' onclick='itemJump1(\""+v['QMT_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QMT_MODEL_CODE')+" title='"+ms.titleAttr(formId,'QMT_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['QMT_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MODEL_CODE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'MODEL_CODE_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'MODEL_CODE_NAME')+"' "+ms.tdEvent(formId, 'MODEL_CODE_NAME')+">")
            arrHtml.push("<span colno='MODEL_CODE_NAME' class='"+ms.uiClass(formId, 'MODEL_CODE_NAME')+"' style='"+ms.uiStyle(formId, 'MODEL_CODE_NAME')+"' "+ms.uiEvent(formId, 'MODEL_CODE_NAME')+" title='"+ms.titleAttr(formId,'MODEL_CODE_NAME','IS_TITLE_ATTR',v)+"' >"+v['MODEL_CODE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MODEL_CODE_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'MODEL_CODE_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'MODEL_CODE_SPEC')+"' "+ms.tdEvent(formId, 'MODEL_CODE_SPEC')+">")
            arrHtml.push("<span colno='MODEL_CODE_SPEC' class='"+ms.uiClass(formId, 'MODEL_CODE_SPEC')+"' style='"+ms.uiStyle(formId, 'MODEL_CODE_SPEC')+"' "+ms.uiEvent(formId, 'MODEL_CODE_SPEC')+" title='"+ms.titleAttr(formId,'MODEL_CODE_SPEC','IS_TITLE_ATTR',v)+"' >"+v['MODEL_CODE_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMT_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QMT_ITEM_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'QMT_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'QMT_ITEM_TYPE')+">")
            arrHtml.push("<span colno='QMT_ITEM_TYPE' class='"+ms.uiClass(formId, 'QMT_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'QMT_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'QMT_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'QMT_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QMT_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMT_SAMPLE_PLAN' class='datagrid-cell "+ms.tdClass(formId, 'QMT_SAMPLE_PLAN')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QMT_SAMPLE_PLAN')+"' "+ms.tdEvent(formId, 'QMT_SAMPLE_PLAN')+">")
            arrHtml.push("<span colno='QMT_SAMPLE_PLAN' class='"+ms.uiClass(formId, 'QMT_SAMPLE_PLAN')+"' onclick='itemJump2(\""+v['QMT_SAMPLE_PLAN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QMT_SAMPLE_PLAN')+" title='"+ms.titleAttr(formId,'QMT_SAMPLE_PLAN','IS_TITLE_ATTR',v)+"' >"+v['QMT_SAMPLE_PLAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMT_ERROR_GRADE' class='datagrid-cell "+ms.tdClass(formId, 'QMT_ERROR_GRADE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'QMT_ERROR_GRADE')+"' "+ms.tdEvent(formId, 'QMT_ERROR_GRADE')+">")
            arrHtml.push("<span colno='QMT_ERROR_GRADE' class='"+ms.uiClass(formId, 'QMT_ERROR_GRADE')+"' style='"+ms.uiStyle(formId, 'QMT_ERROR_GRADE')+"' "+ms.uiEvent(formId, 'QMT_ERROR_GRADE')+" title='"+ms.titleAttr(formId,'QMT_ERROR_GRADE','IS_TITLE_ATTR',v)+"' >"+v['QMT_ERROR_GRADE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMT_TEST_LEVEL' class='datagrid-cell "+ms.tdClass(formId, 'QMT_TEST_LEVEL')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'QMT_TEST_LEVEL')+"' "+ms.tdEvent(formId, 'QMT_TEST_LEVEL')+">")
            arrHtml.push("<span colno='QMT_TEST_LEVEL' class='"+ms.uiClass(formId, 'QMT_TEST_LEVEL')+"' style='"+ms.uiStyle(formId, 'QMT_TEST_LEVEL')+"' "+ms.uiEvent(formId, 'QMT_TEST_LEVEL')+" title='"+ms.titleAttr(formId,'QMT_TEST_LEVEL','IS_TITLE_ATTR',v)+"' >"+v['QMT_TEST_LEVEL']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMT_TEST_GRADE' class='datagrid-cell "+ms.tdClass(formId, 'QMT_TEST_GRADE')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'QMT_TEST_GRADE')+"' "+ms.tdEvent(formId, 'QMT_TEST_GRADE')+">")
            arrHtml.push("<span colno='QMT_TEST_GRADE' class='"+ms.uiClass(formId, 'QMT_TEST_GRADE')+"' style='"+ms.uiStyle(formId, 'QMT_TEST_GRADE')+"' "+ms.uiEvent(formId, 'QMT_TEST_GRADE')+" title='"+ms.titleAttr(formId,'QMT_TEST_GRADE','IS_TITLE_ATTR',v)+"' >"+v['QMT_TEST_GRADE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMT_ALQ_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'QMT_ALQ_VALUE')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'QMT_ALQ_VALUE')+"' "+ms.tdEvent(formId, 'QMT_ALQ_VALUE')+">")
            arrHtml.push("<span colno='QMT_ALQ_VALUE' class='"+ms.uiClass(formId, 'QMT_ALQ_VALUE')+"' style='"+ms.uiStyle(formId, 'QMT_ALQ_VALUE')+"' "+ms.uiEvent(formId, 'QMT_ALQ_VALUE')+" title='"+ms.titleAttr(formId,'QMT_ALQ_VALUE','IS_TITLE_ATTR',v)+"' >"+v['QMT_ALQ_VALUE']+"</span>")
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='QMT_FULL_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'QMT_FULL_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'QMT_FULL_FLAG')+"' "+ms.tdEvent(formId, 'QMT_FULL_FLAG')+">")
            //arrHtml.push("<span colno='QMT_FULL_FLAG' class='"+ms.uiClass(formId, 'QMT_FULL_FLAG')+"' style='"+ms.uiStyle(formId, 'QMT_FULL_FLAG')+"' "+ms.uiEvent(formId, 'QMT_FULL_FLAG')+" title='"+ms.titleAttr(formId,'QMT_FULL_FLAG','IS_TITLE_ATTR',v)+"' >"+v['QMT_FULL_FLAG']+"</span>")
            //arrHtml.push("</td>");
            
            //arrHtml.push("<td colno='QMT_THRESHOLD' class='datagrid-cell "+ms.tdClass(formId, 'QMT_THRESHOLD')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'QMT_THRESHOLD')+"' "+ms.tdEvent(formId, 'QMT_THRESHOLD')+">")
            //arrHtml.push("<span colno='QMT_THRESHOLD' class='"+ms.uiClass(formId, 'QMT_THRESHOLD')+"' style='"+ms.uiStyle(formId, 'QMT_THRESHOLD')+"' "+ms.uiEvent(formId, 'QMT_THRESHOLD')+" title='"+ms.titleAttr(formId,'QMT_THRESHOLD','IS_TITLE_ATTR',v)+"' >"+v['QMT_THRESHOLD']+"</span>")
            //arrHtml.push("</td>");
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  


//抽样方案
function itemJump2(obj){
    winOptMethod.jump("3413e93eb2564cbd927ae382c32ceaec","F5848","jumpId",obj);
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
