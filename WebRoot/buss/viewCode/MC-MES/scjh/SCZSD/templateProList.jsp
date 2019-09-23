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
		<dict:lang value="模板项目配置列表" />
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
		<bu:header formId ="b23d17c37f2a4922a978579833073e98"/>

    
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
		<bu:func viewId="7d42142c72c148d6966ea4bc5f8fa27a" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="7d42142c72c148d6966ea4bc5f8fa27a" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageb23d17c37f2a4922a978579833073e98" id="formPageb23d17c37f2a4922a978579833073e98" value="${formPageb23d17c37f2a4922a978579833073e98}"/>
		<input type="hidden" name="formId" id="formId1" value='b23d17c37f2a4922a978579833073e98'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b23d17c37f2a4922a978579833073e98">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb23d17c37f2a4922a978579833073e98" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb23d17c37f2a4922a978579833073e98">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb23d17c37f2a4922a978579833073e98">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="b23d17c37f2a4922a978579833073e98" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b23d17c37f2a4922a978579833073e98" onclick="_selectAjaxTableAllData(this,'b23d17c37f2a4922a978579833073e98')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="b23d17c37f2a4922a978579833073e98" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CTP_TEMPLATE_NAME" formId="b23d17c37f2a4922a978579833073e98" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="CTP_PROJECT_CODE" formId="b23d17c37f2a4922a978579833073e98" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T2#CO_PROJECT_NAME" formId="b23d17c37f2a4922a978579833073e98" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T3#VALUE" formId="b23d17c37f2a4922a978579833073e98" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T5#VALUE" formId="b23d17c37f2a4922a978579833073e98" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="T4#VALUE" formId="b23d17c37f2a4922a978579833073e98" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb23d17c37f2a4922a978579833073e98" onscroll="ajaxTableScroll(this,'b23d17c37f2a4922a978579833073e98')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb23d17c37f2a4922a978579833073e98">
		<tbody id="tbody_b23d17c37f2a4922a978579833073e98" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb23d17c37f2a4922a978579833073e98==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b23d17c37f2a4922a978579833073e98&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="7d42142c72c148d6966ea4bc5f8fa27a" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="7d42142c72c148d6966ea4bc5f8fa27a" />
    
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
    if(formId=='b23d17c37f2a4922a978579833073e98'){<%--模板项目配置信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTP_TEMPLATE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CTP_TEMPLATE_NAME')+"' style='width:150px;' "+ms.tdEvent(formId, 'CTP_TEMPLATE_NAME')+">")
            arrHtml.push("<span colno='CTP_TEMPLATE_NAME' class='"+ms.uiClass(formId, 'CTP_TEMPLATE_NAME')+"' style='"+ms.uiStyle(formId, 'CTP_TEMPLATE_NAME')+"' "+ms.uiEvent(formId, 'CTP_TEMPLATE_NAME')+" title='"+ms.titleAttr(formId,'CTP_TEMPLATE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CTP_TEMPLATE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTP_PROJECT_CODE'  class='datagrid-cell "+ms.tdClass(formId, 'CTP_PROJECT_CODE')+"' style='width:150px;' "+ms.tdEvent(formId, 'CTP_PROJECT_CODE')+">")
            arrHtml.push("<span colno='CTP_PROJECT_CODE' onclick='itemJump1(\""+v['CTP_PROJECT_CODE']+"\")' class='"+ms.uiClass(formId, 'CTP_PROJECT_CODE')+"' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CTP_PROJECT_CODE')+" title='"+ms.titleAttr(formId,'CTP_PROJECT_CODE','IS_TITLE_ATTR',v)+"' >"+v['CTP_PROJECT_CODE']+"</span>")
            arrHtml.push("<input type='hidden' id='CTP_PROJECT_CODE"+v.ID+"' value='"+v['CTP_PROJECT_CODE']+"' /></td>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CO_PROJECT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CO_PROJECT_NAME')+"' style='width:150px;' "+ms.tdEvent(formId, 'T2#CO_PROJECT_NAME')+">")
            arrHtml.push("<span colno='T2#CO_PROJECT_NAME' class='"+ms.uiClass(formId, 'T2#CO_PROJECT_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CO_PROJECT_NAME')+"' "+ms.uiEvent(formId, 'T2#CO_PROJECT_NAME')+" title='"+ms.titleAttr(formId,'T2#CO_PROJECT_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CO_PROJECT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#VALUE' class='datagrid-cell "+ms.tdClass(formId, 'T3#VALUE')+"' style='width:150px;' "+ms.tdEvent(formId, 'T3#VALUE')+">")
            arrHtml.push("<span colno='T3#VALUE' class='"+ms.uiClass(formId, 'T3#VALUE')+"' style='"+ms.uiStyle(formId, 'T3#VALUE')+"' "+ms.uiEvent(formId, 'T3#VALUE')+" title='"+ms.titleAttr(formId,'T3#VALUE','IS_TITLE_ATTR',v)+"' >"+v['T3#VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T5#VALUE' class='datagrid-cell "+ms.tdClass(formId, 'T5#VALUE')+"' style='width:150px;' "+ms.tdEvent(formId, 'T5#VALUE')+">")
            arrHtml.push("<span colno='T5#VALUE' class='"+ms.uiClass(formId, 'T5#VALUE')+"' style='"+ms.uiStyle(formId, 'T5#VALUE')+"' "+ms.uiEvent(formId, 'T5#VALUE')+" title='"+ms.titleAttr(formId,'T5#VALUE','IS_TITLE_ATTR',v)+"' >"+v['T5#VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#VALUE' class='datagrid-cell "+ms.tdClass(formId, 'T4#VALUE')+"' style='width:150px;' "+ms.tdEvent(formId, 'T4#VALUE')+">")
            arrHtml.push("<span colno='T4#VALUE' class='"+ms.uiClass(formId, 'T4#VALUE')+"' style='"+ms.uiStyle(formId, 'T4#VALUE')+"' "+ms.uiEvent(formId, 'T4#VALUE')+" title='"+ms.titleAttr(formId,'T4#VALUE','IS_TITLE_ATTR',v)+"' >"+v['T4#VALUE']+"</span>")
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
    //setScroll(formId);
    setScroll();
}
function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#CTP_TEMPLATE_NAME").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
</script>

<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//检查项目
function itemJump1(obj){
      winOptMethod.jump("0ffbf3b03cdd4a21b3adba5bc6b2ad18","F8573","jumpId",obj);
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
