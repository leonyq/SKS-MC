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
		<dict:lang value="VM-保养计划" />
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
		<bu:header formId ="661d8cf0b2b048f6a5f958450e13d9c1"/>

    
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
		<bu:func viewId="8ce444e6b70f49bfb93a565e58c6dc9f" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="8ce444e6b70f49bfb93a565e58c6dc9f" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage661d8cf0b2b048f6a5f958450e13d9c1" id="formPage661d8cf0b2b048f6a5f958450e13d9c1" value="${formPage661d8cf0b2b048f6a5f958450e13d9c1}"/>
		<input type="hidden" name="formId" id="formId1" value='661d8cf0b2b048f6a5f958450e13d9c1'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="661d8cf0b2b048f6a5f958450e13d9c1">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax661d8cf0b2b048f6a5f958450e13d9c1" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner661d8cf0b2b048f6a5f958450e13d9c1">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable661d8cf0b2b048f6a5f958450e13d9c1">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="661d8cf0b2b048f6a5f958450e13d9c1" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_661d8cf0b2b048f6a5f958450e13d9c1" onclick="_selectAjaxTableAllData(this,'661d8cf0b2b048f6a5f958450e13d9c1')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="CDPI_DEVICE_SN" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CDPI_ITEM_CODE" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#CD_DEVICE_NAME" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CDP_PLAN_SN" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T3#CDP_PLAN_NAME" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T3#CDP_TYPE" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T3#CDP_CYCLE" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T3#CDP_SPACE" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T3#CDP_PRODUCT_TIMES" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CDPI_AREA_SN" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#CD_DEVICE_TYPE" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="T2#CD_DEVICE_CLASS" formId="661d8cf0b2b048f6a5f958450e13d9c1" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv661d8cf0b2b048f6a5f958450e13d9c1" onscroll="ajaxTableScroll(this,'661d8cf0b2b048f6a5f958450e13d9c1')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax661d8cf0b2b048f6a5f958450e13d9c1">
		<tbody id="tbody_661d8cf0b2b048f6a5f958450e13d9c1" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage661d8cf0b2b048f6a5f958450e13d9c1==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=661d8cf0b2b048f6a5f958450e13d9c1&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="8ce444e6b70f49bfb93a565e58c6dc9f" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="8ce444e6b70f49bfb93a565e58c6dc9f" />
    
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
    if(formId=='661d8cf0b2b048f6a5f958450e13d9c1'){<%--FM-保养计划--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDPI_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDPI_DEVICE_SN')+"' style='"+ms.tdStyle(formId, 'CDPI_DEVICE_SN')+"' "+ms.tdEvent(formId, 'CDPI_DEVICE_SN')+">")
            arrHtml.push("<span colno='CDPI_DEVICE_SN' class='"+ms.uiClass(formId, 'CDPI_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'CDPI_DEVICE_SN')+"' "+ms.uiEvent(formId, 'CDPI_DEVICE_SN')+" title='"+ms.titleAttr(formId,'CDPI_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['CDPI_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDPI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CDPI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'CDPI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CDPI_ITEM_CODE')+">")
            arrHtml.push("<span colno='CDPI_ITEM_CODE' class='"+ms.uiClass(formId, 'CDPI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CDPI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CDPI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CDPI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CDPI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CD_DEVICE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#CD_DEVICE_NAME')+"' style='"+ms.tdStyle(formId, 'T2#CD_DEVICE_NAME')+"' "+ms.tdEvent(formId, 'T2#CD_DEVICE_NAME')+">")
            arrHtml.push("<span colno='T2#CD_DEVICE_NAME' class='"+ms.uiClass(formId, 'T2#CD_DEVICE_NAME')+"' style='"+ms.uiStyle(formId, 'T2#CD_DEVICE_NAME')+"' "+ms.uiEvent(formId, 'T2#CD_DEVICE_NAME')+" title='"+ms.titleAttr(formId,'T2#CD_DEVICE_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#CD_DEVICE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDP_PLAN_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDP_PLAN_SN')+"' style='"+ms.tdStyle(formId, 'CDP_PLAN_SN')+"' "+ms.tdEvent(formId, 'CDP_PLAN_SN')+">")
            arrHtml.push("<span colno='CDP_PLAN_SN' class='"+ms.uiClass(formId, 'CDP_PLAN_SN')+"' style='"+ms.uiStyle(formId, 'CDP_PLAN_SN')+"' "+ms.uiEvent(formId, 'CDP_PLAN_SN')+" title='"+ms.titleAttr(formId,'CDP_PLAN_SN','IS_TITLE_ATTR',v)+"' >"+v['CDP_PLAN_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CDP_PLAN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T3#CDP_PLAN_NAME')+"' style='"+ms.tdStyle(formId, 'T3#CDP_PLAN_NAME')+"' "+ms.tdEvent(formId, 'T3#CDP_PLAN_NAME')+">")
            arrHtml.push("<span colno='T3#CDP_PLAN_NAME' class='"+ms.uiClass(formId, 'T3#CDP_PLAN_NAME')+"' style='"+ms.uiStyle(formId, 'T3#CDP_PLAN_NAME')+"' "+ms.uiEvent(formId, 'T3#CDP_PLAN_NAME')+" title='"+ms.titleAttr(formId,'T3#CDP_PLAN_NAME','IS_TITLE_ATTR',v)+"' >"+v['T3#CDP_PLAN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CDP_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'T3#CDP_TYPE')+"' style='text-align:center;"+ms.tdStyle(formId, 'T3#CDP_TYPE')+"' "+ms.tdEvent(formId, 'T3#CDP_TYPE')+">")
            arrHtml.push("<span colno='T3#CDP_TYPE' class='"+ms.uiClass(formId, 'T3#CDP_TYPE')+"' style='"+ms.uiStyle(formId, 'T3#CDP_TYPE')+"' "+ms.uiEvent(formId, 'T3#CDP_TYPE')+" title='"+ms.titleAttr(formId,'T3#CDP_TYPE','IS_TITLE_ATTR',v)+"' >"+v['T3#CDP_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CDP_CYCLE' class='datagrid-cell "+ms.tdClass(formId, 'T3#CDP_CYCLE')+"' style='text-align:center;"+ms.tdStyle(formId, 'T3#CDP_CYCLE')+"' "+ms.tdEvent(formId, 'T3#CDP_CYCLE')+">")
            arrHtml.push("<span colno='T3#CDP_CYCLE' class='"+ms.uiClass(formId, 'T3#CDP_CYCLE')+"' style='"+ms.uiStyle(formId, 'T3#CDP_CYCLE')+"' "+ms.uiEvent(formId, 'T3#CDP_CYCLE')+" title='"+ms.titleAttr(formId,'T3#CDP_CYCLE','IS_TITLE_ATTR',v)+"' >"+v['T3#CDP_CYCLE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CDP_SPACE' class='datagrid-cell "+ms.tdClass(formId, 'T3#CDP_SPACE')+"' style='text-align:right;"+ms.tdStyle(formId, 'T3#CDP_SPACE')+"' "+ms.tdEvent(formId, 'T3#CDP_SPACE')+">")
            arrHtml.push("<span colno='T3#CDP_SPACE' class='"+ms.uiClass(formId, 'T3#CDP_SPACE')+"' style='"+ms.uiStyle(formId, 'T3#CDP_SPACE')+"' "+ms.uiEvent(formId, 'T3#CDP_SPACE')+" title='"+ms.titleAttr(formId,'T3#CDP_SPACE','IS_TITLE_ATTR',v)+"' >"+v['T3#CDP_SPACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#CDP_PRODUCT_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'T3#CDP_PRODUCT_TIMES')+"' style='text-align:right;"+ms.tdStyle(formId, 'T3#CDP_PRODUCT_TIMES')+"' "+ms.tdEvent(formId, 'T3#CDP_PRODUCT_TIMES')+">")
            arrHtml.push("<span colno='T3#CDP_PRODUCT_TIMES' class='"+ms.uiClass(formId, 'T3#CDP_PRODUCT_TIMES')+"' style='"+ms.uiStyle(formId, 'T3#CDP_PRODUCT_TIMES')+"' "+ms.uiEvent(formId, 'T3#CDP_PRODUCT_TIMES')+" title='"+ms.titleAttr(formId,'T3#CDP_PRODUCT_TIMES','IS_TITLE_ATTR',v)+"' >"+v['T3#CDP_PRODUCT_TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CDPI_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'CDPI_AREA_SN')+"' style='"+ms.tdStyle(formId, 'CDPI_AREA_SN')+"' "+ms.tdEvent(formId, 'CDPI_AREA_SN')+">")
            arrHtml.push("<span colno='CDPI_AREA_SN' class='"+ms.uiClass(formId, 'CDPI_AREA_SN')+"' style='"+ms.uiStyle(formId, 'CDPI_AREA_SN')+"' "+ms.uiEvent(formId, 'CDPI_AREA_SN')+" title='"+ms.titleAttr(formId,'CDPI_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['CDPI_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CD_DEVICE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'T2#CD_DEVICE_TYPE')+"' style='"+ms.tdStyle(formId, 'T2#CD_DEVICE_TYPE')+"' "+ms.tdEvent(formId, 'T2#CD_DEVICE_TYPE')+">")
            arrHtml.push("<span colno='T2#CD_DEVICE_TYPE' class='"+ms.uiClass(formId, 'T2#CD_DEVICE_TYPE')+"' style='"+ms.uiStyle(formId, 'T2#CD_DEVICE_TYPE')+"' "+ms.uiEvent(formId, 'T2#CD_DEVICE_TYPE')+" title='"+ms.titleAttr(formId,'T2#CD_DEVICE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['T2#CD_DEVICE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#CD_DEVICE_CLASS' class='datagrid-cell "+ms.tdClass(formId, 'T2#CD_DEVICE_CLASS')+"' style='"+ms.tdStyle(formId, 'T2#CD_DEVICE_CLASS')+"' "+ms.tdEvent(formId, 'T2#CD_DEVICE_CLASS')+">")
            arrHtml.push("<span colno='T2#CD_DEVICE_CLASS' class='"+ms.uiClass(formId, 'T2#CD_DEVICE_CLASS')+"' style='"+ms.uiStyle(formId, 'T2#CD_DEVICE_CLASS')+"' "+ms.uiEvent(formId, 'T2#CD_DEVICE_CLASS')+" title='"+ms.titleAttr(formId,'T2#CD_DEVICE_CLASS','IS_TITLE_ATTR',v)+"' >"+v['T2#CD_DEVICE_CLASS']+"</span>")
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
