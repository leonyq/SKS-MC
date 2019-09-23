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
		<dict:lang value="ldg_工单信息扩展新增测试3" />
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
		<bu:header formId ="41b78d88aa0a4e6987eaa61cf6d29d2c"/>

    
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
		<bu:func viewId="4c97f5c0c5084a93a9fabd8513d67895" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="4c97f5c0c5084a93a9fabd8513d67895" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage41b78d88aa0a4e6987eaa61cf6d29d2c" id="formPage41b78d88aa0a4e6987eaa61cf6d29d2c" value="${formPage41b78d88aa0a4e6987eaa61cf6d29d2c}"/>
		<input type="hidden" name="formId" id="formId1" value='41b78d88aa0a4e6987eaa61cf6d29d2c'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="41b78d88aa0a4e6987eaa61cf6d29d2c">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax41b78d88aa0a4e6987eaa61cf6d29d2c" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner41b78d88aa0a4e6987eaa61cf6d29d2c">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable41b78d88aa0a4e6987eaa61cf6d29d2c">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="41b78d88aa0a4e6987eaa61cf6d29d2c" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_41b78d88aa0a4e6987eaa61cf6d29d2c" onclick="_selectAjaxTableAllData(this,'41b78d88aa0a4e6987eaa61cf6d29d2c')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="USER_ID" formId="41b78d88aa0a4e6987eaa61cf6d29d2c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="USER_NAME" formId="41b78d88aa0a4e6987eaa61cf6d29d2c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="NAEM" formId="41b78d88aa0a4e6987eaa61cf6d29d2c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="TEXT" formId="41b78d88aa0a4e6987eaa61cf6d29d2c" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="VAL" formId="41b78d88aa0a4e6987eaa61cf6d29d2c" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv41b78d88aa0a4e6987eaa61cf6d29d2c" onscroll="ajaxTableScroll(this,'41b78d88aa0a4e6987eaa61cf6d29d2c')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax41b78d88aa0a4e6987eaa61cf6d29d2c">
		<tbody id="tbody_41b78d88aa0a4e6987eaa61cf6d29d2c" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage41b78d88aa0a4e6987eaa61cf6d29d2c==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=41b78d88aa0a4e6987eaa61cf6d29d2c&showLoading=0" />
			</div>
		</c:if>
		</div>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="4c97f5c0c5084a93a9fabd8513d67895" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="4c97f5c0c5084a93a9fabd8513d67895" />
    
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
    if(formId=='41b78d88aa0a4e6987eaa61cf6d29d2c'){<%--ldg测试数据权限表单模型--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='USER_ID' class='datagrid-cell "+ms.tdClass(formId, 'USER_ID')+"' style='"+ms.tdStyle(formId, 'USER_ID')+"' "+ms.tdEvent(formId, 'USER_ID')+">")
            arrHtml.push("<span colno='USER_ID' class='"+ms.uiClass(formId, 'USER_ID')+"' style='"+ms.uiStyle(formId, 'USER_ID')+"' "+ms.uiEvent(formId, 'USER_ID')+" title='"+ms.titleAttr(formId,'USER_ID','IS_TITLE_ATTR',v)+"' >"+v['USER_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='USER_NAME' class='datagrid-cell "+ms.tdClass(formId, 'USER_NAME')+"' style='"+ms.tdStyle(formId, 'USER_NAME')+"' "+ms.tdEvent(formId, 'USER_NAME')+">")
            arrHtml.push("<span colno='USER_NAME' class='"+ms.uiClass(formId, 'USER_NAME')+"' style='"+ms.uiStyle(formId, 'USER_NAME')+"' "+ms.uiEvent(formId, 'USER_NAME')+" title='"+ms.titleAttr(formId,'USER_NAME','IS_TITLE_ATTR',v)+"' >"+v['USER_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NAEM' class='datagrid-cell "+ms.tdClass(formId, 'NAEM')+"' style='"+ms.tdStyle(formId, 'NAEM')+"' "+ms.tdEvent(formId, 'NAEM')+">")
            arrHtml.push("<span colno='NAEM' class='"+ms.uiClass(formId, 'NAEM')+"' style='"+ms.uiStyle(formId, 'NAEM')+"' "+ms.uiEvent(formId, 'NAEM')+" title='"+ms.titleAttr(formId,'NAEM','IS_TITLE_ATTR',v)+"' >"+v['NAEM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TEXT' class='datagrid-cell "+ms.tdClass(formId, 'TEXT')+"' style='"+ms.tdStyle(formId, 'TEXT')+"' "+ms.tdEvent(formId, 'TEXT')+">")
            arrHtml.push("<span colno='TEXT' class='"+ms.uiClass(formId, 'TEXT')+"' style='"+ms.uiStyle(formId, 'TEXT')+"' "+ms.uiEvent(formId, 'TEXT')+" title='"+ms.titleAttr(formId,'TEXT','IS_TITLE_ATTR',v)+"' >"+v['TEXT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VAL' class='datagrid-cell "+ms.tdClass(formId, 'VAL')+"' style='"+ms.tdStyle(formId, 'VAL')+"' "+ms.tdEvent(formId, 'VAL')+">")
            arrHtml.push("<span colno='VAL' class='"+ms.uiClass(formId, 'VAL')+"' style='"+ms.uiStyle(formId, 'VAL')+"' "+ms.uiEvent(formId, 'VAL')+" title='"+ms.titleAttr(formId,'VAL','IS_TITLE_ATTR',v)+"' >"+v['VAL']+"</span>")
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
