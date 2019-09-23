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
		<dict:lang value="IC管理列表" />
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
		<bu:header formId ="c1036359818b474286d53dc1952f10c2"/>

    
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
		<bu:func viewId="9e83bd03cbe14a2a95fe9bee6a9b4d79" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="9e83bd03cbe14a2a95fe9bee6a9b4d79" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagec1036359818b474286d53dc1952f10c2" id="formPagec1036359818b474286d53dc1952f10c2" value="${formPagec1036359818b474286d53dc1952f10c2}"/>
		<input type="hidden" name="formId" id="formId1" value='c1036359818b474286d53dc1952f10c2'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="c1036359818b474286d53dc1952f10c2">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxc1036359818b474286d53dc1952f10c2" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerc1036359818b474286d53dc1952f10c2">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablec1036359818b474286d53dc1952f10c2">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="c1036359818b474286d53dc1952f10c2" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_c1036359818b474286d53dc1952f10c2" onclick="_selectAjaxTableAllData(this,'c1036359818b474286d53dc1952f10c2')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="IB_ITEM_SN" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="IB_MO_NUMBER" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="IB_WORKSTATION_SN" formId="c1036359818b474286d53dc1952f10c2" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="IB_NUM" formId="c1036359818b474286d53dc1952f10c2" /></td>
            <td class="datagrid-cell" style="width:140px; text-align:center" ><bu:uitn colNo="IB_BURN_TIME" formId="c1036359818b474286d53dc1952f10c2" /></td>			
			<td class="datagrid-cell" style="width:90px; text-align:center" ><bu:uitn colNo="IB_BURN_EMP" formId="c1036359818b474286d53dc1952f10c2" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivc1036359818b474286d53dc1952f10c2" onscroll="ajaxTableScroll(this,'c1036359818b474286d53dc1952f10c2')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxc1036359818b474286d53dc1952f10c2">
		<tbody id="tbody_c1036359818b474286d53dc1952f10c2" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagec1036359818b474286d53dc1952f10c2==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=c1036359818b474286d53dc1952f10c2&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="9e83bd03cbe14a2a95fe9bee6a9b4d79" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="9e83bd03cbe14a2a95fe9bee6a9b4d79" />
    
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
    if(formId=='c1036359818b474286d53dc1952f10c2'){<%--IC烧录信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px; 	text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='IB_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'IB_ITEM_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'IB_ITEM_SN')+"' "+ms.tdEvent(formId, 'IB_ITEM_SN')+">")
            arrHtml.push("<span colno='IB_ITEM_SN' class='"+ms.uiClass(formId, 'IB_ITEM_SN')+"' onclick='itemJump1(\""+v['IB_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'IB_ITEM_SN')+" title='"+ms.titleAttr(formId,'IB_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['IB_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IB_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'IB_MO_NUMBER')+"' style='width:120px;"+ms.tdStyle(formId, 'IB_MO_NUMBER')+"' "+ms.tdEvent(formId, 'IB_MO_NUMBER')+">")
            arrHtml.push("<span colno='IB_MO_NUMBER' class='"+ms.uiClass(formId, 'IB_MO_NUMBER')+"' onclick='itemJump2(\""+v['IB_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'IB_MO_NUMBER')+" title='"+ms.titleAttr(formId,'IB_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['IB_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IB_WORKSTATION_SN' class='datagrid-cell "+ms.tdClass(formId, 'IB_WORKSTATION_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'IB_WORKSTATION_SN')+"' "+ms.tdEvent(formId, 'IB_WORKSTATION_SN')+">")
            arrHtml.push("<span colno='IB_WORKSTATION_SN' class='"+ms.uiClass(formId, 'IB_WORKSTATION_SN')+"' style='"+ms.uiStyle(formId, 'IB_WORKSTATION_SN')+"' "+ms.uiEvent(formId, 'IB_WORKSTATION_SN')+" title='"+ms.titleAttr(formId,'IB_WORKSTATION_SN','IS_TITLE_ATTR',v)+"' >"+v['IB_WORKSTATION_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IB_NUM' class='datagrid-cell "+ms.tdClass(formId, 'IB_NUM')+"' style='width:120px;text-align:right;"+ms.tdStyle(formId, 'IB_NUM')+"' "+ms.tdEvent(formId, 'IB_NUM')+">")
            arrHtml.push("<span colno='IB_NUM' class='"+ms.uiClass(formId, 'IB_NUM')+"' style='"+ms.uiStyle(formId, 'IB_NUM')+"' "+ms.uiEvent(formId, 'IB_NUM')+" title='"+ms.titleAttr(formId,'IB_NUM','IS_TITLE_ATTR',v)+"' >"+v['IB_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IB_BURN_TIME' class='datagrid-cell "+ms.tdClass(formId, 'IB_BURN_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'IB_BURN_TIME')+"' "+ms.tdEvent(formId, 'IB_BURN_TIME')+">")
            arrHtml.push("<span colno='IB_BURN_TIME' class='"+ms.uiClass(formId, 'IB_BURN_TIME')+"' style='"+ms.uiStyle(formId, 'IB_BURN_TIME')+"' "+ms.uiEvent(formId, 'IB_BURN_TIME')+" title='"+ms.titleAttr(formId,'IB_BURN_TIME','IS_TITLE_ATTR',v)+"' >"+v['IB_BURN_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='IB_BURN_EMP' class='datagrid-cell "+ms.tdClass(formId, 'IB_BURN_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'IB_BURN_EMP')+"' "+ms.tdEvent(formId, 'IB_BURN_EMP')+">")
            arrHtml.push("<span colno='IB_BURN_EMP' class='"+ms.uiClass(formId, 'IB_BURN_EMP')+"' style='"+ms.uiStyle(formId, 'IB_BURN_EMP')+"' "+ms.uiEvent(formId, 'IB_BURN_EMP')+" title='"+ms.titleAttr(formId,'IB_BURN_EMP','IS_TITLE_ATTR',v)+"' >"+v['IB_BURN_EMP']+"</span>")
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

//物料追溯
function itemJump1(obj){
      winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
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
