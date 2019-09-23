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
		<dict:lang value="用户表sy_user1129" />
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
		<bu:header formId ="e73cc4c283014c569bb154374b9d0025"/>

    
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
		<bu:func viewId="03a0bd45ba4e434b93ab33bd36aa2e7f" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="03a0bd45ba4e434b93ab33bd36aa2e7f" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagee73cc4c283014c569bb154374b9d0025" id="formPagee73cc4c283014c569bb154374b9d0025" value="${formPagee73cc4c283014c569bb154374b9d0025}"/>
		<input type="hidden" name="formId" id="formId1" value='e73cc4c283014c569bb154374b9d0025'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="e73cc4c283014c569bb154374b9d0025">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxe73cc4c283014c569bb154374b9d0025" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innere73cc4c283014c569bb154374b9d0025">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablee73cc4c283014c569bb154374b9d0025">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="e73cc4c283014c569bb154374b9d0025" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_e73cc4c283014c569bb154374b9d0025" onclick="_selectAjaxTableAllData(this,'e73cc4c283014c569bb154374b9d0025')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_LOGIN_NAME" class="datagrid-cell"><bu:uitn colNo="LOGIN_NAME" formId="e73cc4c283014c569bb154374b9d0025" /></td>
			<td name="noprintset_NAME" class="datagrid-cell"><bu:uitn colNo="NAME" formId="e73cc4c283014c569bb154374b9d0025" /></td>
			<td name="noprintset_DEPTID" class="datagrid-cell"><bu:uitn colNo="DEPTID" formId="e73cc4c283014c569bb154374b9d0025" /></td>
			<td name="noprintset_ENGLISHNAME" class="datagrid-cell"><bu:uitn colNo="ENGLISHNAME" formId="e73cc4c283014c569bb154374b9d0025" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDive73cc4c283014c569bb154374b9d0025" onscroll="ajaxTableScroll(this,'e73cc4c283014c569bb154374b9d0025')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxe73cc4c283014c569bb154374b9d0025">
		<tbody id="tbody_e73cc4c283014c569bb154374b9d0025" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagee73cc4c283014c569bb154374b9d0025==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=e73cc4c283014c569bb154374b9d0025&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('e73cc4c283014c569bb154374b9d0025','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>登录名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="LOGIN_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="LOGIN_NAME" value="" title_name="登录名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>姓名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NAME" value="" title_name="姓名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?部门ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DEPTID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DEPTID" value="" title_name="?部门ID" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?英文名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ENGLISHNAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ENGLISHNAME" value="" title_name="?英文名" />px
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
		<bu:submit viewId="03a0bd45ba4e434b93ab33bd36aa2e7f" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="03a0bd45ba4e434b93ab33bd36aa2e7f" />
    
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
    if(formId=='e73cc4c283014c569bb154374b9d0025'){<%--用户表sy_user1129--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LOGIN_NAME' name='noprintset_LOGIN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'LOGIN_NAME')+"' style='"+ms.tdStyle(formId, 'LOGIN_NAME')+"' "+ms.tdEvent(formId, 'LOGIN_NAME')+">")
            arrHtml.push("<span colno='LOGIN_NAME' class='"+ms.uiClass(formId, 'LOGIN_NAME')+"' style='"+ms.uiStyle(formId, 'LOGIN_NAME')+"' "+ms.uiEvent(formId, 'LOGIN_NAME')+" title='"+ms.titleAttr(formId,'LOGIN_NAME','IS_TITLE_ATTR',v)+"' >"+v['LOGIN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NAME' name='noprintset_NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" title='"+ms.titleAttr(formId,'NAME','IS_TITLE_ATTR',v)+"' >"+v['NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DEPTID' name='noprintset_DEPTID' class='datagrid-cell "+ms.tdClass(formId, 'DEPTID')+"' style='"+ms.tdStyle(formId, 'DEPTID')+"' "+ms.tdEvent(formId, 'DEPTID')+">")
            arrHtml.push("<span colno='DEPTID' class='"+ms.uiClass(formId, 'DEPTID')+"' style='"+ms.uiStyle(formId, 'DEPTID')+"' "+ms.uiEvent(formId, 'DEPTID')+" title='"+ms.titleAttr(formId,'DEPTID','IS_TITLE_ATTR',v)+"' >"+v['DEPTID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ENGLISHNAME' name='noprintset_ENGLISHNAME' class='datagrid-cell "+ms.tdClass(formId, 'ENGLISHNAME')+"' style='"+ms.tdStyle(formId, 'ENGLISHNAME')+"' "+ms.tdEvent(formId, 'ENGLISHNAME')+">")
            arrHtml.push("<span colno='ENGLISHNAME' class='"+ms.uiClass(formId, 'ENGLISHNAME')+"' style='"+ms.uiStyle(formId, 'ENGLISHNAME')+"' "+ms.uiEvent(formId, 'ENGLISHNAME')+" title='"+ms.titleAttr(formId,'ENGLISHNAME','IS_TITLE_ATTR',v)+"' >"+v['ENGLISHNAME']+"</span>")
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
    if(formId=='e73cc4c283014c569bb154374b9d0025'){<%--用户表sy_user1129--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='LOGIN_NAME' name='noprintset_LOGIN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'LOGIN_NAME')+"' style='"+ms.tdStyle(formId, 'LOGIN_NAME')+"' "+ms.tdEvent(formId, 'LOGIN_NAME')+">")
            arrHtml.push("<span colno='LOGIN_NAME' class='"+ms.uiClass(formId, 'LOGIN_NAME')+"' style='"+ms.uiStyle(formId, 'LOGIN_NAME')+"' "+ms.uiEvent(formId, 'LOGIN_NAME')+" title='"+ms.titleAttr(formId,'LOGIN_NAME','IS_TITLE_ATTR',v)+"' >"+v['LOGIN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NAME' name='noprintset_NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" title='"+ms.titleAttr(formId,'NAME','IS_TITLE_ATTR',v)+"' >"+v['NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DEPTID' name='noprintset_DEPTID' class='datagrid-cell "+ms.tdClass(formId, 'DEPTID')+"' style='"+ms.tdStyle(formId, 'DEPTID')+"' "+ms.tdEvent(formId, 'DEPTID')+">")
            arrHtml.push("<span colno='DEPTID' class='"+ms.uiClass(formId, 'DEPTID')+"' style='"+ms.uiStyle(formId, 'DEPTID')+"' "+ms.uiEvent(formId, 'DEPTID')+" title='"+ms.titleAttr(formId,'DEPTID','IS_TITLE_ATTR',v)+"' >"+v['DEPTID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ENGLISHNAME' name='noprintset_ENGLISHNAME' class='datagrid-cell "+ms.tdClass(formId, 'ENGLISHNAME')+"' style='"+ms.tdStyle(formId, 'ENGLISHNAME')+"' "+ms.tdEvent(formId, 'ENGLISHNAME')+">")
            arrHtml.push("<span colno='ENGLISHNAME' class='"+ms.uiClass(formId, 'ENGLISHNAME')+"' style='"+ms.uiStyle(formId, 'ENGLISHNAME')+"' "+ms.uiEvent(formId, 'ENGLISHNAME')+" title='"+ms.titleAttr(formId,'ENGLISHNAME','IS_TITLE_ATTR',v)+"' >"+v['ENGLISHNAME']+"</span>")
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
