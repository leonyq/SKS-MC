<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%><%--@page import="com.more.fw.core.staticresource.PlfStaticRes"--%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
    <title>
		<dict:lang value="DOA维修管理" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%> <%--<jsp:param name="scroll" value="1" /> --%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" /> 
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="0ab26fe960da4b8e824ba7b136743db9"/>
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="b653d283387b45daaaac74dd35be13db" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="b653d283387b45daaaac74dd35be13db" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0ab26fe960da4b8e824ba7b136743db9" id="formPage0ab26fe960da4b8e824ba7b136743db9" value="${formPage0ab26fe960da4b8e824ba7b136743db9}"/>
		<input type="hidden" name="formId" id="formId1" value='0ab26fe960da4b8e824ba7b136743db9'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0ab26fe960da4b8e824ba7b136743db9">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0ab26fe960da4b8e824ba7b136743db9" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0ab26fe960da4b8e824ba7b136743db9">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0ab26fe960da4b8e824ba7b136743db9">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="0ab26fe960da4b8e824ba7b136743db9" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0ab26fe960da4b8e824ba7b136743db9" onclick="_selectAjaxTableAllData(this,'0ab26fe960da4b8e824ba7b136743db9')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:110px!important;"><bu:uitn  colNo="DR_SN" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="DR_LOT"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="DR_FINISH_FLAG"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="DR_MO_NUMBER"   formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="DR_MODEL_CODE"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="DR_MODEL_NAME"   formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
	        <td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="DR_MODEL_STANDARD"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="DR_ERROR_CODE"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="DR_ERROR_DESC"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:110px;"><bu:uitn colNo="DR_POINT"   formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:70px;display:none"><bu:uitn colNo="DR_ERROR_NUM"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="DR_REASON_CODE"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="DR_ERROR_ITEM"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:90px;"><bu:uitn colNo="DR_EMP"  formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
			<td class="datagrid-cell" style="width:160px;"><bu:uitn colNo="DR_REPAIR_TIME" formId="0ab26fe960da4b8e824ba7b136743db9" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0ab26fe960da4b8e824ba7b136743db9" onscroll="ajaxTableScroll(this,'0ab26fe960da4b8e824ba7b136743db9')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0ab26fe960da4b8e824ba7b136743db9">
		<tbody id="tbody_0ab26fe960da4b8e824ba7b136743db9" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0ab26fe960da4b8e824ba7b136743db9==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0ab26fe960da4b8e824ba7b136743db9&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="b653d283387b45daaaac74dd35be13db" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="b653d283387b45daaaac74dd35be13db" />
    
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
    if(formId=='0ab26fe960da4b8e824ba7b136743db9'){<%--FM_DOA--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
             arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='DR_SN' class='datagrid-cell "+ms.tdClass(formId, 'DR_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'DR_SN')+"' "+ms.tdEvent(formId, 'DR_SN')+">")
            arrHtml.push("<span colno='DR_SN' class='"+ms.uiClass(formId, 'DR_SN')+"' onclick='itemJump1(\""+v['DR_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'DR_SN')+" title='"+ms.titleAttr(formId,'DR_SN','IS_TITLE_ATTR',v)+"' >"+v['DR_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_LOT' class='datagrid-cell "+ms.tdClass(formId, 'DR_LOT')+"' style='width:150px;"+ms.tdStyle(formId, 'DR_LOT')+"' "+ms.tdEvent(formId, 'DR_LOT')+">")
            arrHtml.push("<span colno='DR_LOT' class='"+ms.uiClass(formId, 'DR_LOT')+"' style='"+ms.uiStyle(formId, 'DR_LOT')+"' "+ms.uiEvent(formId, 'DR_LOT')+" title='"+ms.titleAttr(formId,'DR_LOT','IS_TITLE_ATTR',v)+"' >"+v['DR_LOT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_FINISH_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'DR_FINISH_FLAG')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'DR_FINISH_FLAG')+"' "+ms.tdEvent(formId, 'DR_FINISH_FLAG')+">")
            arrHtml.push("<span colno='DR_FINISH_FLAG' class='"+ms.uiClass(formId, 'DR_FINISH_FLAG')+"' style='"+ms.uiStyle(formId, 'DR_FINISH_FLAG')+"' "+ms.uiEvent(formId, 'DR_FINISH_FLAG')+" title='"+ms.titleAttr(formId,'DR_FINISH_FLAG','IS_TITLE_ATTR',v)+"' >"+v['DR_FINISH_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'DR_MO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'DR_MO_NUMBER')+"' "+ms.tdEvent(formId, 'DR_MO_NUMBER')+">")
            arrHtml.push("<span colno='DR_MO_NUMBER' class='"+ms.uiClass(formId, 'DR_MO_NUMBER')+"' onclick='itemJump2(\""+v['DR_MO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'DR_MO_NUMBER')+" title='"+ms.titleAttr(formId,'DR_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['DR_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'DR_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'DR_MODEL_CODE')+"' "+ms.tdEvent(formId, 'DR_MODEL_CODE')+">")
            arrHtml.push("<span colno='DR_MODEL_CODE' class='"+ms.uiClass(formId, 'DR_MODEL_CODE')+"' onclick='itemJump3(\""+v['DR_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'DR_MODEL_CODE')+" title='"+ms.titleAttr(formId,'DR_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['DR_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_MODEL_NAME' class='datagrid-cell "+ms.tdClass(formId, 'DR_MODEL_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'DR_MODEL_NAME')+"' "+ms.tdEvent(formId, 'DR_MODEL_NAME')+">")
            arrHtml.push("<span colno='DR_MODEL_NAME' class='"+ms.uiClass(formId, 'DR_MODEL_NAME')+"' style='"+ms.uiStyle(formId, 'DR_MODEL_NAME')+"' "+ms.uiEvent(formId, 'DR_MODEL_NAME')+" title='"+ms.titleAttr(formId,'DR_MODEL_NAME','IS_TITLE_ATTR',v)+"' >"+v['DR_MODEL_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_MODEL_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'DR_MODEL_STANDARD')+"' style='width:150px;"+ms.tdStyle(formId, 'DR_MODEL_STANDARD')+"' "+ms.tdEvent(formId, 'DR_MODEL_STANDARD')+">")
            arrHtml.push("<span colno='DR_MODEL_STANDARD' class='"+ms.uiClass(formId, 'DR_MODEL_STANDARD')+"' style='"+ms.uiStyle(formId, 'DR_MODEL_STANDARD')+"' "+ms.uiEvent(formId, 'DR_MODEL_STANDARD')+" title='"+ms.titleAttr(formId,'DR_MODEL_STANDARD','IS_TITLE_ATTR',v)+"' >"+v['DR_MODEL_STANDARD']+"</span>")
            arrHtml.push("</td>");
        
            arrHtml.push("<td colno='DR_ERROR_CODE' class='datagrid-cell "+ms.tdClass(formId, 'DR_ERROR_CODE')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'DR_ERROR_CODE')+"' "+ms.tdEvent(formId, 'DR_ERROR_CODE')+">")
            arrHtml.push("<span colno='DR_ERROR_CODE' class='"+ms.uiClass(formId, 'DR_ERROR_CODE')+"' onclick='itemJump4(\""+v['DR_ERROR_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'DR_ERROR_CODE')+" title='"+ms.titleAttr(formId,'DR_ERROR_CODE','IS_TITLE_ATTR',v)+"' >"+v['DR_ERROR_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_ERROR_DESC' class='datagrid-cell "+ms.tdClass(formId, 'DR_ERROR_DESC')+"' style='width:150px;"+ms.tdStyle(formId, 'DR_ERROR_DESC')+"' "+ms.tdEvent(formId, 'DR_ERROR_DESC')+">")
            arrHtml.push("<span colno='DR_ERROR_DESC' class='"+ms.uiClass(formId, 'DR_ERROR_DESC')+"' style='"+ms.uiStyle(formId, 'DR_ERROR_DESC')+"' "+ms.uiEvent(formId, 'DR_ERROR_DESC')+" title='"+ms.titleAttr(formId,'DR_ERROR_DESC','IS_TITLE_ATTR',v)+"' >"+v['DR_ERROR_DESC']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='DR_POINT' class='datagrid-cell "+ms.tdClass(formId, 'DR_POINT')+"' style='width:110px;text-align:center;"+ms.tdStyle(formId, 'DR_POINT')+"' "+ms.tdEvent(formId, 'DR_POINT')+">")
            arrHtml.push("<span colno='DR_POINT' class='"+ms.uiClass(formId, 'DR_POINT')+"' style='"+ms.uiStyle(formId, 'DR_POINT')+"' "+ms.uiEvent(formId, 'DR_POINT')+" title='"+ms.titleAttr(formId,'DR_POINT','IS_TITLE_ATTR',v)+"' >"+v['DR_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_ERROR_NUM' class='datagrid-cell "+ms.tdClass(formId, 'DR_ERROR_NUM')+"' style='display:none;wdisplay:none;width:70px;text-align:right;;"+ms.tdStyle(formId, 'DR_ERROR_NUM')+"' "+ms.tdEvent(formId, 'DR_ERROR_NUM')+">")
            arrHtml.push("<span colno='DR_ERROR_NUM' class='"+ms.uiClass(formId, 'DR_ERROR_NUM')+"' style='"+ms.uiStyle(formId, 'DR_ERROR_NUM')+"' "+ms.uiEvent(formId, 'DR_ERROR_NUM')+" title='"+ms.titleAttr(formId,'DR_ERROR_NUM','IS_TITLE_ATTR',v)+"' >"+v['DR_ERROR_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_REASON_CODE' class='datagrid-cell "+ms.tdClass(formId, 'DR_REASON_CODE')+"' style='width:70px;;"+ms.tdStyle(formId, 'DR_REASON_CODE')+"' "+ms.tdEvent(formId, 'DR_REASON_CODE')+">")
            arrHtml.push("<span colno='DR_REASON_CODE' class='"+ms.uiClass(formId, 'DR_REASON_CODE')+"' style='"+ms.uiStyle(formId, 'DR_REASON_CODE')+"' "+ms.uiEvent(formId, 'DR_REASON_CODE')+" title='"+ms.titleAttr(formId,'DR_REASON_CODE','IS_TITLE_ATTR',v)+"' >"+v['DR_REASON_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_ERROR_ITEM' class='datagrid-cell "+ms.tdClass(formId, 'DR_ERROR_ITEM')+"' style='width:150px;"+ms.tdStyle(formId, 'DR_ERROR_ITEM')+"' "+ms.tdEvent(formId, 'DR_ERROR_ITEM')+">")
            arrHtml.push("<span colno='DR_ERROR_ITEM' class='"+ms.uiClass(formId, 'DR_ERROR_ITEM')+"' style='"+ms.uiStyle(formId, 'DR_ERROR_ITEM')+"' "+ms.uiEvent(formId, 'DR_ERROR_ITEM')+" title='"+ms.titleAttr(formId,'DR_ERROR_ITEM','IS_TITLE_ATTR',v)+"' >"+v['DR_ERROR_ITEM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_EMP' class='datagrid-cell "+ms.tdClass(formId, 'DR_EMP')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'DR_EMP')+"' "+ms.tdEvent(formId, 'DR_EMP')+">")
            arrHtml.push("<span colno='DR_EMP' class='"+ms.uiClass(formId, 'DR_EMP')+"' style='"+ms.uiStyle(formId, 'DR_EMP')+"' "+ms.uiEvent(formId, 'DR_EMP')+" title='"+ms.titleAttr(formId,'DR_EMP','IS_TITLE_ATTR',v)+"' >"+v['DR_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DR_REPAIR_TIME' class='datagrid-cell "+ms.tdClass(formId, 'DR_REPAIR_TIME')+"' style='width:160px;text-align:center;"+ms.tdStyle(formId, 'DR_REPAIR_TIME')+"' "+ms.tdEvent(formId, 'DR_REPAIR_TIME')+">")
            arrHtml.push("<span colno='DR_REPAIR_TIME' class='"+ms.uiClass(formId, 'DR_REPAIR_TIME')+"' style='"+ms.uiStyle(formId, 'DR_REPAIR_TIME')+"' "+ms.uiEvent(formId, 'DR_REPAIR_TIME')+" title='"+ms.titleAttr(formId,'DR_REPAIR_TIME','IS_TITLE_ATTR',v)+"' >"+v['DR_REPAIR_TIME']+"</span>")
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

//不良代码
function itemJump4(obj){
  winOptMethod.jump("0ca7cd10e18b43bfb72a9e038bc9e16b","F5485","jumpId",obj);
} 



</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js">
<%--?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>--%>
</script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
