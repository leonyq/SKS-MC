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
		<dict:lang value="制具履历" />
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
		<bu:header formId ="394edf1e00694f07926e12e70ddeb7bb"/>

    
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
		<bu:func viewId="68260cc1824b481693825d3f54658ad0" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="68260cc1824b481693825d3f54658ad0" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage394edf1e00694f07926e12e70ddeb7bb" id="formPage394edf1e00694f07926e12e70ddeb7bb" value="${formPage394edf1e00694f07926e12e70ddeb7bb}"/>
		<input type="hidden" name="formId" id="formId1" value='394edf1e00694f07926e12e70ddeb7bb'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="394edf1e00694f07926e12e70ddeb7bb">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax394edf1e00694f07926e12e70ddeb7bb" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner394edf1e00694f07926e12e70ddeb7bb">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable394edf1e00694f07926e12e70ddeb7bb" style="min-width:1600px;">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="394edf1e00694f07926e12e70ddeb7bb" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_394edf1e00694f07926e12e70ddeb7bb" onclick="_selectAjaxTableAllData(this,'394edf1e00694f07926e12e70ddeb7bb')" style="cursor: pointer;"title="全选"/></span></td>
			 <td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="DATA_AUTH" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="CFO_FIX_SN" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="CFO_OPERATE_TYPE" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="CFO_ITEM_TYPE" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="CFO_ITEM_CODE" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="CFO_ITEM_NAME" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="CFO_ITEM_SPEC" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<!--<td class="datagrid-cell"  style="width:100px;"><bu:uitn colNo="CFO_TIN_LOT" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>-->
			<td class="datagrid-cell"  style="width:140px;"><bu:uitn colNo="CFO_OPERATE_TIME" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<td class="datagrid-cell"  style="width:140px;"><bu:uitn colNo="T2#NAME" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
		<!--	<td class="datagrid-cell"  style="width:140px;"><bu:uitn colNo="CFO_OPEATOR" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>-->
			<td class="datagrid-cell"  style="width:80px;"><bu:uitn colNo="CFO_ITEM_CURUSER" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<td class="datagrid-cell"  style="width:200px;"><bu:uitn colNo="CFI_MEMO" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv394edf1e00694f07926e12e70ddeb7bb" onscroll="ajaxTableScroll(this,'394edf1e00694f07926e12e70ddeb7bb')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax394edf1e00694f07926e12e70ddeb7bb" style="min-width:1600px;">
		<tbody id="tbody_394edf1e00694f07926e12e70ddeb7bb" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage394edf1e00694f07926e12e70ddeb7bb==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=394edf1e00694f07926e12e70ddeb7bb&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="68260cc1824b481693825d3f54658ad0" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="68260cc1824b481693825d3f54658ad0" />
    
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
    if(formId=='394edf1e00694f07926e12e70ddeb7bb'){<%--FM-制具履历--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
           // arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            //arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFO_FIX_SN' class='datagrid-cell "+ms.tdClass(formId, 'CFO_FIX_SN')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CFO_FIX_SN')+"' "+ms.tdEvent(formId, 'CFO_FIX_SN')+">")
            arrHtml.push("<span colno='CFO_FIX_SN' class='"+ms.uiClass(formId, 'CFO_FIX_SN')+"' onclick='itemJump1(\""+v['CFO_FIX_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CFO_FIX_SN')+" title='"+ms.titleAttr(formId,'CFO_FIX_SN','IS_TITLE_ATTR',v)+"' >"+v['CFO_FIX_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFO_OPERATE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CFO_OPERATE_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CFO_OPERATE_TYPE')+"' "+ms.tdEvent(formId, 'CFO_OPERATE_TYPE')+">")
            arrHtml.push("<span colno='CFO_OPERATE_TYPE' class='"+ms.uiClass(formId, 'CFO_OPERATE_TYPE')+"' style='"+ms.uiStyle(formId, 'CFO_OPERATE_TYPE')+"' "+ms.uiEvent(formId, 'CFO_OPERATE_TYPE')+" title='"+ms.titleAttr(formId,'CFO_OPERATE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CFO_OPERATE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFO_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CFO_ITEM_TYPE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CFO_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'CFO_ITEM_TYPE')+">")
            arrHtml.push("<span colno='CFO_ITEM_TYPE' class='"+ms.uiClass(formId, 'CFO_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'CFO_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'CFO_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'CFO_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CFO_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFO_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CFO_ITEM_CODE')+"'style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CFO_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CFO_ITEM_CODE')+">")
            arrHtml.push("<span colno='CFO_ITEM_CODE' class='"+ms.uiClass(formId, 'CFO_ITEM_CODE')+"' onclick='itemJump2(\""+v['CFO_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'CFO_ITEM_CODE')+" title='"+ms.titleAttr(formId,'CFO_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['CFO_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFO_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CFO_ITEM_NAME')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CFO_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CFO_ITEM_NAME')+">")
            arrHtml.push("<span colno='CFO_ITEM_NAME' class='"+ms.uiClass(formId, 'CFO_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CFO_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CFO_ITEM_NAME')+" title='"+ms.titleAttr(formId,'CFO_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['CFO_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFO_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CFO_ITEM_SPEC')+"'style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CFO_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CFO_ITEM_SPEC')+">")
            arrHtml.push("<span colno='CFO_ITEM_SPEC' class='"+ms.uiClass(formId, 'CFO_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CFO_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CFO_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'CFO_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['CFO_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
           /* arrHtml.push("<td colno='CFO_TIN_LOT' class='datagrid-cell "+ms.tdClass(formId, 'CFO_TIN_LOT')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'CFO_TIN_LOT')+"' "+ms.tdEvent(formId, 'CFO_TIN_LOT')+">")
            arrHtml.push("<span colno='CFO_TIN_LOT' class='"+ms.uiClass(formId, 'CFO_TIN_LOT')+"' style='"+ms.uiStyle(formId, 'CFO_TIN_LOT')+"' "+ms.uiEvent(formId, 'CFO_TIN_LOT')+" title='"+ms.titleAttr(formId,'CFO_TIN_LOT','IS_TITLE_ATTR',v)+"' >"+v['CFO_TIN_LOT']+"</span>")
            arrHtml.push("</td>");*/
            arrHtml.push("<td colno='CFO_OPERATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CFO_OPERATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CFO_OPERATE_TIME')+"' "+ms.tdEvent(formId, 'CFO_OPERATE_TIME')+">")
            arrHtml.push("<span colno='CFO_OPERATE_TIME' class='"+ms.uiClass(formId, 'CFO_OPERATE_TIME')+"' style='"+ms.uiStyle(formId, 'CFO_OPERATE_TIME')+"' "+ms.uiEvent(formId, 'CFO_OPERATE_TIME')+" title='"+ms.titleAttr(formId,'CFO_OPERATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CFO_OPERATE_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#NAME')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'T2#NAME')+"' "+ms.tdEvent(formId, 'T2#NAME')+">")
            arrHtml.push("<span colno='T2#NAME' class='"+ms.uiClass(formId, 'T2#NAME')+"' style='"+ms.uiStyle(formId, 'T2#NAME')+"' "+ms.uiEvent(formId, 'T2#NAME')+" title='"+ms.titleAttr(formId,'T2#NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#NAME']+"</span>")
            arrHtml.push("</td>");
           /* arrHtml.push("<td colno='CFO_OPEATOR' class='datagrid-cell "+ms.tdClass(formId, 'CFO_OPEATOR')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFO_OPEATOR')+"' "+ms.tdEvent(formId, 'CFO_OPEATOR')+">")
            arrHtml.push("<span colno='CFO_OPEATOR' class='"+ms.uiClass(formId, 'CFO_OPEATOR')+"' style='"+ms.uiStyle(formId, 'CFO_OPEATOR')+"' "+ms.uiEvent(formId, 'CFO_OPEATOR')+" title='"+ms.titleAttr(formId,'CFO_OPEATOR','IS_TITLE_ATTR',v)+"' >"+v['CFO_OPEATOR']+"</span>")
            arrHtml.push("</td>");*/
            arrHtml.push("<td colno='CFO_ITEM_CURUSER' class='datagrid-cell "+ms.tdClass(formId, 'CFO_ITEM_CURUSER')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'CFO_ITEM_CURUSER')+"' "+ms.tdEvent(formId, 'CFO_ITEM_CURUSER')+">")
            arrHtml.push("<span colno='CFO_ITEM_CURUSER' class='"+ms.uiClass(formId, 'CFO_ITEM_CURUSER')+"' style='"+ms.uiStyle(formId, 'CFO_ITEM_CURUSER')+"' "+ms.uiEvent(formId, 'CFO_ITEM_CURUSER')+" title='"+ms.titleAttr(formId,'CFO_ITEM_CURUSER','IS_TITLE_ATTR',v)+"' >"+v['CFO_ITEM_CURUSER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CFI_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CFI_MEMO')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'CFI_MEMO')+"' "+ms.tdEvent(formId, 'CFI_MEMO')+">")
            arrHtml.push("<span colno='CFI_MEMO' class='"+ms.uiClass(formId, 'CFI_MEMO')+"' style='"+ms.uiStyle(formId, 'CFI_MEMO')+"' "+ms.uiEvent(formId, 'CFI_MEMO')+" title='"+ms.titleAttr(formId,'CFI_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CFI_MEMO']+"</span>")
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

function init(){
            
  
                    if($(".leftTable-ajax").length>0){
                        $(".leftTable-ajax").show();
                    };
                    getFormIdInitChildPage();
                    initTableWidth();
                    var jumpId = $("#jumpId").val();  
              		if(jumpId!=""){
                  $("#CFO_FIX_SN").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }

</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//制具信息
function itemJump1(obj){
      winOptMethod.jump("5624fca2e39c49f7bea95e1614c232da","F3496","jumpId",obj);
}  
//辅料制具料号
function itemJump2(obj){
      winOptMethod.jump("8d8dfef2f0e140e88073f6cdad4b431d","F3722","jumpId",obj);
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
