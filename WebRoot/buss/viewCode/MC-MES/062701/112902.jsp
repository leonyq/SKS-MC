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
		<dict:lang value="Saw添加子表单测试" />
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
		<bu:header formId ="f69567eebdea49e3a7beda6632613e4a"/>

    
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
		<bu:func viewId="f51c23edc331483bafc18774573dc230" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="f51c23edc331483bafc18774573dc230" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
                     
         <input type="hidden" name="mc_sname" id="mc_sname" value="yfl"/> 
        <input type="hidden" name="mc_deptname" id="mc_deptname" value="zh"/> 
        
        
		<input type="hidden" name="formPagef69567eebdea49e3a7beda6632613e4a" id="formPagef69567eebdea49e3a7beda6632613e4a" value="${formPagef69567eebdea49e3a7beda6632613e4a}"/>
		<input type="hidden" name="formId" id="formId1" value='f69567eebdea49e3a7beda6632613e4a'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="f69567eebdea49e3a7beda6632613e4a">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf69567eebdea49e3a7beda6632613e4a" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerf69567eebdea49e3a7beda6632613e4a">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef69567eebdea49e3a7beda6632613e4a">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="f69567eebdea49e3a7beda6632613e4a" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_f69567eebdea49e3a7beda6632613e4a" onclick="_selectAjaxTableAllData(this,'f69567eebdea49e3a7beda6632613e4a')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_SNO" class="datagrid-cell"><bu:uitn colNo="SNO" formId="f69567eebdea49e3a7beda6632613e4a" /></td>
			<td name="noprintset_SNAME" class="datagrid-cell"><bu:uitn colNo="SNAME" formId="f69567eebdea49e3a7beda6632613e4a" /></td>
			<td name="noprintset_DEPTS" class="datagrid-cell"><bu:uitn colNo="DEPTS" formId="f69567eebdea49e3a7beda6632613e4a" /></td>
			<td name="noprintset_ENGLISHNAME" class="datagrid-cell"><bu:uitn colNo="ENGLISHNAME" formId="f69567eebdea49e3a7beda6632613e4a" /></td>
			<td name="noprintset_T2#NAME" class="datagrid-cell"><bu:uitn colNo="T2#NAME" formId="f69567eebdea49e3a7beda6632613e4a" /></td>
			<td name="noprintset_T2#LOGIN_NAME" class="datagrid-cell"><bu:uitn colNo="T2#LOGIN_NAME" formId="f69567eebdea49e3a7beda6632613e4a" /></td>
			<td name="noprintset_T2#DEPT_ID" class="datagrid-cell"><bu:uitn colNo="T2#DEPT_ID" formId="f69567eebdea49e3a7beda6632613e4a" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivf69567eebdea49e3a7beda6632613e4a" onscroll="ajaxTableScroll(this,'f69567eebdea49e3a7beda6632613e4a')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxf69567eebdea49e3a7beda6632613e4a">
		<tbody id="tbody_f69567eebdea49e3a7beda6632613e4a" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagef69567eebdea49e3a7beda6632613e4a==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=f69567eebdea49e3a7beda6632613e4a&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('f69567eebdea49e3a7beda6632613e4a','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>部门</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DEPTS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DEPTS" value="" title_name="部门" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>英文名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ENGLISHNAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ENGLISHNAME" value="" title_name="英文名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?员工名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#NAME" value="" title_name="?员工名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>登录名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#LOGIN_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#LOGIN_NAME" value="" title_name="登录名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?部门ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#DEPT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#DEPT_ID" value="" title_name="?部门ID" />px
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
		<bu:submit viewId="f51c23edc331483bafc18774573dc230" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="f51c23edc331483bafc18774573dc230" />
    
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
    if(formId=='f69567eebdea49e3a7beda6632613e4a'){<%--Saw添加子表单测试--%>
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
            arrHtml.push("<td colno='DEPTS' name='noprintset_DEPTS' class='datagrid-cell "+ms.tdClass(formId, 'DEPTS')+"' style='"+ms.tdStyle(formId, 'DEPTS')+"' "+ms.tdEvent(formId, 'DEPTS')+">")
            arrHtml.push("<span colno='DEPTS' class='"+ms.uiClass(formId, 'DEPTS')+"' style='"+ms.uiStyle(formId, 'DEPTS')+"' "+ms.uiEvent(formId, 'DEPTS')+" title='"+ms.titleAttr(formId,'DEPTS','IS_TITLE_ATTR',v)+"' >"+v['DEPTS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ENGLISHNAME' name='noprintset_ENGLISHNAME' class='datagrid-cell "+ms.tdClass(formId, 'ENGLISHNAME')+"' style='"+ms.tdStyle(formId, 'ENGLISHNAME')+"' "+ms.tdEvent(formId, 'ENGLISHNAME')+">")
            arrHtml.push("<span colno='ENGLISHNAME' class='"+ms.uiClass(formId, 'ENGLISHNAME')+"' style='"+ms.uiStyle(formId, 'ENGLISHNAME')+"' "+ms.uiEvent(formId, 'ENGLISHNAME')+" title='"+ms.titleAttr(formId,'ENGLISHNAME','IS_TITLE_ATTR',v)+"' >"+v['ENGLISHNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#NAME' name='noprintset_T2#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#NAME')+"' style='"+ms.tdStyle(formId, 'T2#NAME')+"' "+ms.tdEvent(formId, 'T2#NAME')+">")
            arrHtml.push("<span colno='T2#NAME' class='"+ms.uiClass(formId, 'T2#NAME')+"' style='"+ms.uiStyle(formId, 'T2#NAME')+"' "+ms.uiEvent(formId, 'T2#NAME')+" title='"+ms.titleAttr(formId,'T2#NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#LOGIN_NAME' name='noprintset_T2#LOGIN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#LOGIN_NAME')+"' style='"+ms.tdStyle(formId, 'T2#LOGIN_NAME')+"' "+ms.tdEvent(formId, 'T2#LOGIN_NAME')+">")
            arrHtml.push("<span colno='T2#LOGIN_NAME' class='"+ms.uiClass(formId, 'T2#LOGIN_NAME')+"' style='"+ms.uiStyle(formId, 'T2#LOGIN_NAME')+"' "+ms.uiEvent(formId, 'T2#LOGIN_NAME')+" title='"+ms.titleAttr(formId,'T2#LOGIN_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#LOGIN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#DEPT_ID' name='noprintset_T2#DEPT_ID' class='datagrid-cell "+ms.tdClass(formId, 'T2#DEPT_ID')+"' style='"+ms.tdStyle(formId, 'T2#DEPT_ID')+"' "+ms.tdEvent(formId, 'T2#DEPT_ID')+">")
            arrHtml.push("<span colno='T2#DEPT_ID' class='"+ms.uiClass(formId, 'T2#DEPT_ID')+"' style='"+ms.uiStyle(formId, 'T2#DEPT_ID')+"' "+ms.uiEvent(formId, 'T2#DEPT_ID')+" title='"+ms.titleAttr(formId,'T2#DEPT_ID','IS_TITLE_ATTR',v)+"' >"+v['T2#DEPT_ID']+"</span>")
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
    if(formId=='f69567eebdea49e3a7beda6632613e4a'){<%--Saw添加子表单测试--%>
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
            arrHtml.push("<td colno='DEPTS' name='noprintset_DEPTS' class='datagrid-cell "+ms.tdClass(formId, 'DEPTS')+"' style='"+ms.tdStyle(formId, 'DEPTS')+"' "+ms.tdEvent(formId, 'DEPTS')+">")
            arrHtml.push("<span colno='DEPTS' class='"+ms.uiClass(formId, 'DEPTS')+"' style='"+ms.uiStyle(formId, 'DEPTS')+"' "+ms.uiEvent(formId, 'DEPTS')+" title='"+ms.titleAttr(formId,'DEPTS','IS_TITLE_ATTR',v)+"' >"+v['DEPTS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ENGLISHNAME' name='noprintset_ENGLISHNAME' class='datagrid-cell "+ms.tdClass(formId, 'ENGLISHNAME')+"' style='"+ms.tdStyle(formId, 'ENGLISHNAME')+"' "+ms.tdEvent(formId, 'ENGLISHNAME')+">")
            arrHtml.push("<span colno='ENGLISHNAME' class='"+ms.uiClass(formId, 'ENGLISHNAME')+"' style='"+ms.uiStyle(formId, 'ENGLISHNAME')+"' "+ms.uiEvent(formId, 'ENGLISHNAME')+" title='"+ms.titleAttr(formId,'ENGLISHNAME','IS_TITLE_ATTR',v)+"' >"+v['ENGLISHNAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#NAME' name='noprintset_T2#NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#NAME')+"' style='"+ms.tdStyle(formId, 'T2#NAME')+"' "+ms.tdEvent(formId, 'T2#NAME')+">")
            arrHtml.push("<span colno='T2#NAME' class='"+ms.uiClass(formId, 'T2#NAME')+"' style='"+ms.uiStyle(formId, 'T2#NAME')+"' "+ms.uiEvent(formId, 'T2#NAME')+" title='"+ms.titleAttr(formId,'T2#NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#LOGIN_NAME' name='noprintset_T2#LOGIN_NAME' class='datagrid-cell "+ms.tdClass(formId, 'T2#LOGIN_NAME')+"' style='"+ms.tdStyle(formId, 'T2#LOGIN_NAME')+"' "+ms.tdEvent(formId, 'T2#LOGIN_NAME')+">")
            arrHtml.push("<span colno='T2#LOGIN_NAME' class='"+ms.uiClass(formId, 'T2#LOGIN_NAME')+"' style='"+ms.uiStyle(formId, 'T2#LOGIN_NAME')+"' "+ms.uiEvent(formId, 'T2#LOGIN_NAME')+" title='"+ms.titleAttr(formId,'T2#LOGIN_NAME','IS_TITLE_ATTR',v)+"' >"+v['T2#LOGIN_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#DEPT_ID' name='noprintset_T2#DEPT_ID' class='datagrid-cell "+ms.tdClass(formId, 'T2#DEPT_ID')+"' style='"+ms.tdStyle(formId, 'T2#DEPT_ID')+"' "+ms.tdEvent(formId, 'T2#DEPT_ID')+">")
            arrHtml.push("<span colno='T2#DEPT_ID' class='"+ms.uiClass(formId, 'T2#DEPT_ID')+"' style='"+ms.uiStyle(formId, 'T2#DEPT_ID')+"' "+ms.uiEvent(formId, 'T2#DEPT_ID')+" title='"+ms.titleAttr(formId,'T2#DEPT_ID','IS_TITLE_ATTR',v)+"' >"+v['T2#DEPT_ID']+"</span>")
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
