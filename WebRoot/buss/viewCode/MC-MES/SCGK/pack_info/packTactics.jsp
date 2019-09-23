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
		<dict:lang value="包装策略配置" />
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
		<bu:header formId ="d271588ad1ba475f92435ea46a9e7947"/>

    
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
		<bu:func viewId="973e8a131cf843499373c80f42c00b02" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="973e8a131cf843499373c80f42c00b02" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPaged271588ad1ba475f92435ea46a9e7947" id="formPaged271588ad1ba475f92435ea46a9e7947" value="${formPaged271588ad1ba475f92435ea46a9e7947}"/>
		<input type="hidden" name="formId" id="formId1" value='d271588ad1ba475f92435ea46a9e7947'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="d271588ad1ba475f92435ea46a9e7947">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxd271588ad1ba475f92435ea46a9e7947" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerd271588ad1ba475f92435ea46a9e7947">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htabled271588ad1ba475f92435ea46a9e7947">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="d271588ad1ba475f92435ea46a9e7947" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_d271588ad1ba475f92435ea46a9e7947" onclick="_selectAjaxTableAllData(this,'d271588ad1ba475f92435ea46a9e7947')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="PTC_SN" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="PTC_NAME" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="PTC_PROJECT_ID" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="PTC_MODEL_CODE" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="PTC_CUST_CODE" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center"><bu:uitn colNo="PTC_AREA_SN" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<td class="datagrid-cell" style="width:140px; text-align:center"><bu:uitn colNo="PTC_TIME" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center"><bu:uitn colNo="PTC_EMP" formId="d271588ad1ba475f92435ea46a9e7947" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivd271588ad1ba475f92435ea46a9e7947" onscroll="ajaxTableScroll(this,'d271588ad1ba475f92435ea46a9e7947')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxd271588ad1ba475f92435ea46a9e7947">
		<tbody id="tbody_d271588ad1ba475f92435ea46a9e7947" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPaged271588ad1ba475f92435ea46a9e7947==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=d271588ad1ba475f92435ea46a9e7947&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="973e8a131cf843499373c80f42c00b02" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="973e8a131cf843499373c80f42c00b02" />
    
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
    if(formId=='d271588ad1ba475f92435ea46a9e7947'){<%--包装策略关联信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");          
            arrHtml.push("<td colno='PTC_SN' class='datagrid-cell "+ms.tdClass(formId, 'PTC_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'PTC_SN')+"' "+ms.tdEvent(formId, 'PTC_SN')+">")
            arrHtml.push("<span colno='PTC_SN' class='"+ms.uiClass(formId, 'PTC_SN')+"' onclick='itemJump1(\""+v['PTC_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PTC_SN')+" title='"+ms.titleAttr(formId,'PTC_SN','IS_TITLE_ATTR',v)+"' >"+v['PTC_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTC_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PTC_NAME')+"' style='width:120px;"+ms.tdStyle(formId, 'PTC_NAME')+"' "+ms.tdEvent(formId, 'PTC_NAME')+">")
            arrHtml.push("<span colno='PTC_NAME' class='"+ms.uiClass(formId, 'PTC_NAME')+"' style='"+ms.uiStyle(formId, 'PTC_NAME')+"' "+ms.uiEvent(formId, 'PTC_NAME')+" title='"+ms.titleAttr(formId,'PTC_NAME','IS_TITLE_ATTR',v)+"' >"+v['PTC_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTC_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PTC_PROJECT_ID')+"' style='width:120px;"+ms.tdStyle(formId, 'PTC_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PTC_PROJECT_ID')+">")
            arrHtml.push("<span colno='PTC_PROJECT_ID' class='"+ms.uiClass(formId, 'PTC_PROJECT_ID')+"' onclick='itemJump2(\""+v['PTC_PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PTC_PROJECT_ID')+" title='"+ms.titleAttr(formId,'PTC_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PTC_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTC_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PTC_MODEL_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'PTC_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PTC_MODEL_CODE')+">")
            arrHtml.push("<span colno='PTC_MODEL_CODE' class='"+ms.uiClass(formId, 'PTC_MODEL_CODE')+"' onclick='itemJump3(\""+v['PTC_MODEL_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PTC_MODEL_CODE')+" title='"+ms.titleAttr(formId,'PTC_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['PTC_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTC_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PTC_CUST_CODE')+"' style='width:120px;"+ms.tdStyle(formId, 'PTC_CUST_CODE')+"' "+ms.tdEvent(formId, 'PTC_CUST_CODE')+">")
            arrHtml.push("<span colno='PTC_CUST_CODE' class='"+ms.uiClass(formId, 'PTC_CUST_CODE')+"' style='"+ms.uiStyle(formId, 'PTC_CUST_CODE')+"' "+ms.uiEvent(formId, 'PTC_CUST_CODE')+" title='"+ms.titleAttr(formId,'PTC_CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['PTC_CUST_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTC_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PTC_AREA_SN')+"' style='width:120px;"+ms.tdStyle(formId, 'PTC_AREA_SN')+"' "+ms.tdEvent(formId, 'PTC_AREA_SN')+">")
            arrHtml.push("<span colno='PTC_AREA_SN' class='"+ms.uiClass(formId, 'PTC_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PTC_AREA_SN')+"' "+ms.uiEvent(formId, 'PTC_AREA_SN')+" title='"+ms.titleAttr(formId,'PTC_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PTC_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTC_TIME' class='datagrid-cell "+ms.tdClass(formId, 'PTC_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'PTC_TIME')+"' "+ms.tdEvent(formId, 'PTC_TIME')+">")
            arrHtml.push("<span colno='PTC_TIME' class='"+ms.uiClass(formId, 'PTC_TIME')+"' style='"+ms.uiStyle(formId, 'PTC_TIME')+"' "+ms.uiEvent(formId, 'PTC_TIME')+" title='"+ms.titleAttr(formId,'PTC_TIME','IS_TITLE_ATTR',v)+"' >"+v['PTC_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PTC_EMP' class='datagrid-cell "+ms.tdClass(formId, 'PTC_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'PTC_EMP')+"' "+ms.tdEvent(formId, 'PTC_EMP')+">")
            arrHtml.push("<span colno='PTC_EMP' class='"+ms.uiClass(formId, 'PTC_EMP')+"' style='"+ms.uiStyle(formId, 'PTC_EMP')+"' "+ms.uiEvent(formId, 'PTC_EMP')+" title='"+ms.titleAttr(formId,'PTC_EMP','IS_TITLE_ATTR',v)+"' >"+v['PTC_EMP']+"</span>")
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

//勿删，公用列表使用
function getTacticsCode(){
    
    
}
function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#PTC_SN").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//包装策略定义
function itemJump1(obj){
      winOptMethod.jump("949869d3f43e4d02ba3da1124cd9fa7f","F7408","jumpId",obj);
}  


//工单信息
function itemJump2(obj){
    winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
} 

//BOM管理
function itemJump3(obj){
    winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
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
