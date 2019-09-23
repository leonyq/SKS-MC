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
		<dict:lang value="FZOR12" />
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
		<bu:header formId ="6190495f36a54e76a2e70e7d6641fcdc"/>

    
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
		<bu:func viewId="ef16a6c3943c48f4a71088343cad9aa5" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="ef16a6c3943c48f4a71088343cad9aa5" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage6190495f36a54e76a2e70e7d6641fcdc" id="formPage6190495f36a54e76a2e70e7d6641fcdc" value="${formPage6190495f36a54e76a2e70e7d6641fcdc}"/>
		<input type="hidden" name="formId" id="formId1" value='6190495f36a54e76a2e70e7d6641fcdc'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="6190495f36a54e76a2e70e7d6641fcdc">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax6190495f36a54e76a2e70e7d6641fcdc" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner6190495f36a54e76a2e70e7d6641fcdc">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable6190495f36a54e76a2e70e7d6641fcdc">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="6190495f36a54e76a2e70e7d6641fcdc" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_6190495f36a54e76a2e70e7d6641fcdc" onclick="_selectAjaxTableAllData(this,'6190495f36a54e76a2e70e7d6641fcdc')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_NAME" class="datagrid-cell"><bu:uitn colNo="NAME" formId="6190495f36a54e76a2e70e7d6641fcdc" /></td>
			<td name="noprintset_AGE" class="datagrid-cell"><bu:uitn colNo="AGE" formId="6190495f36a54e76a2e70e7d6641fcdc" /></td>
			<td name="noprintset_TIMES" class="datagrid-cell"><bu:uitn colNo="TIMES" formId="6190495f36a54e76a2e70e7d6641fcdc" /></td>
			<td name="noprintset_TIMEDATES" class="datagrid-cell"><bu:uitn colNo="TIMEDATES" formId="6190495f36a54e76a2e70e7d6641fcdc" /></td>
			<td name="noprintset_DAWENBEN" class="datagrid-cell"><bu:uitn colNo="DAWENBEN" formId="6190495f36a54e76a2e70e7d6641fcdc" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv6190495f36a54e76a2e70e7d6641fcdc" onscroll="ajaxTableScroll(this,'6190495f36a54e76a2e70e7d6641fcdc')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax6190495f36a54e76a2e70e7d6641fcdc">
		<tbody id="tbody_6190495f36a54e76a2e70e7d6641fcdc" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage6190495f36a54e76a2e70e7d6641fcdc==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=6190495f36a54e76a2e70e7d6641fcdc&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('6190495f36a54e76a2e70e7d6641fcdc','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?名字</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NAME" value="" title_name="?名字" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?年纪</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AGE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AGE" value="" title_name="?年纪" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TIMES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TIMES" value="" title_name="日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>日期时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TIMEDATES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TIMEDATES" value="" title_name="日期时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>大文本</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DAWENBEN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DAWENBEN" value="" title_name="大文本" />px
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
		<bu:submit viewId="ef16a6c3943c48f4a71088343cad9aa5" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="ef16a6c3943c48f4a71088343cad9aa5" />
    
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
    if(formId=='6190495f36a54e76a2e70e7d6641fcdc'){<%--FOR12--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NAME' name='noprintset_NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" title='"+ms.titleAttr(formId,'NAME','IS_TITLE_ATTR',v)+"' >"+v['NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' name='noprintset_AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" title='"+ms.titleAttr(formId,'AGE','IS_TITLE_ATTR',v)+"' >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIMES' name='noprintset_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'TIMES')+"' style='"+ms.tdStyle(formId, 'TIMES')+"' "+ms.tdEvent(formId, 'TIMES')+">")
            arrHtml.push("<span colno='TIMES' class='"+ms.uiClass(formId, 'TIMES')+"' style='"+ms.uiStyle(formId, 'TIMES')+"' "+ms.uiEvent(formId, 'TIMES')+" title='"+ms.titleAttr(formId,'TIMES','IS_TITLE_ATTR',v)+"' >"+v['TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIMEDATES' name='noprintset_TIMEDATES' class='datagrid-cell "+ms.tdClass(formId, 'TIMEDATES')+"' style='"+ms.tdStyle(formId, 'TIMEDATES')+"' "+ms.tdEvent(formId, 'TIMEDATES')+">")
            arrHtml.push("<span colno='TIMEDATES' class='"+ms.uiClass(formId, 'TIMEDATES')+"' style='"+ms.uiStyle(formId, 'TIMEDATES')+"' "+ms.uiEvent(formId, 'TIMEDATES')+" title='"+ms.titleAttr(formId,'TIMEDATES','IS_TITLE_ATTR',v)+"' >"+v['TIMEDATES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DAWENBEN' name='noprintset_DAWENBEN' class='datagrid-cell "+ms.tdClass(formId, 'DAWENBEN')+"' style='"+ms.tdStyle(formId, 'DAWENBEN')+"' "+ms.tdEvent(formId, 'DAWENBEN')+">")
            arrHtml.push("<span colno='DAWENBEN' class='"+ms.uiClass(formId, 'DAWENBEN')+"' style='"+ms.uiStyle(formId, 'DAWENBEN')+"' "+ms.uiEvent(formId, 'DAWENBEN')+" title='"+ms.titleAttr(formId,'DAWENBEN','IS_TITLE_ATTR',v)+"' >"+v['DAWENBEN']+"</span>")
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
    if(formId=='6190495f36a54e76a2e70e7d6641fcdc'){<%--FOR12--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='NAME' name='noprintset_NAME' class='datagrid-cell "+ms.tdClass(formId, 'NAME')+"' style='"+ms.tdStyle(formId, 'NAME')+"' "+ms.tdEvent(formId, 'NAME')+">")
            arrHtml.push("<span colno='NAME' class='"+ms.uiClass(formId, 'NAME')+"' style='"+ms.uiStyle(formId, 'NAME')+"' "+ms.uiEvent(formId, 'NAME')+" title='"+ms.titleAttr(formId,'NAME','IS_TITLE_ATTR',v)+"' >"+v['NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AGE' name='noprintset_AGE' class='datagrid-cell "+ms.tdClass(formId, 'AGE')+"' style='"+ms.tdStyle(formId, 'AGE')+"' "+ms.tdEvent(formId, 'AGE')+">")
            arrHtml.push("<span colno='AGE' class='"+ms.uiClass(formId, 'AGE')+"' style='"+ms.uiStyle(formId, 'AGE')+"' "+ms.uiEvent(formId, 'AGE')+" title='"+ms.titleAttr(formId,'AGE','IS_TITLE_ATTR',v)+"' >"+v['AGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIMES' name='noprintset_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'TIMES')+"' style='"+ms.tdStyle(formId, 'TIMES')+"' "+ms.tdEvent(formId, 'TIMES')+">")
            arrHtml.push("<span colno='TIMES' class='"+ms.uiClass(formId, 'TIMES')+"' style='"+ms.uiStyle(formId, 'TIMES')+"' "+ms.uiEvent(formId, 'TIMES')+" title='"+ms.titleAttr(formId,'TIMES','IS_TITLE_ATTR',v)+"' >"+v['TIMES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TIMEDATES' name='noprintset_TIMEDATES' class='datagrid-cell "+ms.tdClass(formId, 'TIMEDATES')+"' style='"+ms.tdStyle(formId, 'TIMEDATES')+"' "+ms.tdEvent(formId, 'TIMEDATES')+">")
            arrHtml.push("<span colno='TIMEDATES' class='"+ms.uiClass(formId, 'TIMEDATES')+"' style='"+ms.uiStyle(formId, 'TIMEDATES')+"' "+ms.uiEvent(formId, 'TIMEDATES')+" title='"+ms.titleAttr(formId,'TIMEDATES','IS_TITLE_ATTR',v)+"' >"+v['TIMEDATES']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='DAWENBEN' name='noprintset_DAWENBEN' class='datagrid-cell "+ms.tdClass(formId, 'DAWENBEN')+"' style='"+ms.tdStyle(formId, 'DAWENBEN')+"' "+ms.tdEvent(formId, 'DAWENBEN')+">")
            arrHtml.push("<span colno='DAWENBEN' class='"+ms.uiClass(formId, 'DAWENBEN')+"' style='"+ms.uiStyle(formId, 'DAWENBEN')+"' "+ms.uiEvent(formId, 'DAWENBEN')+" title='"+ms.titleAttr(formId,'DAWENBEN','IS_TITLE_ATTR',v)+"' >"+v['DAWENBEN']+"</span>")
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
