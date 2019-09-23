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
		<dict:lang value="VM-单据配置中心" />
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
		<bu:header formId ="ef1235107cca42518c74d9cac446da3f"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
</head>

<body scroll="auto" style="overflow: auto;" >
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="5ae9940df103418ea8badc0d07d006f6" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="5ae9940df103418ea8badc0d07d006f6" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageef1235107cca42518c74d9cac446da3f" id="formPageef1235107cca42518c74d9cac446da3f" value="${formPageef1235107cca42518c74d9cac446da3f}"/>
		<input type="hidden" name="formId" id="formId1" value='ef1235107cca42518c74d9cac446da3f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="ef1235107cca42518c74d9cac446da3f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxef1235107cca42518c74d9cac446da3f" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inneref1235107cca42518c74d9cac446da3f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableef1235107cca42518c74d9cac446da3f" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
		<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="ef1235107cca42518c74d9cac446da3f" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_ef1235107cca42518c74d9cac446da3f" onclick="_selectAjaxTableAllData(this,'ef1235107cca42518c74d9cac446da3f')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="WDT_TYPE_SN" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_TYPE_NAME" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_DOC_PREFIX" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_OPERATE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_ERP_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_EXCESS_RECEIVE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_EXCESS_PICK" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_HANDOVER_FLAG" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_SAMPLE_FLAG" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_UPLOAD_FLAG" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_PDA_FLAG" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_TEST_STEP" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_SAMPLE_TYPE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="WDT_CREATE_RULE" formId="ef1235107cca42518c74d9cac446da3f" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivef1235107cca42518c74d9cac446da3f" onscroll="ajaxTableScroll(this,'ef1235107cca42518c74d9cac446da3f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxef1235107cca42518c74d9cac446da3f" >
		<tbody id="tbody_ef1235107cca42518c74d9cac446da3f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageef1235107cca42518c74d9cac446da3f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=ef1235107cca42518c74d9cac446da3f&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="5ae9940df103418ea8badc0d07d006f6" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="5ae9940df103418ea8badc0d07d006f6" />
    
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
    if(formId=='ef1235107cca42518c74d9cac446da3f'){<%--FM-单据类型信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            //arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
            //arrHtml.push("</td>");  
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_TYPE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WDT_TYPE_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'WDT_TYPE_SN')+"' "+ms.tdEvent(formId, 'WDT_TYPE_SN')+">")
            arrHtml.push("<span colno='WDT_TYPE_SN' class='"+ms.uiClass(formId, 'WDT_TYPE_SN')+"' style='"+ms.uiStyle(formId, 'WDT_TYPE_SN')+"' "+ms.uiEvent(formId, 'WDT_TYPE_SN')+" title='"+ms.titleAttr(formId,'WDT_TYPE_SN','IS_TITLE_ATTR',v)+"' >"+v['WDT_TYPE_SN']+"</span>")
            arrHtml.push("<input type='hidden' id='delete_"+v.ID+"' value='"+v['WDT_DELETE_FLAG']+"' /></td>");
            arrHtml.push("<td colno='WDT_TYPE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WDT_TYPE_NAME')+"' style='width:100px;"+ms.tdStyle(formId, 'WDT_TYPE_NAME')+"' "+ms.tdEvent(formId, 'WDT_TYPE_NAME')+">")
            arrHtml.push("<span colno='WDT_TYPE_NAME' class='"+ms.uiClass(formId, 'WDT_TYPE_NAME')+"' style='"+ms.uiStyle(formId, 'WDT_TYPE_NAME')+"' "+ms.uiEvent(formId, 'WDT_TYPE_NAME')+" title='"+ms.titleAttr(formId,'WDT_TYPE_NAME','IS_TITLE_ATTR',v)+"' >"+v['WDT_TYPE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_DOC_PREFIX' class='datagrid-cell "+ms.tdClass(formId, 'WDT_DOC_PREFIX')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_DOC_PREFIX')+"' "+ms.tdEvent(formId, 'WDT_DOC_PREFIX')+">")
            arrHtml.push("<span colno='WDT_DOC_PREFIX' class='"+ms.uiClass(formId, 'WDT_DOC_PREFIX')+"' style='"+ms.uiStyle(formId, 'WDT_DOC_PREFIX')+"' "+ms.uiEvent(formId, 'WDT_DOC_PREFIX')+" title='"+ms.titleAttr(formId,'WDT_DOC_PREFIX','IS_TITLE_ATTR',v)+"' >"+v['WDT_DOC_PREFIX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_OPERATE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WDT_OPERATE_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_OPERATE_TYPE')+"' "+ms.tdEvent(formId, 'WDT_OPERATE_TYPE')+">")
            arrHtml.push("<span colno='WDT_OPERATE_TYPE' class='"+ms.uiClass(formId, 'WDT_OPERATE_TYPE')+"' style='"+ms.uiStyle(formId, 'WDT_OPERATE_TYPE')+"' "+ms.uiEvent(formId, 'WDT_OPERATE_TYPE')+" title='"+ms.titleAttr(formId,'WDT_OPERATE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WDT_OPERATE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_ERP_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WDT_ERP_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_ERP_TYPE')+"' "+ms.tdEvent(formId, 'WDT_ERP_TYPE')+">")
            arrHtml.push("<span colno='WDT_ERP_TYPE' class='"+ms.uiClass(formId, 'WDT_ERP_TYPE')+"' style='"+ms.uiStyle(formId, 'WDT_ERP_TYPE')+"' "+ms.uiEvent(formId, 'WDT_ERP_TYPE')+" title='"+ms.titleAttr(formId,'WDT_ERP_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WDT_ERP_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_EXCESS_RECEIVE' class='datagrid-cell "+ms.tdClass(formId, 'WDT_EXCESS_RECEIVE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_EXCESS_RECEIVE')+"' "+ms.tdEvent(formId, 'WDT_EXCESS_RECEIVE')+">")
            arrHtml.push("<span colno='WDT_EXCESS_RECEIVE' class='"+ms.uiClass(formId, 'WDT_EXCESS_RECEIVE')+"' style='"+ms.uiStyle(formId, 'WDT_EXCESS_RECEIVE')+"' "+ms.uiEvent(formId, 'WDT_EXCESS_RECEIVE')+" title='"+ms.titleAttr(formId,'WDT_EXCESS_RECEIVE','IS_TITLE_ATTR',v)+"' >"+v['WDT_EXCESS_RECEIVE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_EXCESS_PICK' class='datagrid-cell "+ms.tdClass(formId, 'WDT_EXCESS_PICK')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_EXCESS_PICK')+"' "+ms.tdEvent(formId, 'WDT_EXCESS_PICK')+">")
            arrHtml.push("<span colno='WDT_EXCESS_PICK' class='"+ms.uiClass(formId, 'WDT_EXCESS_PICK')+"' style='"+ms.uiStyle(formId, 'WDT_EXCESS_PICK')+"' "+ms.uiEvent(formId, 'WDT_EXCESS_PICK')+" title='"+ms.titleAttr(formId,'WDT_EXCESS_PICK','IS_TITLE_ATTR',v)+"' >"+v['WDT_EXCESS_PICK']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_HANDOVER_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WDT_HANDOVER_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_HANDOVER_FLAG')+"' "+ms.tdEvent(formId, 'WDT_HANDOVER_FLAG')+">")
            arrHtml.push("<span colno='WDT_HANDOVER_FLAG' class='"+ms.uiClass(formId, 'WDT_HANDOVER_FLAG')+"' style='"+ms.uiStyle(formId, 'WDT_HANDOVER_FLAG')+"' "+ms.uiEvent(formId, 'WDT_HANDOVER_FLAG')+" title='"+ms.titleAttr(formId,'WDT_HANDOVER_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WDT_HANDOVER_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_SAMPLE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WDT_SAMPLE_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_SAMPLE_FLAG')+"' "+ms.tdEvent(formId, 'WDT_SAMPLE_FLAG')+">")
            arrHtml.push("<span colno='WDT_SAMPLE_FLAG' class='"+ms.uiClass(formId, 'WDT_SAMPLE_FLAG')+"' style='"+ms.uiStyle(formId, 'WDT_SAMPLE_FLAG')+"' "+ms.uiEvent(formId, 'WDT_SAMPLE_FLAG')+" title='"+ms.titleAttr(formId,'WDT_SAMPLE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WDT_SAMPLE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_UPLOAD_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WDT_UPLOAD_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_UPLOAD_FLAG')+"' "+ms.tdEvent(formId, 'WDT_UPLOAD_FLAG')+">")
            arrHtml.push("<span colno='WDT_UPLOAD_FLAG' class='"+ms.uiClass(formId, 'WDT_UPLOAD_FLAG')+"' style='"+ms.uiStyle(formId, 'WDT_UPLOAD_FLAG')+"' "+ms.uiEvent(formId, 'WDT_UPLOAD_FLAG')+" title='"+ms.titleAttr(formId,'WDT_UPLOAD_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WDT_UPLOAD_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_PDA_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WDT_PDA_FLAG')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_PDA_FLAG')+"' "+ms.tdEvent(formId, 'WDT_PDA_FLAG')+">")
            arrHtml.push("<span colno='WDT_PDA_FLAG' class='"+ms.uiClass(formId, 'WDT_PDA_FLAG')+"' style='"+ms.uiStyle(formId, 'WDT_PDA_FLAG')+"' "+ms.uiEvent(formId, 'WDT_PDA_FLAG')+" title='"+ms.titleAttr(formId,'WDT_PDA_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WDT_PDA_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'WDT_TEST_STEP')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_TEST_STEP')+"' "+ms.tdEvent(formId, 'WDT_TEST_STEP')+">")
            arrHtml.push("<span colno='WDT_TEST_STEP' class='"+ms.uiClass(formId, 'WDT_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'WDT_TEST_STEP')+"' "+ms.uiEvent(formId, 'WDT_TEST_STEP')+" title='"+ms.titleAttr(formId,'WDT_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['WDT_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_SAMPLE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WDT_SAMPLE_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'WDT_SAMPLE_TYPE')+"' "+ms.tdEvent(formId, 'WDT_SAMPLE_TYPE')+">")
            arrHtml.push("<span colno='WDT_SAMPLE_TYPE' class='"+ms.uiClass(formId, 'WDT_SAMPLE_TYPE')+"' style='"+ms.uiStyle(formId, 'WDT_SAMPLE_TYPE')+"' "+ms.uiEvent(formId, 'WDT_SAMPLE_TYPE')+" title='"+ms.titleAttr(formId,'WDT_SAMPLE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WDT_SAMPLE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WDT_CREATE_RULE' class='datagrid-cell "+ms.tdClass(formId, 'WDT_CREATE_RULE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'WDT_CREATE_RULE')+"' "+ms.tdEvent(formId, 'WDT_CREATE_RULE')+">")
            arrHtml.push("<span colno='WDT_CREATE_RULE' class='"+ms.uiClass(formId, 'WDT_CREATE_RULE')+"' style='"+ms.uiStyle(formId, 'WDT_CREATE_RULE')+"' "+ms.uiEvent(formId, 'WDT_CREATE_RULE')+" title='"+ms.titleAttr(formId,'WDT_CREATE_RULE','IS_TITLE_ATTR',v)+"' >"+v['WDT_CREATE_RULE']+"</span>")
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

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#WDT_TYPE_NAME").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
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
