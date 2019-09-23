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
		<dict:lang value="工艺信息1" />
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
		<bu:header formId ="9ce89b8198274a25b7219ad226eda21e"/>

    
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
		<bu:func viewId="d1ea60b7a4494bfc99aaad7689dbd8e6" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="d1ea60b7a4494bfc99aaad7689dbd8e6" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage9ce89b8198274a25b7219ad226eda21e" id="formPage9ce89b8198274a25b7219ad226eda21e" value="${formPage9ce89b8198274a25b7219ad226eda21e}"/>
		<input type="hidden" name="formId" id="formId1" value='9ce89b8198274a25b7219ad226eda21e'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='8c5694b46d23443f8e26b66633461e4a'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='b683479acde94bac9a638cc49a5dd736'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="9ce89b8198274a25b7219ad226eda21e">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax9ce89b8198274a25b7219ad226eda21e" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner9ce89b8198274a25b7219ad226eda21e">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable9ce89b8198274a25b7219ad226eda21e">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="9ce89b8198274a25b7219ad226eda21e" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_9ce89b8198274a25b7219ad226eda21e" onclick="_selectAjaxTableAllData(this,'9ce89b8198274a25b7219ad226eda21e')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_CT_ID" class="datagrid-cell"><bu:uitn colNo="CT_ID" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td name="noprintset_CT_NAME" class="datagrid-cell"><bu:uitn colNo="CT_NAME" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td name="noprintset_CT_PRODUCT_STEP" class="datagrid-cell"><bu:uitn colNo="CT_PRODUCT_STEP" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td name="noprintset_CT_PROCESS_FACE" class="datagrid-cell"><bu:uitn colNo="CT_PROCESS_FACE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td name="noprintset_CT_ROUTE_CODE" class="datagrid-cell"><bu:uitn colNo="CT_ROUTE_CODE" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td name="noprintset_CT_PREPOSE_TECH" class="datagrid-cell"><bu:uitn colNo="CT_PREPOSE_TECH" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td name="noprintset_CT_PROCESS_PRIOR" class="datagrid-cell"><bu:uitn colNo="CT_PROCESS_PRIOR" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td name="noprintset_CT_DEFAULT_FLAG" class="datagrid-cell"><bu:uitn colNo="CT_DEFAULT_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
			<td name="noprintset_CT_VALID_FLAG" class="datagrid-cell"><bu:uitn colNo="CT_VALID_FLAG" formId="9ce89b8198274a25b7219ad226eda21e" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv9ce89b8198274a25b7219ad226eda21e" onscroll="ajaxTableScroll(this,'9ce89b8198274a25b7219ad226eda21e')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax9ce89b8198274a25b7219ad226eda21e">
		<tbody id="tbody_9ce89b8198274a25b7219ad226eda21e" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage9ce89b8198274a25b7219ad226eda21e==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=9ce89b8198274a25b7219ad226eda21e&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('9ce89b8198274a25b7219ad226eda21e','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>工艺代码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_ID" value="" title_name="工艺代码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工艺名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_NAME" value="" title_name="工艺名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产阶别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_PRODUCT_STEP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_PRODUCT_STEP" value="" title_name="生产阶别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>加工面别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_PROCESS_FACE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_PROCESS_FACE" value="" title_name="加工面别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>流程名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_ROUTE_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_ROUTE_CODE" value="" title_name="流程名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>前置工艺</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_PREPOSE_TECH" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_PREPOSE_TECH" value="" title_name="前置工艺" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>优先加工</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_PROCESS_PRIOR" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_PROCESS_PRIOR" value="" title_name="优先加工" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>默认标志</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_DEFAULT_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_DEFAULT_FLAG" value="" title_name="默认标志" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>有效标志</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CT_VALID_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CT_VALID_FLAG" value="" title_name="有效标志" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>创建人</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CREATE_USER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CREATE_USER" value="" title_name="创建人" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>创建时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CREATE_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CREATE_TIME" value="" title_name="创建时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>修改人</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="EDIT_USER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="EDIT_USER" value="" title_name="修改人" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>修改时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="EDIT_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="EDIT_TIME" value="" title_name="修改时间" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="formPageb683479acde94bac9a638cc49a5dd736" id="formPageb683479acde94bac9a638cc49a5dd736" value="${formPageb683479acde94bac9a638cc49a5dd736}"/>
		<input type="hidden" name="formId" id="formId2" value='b683479acde94bac9a638cc49a5dd736'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b683479acde94bac9a638cc49a5dd736">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb683479acde94bac9a638cc49a5dd736" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb683479acde94bac9a638cc49a5dd736">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb683479acde94bac9a638cc49a5dd736">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="b683479acde94bac9a638cc49a5dd736" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b683479acde94bac9a638cc49a5dd736" onclick="_selectAjaxTableAllData(this,'b683479acde94bac9a638cc49a5dd736')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_CTM_MODEL_CODE" class="datagrid-cell"><bu:uitn colNo="CTM_MODEL_CODE" formId="b683479acde94bac9a638cc49a5dd736" /></td>
			<td name="noprintset_CTM_PROCESS_FACE" class="datagrid-cell"><bu:uitn colNo="CTM_PROCESS_FACE" formId="b683479acde94bac9a638cc49a5dd736" /></td>
			<td name="noprintset_CTM_PRODUCT_STEP" class="datagrid-cell"><bu:uitn colNo="CTM_PRODUCT_STEP" formId="b683479acde94bac9a638cc49a5dd736" /></td>
			<td name="noprintset_CTM_ID" class="datagrid-cell"><bu:uitn colNo="CTM_ID" formId="b683479acde94bac9a638cc49a5dd736" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb683479acde94bac9a638cc49a5dd736" onscroll="ajaxTableScroll(this,'b683479acde94bac9a638cc49a5dd736')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb683479acde94bac9a638cc49a5dd736">
		<tbody id="tbody_b683479acde94bac9a638cc49a5dd736" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb683479acde94bac9a638cc49a5dd736==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=b683479acde94bac9a638cc49a5dd736&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('b683479acde94bac9a638cc49a5dd736','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>机种</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CTM_MODEL_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CTM_MODEL_CODE" value="" title_name="机种" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>面别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CTM_PROCESS_FACE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CTM_PROCESS_FACE" value="" title_name="面别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>阶别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CTM_PRODUCT_STEP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CTM_PRODUCT_STEP" value="" title_name="阶别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工艺代码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CTM_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CTM_ID" value="" title_name="工艺代码" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" id="relColVals" name="relColVals" value='CT_ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="d1ea60b7a4494bfc99aaad7689dbd8e6" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="d1ea60b7a4494bfc99aaad7689dbd8e6" />
    
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
    if(formId=='9ce89b8198274a25b7219ad226eda21e'){<%--工艺信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_ID' name='noprintset_CT_ID' class='datagrid-cell "+ms.tdClass(formId, 'CT_ID')+"' style='"+ms.tdStyle(formId, 'CT_ID')+"' "+ms.tdEvent(formId, 'CT_ID')+">")
            arrHtml.push("<span colno='CT_ID' class='"+ms.uiClass(formId, 'CT_ID')+"' style='"+ms.uiStyle(formId, 'CT_ID')+"' "+ms.uiEvent(formId, 'CT_ID')+" title='"+ms.titleAttr(formId,'CT_ID','IS_TITLE_ATTR',v)+"' >"+v['CT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_NAME' name='noprintset_CT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CT_NAME')+"' style='"+ms.tdStyle(formId, 'CT_NAME')+"' "+ms.tdEvent(formId, 'CT_NAME')+">")
            arrHtml.push("<span colno='CT_NAME' class='"+ms.uiClass(formId, 'CT_NAME')+"' style='"+ms.uiStyle(formId, 'CT_NAME')+"' "+ms.uiEvent(formId, 'CT_NAME')+" title='"+ms.titleAttr(formId,'CT_NAME','IS_TITLE_ATTR',v)+"' >"+v['CT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_PRODUCT_STEP' name='noprintset_CT_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CT_PRODUCT_STEP')+"' style='"+ms.tdStyle(formId, 'CT_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CT_PRODUCT_STEP')+">")
            arrHtml.push("<span colno='CT_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CT_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CT_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CT_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'CT_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['CT_PRODUCT_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_PROCESS_FACE' name='noprintset_CT_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CT_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'CT_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CT_PROCESS_FACE')+">")
            arrHtml.push("<span colno='CT_PROCESS_FACE' class='"+ms.uiClass(formId, 'CT_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CT_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CT_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CT_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['CT_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_ROUTE_CODE' name='noprintset_CT_ROUTE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CT_ROUTE_CODE')+"' style='"+ms.tdStyle(formId, 'CT_ROUTE_CODE')+"' "+ms.tdEvent(formId, 'CT_ROUTE_CODE')+">")
            arrHtml.push("<span colno='CT_ROUTE_CODE' class='"+ms.uiClass(formId, 'CT_ROUTE_CODE')+"' style='"+ms.uiStyle(formId, 'CT_ROUTE_CODE')+"' "+ms.uiEvent(formId, 'CT_ROUTE_CODE')+" title='"+ms.titleAttr(formId,'CT_ROUTE_CODE','IS_TITLE_ATTR',v)+"' >"+v['CT_ROUTE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_PREPOSE_TECH' name='noprintset_CT_PREPOSE_TECH' class='datagrid-cell "+ms.tdClass(formId, 'CT_PREPOSE_TECH')+"' style='"+ms.tdStyle(formId, 'CT_PREPOSE_TECH')+"' "+ms.tdEvent(formId, 'CT_PREPOSE_TECH')+">")
            arrHtml.push("<span colno='CT_PREPOSE_TECH' class='"+ms.uiClass(formId, 'CT_PREPOSE_TECH')+"' style='"+ms.uiStyle(formId, 'CT_PREPOSE_TECH')+"' "+ms.uiEvent(formId, 'CT_PREPOSE_TECH')+" title='"+ms.titleAttr(formId,'CT_PREPOSE_TECH','IS_TITLE_ATTR',v)+"' >"+v['CT_PREPOSE_TECH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_PROCESS_PRIOR' name='noprintset_CT_PROCESS_PRIOR' class='datagrid-cell "+ms.tdClass(formId, 'CT_PROCESS_PRIOR')+"' style='"+ms.tdStyle(formId, 'CT_PROCESS_PRIOR')+"' "+ms.tdEvent(formId, 'CT_PROCESS_PRIOR')+">")
            arrHtml.push("<span colno='CT_PROCESS_PRIOR' class='"+ms.uiClass(formId, 'CT_PROCESS_PRIOR')+"' style='"+ms.uiStyle(formId, 'CT_PROCESS_PRIOR')+"' "+ms.uiEvent(formId, 'CT_PROCESS_PRIOR')+" title='"+ms.titleAttr(formId,'CT_PROCESS_PRIOR','IS_TITLE_ATTR',v)+"' >"+v['CT_PROCESS_PRIOR']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_DEFAULT_FLAG' name='noprintset_CT_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CT_DEFAULT_FLAG')+"' style='"+ms.tdStyle(formId, 'CT_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'CT_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='CT_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'CT_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'CT_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'CT_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'CT_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CT_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_VALID_FLAG' name='noprintset_CT_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CT_VALID_FLAG')+"' style='"+ms.tdStyle(formId, 'CT_VALID_FLAG')+"' "+ms.tdEvent(formId, 'CT_VALID_FLAG')+">")
            arrHtml.push("<span colno='CT_VALID_FLAG' class='"+ms.uiClass(formId, 'CT_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'CT_VALID_FLAG')+"' "+ms.uiEvent(formId, 'CT_VALID_FLAG')+" title='"+ms.titleAttr(formId,'CT_VALID_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CT_VALID_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='b683479acde94bac9a638cc49a5dd736'){<%--工艺关联机种信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_MODEL_CODE' name='noprintset_CTM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CTM_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'CTM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CTM_MODEL_CODE')+">")
            arrHtml.push("<span colno='CTM_MODEL_CODE' class='"+ms.uiClass(formId, 'CTM_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'CTM_MODEL_CODE')+"' "+ms.uiEvent(formId, 'CTM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CTM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['CTM_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_PROCESS_FACE' name='noprintset_CTM_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CTM_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'CTM_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CTM_PROCESS_FACE')+">")
            arrHtml.push("<span colno='CTM_PROCESS_FACE' class='"+ms.uiClass(formId, 'CTM_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CTM_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CTM_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CTM_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['CTM_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_PRODUCT_STEP' name='noprintset_CTM_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CTM_PRODUCT_STEP')+"' style='"+ms.tdStyle(formId, 'CTM_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CTM_PRODUCT_STEP')+">")
            arrHtml.push("<span colno='CTM_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CTM_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CTM_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CTM_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'CTM_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['CTM_PRODUCT_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_ID' name='noprintset_CTM_ID' class='datagrid-cell "+ms.tdClass(formId, 'CTM_ID')+"' style='"+ms.tdStyle(formId, 'CTM_ID')+"' "+ms.tdEvent(formId, 'CTM_ID')+">")
            arrHtml.push("<span colno='CTM_ID' class='"+ms.uiClass(formId, 'CTM_ID')+"' style='"+ms.uiStyle(formId, 'CTM_ID')+"' "+ms.uiEvent(formId, 'CTM_ID')+" title='"+ms.titleAttr(formId,'CTM_ID','IS_TITLE_ATTR',v)+"' >"+v['CTM_ID']+"</span>")
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
    if(formId=='9ce89b8198274a25b7219ad226eda21e'){<%--工艺信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='CT_ID' name='noprintset_CT_ID' class='datagrid-cell "+ms.tdClass(formId, 'CT_ID')+"' style='"+ms.tdStyle(formId, 'CT_ID')+"' "+ms.tdEvent(formId, 'CT_ID')+">")
            arrHtml.push("<span colno='CT_ID' class='"+ms.uiClass(formId, 'CT_ID')+"' style='"+ms.uiStyle(formId, 'CT_ID')+"' "+ms.uiEvent(formId, 'CT_ID')+" title='"+ms.titleAttr(formId,'CT_ID','IS_TITLE_ATTR',v)+"' >"+v['CT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_NAME' name='noprintset_CT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CT_NAME')+"' style='"+ms.tdStyle(formId, 'CT_NAME')+"' "+ms.tdEvent(formId, 'CT_NAME')+">")
            arrHtml.push("<span colno='CT_NAME' class='"+ms.uiClass(formId, 'CT_NAME')+"' style='"+ms.uiStyle(formId, 'CT_NAME')+"' "+ms.uiEvent(formId, 'CT_NAME')+" title='"+ms.titleAttr(formId,'CT_NAME','IS_TITLE_ATTR',v)+"' >"+v['CT_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_PRODUCT_STEP' name='noprintset_CT_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CT_PRODUCT_STEP')+"' style='"+ms.tdStyle(formId, 'CT_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CT_PRODUCT_STEP')+">")
            arrHtml.push("<span colno='CT_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CT_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CT_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CT_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'CT_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['CT_PRODUCT_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_PROCESS_FACE' name='noprintset_CT_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CT_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'CT_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CT_PROCESS_FACE')+">")
            arrHtml.push("<span colno='CT_PROCESS_FACE' class='"+ms.uiClass(formId, 'CT_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CT_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CT_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CT_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['CT_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_ROUTE_CODE' name='noprintset_CT_ROUTE_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CT_ROUTE_CODE')+"' style='"+ms.tdStyle(formId, 'CT_ROUTE_CODE')+"' "+ms.tdEvent(formId, 'CT_ROUTE_CODE')+">")
            arrHtml.push("<span colno='CT_ROUTE_CODE' class='"+ms.uiClass(formId, 'CT_ROUTE_CODE')+"' style='"+ms.uiStyle(formId, 'CT_ROUTE_CODE')+"' "+ms.uiEvent(formId, 'CT_ROUTE_CODE')+" title='"+ms.titleAttr(formId,'CT_ROUTE_CODE','IS_TITLE_ATTR',v)+"' >"+v['CT_ROUTE_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_PREPOSE_TECH' name='noprintset_CT_PREPOSE_TECH' class='datagrid-cell "+ms.tdClass(formId, 'CT_PREPOSE_TECH')+"' style='"+ms.tdStyle(formId, 'CT_PREPOSE_TECH')+"' "+ms.tdEvent(formId, 'CT_PREPOSE_TECH')+">")
            arrHtml.push("<span colno='CT_PREPOSE_TECH' class='"+ms.uiClass(formId, 'CT_PREPOSE_TECH')+"' style='"+ms.uiStyle(formId, 'CT_PREPOSE_TECH')+"' "+ms.uiEvent(formId, 'CT_PREPOSE_TECH')+" title='"+ms.titleAttr(formId,'CT_PREPOSE_TECH','IS_TITLE_ATTR',v)+"' >"+v['CT_PREPOSE_TECH']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_PROCESS_PRIOR' name='noprintset_CT_PROCESS_PRIOR' class='datagrid-cell "+ms.tdClass(formId, 'CT_PROCESS_PRIOR')+"' style='"+ms.tdStyle(formId, 'CT_PROCESS_PRIOR')+"' "+ms.tdEvent(formId, 'CT_PROCESS_PRIOR')+">")
            arrHtml.push("<span colno='CT_PROCESS_PRIOR' class='"+ms.uiClass(formId, 'CT_PROCESS_PRIOR')+"' style='"+ms.uiStyle(formId, 'CT_PROCESS_PRIOR')+"' "+ms.uiEvent(formId, 'CT_PROCESS_PRIOR')+" title='"+ms.titleAttr(formId,'CT_PROCESS_PRIOR','IS_TITLE_ATTR',v)+"' >"+v['CT_PROCESS_PRIOR']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_DEFAULT_FLAG' name='noprintset_CT_DEFAULT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CT_DEFAULT_FLAG')+"' style='"+ms.tdStyle(formId, 'CT_DEFAULT_FLAG')+"' "+ms.tdEvent(formId, 'CT_DEFAULT_FLAG')+">")
            arrHtml.push("<span colno='CT_DEFAULT_FLAG' class='"+ms.uiClass(formId, 'CT_DEFAULT_FLAG')+"' style='"+ms.uiStyle(formId, 'CT_DEFAULT_FLAG')+"' "+ms.uiEvent(formId, 'CT_DEFAULT_FLAG')+" title='"+ms.titleAttr(formId,'CT_DEFAULT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CT_DEFAULT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CT_VALID_FLAG' name='noprintset_CT_VALID_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'CT_VALID_FLAG')+"' style='"+ms.tdStyle(formId, 'CT_VALID_FLAG')+"' "+ms.tdEvent(formId, 'CT_VALID_FLAG')+">")
            arrHtml.push("<span colno='CT_VALID_FLAG' class='"+ms.uiClass(formId, 'CT_VALID_FLAG')+"' style='"+ms.uiStyle(formId, 'CT_VALID_FLAG')+"' "+ms.uiEvent(formId, 'CT_VALID_FLAG')+" title='"+ms.titleAttr(formId,'CT_VALID_FLAG','IS_TITLE_ATTR',v)+"' >"+v['CT_VALID_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
    }
    if(formId=='b683479acde94bac9a638cc49a5dd736'){<%--工艺关联机种信息表--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='CTM_MODEL_CODE' name='noprintset_CTM_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CTM_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'CTM_MODEL_CODE')+"' "+ms.tdEvent(formId, 'CTM_MODEL_CODE')+">")
            arrHtml.push("<span colno='CTM_MODEL_CODE' class='"+ms.uiClass(formId, 'CTM_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'CTM_MODEL_CODE')+"' "+ms.uiEvent(formId, 'CTM_MODEL_CODE')+" title='"+ms.titleAttr(formId,'CTM_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['CTM_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_PROCESS_FACE' name='noprintset_CTM_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'CTM_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'CTM_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'CTM_PROCESS_FACE')+">")
            arrHtml.push("<span colno='CTM_PROCESS_FACE' class='"+ms.uiClass(formId, 'CTM_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'CTM_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'CTM_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'CTM_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['CTM_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_PRODUCT_STEP' name='noprintset_CTM_PRODUCT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'CTM_PRODUCT_STEP')+"' style='"+ms.tdStyle(formId, 'CTM_PRODUCT_STEP')+"' "+ms.tdEvent(formId, 'CTM_PRODUCT_STEP')+">")
            arrHtml.push("<span colno='CTM_PRODUCT_STEP' class='"+ms.uiClass(formId, 'CTM_PRODUCT_STEP')+"' style='"+ms.uiStyle(formId, 'CTM_PRODUCT_STEP')+"' "+ms.uiEvent(formId, 'CTM_PRODUCT_STEP')+" title='"+ms.titleAttr(formId,'CTM_PRODUCT_STEP','IS_TITLE_ATTR',v)+"' >"+v['CTM_PRODUCT_STEP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CTM_ID' name='noprintset_CTM_ID' class='datagrid-cell "+ms.tdClass(formId, 'CTM_ID')+"' style='"+ms.tdStyle(formId, 'CTM_ID')+"' "+ms.tdEvent(formId, 'CTM_ID')+">")
            arrHtml.push("<span colno='CTM_ID' class='"+ms.uiClass(formId, 'CTM_ID')+"' style='"+ms.uiStyle(formId, 'CTM_ID')+"' "+ms.uiEvent(formId, 'CTM_ID')+" title='"+ms.titleAttr(formId,'CTM_ID','IS_TITLE_ATTR',v)+"' >"+v['CTM_ID']+"</span>")
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
