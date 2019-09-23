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
		<dict:lang value="在线制令单" />
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
		<bu:header formId ="b8f52c26583e4ffd938fba4f2dad7a34"/>

    
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
		<bu:func viewId="6dc086ad140c4c5fa02ec35471a1883c" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="6dc086ad140c4c5fa02ec35471a1883c" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageb8f52c26583e4ffd938fba4f2dad7a34" id="formPageb8f52c26583e4ffd938fba4f2dad7a34" value="${formPageb8f52c26583e4ffd938fba4f2dad7a34}"/>
		<input type="hidden" name="formId" id="formId1" value='b8f52c26583e4ffd938fba4f2dad7a34'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b8f52c26583e4ffd938fba4f2dad7a34">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb8f52c26583e4ffd938fba4f2dad7a34" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb8f52c26583e4ffd938fba4f2dad7a34">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb8f52c26583e4ffd938fba4f2dad7a34" style="min-width:1500px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="b8f52c26583e4ffd938fba4f2dad7a34" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b8f52c26583e4ffd938fba4f2dad7a34" onclick="_selectAjaxTableAllData(this,'b8f52c26583e4ffd938fba4f2dad7a34')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="PMO_NUMBER" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="PMO_PROJECT_ID" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PMO_TYPE" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="PMO_MODEL_CODE" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="PMO_AREA_SN" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="AREA_NAME" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:70px;"><bu:uitn colNo="PMO_PROCESS_FACE" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="PMO_TECH_SN" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="TECH_NAME" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="PMO_TIME" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="PMO_EMP" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb8f52c26583e4ffd938fba4f2dad7a34" onscroll="ajaxTableScroll(this,'b8f52c26583e4ffd938fba4f2dad7a34')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb8f52c26583e4ffd938fba4f2dad7a34" style="min-width:1500px;">
		<tbody id="tbody_b8f52c26583e4ffd938fba4f2dad7a34" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb8f52c26583e4ffd938fba4f2dad7a34==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b8f52c26583e4ffd938fba4f2dad7a34&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="6dc086ad140c4c5fa02ec35471a1883c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="6dc086ad140c4c5fa02ec35471a1883c" />
    
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
    if(formId=='b8f52c26583e4ffd938fba4f2dad7a34'){<%--在线制令单信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_NUMBER'  class='datagrid-cell "+ms.tdClass(formId, 'PMO_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'PMO_NUMBER')+"' "+ms.tdEvent(formId, 'PMO_NUMBER')+">")
            arrHtml.push("<span colno='PMO_NUMBER' class='"+ms.uiClass(formId, 'PMO_NUMBER')+"' onclick='itemJump1(\""+v['PMO_NUMBER']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PMO_NUMBER')+" title='"+ms.titleAttr(formId,'PMO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PMO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_PROJECT_ID'  class='datagrid-cell "+ms.tdClass(formId, 'PMO_PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'PMO_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PMO_PROJECT_ID')+">")
            arrHtml.push("<span colno='PMO_PROJECT_ID' class='"+ms.uiClass(formId, 'PMO_PROJECT_ID')+"' onclick='itemJump2(\""+v['PMO_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PMO_PROJECT_ID')+" title='"+ms.titleAttr(formId,'PMO_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PMO_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'PMO_TYPE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'PMO_TYPE')+"' "+ms.tdEvent(formId, 'PMO_TYPE')+">")
            arrHtml.push("<span colno='PMO_TYPE' class='"+ms.uiClass(formId, 'PMO_TYPE')+"' style='"+ms.uiStyle(formId, 'PMO_TYPE')+"' "+ms.uiEvent(formId, 'PMO_TYPE')+" title='"+ms.titleAttr(formId,'PMO_TYPE','IS_TITLE_ATTR',v)+"' >"+v['PMO_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_MODEL_CODE'  class='datagrid-cell "+ms.tdClass(formId, 'PMO_MODEL_CODE')+"' style='width:150px;"+ms.tdStyle(formId, 'PMO_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PMO_MODEL_CODE')+">")
            arrHtml.push("<span colno='PMO_MODEL_CODE' class='"+ms.uiClass(formId, 'PMO_MODEL_CODE')+"' onclick='itemJump3(\""+v['PMO_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PMO_MODEL_CODE')+" title='"+ms.titleAttr(formId,'PMO_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['PMO_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PMO_AREA_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'PMO_AREA_SN')+"' "+ms.tdEvent(formId, 'PMO_AREA_SN')+">")
            arrHtml.push("<span colno='PMO_AREA_SN' class='"+ms.uiClass(formId, 'PMO_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PMO_AREA_SN')+"' "+ms.uiEvent(formId, 'PMO_AREA_SN')+" title='"+ms.titleAttr(formId,'PMO_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PMO_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'AREA_NAME')+"' "+ms.tdEvent(formId, 'AREA_NAME')+">")
            arrHtml.push("<span colno='AREA_NAME' class='"+ms.uiClass(formId, 'AREA_NAME')+"' style='"+ms.uiStyle(formId, 'AREA_NAME')+"' "+ms.uiEvent(formId, 'AREA_NAME')+" title='"+ms.titleAttr(formId,'AREA_NAME','IS_TITLE_ATTR',v)+"' >"+v['AREA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'PMO_PROCESS_FACE')+"' style='width:70px;text-align:center;"+ms.tdStyle(formId, 'PMO_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'PMO_PROCESS_FACE')+">")
            arrHtml.push("<span colno='PMO_PROCESS_FACE' class='"+ms.uiClass(formId, 'PMO_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'PMO_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'PMO_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'PMO_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['PMO_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='PMO_TECH_SN'  class='datagrid-cell "+ms.tdClass(formId, 'PMO_TECH_SN')+"' style='width:150px;"+ms.tdStyle(formId, 'PMO_TECH_SN')+"' "+ms.tdEvent(formId, 'PMO_TECH_SN')+">")
            arrHtml.push("<span colno='PMO_TECH_SN' class='"+ms.uiClass(formId, 'PMO_TECH_SN')+"' onclick='itemJump4(\""+v['PMO_TECH_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PMO_TECH_SN')+" title='"+ms.titleAttr(formId,'PMO_TECH_SN','IS_TITLE_ATTR',v)+"' >"+v['PMO_TECH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TECH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'TECH_NAME')+"' style='width:150px;"+ms.tdStyle(formId, 'TECH_NAME')+"' "+ms.tdEvent(formId, 'TECH_NAME')+">")
            arrHtml.push("<span colno='TECH_NAME' class='"+ms.uiClass(formId, 'TECH_NAME')+"' style='"+ms.uiStyle(formId, 'TECH_NAME')+"' "+ms.uiEvent(formId, 'TECH_NAME')+" title='"+ms.titleAttr(formId,'TECH_NAME','IS_TITLE_ATTR',v)+"' >"+v['TECH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_TIME' class='datagrid-cell "+ms.tdClass(formId, 'PMO_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'PMO_TIME')+"' "+ms.tdEvent(formId, 'PMO_TIME')+">")
            arrHtml.push("<span colno='PMO_TIME' class='"+ms.uiClass(formId, 'PMO_TIME')+"' style='"+ms.uiStyle(formId, 'PMO_TIME')+"' "+ms.uiEvent(formId, 'PMO_TIME')+" title='"+ms.titleAttr(formId,'PMO_TIME','IS_TITLE_ATTR',v)+"' >"+v['PMO_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_EMP' class='datagrid-cell "+ms.tdClass(formId, 'PMO_EMP')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'PMO_EMP')+"' "+ms.tdEvent(formId, 'PMO_EMP')+">")
            arrHtml.push("<span colno='PMO_EMP' class='"+ms.uiClass(formId, 'PMO_EMP')+"' style='"+ms.uiStyle(formId, 'PMO_EMP')+"' "+ms.uiEvent(formId, 'PMO_EMP')+" title='"+ms.titleAttr(formId,'PMO_EMP','IS_TITLE_ATTR',v)+"' >"+v['PMO_EMP']+"</span>")
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
    
    
 $(function(){
$("#41aad9b714f94faeb4501d4414185c32").attr("style","display:none;");   
})
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制令单信息
function itemJump1(obj){
      winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//BOM管理
function itemJump3(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
} 

//工艺信息
function itemJump4(obj){
  winOptMethod.jump("ab7fd048ac884ead9706952262e9c496","F11130","jumpId",obj);
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
