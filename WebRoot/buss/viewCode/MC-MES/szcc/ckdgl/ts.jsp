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
		<dict:lang value="ts" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
         <jsp:param name="jqueryprint" value="1" />
         
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
		<bu:header formId ="0ca3de80ad104f3e95d9e69cbe87fc98"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->

	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>

</head>

<body>
    <div class="content-in">
        <div class="dlist">
            <div class="hd">
		<bu:func viewId="ea27c0d3538d483085e1304ea68616b9" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="ea27c0d3538d483085e1304ea68616b9" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0ca3de80ad104f3e95d9e69cbe87fc98" id="formPage0ca3de80ad104f3e95d9e69cbe87fc98" value="${formPage0ca3de80ad104f3e95d9e69cbe87fc98}"/>
		<input type="hidden" name="formId" id="formId1" value='0ca3de80ad104f3e95d9e69cbe87fc98'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0ca3de80ad104f3e95d9e69cbe87fc98">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0ca3de80ad104f3e95d9e69cbe87fc98" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0ca3de80ad104f3e95d9e69cbe87fc98">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0ca3de80ad104f3e95d9e69cbe87fc98">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="0ca3de80ad104f3e95d9e69cbe87fc98" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0ca3de80ad104f3e95d9e69cbe87fc98" onclick="_selectAjaxTableAllData(this,'0ca3de80ad104f3e95d9e69cbe87fc98')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_WOI_DOC_NUM" class="datagrid-cell"><bu:uitn colNo="WOI_DOC_NUM" formId="0ca3de80ad104f3e95d9e69cbe87fc98" /></td>
			<td name="noprintset_WOI_ITEM_SEQ" class="datagrid-cell"><bu:uitn colNo="WOI_ITEM_SEQ" formId="0ca3de80ad104f3e95d9e69cbe87fc98" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0ca3de80ad104f3e95d9e69cbe87fc98" onscroll="ajaxTableScroll(this,'0ca3de80ad104f3e95d9e69cbe87fc98')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0ca3de80ad104f3e95d9e69cbe87fc98">
		<tbody id="tbody_0ca3de80ad104f3e95d9e69cbe87fc98" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0ca3de80ad104f3e95d9e69cbe87fc98==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0ca3de80ad104f3e95d9e69cbe87fc98&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('0ca3de80ad104f3e95d9e69cbe87fc98','1');">打印</button>
 </div>
 </div>
 <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
 <table id="printset_tab" class="basic-table" style="text-align: center;margin-top:10px;">
 <tr>
 <td style="width: 100px;text-align: right;">列字段</td>
 <td style="padding-left: 5px;">是否打印</td>
 <td style="padding-left: 5px;">打印列宽</td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>序号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SEQ" value="30" title_name="序号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WOI_DOC_NUM</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WOI_DOC_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WOI_DOC_NUM" value="" title_name="?WOI_DOC_NUM" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?WOI_ITEM_SEQ</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WOI_ITEM_SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WOI_ITEM_SEQ" value="" title_name="?WOI_ITEM_SEQ" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="ea27c0d3538d483085e1304ea68616b9" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="ea27c0d3538d483085e1304ea68616b9" />
    
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
    if(formId=='0ca3de80ad104f3e95d9e69cbe87fc98'){<%--出库测试--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_DOC_NUM' name='noprintset_WOI_DOC_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'WOI_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WOI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WOI_DOC_NUM')+">")
            arrHtml.push("<span colno='WOI_DOC_NUM' class='"+ms.uiClass(formId, 'WOI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WOI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WOI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_ITEM_SEQ' name='noprintset_WOI_ITEM_SEQ' class='datagrid-cell  "+ms.tdClass(formId, 'WOI_ITEM_SEQ')+"' style='"+ms.tdStyle(formId, 'WOI_ITEM_SEQ')+"' "+ms.tdEvent(formId, 'WOI_ITEM_SEQ')+">")
            arrHtml.push("<span colno='WOI_ITEM_SEQ' class='"+ms.uiClass(formId, 'WOI_ITEM_SEQ')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_SEQ')+"' "+ms.uiEvent(formId, 'WOI_ITEM_SEQ')+" title='"+ms.titleAttr(formId,'WOI_ITEM_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WOI_ITEM_SEQ']+"</span>")
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
    setScroll(formId);
}
</script><script>
<%--生成异步表格--%>
function createTableModel_print(ms,formId){
    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='0ca3de80ad104f3e95d9e69cbe87fc98'){<%--出库测试--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='WOI_DOC_NUM' name='noprintset_WOI_DOC_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WOI_DOC_NUM')+"' style='"+ms.tdStyle(formId, 'WOI_DOC_NUM')+"' "+ms.tdEvent(formId, 'WOI_DOC_NUM')+">")
            arrHtml.push("<span colno='WOI_DOC_NUM' class='"+ms.uiClass(formId, 'WOI_DOC_NUM')+"' style='"+ms.uiStyle(formId, 'WOI_DOC_NUM')+"' "+ms.uiEvent(formId, 'WOI_DOC_NUM')+" title='"+ms.titleAttr(formId,'WOI_DOC_NUM','IS_TITLE_ATTR',v)+"' >"+v['WOI_DOC_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WOI_ITEM_SEQ' name='noprintset_WOI_ITEM_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WOI_ITEM_SEQ')+"' style='"+ms.tdStyle(formId, 'WOI_ITEM_SEQ')+"' "+ms.tdEvent(formId, 'WOI_ITEM_SEQ')+">")
            arrHtml.push("<span colno='WOI_ITEM_SEQ' class='"+ms.uiClass(formId, 'WOI_ITEM_SEQ')+"' style='"+ms.uiStyle(formId, 'WOI_ITEM_SEQ')+"' "+ms.uiEvent(formId, 'WOI_ITEM_SEQ')+" title='"+ms.titleAttr(formId,'WOI_ITEM_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WOI_ITEM_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
    }
    setNumColWidth(formId);
    clearAllSelect();
    setTableWidth(formId);
    setScroll(formId);
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