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
		<dict:lang value="物流信息维护" />
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
		<bu:header formId ="2bfba5b0e9cf4cff9ac83c0a016f05e1"/>

    
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
		<bu:func viewId="a8ea26db47a64d24af1be79a1901cb28" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="a8ea26db47a64d24af1be79a1901cb28" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage2bfba5b0e9cf4cff9ac83c0a016f05e1" id="formPage2bfba5b0e9cf4cff9ac83c0a016f05e1" value="${formPage2bfba5b0e9cf4cff9ac83c0a016f05e1}"/>
		<input type="hidden" name="formId" id="formId1" value='2bfba5b0e9cf4cff9ac83c0a016f05e1'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="2bfba5b0e9cf4cff9ac83c0a016f05e1">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2bfba5b0e9cf4cff9ac83c0a016f05e1" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner2bfba5b0e9cf4cff9ac83c0a016f05e1">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2bfba5b0e9cf4cff9ac83c0a016f05e1">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="2bfba5b0e9cf4cff9ac83c0a016f05e1" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_2bfba5b0e9cf4cff9ac83c0a016f05e1" onclick="_selectAjaxTableAllData(this,'2bfba5b0e9cf4cff9ac83c0a016f05e1')" style="cursor: pointer;"title="全选"/></span></td>
		    <td class="datagrid-cell" style="width:200px; text-align:center"><bu:uitn colNo="DATA_AUTH" formId="2bfba5b0e9cf4cff9ac83c0a016f05e1" /></td>
		    <td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="LOGISTICS_COMPANY" formId="2bfba5b0e9cf4cff9ac83c0a016f05e1" /></td>
		    <td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PLATE_NUMBER" formId="2bfba5b0e9cf4cff9ac83c0a016f05e1" /></td>
			<td class="datagrid-cell" style="width:100px; text-align:center"><bu:uitn colNo="CONTACTS" formId="2bfba5b0e9cf4cff9ac83c0a016f05e1" /></td>
			<td class="datagrid-cell" style="width:150px; text-align:center"><bu:uitn colNo="PHONE_NUMBER" formId="2bfba5b0e9cf4cff9ac83c0a016f05e1" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv2bfba5b0e9cf4cff9ac83c0a016f05e1" onscroll="ajaxTableScroll(this,'2bfba5b0e9cf4cff9ac83c0a016f05e1')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2bfba5b0e9cf4cff9ac83c0a016f05e1">
		<tbody id="tbody_2bfba5b0e9cf4cff9ac83c0a016f05e1" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage2bfba5b0e9cf4cff9ac83c0a016f05e1==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=2bfba5b0e9cf4cff9ac83c0a016f05e1&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="a8ea26db47a64d24af1be79a1901cb28" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="a8ea26db47a64d24af1be79a1901cb28" />
    
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
    if(formId=='2bfba5b0e9cf4cff9ac83c0a016f05e1'){<%--FM-物流信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
           // arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
           //arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID' value='"+v['DATA_AUTH_ID']+"' />")
           // arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")		
	        arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />")		
	        arrHtml.push("</td>");
            arrHtml.push("<td colno='LOGISTICS_COMPANY' class='datagrid-cell "+ms.tdClass(formId, 'LOGISTICS_COMPANY')+"' style='width:150px;"+ms.tdStyle(formId, 'LOGISTICS_COMPANY')+"' "+ms.tdEvent(formId, 'LOGISTICS_COMPANY')+">")
            arrHtml.push("<span colno='LOGISTICS_COMPANY' class='"+ms.uiClass(formId, 'LOGISTICS_COMPANY')+"' style='"+ms.uiStyle(formId, 'LOGISTICS_COMPANY')+"' "+ms.uiEvent(formId, 'LOGISTICS_COMPANY')+" title='"+ms.titleAttr(formId,'LOGISTICS_COMPANY','IS_TITLE_ATTR',v)+"' >"+v['LOGISTICS_COMPANY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PLATE_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PLATE_NUMBER')+"' style='width:150px;text-align: center;"+ms.tdStyle(formId, 'PLATE_NUMBER')+"' "+ms.tdEvent(formId, 'PLATE_NUMBER')+">")
            arrHtml.push("<span colno='PLATE_NUMBER' class='"+ms.uiClass(formId, 'PLATE_NUMBER')+"' style='"+ms.uiStyle(formId, 'PLATE_NUMBER')+"' "+ms.uiEvent(formId, 'PLATE_NUMBER')+" title='"+ms.titleAttr(formId,'PLATE_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PLATE_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CONTACTS' class='datagrid-cell "+ms.tdClass(formId, 'CONTACTS')+"' style='width:100px;text-align: center;"+ms.tdStyle(formId, 'CONTACTS')+"' "+ms.tdEvent(formId, 'CONTACTS')+">")
            arrHtml.push("<span colno='CONTACTS' class='"+ms.uiClass(formId, 'CONTACTS')+"' style='"+ms.uiStyle(formId, 'CONTACTS')+"' "+ms.uiEvent(formId, 'CONTACTS')+" title='"+ms.titleAttr(formId,'CONTACTS','IS_TITLE_ATTR',v)+"' >"+v['CONTACTS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PHONE_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PHONE_NUMBER')+"' style='width:150px;"+ms.tdStyle(formId, 'PHONE_NUMBER')+"' "+ms.tdEvent(formId, 'PHONE_NUMBER')+">")
            arrHtml.push("<span colno='PHONE_NUMBER' class='"+ms.uiClass(formId, 'PHONE_NUMBER')+"' style='text-align:center;"+ms.uiStyle(formId, 'PHONE_NUMBER')+"' "+ms.uiEvent(formId, 'PHONE_NUMBER')+" title='"+ms.titleAttr(formId,'PHONE_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PHONE_NUMBER']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
