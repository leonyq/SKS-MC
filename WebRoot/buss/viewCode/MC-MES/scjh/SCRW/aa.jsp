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
		<dict:lang value="aaaa" />
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
		<bu:header formId ="b36254ac37e74240b1528d44627b6a84"/>

    
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
		<bu:func viewId="1e37298467e14df9b8c8833fc96e70ed" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="1e37298467e14df9b8c8833fc96e70ed" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPageb36254ac37e74240b1528d44627b6a84" id="formPageb36254ac37e74240b1528d44627b6a84" value="${formPageb36254ac37e74240b1528d44627b6a84}"/>
		<input type="hidden" name="formId" id="formId1" value='b36254ac37e74240b1528d44627b6a84'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='339b7c191163426684496a67b2a51866'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='92c585de53ff4e9f879b4e4bc0c16e8f'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="b36254ac37e74240b1528d44627b6a84">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb36254ac37e74240b1528d44627b6a84" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerb36254ac37e74240b1528d44627b6a84">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb36254ac37e74240b1528d44627b6a84">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="b36254ac37e74240b1528d44627b6a84" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b36254ac37e74240b1528d44627b6a84" onclick="_selectAjaxTableAllData(this,'b36254ac37e74240b1528d44627b6a84')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_WEIGHT_EMP" class="datagrid-cell"><bu:uitn colNo="WEIGHT_EMP" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_PROJECT_ID" class="datagrid-cell"><bu:uitn colNo="PROJECT_ID" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_CRAFTS_EMP" class="datagrid-cell"><bu:uitn colNo="CRAFTS_EMP" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_ADMIN_EMP" class="datagrid-cell"><bu:uitn colNo="ADMIN_EMP" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_WEIGHT_MONITOR" class="datagrid-cell"><bu:uitn colNo="WEIGHT_MONITOR" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_MODEL_CODE" class="datagrid-cell"><bu:uitn colNo="MODEL_CODE" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_LOT_NUMBER" class="datagrid-cell"><bu:uitn colNo="LOT_NUMBER" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_T2#PREPARE_COUNT" class="datagrid-cell"><bu:uitn colNo="T2#PREPARE_COUNT" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_T5#PRODUCT_COUNT" class="datagrid-cell"><bu:uitn colNo="T5#PRODUCT_COUNT" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_T3#FEED_COUNT" class="datagrid-cell"><bu:uitn colNo="T3#FEED_COUNT" formId="b36254ac37e74240b1528d44627b6a84" /></td>
			<td name="noprintset_T4#FEED_NUM" class="datagrid-cell"><bu:uitn colNo="T4#FEED_NUM" formId="b36254ac37e74240b1528d44627b6a84" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb36254ac37e74240b1528d44627b6a84" onscroll="ajaxTableScroll(this,'b36254ac37e74240b1528d44627b6a84')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb36254ac37e74240b1528d44627b6a84">
		<tbody id="tbody_b36254ac37e74240b1528d44627b6a84" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPageb36254ac37e74240b1528d44627b6a84==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b36254ac37e74240b1528d44627b6a84&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('b36254ac37e74240b1528d44627b6a84','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?司称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WEIGHT_EMP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WEIGHT_EMP" value="" title_name="?司称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_ID" value="" title_name="工单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?工艺员</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CRAFTS_EMP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CRAFTS_EMP" value="" title_name="?工艺员" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?管理员</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ADMIN_EMP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ADMIN_EMP" value="" title_name="?管理员" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?监称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WEIGHT_MONITOR" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WEIGHT_MONITOR" value="" title_name="?监称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MODEL_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MODEL_CODE" value="" title_name="机种料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产批次</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="LOT_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="LOT_NUMBER" value="" title_name="生产批次" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?备料总重</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T2#PREPARE_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T2#PREPARE_COUNT" value="" title_name="?备料总重" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?重量总计</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T5#PRODUCT_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T5#PRODUCT_COUNT" value="" title_name="?重量总计" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?实投总重</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T3#FEED_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T3#FEED_COUNT" value="" title_name="?实投总重" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?投料数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="T4#FEED_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="T4#FEED_NUM" value="" title_name="?投料数量" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="formPage92c585de53ff4e9f879b4e4bc0c16e8f" id="formPage92c585de53ff4e9f879b4e4bc0c16e8f" value="${formPage92c585de53ff4e9f879b4e4bc0c16e8f}"/>
		<input type="hidden" name="formId" id="formId2" value='92c585de53ff4e9f879b4e4bc0c16e8f'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="92c585de53ff4e9f879b4e4bc0c16e8f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax92c585de53ff4e9f879b4e4bc0c16e8f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner92c585de53ff4e9f879b4e4bc0c16e8f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable92c585de53ff4e9f879b4e4bc0c16e8f">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="92c585de53ff4e9f879b4e4bc0c16e8f" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_92c585de53ff4e9f879b4e4bc0c16e8f" onclick="_selectAjaxTableAllData(this,'92c585de53ff4e9f879b4e4bc0c16e8f')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_ITEM_CODE" class="datagrid-cell"><bu:uitn colNo="ITEM_CODE" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_PROJECT_ID" class="datagrid-cell"><bu:uitn colNo="PROJECT_ID" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_MODEL_CODE" class="datagrid-cell"><bu:uitn colNo="MODEL_CODE" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_ITEM_NUM" class="datagrid-cell"><bu:uitn colNo="ITEM_NUM" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_FEED_NUM" class="datagrid-cell"><bu:uitn colNo="FEED_NUM" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
			<td name="noprintset_PROCESS_ORDER" class="datagrid-cell"><bu:uitn colNo="PROCESS_ORDER" formId="92c585de53ff4e9f879b4e4bc0c16e8f" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv92c585de53ff4e9f879b4e4bc0c16e8f" onscroll="ajaxTableScroll(this,'92c585de53ff4e9f879b4e4bc0c16e8f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax92c585de53ff4e9f879b4e4bc0c16e8f">
		<tbody id="tbody_92c585de53ff4e9f879b4e4bc0c16e8f" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage92c585de53ff4e9f879b4e4bc0c16e8f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=92c585de53ff4e9f879b4e4bc0c16e8f&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('92c585de53ff4e9f879b4e4bc0c16e8f','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>?物料编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ITEM_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ITEM_CODE" value="" title_name="?物料编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_ID" value="" title_name="工单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MODEL_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MODEL_CODE" value="" title_name="机种编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?备料数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ITEM_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ITEM_NUM" value="" title_name="?备料数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>投入数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FEED_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FEED_NUM" value="" title_name="投入数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?工艺顺序</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROCESS_ORDER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROCESS_ORDER" value="" title_name="?工艺顺序" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" id="relColVals" name="relColVals" value='PROJECT_ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="1e37298467e14df9b8c8833fc96e70ed" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="1e37298467e14df9b8c8833fc96e70ed" />
    
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
    if(formId=='b36254ac37e74240b1528d44627b6a84'){<%--VOID-投料基础表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEIGHT_EMP' name='noprintset_WEIGHT_EMP' class='datagrid-cell  "+ms.tdClass(formId, 'WEIGHT_EMP')+"' style='"+ms.tdStyle(formId, 'WEIGHT_EMP')+"' "+ms.tdEvent(formId, 'WEIGHT_EMP')+">");
            arrHtml.push("<span colno='WEIGHT_EMP' class='"+ms.uiClass(formId, 'WEIGHT_EMP')+"' style='"+ms.uiStyle(formId, 'WEIGHT_EMP')+"' "+ms.uiEvent(formId, 'WEIGHT_EMP')+" title='"+ms.titleAttr(formId,'WEIGHT_EMP','IS_TITLE_ATTR',v)+"' >"+v['WEIGHT_EMP']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRAFTS_EMP' name='noprintset_CRAFTS_EMP' class='datagrid-cell  "+ms.tdClass(formId, 'CRAFTS_EMP')+"' style='"+ms.tdStyle(formId, 'CRAFTS_EMP')+"' "+ms.tdEvent(formId, 'CRAFTS_EMP')+">");
            arrHtml.push("<span colno='CRAFTS_EMP' class='"+ms.uiClass(formId, 'CRAFTS_EMP')+"' style='"+ms.uiStyle(formId, 'CRAFTS_EMP')+"' "+ms.uiEvent(formId, 'CRAFTS_EMP')+" title='"+ms.titleAttr(formId,'CRAFTS_EMP','IS_TITLE_ATTR',v)+"' >"+v['CRAFTS_EMP']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ADMIN_EMP' name='noprintset_ADMIN_EMP' class='datagrid-cell  "+ms.tdClass(formId, 'ADMIN_EMP')+"' style='"+ms.tdStyle(formId, 'ADMIN_EMP')+"' "+ms.tdEvent(formId, 'ADMIN_EMP')+">");
            arrHtml.push("<span colno='ADMIN_EMP' class='"+ms.uiClass(formId, 'ADMIN_EMP')+"' style='"+ms.uiStyle(formId, 'ADMIN_EMP')+"' "+ms.uiEvent(formId, 'ADMIN_EMP')+" title='"+ms.titleAttr(formId,'ADMIN_EMP','IS_TITLE_ATTR',v)+"' >"+v['ADMIN_EMP']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEIGHT_MONITOR' name='noprintset_WEIGHT_MONITOR' class='datagrid-cell  "+ms.tdClass(formId, 'WEIGHT_MONITOR')+"' style='"+ms.tdStyle(formId, 'WEIGHT_MONITOR')+"' "+ms.tdEvent(formId, 'WEIGHT_MONITOR')+">");
            arrHtml.push("<span colno='WEIGHT_MONITOR' class='"+ms.uiClass(formId, 'WEIGHT_MONITOR')+"' style='"+ms.uiStyle(formId, 'WEIGHT_MONITOR')+"' "+ms.uiEvent(formId, 'WEIGHT_MONITOR')+" title='"+ms.titleAttr(formId,'WEIGHT_MONITOR','IS_TITLE_ATTR',v)+"' >"+v['WEIGHT_MONITOR']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MODEL_CODE' name='noprintset_MODEL_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'MODEL_CODE')+"' "+ms.tdEvent(formId, 'MODEL_CODE')+">");
            arrHtml.push("<span colno='MODEL_CODE' class='"+ms.uiClass(formId, 'MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'MODEL_CODE')+"' "+ms.uiEvent(formId, 'MODEL_CODE')+" title='"+ms.titleAttr(formId,'MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['MODEL_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LOT_NUMBER' name='noprintset_LOT_NUMBER' class='datagrid-cell  "+ms.tdClass(formId, 'LOT_NUMBER')+"' style='"+ms.tdStyle(formId, 'LOT_NUMBER')+"' "+ms.tdEvent(formId, 'LOT_NUMBER')+">");
            arrHtml.push("<span colno='LOT_NUMBER' class='"+ms.uiClass(formId, 'LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'LOT_NUMBER')+"' "+ms.uiEvent(formId, 'LOT_NUMBER')+" title='"+ms.titleAttr(formId,'LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['LOT_NUMBER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PREPARE_COUNT' name='noprintset_T2#PREPARE_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T2#PREPARE_COUNT')+"' style='"+ms.tdStyle(formId, 'T2#PREPARE_COUNT')+"' "+ms.tdEvent(formId, 'T2#PREPARE_COUNT')+">");
            arrHtml.push("<span colno='T2#PREPARE_COUNT' class='"+ms.uiClass(formId, 'T2#PREPARE_COUNT')+"' style='"+ms.uiStyle(formId, 'T2#PREPARE_COUNT')+"' "+ms.uiEvent(formId, 'T2#PREPARE_COUNT')+" title='"+ms.titleAttr(formId,'T2#PREPARE_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T2#PREPARE_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T5#PRODUCT_COUNT' name='noprintset_T5#PRODUCT_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T5#PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'T5#PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'T5#PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='T5#PRODUCT_COUNT' class='"+ms.uiClass(formId, 'T5#PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'T5#PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'T5#PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'T5#PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T5#PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#FEED_COUNT' name='noprintset_T3#FEED_COUNT' class='datagrid-cell  "+ms.tdClass(formId, 'T3#FEED_COUNT')+"' style='"+ms.tdStyle(formId, 'T3#FEED_COUNT')+"' "+ms.tdEvent(formId, 'T3#FEED_COUNT')+">");
            arrHtml.push("<span colno='T3#FEED_COUNT' class='"+ms.uiClass(formId, 'T3#FEED_COUNT')+"' style='"+ms.uiStyle(formId, 'T3#FEED_COUNT')+"' "+ms.uiEvent(formId, 'T3#FEED_COUNT')+" title='"+ms.titleAttr(formId,'T3#FEED_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T3#FEED_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#FEED_NUM' name='noprintset_T4#FEED_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'T4#FEED_NUM')+"' style='"+ms.tdStyle(formId, 'T4#FEED_NUM')+"' "+ms.tdEvent(formId, 'T4#FEED_NUM')+">");
            arrHtml.push("<span colno='T4#FEED_NUM' class='"+ms.uiClass(formId, 'T4#FEED_NUM')+"' style='"+ms.uiStyle(formId, 'T4#FEED_NUM')+"' "+ms.uiEvent(formId, 'T4#FEED_NUM')+" title='"+ms.titleAttr(formId,'T4#FEED_NUM','IS_TITLE_ATTR',v)+"' >"+v['T4#FEED_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='92c585de53ff4e9f879b4e4bc0c16e8f'){<%--VOID-投料明细表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'ITEM_CODE')+"' "+ms.tdEvent(formId, 'ITEM_CODE')+">");
            arrHtml.push("<span colno='ITEM_CODE' class='"+ms.uiClass(formId, 'ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'ITEM_CODE')+"' "+ms.uiEvent(formId, 'ITEM_CODE')+" title='"+ms.titleAttr(formId,'ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MODEL_CODE' name='noprintset_MODEL_CODE' class='datagrid-cell  "+ms.tdClass(formId, 'MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'MODEL_CODE')+"' "+ms.tdEvent(formId, 'MODEL_CODE')+">");
            arrHtml.push("<span colno='MODEL_CODE' class='"+ms.uiClass(formId, 'MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'MODEL_CODE')+"' "+ms.uiEvent(formId, 'MODEL_CODE')+" title='"+ms.titleAttr(formId,'MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['MODEL_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'ITEM_NUM')+"' "+ms.tdEvent(formId, 'ITEM_NUM')+">");
            arrHtml.push("<span colno='ITEM_NUM' class='"+ms.uiClass(formId, 'ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'ITEM_NUM')+"' "+ms.uiEvent(formId, 'ITEM_NUM')+" title='"+ms.titleAttr(formId,'ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['ITEM_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FEED_NUM' name='noprintset_FEED_NUM' class='datagrid-cell  "+ms.tdClass(formId, 'FEED_NUM')+"' style='"+ms.tdStyle(formId, 'FEED_NUM')+"' "+ms.tdEvent(formId, 'FEED_NUM')+">");
            arrHtml.push("<span colno='FEED_NUM' class='"+ms.uiClass(formId, 'FEED_NUM')+"' style='"+ms.uiStyle(formId, 'FEED_NUM')+"' "+ms.uiEvent(formId, 'FEED_NUM')+" title='"+ms.titleAttr(formId,'FEED_NUM','IS_TITLE_ATTR',v)+"' >"+v['FEED_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROCESS_ORDER' name='noprintset_PROCESS_ORDER' class='datagrid-cell  "+ms.tdClass(formId, 'PROCESS_ORDER')+"' style='"+ms.tdStyle(formId, 'PROCESS_ORDER')+"' "+ms.tdEvent(formId, 'PROCESS_ORDER')+">");
            arrHtml.push("<span colno='PROCESS_ORDER' class='"+ms.uiClass(formId, 'PROCESS_ORDER')+"' style='"+ms.uiStyle(formId, 'PROCESS_ORDER')+"' "+ms.uiEvent(formId, 'PROCESS_ORDER')+" title='"+ms.titleAttr(formId,'PROCESS_ORDER','IS_TITLE_ATTR',v)+"' >"+v['PROCESS_ORDER']+"</span>");
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
    if(formId=='b36254ac37e74240b1528d44627b6a84'){<%--VOID-投料基础表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='WEIGHT_EMP' name='noprintset_WEIGHT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WEIGHT_EMP')+"' style='"+ms.tdStyle(formId, 'WEIGHT_EMP')+"' "+ms.tdEvent(formId, 'WEIGHT_EMP')+">");
            arrHtml.push("<span colno='WEIGHT_EMP' class='"+ms.uiClass(formId, 'WEIGHT_EMP')+"' style='"+ms.uiStyle(formId, 'WEIGHT_EMP')+"' "+ms.uiEvent(formId, 'WEIGHT_EMP')+" title='"+ms.titleAttr(formId,'WEIGHT_EMP','IS_TITLE_ATTR',v)+"' >"+v['WEIGHT_EMP']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CRAFTS_EMP' name='noprintset_CRAFTS_EMP' class='datagrid-cell "+ms.tdClass(formId, 'CRAFTS_EMP')+"' style='"+ms.tdStyle(formId, 'CRAFTS_EMP')+"' "+ms.tdEvent(formId, 'CRAFTS_EMP')+">");
            arrHtml.push("<span colno='CRAFTS_EMP' class='"+ms.uiClass(formId, 'CRAFTS_EMP')+"' style='"+ms.uiStyle(formId, 'CRAFTS_EMP')+"' "+ms.uiEvent(formId, 'CRAFTS_EMP')+" title='"+ms.titleAttr(formId,'CRAFTS_EMP','IS_TITLE_ATTR',v)+"' >"+v['CRAFTS_EMP']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ADMIN_EMP' name='noprintset_ADMIN_EMP' class='datagrid-cell "+ms.tdClass(formId, 'ADMIN_EMP')+"' style='"+ms.tdStyle(formId, 'ADMIN_EMP')+"' "+ms.tdEvent(formId, 'ADMIN_EMP')+">");
            arrHtml.push("<span colno='ADMIN_EMP' class='"+ms.uiClass(formId, 'ADMIN_EMP')+"' style='"+ms.uiStyle(formId, 'ADMIN_EMP')+"' "+ms.uiEvent(formId, 'ADMIN_EMP')+" title='"+ms.titleAttr(formId,'ADMIN_EMP','IS_TITLE_ATTR',v)+"' >"+v['ADMIN_EMP']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WEIGHT_MONITOR' name='noprintset_WEIGHT_MONITOR' class='datagrid-cell "+ms.tdClass(formId, 'WEIGHT_MONITOR')+"' style='"+ms.tdStyle(formId, 'WEIGHT_MONITOR')+"' "+ms.tdEvent(formId, 'WEIGHT_MONITOR')+">");
            arrHtml.push("<span colno='WEIGHT_MONITOR' class='"+ms.uiClass(formId, 'WEIGHT_MONITOR')+"' style='"+ms.uiStyle(formId, 'WEIGHT_MONITOR')+"' "+ms.uiEvent(formId, 'WEIGHT_MONITOR')+" title='"+ms.titleAttr(formId,'WEIGHT_MONITOR','IS_TITLE_ATTR',v)+"' >"+v['WEIGHT_MONITOR']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MODEL_CODE' name='noprintset_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'MODEL_CODE')+"' "+ms.tdEvent(formId, 'MODEL_CODE')+">");
            arrHtml.push("<span colno='MODEL_CODE' class='"+ms.uiClass(formId, 'MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'MODEL_CODE')+"' "+ms.uiEvent(formId, 'MODEL_CODE')+" title='"+ms.titleAttr(formId,'MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['MODEL_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LOT_NUMBER' name='noprintset_LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'LOT_NUMBER')+"' style='"+ms.tdStyle(formId, 'LOT_NUMBER')+"' "+ms.tdEvent(formId, 'LOT_NUMBER')+">");
            arrHtml.push("<span colno='LOT_NUMBER' class='"+ms.uiClass(formId, 'LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'LOT_NUMBER')+"' "+ms.uiEvent(formId, 'LOT_NUMBER')+" title='"+ms.titleAttr(formId,'LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['LOT_NUMBER']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T2#PREPARE_COUNT' name='noprintset_T2#PREPARE_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'T2#PREPARE_COUNT')+"' style='"+ms.tdStyle(formId, 'T2#PREPARE_COUNT')+"' "+ms.tdEvent(formId, 'T2#PREPARE_COUNT')+">");
            arrHtml.push("<span colno='T2#PREPARE_COUNT' class='"+ms.uiClass(formId, 'T2#PREPARE_COUNT')+"' style='"+ms.uiStyle(formId, 'T2#PREPARE_COUNT')+"' "+ms.uiEvent(formId, 'T2#PREPARE_COUNT')+" title='"+ms.titleAttr(formId,'T2#PREPARE_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T2#PREPARE_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T5#PRODUCT_COUNT' name='noprintset_T5#PRODUCT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'T5#PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'T5#PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'T5#PRODUCT_COUNT')+">");
            arrHtml.push("<span colno='T5#PRODUCT_COUNT' class='"+ms.uiClass(formId, 'T5#PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'T5#PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'T5#PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'T5#PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T5#PRODUCT_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T3#FEED_COUNT' name='noprintset_T3#FEED_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'T3#FEED_COUNT')+"' style='"+ms.tdStyle(formId, 'T3#FEED_COUNT')+"' "+ms.tdEvent(formId, 'T3#FEED_COUNT')+">");
            arrHtml.push("<span colno='T3#FEED_COUNT' class='"+ms.uiClass(formId, 'T3#FEED_COUNT')+"' style='"+ms.uiStyle(formId, 'T3#FEED_COUNT')+"' "+ms.uiEvent(formId, 'T3#FEED_COUNT')+" title='"+ms.titleAttr(formId,'T3#FEED_COUNT','IS_TITLE_ATTR',v)+"' >"+v['T3#FEED_COUNT']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='T4#FEED_NUM' name='noprintset_T4#FEED_NUM' class='datagrid-cell "+ms.tdClass(formId, 'T4#FEED_NUM')+"' style='"+ms.tdStyle(formId, 'T4#FEED_NUM')+"' "+ms.tdEvent(formId, 'T4#FEED_NUM')+">");
            arrHtml.push("<span colno='T4#FEED_NUM' class='"+ms.uiClass(formId, 'T4#FEED_NUM')+"' style='"+ms.uiStyle(formId, 'T4#FEED_NUM')+"' "+ms.uiEvent(formId, 'T4#FEED_NUM')+" title='"+ms.titleAttr(formId,'T4#FEED_NUM','IS_TITLE_ATTR',v)+"' >"+v['T4#FEED_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
    }
    if(formId=='92c585de53ff4e9f879b4e4bc0c16e8f'){<%--VOID-投料明细表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'ITEM_CODE')+"' "+ms.tdEvent(formId, 'ITEM_CODE')+">");
            arrHtml.push("<span colno='ITEM_CODE' class='"+ms.uiClass(formId, 'ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'ITEM_CODE')+"' "+ms.uiEvent(formId, 'ITEM_CODE')+" title='"+ms.titleAttr(formId,'ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['ITEM_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
            arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MODEL_CODE' name='noprintset_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'MODEL_CODE')+"' "+ms.tdEvent(formId, 'MODEL_CODE')+">");
            arrHtml.push("<span colno='MODEL_CODE' class='"+ms.uiClass(formId, 'MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'MODEL_CODE')+"' "+ms.uiEvent(formId, 'MODEL_CODE')+" title='"+ms.titleAttr(formId,'MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['MODEL_CODE']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell "+ms.tdClass(formId, 'ITEM_NUM')+"' style='"+ms.tdStyle(formId, 'ITEM_NUM')+"' "+ms.tdEvent(formId, 'ITEM_NUM')+">");
            arrHtml.push("<span colno='ITEM_NUM' class='"+ms.uiClass(formId, 'ITEM_NUM')+"' style='"+ms.uiStyle(formId, 'ITEM_NUM')+"' "+ms.uiEvent(formId, 'ITEM_NUM')+" title='"+ms.titleAttr(formId,'ITEM_NUM','IS_TITLE_ATTR',v)+"' >"+v['ITEM_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='FEED_NUM' name='noprintset_FEED_NUM' class='datagrid-cell "+ms.tdClass(formId, 'FEED_NUM')+"' style='"+ms.tdStyle(formId, 'FEED_NUM')+"' "+ms.tdEvent(formId, 'FEED_NUM')+">");
            arrHtml.push("<span colno='FEED_NUM' class='"+ms.uiClass(formId, 'FEED_NUM')+"' style='"+ms.uiStyle(formId, 'FEED_NUM')+"' "+ms.uiEvent(formId, 'FEED_NUM')+" title='"+ms.titleAttr(formId,'FEED_NUM','IS_TITLE_ATTR',v)+"' >"+v['FEED_NUM']+"</span>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PROCESS_ORDER' name='noprintset_PROCESS_ORDER' class='datagrid-cell "+ms.tdClass(formId, 'PROCESS_ORDER')+"' style='"+ms.tdStyle(formId, 'PROCESS_ORDER')+"' "+ms.tdEvent(formId, 'PROCESS_ORDER')+">");
            arrHtml.push("<span colno='PROCESS_ORDER' class='"+ms.uiClass(formId, 'PROCESS_ORDER')+"' style='"+ms.uiStyle(formId, 'PROCESS_ORDER')+"' "+ms.uiEvent(formId, 'PROCESS_ORDER')+" title='"+ms.titleAttr(formId,'PROCESS_ORDER','IS_TITLE_ATTR',v)+"' >"+v['PROCESS_ORDER']+"</span>");
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
