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
		<dict:lang value="VM-周转筐信息管理" />
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
		<bu:header formId ="adb905a569b841f880cfd2722e2b7e61"/>

    
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
            <div class="hd"  >
		<bu:func viewId="871783ab106646c6913a610bc7f5d995" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="871783ab106646c6913a610bc7f5d995" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageadb905a569b841f880cfd2722e2b7e61" id="formPageadb905a569b841f880cfd2722e2b7e61" value="${formPageadb905a569b841f880cfd2722e2b7e61}"/>
		<input type="hidden" name="formId" id="formId1" value='adb905a569b841f880cfd2722e2b7e61'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="adb905a569b841f880cfd2722e2b7e61">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxadb905a569b841f880cfd2722e2b7e61" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inneradb905a569b841f880cfd2722e2b7e61">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableadb905a569b841f880cfd2722e2b7e61">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="adb905a569b841f880cfd2722e2b7e61" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_adb905a569b841f880cfd2722e2b7e61" onclick="_selectAjaxTableAllData(this,'adb905a569b841f880cfd2722e2b7e61')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="adb905a569b841f880cfd2722e2b7e61" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="TURN_OVER_TYPE" formId="adb905a569b841f880cfd2722e2b7e61" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="TURN_OVER_SN" formId="adb905a569b841f880cfd2722e2b7e61" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="MAX_NUM" formId="adb905a569b841f880cfd2722e2b7e61" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="TURN_OVER_STATUS" formId="adb905a569b841f880cfd2722e2b7e61" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="MO_NUMBER" formId="adb905a569b841f880cfd2722e2b7e61" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="TURN_LOAD_NUM" formId="adb905a569b841f880cfd2722e2b7e61" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivadb905a569b841f880cfd2722e2b7e61" onscroll="ajaxTableScroll(this,'adb905a569b841f880cfd2722e2b7e61')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxadb905a569b841f880cfd2722e2b7e61">
		<tbody id="tbody_adb905a569b841f880cfd2722e2b7e61" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageadb905a569b841f880cfd2722e2b7e61==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=adb905a569b841f880cfd2722e2b7e61&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="871783ab106646c6913a610bc7f5d995" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="871783ab106646c6913a610bc7f5d995" />
    
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
    if(formId=='adb905a569b841f880cfd2722e2b7e61'){<%--FM-周转筐信息管理--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:	200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='TURN_OVER_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TURN_OVER_TYPE')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'TURN_OVER_TYPE')+"' "+ms.tdEvent(formId, 'TURN_OVER_TYPE')+">")
            arrHtml.push("<span colno='TURN_OVER_TYPE' class='"+ms.uiClass(formId, 'TURN_OVER_TYPE')+"' style='"+ms.uiStyle(formId, 'TURN_OVER_TYPE')+"' "+ms.uiEvent(formId, 'TURN_OVER_TYPE')+" title='"+ms.titleAttr(formId,'TURN_OVER_TYPE','IS_TITLE_ATTR',v)+"' >"+v['TURN_OVER_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TURN_OVER_SN' class='datagrid-cell "+ms.tdClass(formId, 'TURN_OVER_SN')+"' style='width:140px;"+ms.tdStyle(formId, 'TURN_OVER_SN')+"' "+ms.tdEvent(formId, 'TURN_OVER_SN')+">")
            arrHtml.push("<span colno='TURN_OVER_SN' class='"+ms.uiClass(formId, 'TURN_OVER_SN')+"' style='"+ms.uiStyle(formId, 'TURN_OVER_SN')+"' "+ms.uiEvent(formId, 'TURN_OVER_SN')+" title='"+ms.titleAttr(formId,'TURN_OVER_SN','IS_TITLE_ATTR',v)+"' >"+v['TURN_OVER_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MAX_NUM' class='datagrid-cell "+ms.tdClass(formId, 'MAX_NUM')+"' style='width:140px;"+ms.tdStyle(formId, 'MAX_NUM')+"' "+ms.tdEvent(formId, 'MAX_NUM')+">")
            arrHtml.push("<span colno='MAX_NUM' class='"+ms.uiClass(formId, 'MAX_NUM')+"' style='text-align: right;"+ms.uiStyle(formId, 'MAX_NUM')+"' "+ms.uiEvent(formId, 'MAX_NUM')+" title='"+ms.titleAttr(formId,'MAX_NUM','IS_TITLE_ATTR',v)+"' >"+v['MAX_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TURN_OVER_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'TURN_OVER_STATUS')+"' style='width:140px;"+ms.tdStyle(formId, 'TURN_OVER_STATUS')+"' "+ms.tdEvent(formId, 'TURN_OVER_STATUS')+">")
            arrHtml.push("<input type='hidden' id='state_"+v.ID+"' value='"+v['TURN_OVER_STATUS']+"'/>");
            var styStr;
            var valStr = v['TURN_OVER_STATUS'];
            if(valStr == 0 ){
                styStr = '<span class="state" style="background-color:#f8b72d;color:#ffffff;width:60px"><dict:lang value="空闲中" /></span>';
            }else{
                styStr = '<span class="state" style="background-color:#00a0e9;color:#FFFFFF;width:60px"><dict:lang value="使用中" /></span>';
            }
            arrHtml.push("<span colno='TURN_OVER_STATUS' class='"+ms.uiClass(formId, 'TURN_OVER_STATUS')+"' style='width:140px;text-align: center;"+ms.uiStyle(formId, 'TURN_OVER_STATUS')+"' "+ms.uiEvent(formId, 'TURN_OVER_STATUS')+" title='"+ms.titleAttr(formId,'TURN_OVER_STATUS','IS_TITLE_ATTR',v)+"' >"+styStr+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='width:140px;"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' onclick='itemJump1(\""+v['MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TURN_LOAD_NUM' class='datagrid-cell "+ms.tdClass(formId, 'TURN_LOAD_NUM')+"' style='width:140px;text-align:right"+ms.tdStyle(formId, 'TURN_LOAD_NUM')+"' "+ms.tdEvent(formId, 'TURN_LOAD_NUM')+">")
            arrHtml.push("<span colno='TURN_LOAD_NUM' class='"+ms.uiClass(formId, 'TURN_LOAD_NUM')+"' style='"+ms.uiStyle(formId, 'TURN_LOAD_NUM')+"' "+ms.uiEvent(formId, 'TURN_LOAD_NUM')+" title='"+ms.titleAttr(formId,'TURN_LOAD_NUM','IS_TITLE_ATTR',v)+"' >"+v['TURN_LOAD_NUM']+"</span>")
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
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
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
