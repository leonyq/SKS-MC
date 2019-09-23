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
		<dict:lang value="VM-产品清除信息" />
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
		<bu:header formId ="4f9437be29b54b31af0b6d067a6e4932"/>

    
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
		<bu:func viewId="6e5d76db47e44b41a2925d7866fe4c4e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="6e5d76db47e44b41a2925d7866fe4c4e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage4f9437be29b54b31af0b6d067a6e4932" id="formPage4f9437be29b54b31af0b6d067a6e4932" value="${formPage4f9437be29b54b31af0b6d067a6e4932}"/>
		<input type="hidden" name="formId" id="formId1" value='4f9437be29b54b31af0b6d067a6e4932'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="4f9437be29b54b31af0b6d067a6e4932">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax4f9437be29b54b31af0b6d067a6e4932" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner4f9437be29b54b31af0b6d067a6e4932">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable4f9437be29b54b31af0b6d067a6e4932">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="4f9437be29b54b31af0b6d067a6e4932" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_4f9437be29b54b31af0b6d067a6e4932" onclick="_selectAjaxTableAllData(this,'4f9437be29b54b31af0b6d067a6e4932')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="WSD_SN" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSD_MO_NUMBER" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSD_MODEL_CODE" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSD_PROJECT_ID" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="WSD_LOT" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSD_NUM" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="WSD_WORK_STATION" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="WSD_DEL_TIME" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="WSD_DEL_MAN" formId="4f9437be29b54b31af0b6d067a6e4932" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv4f9437be29b54b31af0b6d067a6e4932" onscroll="ajaxTableScroll(this,'4f9437be29b54b31af0b6d067a6e4932')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax4f9437be29b54b31af0b6d067a6e4932">
		<tbody id="tbody_4f9437be29b54b31af0b6d067a6e4932" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage4f9437be29b54b31af0b6d067a6e4932==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=4f9437be29b54b31af0b6d067a6e4932&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="6e5d76db47e44b41a2925d7866fe4c4e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="6e5d76db47e44b41a2925d7866fe4c4e" />
    
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
    if(formId=='4f9437be29b54b31af0b6d067a6e4932'){<%--FM-产品清除信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSD_SN')+"' style='width:110px;"+ms.tdStyle(formId, 'WSD_SN')+"' "+ms.tdEvent(formId, 'WSD_SN')+">")
            arrHtml.push("<span colno='WSD_SN' class='"+ms.uiClass(formId, 'WSD_SN')+"' onclick='itemJump1(\""+v['WSD_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WSD_SN')+" title='"+ms.titleAttr(formId,'WSD_SN','IS_TITLE_ATTR',v)+"' >"+v['WSD_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WSD_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'WSD_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WSD_MO_NUMBER')+">")
            arrHtml.push("<span colno='WSD_MO_NUMBER' class='"+ms.uiClass(formId, 'WSD_MO_NUMBER')+"' onclick='itemJump2(\""+v['WSD_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WSD_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WSD_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WSD_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSD_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'WSD_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WSD_MODEL_CODE')+">")
            arrHtml.push("<span colno='WSD_MODEL_CODE' class='"+ms.uiClass(formId, 'WSD_MODEL_CODE')+"' onclick='itemJump3(\""+v['WSD_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WSD_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WSD_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSD_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'WSD_PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'WSD_PROJECT_ID')+"' "+ms.tdEvent(formId, 'WSD_PROJECT_ID')+">")
            arrHtml.push("<span colno='WSD_PROJECT_ID' class='"+ms.uiClass(formId, 'WSD_PROJECT_ID')+"' onclick='itemJump4(\""+v['WSD_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'WSD_PROJECT_ID')+" title='"+ms.titleAttr(formId,'WSD_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['WSD_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_LOT' class='datagrid-cell "+ms.tdClass(formId, 'WSD_LOT')+"' style='width:70px;text-align:right;"+ms.tdStyle(formId, 'WSD_LOT')+"' "+ms.tdEvent(formId, 'WSD_LOT')+">")
            arrHtml.push("<span colno='WSD_LOT' class='"+ms.uiClass(formId, 'WSD_LOT')+"' style='"+ms.uiStyle(formId, 'WSD_LOT')+"' "+ms.uiEvent(formId, 'WSD_LOT')+" title='"+ms.titleAttr(formId,'WSD_LOT','IS_TITLE_ATTR',v)+"' >"+v['WSD_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSD_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'WSD_NUM')+"' "+ms.tdEvent(formId, 'WSD_NUM')+">")
            arrHtml.push("<span colno='WSD_NUM' class='"+ms.uiClass(formId, 'WSD_NUM')+"' style='"+ms.uiStyle(formId, 'WSD_NUM')+"' "+ms.uiEvent(formId, 'WSD_NUM')+" title='"+ms.titleAttr(formId,'WSD_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSD_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'WSD_WORK_STATION')+"' style='width:150px;"+ms.tdStyle(formId, 'WSD_WORK_STATION')+"' "+ms.tdEvent(formId, 'WSD_WORK_STATION')+">")
            arrHtml.push("<span colno='WSD_WORK_STATION' class='"+ms.uiClass(formId, 'WSD_WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WSD_WORK_STATION')+"' "+ms.uiEvent(formId, 'WSD_WORK_STATION')+" title='"+ms.titleAttr(formId,'WSD_WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WSD_WORK_STATION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_DEL_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WSD_DEL_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'WSD_DEL_TIME')+"' "+ms.tdEvent(formId, 'WSD_DEL_TIME')+">")
            arrHtml.push("<span colno='WSD_DEL_TIME' class='"+ms.uiClass(formId, 'WSD_DEL_TIME')+"' style='"+ms.uiStyle(formId, 'WSD_DEL_TIME')+"' "+ms.uiEvent(formId, 'WSD_DEL_TIME')+" title='"+ms.titleAttr(formId,'WSD_DEL_TIME','IS_TITLE_ATTR',v)+"' >"+v['WSD_DEL_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSD_DEL_MAN' class='datagrid-cell "+ms.tdClass(formId, 'WSD_DEL_MAN')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'WSD_DEL_MAN')+"' "+ms.tdEvent(formId, 'WSD_DEL_MAN')+">")
            arrHtml.push("<span colno='WSD_DEL_MAN' class='"+ms.uiClass(formId, 'WSD_DEL_MAN')+"' style='"+ms.uiStyle(formId, 'WSD_DEL_MAN')+"' "+ms.uiEvent(formId, 'WSD_DEL_MAN')+" title='"+ms.titleAttr(formId,'WSD_DEL_MAN','IS_TITLE_ATTR',v)+"' >"+v['WSD_DEL_MAN']+"</span>")
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
$(function(){
	$("#9c1b86a2f9de4ad69c47f068251bc900").attr("style","display:none;");
})


</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//产品追溯
function itemJump1(obj){
      winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
}  


//制令单信息
function itemJump2(obj){
    winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
} 

//BOM管理
function itemJump3(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 

//工单信息
function itemJump4(obj){
  winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
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
