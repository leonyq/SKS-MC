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
		<dict:lang value="二次送检列表" />
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
		<bu:header formId ="eb13d75bea1f47be9f506048e71bd60d"/>

    
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
		<bu:func viewId="ed1ec5209b49497aab502be2e724e6b3" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="ed1ec5209b49497aab502be2e724e6b3" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageeb13d75bea1f47be9f506048e71bd60d" id="formPageeb13d75bea1f47be9f506048e71bd60d" value="${formPageeb13d75bea1f47be9f506048e71bd60d}"/>
		<input type="hidden" name="formId" id="formId1" value='eb13d75bea1f47be9f506048e71bd60d'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="eb13d75bea1f47be9f506048e71bd60d">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxeb13d75bea1f47be9f506048e71bd60d" style="min-width:1730px;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innereb13d75bea1f47be9f506048e71bd60d">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableeb13d75bea1f47be9f506048e71bd60d">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="eb13d75bea1f47be9f506048e71bd60d" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_eb13d75bea1f47be9f506048e71bd60d" onclick="_selectAjaxTableAllData(this,'eb13d75bea1f47be9f506048e71bd60d')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSC_INSPECT_NEWSN" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSC_INSPECT_OLDSN" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_TEST_STEP" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QSC_SAMPLE_TYPE" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSC_ITEM_CODE" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSC_ITEM_NAME" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSC_ITEM_SPEC" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QSC_SUPPLIER_CODE" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:100px;"><bu:uitn colNo="QSC_CUSTOMER_CODE" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_SEND_NUM" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_TARGET_NUM" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSC_CONNECT_DOC" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="QSC_INSEPCT_TIME" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
			<td class="datagrid-cell" style="width:80px;"><bu:uitn colNo="QSC_INSEPCT_EMP" formId="eb13d75bea1f47be9f506048e71bd60d" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiveb13d75bea1f47be9f506048e71bd60d" onscroll="ajaxTableScroll(this,'eb13d75bea1f47be9f506048e71bd60d')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxeb13d75bea1f47be9f506048e71bd60d" style="min-width:1730px;">
		<tbody id="tbody_eb13d75bea1f47be9f506048e71bd60d" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageeb13d75bea1f47be9f506048e71bd60d==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=eb13d75bea1f47be9f506048e71bd60d&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="ed1ec5209b49497aab502be2e724e6b3" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="ed1ec5209b49497aab502be2e724e6b3" />
    
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
    if(formId=='eb13d75bea1f47be9f506048e71bd60d'){<%--二次送检日志信息--%>
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
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='QSC_INSPECT_NEWSN' class='datagrid-cell "+ms.tdClass(formId, 'QSC_INSPECT_NEWSN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSC_INSPECT_NEWSN')+"' "+ms.tdEvent(formId, 'QSC_INSPECT_NEWSN')+">")
            arrHtml.push("<span colno='QSC_INSPECT_NEWSN' class='"+ms.uiClass(formId, 'QSC_INSPECT_NEWSN')+"' onclick='itemJump1(\""+v['QSC_INSPECT_NEWSN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QSC_INSPECT_NEWSN')+" title='"+ms.titleAttr(formId,'QSC_INSPECT_NEWSN','IS_TITLE_ATTR',v)+"' >"+v['QSC_INSPECT_NEWSN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_INSPECT_OLDSN' class='datagrid-cell "+ms.tdClass(formId, 'QSC_INSPECT_OLDSN')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSC_INSPECT_OLDSN')+"' "+ms.tdEvent(formId, 'QSC_INSPECT_OLDSN')+">")
            arrHtml.push("<span colno='QSC_INSPECT_OLDSN' class='"+ms.uiClass(formId, 'QSC_INSPECT_OLDSN')+"' onclick='itemJump2(\""+v['QSC_INSPECT_OLDSN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QSC_INSPECT_OLDSN')+" title='"+ms.titleAttr(formId,'QSC_INSPECT_OLDSN','IS_TITLE_ATTR',v)+"' >"+v['QSC_INSPECT_OLDSN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_TEST_STEP' class='datagrid-cell "+ms.tdClass(formId, 'QSC_TEST_STEP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSC_TEST_STEP')+"' "+ms.tdEvent(formId, 'QSC_TEST_STEP')+">")
            arrHtml.push("<span colno='QSC_TEST_STEP' class='"+ms.uiClass(formId, 'QSC_TEST_STEP')+"' style='"+ms.uiStyle(formId, 'QSC_TEST_STEP')+"' "+ms.uiEvent(formId, 'QSC_TEST_STEP')+" title='"+ms.titleAttr(formId,'QSC_TEST_STEP','IS_TITLE_ATTR',v)+"' >"+v['QSC_TEST_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_SAMPLE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_SAMPLE_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'QSC_SAMPLE_TYPE')+"' "+ms.tdEvent(formId, 'QSC_SAMPLE_TYPE')+">")
            arrHtml.push("<span colno='QSC_SAMPLE_TYPE' class='"+ms.uiClass(formId, 'QSC_SAMPLE_TYPE')+"' style='"+ms.uiStyle(formId, 'QSC_SAMPLE_TYPE')+"' "+ms.uiEvent(formId, 'QSC_SAMPLE_TYPE')+" title='"+ms.titleAttr(formId,'QSC_SAMPLE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['QSC_SAMPLE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_ITEM_CODE')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSC_ITEM_CODE')+"' "+ms.tdEvent(formId, 'QSC_ITEM_CODE')+">")
            arrHtml.push("<span colno='QSC_ITEM_CODE' class='"+ms.uiClass(formId, 'QSC_ITEM_CODE')+"' onclick='itemJump3(\""+v['QSC_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QSC_ITEM_CODE')+" title='"+ms.titleAttr(formId,'QSC_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['QSC_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'QSC_ITEM_NAME')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSC_ITEM_NAME')+"' "+ms.tdEvent(formId, 'QSC_ITEM_NAME')+">")
            arrHtml.push("<span colno='QSC_ITEM_NAME' class='"+ms.uiClass(formId, 'QSC_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'QSC_ITEM_NAME')+"' "+ms.uiEvent(formId, 'QSC_ITEM_NAME')+" title='"+ms.titleAttr(formId,'QSC_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['QSC_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'QSC_ITEM_SPEC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSC_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'QSC_ITEM_SPEC')+">")
            arrHtml.push("<span colno='QSC_ITEM_SPEC' class='"+ms.uiClass(formId, 'QSC_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'QSC_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'QSC_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'QSC_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['QSC_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_SUPPLIER_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_SUPPLIER_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'QSC_SUPPLIER_CODE')+"' "+ms.tdEvent(formId, 'QSC_SUPPLIER_CODE')+">")
            arrHtml.push("<span colno='QSC_SUPPLIER_CODE' class='"+ms.uiClass(formId, 'QSC_SUPPLIER_CODE')+"' style='"+ms.uiStyle(formId, 'QSC_SUPPLIER_CODE')+"' "+ms.uiEvent(formId, 'QSC_SUPPLIER_CODE')+" title='"+ms.titleAttr(formId,'QSC_SUPPLIER_CODE','IS_TITLE_ATTR',v)+"' >"+v['QSC_SUPPLIER_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_CUSTOMER_CODE' class='datagrid-cell "+ms.tdClass(formId, 'QSC_CUSTOMER_CODE')+"' style='width:100px;text-align:left;"+ms.tdStyle(formId, 'QSC_CUSTOMER_CODE')+"' "+ms.tdEvent(formId, 'QSC_CUSTOMER_CODE')+">")
            arrHtml.push("<span colno='QSC_CUSTOMER_CODE' class='"+ms.uiClass(formId, 'QSC_CUSTOMER_CODE')+"' style='"+ms.uiStyle(formId, 'QSC_CUSTOMER_CODE')+"' "+ms.uiEvent(formId, 'QSC_CUSTOMER_CODE')+" title='"+ms.titleAttr(formId,'QSC_CUSTOMER_CODE','IS_TITLE_ATTR',v)+"' >"+v['QSC_CUSTOMER_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_SEND_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QSC_SEND_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QSC_SEND_NUM')+"' "+ms.tdEvent(formId, 'QSC_SEND_NUM')+">")
            arrHtml.push("<span colno='QSC_SEND_NUM' class='"+ms.uiClass(formId, 'QSC_SEND_NUM')+"' style='"+ms.uiStyle(formId, 'QSC_SEND_NUM')+"' "+ms.uiEvent(formId, 'QSC_SEND_NUM')+" title='"+ms.titleAttr(formId,'QSC_SEND_NUM','IS_TITLE_ATTR',v)+"' >"+v['QSC_SEND_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_TARGET_NUM' class='datagrid-cell "+ms.tdClass(formId, 'QSC_TARGET_NUM')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'QSC_TARGET_NUM')+"' "+ms.tdEvent(formId, 'QSC_TARGET_NUM')+">")
            arrHtml.push("<span colno='QSC_TARGET_NUM' class='"+ms.uiClass(formId, 'QSC_TARGET_NUM')+"' style='"+ms.uiStyle(formId, 'QSC_TARGET_NUM')+"' "+ms.uiEvent(formId, 'QSC_TARGET_NUM')+" title='"+ms.titleAttr(formId,'QSC_TARGET_NUM','IS_TITLE_ATTR',v)+"' >"+v['QSC_TARGET_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_CONNECT_DOC' class='datagrid-cell "+ms.tdClass(formId, 'QSC_CONNECT_DOC')+"' style='width:150px;text-align:left;"+ms.tdStyle(formId, 'QSC_CONNECT_DOC')+"' "+ms.tdEvent(formId, 'QSC_CONNECT_DOC')+">")
            arrHtml.push("<span colno='QSC_CONNECT_DOC' class='"+ms.uiClass(formId, 'QSC_CONNECT_DOC')+"' onclick='itemJump4(\""+v['QSC_CONNECT_DOC']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'QSC_CONNECT_DOC')+" title='"+ms.titleAttr(formId,'QSC_CONNECT_DOC','IS_TITLE_ATTR',v)+"' >"+v['QSC_CONNECT_DOC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_INSEPCT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'QSC_INSEPCT_TIME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'QSC_INSEPCT_TIME')+"' "+ms.tdEvent(formId, 'QSC_INSEPCT_TIME')+">")
            arrHtml.push("<span colno='QSC_INSEPCT_TIME' class='"+ms.uiClass(formId, 'QSC_INSEPCT_TIME')+"' style='"+ms.uiStyle(formId, 'QSC_INSEPCT_TIME')+"' "+ms.uiEvent(formId, 'QSC_INSEPCT_TIME')+" title='"+ms.titleAttr(formId,'QSC_INSEPCT_TIME','IS_TITLE_ATTR',v)+"' >"+v['QSC_INSEPCT_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='QSC_INSEPCT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'QSC_INSEPCT_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'QSC_INSEPCT_EMP')+"' "+ms.tdEvent(formId, 'QSC_INSEPCT_EMP')+">")
            arrHtml.push("<span colno='QSC_INSEPCT_EMP' class='"+ms.uiClass(formId, 'QSC_INSEPCT_EMP')+"' style='"+ms.uiStyle(formId, 'QSC_INSEPCT_EMP')+"' "+ms.uiEvent(formId, 'QSC_INSEPCT_EMP')+" title='"+ms.titleAttr(formId,'QSC_INSEPCT_EMP','IS_TITLE_ATTR',v)+"' >"+v['QSC_INSEPCT_EMP']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    //setNumColWidth(formId);
    //clearAllSelect();
    //setTableWidth(formId);
    //setScroll();
    
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    if(isFirstSetScroll == 0){setScroll();}
    isFirstSetScroll++;
}

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//品质检验单
function itemJump1(obj){
      winOptMethod.jump("905fce48212c4ce9beecd8bdf72e2a72","F11330","jumpId",obj);
}  


//品质检验单
function itemJump2(obj){
    winOptMethod.jump("905fce48212c4ce9beecd8bdf72e2a72","F11330","jumpId",obj);
} 

//物料信息
function itemJump3(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
} 

//仓库单据信息
function itemJump4(obj){
  winOptMethod.jump("f4c3cfb840234a24b5ac7135d783b7e3","F7011","jumpId",obj);
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
