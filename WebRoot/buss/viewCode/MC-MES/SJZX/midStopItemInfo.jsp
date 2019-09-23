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
		<dict:lang value="VM-SMT物料信息" />
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
		<bu:header formId ="6f801ac8b9d3427ab3475c3b838e90ef"/>

    
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
		<bu:func viewId="177671e58f4c4d21a857411ba1f43f97" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="177671e58f4c4d21a857411ba1f43f97" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6f801ac8b9d3427ab3475c3b838e90ef" id="formPage6f801ac8b9d3427ab3475c3b838e90ef" value="${formPage6f801ac8b9d3427ab3475c3b838e90ef}"/>
		<input type="hidden" name="formId" id="formId1" value='6f801ac8b9d3427ab3475c3b838e90ef'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6f801ac8b9d3427ab3475c3b838e90ef">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6f801ac8b9d3427ab3475c3b838e90ef" style="overflow-x:hidden;">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6f801ac8b9d3427ab3475c3b838e90ef">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6f801ac8b9d3427ab3475c3b838e90ef" >
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="6f801ac8b9d3427ab3475c3b838e90ef" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6f801ac8b9d3427ab3475c3b838e90ef" onclick="_selectAjaxTableAllData(this,'6f801ac8b9d3427ab3475c3b838e90ef')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center" ><bu:uitn colNo="DATA_AUTH" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="MSI_DOC_NUM" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:200px;"><bu:uitn colNo="MSI_ITEM_SN" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="MSI_ITEM_CODE" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="MSI_ITEM_NAME" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="MSI_ITEM_SPEC" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center" ><bu:uitn colNo="MSI_ITEM_COUNT" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="MSI_LOT_NUMBER" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="MSI_MARK_CODE" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="MSI_PRODUCT_PLACE" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:120px; text-align:center" ><bu:uitn colNo="MSI_ITEM_SUPPLIERS" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:140px;"><bu:uitn colNo="MSI_TIME" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
			<td class="datagrid-cell" style="width:80px; text-align:center" ><bu:uitn colNo="MSI_EMP" formId="6f801ac8b9d3427ab3475c3b838e90ef" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6f801ac8b9d3427ab3475c3b838e90ef" onscroll="ajaxTableScroll(this,'6f801ac8b9d3427ab3475c3b838e90ef')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6f801ac8b9d3427ab3475c3b838e90ef" >
		<tbody id="tbody_6f801ac8b9d3427ab3475c3b838e90ef" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6f801ac8b9d3427ab3475c3b838e90ef==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6f801ac8b9d3427ab3475c3b838e90ef&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="177671e58f4c4d21a857411ba1f43f97" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="177671e58f4c4d21a857411ba1f43f97" />
    
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
    if(formId=='6f801ac8b9d3427ab3475c3b838e90ef'){<%--FM-SMT物料信息--%>
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
            arrHtml.push("<td colno='MSI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'MSI_DOC_NUM')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'MSI_DOC_NUM')+"' "+ms.tdEvent(formId, 'MSI_DOC_NUM')+">")
            arrHtml.push("<span colno='MSI_DOC_NUM' class='"+ms.uiClass(formId, 'MSI_DOC_NUM')+"' onclick='itemJump1(\""+v['MSI_DOC_NUM']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'MSI_DOC_NUM')+" title='"+ms.titleAttr(formId,'MSI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['MSI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'MSI_ITEM_SN')+"' style='width:200px;text-align:left;"+ms.tdStyle(formId, 'MSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'MSI_ITEM_SN')+">")
            arrHtml.push("<span colno='MSI_ITEM_SN' class='"+ms.uiClass(formId, 'MSI_ITEM_SN')+"' onclick='itemJump2(\""+v['MSI_ITEM_SN']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'MSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'MSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['MSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'MSI_ITEM_CODE')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'MSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'MSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='MSI_ITEM_CODE' class='"+ms.uiClass(formId, 'MSI_ITEM_CODE')+"' onclick='itemJump3(\""+v['MSI_ITEM_CODE']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'MSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'MSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['MSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'MSI_ITEM_NAME')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'MSI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'MSI_ITEM_NAME')+">")
            arrHtml.push("<span colno='MSI_ITEM_NAME' class='"+ms.uiClass(formId, 'MSI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'MSI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'MSI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'MSI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['MSI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'MSI_ITEM_SPEC')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'MSI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'MSI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='MSI_ITEM_SPEC' class='"+ms.uiClass(formId, 'MSI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'MSI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'MSI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'MSI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['MSI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_ITEM_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'MSI_ITEM_COUNT')+"' style='width:80px;text-align:right;"+ms.tdStyle(formId, 'MSI_ITEM_COUNT')+"' "+ms.tdEvent(formId, 'MSI_ITEM_COUNT')+">")
            arrHtml.push("<span colno='MSI_ITEM_COUNT' class='"+ms.uiClass(formId, 'MSI_ITEM_COUNT')+"' style='"+ms.uiStyle(formId, 'MSI_ITEM_COUNT')+"' "+ms.uiEvent(formId, 'MSI_ITEM_COUNT')+" title='"+ms.titleAttr(formId,'MSI_ITEM_COUNT','IS_TITLE_ATTR',v)+"' >"+v['MSI_ITEM_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MSI_LOT_NUMBER')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'MSI_LOT_NUMBER')+"' "+ms.tdEvent(formId, 'MSI_LOT_NUMBER')+">")
            arrHtml.push("<span colno='MSI_LOT_NUMBER' class='"+ms.uiClass(formId, 'MSI_LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'MSI_LOT_NUMBER')+"' "+ms.uiEvent(formId, 'MSI_LOT_NUMBER')+" title='"+ms.titleAttr(formId,'MSI_LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MSI_LOT_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_MARK_CODE' class='datagrid-cell "+ms.tdClass(formId, 'MSI_MARK_CODE')+"' style='width:120px;text-align:left;"+ms.tdStyle(formId, 'MSI_MARK_CODE')+"' "+ms.tdEvent(formId, 'MSI_MARK_CODE')+">")
            arrHtml.push("<span colno='MSI_MARK_CODE' class='"+ms.uiClass(formId, 'MSI_MARK_CODE')+"' style='"+ms.uiStyle(formId, 'MSI_MARK_CODE')+"' "+ms.uiEvent(formId, 'MSI_MARK_CODE')+" title='"+ms.titleAttr(formId,'MSI_MARK_CODE','IS_TITLE_ATTR',v)+"' >"+v['MSI_MARK_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_PRODUCT_PLACE' class='datagrid-cell "+ms.tdClass(formId, 'MSI_PRODUCT_PLACE')+"' style='width:120px;"+ms.tdStyle(formId, 'MSI_PRODUCT_PLACE')+"' "+ms.tdEvent(formId, 'MSI_PRODUCT_PLACE')+">")
            arrHtml.push("<span colno='MSI_PRODUCT_PLACE' class='"+ms.uiClass(formId, 'MSI_PRODUCT_PLACE')+"' style='"+ms.uiStyle(formId, 'MSI_PRODUCT_PLACE')+"' "+ms.uiEvent(formId, 'MSI_PRODUCT_PLACE')+" title='"+ms.titleAttr(formId,'MSI_PRODUCT_PLACE','IS_TITLE_ATTR',v)+"' >"+v['MSI_PRODUCT_PLACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_ITEM_SUPPLIERS' class='datagrid-cell "+ms.tdClass(formId, 'MSI_ITEM_SUPPLIERS')+"' style='width:120px;text-align:center;"+ms.tdStyle(formId, 'MSI_ITEM_SUPPLIERS')+"' "+ms.tdEvent(formId, 'MSI_ITEM_SUPPLIERS')+">")
            arrHtml.push("<span colno='MSI_ITEM_SUPPLIERS' class='"+ms.uiClass(formId, 'MSI_ITEM_SUPPLIERS')+"' style='"+ms.uiStyle(formId, 'MSI_ITEM_SUPPLIERS')+"' "+ms.uiEvent(formId, 'MSI_ITEM_SUPPLIERS')+" title='"+ms.titleAttr(formId,'MSI_ITEM_SUPPLIERS','IS_TITLE_ATTR',v)+"' >"+v['MSI_ITEM_SUPPLIERS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_TIME' class='datagrid-cell "+ms.tdClass(formId, 'MSI_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'MSI_TIME')+"' "+ms.tdEvent(formId, 'MSI_TIME')+">")
            arrHtml.push("<span colno='MSI_TIME' class='"+ms.uiClass(formId, 'MSI_TIME')+"' style='"+ms.uiStyle(formId, 'MSI_TIME')+"' "+ms.uiEvent(formId, 'MSI_TIME')+" title='"+ms.titleAttr(formId,'MSI_TIME','IS_TITLE_ATTR',v)+"' >"+v['MSI_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MSI_EMP' class='datagrid-cell "+ms.tdClass(formId, 'MSI_EMP')+"' style='width:80px;text-align:center;"+ms.tdStyle(formId, 'MSI_EMP')+"' "+ms.tdEvent(formId, 'MSI_EMP')+">")
            arrHtml.push("<span colno='MSI_EMP' class='"+ms.uiClass(formId, 'MSI_EMP')+"' style='"+ms.uiStyle(formId, 'MSI_EMP')+"' "+ms.uiEvent(formId, 'MSI_EMP')+" title='"+ms.titleAttr(formId,'MSI_EMP','IS_TITLE_ATTR',v)+"' >"+v['MSI_EMP']+"</span>")
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
                  $("#MSI_DOC_NUM").val(jumpId);
                  
                  }                
                  listAjaxTable($("#formId1").val());
                    //listAjaxTable_print($("#formId1").val());
                    
                 }
 
</script>
<script type="text/javascript" src="${path}buss/js/common.js"></script>
<script>

//生产领料
function itemJump1(obj){
      winOptMethod.jump("b1bd96ced2af4ca1af9ea4e8dd2886a7","F6725","jumpId",obj);
}  


//物料追溯
function itemJump2(obj){
    winOptMethod.jump("0b0276d9a6e3422592e30a48ad93b418","F10790","jumpId",obj);
} 

//物料信息
function itemJump3(obj){
    winOptMethod.jump("15e211df6f9d435088ad89c31837ef5f","F3428","jumpId",obj);
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
