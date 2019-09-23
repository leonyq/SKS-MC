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
		<dict:lang value="fzpzQuery" />
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
		<bu:header formId ="19dc46b92c344449830960022e0f0c88"/>

    
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
		<bu:func viewId="40b823b23a09419296db16a96543bd75" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="40b823b23a09419296db16a96543bd75" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage19dc46b92c344449830960022e0f0c88" id="formPage19dc46b92c344449830960022e0f0c88" value="${formPage19dc46b92c344449830960022e0f0c88}"/>
		<input type="hidden" name="formId" id="formId1" value='19dc46b92c344449830960022e0f0c88'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="19dc46b92c344449830960022e0f0c88">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax19dc46b92c344449830960022e0f0c88" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner19dc46b92c344449830960022e0f0c88">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable19dc46b92c344449830960022e0f0c88">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="19dc46b92c344449830960022e0f0c88" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_19dc46b92c344449830960022e0f0c88" onclick="_selectAjaxTableAllData(this,'19dc46b92c344449830960022e0f0c88')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_TYPE" style="width:200px; text-align:center;" class="datagrid-cell"><bu:uitn colNo="TYPE" formId="19dc46b92c344449830960022e0f0c88" /></td>
			<td name="noprintset_FACTORY_ID" style="width:250px; text-align:center;" class="datagrid-cell"><bu:uitn colNo="FACTORY_ID" formId="19dc46b92c344449830960022e0f0c88" /></td>
			<td name="noprintset_WORK_STATION" style="width:250px; text-align:center;" class="datagrid-cell"><bu:uitn colNo="WORK_STATION" formId="19dc46b92c344449830960022e0f0c88" /></td>
			<td name="noprintset_RELATED_CODE" style="width:250px; text-align:center;" class="datagrid-cell"><bu:uitn colNo="RELATED_CODE" formId="19dc46b92c344449830960022e0f0c88" /></td>
			<td name="noprintset_THRESHOLD_NUM" style="width:150px; text-align:center;" class="datagrid-cell"><bu:uitn colNo="THRESHOLD_NUM" formId="19dc46b92c344449830960022e0f0c88" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv19dc46b92c344449830960022e0f0c88" onscroll="ajaxTableScroll(this,'19dc46b92c344449830960022e0f0c88')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax19dc46b92c344449830960022e0f0c88">
		<tbody id="tbody_19dc46b92c344449830960022e0f0c88" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage19dc46b92c344449830960022e0f0c88==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=19dc46b92c344449830960022e0f0c88&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('19dc46b92c344449830960022e0f0c88','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TYPE" value="" title_name="类型" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?工厂</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FACTORY_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FACTORY_ID" value="" title_name="?工厂" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>车间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WORK_STATION" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WORK_STATION" value="" title_name="车间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?关联编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RELATED_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RELATED_CODE" value="" title_name="?关联编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?阈值</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="THRESHOLD_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="THRESHOLD_NUM" value="" title_name="?阈值" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?权重</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WEIGHTS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WEIGHTS" value="" title_name="?权重" />px
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
		<bu:submit viewId="40b823b23a09419296db16a96543bd75" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="40b823b23a09419296db16a96543bd75" />
    
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
    if(formId=='19dc46b92c344449830960022e0f0c88'){<%--阈值配置表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TYPE' name='noprintset_TYPE' class='datagrid-cell  "+ms.tdClass(formId, 'TYPE')+"' style='"+ms.tdStyle(formId, 'TYPE')+"' "+ms.tdEvent(formId, 'TYPE')+">");
            arrHtml.push("<span colno='TYPE' class='"+ms.uiClass(formId, 'TYPE')+"' style='"+ms.uiStyle(formId, 'TYPE')+"' "+ms.uiEvent(formId, 'TYPE')+" title='"+ms.titleAttr(formId,'TYPE','IS_TITLE_ATTR',v)+"' >"+v['TYPE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FACTORY_ID' name='noprintset_FACTORY_ID' class='datagrid-cell  "+ms.tdClass(formId, 'FACTORY_ID')+"' style='"+ms.tdStyle(formId, 'FACTORY_ID')+"' "+ms.tdEvent(formId, 'FACTORY_ID')+">");
            arrHtml.push("<span colno='FACTORY_ID' class='"+ms.uiClass(formId, 'FACTORY_ID')+"' style='"+ms.uiStyle(formId, 'FACTORY_ID')+"' "+ms.uiEvent(formId, 'FACTORY_ID')+" title='"+ms.titleAttr(formId,'FACTORY_ID','IS_TITLE_ATTR',v)+"' >"+v['FACTORY_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_STATION' name='noprintset_WORK_STATION' class='datagrid-cell  "+ms.tdClass(formId, 'WORK_STATION')+"' style='"+ms.tdStyle(formId, 'WORK_STATION')+"' "+ms.tdEvent(formId, 'WORK_STATION')+">");
            arrHtml.push("<span colno='WORK_STATION' class='"+ms.uiClass(formId, 'WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WORK_STATION')+"' "+ms.uiEvent(formId, 'WORK_STATION')+" title='"+ms.titleAttr(formId,'WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WORK_STATION']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RELATED_CODE' name='noprintset_RELATED_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'RELATED_CODE')+"' style='"+ms.tdStyle(formId, 'RELATED_CODE')+"' "+ms.tdEvent(formId, 'RELATED_CODE')+">");
            arrHtml.push("<span colno='RELATED_CODE' class='"+ms.uiClass(formId, 'RELATED_CODE')+"' style='"+ms.uiStyle(formId, 'RELATED_CODE')+"' "+ms.uiEvent(formId, 'RELATED_CODE')+" title='"+ms.titleAttr(formId,'RELATED_CODE','IS_TITLE_ATTR',v)+"' >"+v['RELATED_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THRESHOLD_NUM' name='noprintset_THRESHOLD_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_NUM')+"' "+ms.tdEvent(formId, 'THRESHOLD_NUM')+">");
            arrHtml.push("<span colno='THRESHOLD_NUM' class='"+ms.uiClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_NUM')+"' "+ms.uiEvent(formId, 'THRESHOLD_NUM')+" title='"+ms.titleAttr(formId,'THRESHOLD_NUM','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEIGHTS' name='noprintset_WEIGHTS' class='datagrid-cell  "+ms.tdClass(formId, 'WEIGHTS')+"' style='"+ms.tdStyle(formId, 'WEIGHTS')+"' "+ms.tdEvent(formId, 'WEIGHTS')+">");
            arrHtml.push("<span colno='WEIGHTS' class='"+ms.uiClass(formId, 'WEIGHTS')+"' style='"+ms.uiStyle(formId, 'WEIGHTS')+"' "+ms.uiEvent(formId, 'WEIGHTS')+" title='"+ms.titleAttr(formId,'WEIGHTS','IS_TITLE_ATTR',v)+"' >"+v['WEIGHTS']+"</span>");
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
    if(formId=='19dc46b92c344449830960022e0f0c88'){<%--阈值配置表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='TYPE' name='noprintset_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TYPE')+"' style='"+ms.tdStyle(formId, 'TYPE')+"' "+ms.tdEvent(formId, 'TYPE')+">");
            arrHtml.push("<span colno='TYPE' class='"+ms.uiClass(formId, 'TYPE')+"' style='"+ms.uiStyle(formId, 'TYPE')+"' "+ms.uiEvent(formId, 'TYPE')+" title='"+ms.titleAttr(formId,'TYPE','IS_TITLE_ATTR',v)+"' >"+v['TYPE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FACTORY_ID' name='noprintset_FACTORY_ID' class='datagrid-cell "+ms.tdClass(formId, 'FACTORY_ID')+"' style='"+ms.tdStyle(formId, 'FACTORY_ID')+"' "+ms.tdEvent(formId, 'FACTORY_ID')+">");
            arrHtml.push("<span colno='FACTORY_ID' class='"+ms.uiClass(formId, 'FACTORY_ID')+"' style='"+ms.uiStyle(formId, 'FACTORY_ID')+"' "+ms.uiEvent(formId, 'FACTORY_ID')+" title='"+ms.titleAttr(formId,'FACTORY_ID','IS_TITLE_ATTR',v)+"' >"+v['FACTORY_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WORK_STATION' name='noprintset_WORK_STATION' class='datagrid-cell "+ms.tdClass(formId, 'WORK_STATION')+"' style='"+ms.tdStyle(formId, 'WORK_STATION')+"' "+ms.tdEvent(formId, 'WORK_STATION')+">");
            arrHtml.push("<span colno='WORK_STATION' class='"+ms.uiClass(formId, 'WORK_STATION')+"' style='"+ms.uiStyle(formId, 'WORK_STATION')+"' "+ms.uiEvent(formId, 'WORK_STATION')+" title='"+ms.titleAttr(formId,'WORK_STATION','IS_TITLE_ATTR',v)+"' >"+v['WORK_STATION']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RELATED_CODE' name='noprintset_RELATED_CODE' class='datagrid-cell "+ms.tdClass(formId, 'RELATED_CODE')+"' style='"+ms.tdStyle(formId, 'RELATED_CODE')+"' "+ms.tdEvent(formId, 'RELATED_CODE')+">");
            arrHtml.push("<span colno='RELATED_CODE' class='"+ms.uiClass(formId, 'RELATED_CODE')+"' style='"+ms.uiStyle(formId, 'RELATED_CODE')+"' "+ms.uiEvent(formId, 'RELATED_CODE')+" title='"+ms.titleAttr(formId,'RELATED_CODE','IS_TITLE_ATTR',v)+"' >"+v['RELATED_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='THRESHOLD_NUM' name='noprintset_THRESHOLD_NUM' class='datagrid-cell "+ms.tdClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.tdStyle(formId, 'THRESHOLD_NUM')+"' "+ms.tdEvent(formId, 'THRESHOLD_NUM')+">");
            arrHtml.push("<span colno='THRESHOLD_NUM' class='"+ms.uiClass(formId, 'THRESHOLD_NUM')+"' style='"+ms.uiStyle(formId, 'THRESHOLD_NUM')+"' "+ms.uiEvent(formId, 'THRESHOLD_NUM')+" title='"+ms.titleAttr(formId,'THRESHOLD_NUM','IS_TITLE_ATTR',v)+"' >"+v['THRESHOLD_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEIGHTS' name='noprintset_WEIGHTS' class='datagrid-cell "+ms.tdClass(formId, 'WEIGHTS')+"' style='"+ms.tdStyle(formId, 'WEIGHTS')+"' "+ms.tdEvent(formId, 'WEIGHTS')+">");
            arrHtml.push("<span colno='WEIGHTS' class='"+ms.uiClass(formId, 'WEIGHTS')+"' style='"+ms.uiStyle(formId, 'WEIGHTS')+"' "+ms.uiEvent(formId, 'WEIGHTS')+" title='"+ms.titleAttr(formId,'WEIGHTS','IS_TITLE_ATTR',v)+"' >"+v['WEIGHTS']+"</span>");
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
