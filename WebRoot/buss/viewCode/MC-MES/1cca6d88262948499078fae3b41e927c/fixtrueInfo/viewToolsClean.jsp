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
		<dict:lang value="VM-制具清洗-列表" />
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
		<bu:header formId ="946575fa56b9464688796a8851a3beaa"/>

    
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
		<bu:func viewId="1c58888871dd4dfea5eff22efc7eb45b" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="1c58888871dd4dfea5eff22efc7eb45b" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage946575fa56b9464688796a8851a3beaa" id="formPage946575fa56b9464688796a8851a3beaa" value="${formPage946575fa56b9464688796a8851a3beaa}"/>
		<input type="hidden" name="formId" id="formId1" value='946575fa56b9464688796a8851a3beaa'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="946575fa56b9464688796a8851a3beaa">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax946575fa56b9464688796a8851a3beaa" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner946575fa56b9464688796a8851a3beaa">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable946575fa56b9464688796a8851a3beaa">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="946575fa56b9464688796a8851a3beaa" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_946575fa56b9464688796a8851a3beaa" onclick="_selectAjaxTableAllData(this,'946575fa56b9464688796a8851a3beaa')" style="cursor: pointer;"title="全选"/></span></td>
		   <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="946575fa56b9464688796a8851a3beaa" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CFC_FIX_SN" formId="946575fa56b9464688796a8851a3beaa" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CFC_ITEM_TYPE" formId="946575fa56b9464688796a8851a3beaa" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="CFC_ITEM_CODE" formId="946575fa56b9464688796a8851a3beaa" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFC_ITEM_NAME" formId="946575fa56b9464688796a8851a3beaa" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="CFC_MT_MAN" formId="946575fa56b9464688796a8851a3beaa" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="CFC_MT_TIME" formId="946575fa56b9464688796a8851a3beaa" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv946575fa56b9464688796a8851a3beaa" onscroll="ajaxTableScroll(this,'946575fa56b9464688796a8851a3beaa')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax946575fa56b9464688796a8851a3beaa">
		<tbody id="tbody_946575fa56b9464688796a8851a3beaa" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage946575fa56b9464688796a8851a3beaa==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=946575fa56b9464688796a8851a3beaa&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="1c58888871dd4dfea5eff22efc7eb45b" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="1c58888871dd4dfea5eff22efc7eb45b" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
$(function(){
    $("#7955192232464b7a80f03e8b7702f725").attr("style","display:none;");
})
<%--生成异步表格--%>
function createTableModel(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='946575fa56b9464688796a8851a3beaa'){<%--FM-制具清洗--%>
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
            arrHtml.push("<td colno='CFC_FIX_SN' class='datagrid-cell "+ms.tdClass(formId, 'CFC_FIX_SN')+"'style='width:110px;text-align:center;"+ms.tdStyle(formId, 'CFC_FIX_SN')+"' "+ms.tdEvent(formId, 'CFC_FIX_SN')+">")
            arrHtml.push("<span colno='CFC_FIX_SN' class='"+ms.uiClass(formId, 'CFC_FIX_SN')+"' onclick='itemJump1(\""+v['CFC_FIX_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CFC_FIX_SN')+" title='"+ms.titleAttr(formId,'CFC_FIX_SN','IS_TITLE_ATTR',v)+"' >"+v['CFC_FIX_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFC_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CFC_ITEM_TYPE')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'CFC_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CFC_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CFC_ITEM_TYPE' class='"+ms.uiClass(formId, 'CFC_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CFC_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CFC_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CFC_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CFC_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFC_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CFC_ITEM_CODE')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'CFC_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CFC_ITEM_CODE')+">")
            arrHtml.push("<span colno='CFC_ITEM_CODE' class='"+ms.uiClass(formId, 'CFC_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CFC_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CFC_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CFC_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CFC_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFC_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CFC_ITEM_NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFC_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CFC_ITEM_NAME')+">")
            arrHtml.push("<span colno='CFC_ITEM_NAME' class='"+ms.uiClass(formId, 'CFC_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CFC_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CFC_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CFC_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CFC_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFC_MT_MAN' class='datagrid-cell "+ms.tdClass(formId, 'CFC_MT_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFC_MT_MAN')+"' "+ms.tdEvent(formId, 'CFC_MT_MAN')+">")
            arrHtml.push("<span colno='CFC_MT_MAN' class='"+ms.uiClass(formId, 'CFC_MT_MAN')+"' style='"+ms.uiStyle(formId, 'CFC_MT_MAN')+"' "+ms.uiEvent(formId, 'CFC_MT_MAN')+" title='"+ms.titleAttr(formId,'CFC_MT_MAN','IS_TITLE_ATTR',v)+"' >"+v['CFC_MT_MAN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFC_MT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CFC_MT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CFC_MT_TIME')+"' "+ms.tdEvent(formId, 'CFC_MT_TIME')+">")
            arrHtml.push("<span colno='CFC_MT_TIME' class='"+ms.uiClass(formId, 'CFC_MT_TIME')+"' style='"+ms.uiStyle(formId, 'CFC_MT_TIME')+"' "+ms.uiEvent(formId, 'CFC_MT_TIME')+" title='"+ms.titleAttr(formId,'CFC_MT_TIME','IS_TITLE_ATTR',v)+"' >"+v['CFC_MT_TIME']+"</span>")
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

//制具履历
function itemJump1(obj){
      winOptMethod.jump("68260cc1824b481693825d3f54658ad0","F8890","jumpId",obj);
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
