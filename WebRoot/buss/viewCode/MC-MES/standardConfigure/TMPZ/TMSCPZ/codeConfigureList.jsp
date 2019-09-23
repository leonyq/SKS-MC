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
		<dict:lang value="条码生成配置列表" />
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
		<bu:header formId ="0f6bc25a04cd4de5932d12813912b915"/>

    
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
		<bu:func viewId="1fed4f520dcb48999fb815d0a5504042" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="1fed4f520dcb48999fb815d0a5504042" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0f6bc25a04cd4de5932d12813912b915" id="formPage0f6bc25a04cd4de5932d12813912b915" value="${formPage0f6bc25a04cd4de5932d12813912b915}"/>
		<input type="hidden" name="formId" id="formId1" value='0f6bc25a04cd4de5932d12813912b915'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0f6bc25a04cd4de5932d12813912b915">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0f6bc25a04cd4de5932d12813912b915" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0f6bc25a04cd4de5932d12813912b915">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0f6bc25a04cd4de5932d12813912b915">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="0f6bc25a04cd4de5932d12813912b915" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0f6bc25a04cd4de5932d12813912b915" onclick="_selectAjaxTableAllData(this,'0f6bc25a04cd4de5932d12813912b915')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_DATA_AUTH" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="DATA_AUTH" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<td name="noprintset_CCC_CONFIGURE_TYPE" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CCC_CONFIGURE_TYPE" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<td name="noprintset_CCC_CONFIGURE_CODE" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CCC_CONFIGURE_CODE" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<td name="noprintset_CCC_CONFIGURE_NAME" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CCC_CONFIGURE_NAME" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<td name="noprintset_CCC_DEFAULT_FLAG" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CCC_DEFAULT_FLAG" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
			<td name="noprintset_CCC_MEMO" style="width:200px;" class="datagrid-cell"><bu:uitn colNo="CCC_MEMO" formId="0f6bc25a04cd4de5932d12813912b915" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0f6bc25a04cd4de5932d12813912b915" onscroll="ajaxTableScroll(this,'0f6bc25a04cd4de5932d12813912b915')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0f6bc25a04cd4de5932d12813912b915">
		<tbody id="tbody_0f6bc25a04cd4de5932d12813912b915" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0f6bc25a04cd4de5932d12813912b915==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0f6bc25a04cd4de5932d12813912b915&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('0f6bc25a04cd4de5932d12813912b915','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?配置类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CCC_CONFIGURE_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CCC_CONFIGURE_TYPE" value="" title_name="?配置类型" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?配置编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CCC_CONFIGURE_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CCC_CONFIGURE_CODE" value="" title_name="?配置编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?配置名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CCC_CONFIGURE_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CCC_CONFIGURE_NAME" value="" title_name="?配置名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>默认标志</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CCC_DEFAULT_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CCC_DEFAULT_FLAG" value="" title_name="默认标志" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>备注</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CCC_MEMO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CCC_MEMO" value="" title_name="备注" />px
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
		<bu:submit viewId="1fed4f520dcb48999fb815d0a5504042" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="1fed4f520dcb48999fb815d0a5504042" />
    
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    
<script>
function reloadPg(msg,title,width,height,time,isCloseWin){
  	msgPop(msg,reloadPgExe,title,width,height,time,isCloseWin);
}
function reloadPgExe(isCloseWin){
  	query("formId1");
  	if ("0" == isCloseWin || undefined == isCloseWin  ) {
    		top.$(".dialog-close").click();
  	}
   	//checkboxAll("joblist");
}
<%--生成异步表格--%>
function createTableModel(ms,formId){

    var arrHtml = [];
    var arrLeftHtml = [];
    var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
    var trClass = ms.trClass(formId);
    var trStyle = ms.trStyle(formId);
    var trEvent = ms.trEvent(formId);
    var colNo = $("#relColVals").val();
    if(formId=='0f6bc25a04cd4de5932d12813912b915'){<%--条码生成配置信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DATA_AUTH' name='noprintset_DATA_AUTH' class='datagrid-cell "+ms.tdClass(formId, 'DATA_AUTH')+"' style='"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
            arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+ms.titleAttr(formId,'DATA_AUTH','IS_TITLE_ATTR',v)+"' >"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' /> ")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_CONFIGURE_TYPE' name='noprintset_CCC_CONFIGURE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CCC_CONFIGURE_TYPE')+"' style='"+ms.tdStyle(formId, 'CCC_CONFIGURE_TYPE')+"' "+ms.tdEvent(formId, 'CCC_CONFIGURE_TYPE')+">")
            arrHtml.push("<span colno='CCC_CONFIGURE_TYPE' class='"+ms.uiClass(formId, 'CCC_CONFIGURE_TYPE')+"' style='width:200px;text-align:center;"+ms.uiStyle(formId, 'CCC_CONFIGURE_TYPE')+"' "+ms.uiEvent(formId, 'CCC_CONFIGURE_TYPE')+" title='"+ms.titleAttr(formId,'CCC_CONFIGURE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CCC_CONFIGURE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_CONFIGURE_CODE' name='noprintset_CCC_CONFIGURE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CCC_CONFIGURE_CODE')+"' style='"+ms.tdStyle(formId, 'CCC_CONFIGURE_CODE')+"' "+ms.tdEvent(formId, 'CCC_CONFIGURE_CODE')+">")
            arrHtml.push("<span colno='CCC_CONFIGURE_CODE' class='"+ms.uiClass(formId, 'CCC_CONFIGURE_CODE')+"' style='width:200px;text-align:center;"+ms.uiStyle(formId, 'CCC_CONFIGURE_CODE')+"' "+ms.uiEvent(formId, 'CCC_CONFIGURE_CODE')+" title='"+ms.titleAttr(formId,'CCC_CONFIGURE_CODE','IS_TITLE_ATTR',v)+"' >"+v['CCC_CONFIGURE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_CONFIGURE_NAME' name='noprintset_CCC_CONFIGURE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CCC_CONFIGURE_NAME')+"' style='"+ms.tdStyle(formId, 'CCC_CONFIGURE_NAME')+"' "+ms.tdEvent(formId, 'CCC_CONFIGURE_NAME')+">")
            arrHtml.push("<span colno='CCC_CONFIGURE_NAME' class='"+ms.uiClass(formId, 'CCC_CONFIGURE_NAME')+"' style='width:200px;text-align:center;"+ms.uiStyle(formId, 'CCC_CONFIGURE_NAME')+"' "+ms.uiEvent(formId, 'CCC_CONFIGURE_NAME')+" title='"+ms.titleAttr(formId,'CCC_CONFIGURE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CCC_CONFIGURE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_DEFAULT_FLAG' name='noprintset_CCC_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CCC_DEFAULT_FLAG')+"' style='"+ms.tdStyle(formId, 'CCC_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'CCC_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='CCC_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'CCC_DEFAULT_FLAG')+"' style='width:200px;text-align:center;"+ms.uiStyle(formId, 'CCC_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'CCC_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'CCC_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CCC_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_MEMO' name='noprintset_CCC_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CCC_MEMO')+"' style='"+ms.tdStyle(formId, 'CCC_MEMO')+"' "+ms.tdEvent(formId, 'CCC_MEMO')+">")
            arrHtml.push("<span colno='CCC_MEMO' class='"+ms.uiClass(formId, 'CCC_MEMO')+"' style='width:200px;text-align:left;"+ms.uiStyle(formId, 'CCC_MEMO')+"' "+ms.uiEvent(formId, 'CCC_MEMO')+" title='"+ms.titleAttr(formId,'CCC_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CCC_MEMO']+"</span>")
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
    if(formId=='0f6bc25a04cd4de5932d12813912b915'){<%--条码生成配置信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='CCC_CONFIGURE_TYPE' name='noprintset_CCC_CONFIGURE_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'CCC_CONFIGURE_TYPE')+"' style='"+ms.tdStyle(formId, 'CCC_CONFIGURE_TYPE')+"' "+ms.tdEvent(formId, 'CCC_CONFIGURE_TYPE')+">")
            arrHtml.push("<span colno='CCC_CONFIGURE_TYPE' class='"+ms.uiClass(formId, 'CCC_CONFIGURE_TYPE')+"' style='"+ms.uiStyle(formId, 'CCC_CONFIGURE_TYPE')+"' "+ms.uiEvent(formId, 'CCC_CONFIGURE_TYPE')+" title='"+ms.titleAttr(formId,'CCC_CONFIGURE_TYPE','IS_TITLE_ATTR',v)+"' >"+v['CCC_CONFIGURE_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_CONFIGURE_CODE' name='noprintset_CCC_CONFIGURE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CCC_CONFIGURE_CODE')+"' style='"+ms.tdStyle(formId, 'CCC_CONFIGURE_CODE')+"' "+ms.tdEvent(formId, 'CCC_CONFIGURE_CODE')+">")
            arrHtml.push("<span colno='CCC_CONFIGURE_CODE' class='"+ms.uiClass(formId, 'CCC_CONFIGURE_CODE')+"' style='"+ms.uiStyle(formId, 'CCC_CONFIGURE_CODE')+"' "+ms.uiEvent(formId, 'CCC_CONFIGURE_CODE')+" title='"+ms.titleAttr(formId,'CCC_CONFIGURE_CODE','IS_TITLE_ATTR',v)+"' >"+v['CCC_CONFIGURE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_CONFIGURE_NAME' name='noprintset_CCC_CONFIGURE_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CCC_CONFIGURE_NAME')+"' style='"+ms.tdStyle(formId, 'CCC_CONFIGURE_NAME')+"' "+ms.tdEvent(formId, 'CCC_CONFIGURE_NAME')+">")
            arrHtml.push("<span colno='CCC_CONFIGURE_NAME' class='"+ms.uiClass(formId, 'CCC_CONFIGURE_NAME')+"' style='"+ms.uiStyle(formId, 'CCC_CONFIGURE_NAME')+"' "+ms.uiEvent(formId, 'CCC_CONFIGURE_NAME')+" title='"+ms.titleAttr(formId,'CCC_CONFIGURE_NAME','IS_TITLE_ATTR',v)+"' >"+v['CCC_CONFIGURE_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_DEFAULT_FLAG' name='noprintset_CCC_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CCC_DEFAULT_FLAG')+"' style='"+ms.tdStyle(formId, 'CCC_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'CCC_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='CCC_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'CCC_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'CCC_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'CCC_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'CCC_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CCC_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CCC_MEMO' name='noprintset_CCC_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CCC_MEMO')+"' style='"+ms.tdStyle(formId, 'CCC_MEMO')+"' "+ms.tdEvent(formId, 'CCC_MEMO')+">")
            arrHtml.push("<span colno='CCC_MEMO' class='"+ms.uiClass(formId, 'CCC_MEMO')+"' style='"+ms.uiStyle(formId, 'CCC_MEMO')+"' "+ms.uiEvent(formId, 'CCC_MEMO')+" title='"+ms.titleAttr(formId,'CCC_MEMO','IS_TITLE_ATTR',v)+"' >"+v['CCC_MEMO']+"</span>")
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
