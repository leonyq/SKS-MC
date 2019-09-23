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
		<dict:lang value="VOID-产品包装-cjx当日待处理" />
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
		<bu:header formId ="e8615feea3564a5db39792538a2cd754"/>

    
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
		<bu:func viewId="b17acb6d5cf84f9499281de0eefc8941" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="b17acb6d5cf84f9499281de0eefc8941" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagee8615feea3564a5db39792538a2cd754" id="formPagee8615feea3564a5db39792538a2cd754" value="${formPagee8615feea3564a5db39792538a2cd754}"/>
		<input type="hidden" name="formId" id="formId1" value='e8615feea3564a5db39792538a2cd754'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="e8615feea3564a5db39792538a2cd754">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxe8615feea3564a5db39792538a2cd754" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innere8615feea3564a5db39792538a2cd754">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablee8615feea3564a5db39792538a2cd754">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
          	<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
          <td class="datagrid-cell" style="width:30px; text-align:center;">
           <bu:thSeq formId="e8615feea3564a5db39792538a2cd754" i18n="1"/></td>
          <td class="datagrid-cell" style="width:30px; text-align:center">
           <span><input type="checkbox" id="selectAll_e8615feea3564a5db39792538a2cd754" onclick="_selectAjaxTableAllData(this,'e8615feea3564a5db39792538a2cd754')" style="cursor: pointer;" title="全选"/></span>
          </td>
          <td class="datagrid-cell" style="width:200px;">
           <bu:uitn colNo="DATA_AUTH" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:150px;">
           <bu:uitn colNo="PROJECT_ID" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="text-align:center;width:70px;">
           <bu:uitn colNo="PROJECT_STATUS" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="text-align:center;width:100px;">
           <bu:uitn colNo="IS_REL" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:150px;">
           <bu:uitn colNo="PRODUCT_MATERIAL" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:150px;">
           <bu:uitn colNo="PRODUCT_NAME" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:150px;">
           <bu:uitn colNo="PRODUCT_STANDARD" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:70px;">
           <bu:uitn colNo="PRODUCT_COUNT" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:70px;">
           <bu:uitn colNo="FINISH_COUNT" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <%--
          <td class="datagrid-cell" style="width:110px;">
              <bu:uitn colNo="FAI_NUM" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:70px;">
              <bu:uitn colNo="FQC_COUNT" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:70px;">
              <bu:uitn colNo="FINISH_COUNT" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:140px;">
              <bu:uitn colNo="PROLEPSIS_START_DATE" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:140px;">
              <bu:uitn colNo="PROLEPSIS_END_DATE" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:150px;">
              <bu:uitn colNo="CUST_CODE" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:150px;">
              <bu:uitn colNo="DESTROY_NO" formId="e8615feea3564a5db39792538a2cd754"/></td>
          --%>
          <td class="datagrid-cell" style="width:90px;">
           <bu:uitn colNo="CREATE_USER" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:140px;">
           <bu:uitn colNo="CREATE_TIME" formId="e8615feea3564a5db39792538a2cd754"/></td>
          <td class="datagrid-cell" style="width:140px;">
           <bu:uitn colNo="EDIT_TIME" formId="e8615feea3564a5db39792538a2cd754"/></td>
         </bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDive8615feea3564a5db39792538a2cd754" onscroll="ajaxTableScroll(this,'e8615feea3564a5db39792538a2cd754')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxe8615feea3564a5db39792538a2cd754">
		<tbody id="tbody_e8615feea3564a5db39792538a2cd754" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagee8615feea3564a5db39792538a2cd754==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=e8615feea3564a5db39792538a2cd754&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('e8615feea3564a5db39792538a2cd754','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>工单状态</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_STATUS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_STATUS" value="" title_name="工单状态" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?是否关联</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="IS_REL" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="IS_REL" value="" title_name="?是否关联" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?自动下达制令单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_OFONESELF" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_OFONESELF" value="" title_name="?自动下达制令单" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?批次号（计划组号）</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="LOT_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="LOT_NUMBER" value="" title_name="?批次号（计划组号）" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>号段管控</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_FLAG" value="" title_name="号段管控" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种版本号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_MATERIAL_VER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_MATERIAL_VER" value="" title_name="机种版本号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?ERP工单单别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_ERPTYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_ERPTYPE" value="" title_name="?ERP工单单别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?号段条码规则</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_CONFIGURE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_CONFIGURE" value="" title_name="?号段条码规则" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?计划变动次数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PM_CHANGE_TIMES" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PM_CHANGE_TIMES" value="" title_name="?计划变动次数" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>号段起始</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_SN_START" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_SN_START" value="" title_name="号段起始" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?包装顺序管控YN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_PACK_SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_PACK_SEQ" value="" title_name="?包装顺序管控YN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>号段前缀</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_SN_PREFIX" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_SN_PREFIX" value="" title_name="号段前缀" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>号段终止</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_SN_END" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_SN_END" value="" title_name="号段终止" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>首件检测数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FAI_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FAI_NUM" value="" title_name="首件检测数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>生产阶别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_STEP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_STEP" value="" title_name="生产阶别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工单ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_ID" value="" title_name="工单ID" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_MATERIAL" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_MATERIAL" value="" title_name="机种料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种名称</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_NAME" value="" title_name="机种名称" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>规格</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_STANDARD" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_STANDARD" value="" title_name="规格" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>报废数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SCRAPPED_QTY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SCRAPPED_QTY" value="" title_name="报废数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?销 售单号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="DESTROY_NO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="DESTROY_NO" value="" title_name="?销 售单号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>客户代码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CUST_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CUST_CODE" value="" title_name="客户代码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>计划数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_COUNT" value="" title_name="计划数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>投入量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FQC_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FQC_COUNT" value="" title_name="投入量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>产出数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="FINISH_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="FINISH_COUNT" value="" title_name="产出数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?加工面数(1—单面 2—双面3-阴阳面)</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WORKING_SC" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WORKING_SC" value="" title_name="?加工面数(1—单面 2—双面3-阴阳面)" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?工单类型(0:正常、1:样品、2:RMA、3:其他)</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_TYPE" value="" title_name="?工单类型(0:正常、1:样品、2:RMA、3:其他)" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>预计开工日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROLEPSIS_START_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROLEPSIS_START_DATE" value="" title_name="预计开工日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>预计完工日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROLEPSIS_END_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROLEPSIS_END_DATE" value="" title_name="预计完工日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>计划交货日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="TPPB_PLAN_DELIVERY_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="TPPB_PLAN_DELIVERY_DATE" value="" title_name="计划交货日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>备注</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PM_MEMO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PM_MEMO" value="" title_name="备注" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>线别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PRODUCT_LINE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PRODUCT_LINE" value="" title_name="线别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>实际开工日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ACTUAL_START_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ACTUAL_START_DATE" value="" title_name="实际开工日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>实际完工日期</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="ACTUAL_END_DATE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="ACTUAL_END_DATE" value="" title_name="实际完工日期" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>关结原因</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PM_CLOSE_REASON" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PM_CLOSE_REASON" value="" title_name="关结原因" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?自动下达制令单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PM_OFONESELF" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PM_OFONESELF" value="" title_name="?自动下达制令单" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>关联数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="REL_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="REL_NUM" value="" title_name="关联数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?工单类别（0未分类，1制造单，2制造单,3其他单据）</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PROJECT_SORT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PROJECT_SORT" value="" title_name="?工单类别（0未分类，1制造单，2制造单,3其他单据）" />px
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
		<bu:submit viewId="b17acb6d5cf84f9499281de0eefc8941" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="b17acb6d5cf84f9499281de0eefc8941" />
    
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
    if(formId=='e8615feea3564a5db39792538a2cd754'){<%--VOID-产品包装-cjx当日待处理表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                if ($("#" + formId).find(".left-datagrid-title-ajax").length > 0) {
                    arrLeftHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                    arrLeftHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                    arrLeftHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrLeftHtml.push("</td>");
                } else {
                    arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                    arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrHtml.push("</td>");
                }
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH" + ms.tdClass(formId, 'DATA_AUTH') + "' style='width:200px;text-align:center;" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">");
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + v['DATA_AUTH'] + "' >" + v['DATA_AUTH'] + "</span>");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v['ID'] + "' value='" + v['DATA_AUTH_ID'] + "' /> ");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='width:150px;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + v['PROJECT_ID'] + "' >" + v['PROJECT_ID'] + "</span>");
                //arrHtml.push("<input type='hidden' id='PROJECT_OFONESELF" + v.ID + "' name='PROJECT_OFONESELF' value='" + uiRaw[i].PROJECT_OFONESELF + "' /></td>");

                arrHtml.push("<td colno='PROJECT_STATUS' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='PROJECT_STATUS'  class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " >" + v['PROJECT_STATUS'] + "</span>");
                //arrHtml.push("<input type='hidden' id='PROJECT_STATUS_" + v.ID + "' value='" + uiRaw[i].PROJECT_STATUS + "' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='IS_REL' class='datagrid-cell " + ms.tdClass(formId, 'IS_REL') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'IS_REL') + "' " + ms.tdEvent(formId, 'IS_REL') + ">");
                arrHtml.push("<span colno='IS_REL'  class='" + ms.uiClass(formId, 'IS_REL') + "' style='" + ms.uiStyle(formId, 'IS_REL') + "' " + ms.uiEvent(formId, 'IS_REL') + " >" + v['IS_REL'] + "</span>");
                //arrHtml.push("<input type='hidden' id='IS_REL" + v.ID + "' value='" + uiRaw[i].IS_REL + "' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL'  class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' onclick='itemJump1(\"" + v['PRODUCT_MATERIAL'] + "\")' style='display: inline;border-bottom: 1px solid #004098;' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + v['PRODUCT_MATERIAL'] + "' >" + v['PRODUCT_MATERIAL'] + "</span>");
                //arrHtml.push("<input type='hidden' id='PRODUCT_CONFIGURE_" + v.ID + "' value='" + uiRaw[i].PRODUCT_CONFIGURE + "' /></td>");
                arrHtml.push("<td colno='PRODUCT_NAME' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + v['PRODUCT_NAME'] + "' >" + v['PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_STANDARD') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.tdEvent(formId, 'PRODUCT_STANDARD') + ">");
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='" + ms.uiClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.uiStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.uiEvent(formId, 'PRODUCT_STANDARD') + " title='" + v['PRODUCT_STANDARD'] + "' >" + v['PRODUCT_STANDARD'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " >" + v['PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FINISH_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'FINISH_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'FINISH_COUNT') + "' " + ms.tdEvent(formId, 'FINISH_COUNT') + ">");
                arrHtml.push("<span colno='FINISH_COUNT' class='" + ms.uiClass(formId, 'FINISH_COUNT') + "' style='" + ms.uiStyle(formId, 'FINISH_COUNT') + "' " + ms.uiEvent(formId, 'FINISH_COUNT') + " >" + v['FINISH_COUNT'] + "</span>");
                arrHtml.push("</td>");
                /*
                arrHtml.push("<td colno='FAI_NUM' class='datagrid-cell " + ms.tdClass(formId, 'FAI_NUM') + "' style='width:110px;text-align:right;" + ms.tdStyle(formId, 'FAI_NUM') + "' " + ms.tdEvent(formId, 'FAI_NUM') + ">")
                arrHtml.push("<span colno='FAI_NUM' class='" + ms.uiClass(formId, 'FAI_NUM') + "' style='" + ms.uiStyle(formId, 'FAI_NUM') + "' " + ms.uiEvent(formId, 'FAI_NUM') + " >" + v['FAI_NUM'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FQC_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'FQC_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'FQC_COUNT') + "' " + ms.tdEvent(formId, 'FQC_COUNT') + ">")
                arrHtml.push("<span colno='FQC_COUNT' class='" + ms.uiClass(formId, 'FQC_COUNT') + "' style='" + ms.uiStyle(formId, 'FQC_COUNT') + "' " + ms.uiEvent(formId, 'FQC_COUNT') + " >" + v['FQC_COUNT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FINISH_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'FINISH_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'FINISH_COUNT') + "' " + ms.tdEvent(formId, 'FINISH_COUNT') + ">")
                arrHtml.push("<span colno='FINISH_COUNT' class='" + ms.uiClass(formId, 'FINISH_COUNT') + "' style='" + ms.uiStyle(formId, 'FINISH_COUNT') + "' " + ms.uiEvent(formId, 'FINISH_COUNT') + " >" + v['FINISH_COUNT'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROLEPSIS_START_DATE' class='datagrid-cell " + ms.tdClass(formId, 'PROLEPSIS_START_DATE') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'PROLEPSIS_START_DATE') + "' " + ms.tdEvent(formId, 'PROLEPSIS_START_DATE') + ">")
                arrHtml.push("<span colno='PROLEPSIS_START_DATE' class='" + ms.uiClass(formId, 'PROLEPSIS_START_DATE') + "' style='" + ms.uiStyle(formId, 'PROLEPSIS_START_DATE') + "' " + ms.uiEvent(formId, 'PROLEPSIS_START_DATE') + " >" + v['PROLEPSIS_START_DATE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROLEPSIS_END_DATE' class='datagrid-cell " + ms.tdClass(formId, 'PROLEPSIS_END_DATE') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'PROLEPSIS_END_DATE') + "' " + ms.tdEvent(formId, 'PROLEPSIS_END_DATE') + ">")
                arrHtml.push("<span colno='PROLEPSIS_END_DATE' class='" + ms.uiClass(formId, 'PROLEPSIS_END_DATE') + "' style='" + ms.uiStyle(formId, 'PROLEPSIS_END_DATE') + "' " + ms.uiEvent(formId, 'PROLEPSIS_END_DATE') + " >" + v['PROLEPSIS_END_DATE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CUST_CODE' class='datagrid-cell " + ms.tdClass(formId, 'CUST_CODE') + "' style='width:150px;" + ms.tdStyle(formId, 'CUST_CODE') + "' " + ms.tdEvent(formId, 'CUST_CODE') + ">")
                arrHtml.push("<span colno='CUST_CODE' class='" + ms.uiClass(formId, 'CUST_CODE') + "' style='" + ms.uiStyle(formId, 'CUST_CODE') + "' " + ms.uiEvent(formId, 'CUST_CODE') + " title='" + v['CUST_CODE'] + "' >" + v['CUST_CODE'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DESTROY_NO' class='datagrid-cell " + ms.tdClass(formId, 'DESTROY_NO') + "' style='width:150px;" + ms.tdStyle(formId, 'DESTROY_NO') + "' " + ms.tdEvent(formId, 'DESTROY_NO') + ">")
                arrHtml.push("<span colno='DESTROY_NO' class='" + ms.uiClass(formId, 'DESTROY_NO') + "' style='" + ms.uiStyle(formId, 'DESTROY_NO') + "' " + ms.uiEvent(formId, 'DESTROY_NO') + " >" + v['DESTROY_NO'] + "</span>")
                arrHtml.push("</td>");
                */
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell " + ms.tdClass(formId, 'CREATE_USER') + "' style='width:90px;text-align:center;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell " + ms.tdClass(formId, 'CREATE_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell " + ms.tdClass(formId, 'EDIT_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " >" + v['EDIT_TIME'] + "</span>");
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
    if(formId=='e8615feea3564a5db39792538a2cd754'){<%--VOID-产品包装-cjx当日待处理表单--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                if ($("#" + formId).find(".left-datagrid-title-ajax").length > 0) {
                    arrLeftHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                    arrLeftHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                    arrLeftHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrLeftHtml.push("</td>");
                } else {
                    arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                    arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrHtml.push("</td>");
                }
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH" + ms.tdClass(formId, 'DATA_AUTH') + "' style='width:200px;text-align:center;" + ms.tdStyle(formId, 'DATA_AUTH') + "' " + ms.tdEvent(formId, 'DATA_AUTH') + ">");
                arrHtml.push("<span colno='DATA_AUTH' class='" + ms.uiClass(formId, 'DATA_AUTH') + "' style='" + ms.uiStyle(formId, 'DATA_AUTH') + "' " + ms.uiEvent(formId, 'DATA_AUTH') + " title='" + v['DATA_AUTH'] + "' >" + v['DATA_AUTH'] + "</span>");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v['ID'] + "' value='" + v['DATA_AUTH_ID'] + "' /> ");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='width:150px;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + v['PROJECT_ID'] + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("<input type='hidden' id='PROJECT_OFONESELF" + v.ID + "' name='PROJECT_OFONESELF' value='" + uiRaw[i].PROJECT_OFONESELF + "' /></td>");

                arrHtml.push("<td colno='PROJECT_STATUS' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='PROJECT_STATUS'  class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " >" + v['PROJECT_STATUS'] + "</span>");
                arrHtml.push("<input type='hidden' id='PROJECT_STATUS_" + v.ID + "' value='" + uiRaw[i].PROJECT_STATUS + "' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='IS_REL' class='datagrid-cell " + ms.tdClass(formId, 'IS_REL') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'IS_REL') + "' " + ms.tdEvent(formId, 'IS_REL') + ">");
                arrHtml.push("<span colno='IS_REL'  class='" + ms.uiClass(formId, 'IS_REL') + "' style='" + ms.uiStyle(formId, 'IS_REL') + "' " + ms.uiEvent(formId, 'IS_REL') + " >" + v['IS_REL'] + "</span>");
                //arrHtml.push("<input type='hidden' id='IS_REL" + v.ID + "' value='" + uiRaw[i].IS_REL + "' />");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL'  class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' onclick='itemJump1(\"" + v['PRODUCT_MATERIAL'] + "\")' style='display: inline;border-bottom: 1px solid #004098;' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + v['PRODUCT_MATERIAL'] + "' >" + v['PRODUCT_MATERIAL'] + "</span>");
                arrHtml.push("<input type='hidden' id='PRODUCT_CONFIGURE_" + v.ID + "' value='" + uiRaw[i].PRODUCT_CONFIGURE + "' /></td>");
                arrHtml.push("<td colno='PRODUCT_NAME' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + v['PRODUCT_NAME'] + "' >" + v['PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_STANDARD') + "' style='width:150px;" + ms.tdStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.tdEvent(formId, 'PRODUCT_STANDARD') + ">");
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='" + ms.uiClass(formId, 'PRODUCT_STANDARD') + "' style='" + ms.uiStyle(formId, 'PRODUCT_STANDARD') + "' " + ms.uiEvent(formId, 'PRODUCT_STANDARD') + " title='" + v['PRODUCT_STANDARD'] + "' >" + v['PRODUCT_STANDARD'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='width:70px;text-align:right;" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " >" + v['PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell " + ms.tdClass(formId, 'CREATE_USER') + "' style='width:90px;text-align:center;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell " + ms.tdClass(formId, 'CREATE_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell " + ms.tdClass(formId, 'EDIT_TIME') + "' style='width:140px;text-align:center;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " >" + v['EDIT_TIME'] + "</span>");
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
