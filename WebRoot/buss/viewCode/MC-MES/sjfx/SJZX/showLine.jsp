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
		<dict:lang value="showLine" />
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
		<bu:header formId ="f8f38593803b49eda68064fc7a5b0169"/>

    
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
		<bu:func viewId="3a69e87a05d845ab954543a5885d0e67" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="3a69e87a05d845ab954543a5885d0e67" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagef8f38593803b49eda68064fc7a5b0169" id="formPagef8f38593803b49eda68064fc7a5b0169" value="${formPagef8f38593803b49eda68064fc7a5b0169}"/>
		<input type="hidden" name="formId" id="formId1" value='f8f38593803b49eda68064fc7a5b0169'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='c3cb120a7bb649e89bfeac8963810534'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='1e386669daf84b4c8c5cd1e7a15e700f'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="f8f38593803b49eda68064fc7a5b0169">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf8f38593803b49eda68064fc7a5b0169" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerf8f38593803b49eda68064fc7a5b0169">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef8f38593803b49eda68064fc7a5b0169">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="f8f38593803b49eda68064fc7a5b0169" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_f8f38593803b49eda68064fc7a5b0169" onclick="_selectAjaxTableAllData(this,'f8f38593803b49eda68064fc7a5b0169')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_WPI_PCB_SN" class="datagrid-cell"><bu:uitn colNo="WPI_PCB_SN" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_SPLIT_GROUP_ID" class="datagrid-cell"><bu:uitn colNo="SPLIT_GROUP_ID" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_ITEM_CODE" class="datagrid-cell"><bu:uitn colNo="WPI_ITEM_CODE" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_ITEM_NAME" class="datagrid-cell"><bu:uitn colNo="WPI_ITEM_NAME" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_ITEM_SPEC" class="datagrid-cell"><bu:uitn colNo="WPI_ITEM_SPEC" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_ITEM_COUNT" class="datagrid-cell"><bu:uitn colNo="WPI_ITEM_COUNT" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_ITEM_SUPPLIERS" class="datagrid-cell"><bu:uitn colNo="WPI_ITEM_SUPPLIERS" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_MO_NUMBER" class="datagrid-cell"><bu:uitn colNo="WPI_MO_NUMBER" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_LOT_NUMBER" class="datagrid-cell"><bu:uitn colNo="WPI_LOT_NUMBER" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_ITEM_MARK_CODE" class="datagrid-cell"><bu:uitn colNo="WPI_ITEM_MARK_CODE" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_TRACE_FLAG" class="datagrid-cell"><bu:uitn colNo="WPI_TRACE_FLAG" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_EMP" class="datagrid-cell"><bu:uitn colNo="WPI_EMP" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
			<td name="noprintset_WPI_TIME" class="datagrid-cell"><bu:uitn colNo="WPI_TIME" formId="f8f38593803b49eda68064fc7a5b0169" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivf8f38593803b49eda68064fc7a5b0169" onscroll="ajaxTableScroll(this,'f8f38593803b49eda68064fc7a5b0169')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxf8f38593803b49eda68064fc7a5b0169">
		<tbody id="tbody_f8f38593803b49eda68064fc7a5b0169" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagef8f38593803b49eda68064fc7a5b0169==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=f8f38593803b49eda68064fc7a5b0169&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('f8f38593803b49eda68064fc7a5b0169','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>PCB SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_PCB_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_PCB_SN" value="" title_name="PCB SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?产品组别ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SPLIT_GROUP_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SPLIT_GROUP_ID" value="" title_name="?产品组别ID" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_ITEM_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_ITEM_CODE" value="" title_name="物料料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>品名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_ITEM_NAME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_ITEM_NAME" value="" title_name="品名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料规格</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_ITEM_SPEC" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_ITEM_SPEC" value="" title_name="物料规格" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_ITEM_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_ITEM_COUNT" value="" title_name="数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>供应商</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_ITEM_SUPPLIERS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_ITEM_SUPPLIERS" value="" title_name="供应商" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>制令单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_MO_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_MO_NUMBER" value="" title_name="制令单" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>批次</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_LOT_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_LOT_NUMBER" value="" title_name="批次" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>标识码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_ITEM_MARK_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_ITEM_MARK_CODE" value="" title_name="标识码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>追溯标识</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_TRACE_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_TRACE_FLAG" value="" title_name="追溯标识" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业员</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_EMP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_EMP" value="" title_name="作业员" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WPI_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WPI_TIME" value="" title_name="作业时间" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" name="formPage1e386669daf84b4c8c5cd1e7a15e700f" id="formPage1e386669daf84b4c8c5cd1e7a15e700f" value="${formPage1e386669daf84b4c8c5cd1e7a15e700f}"/>
		<input type="hidden" name="formId" id="formId2" value='1e386669daf84b4c8c5cd1e7a15e700f'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="1e386669daf84b4c8c5cd1e7a15e700f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax1e386669daf84b4c8c5cd1e7a15e700f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner1e386669daf84b4c8c5cd1e7a15e700f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable1e386669daf84b4c8c5cd1e7a15e700f">
		<s:set name="_$type" value="'view'" />
		<tbody class="isChildsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="1e386669daf84b4c8c5cd1e7a15e700f" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_1e386669daf84b4c8c5cd1e7a15e700f" onclick="_selectAjaxTableAllData(this,'1e386669daf84b4c8c5cd1e7a15e700f')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_OLD_SN" class="datagrid-cell"><bu:uitn colNo="OLD_SN" formId="1e386669daf84b4c8c5cd1e7a15e700f" /></td>
			<td name="noprintset_SPLIT_GROUP_ID" class="datagrid-cell"><bu:uitn colNo="SPLIT_GROUP_ID" formId="1e386669daf84b4c8c5cd1e7a15e700f" /></td>
			<td name="noprintset_MO_NUMBER" class="datagrid-cell"><bu:uitn colNo="MO_NUMBER" formId="1e386669daf84b4c8c5cd1e7a15e700f" /></td>
			<td name="noprintset_LINK_NUM" class="datagrid-cell"><bu:uitn colNo="LINK_NUM" formId="1e386669daf84b4c8c5cd1e7a15e700f" /></td>
			<td name="noprintset_SPLIT_FLAG" class="datagrid-cell"><bu:uitn colNo="SPLIT_FLAG" formId="1e386669daf84b4c8c5cd1e7a15e700f" /></td>
			<td name="noprintset_SPLIT_EMP" class="datagrid-cell"><bu:uitn colNo="SPLIT_EMP" formId="1e386669daf84b4c8c5cd1e7a15e700f" /></td>
			<td name="noprintset_SPLIT_TIME" class="datagrid-cell"><bu:uitn colNo="SPLIT_TIME" formId="1e386669daf84b4c8c5cd1e7a15e700f" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv1e386669daf84b4c8c5cd1e7a15e700f" onscroll="ajaxTableScroll(this,'1e386669daf84b4c8c5cd1e7a15e700f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax1e386669daf84b4c8c5cd1e7a15e700f">
		<tbody id="tbody_1e386669daf84b4c8c5cd1e7a15e700f" class="isChilds">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage1e386669daf84b4c8c5cd1e7a15e700f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=1e386669daf84b4c8c5cd1e7a15e700f&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('1e386669daf84b4c8c5cd1e7a15e700f','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>PCBA SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OLD_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OLD_SN" value="" title_name="PCBA SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>?产品组别ID</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SPLIT_GROUP_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SPLIT_GROUP_ID" value="" title_name="?产品组别ID" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>制令单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MO_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MO_NUMBER" value="" title_name="制令单" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="LINK_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="LINK_NUM" value="" title_name="数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>分板标识</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SPLIT_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SPLIT_FLAG" value="" title_name="分板标识" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业员</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SPLIT_EMP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SPLIT_EMP" value="" title_name="作业员" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="SPLIT_TIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="SPLIT_TIME" value="" title_name="作业时间" />px
 </td>
 </tr>
 </table>
 </div>
 </div>
		<input type="hidden" id="relColVals" name="relColVals" value='SPLIT_GROUP_ID'/>
		<input type="hidden" name="tableCount" id="tableCount" value='2' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3a69e87a05d845ab954543a5885d0e67" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3a69e87a05d845ab954543a5885d0e67" />
    
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
    if(formId=='f8f38593803b49eda68064fc7a5b0169'){<%--FM-PCB关联--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_PCB_SN' name='noprintset_WPI_PCB_SN' class='datagrid-cell "+ms.tdClass(formId, 'WPI_PCB_SN')+"' style='"+ms.tdStyle(formId, 'WPI_PCB_SN')+"' "+ms.tdEvent(formId, 'WPI_PCB_SN')+">")
            arrHtml.push("<span colno='WPI_PCB_SN' class='"+ms.uiClass(formId, 'WPI_PCB_SN')+"' style='"+ms.uiStyle(formId, 'WPI_PCB_SN')+"' "+ms.uiEvent(formId, 'WPI_PCB_SN')+" title='"+ms.titleAttr(formId,'WPI_PCB_SN','IS_TITLE_ATTR',v)+"' >"+v['WPI_PCB_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_GROUP_ID' name='noprintset_SPLIT_GROUP_ID' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.tdStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.tdEvent(formId, 'SPLIT_GROUP_ID')+">")
            arrHtml.push("<span colno='SPLIT_GROUP_ID' class='"+ms.uiClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.uiStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.uiEvent(formId, 'SPLIT_GROUP_ID')+" title='"+ms.titleAttr(formId,'SPLIT_GROUP_ID','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_GROUP_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_CODE' name='noprintset_WPI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WPI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WPI_ITEM_CODE' class='"+ms.uiClass(formId, 'WPI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WPI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WPI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_NAME' name='noprintset_WPI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WPI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WPI_ITEM_NAME' class='"+ms.uiClass(formId, 'WPI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WPI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WPI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_SPEC' name='noprintset_WPI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WPI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WPI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WPI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WPI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WPI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_COUNT' name='noprintset_WPI_ITEM_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_COUNT')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_COUNT')+"' "+ms.tdEvent(formId, 'WPI_ITEM_COUNT')+">")
            arrHtml.push("<span colno='WPI_ITEM_COUNT' class='"+ms.uiClass(formId, 'WPI_ITEM_COUNT')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_COUNT')+"' "+ms.uiEvent(formId, 'WPI_ITEM_COUNT')+" title='"+ms.titleAttr(formId,'WPI_ITEM_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_SUPPLIERS' name='noprintset_WPI_ITEM_SUPPLIERS' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_SUPPLIERS')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_SUPPLIERS')+"' "+ms.tdEvent(formId, 'WPI_ITEM_SUPPLIERS')+">")
            arrHtml.push("<span colno='WPI_ITEM_SUPPLIERS' class='"+ms.uiClass(formId, 'WPI_ITEM_SUPPLIERS')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_SUPPLIERS')+"' "+ms.uiEvent(formId, 'WPI_ITEM_SUPPLIERS')+" title='"+ms.titleAttr(formId,'WPI_ITEM_SUPPLIERS','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_SUPPLIERS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_MO_NUMBER' name='noprintset_WPI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WPI_MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'WPI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WPI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WPI_MO_NUMBER' class='"+ms.uiClass(formId, 'WPI_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WPI_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WPI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WPI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WPI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_LOT_NUMBER' name='noprintset_WPI_LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WPI_LOT_NUMBER')+"' style='"+ms.tdStyle(formId, 'WPI_LOT_NUMBER')+"' "+ms.tdEvent(formId, 'WPI_LOT_NUMBER')+">")
            arrHtml.push("<span colno='WPI_LOT_NUMBER' class='"+ms.uiClass(formId, 'WPI_LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'WPI_LOT_NUMBER')+"' "+ms.uiEvent(formId, 'WPI_LOT_NUMBER')+" title='"+ms.titleAttr(formId,'WPI_LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WPI_LOT_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_MARK_CODE' name='noprintset_WPI_ITEM_MARK_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_MARK_CODE')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_MARK_CODE')+"' "+ms.tdEvent(formId, 'WPI_ITEM_MARK_CODE')+">")
            arrHtml.push("<span colno='WPI_ITEM_MARK_CODE' class='"+ms.uiClass(formId, 'WPI_ITEM_MARK_CODE')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_MARK_CODE')+"' "+ms.uiEvent(formId, 'WPI_ITEM_MARK_CODE')+" title='"+ms.titleAttr(formId,'WPI_ITEM_MARK_CODE','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_MARK_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_TRACE_FLAG' name='noprintset_WPI_TRACE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WPI_TRACE_FLAG')+"' style='"+ms.tdStyle(formId, 'WPI_TRACE_FLAG')+"' "+ms.tdEvent(formId, 'WPI_TRACE_FLAG')+">")
            arrHtml.push("<span colno='WPI_TRACE_FLAG' class='"+ms.uiClass(formId, 'WPI_TRACE_FLAG')+"' style='"+ms.uiStyle(formId, 'WPI_TRACE_FLAG')+"' "+ms.uiEvent(formId, 'WPI_TRACE_FLAG')+" title='"+ms.titleAttr(formId,'WPI_TRACE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WPI_TRACE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_EMP' name='noprintset_WPI_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WPI_EMP')+"' style='"+ms.tdStyle(formId, 'WPI_EMP')+"' "+ms.tdEvent(formId, 'WPI_EMP')+">")
            arrHtml.push("<span colno='WPI_EMP' class='"+ms.uiClass(formId, 'WPI_EMP')+"' style='"+ms.uiStyle(formId, 'WPI_EMP')+"' "+ms.uiEvent(formId, 'WPI_EMP')+" title='"+ms.titleAttr(formId,'WPI_EMP','IS_TITLE_ATTR',v)+"' >"+v['WPI_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_TIME' name='noprintset_WPI_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WPI_TIME')+"' style='"+ms.tdStyle(formId, 'WPI_TIME')+"' "+ms.tdEvent(formId, 'WPI_TIME')+">")
            arrHtml.push("<span colno='WPI_TIME' class='"+ms.uiClass(formId, 'WPI_TIME')+"' style='"+ms.uiStyle(formId, 'WPI_TIME')+"' "+ms.uiEvent(formId, 'WPI_TIME')+" title='"+ms.titleAttr(formId,'WPI_TIME','IS_TITLE_ATTR',v)+"' >"+v['WPI_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_"+formId).html(arrHtml.join(""));
    }
    if(formId=='1e386669daf84b4c8c5cd1e7a15e700f'){<%--FM-产品关联信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OLD_SN' name='noprintset_OLD_SN' class='datagrid-cell "+ms.tdClass(formId, 'OLD_SN')+"' style='"+ms.tdStyle(formId, 'OLD_SN')+"' "+ms.tdEvent(formId, 'OLD_SN')+">")
            arrHtml.push("<span colno='OLD_SN' class='"+ms.uiClass(formId, 'OLD_SN')+"' style='"+ms.uiStyle(formId, 'OLD_SN')+"' "+ms.uiEvent(formId, 'OLD_SN')+" title='"+ms.titleAttr(formId,'OLD_SN','IS_TITLE_ATTR',v)+"' >"+v['OLD_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_GROUP_ID' name='noprintset_SPLIT_GROUP_ID' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.tdStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.tdEvent(formId, 'SPLIT_GROUP_ID')+">")
            arrHtml.push("<span colno='SPLIT_GROUP_ID' class='"+ms.uiClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.uiStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.uiEvent(formId, 'SPLIT_GROUP_ID')+" title='"+ms.titleAttr(formId,'SPLIT_GROUP_ID','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_GROUP_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' name='noprintset_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'MO_NUMBER')+"' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LINK_NUM' name='noprintset_LINK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'LINK_NUM')+"' style='"+ms.tdStyle(formId, 'LINK_NUM')+"' "+ms.tdEvent(formId, 'LINK_NUM')+">")
            arrHtml.push("<span colno='LINK_NUM' class='"+ms.uiClass(formId, 'LINK_NUM')+"' style='"+ms.uiStyle(formId, 'LINK_NUM')+"' "+ms.uiEvent(formId, 'LINK_NUM')+" title='"+ms.titleAttr(formId,'LINK_NUM','IS_TITLE_ATTR',v)+"' >"+v['LINK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_FLAG' name='noprintset_SPLIT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_FLAG')+"' style='"+ms.tdStyle(formId, 'SPLIT_FLAG')+"' "+ms.tdEvent(formId, 'SPLIT_FLAG')+">")
            arrHtml.push("<span colno='SPLIT_FLAG' class='"+ms.uiClass(formId, 'SPLIT_FLAG')+"' style='"+ms.uiStyle(formId, 'SPLIT_FLAG')+"' "+ms.uiEvent(formId, 'SPLIT_FLAG')+" title='"+ms.titleAttr(formId,'SPLIT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_EMP' name='noprintset_SPLIT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_EMP')+"' style='"+ms.tdStyle(formId, 'SPLIT_EMP')+"' "+ms.tdEvent(formId, 'SPLIT_EMP')+">")
            arrHtml.push("<span colno='SPLIT_EMP' class='"+ms.uiClass(formId, 'SPLIT_EMP')+"' style='"+ms.uiStyle(formId, 'SPLIT_EMP')+"' "+ms.uiEvent(formId, 'SPLIT_EMP')+" title='"+ms.titleAttr(formId,'SPLIT_EMP','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_TIME' name='noprintset_SPLIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_TIME')+"' style='"+ms.tdStyle(formId, 'SPLIT_TIME')+"' "+ms.tdEvent(formId, 'SPLIT_TIME')+">")
            arrHtml.push("<span colno='SPLIT_TIME' class='"+ms.uiClass(formId, 'SPLIT_TIME')+"' style='"+ms.uiStyle(formId, 'SPLIT_TIME')+"' "+ms.uiEvent(formId, 'SPLIT_TIME')+" title='"+ms.titleAttr(formId,'SPLIT_TIME','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_TIME']+"</span>")
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
    if(formId=='f8f38593803b49eda68064fc7a5b0169'){<%--FM-PCB关联--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='WPI_PCB_SN' name='noprintset_WPI_PCB_SN' class='datagrid-cell "+ms.tdClass(formId, 'WPI_PCB_SN')+"' style='"+ms.tdStyle(formId, 'WPI_PCB_SN')+"' "+ms.tdEvent(formId, 'WPI_PCB_SN')+">")
            arrHtml.push("<span colno='WPI_PCB_SN' class='"+ms.uiClass(formId, 'WPI_PCB_SN')+"' style='"+ms.uiStyle(formId, 'WPI_PCB_SN')+"' "+ms.uiEvent(formId, 'WPI_PCB_SN')+" title='"+ms.titleAttr(formId,'WPI_PCB_SN','IS_TITLE_ATTR',v)+"' >"+v['WPI_PCB_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_GROUP_ID' name='noprintset_SPLIT_GROUP_ID' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.tdStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.tdEvent(formId, 'SPLIT_GROUP_ID')+">")
            arrHtml.push("<span colno='SPLIT_GROUP_ID' class='"+ms.uiClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.uiStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.uiEvent(formId, 'SPLIT_GROUP_ID')+" title='"+ms.titleAttr(formId,'SPLIT_GROUP_ID','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_GROUP_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_CODE' name='noprintset_WPI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WPI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WPI_ITEM_CODE' class='"+ms.uiClass(formId, 'WPI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WPI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WPI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_NAME' name='noprintset_WPI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_NAME')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'WPI_ITEM_NAME')+">")
            arrHtml.push("<span colno='WPI_ITEM_NAME' class='"+ms.uiClass(formId, 'WPI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'WPI_ITEM_NAME')+" title='"+ms.titleAttr(formId,'WPI_ITEM_NAME','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_NAME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_SPEC' name='noprintset_WPI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_SPEC')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'WPI_ITEM_SPEC')+">")
            arrHtml.push("<span colno='WPI_ITEM_SPEC' class='"+ms.uiClass(formId, 'WPI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'WPI_ITEM_SPEC')+" title='"+ms.titleAttr(formId,'WPI_ITEM_SPEC','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_SPEC']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_COUNT' name='noprintset_WPI_ITEM_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_COUNT')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_COUNT')+"' "+ms.tdEvent(formId, 'WPI_ITEM_COUNT')+">")
            arrHtml.push("<span colno='WPI_ITEM_COUNT' class='"+ms.uiClass(formId, 'WPI_ITEM_COUNT')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_COUNT')+"' "+ms.uiEvent(formId, 'WPI_ITEM_COUNT')+" title='"+ms.titleAttr(formId,'WPI_ITEM_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_SUPPLIERS' name='noprintset_WPI_ITEM_SUPPLIERS' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_SUPPLIERS')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_SUPPLIERS')+"' "+ms.tdEvent(formId, 'WPI_ITEM_SUPPLIERS')+">")
            arrHtml.push("<span colno='WPI_ITEM_SUPPLIERS' class='"+ms.uiClass(formId, 'WPI_ITEM_SUPPLIERS')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_SUPPLIERS')+"' "+ms.uiEvent(formId, 'WPI_ITEM_SUPPLIERS')+" title='"+ms.titleAttr(formId,'WPI_ITEM_SUPPLIERS','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_SUPPLIERS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_MO_NUMBER' name='noprintset_WPI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WPI_MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'WPI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WPI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WPI_MO_NUMBER' class='"+ms.uiClass(formId, 'WPI_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WPI_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WPI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WPI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WPI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_LOT_NUMBER' name='noprintset_WPI_LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WPI_LOT_NUMBER')+"' style='"+ms.tdStyle(formId, 'WPI_LOT_NUMBER')+"' "+ms.tdEvent(formId, 'WPI_LOT_NUMBER')+">")
            arrHtml.push("<span colno='WPI_LOT_NUMBER' class='"+ms.uiClass(formId, 'WPI_LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'WPI_LOT_NUMBER')+"' "+ms.uiEvent(formId, 'WPI_LOT_NUMBER')+" title='"+ms.titleAttr(formId,'WPI_LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WPI_LOT_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_ITEM_MARK_CODE' name='noprintset_WPI_ITEM_MARK_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WPI_ITEM_MARK_CODE')+"' style='"+ms.tdStyle(formId, 'WPI_ITEM_MARK_CODE')+"' "+ms.tdEvent(formId, 'WPI_ITEM_MARK_CODE')+">")
            arrHtml.push("<span colno='WPI_ITEM_MARK_CODE' class='"+ms.uiClass(formId, 'WPI_ITEM_MARK_CODE')+"' style='"+ms.uiStyle(formId, 'WPI_ITEM_MARK_CODE')+"' "+ms.uiEvent(formId, 'WPI_ITEM_MARK_CODE')+" title='"+ms.titleAttr(formId,'WPI_ITEM_MARK_CODE','IS_TITLE_ATTR',v)+"' >"+v['WPI_ITEM_MARK_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_TRACE_FLAG' name='noprintset_WPI_TRACE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WPI_TRACE_FLAG')+"' style='"+ms.tdStyle(formId, 'WPI_TRACE_FLAG')+"' "+ms.tdEvent(formId, 'WPI_TRACE_FLAG')+">")
            arrHtml.push("<span colno='WPI_TRACE_FLAG' class='"+ms.uiClass(formId, 'WPI_TRACE_FLAG')+"' style='"+ms.uiStyle(formId, 'WPI_TRACE_FLAG')+"' "+ms.uiEvent(formId, 'WPI_TRACE_FLAG')+" title='"+ms.titleAttr(formId,'WPI_TRACE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WPI_TRACE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_EMP' name='noprintset_WPI_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WPI_EMP')+"' style='"+ms.tdStyle(formId, 'WPI_EMP')+"' "+ms.tdEvent(formId, 'WPI_EMP')+">")
            arrHtml.push("<span colno='WPI_EMP' class='"+ms.uiClass(formId, 'WPI_EMP')+"' style='"+ms.uiStyle(formId, 'WPI_EMP')+"' "+ms.uiEvent(formId, 'WPI_EMP')+" title='"+ms.titleAttr(formId,'WPI_EMP','IS_TITLE_ATTR',v)+"' >"+v['WPI_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WPI_TIME' name='noprintset_WPI_TIME' class='datagrid-cell "+ms.tdClass(formId, 'WPI_TIME')+"' style='"+ms.tdStyle(formId, 'WPI_TIME')+"' "+ms.tdEvent(formId, 'WPI_TIME')+">")
            arrHtml.push("<span colno='WPI_TIME' class='"+ms.uiClass(formId, 'WPI_TIME')+"' style='"+ms.uiStyle(formId, 'WPI_TIME')+"' "+ms.uiEvent(formId, 'WPI_TIME')+" title='"+ms.titleAttr(formId,'WPI_TIME','IS_TITLE_ATTR',v)+"' >"+v['WPI_TIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("</tr>")
        });
        if($("#leftTableDiv"+formId).length>0){
            $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
        }
        setCrossWiseScroll(formId,arrHtml);
        $("#tbody_print_"+formId).html(arrHtml.join(""));
    }
    if(formId=='1e386669daf84b4c8c5cd1e7a15e700f'){<%--FM-产品关联信息--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='OLD_SN' name='noprintset_OLD_SN' class='datagrid-cell "+ms.tdClass(formId, 'OLD_SN')+"' style='"+ms.tdStyle(formId, 'OLD_SN')+"' "+ms.tdEvent(formId, 'OLD_SN')+">")
            arrHtml.push("<span colno='OLD_SN' class='"+ms.uiClass(formId, 'OLD_SN')+"' style='"+ms.uiStyle(formId, 'OLD_SN')+"' "+ms.uiEvent(formId, 'OLD_SN')+" title='"+ms.titleAttr(formId,'OLD_SN','IS_TITLE_ATTR',v)+"' >"+v['OLD_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_GROUP_ID' name='noprintset_SPLIT_GROUP_ID' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.tdStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.tdEvent(formId, 'SPLIT_GROUP_ID')+">")
            arrHtml.push("<span colno='SPLIT_GROUP_ID' class='"+ms.uiClass(formId, 'SPLIT_GROUP_ID')+"' style='"+ms.uiStyle(formId, 'SPLIT_GROUP_ID')+"' "+ms.uiEvent(formId, 'SPLIT_GROUP_ID')+" title='"+ms.titleAttr(formId,'SPLIT_GROUP_ID','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_GROUP_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MO_NUMBER' name='noprintset_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'MO_NUMBER')+"' "+ms.tdEvent(formId, 'MO_NUMBER')+">")
            arrHtml.push("<span colno='MO_NUMBER' class='"+ms.uiClass(formId, 'MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'MO_NUMBER')+"' "+ms.uiEvent(formId, 'MO_NUMBER')+" title='"+ms.titleAttr(formId,'MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='LINK_NUM' name='noprintset_LINK_NUM' class='datagrid-cell "+ms.tdClass(formId, 'LINK_NUM')+"' style='"+ms.tdStyle(formId, 'LINK_NUM')+"' "+ms.tdEvent(formId, 'LINK_NUM')+">")
            arrHtml.push("<span colno='LINK_NUM' class='"+ms.uiClass(formId, 'LINK_NUM')+"' style='"+ms.uiStyle(formId, 'LINK_NUM')+"' "+ms.uiEvent(formId, 'LINK_NUM')+" title='"+ms.titleAttr(formId,'LINK_NUM','IS_TITLE_ATTR',v)+"' >"+v['LINK_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_FLAG' name='noprintset_SPLIT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_FLAG')+"' style='"+ms.tdStyle(formId, 'SPLIT_FLAG')+"' "+ms.tdEvent(formId, 'SPLIT_FLAG')+">")
            arrHtml.push("<span colno='SPLIT_FLAG' class='"+ms.uiClass(formId, 'SPLIT_FLAG')+"' style='"+ms.uiStyle(formId, 'SPLIT_FLAG')+"' "+ms.uiEvent(formId, 'SPLIT_FLAG')+" title='"+ms.titleAttr(formId,'SPLIT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_EMP' name='noprintset_SPLIT_EMP' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_EMP')+"' style='"+ms.tdStyle(formId, 'SPLIT_EMP')+"' "+ms.tdEvent(formId, 'SPLIT_EMP')+">")
            arrHtml.push("<span colno='SPLIT_EMP' class='"+ms.uiClass(formId, 'SPLIT_EMP')+"' style='"+ms.uiStyle(formId, 'SPLIT_EMP')+"' "+ms.uiEvent(formId, 'SPLIT_EMP')+" title='"+ms.titleAttr(formId,'SPLIT_EMP','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SPLIT_TIME' name='noprintset_SPLIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'SPLIT_TIME')+"' style='"+ms.tdStyle(formId, 'SPLIT_TIME')+"' "+ms.tdEvent(formId, 'SPLIT_TIME')+">")
            arrHtml.push("<span colno='SPLIT_TIME' class='"+ms.uiClass(formId, 'SPLIT_TIME')+"' style='"+ms.uiStyle(formId, 'SPLIT_TIME')+"' "+ms.uiEvent(formId, 'SPLIT_TIME')+" title='"+ms.titleAttr(formId,'SPLIT_TIME','IS_TITLE_ATTR',v)+"' >"+v['SPLIT_TIME']+"</span>")
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
