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
		<dict:lang value="完工报告" />
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
		<bu:header formId ="b8f52c26583e4ffd938fba4f2dad7a34"/>

    
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
		<bu:func viewId="2b79c18a612b4d09adf112fb7f4dd327" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="2b79c18a612b4d09adf112fb7f4dd327" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageb8f52c26583e4ffd938fba4f2dad7a34" id="formPageb8f52c26583e4ffd938fba4f2dad7a34" value="${formPageb8f52c26583e4ffd938fba4f2dad7a34}"/>
		<input type="hidden" name="formId" id="formId1" value='b8f52c26583e4ffd938fba4f2dad7a34'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b8f52c26583e4ffd938fba4f2dad7a34">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb8f52c26583e4ffd938fba4f2dad7a34" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb8f52c26583e4ffd938fba4f2dad7a34">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb8f52c26583e4ffd938fba4f2dad7a34">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="b8f52c26583e4ffd938fba4f2dad7a34" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b8f52c26583e4ffd938fba4f2dad7a34" onclick="_selectAjaxTableAllData(this,'b8f52c26583e4ffd938fba4f2dad7a34')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_PMO_NUMBER" class="datagrid-cell"><bu:uitn colNo="PMO_NUMBER" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_PMO_PROJECT_ID" class="datagrid-cell"><bu:uitn colNo="PMO_PROJECT_ID" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_PMO_MODEL_CODE" class="datagrid-cell"><bu:uitn colNo="PMO_MODEL_CODE" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_PMO_AREA_SN" class="datagrid-cell"><bu:uitn colNo="PMO_AREA_SN" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_AREA_NAME" class="datagrid-cell"><bu:uitn colNo="AREA_NAME" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_PMO_PROCESS_FACE" class="datagrid-cell"><bu:uitn colNo="PMO_PROCESS_FACE" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_PMO_TYPE" class="datagrid-cell"><bu:uitn colNo="PMO_TYPE" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_PMO_TECH_SN" class="datagrid-cell"><bu:uitn colNo="PMO_TECH_SN" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_TECH_NAME" class="datagrid-cell"><bu:uitn colNo="TECH_NAME" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_PMO_TIME" class="datagrid-cell"><bu:uitn colNo="PMO_TIME" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
			<td name="noprintset_PMO_EMP" class="datagrid-cell"><bu:uitn colNo="PMO_EMP" formId="b8f52c26583e4ffd938fba4f2dad7a34" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb8f52c26583e4ffd938fba4f2dad7a34" onscroll="ajaxTableScroll(this,'b8f52c26583e4ffd938fba4f2dad7a34')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb8f52c26583e4ffd938fba4f2dad7a34">
		<tbody id="tbody_b8f52c26583e4ffd938fba4f2dad7a34" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb8f52c26583e4ffd938fba4f2dad7a34==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b8f52c26583e4ffd938fba4f2dad7a34&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('b8f52c26583e4ffd938fba4f2dad7a34','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>制令单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_NUMBER" value="" title_name="制令单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_PROJECT_ID" value="" title_name="工单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_MODEL_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_MODEL_CODE" value="" title_name="机种" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>线别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_AREA_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_AREA_SN" value="" title_name="线别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>线别名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AREA_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AREA_NAME" value="" title_name="线别名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>加工面别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_PROCESS_FACE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_PROCESS_FACE" value="" title_name="加工面别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_TYPE" value="" title_name="作业类型" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工艺</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_TECH_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_TECH_SN" value="" title_name="工艺" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工艺名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TECH_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TECH_NAME" value="" title_name="工艺名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>上线时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_TIME" value="" title_name="上线时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业员</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PMO_EMP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PMO_EMP" value="" title_name="作业员" />px
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
		<bu:submit viewId="2b79c18a612b4d09adf112fb7f4dd327" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="2b79c18a612b4d09adf112fb7f4dd327" />
    
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
    if(formId=='b8f52c26583e4ffd938fba4f2dad7a34'){<%--在线制令单信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_NUMBER' name='noprintset_PMO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PMO_NUMBER')+"' style='"+ms.tdStyle(formId, 'PMO_NUMBER')+"' "+ms.tdEvent(formId, 'PMO_NUMBER')+">")
            arrHtml.push("<span colno='PMO_NUMBER' class='"+ms.uiClass(formId, 'PMO_NUMBER')+"' style='"+ms.uiStyle(formId, 'PMO_NUMBER')+"' "+ms.uiEvent(formId, 'PMO_NUMBER')+" title='"+ms.titleAttr(formId,'PMO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PMO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_PROJECT_ID' name='noprintset_PMO_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PMO_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PMO_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PMO_PROJECT_ID')+">")
            arrHtml.push("<span colno='PMO_PROJECT_ID' class='"+ms.uiClass(formId, 'PMO_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PMO_PROJECT_ID')+"' "+ms.uiEvent(formId, 'PMO_PROJECT_ID')+" title='"+ms.titleAttr(formId,'PMO_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PMO_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_MODEL_CODE' name='noprintset_PMO_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PMO_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'PMO_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PMO_MODEL_CODE')+">")
            arrHtml.push("<span colno='PMO_MODEL_CODE' class='"+ms.uiClass(formId, 'PMO_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'PMO_MODEL_CODE')+"' "+ms.uiEvent(formId, 'PMO_MODEL_CODE')+" title='"+ms.titleAttr(formId,'PMO_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['PMO_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_AREA_SN' name='noprintset_PMO_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PMO_AREA_SN')+"' style='"+ms.tdStyle(formId, 'PMO_AREA_SN')+"' "+ms.tdEvent(formId, 'PMO_AREA_SN')+">")
            arrHtml.push("<span colno='PMO_AREA_SN' class='"+ms.uiClass(formId, 'PMO_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PMO_AREA_SN')+"' "+ms.uiEvent(formId, 'PMO_AREA_SN')+" title='"+ms.titleAttr(formId,'PMO_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PMO_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NAME' name='noprintset_AREA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NAME')+"' style='"+ms.tdStyle(formId, 'AREA_NAME')+"' "+ms.tdEvent(formId, 'AREA_NAME')+">")
            arrHtml.push("<span colno='AREA_NAME' class='"+ms.uiClass(formId, 'AREA_NAME')+"' style='"+ms.uiStyle(formId, 'AREA_NAME')+"' "+ms.uiEvent(formId, 'AREA_NAME')+" title='"+ms.titleAttr(formId,'AREA_NAME','IS_TITLE_ATTR',v)+"' >"+v['AREA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_PROCESS_FACE' name='noprintset_PMO_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'PMO_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'PMO_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'PMO_PROCESS_FACE')+">")
            arrHtml.push("<span colno='PMO_PROCESS_FACE' class='"+ms.uiClass(formId, 'PMO_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'PMO_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'PMO_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'PMO_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['PMO_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_TYPE' name='noprintset_PMO_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'PMO_TYPE')+"' style='"+ms.tdStyle(formId, 'PMO_TYPE')+"' "+ms.tdEvent(formId, 'PMO_TYPE')+">")
            arrHtml.push("<span colno='PMO_TYPE' class='"+ms.uiClass(formId, 'PMO_TYPE')+"' style='"+ms.uiStyle(formId, 'PMO_TYPE')+"' "+ms.uiEvent(formId, 'PMO_TYPE')+" title='"+ms.titleAttr(formId,'PMO_TYPE','IS_TITLE_ATTR',v)+"' >"+v['PMO_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_TECH_SN' name='noprintset_PMO_TECH_SN' class='datagrid-cell "+ms.tdClass(formId, 'PMO_TECH_SN')+"' style='"+ms.tdStyle(formId, 'PMO_TECH_SN')+"' "+ms.tdEvent(formId, 'PMO_TECH_SN')+">")
            arrHtml.push("<span colno='PMO_TECH_SN' class='"+ms.uiClass(formId, 'PMO_TECH_SN')+"' style='"+ms.uiStyle(formId, 'PMO_TECH_SN')+"' "+ms.uiEvent(formId, 'PMO_TECH_SN')+" title='"+ms.titleAttr(formId,'PMO_TECH_SN','IS_TITLE_ATTR',v)+"' >"+v['PMO_TECH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TECH_NAME' name='noprintset_TECH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'TECH_NAME')+"' style='"+ms.tdStyle(formId, 'TECH_NAME')+"' "+ms.tdEvent(formId, 'TECH_NAME')+">")
            arrHtml.push("<span colno='TECH_NAME' class='"+ms.uiClass(formId, 'TECH_NAME')+"' style='"+ms.uiStyle(formId, 'TECH_NAME')+"' "+ms.uiEvent(formId, 'TECH_NAME')+" title='"+ms.titleAttr(formId,'TECH_NAME','IS_TITLE_ATTR',v)+"' >"+v['TECH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_TIME' name='noprintset_PMO_TIME' class='datagrid-cell "+ms.tdClass(formId, 'PMO_TIME')+"' style='"+ms.tdStyle(formId, 'PMO_TIME')+"' "+ms.tdEvent(formId, 'PMO_TIME')+">")
            arrHtml.push("<span colno='PMO_TIME' class='"+ms.uiClass(formId, 'PMO_TIME')+"' style='"+ms.uiStyle(formId, 'PMO_TIME')+"' "+ms.uiEvent(formId, 'PMO_TIME')+" title='"+ms.titleAttr(formId,'PMO_TIME','IS_TITLE_ATTR',v)+"' >"+v['PMO_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_EMP' name='noprintset_PMO_EMP' class='datagrid-cell "+ms.tdClass(formId, 'PMO_EMP')+"' style='"+ms.tdStyle(formId, 'PMO_EMP')+"' "+ms.tdEvent(formId, 'PMO_EMP')+">")
            arrHtml.push("<span colno='PMO_EMP' class='"+ms.uiClass(formId, 'PMO_EMP')+"' style='"+ms.uiStyle(formId, 'PMO_EMP')+"' "+ms.uiEvent(formId, 'PMO_EMP')+" title='"+ms.titleAttr(formId,'PMO_EMP','IS_TITLE_ATTR',v)+"' >"+v['PMO_EMP']+"</span>")
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
    if(formId=='b8f52c26583e4ffd938fba4f2dad7a34'){<%--在线制令单信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='PMO_NUMBER' name='noprintset_PMO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'PMO_NUMBER')+"' style='"+ms.tdStyle(formId, 'PMO_NUMBER')+"' "+ms.tdEvent(formId, 'PMO_NUMBER')+">")
            arrHtml.push("<span colno='PMO_NUMBER' class='"+ms.uiClass(formId, 'PMO_NUMBER')+"' style='"+ms.uiStyle(formId, 'PMO_NUMBER')+"' "+ms.uiEvent(formId, 'PMO_NUMBER')+" title='"+ms.titleAttr(formId,'PMO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['PMO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_PROJECT_ID' name='noprintset_PMO_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PMO_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PMO_PROJECT_ID')+"' "+ms.tdEvent(formId, 'PMO_PROJECT_ID')+">")
            arrHtml.push("<span colno='PMO_PROJECT_ID' class='"+ms.uiClass(formId, 'PMO_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PMO_PROJECT_ID')+"' "+ms.uiEvent(formId, 'PMO_PROJECT_ID')+" title='"+ms.titleAttr(formId,'PMO_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PMO_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_MODEL_CODE' name='noprintset_PMO_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'PMO_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'PMO_MODEL_CODE')+"' "+ms.tdEvent(formId, 'PMO_MODEL_CODE')+">")
            arrHtml.push("<span colno='PMO_MODEL_CODE' class='"+ms.uiClass(formId, 'PMO_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'PMO_MODEL_CODE')+"' "+ms.uiEvent(formId, 'PMO_MODEL_CODE')+" title='"+ms.titleAttr(formId,'PMO_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['PMO_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_AREA_SN' name='noprintset_PMO_AREA_SN' class='datagrid-cell "+ms.tdClass(formId, 'PMO_AREA_SN')+"' style='"+ms.tdStyle(formId, 'PMO_AREA_SN')+"' "+ms.tdEvent(formId, 'PMO_AREA_SN')+">")
            arrHtml.push("<span colno='PMO_AREA_SN' class='"+ms.uiClass(formId, 'PMO_AREA_SN')+"' style='"+ms.uiStyle(formId, 'PMO_AREA_SN')+"' "+ms.uiEvent(formId, 'PMO_AREA_SN')+" title='"+ms.titleAttr(formId,'PMO_AREA_SN','IS_TITLE_ATTR',v)+"' >"+v['PMO_AREA_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NAME' name='noprintset_AREA_NAME' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NAME')+"' style='"+ms.tdStyle(formId, 'AREA_NAME')+"' "+ms.tdEvent(formId, 'AREA_NAME')+">")
            arrHtml.push("<span colno='AREA_NAME' class='"+ms.uiClass(formId, 'AREA_NAME')+"' style='"+ms.uiStyle(formId, 'AREA_NAME')+"' "+ms.uiEvent(formId, 'AREA_NAME')+" title='"+ms.titleAttr(formId,'AREA_NAME','IS_TITLE_ATTR',v)+"' >"+v['AREA_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_PROCESS_FACE' name='noprintset_PMO_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'PMO_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'PMO_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'PMO_PROCESS_FACE')+">")
            arrHtml.push("<span colno='PMO_PROCESS_FACE' class='"+ms.uiClass(formId, 'PMO_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'PMO_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'PMO_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'PMO_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['PMO_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_TYPE' name='noprintset_PMO_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'PMO_TYPE')+"' style='"+ms.tdStyle(formId, 'PMO_TYPE')+"' "+ms.tdEvent(formId, 'PMO_TYPE')+">")
            arrHtml.push("<span colno='PMO_TYPE' class='"+ms.uiClass(formId, 'PMO_TYPE')+"' style='"+ms.uiStyle(formId, 'PMO_TYPE')+"' "+ms.uiEvent(formId, 'PMO_TYPE')+" title='"+ms.titleAttr(formId,'PMO_TYPE','IS_TITLE_ATTR',v)+"' >"+v['PMO_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_TECH_SN' name='noprintset_PMO_TECH_SN' class='datagrid-cell "+ms.tdClass(formId, 'PMO_TECH_SN')+"' style='"+ms.tdStyle(formId, 'PMO_TECH_SN')+"' "+ms.tdEvent(formId, 'PMO_TECH_SN')+">")
            arrHtml.push("<span colno='PMO_TECH_SN' class='"+ms.uiClass(formId, 'PMO_TECH_SN')+"' style='"+ms.uiStyle(formId, 'PMO_TECH_SN')+"' "+ms.uiEvent(formId, 'PMO_TECH_SN')+" title='"+ms.titleAttr(formId,'PMO_TECH_SN','IS_TITLE_ATTR',v)+"' >"+v['PMO_TECH_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TECH_NAME' name='noprintset_TECH_NAME' class='datagrid-cell "+ms.tdClass(formId, 'TECH_NAME')+"' style='"+ms.tdStyle(formId, 'TECH_NAME')+"' "+ms.tdEvent(formId, 'TECH_NAME')+">")
            arrHtml.push("<span colno='TECH_NAME' class='"+ms.uiClass(formId, 'TECH_NAME')+"' style='"+ms.uiStyle(formId, 'TECH_NAME')+"' "+ms.uiEvent(formId, 'TECH_NAME')+" title='"+ms.titleAttr(formId,'TECH_NAME','IS_TITLE_ATTR',v)+"' >"+v['TECH_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_TIME' name='noprintset_PMO_TIME' class='datagrid-cell "+ms.tdClass(formId, 'PMO_TIME')+"' style='"+ms.tdStyle(formId, 'PMO_TIME')+"' "+ms.tdEvent(formId, 'PMO_TIME')+">")
            arrHtml.push("<span colno='PMO_TIME' class='"+ms.uiClass(formId, 'PMO_TIME')+"' style='"+ms.uiStyle(formId, 'PMO_TIME')+"' "+ms.uiEvent(formId, 'PMO_TIME')+" title='"+ms.titleAttr(formId,'PMO_TIME','IS_TITLE_ATTR',v)+"' >"+v['PMO_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PMO_EMP' name='noprintset_PMO_EMP' class='datagrid-cell "+ms.tdClass(formId, 'PMO_EMP')+"' style='"+ms.tdStyle(formId, 'PMO_EMP')+"' "+ms.tdEvent(formId, 'PMO_EMP')+">")
            arrHtml.push("<span colno='PMO_EMP' class='"+ms.uiClass(formId, 'PMO_EMP')+"' style='"+ms.uiStyle(formId, 'PMO_EMP')+"' "+ms.uiEvent(formId, 'PMO_EMP')+" title='"+ms.titleAttr(formId,'PMO_EMP','IS_TITLE_ATTR',v)+"' >"+v['PMO_EMP']+"</span>")
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
