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
		<dict:lang value="cjd人员视图模型" />
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
		<bu:header formId ="cf533b79098148e99b0d16f1df43eae1"/>

    
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
		<bu:func viewId="c87219fce7e74cfba961cd69b08417d8" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="c87219fce7e74cfba961cd69b08417d8" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagecf533b79098148e99b0d16f1df43eae1" id="formPagecf533b79098148e99b0d16f1df43eae1" value="${formPagecf533b79098148e99b0d16f1df43eae1}"/>
		<input type="hidden" name="formId" id="formId1" value='cf533b79098148e99b0d16f1df43eae1'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="cf533b79098148e99b0d16f1df43eae1">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxcf533b79098148e99b0d16f1df43eae1" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innercf533b79098148e99b0d16f1df43eae1">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablecf533b79098148e99b0d16f1df43eae1">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="cf533b79098148e99b0d16f1df43eae1" i18n="1"/></td>
			<td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_cf533b79098148e99b0d16f1df43eae1" onclick="_selectAjaxTableAllData(this,'cf533b79098148e99b0d16f1df43eae1')" style="cursor: pointer;"title="全选"/></span></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_ID" formId="cf533b79098148e99b0d16f1df43eae1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_NAME" formId="cf533b79098148e99b0d16f1df43eae1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_SEX" formId="cf533b79098148e99b0d16f1df43eae1" /></td>
			<td class="datagrid-cell"><bu:uitn colNo="PERSON_BRON" formId="cf533b79098148e99b0d16f1df43eae1" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivcf533b79098148e99b0d16f1df43eae1" onscroll="ajaxTableScroll(this,'cf533b79098148e99b0d16f1df43eae1')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxcf533b79098148e99b0d16f1df43eae1">
		<tbody id="tbody_cf533b79098148e99b0d16f1df43eae1" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagecf533b79098148e99b0d16f1df43eae1==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=cf533b79098148e99b0d16f1df43eae1&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="c87219fce7e74cfba961cd69b08417d8" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="c87219fce7e74cfba961cd69b08417d8" />
    
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
    if(formId=='cf533b79098148e99b0d16f1df43eae1'){<%--cjd人员表单名称--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_ID' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_ID')+"' style='"+ms.tdStyle(formId, 'PERSON_ID')+"' "+ms.tdEvent(formId, 'PERSON_ID')+">")
            arrHtml.push("<span colno='PERSON_ID' class='"+ms.uiClass(formId, 'PERSON_ID')+"' style='"+ms.uiStyle(formId, 'PERSON_ID')+"' "+ms.uiEvent(formId, 'PERSON_ID')+" title='"+ms.titleAttr(formId,'PERSON_ID','IS_TITLE_ATTR',v)+"' >"+v['PERSON_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_NAME')+"' style='"+ms.tdStyle(formId, 'PERSON_NAME')+"' "+ms.tdEvent(formId, 'PERSON_NAME')+">")
            arrHtml.push("<span colno='PERSON_NAME' class='"+ms.uiClass(formId, 'PERSON_NAME')+"' style='"+ms.uiStyle(formId, 'PERSON_NAME')+"' "+ms.uiEvent(formId, 'PERSON_NAME')+" title='"+ms.titleAttr(formId,'PERSON_NAME','IS_TITLE_ATTR',v)+"' >"+v['PERSON_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_SEX' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_SEX')+"' style='"+ms.tdStyle(formId, 'PERSON_SEX')+"' "+ms.tdEvent(formId, 'PERSON_SEX')+">")
            arrHtml.push("<span colno='PERSON_SEX' class='"+ms.uiClass(formId, 'PERSON_SEX')+"' style='"+ms.uiStyle(formId, 'PERSON_SEX')+"' "+ms.uiEvent(formId, 'PERSON_SEX')+" title='"+ms.titleAttr(formId,'PERSON_SEX','IS_TITLE_ATTR',v)+"' >"+v['PERSON_SEX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PERSON_BRON' class='datagrid-cell "+ms.tdClass(formId, 'PERSON_BRON')+"' style='"+ms.tdStyle(formId, 'PERSON_BRON')+"' "+ms.tdEvent(formId, 'PERSON_BRON')+">")
            arrHtml.push("<span colno='PERSON_BRON' class='"+ms.uiClass(formId, 'PERSON_BRON')+"' style='"+ms.uiStyle(formId, 'PERSON_BRON')+"' "+ms.uiEvent(formId, 'PERSON_BRON')+" title='"+ms.titleAttr(formId,'PERSON_BRON','IS_TITLE_ATTR',v)+"' >"+v['PERSON_BRON']+"</span>")
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
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_17" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
