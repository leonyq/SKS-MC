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
		<dict:lang value="工序作业区域维护" />
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
		<bu:header formId ="0056deb42efa4d169a94dbc46f5a433a"/>

    
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
		<bu:func viewId="3ed6f30376194378aee7ec9249ae3300" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="3ed6f30376194378aee7ec9249ae3300" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage0056deb42efa4d169a94dbc46f5a433a" id="formPage0056deb42efa4d169a94dbc46f5a433a" value="${formPage0056deb42efa4d169a94dbc46f5a433a}"/>
		<input type="hidden" name="formId" id="formId1" value='0056deb42efa4d169a94dbc46f5a433a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="0056deb42efa4d169a94dbc46f5a433a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax0056deb42efa4d169a94dbc46f5a433a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner0056deb42efa4d169a94dbc46f5a433a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable0056deb42efa4d169a94dbc46f5a433a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="0056deb42efa4d169a94dbc46f5a433a" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_0056deb42efa4d169a94dbc46f5a433a" onclick="_selectAjaxTableAllData(this,'0056deb42efa4d169a94dbc46f5a433a')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_CGA_GROUP_CODE" class="datagrid-cell"><bu:uitn colNo="CGA_GROUP_CODE" formId="0056deb42efa4d169a94dbc46f5a433a" /></td>
			<td name="noprintset_CGA_ITEM_AREA" class="datagrid-cell"><bu:uitn colNo="CGA_ITEM_AREA" formId="0056deb42efa4d169a94dbc46f5a433a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv0056deb42efa4d169a94dbc46f5a433a" onscroll="ajaxTableScroll(this,'0056deb42efa4d169a94dbc46f5a433a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax0056deb42efa4d169a94dbc46f5a433a">
		<tbody id="tbody_0056deb42efa4d169a94dbc46f5a433a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage0056deb42efa4d169a94dbc46f5a433a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=0056deb42efa4d169a94dbc46f5a433a&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('0056deb42efa4d169a94dbc46f5a433a','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>工序代码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CGA_GROUP_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CGA_GROUP_CODE" value="" title_name="工序代码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业区域</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CGA_ITEM_AREA" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CGA_ITEM_AREA" value="" title_name="作业区域" />px
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
		<bu:submit viewId="3ed6f30376194378aee7ec9249ae3300" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3ed6f30376194378aee7ec9249ae3300" />
    
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
    if(formId=='0056deb42efa4d169a94dbc46f5a433a'){<%--工序作业区域--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CGA_GROUP_CODE' name='noprintset_CGA_GROUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CGA_GROUP_CODE')+"' style='"+ms.tdStyle(formId, 'CGA_GROUP_CODE')+"' "+ms.tdEvent(formId, 'CGA_GROUP_CODE')+">")
            arrHtml.push("<span colno='CGA_GROUP_CODE' class='"+ms.uiClass(formId, 'CGA_GROUP_CODE')+"' style='"+ms.uiStyle(formId, 'CGA_GROUP_CODE')+"' "+ms.uiEvent(formId, 'CGA_GROUP_CODE')+" title='"+ms.titleAttr(formId,'CGA_GROUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['CGA_GROUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CGA_ITEM_AREA' name='noprintset_CGA_ITEM_AREA' class='datagrid-cell "+ms.tdClass(formId, 'CGA_ITEM_AREA')+"' style='"+ms.tdStyle(formId, 'CGA_ITEM_AREA')+"' "+ms.tdEvent(formId, 'CGA_ITEM_AREA')+">")
            arrHtml.push("<span colno='CGA_ITEM_AREA' class='"+ms.uiClass(formId, 'CGA_ITEM_AREA')+"' style='"+ms.uiStyle(formId, 'CGA_ITEM_AREA')+"' "+ms.uiEvent(formId, 'CGA_ITEM_AREA')+" title='"+ms.titleAttr(formId,'CGA_ITEM_AREA','IS_TITLE_ATTR',v)+"' >"+v['CGA_ITEM_AREA']+"</span>")
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
    if(formId=='0056deb42efa4d169a94dbc46f5a433a'){<%--工序作业区域--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='CGA_GROUP_CODE' name='noprintset_CGA_GROUP_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CGA_GROUP_CODE')+"' style='"+ms.tdStyle(formId, 'CGA_GROUP_CODE')+"' "+ms.tdEvent(formId, 'CGA_GROUP_CODE')+">")
            arrHtml.push("<span colno='CGA_GROUP_CODE' class='"+ms.uiClass(formId, 'CGA_GROUP_CODE')+"' style='"+ms.uiStyle(formId, 'CGA_GROUP_CODE')+"' "+ms.uiEvent(formId, 'CGA_GROUP_CODE')+" title='"+ms.titleAttr(formId,'CGA_GROUP_CODE','IS_TITLE_ATTR',v)+"' >"+v['CGA_GROUP_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CGA_ITEM_AREA' name='noprintset_CGA_ITEM_AREA' class='datagrid-cell "+ms.tdClass(formId, 'CGA_ITEM_AREA')+"' style='"+ms.tdStyle(formId, 'CGA_ITEM_AREA')+"' "+ms.tdEvent(formId, 'CGA_ITEM_AREA')+">")
            arrHtml.push("<span colno='CGA_ITEM_AREA' class='"+ms.uiClass(formId, 'CGA_ITEM_AREA')+"' style='"+ms.uiStyle(formId, 'CGA_ITEM_AREA')+"' "+ms.uiEvent(formId, 'CGA_ITEM_AREA')+" title='"+ms.titleAttr(formId,'CGA_ITEM_AREA','IS_TITLE_ATTR',v)+"' >"+v['CGA_ITEM_AREA']+"</span>")
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
