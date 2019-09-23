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
		<dict:lang value="生产订单管理" />
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
		<bu:header formId ="59c61ad54aed4d8e83d4ad2ad6dfb86b"/>

    
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
		<bu:func viewId="1d2eed7093074e31900d7161d930ae1e" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="1d2eed7093074e31900d7161d930ae1e" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage59c61ad54aed4d8e83d4ad2ad6dfb86b" id="formPage59c61ad54aed4d8e83d4ad2ad6dfb86b" value="${formPage59c61ad54aed4d8e83d4ad2ad6dfb86b}"/>
		<input type="hidden" name="formId" id="formId1" value='59c61ad54aed4d8e83d4ad2ad6dfb86b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="59c61ad54aed4d8e83d4ad2ad6dfb86b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax59c61ad54aed4d8e83d4ad2ad6dfb86b" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner59c61ad54aed4d8e83d4ad2ad6dfb86b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable59c61ad54aed4d8e83d4ad2ad6dfb86b">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="59c61ad54aed4d8e83d4ad2ad6dfb86b" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_59c61ad54aed4d8e83d4ad2ad6dfb86b" onclick="_selectAjaxTableAllData(this,'59c61ad54aed4d8e83d4ad2ad6dfb86b')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_O_CODE" class="datagrid-cell"><bu:uitn colNo="O_CODE" formId="59c61ad54aed4d8e83d4ad2ad6dfb86b" /></td>
			<td name="noprintset_PO_NO" class="datagrid-cell"><bu:uitn colNo="PO_NO" formId="59c61ad54aed4d8e83d4ad2ad6dfb86b" /></td>
			<td name="noprintset_PO_DATE" class="datagrid-cell"><bu:uitn colNo="PO_DATE" formId="59c61ad54aed4d8e83d4ad2ad6dfb86b" /></td>
			<td name="noprintset_PO_SL" class="datagrid-cell"><bu:uitn colNo="PO_SL" formId="59c61ad54aed4d8e83d4ad2ad6dfb86b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv59c61ad54aed4d8e83d4ad2ad6dfb86b" onscroll="ajaxTableScroll(this,'59c61ad54aed4d8e83d4ad2ad6dfb86b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax59c61ad54aed4d8e83d4ad2ad6dfb86b">
		<tbody id="tbody_59c61ad54aed4d8e83d4ad2ad6dfb86b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage59c61ad54aed4d8e83d4ad2ad6dfb86b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=59c61ad54aed4d8e83d4ad2ad6dfb86b&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('59c61ad54aed4d8e83d4ad2ad6dfb86b','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?O_CODE</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="O_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="O_CODE" value="" title_name="?O_CODE" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?生产单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PO_NO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PO_NO" value="" title_name="?生产单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PO_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PO_DATE" value="" title_name="日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PO_SL" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PO_SL" value="" title_name="生产数量" />px
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
		<bu:submit viewId="1d2eed7093074e31900d7161d930ae1e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="1d2eed7093074e31900d7161d930ae1e" />
    
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
    if(formId=='59c61ad54aed4d8e83d4ad2ad6dfb86b'){<%--生产订单表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='O_CODE' name='noprintset_O_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'O_CODE')+"' style='"+ms.tdStyle(formId, 'O_CODE')+"' "+ms.tdEvent(formId, 'O_CODE')+">");
            arrHtml.push("<span colno='O_CODE' class='"+ms.uiClass(formId, 'O_CODE')+"' style='"+ms.uiStyle(formId, 'O_CODE')+"' "+ms.uiEvent(formId, 'O_CODE')+" title='"+ms.titleAttr(formId,'O_CODE','IS_TITLE_ATTR',v)+"' >"+v['O_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PO_NO' name='noprintset_PO_NO' class='datagrid-cell  "+ms.tdClass(formId, 'PO_NO')+"' style='"+ms.tdStyle(formId, 'PO_NO')+"' "+ms.tdEvent(formId, 'PO_NO')+">");
            arrHtml.push("<span colno='PO_NO' class='"+ms.uiClass(formId, 'PO_NO')+"' style='"+ms.uiStyle(formId, 'PO_NO')+"' "+ms.uiEvent(formId, 'PO_NO')+" title='"+ms.titleAttr(formId,'PO_NO','IS_TITLE_ATTR',v)+"' >"+v['PO_NO']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PO_DATE' name='noprintset_PO_DATE' class='datagrid-cell  "+ms.tdClass(formId, 'PO_DATE')+"' style='"+ms.tdStyle(formId, 'PO_DATE')+"' "+ms.tdEvent(formId, 'PO_DATE')+">");
            arrHtml.push("<span colno='PO_DATE' class='"+ms.uiClass(formId, 'PO_DATE')+"' style='"+ms.uiStyle(formId, 'PO_DATE')+"' "+ms.uiEvent(formId, 'PO_DATE')+" title='"+ms.titleAttr(formId,'PO_DATE','IS_TITLE_ATTR',v)+"' >"+v['PO_DATE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PO_SL' name='noprintset_PO_SL' class='datagrid-cell  "+ms.tdClass(formId, 'PO_SL')+"' style='"+ms.tdStyle(formId, 'PO_SL')+"' "+ms.tdEvent(formId, 'PO_SL')+">");
            arrHtml.push("<span colno='PO_SL' class='"+ms.uiClass(formId, 'PO_SL')+"' style='"+ms.uiStyle(formId, 'PO_SL')+"' "+ms.uiEvent(formId, 'PO_SL')+" title='"+ms.titleAttr(formId,'PO_SL','IS_TITLE_ATTR',v)+"' >"+v['PO_SL']+"</span>");
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
    if(formId=='59c61ad54aed4d8e83d4ad2ad6dfb86b'){<%--生产订单表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='O_CODE' name='noprintset_O_CODE' class='datagrid-cell "+ms.tdClass(formId, 'O_CODE')+"' style='"+ms.tdStyle(formId, 'O_CODE')+"' "+ms.tdEvent(formId, 'O_CODE')+">");
            arrHtml.push("<span colno='O_CODE' class='"+ms.uiClass(formId, 'O_CODE')+"' style='"+ms.uiStyle(formId, 'O_CODE')+"' "+ms.uiEvent(formId, 'O_CODE')+" title='"+ms.titleAttr(formId,'O_CODE','IS_TITLE_ATTR',v)+"' >"+v['O_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PO_NO' name='noprintset_PO_NO' class='datagrid-cell "+ms.tdClass(formId, 'PO_NO')+"' style='"+ms.tdStyle(formId, 'PO_NO')+"' "+ms.tdEvent(formId, 'PO_NO')+">");
            arrHtml.push("<span colno='PO_NO' class='"+ms.uiClass(formId, 'PO_NO')+"' style='"+ms.uiStyle(formId, 'PO_NO')+"' "+ms.uiEvent(formId, 'PO_NO')+" title='"+ms.titleAttr(formId,'PO_NO','IS_TITLE_ATTR',v)+"' >"+v['PO_NO']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PO_DATE' name='noprintset_PO_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PO_DATE')+"' style='"+ms.tdStyle(formId, 'PO_DATE')+"' "+ms.tdEvent(formId, 'PO_DATE')+">");
            arrHtml.push("<span colno='PO_DATE' class='"+ms.uiClass(formId, 'PO_DATE')+"' style='"+ms.uiStyle(formId, 'PO_DATE')+"' "+ms.uiEvent(formId, 'PO_DATE')+" title='"+ms.titleAttr(formId,'PO_DATE','IS_TITLE_ATTR',v)+"' >"+v['PO_DATE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PO_SL' name='noprintset_PO_SL' class='datagrid-cell "+ms.tdClass(formId, 'PO_SL')+"' style='"+ms.tdStyle(formId, 'PO_SL')+"' "+ms.tdEvent(formId, 'PO_SL')+">");
            arrHtml.push("<span colno='PO_SL' class='"+ms.uiClass(formId, 'PO_SL')+"' style='"+ms.uiStyle(formId, 'PO_SL')+"' "+ms.uiEvent(formId, 'PO_SL')+" title='"+ms.titleAttr(formId,'PO_SL','IS_TITLE_ATTR',v)+"' >"+v['PO_SL']+"</span>");
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
