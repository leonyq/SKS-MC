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
		<dict:lang value="员工葡萄图管理" />
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
		<bu:header formId ="fb66f7fc8c2f4978a861483d64b52ed2"/>

    
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
		<bu:func viewId="890ec800357b457da19fce9f1237f7bc" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="890ec800357b457da19fce9f1237f7bc" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagefb66f7fc8c2f4978a861483d64b52ed2" id="formPagefb66f7fc8c2f4978a861483d64b52ed2" value="${formPagefb66f7fc8c2f4978a861483d64b52ed2}"/>
		<input type="hidden" name="formId" id="formId1" value='fb66f7fc8c2f4978a861483d64b52ed2'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="fb66f7fc8c2f4978a861483d64b52ed2">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxfb66f7fc8c2f4978a861483d64b52ed2" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerfb66f7fc8c2f4978a861483d64b52ed2">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablefb66f7fc8c2f4978a861483d64b52ed2">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="fb66f7fc8c2f4978a861483d64b52ed2" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_fb66f7fc8c2f4978a861483d64b52ed2" onclick="_selectAjaxTableAllData(this,'fb66f7fc8c2f4978a861483d64b52ed2')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DATA_AUTH" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="DEPT_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="LOGIN_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="USER_NAME" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
			
			<td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="M_TOTAL_SCORE" formId="fb66f7fc8c2f4978a861483d64b52ed2" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivfb66f7fc8c2f4978a861483d64b52ed2" onscroll="ajaxTableScroll(this,'fb66f7fc8c2f4978a861483d64b52ed2')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxfb66f7fc8c2f4978a861483d64b52ed2">
		<tbody id="tbody_fb66f7fc8c2f4978a861483d64b52ed2" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagefb66f7fc8c2f4978a861483d64b52ed2==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=fb66f7fc8c2f4978a861483d64b52ed2&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="890ec800357b457da19fce9f1237f7bc" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="890ec800357b457da19fce9f1237f7bc" />
    
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
    if(formId=='fb66f7fc8c2f4978a861483d64b52ed2'){<%--员工葡萄管理--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px; text-align:center;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span>")
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /></td>");
            arrHtml.push("<td colno='DEPT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'DEPT_NAME')+"' style='width:200px; text-align:center;"+ms.tdStyle(formId, 'DEPT_NAME')+"' "+ms.tdEvent(formId, 'DEPT_NAME')+">")
            arrHtml.push("<span colno='DEPT_NAME' class='"+ms.uiClass(formId, 'DEPT_NAME')+"' style='"+ms.uiStyle(formId, 'DEPT_NAME')+"' "+ms.uiEvent(formId, 'DEPT_NAME')+" title='"+ms.titleAttr(formId,'DEPT_NAME','IS_TITLE_ATTR',v)+"' >"+v['DEPT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LOGIN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'LOGIN_NAME')+"' style='width:200px; text-align:center;"+ms.tdStyle(formId, 'LOGIN_NAME')+"' "+ms.tdEvent(formId, 'LOGIN_NAME')+">")
            arrHtml.push("<span colno='LOGIN_NAME' class='"+ms.uiClass(formId, 'LOGIN_NAME')+"' style='"+ms.uiStyle(formId, 'LOGIN_NAME')+"' "+ms.uiEvent(formId, 'LOGIN_NAME')+" title='"+ms.titleAttr(formId,'LOGIN_NAME','IS_TITLE_ATTR',v)+"' >"+v['LOGIN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='USER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'USER_NAME')+"' style='width:200px; text-align:center;"+ms.tdStyle(formId, 'USER_NAME')+"' "+ms.tdEvent(formId, 'USER_NAME')+">")
            arrHtml.push("<span colno='USER_NAME' class='"+ms.uiClass(formId, 'USER_NAME')+"' style='"+ms.uiStyle(formId, 'USER_NAME')+"' "+ms.uiEvent(formId, 'USER_NAME')+" title='"+ms.titleAttr(formId,'USER_NAME','IS_TITLE_ATTR',v)+"' >"+v['USER_NAME']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='M_TOTAL_SCORE' class='datagrid-cell "+ms.tdClass(formId, 'M_TOTAL_SCORE')+"' style='width:200px; text-align:right;"+ms.tdStyle(formId, 'M_TOTAL_SCORE')+"' "+ms.tdEvent(formId, 'M_TOTAL_SCORE')+"  >")
            arrHtml.push("<span style='text-align:right!important;' colno='M_TOTAL_SCORE' class='"+ms.uiClass(formId, 'M_TOTAL_SCORE')+"' style='"+ms.uiStyle(formId, 'M_TOTAL_SCORE')+"' "+ms.uiEvent(formId, 'M_TOTAL_SCORE')+" title='"+ms.titleAttr(formId,'M_TOTAL_SCORE','IS_TITLE_ATTR',v)+"' >"+v['M_TOTAL_SCORE']+"</span>")
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


function nullToZero(obj){
    if(undefined==obj||""==obj||null==obj){
        obj = 0;
        return obj;
    }
    return obj;
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
