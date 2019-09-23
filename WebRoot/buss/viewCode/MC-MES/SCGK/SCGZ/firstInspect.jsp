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
		<dict:lang value="首件检验记录" />
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
		<bu:header formId ="eb37ed041b084b8c9eb5b809964eea60"/>

    
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
		<bu:func viewId="d154f7c0befb450ba00d45216826ecd7" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="d154f7c0befb450ba00d45216826ecd7" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageeb37ed041b084b8c9eb5b809964eea60" id="formPageeb37ed041b084b8c9eb5b809964eea60" value="${formPageeb37ed041b084b8c9eb5b809964eea60}"/>
		<input type="hidden" name="formId" id="formId1" value='eb37ed041b084b8c9eb5b809964eea60'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='87f673890b75475b86cde3f23b955b16'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='5d9af4616d3f4dfabb0c11111d6304c1'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="eb37ed041b084b8c9eb5b809964eea60">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxeb37ed041b084b8c9eb5b809964eea60" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innereb37ed041b084b8c9eb5b809964eea60">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableeb37ed041b084b8c9eb5b809964eea60">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="eb37ed041b084b8c9eb5b809964eea60" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_eb37ed041b084b8c9eb5b809964eea60" onclick="_selectAjaxTableAllData(this,'eb37ed041b084b8c9eb5b809964eea60')" style="cursor: pointer;"title="全选"/></span></td>
			
			<td name="noprintset_TFI_PROJECT_ID" class="datagrid-cell"><bu:uitn colNo="TFI_PROJECT_ID" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<td name="TFI_MKDH" class="datagrid-cell"><bu:uitn colNo="TFI_MKDH" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<td name="TFI_MKJD" class="datagrid-cell"><bu:uitn colNo="TFI_MKJD" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<td name="TFI_MKBB" class="datagrid-cell"><bu:uitn colNo="TFI_MKBB" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<td name="noprintset_TFI_TEST_CONCLUSION" class="datagrid-cell"><bu:uitn colNo="TFI_TEST_CONCLUSION" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<td name="noprintset_TFI_DEFECT_REASON" class="datagrid-cell"><bu:uitn colNo="TFI_DEFECT_REASON" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
			<td name="noprintset_TFI_HANDLE_RESULT" class="datagrid-cell"><bu:uitn colNo="TFI_HANDLE_RESULT" formId="eb37ed041b084b8c9eb5b809964eea60" /></td>
		</tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiveb37ed041b084b8c9eb5b809964eea60" onscroll="ajaxTableScroll(this,'eb37ed041b084b8c9eb5b809964eea60')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxeb37ed041b084b8c9eb5b809964eea60">
		<tbody id="tbody_eb37ed041b084b8c9eb5b809964eea60" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageeb37ed041b084b8c9eb5b809964eea60==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=eb37ed041b084b8c9eb5b809964eea60&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" name="formPage5d9af4616d3f4dfabb0c11111d6304c1" id="formPage5d9af4616d3f4dfabb0c11111d6304c1" value="${formPage5d9af4616d3f4dfabb0c11111d6304c1}"/>
		<input type="hidden" name="formId" id="formId2" value='5d9af4616d3f4dfabb0c11111d6304c1'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="5d9af4616d3f4dfabb0c11111d6304c1">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax5d9af4616d3f4dfabb0c11111d6304c1" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner5d9af4616d3f4dfabb0c11111d6304c1">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable5d9af4616d3f4dfabb0c11111d6304c1">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="5d9af4616d3f4dfabb0c11111d6304c1" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_5d9af4616d3f4dfabb0c11111d6304c1" onclick="_selectAjaxTableAllData(this,'5d9af4616d3f4dfabb0c11111d6304c1')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="TFG_TYPE" class="datagrid-cell"><bu:uitn colNo="TFG_TYPE" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<td name="noprintset_TFG_GROUP" class="datagrid-cell"><bu:uitn colNo="TFG_GROUP" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<td name="noprintset_TFG_TEST_CONTENT" class="datagrid-cell"><bu:uitn colNo="TFG_TEST_CONTENT" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<td name="noprintset_TFG_TEST_FACE" class="datagrid-cell"><bu:uitn colNo="TFG_TEST_FACE" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<td name="noprintset_TFG_TEST_RESULT" class="datagrid-cell"><bu:uitn colNo="TFG_TEST_RESULT" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<td name="CREATE_USER" class="datagrid-cell"><bu:uitn colNo="CREATE_USER" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
			<td name="CREATE_TIME" class="datagrid-cell"><bu:uitn colNo="CREATE_TIME" formId="5d9af4616d3f4dfabb0c11111d6304c1" /></td>
		</tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv5d9af4616d3f4dfabb0c11111d6304c1" onscroll="ajaxTableScroll(this,'5d9af4616d3f4dfabb0c11111d6304c1')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax5d9af4616d3f4dfabb0c11111d6304c1">
		<tbody id="tbody_5d9af4616d3f4dfabb0c11111d6304c1" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage5d9af4616d3f4dfabb0c11111d6304c1==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=5d9af4616d3f4dfabb0c11111d6304c1&showLoading=0" />
			</div>
		</c:if>

		<input type="hidden" id="relColVals" name="relColVals" value='TFI_PROJECT_ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="d154f7c0befb450ba00d45216826ecd7" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d154f7c0befb450ba00d45216826ecd7" />
    
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
    if(formId=='eb37ed041b084b8c9eb5b809964eea60'){<%--首件检验记录--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='TFI_PROJECT_ID' name='noprintset_TFI_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'TFI_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'TFI_PROJECT_ID')+"' "+ms.tdEvent(formId, 'TFI_PROJECT_ID')+">")
            arrHtml.push("<span colno='TFI_PROJECT_ID' class='"+ms.uiClass(formId, 'TFI_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'TFI_PROJECT_ID')+"' "+ms.uiEvent(formId, 'TFI_PROJECT_ID')+" title='"+ms.titleAttr(formId,'TFI_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['TFI_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_MKDH' name='TFI_MKDH' class='datagrid-cell "+ms.tdClass(formId, 'TFI_MKDH')+"' style='"+ms.tdStyle(formId, 'TFI_MKDH')+"' "+ms.tdEvent(formId, 'TFI_MKDH')+">")
            arrHtml.push("<span colno='TFI_MKDH' class='"+ms.uiClass(formId, 'TFI_MKDH')+"' style='"+ms.uiStyle(formId, 'TFI_MKDH')+"' "+ms.uiEvent(formId, 'TFI_MKDH')+" title='"+ms.titleAttr(formId,'TFI_MKDH','IS_TITLE_ATTR',v)+"' >"+v['TFI_MKDH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_MKJD' name='TFI_MKJD' class='datagrid-cell "+ms.tdClass(formId, 'TFI_MKJD')+"' style='"+ms.tdStyle(formId, 'TFI_MKJD')+"' "+ms.tdEvent(formId, 'TFI_MKJD')+">")
            arrHtml.push("<span colno='TFI_MKJD' class='"+ms.uiClass(formId, 'TFI_MKJD')+"' style='"+ms.uiStyle(formId, 'TFI_MKJD')+"' "+ms.uiEvent(formId, 'TFI_MKJD')+" title='"+ms.titleAttr(formId,'TFI_MKJD','IS_TITLE_ATTR',v)+"' >"+v['TFI_MKJD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_MKBB' name='TFI_MKBB' class='datagrid-cell "+ms.tdClass(formId, 'TFI_MKBB')+"' style='"+ms.tdStyle(formId, 'TFI_MKBB')+"' "+ms.tdEvent(formId, 'TFI_MKBB')+">")
            arrHtml.push("<span colno='TFI_MKBB' class='"+ms.uiClass(formId, 'TFI_MKBB')+"' style='"+ms.uiStyle(formId, 'TFI_MKBB')+"' "+ms.uiEvent(formId, 'TFI_MKBB')+" title='"+ms.titleAttr(formId,'TFI_MKBB','IS_TITLE_ATTR',v)+"' >"+v['TFI_MKBB']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='TFI_TEST_CONCLUSION' name='noprintset_TFI_TEST_CONCLUSION' class='datagrid-cell "+ms.tdClass(formId, 'TFI_TEST_CONCLUSION')+"' style='"+ms.tdStyle(formId, 'TFI_TEST_CONCLUSION')+"' "+ms.tdEvent(formId, 'TFI_TEST_CONCLUSION')+">")
            arrHtml.push("<span colno='TFI_TEST_CONCLUSION' class='"+ms.uiClass(formId, 'TFI_TEST_CONCLUSION')+"' style='"+ms.uiStyle(formId, 'TFI_TEST_CONCLUSION')+"' "+ms.uiEvent(formId, 'TFI_TEST_CONCLUSION')+" title='"+ms.titleAttr(formId,'TFI_TEST_CONCLUSION','IS_TITLE_ATTR',v)+"' >"+v['TFI_TEST_CONCLUSION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_DEFECT_REASON' name='noprintset_TFI_DEFECT_REASON' class='datagrid-cell "+ms.tdClass(formId, 'TFI_DEFECT_REASON')+"' style='"+ms.tdStyle(formId, 'TFI_DEFECT_REASON')+"' "+ms.tdEvent(formId, 'TFI_DEFECT_REASON')+">")
            arrHtml.push("<span colno='TFI_DEFECT_REASON' class='"+ms.uiClass(formId, 'TFI_DEFECT_REASON')+"' style='"+ms.uiStyle(formId, 'TFI_DEFECT_REASON')+"' "+ms.uiEvent(formId, 'TFI_DEFECT_REASON')+" title='"+ms.titleAttr(formId,'TFI_DEFECT_REASON','IS_TITLE_ATTR',v)+"' >"+v['TFI_DEFECT_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_HANDLE_RESULT' name='noprintset_TFI_HANDLE_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'TFI_HANDLE_RESULT')+"' style='"+ms.tdStyle(formId, 'TFI_HANDLE_RESULT')+"' "+ms.tdEvent(formId, 'TFI_HANDLE_RESULT')+">")
            arrHtml.push("<span colno='TFI_HANDLE_RESULT' class='"+ms.uiClass(formId, 'TFI_HANDLE_RESULT')+"' style='"+ms.uiStyle(formId, 'TFI_HANDLE_RESULT')+"' "+ms.uiEvent(formId, 'TFI_HANDLE_RESULT')+" title='"+ms.titleAttr(formId,'TFI_HANDLE_RESULT','IS_TITLE_ATTR',v)+"' >"+v['TFI_HANDLE_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='5d9af4616d3f4dfabb0c11111d6304c1'){<%--首件检验记录明细--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_TYPE' name='TFG_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'TFG_TYPE')+"' style='"+ms.tdStyle(formId, 'TFG_TYPE')+"' "+ms.tdEvent(formId, 'TFG_TYPE')+">")
            arrHtml.push("<span colno='TFG_TYPE' class='"+ms.uiClass(formId, 'TFG_TYPE')+"' style='"+ms.uiStyle(formId, 'TFG_TYPE')+"' "+ms.uiEvent(formId, 'TFG_TYPE')+" title='"+ms.titleAttr(formId,'TFG_TYPE','IS_TITLE_ATTR',v)+"' >"+v['TFG_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_GROUP' name='noprintset_TFG_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'TFG_GROUP')+"' style='"+ms.tdStyle(formId, 'TFG_GROUP')+"' "+ms.tdEvent(formId, 'TFG_GROUP')+">")
            arrHtml.push("<span colno='TFG_GROUP' class='"+ms.uiClass(formId, 'TFG_GROUP')+"' style='"+ms.uiStyle(formId, 'TFG_GROUP')+"' "+ms.uiEvent(formId, 'TFG_GROUP')+" title='"+ms.titleAttr(formId,'TFG_GROUP','IS_TITLE_ATTR',v)+"' >"+v['TFG_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_TEST_CONTENT' name='noprintset_TFG_TEST_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'TFG_TEST_CONTENT')+"' style='"+ms.tdStyle(formId, 'TFG_TEST_CONTENT')+"' "+ms.tdEvent(formId, 'TFG_TEST_CONTENT')+">")
            arrHtml.push("<span colno='TFG_TEST_CONTENT' class='"+ms.uiClass(formId, 'TFG_TEST_CONTENT')+"' style='"+ms.uiStyle(formId, 'TFG_TEST_CONTENT')+"' "+ms.uiEvent(formId, 'TFG_TEST_CONTENT')+" title='"+ms.titleAttr(formId,'TFG_TEST_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['TFG_TEST_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_TEST_FACE' name='noprintset_TFG_TEST_FACE' class='datagrid-cell "+ms.tdClass(formId, 'TFG_TEST_FACE')+"' style='"+ms.tdStyle(formId, 'TFG_TEST_FACE')+"' "+ms.tdEvent(formId, 'TFG_TEST_FACE')+">")
            arrHtml.push("<span colno='TFG_TEST_FACE' class='"+ms.uiClass(formId, 'TFG_TEST_FACE')+"' style='"+ms.uiStyle(formId, 'TFG_TEST_FACE')+"' "+ms.uiEvent(formId, 'TFG_TEST_FACE')+" title='"+ms.titleAttr(formId,'TFG_TEST_FACE','IS_TITLE_ATTR',v)+"' >"+v['TFG_TEST_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_TEST_RESULT' name='noprintset_TFG_TEST_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'TFG_TEST_RESULT')+"' style='"+ms.tdStyle(formId, 'TFG_TEST_RESULT')+"' "+ms.tdEvent(formId, 'TFG_TEST_RESULT')+">")
            arrHtml.push("<span colno='TFG_TEST_RESULT' class='"+ms.uiClass(formId, 'TFG_TEST_RESULT')+"' style='"+ms.uiStyle(formId, 'TFG_TEST_RESULT')+"' "+ms.uiEvent(formId, 'TFG_TEST_RESULT')+" title='"+ms.titleAttr(formId,'TFG_TEST_RESULT','IS_TITLE_ATTR',v)+"' >"+v['TFG_TEST_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_USER' name='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
            arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+ms.titleAttr(formId,'CREATE_USER','IS_TITLE_ATTR',v)+"' >"+v['CREATE_USER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CREATE_TIME' name='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
            arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+ms.titleAttr(formId,'CREATE_TIME','IS_TITLE_ATTR',v)+"' >"+v['CREATE_TIME']+"</span>")
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
    if(formId=='eb37ed041b084b8c9eb5b809964eea60'){<%--首件检验记录--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='TFI_TEST_CONTENT' name='noprintset_TFI_TEST_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'TFI_TEST_CONTENT')+"' style='"+ms.tdStyle(formId, 'TFI_TEST_CONTENT')+"' "+ms.tdEvent(formId, 'TFI_TEST_CONTENT')+">")
            arrHtml.push("<span colno='TFI_TEST_CONTENT' class='"+ms.uiClass(formId, 'TFI_TEST_CONTENT')+"' style='"+ms.uiStyle(formId, 'TFI_TEST_CONTENT')+"' "+ms.uiEvent(formId, 'TFI_TEST_CONTENT')+" title='"+ms.titleAttr(formId,'TFI_TEST_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['TFI_TEST_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_PROJECT_ID' name='noprintset_TFI_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'TFI_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'TFI_PROJECT_ID')+"' "+ms.tdEvent(formId, 'TFI_PROJECT_ID')+">")
            arrHtml.push("<span colno='TFI_PROJECT_ID' class='"+ms.uiClass(formId, 'TFI_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'TFI_PROJECT_ID')+"' "+ms.uiEvent(formId, 'TFI_PROJECT_ID')+" title='"+ms.titleAttr(formId,'TFI_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['TFI_PROJECT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_GROUP' name='noprintset_TFI_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'TFI_GROUP')+"' style='"+ms.tdStyle(formId, 'TFI_GROUP')+"' "+ms.tdEvent(formId, 'TFI_GROUP')+">")
            arrHtml.push("<span colno='TFI_GROUP' class='"+ms.uiClass(formId, 'TFI_GROUP')+"' style='"+ms.uiStyle(formId, 'TFI_GROUP')+"' "+ms.uiEvent(formId, 'TFI_GROUP')+" title='"+ms.titleAttr(formId,'TFI_GROUP','IS_TITLE_ATTR',v)+"' >"+v['TFI_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_TEST_RESULT' name='noprintset_TFI_TEST_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'TFI_TEST_RESULT')+"' style='"+ms.tdStyle(formId, 'TFI_TEST_RESULT')+"' "+ms.tdEvent(formId, 'TFI_TEST_RESULT')+">")
            arrHtml.push("<span colno='TFI_TEST_RESULT' class='"+ms.uiClass(formId, 'TFI_TEST_RESULT')+"' style='"+ms.uiStyle(formId, 'TFI_TEST_RESULT')+"' "+ms.uiEvent(formId, 'TFI_TEST_RESULT')+" title='"+ms.titleAttr(formId,'TFI_TEST_RESULT','IS_TITLE_ATTR',v)+"' >"+v['TFI_TEST_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_TEST_CONCLUSION' name='noprintset_TFI_TEST_CONCLUSION' class='datagrid-cell "+ms.tdClass(formId, 'TFI_TEST_CONCLUSION')+"' style='"+ms.tdStyle(formId, 'TFI_TEST_CONCLUSION')+"' "+ms.tdEvent(formId, 'TFI_TEST_CONCLUSION')+">")
            arrHtml.push("<span colno='TFI_TEST_CONCLUSION' class='"+ms.uiClass(formId, 'TFI_TEST_CONCLUSION')+"' style='"+ms.uiStyle(formId, 'TFI_TEST_CONCLUSION')+"' "+ms.uiEvent(formId, 'TFI_TEST_CONCLUSION')+" title='"+ms.titleAttr(formId,'TFI_TEST_CONCLUSION','IS_TITLE_ATTR',v)+"' >"+v['TFI_TEST_CONCLUSION']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_DEFECT_REASON' name='noprintset_TFI_DEFECT_REASON' class='datagrid-cell "+ms.tdClass(formId, 'TFI_DEFECT_REASON')+"' style='"+ms.tdStyle(formId, 'TFI_DEFECT_REASON')+"' "+ms.tdEvent(formId, 'TFI_DEFECT_REASON')+">")
            arrHtml.push("<span colno='TFI_DEFECT_REASON' class='"+ms.uiClass(formId, 'TFI_DEFECT_REASON')+"' style='"+ms.uiStyle(formId, 'TFI_DEFECT_REASON')+"' "+ms.uiEvent(formId, 'TFI_DEFECT_REASON')+" title='"+ms.titleAttr(formId,'TFI_DEFECT_REASON','IS_TITLE_ATTR',v)+"' >"+v['TFI_DEFECT_REASON']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFI_HANDLE_RESULT' name='noprintset_TFI_HANDLE_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'TFI_HANDLE_RESULT')+"' style='"+ms.tdStyle(formId, 'TFI_HANDLE_RESULT')+"' "+ms.tdEvent(formId, 'TFI_HANDLE_RESULT')+">")
            arrHtml.push("<span colno='TFI_HANDLE_RESULT' class='"+ms.uiClass(formId, 'TFI_HANDLE_RESULT')+"' style='"+ms.uiStyle(formId, 'TFI_HANDLE_RESULT')+"' "+ms.uiEvent(formId, 'TFI_HANDLE_RESULT')+" title='"+ms.titleAttr(formId,'TFI_HANDLE_RESULT','IS_TITLE_ATTR',v)+"' >"+v['TFI_HANDLE_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
    }
    if(formId=='5d9af4616d3f4dfabb0c11111d6304c1'){<%--首件检验记录明细--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='TFG_GROUP' name='noprintset_TFG_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'TFG_GROUP')+"' style='"+ms.tdStyle(formId, 'TFG_GROUP')+"' "+ms.tdEvent(formId, 'TFG_GROUP')+">")
            arrHtml.push("<span colno='TFG_GROUP' class='"+ms.uiClass(formId, 'TFG_GROUP')+"' style='"+ms.uiStyle(formId, 'TFG_GROUP')+"' "+ms.uiEvent(formId, 'TFG_GROUP')+" title='"+ms.titleAttr(formId,'TFG_GROUP','IS_TITLE_ATTR',v)+"' >"+v['TFG_GROUP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_TEST_CONTENT' name='noprintset_TFG_TEST_CONTENT' class='datagrid-cell "+ms.tdClass(formId, 'TFG_TEST_CONTENT')+"' style='"+ms.tdStyle(formId, 'TFG_TEST_CONTENT')+"' "+ms.tdEvent(formId, 'TFG_TEST_CONTENT')+">")
            arrHtml.push("<span colno='TFG_TEST_CONTENT' class='"+ms.uiClass(formId, 'TFG_TEST_CONTENT')+"' style='"+ms.uiStyle(formId, 'TFG_TEST_CONTENT')+"' "+ms.uiEvent(formId, 'TFG_TEST_CONTENT')+" title='"+ms.titleAttr(formId,'TFG_TEST_CONTENT','IS_TITLE_ATTR',v)+"' >"+v['TFG_TEST_CONTENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_TEST_RESULT' name='noprintset_TFG_TEST_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'TFG_TEST_RESULT')+"' style='"+ms.tdStyle(formId, 'TFG_TEST_RESULT')+"' "+ms.tdEvent(formId, 'TFG_TEST_RESULT')+">")
            arrHtml.push("<span colno='TFG_TEST_RESULT' class='"+ms.uiClass(formId, 'TFG_TEST_RESULT')+"' style='"+ms.uiStyle(formId, 'TFG_TEST_RESULT')+"' "+ms.uiEvent(formId, 'TFG_TEST_RESULT')+" title='"+ms.titleAttr(formId,'TFG_TEST_RESULT','IS_TITLE_ATTR',v)+"' >"+v['TFG_TEST_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_TEST_FACE' name='noprintset_TFG_TEST_FACE' class='datagrid-cell "+ms.tdClass(formId, 'TFG_TEST_FACE')+"' style='"+ms.tdStyle(formId, 'TFG_TEST_FACE')+"' "+ms.tdEvent(formId, 'TFG_TEST_FACE')+">")
            arrHtml.push("<span colno='TFG_TEST_FACE' class='"+ms.uiClass(formId, 'TFG_TEST_FACE')+"' style='"+ms.uiStyle(formId, 'TFG_TEST_FACE')+"' "+ms.uiEvent(formId, 'TFG_TEST_FACE')+" title='"+ms.titleAttr(formId,'TFG_TEST_FACE','IS_TITLE_ATTR',v)+"' >"+v['TFG_TEST_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='TFG_PROJECT_ID' name='noprintset_TFG_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'TFG_PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'TFG_PROJECT_ID')+"' "+ms.tdEvent(formId, 'TFG_PROJECT_ID')+">")
            arrHtml.push("<span colno='TFG_PROJECT_ID' class='"+ms.uiClass(formId, 'TFG_PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'TFG_PROJECT_ID')+"' "+ms.uiEvent(formId, 'TFG_PROJECT_ID')+" title='"+ms.titleAttr(formId,'TFG_PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['TFG_PROJECT_ID']+"</span>")
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
