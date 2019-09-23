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
		<dict:lang value="组织机构传参测试1129" />
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
		<bu:header formId ="9ca81c35a4f34a3a8d3830c4f1446c4b"/>

    
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
		<bu:func viewId="d558c0143fa64ffc95319d7fdc3f3349" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="d558c0143fa64ffc95319d7fdc3f3349" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage9ca81c35a4f34a3a8d3830c4f1446c4b" id="formPage9ca81c35a4f34a3a8d3830c4f1446c4b" value="${formPage9ca81c35a4f34a3a8d3830c4f1446c4b}"/>
		<input type="hidden" name="formId" id="formId1" value='9ca81c35a4f34a3a8d3830c4f1446c4b'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9ca81c35a4f34a3a8d3830c4f1446c4b">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9ca81c35a4f34a3a8d3830c4f1446c4b" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9ca81c35a4f34a3a8d3830c4f1446c4b">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9ca81c35a4f34a3a8d3830c4f1446c4b">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="9ca81c35a4f34a3a8d3830c4f1446c4b" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9ca81c35a4f34a3a8d3830c4f1446c4b" onclick="_selectAjaxTableAllData(this,'9ca81c35a4f34a3a8d3830c4f1446c4b')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_SNO" class="datagrid-cell"><bu:uitn colNo="SNO" formId="9ca81c35a4f34a3a8d3830c4f1446c4b" /></td>
			<td name="noprintset_SNAME" class="datagrid-cell"><bu:uitn colNo="SNAME" formId="9ca81c35a4f34a3a8d3830c4f1446c4b" /></td>
			<td name="noprintset_HOBBY" class="datagrid-cell"><bu:uitn colNo="HOBBY" formId="9ca81c35a4f34a3a8d3830c4f1446c4b" /></td>
			<td name="noprintset_NATION" class="datagrid-cell"><bu:uitn colNo="NATION" formId="9ca81c35a4f34a3a8d3830c4f1446c4b" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9ca81c35a4f34a3a8d3830c4f1446c4b" onscroll="ajaxTableScroll(this,'9ca81c35a4f34a3a8d3830c4f1446c4b')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9ca81c35a4f34a3a8d3830c4f1446c4b">
		<tbody id="tbody_9ca81c35a4f34a3a8d3830c4f1446c4b" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9ca81c35a4f34a3a8d3830c4f1446c4b==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9ca81c35a4f34a3a8d3830c4f1446c4b&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('9ca81c35a4f34a3a8d3830c4f1446c4b','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?学号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SNO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SNO" value="" title_name="?学号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>姓名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SNAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SNAME" value="" title_name="姓名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?爱好</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="HOBBY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="HOBBY" value="" title_name="?爱好" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?民族</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NATION" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NATION" value="" title_name="?民族" />px
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
		<bu:submit viewId="d558c0143fa64ffc95319d7fdc3f3349" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d558c0143fa64ffc95319d7fdc3f3349" />
    
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
    if(formId=='9ca81c35a4f34a3a8d3830c4f1446c4b'){<%--组织机构传参测试1129--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SNO' name='noprintset_SNO' class='datagrid-cell "+ms.tdClass(formId, 'SNO')+"' style='"+ms.tdStyle(formId, 'SNO')+"' "+ms.tdEvent(formId, 'SNO')+">")
            arrHtml.push("<span colno='SNO' class='"+ms.uiClass(formId, 'SNO')+"' style='"+ms.uiStyle(formId, 'SNO')+"' "+ms.uiEvent(formId, 'SNO')+" title='"+ms.titleAttr(formId,'SNO','IS_TITLE_ATTR',v)+"' >"+v['SNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SNAME' name='noprintset_SNAME' class='datagrid-cell "+ms.tdClass(formId, 'SNAME')+"' style='"+ms.tdStyle(formId, 'SNAME')+"' "+ms.tdEvent(formId, 'SNAME')+">")
            arrHtml.push("<span colno='SNAME' class='"+ms.uiClass(formId, 'SNAME')+"' style='"+ms.uiStyle(formId, 'SNAME')+"' "+ms.uiEvent(formId, 'SNAME')+" title='"+ms.titleAttr(formId,'SNAME','IS_TITLE_ATTR',v)+"' >"+v['SNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HOBBY' name='noprintset_HOBBY' class='datagrid-cell "+ms.tdClass(formId, 'HOBBY')+"' style='"+ms.tdStyle(formId, 'HOBBY')+"' "+ms.tdEvent(formId, 'HOBBY')+">")
            arrHtml.push("<span colno='HOBBY' class='"+ms.uiClass(formId, 'HOBBY')+"' style='"+ms.uiStyle(formId, 'HOBBY')+"' "+ms.uiEvent(formId, 'HOBBY')+" title='"+ms.titleAttr(formId,'HOBBY','IS_TITLE_ATTR',v)+"' >"+v['HOBBY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NATION' name='noprintset_NATION' class='datagrid-cell "+ms.tdClass(formId, 'NATION')+"' style='"+ms.tdStyle(formId, 'NATION')+"' "+ms.tdEvent(formId, 'NATION')+">")
            arrHtml.push("<span colno='NATION' class='"+ms.uiClass(formId, 'NATION')+"' style='"+ms.uiStyle(formId, 'NATION')+"' "+ms.uiEvent(formId, 'NATION')+" title='"+ms.titleAttr(formId,'NATION','IS_TITLE_ATTR',v)+"' >"+v['NATION']+"</span>")
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
    if(formId=='9ca81c35a4f34a3a8d3830c4f1446c4b'){<%--组织机构传参测试1129--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='SNO' name='noprintset_SNO' class='datagrid-cell "+ms.tdClass(formId, 'SNO')+"' style='"+ms.tdStyle(formId, 'SNO')+"' "+ms.tdEvent(formId, 'SNO')+">")
            arrHtml.push("<span colno='SNO' class='"+ms.uiClass(formId, 'SNO')+"' style='"+ms.uiStyle(formId, 'SNO')+"' "+ms.uiEvent(formId, 'SNO')+" title='"+ms.titleAttr(formId,'SNO','IS_TITLE_ATTR',v)+"' >"+v['SNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SNAME' name='noprintset_SNAME' class='datagrid-cell "+ms.tdClass(formId, 'SNAME')+"' style='"+ms.tdStyle(formId, 'SNAME')+"' "+ms.tdEvent(formId, 'SNAME')+">")
            arrHtml.push("<span colno='SNAME' class='"+ms.uiClass(formId, 'SNAME')+"' style='"+ms.uiStyle(formId, 'SNAME')+"' "+ms.uiEvent(formId, 'SNAME')+" title='"+ms.titleAttr(formId,'SNAME','IS_TITLE_ATTR',v)+"' >"+v['SNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HOBBY' name='noprintset_HOBBY' class='datagrid-cell "+ms.tdClass(formId, 'HOBBY')+"' style='"+ms.tdStyle(formId, 'HOBBY')+"' "+ms.tdEvent(formId, 'HOBBY')+">")
            arrHtml.push("<span colno='HOBBY' class='"+ms.uiClass(formId, 'HOBBY')+"' style='"+ms.uiStyle(formId, 'HOBBY')+"' "+ms.uiEvent(formId, 'HOBBY')+" title='"+ms.titleAttr(formId,'HOBBY','IS_TITLE_ATTR',v)+"' >"+v['HOBBY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NATION' name='noprintset_NATION' class='datagrid-cell "+ms.tdClass(formId, 'NATION')+"' style='"+ms.tdStyle(formId, 'NATION')+"' "+ms.tdEvent(formId, 'NATION')+">")
            arrHtml.push("<span colno='NATION' class='"+ms.uiClass(formId, 'NATION')+"' style='"+ms.uiStyle(formId, 'NATION')+"' "+ms.uiEvent(formId, 'NATION')+" title='"+ms.titleAttr(formId,'NATION','IS_TITLE_ATTR',v)+"' >"+v['NATION']+"</span>")
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
