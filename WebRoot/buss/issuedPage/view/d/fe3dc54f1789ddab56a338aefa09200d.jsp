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
		<dict:lang value="VM-软体管理" />
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
		<bu:header formId ="cc45a8ab4c87407090593be875962853"/>

    
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
		<bu:func viewId="fac1e9f5b55648c6b4ae3d4630a28a4d" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="fac1e9f5b55648c6b4ae3d4630a28a4d" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagecc45a8ab4c87407090593be875962853" id="formPagecc45a8ab4c87407090593be875962853" value="${formPagecc45a8ab4c87407090593be875962853}"/>
		<input type="hidden" name="formId" id="formId1" value='cc45a8ab4c87407090593be875962853'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="cc45a8ab4c87407090593be875962853">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxcc45a8ab4c87407090593be875962853" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innercc45a8ab4c87407090593be875962853">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablecc45a8ab4c87407090593be875962853">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="cc45a8ab4c87407090593be875962853" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_cc45a8ab4c87407090593be875962853" onclick="_selectAjaxTableAllData(this,'cc45a8ab4c87407090593be875962853')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_USER" formId="cc45a8ab4c87407090593be875962853" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="cc45a8ab4c87407090593be875962853" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivcc45a8ab4c87407090593be875962853" onscroll="ajaxTableScroll(this,'cc45a8ab4c87407090593be875962853')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxcc45a8ab4c87407090593be875962853">
		<tbody id="tbody_cc45a8ab4c87407090593be875962853" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagecc45a8ab4c87407090593be875962853==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=cc45a8ab4c87407090593be875962853&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="fac1e9f5b55648c6b4ae3d4630a28a4d" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="fac1e9f5b55648c6b4ae3d4630a28a4d" />
    
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
    if(formId=='cc45a8ab4c87407090593be875962853'){<%--FM-软体管理--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPI_SN' class='datagrid-cell "+ms.tdClass(formId, 'CPI_SN')+"' style='"+ms.tdStyle(formId, 'CPI_SN')+"' "+ms.tdEvent(formId, 'CPI_SN')+">")
            arrHtml.push("<span colno='CPI_SN' class='"+ms.uiClass(formId, 'CPI_SN')+"' style='"+ms.uiStyle(formId, 'CPI_SN')+"' "+ms.uiEvent(formId, 'CPI_SN')+" title='"+ms.titleAttr(formId,'CPI_SN','IS_TITLE_ATTR',v)+"' >"+v['CPI_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPI_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CPI_NAME')+"' style='"+ms.tdStyle(formId, 'CPI_NAME')+"' "+ms.tdEvent(formId, 'CPI_NAME')+">")
            arrHtml.push("<span colno='CPI_NAME' class='"+ms.uiClass(formId, 'CPI_NAME')+"' style='"+ms.uiStyle(formId, 'CPI_NAME')+"' "+ms.uiEvent(formId, 'CPI_NAME')+" title='"+ms.titleAttr(formId,'CPI_NAME','IS_TITLE_ATTR',v)+"' >"+v['CPI_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CPI_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'CPI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CPI_MODEL_CODE')+">")
            arrHtml.push("<span colno='CPI_MODEL_CODE' class='"+ms.uiClass(formId, 'CPI_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'CPI_MODEL_CODE')+"' "+ms.uiEvent(formId, 'CPI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CPI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['CPI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPI_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CPI_PRODUCT_STEP')+"' style='text-align:center;"+ms.tdStyle(formId, 'CPI_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CPI_PRODUCT_STEP')+">")
            arrHtml.push("<span colno='CPI_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CPI_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CPI_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CPI_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'CPI_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['CPI_PRODUCT_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CPI_PROCESS_FACE')+"' style='text-align:center;"+ms.tdStyle(formId, 'CPI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CPI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='CPI_PROCESS_FACE' class='"+ms.uiClass(formId, 'CPI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CPI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CPI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CPI_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['CPI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPI_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'CPI_GROUP')+"' style='text-align:center;"+ms.tdStyle(formId, 'CPI_GROUP')+"' "+ms.tdEvent(formId, 'CPI_GROUP')+">")
            arrHtml.push("<span colno='CPI_GROUP' class='"+ms.uiClass(formId, 'CPI_GROUP')+"' style='"+ms.uiStyle(formId, 'CPI_GROUP')+"' "+ms.uiEvent(formId, 'CPI_GROUP')+" title='"+ms.titleAttr(formId,'CPI_GROUP','IS_TITLE_ATTR',v)+"' >"+v['CPI_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPI_VERSION' class='datagrid-cell "+ms.tdClass(formId, 'CPI_VERSION')+"' style='text-align:center;"+ms.tdStyle(formId, 'CPI_VERSION')+"' "+ms.tdEvent(formId, 'CPI_VERSION')+">")
            arrHtml.push("<span colno='CPI_VERSION' class='"+ms.uiClass(formId, 'CPI_VERSION')+"' style='"+ms.uiStyle(formId, 'CPI_VERSION')+"' "+ms.uiEvent(formId, 'CPI_VERSION')+" title='"+ms.titleAttr(formId,'CPI_VERSION','IS_TITLE_ATTR',v)+"' >"+v['CPI_VERSION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CPI_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CPI_DEFAULT_FLAG')+"' style='text-align:center;"+ms.tdStyle(formId, 'CPI_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'CPI_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='CPI_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'CPI_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'CPI_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'CPI_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'CPI_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CPI_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='text-align:center;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td style='display:none;'>")
            arrHtml.push("<span id='CPI_SYS_NAME_"+v.ID+"' colno='CPI_SYS_NAME' class='"+ms.uiClass(formId, 'CPI_SYS_NAME')+"' style='"+ms.uiStyle(formId, 'CPI_SYS_NAME')+"' "+ms.uiEvent(formId, 'CPI_SYS_NAME')+" >"+v['CPI_SYS_NAME']+"</span>")
                //arrHtml.push("<span id='CPI_SYS_NAME_"+v.ID+"' >"+uiRaw[i].CPI_SYS_NAME+"</span>")
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
