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
		<dict:lang value="VM-机种检测项目" />
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

<body >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="616c7e04f2874f4cb8e59e2f11293286" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="616c7e04f2874f4cb8e59e2f11293286" />
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
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMI_TEST_STEP" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QMI_ITEM_GENRE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QMI_MODEL_CODE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QMI_MODEL_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QMI_MODEL_SPEC" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QMI_ITEM_SN" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:120px;"><bu:uitn colNo="QMI_ITEM_NAME" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMI_ITEM_TYPE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMI_ITEM_CLASS" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMI_ITEM_MAXVALUE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMI_ITEM_MINVALUE" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="QMI_ITEM_UNIT" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QMI_TEST_METHOD" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QMI_TEST_CONTENT" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="QMI_TEST_SEQ" formId="39d36d92711a4c7789582bf04f5a16e3" /></td>
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
		<bu:submit viewId="616c7e04f2874f4cb8e59e2f11293286" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="616c7e04f2874f4cb8e59e2f11293286" />
    
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
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px; text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='QMI_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QMI_TEST_STEP')+"' style='width:70px;text-align:center;'"+ms.tdStyle(formId, 'QMI_TEST_STEP')+"' "+ms.tdEvent(formId, 'QMI_TEST_STEP')+">")
            arrHtml.push("<span colno='QMI_TEST_STEP' class='"+ms.uiClass(formId, 'QMI_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QMI_TEST_STEP')+"' "+ms.uiEvent(formId, 'QMI_TEST_STEP')+" title='"+ms.titleAttr(formId,'QMI_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QMI_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_GENRE' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_GENRE')+"' style='width:150px;"+ms.tdStyle(formId, 'QMI_ITEM_GENRE')+"' "+ms.tdEvent(formId, 'QMI_ITEM_GENRE')+">")
            arrHtml.push("<span colno='QMI_ITEM_GENRE' class='"+ms.uiClass(formId, 'QMI_ITEM_GENRE')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_GENRE')+"' "+ms.uiEvent(formId, 'QMI_ITEM_GENRE')+" title='"+ms.titleAttr(formId,'QMI_ITEM_GENRE','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_GENRE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QMI_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'QMI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'QMI_MODEL_CODE')+">")
            arrHtml.push("<span colno='QMI_MODEL_CODE' class='"+ms.uiClass(formId, 'QMI_MODEL_CODE')+"' onclick='itemJump1(\""+v['QMI_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QMI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'QMI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['QMI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QMI_MODEL_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'QMI_MODEL_NAME')+"' "+ms.tdEvent(formId, 'QMI_MODEL_NAME')+">")
            arrHtml.push("<span colno='QMI_MODEL_NAME' class='"+ms.uiClass(formId, 'QMI_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'QMI_MODEL_NAME')+"' "+ms.uiEvent(formId, 'QMI_MODEL_NAME')+" title='"+ms.titleAttr(formId,'QMI_MODEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['QMI_MODEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_MODEL_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QMI_MODEL_SPEC')+"' style='width:150px;"+ms.tdStyle(formId, 'QMI_MODEL_SPEC')+"' "+ms.tdEvent(formId, 'QMI_MODEL_SPEC')+">")
            arrHtml.push("<span colno='QMI_MODEL_SPEC' class='"+ms.uiClass(formId, 'QMI_MODEL_SPEC')+"' style='"+ms.uiStyle(formId, 'QMI_MODEL_SPEC')+"' "+ms.uiEvent(formId, 'QMI_MODEL_SPEC')+" title='"+ms.titleAttr(formId,'QMI_MODEL_SPEC','IS_TITLE_ATTR',v)+"' >"+v['QMI_MODEL_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'QMI_ITEM_SN')+"' "+ms.tdEvent(formId, 'QMI_ITEM_SN')+">")
            arrHtml.push("<span colno='QMI_ITEM_SN' class='"+ms.uiClass(formId, 'QMI_ITEM_SN')+"' onclick='itemJump2(\""+v['QMI_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QMI_ITEM_SN')+" title='"+ms.titleAttr(formId,'QMI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'QMI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QMI_ITEM_NAME')+">")
            arrHtml.push("<span colno='QMI_ITEM_NAME' class='"+ms.uiClass(formId, 'QMI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QMI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QMI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_TYPE')+"' style='width:70px;"+ms.tdStyle(formId, 'QMI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'QMI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='QMI_ITEM_TYPE' class='"+ms.uiClass(formId, 'QMI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'QMI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'QMI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_CLASS')+"' style='width:70px;"+ms.tdStyle(formId, 'QMI_ITEM_CLASS')+"' "+ms.tdEvent(formId, 'QMI_ITEM_CLASS')+">")
            arrHtml.push("<span colno='QMI_ITEM_CLASS' class='"+ms.uiClass(formId, 'QMI_ITEM_CLASS')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_CLASS')+"' "+ms.uiEvent(formId, 'QMI_ITEM_CLASS')+" title='"+ms.titleAttr(formId,'QMI_ITEM_CLASS','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_CLASS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_MAXVALUE' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_MAXVALUE')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'QMI_ITEM_MAXVALUE')+"' "+ms.tdEvent(formId, 'QMI_ITEM_MAXVALUE')+">")
            arrHtml.push("<span colno='QMI_ITEM_MAXVALUE' class='"+ms.uiClass(formId, 'QMI_ITEM_MAXVALUE')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_MAXVALUE')+"' "+ms.uiEvent(formId, 'QMI_ITEM_MAXVALUE')+" title='"+ms.titleAttr(formId,'QMI_ITEM_MAXVALUE','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_MAXVALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_MINVALUE' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_MINVALUE')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QMI_ITEM_MINVALUE')+"' "+ms.tdEvent(formId, 'QMI_ITEM_MINVALUE')+">")
            arrHtml.push("<span colno='QMI_ITEM_MINVALUE' class='"+ms.uiClass(formId, 'QMI_ITEM_MINVALUE')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_MINVALUE')+"' "+ms.uiEvent(formId, 'QMI_ITEM_MINVALUE')+" title='"+ms.titleAttr(formId,'QMI_ITEM_MINVALUE','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_MINVALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_ITEM_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'QMI_ITEM_UNIT')+"' style='width:80px;"+ms.tdStyle(formId, 'QMI_ITEM_UNIT')+"' "+ms.tdEvent(formId, 'QMI_ITEM_UNIT')+">")
            arrHtml.push("<span colno='QMI_ITEM_UNIT' class='"+ms.uiClass(formId, 'QMI_ITEM_UNIT')+"' style='"+ms.uiStyle(formId, 'QMI_ITEM_UNIT')+"' "+ms.uiEvent(formId, 'QMI_ITEM_UNIT')+" title='"+ms.titleAttr(formId,'QMI_ITEM_UNIT','IS_TITLE_ATTR',v)+"' >"+v['QMI_ITEM_UNIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_TEST_METHOD' class='datagrid-cell "+ms.tdClass(formId, 'QMI_TEST_METHOD')+"' style='width:150px;"+ms.tdStyle(formId, 'QMI_TEST_METHOD')+"' "+ms.tdEvent(formId, 'QMI_TEST_METHOD')+">")
            arrHtml.push("<span colno='QMI_TEST_METHOD' class='"+ms.uiClass(formId, 'QMI_TEST_METHOD')+"' style='"+ms.uiStyle(formId, 'QMI_TEST_METHOD')+"' "+ms.uiEvent(formId, 'QMI_TEST_METHOD')+" title='"+ms.titleAttr(formId,'QMI_TEST_METHOD','IS_TITLE_ATTR',v)+"' >"+v['QMI_TEST_METHOD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QMI_TEST_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'QMI_TEST_CONTENT')+"' style='width:90px;"+ms.tdStyle(formId, 'QMI_TEST_CONTENT')+"' "+ms.tdEvent(formId, 'QMI_TEST_CONTENT')+">")
            arrHtml.push("<span colno='QMI_TEST_CONTENT' class='"+ms.uiClass(formId, 'QMI_TEST_CONTENT')+"' style='"+ms.uiStyle(formId, 'QMI_TEST_CONTENT')+"' "+ms.uiEvent(formId, 'QMI_TEST_CONTENT')+" title='"+ms.titleAttr(formId,'QMI_TEST_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['QMI_TEST_CONTENT']+"</span>")
            arrHtml.push("</td>");
          
            arrHtml.push("<td colno='QMI_TEST_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'QMI_TEST_SEQ')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QMI_TEST_SEQ')+"' "+ms.tdEvent(formId, 'QMI_TEST_SEQ')+">")
            arrHtml.push("<span colno='QMI_TEST_SEQ' class='"+ms.uiClass(formId, 'QMI_TEST_SEQ')+"' style='"+ms.uiStyle(formId, 'QMI_TEST_SEQ')+"' "+ms.uiEvent(formId, 'QMI_TEST_SEQ')+" title='"+ms.titleAttr(formId,'QMI_TEST_SEQ','IS_TITLE_ATTR',v)+"' >"+v['QMI_TEST_SEQ']+"</span>")
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//物料信息
function itemJump1(obj){
      winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
}  


//检测项目
function itemJump2(obj){
    winOptMethod.jump("27711efe1d6a4b7d95f70dd1c39357ea","F5925","jumpId",obj);
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
