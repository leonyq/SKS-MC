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
		<dict:lang value="testView" />
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
		<bu:header formId ="2bf705be618c47afafb6a33e0d0c9376"/>

    
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
		<bu:func viewId="b252caa1f65647d4a78651826a2904d6" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="b252caa1f65647d4a78651826a2904d6" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage2bf705be618c47afafb6a33e0d0c9376" id="formPage2bf705be618c47afafb6a33e0d0c9376" value="${formPage2bf705be618c47afafb6a33e0d0c9376}"/>
		<input type="hidden" name="formId" id="formId1" value='2bf705be618c47afafb6a33e0d0c9376'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="2bf705be618c47afafb6a33e0d0c9376">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax2bf705be618c47afafb6a33e0d0c9376" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner2bf705be618c47afafb6a33e0d0c9376">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2bf705be618c47afafb6a33e0d0c9376">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="2bf705be618c47afafb6a33e0d0c9376" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_2bf705be618c47afafb6a33e0d0c9376" onclick="_selectAjaxTableAllData(this,'2bf705be618c47afafb6a33e0d0c9376')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_WSI_LOT_NO" class="datagrid-cell"><bu:uitn colNo="WSI_LOT_NO" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_ITEM_CODE" class="datagrid-cell"><bu:uitn colNo="WSI_ITEM_CODE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_MODEL_CODE" class="datagrid-cell"><bu:uitn colNo="WSI_MODEL_CODE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_LOT_NO_OLD" class="datagrid-cell"><bu:uitn colNo="WSI_LOT_NO_OLD" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_DEVICE_SN" class="datagrid-cell"><bu:uitn colNo="WSI_DEVICE_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_POINT" class="datagrid-cell"><bu:uitn colNo="WSI_POINT" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_SUPPLIERS" class="datagrid-cell"><bu:uitn colNo="WSI_SUPPLIERS" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_ITEM_CODE_OLD" class="datagrid-cell"><bu:uitn colNo="WSI_ITEM_CODE_OLD" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_EMP" class="datagrid-cell"><bu:uitn colNo="WSI_EMP" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_ITEM_COUNT" class="datagrid-cell"><bu:uitn colNo="WSI_ITEM_COUNT" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_POINT_NUM" class="datagrid-cell"><bu:uitn colNo="WSI_POINT_NUM" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_COUNT_OLD" class="datagrid-cell"><bu:uitn colNo="WSI_COUNT_OLD" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_ACTIONTYPE" class="datagrid-cell"><bu:uitn colNo="WSI_ACTIONTYPE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_PROCESS_FACE" class="datagrid-cell"><bu:uitn colNo="WSI_PROCESS_FACE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_ONLINE_FLAG" class="datagrid-cell"><bu:uitn colNo="WSI_ONLINE_FLAG" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_DEVICE_SEQ" class="datagrid-cell"><bu:uitn colNo="WSI_DEVICE_SEQ" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_CHANEL_NO" class="datagrid-cell"><bu:uitn colNo="WSI_CHANEL_NO" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_TRAY_FLAG" class="datagrid-cell"><bu:uitn colNo="WSI_TRAY_FLAG" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_REPEAT_FLAG" class="datagrid-cell"><bu:uitn colNo="WSI_REPEAT_FLAG" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_ITEM_SN_OLD" class="datagrid-cell"><bu:uitn colNo="WSI_ITEM_SN_OLD" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_WORKSTATION_SN" class="datagrid-cell"><bu:uitn colNo="WSI_WORKSTATION_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_TRUCK_NO" class="datagrid-cell"><bu:uitn colNo="WSI_TRUCK_NO" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_MO_NUMBER" class="datagrid-cell"><bu:uitn colNo="WSI_MO_NUMBER" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_AREA_ID" class="datagrid-cell"><bu:uitn colNo="WSI_AREA_ID" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_LOADTIME" class="datagrid-cell"><bu:uitn colNo="WSI_LOADTIME" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_ITEM_TYPE" class="datagrid-cell"><bu:uitn colNo="WSI_ITEM_TYPE" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_ITEM_SN" class="datagrid-cell"><bu:uitn colNo="WSI_ITEM_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_TABLE_NO" class="datagrid-cell"><bu:uitn colNo="WSI_TABLE_NO" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_LOADPOINT_SN" class="datagrid-cell"><bu:uitn colNo="WSI_LOADPOINT_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
			<td name="noprintset_WSI_FEEDER_SN" class="datagrid-cell"><bu:uitn colNo="WSI_FEEDER_SN" formId="2bf705be618c47afafb6a33e0d0c9376" /></td>
		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv2bf705be618c47afafb6a33e0d0c9376" onscroll="ajaxTableScroll(this,'2bf705be618c47afafb6a33e0d0c9376')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2bf705be618c47afafb6a33e0d0c9376">
		<tbody id="tbody_2bf705be618c47afafb6a33e0d0c9376" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage2bf705be618c47afafb6a33e0d0c9376==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=2bf705be618c47afafb6a33e0d0c9376&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('2bf705be618c47afafb6a33e0d0c9376','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>批次</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_LOT_NO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_LOT_NO" value="" title_name="批次" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_ITEM_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_ITEM_CODE" value="" title_name="料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机种代码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_MODEL_CODE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_MODEL_CODE" value="" title_name="机种代码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>前批次</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_LOT_NO_OLD" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_LOT_NO_OLD" value="" title_name="前批次" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>设备编码</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_DEVICE_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_DEVICE_SN" value="" title_name="设备编码" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>点位</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_POINT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_POINT" value="" title_name="点位" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>供应商</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_SUPPLIERS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_SUPPLIERS" value="" title_name="供应商" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>前物料料号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_ITEM_CODE_OLD" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_ITEM_CODE_OLD" value="" title_name="前物料料号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业员</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_EMP" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_EMP" value="" title_name="作业员" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_ITEM_COUNT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_ITEM_COUNT" value="" title_name="数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>点数</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_POINT_NUM" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_POINT_NUM" value="" title_name="点数" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>前数量</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_COUNT_OLD" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_COUNT_OLD" value="" title_name="前数量" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>动作类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_ACTIONTYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_ACTIONTYPE" value="" title_name="动作类型" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>加工面</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_PROCESS_FACE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_PROCESS_FACE" value="" title_name="加工面" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>在线标志</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_ONLINE_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_ONLINE_FLAG" value="" title_name="在线标志" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>机器序号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_DEVICE_SEQ" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_DEVICE_SEQ" value="" title_name="机器序号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>通道标识</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_CHANEL_NO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_CHANEL_NO" value="" title_name="通道标识" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>TRAY盘物料标志</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_TRAY_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_TRAY_FLAG" value="" title_name="TRAY盘物料标志" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>重用料标志</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_REPEAT_FLAG" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_REPEAT_FLAG" value="" title_name="重用料标志" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>前物料SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_ITEM_SN_OLD" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_ITEM_SN_OLD" value="" title_name="前物料SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>工作中心</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_WORKSTATION_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_WORKSTATION_SN" value="" title_name="工作中心" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>料车SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_TRUCK_NO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_TRUCK_NO" value="" title_name="料车SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>制令单</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_MO_NUMBER" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_MO_NUMBER" value="" title_name="制令单" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>线别</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_AREA_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_AREA_ID" value="" title_name="线别" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>作业时间</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_LOADTIME" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_LOADTIME" value="" title_name="作业时间" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料类型</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_ITEM_TYPE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_ITEM_TYPE" value="" title_name="物料类型" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>物料SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_ITEM_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_ITEM_SN" value="" title_name="物料SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>TABLE</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_TABLE_NO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_TABLE_NO" value="" title_name="TABLE" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>料站SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_LOADPOINT_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_LOADPOINT_SN" value="" title_name="料站SN" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>料枪SN</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="WSI_FEEDER_SN" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="WSI_FEEDER_SN" value="" title_name="料枪SN" />px
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
		<bu:submit viewId="b252caa1f65647d4a78651826a2904d6" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="b252caa1f65647d4a78651826a2904d6" />
    
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
    if(formId=='2bf705be618c47afafb6a33e0d0c9376'){<%--物料作业记录--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO' name='noprintset_WSI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO')+">")
            arrHtml.push("<span colno='WSI_LOT_NO' class='"+ms.uiClass(formId, 'WSI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' name='noprintset_WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MODEL_CODE' name='noprintset_WSI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WSI_MODEL_CODE')+">")
            arrHtml.push("<span colno='WSI_MODEL_CODE' class='"+ms.uiClass(formId, 'WSI_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.uiEvent(formId, 'WSI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WSI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO_OLD' name='noprintset_WSI_LOT_NO_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO_OLD')+">")
            arrHtml.push("<span colno='WSI_LOT_NO_OLD' class='"+ms.uiClass(formId, 'WSI_LOT_NO_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO_OLD')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SN' name='noprintset_WSI_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SN')+"' style='"+ms.tdStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SN')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SN' class='"+ms.uiClass(formId, 'WSI_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SN')+" title='"+ms.titleAttr(formId,'WSI_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT' name='noprintset_WSI_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT')+"' style='"+ms.tdStyle(formId, 'WSI_POINT')+"' "+ms.tdEvent(formId, 'WSI_POINT')+">")
            arrHtml.push("<span colno='WSI_POINT' class='"+ms.uiClass(formId, 'WSI_POINT')+"' style='"+ms.uiStyle(formId, 'WSI_POINT')+"' "+ms.uiEvent(formId, 'WSI_POINT')+" title='"+ms.titleAttr(formId,'WSI_POINT','IS_TITLE_ATTR',v)+"' >"+v['WSI_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUPPLIERS' name='noprintset_WSI_SUPPLIERS' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUPPLIERS')+"' style='"+ms.tdStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.tdEvent(formId, 'WSI_SUPPLIERS')+">")
            arrHtml.push("<span colno='WSI_SUPPLIERS' class='"+ms.uiClass(formId, 'WSI_SUPPLIERS')+"' style='"+ms.uiStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.uiEvent(formId, 'WSI_SUPPLIERS')+" title='"+ms.titleAttr(formId,'WSI_SUPPLIERS','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUPPLIERS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE_OLD' name='noprintset_WSI_ITEM_CODE_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE_OLD')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_EMP' name='noprintset_WSI_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WSI_EMP')+"' style='"+ms.tdStyle(formId, 'WSI_EMP')+"' "+ms.tdEvent(formId, 'WSI_EMP')+">")
            arrHtml.push("<span colno='WSI_EMP' class='"+ms.uiClass(formId, 'WSI_EMP')+"' style='"+ms.uiStyle(formId, 'WSI_EMP')+"' "+ms.uiEvent(formId, 'WSI_EMP')+" title='"+ms.titleAttr(formId,'WSI_EMP','IS_TITLE_ATTR',v)+"' >"+v['WSI_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_COUNT' name='noprintset_WSI_ITEM_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_COUNT')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.tdEvent(formId, 'WSI_ITEM_COUNT')+">")
            arrHtml.push("<span colno='WSI_ITEM_COUNT' class='"+ms.uiClass(formId, 'WSI_ITEM_COUNT')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.uiEvent(formId, 'WSI_ITEM_COUNT')+" title='"+ms.titleAttr(formId,'WSI_ITEM_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT_NUM' name='noprintset_WSI_POINT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_POINT_NUM')+"' "+ms.tdEvent(formId, 'WSI_POINT_NUM')+">")
            arrHtml.push("<span colno='WSI_POINT_NUM' class='"+ms.uiClass(formId, 'WSI_POINT_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_POINT_NUM')+"' "+ms.uiEvent(formId, 'WSI_POINT_NUM')+" title='"+ms.titleAttr(formId,'WSI_POINT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_POINT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_COUNT_OLD' name='noprintset_WSI_COUNT_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_COUNT_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.tdEvent(formId, 'WSI_COUNT_OLD')+">")
            arrHtml.push("<span colno='WSI_COUNT_OLD' class='"+ms.uiClass(formId, 'WSI_COUNT_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.uiEvent(formId, 'WSI_COUNT_OLD')+" title='"+ms.titleAttr(formId,'WSI_COUNT_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_COUNT_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ACTIONTYPE' name='noprintset_WSI_ACTIONTYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ACTIONTYPE')+"' style='"+ms.tdStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.tdEvent(formId, 'WSI_ACTIONTYPE')+">")
            arrHtml.push("<span colno='WSI_ACTIONTYPE' class='"+ms.uiClass(formId, 'WSI_ACTIONTYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.uiEvent(formId, 'WSI_ACTIONTYPE')+" title='"+ms.titleAttr(formId,'WSI_ACTIONTYPE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ACTIONTYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PROCESS_FACE' name='noprintset_WSI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WSI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WSI_PROCESS_FACE' class='"+ms.uiClass(formId, 'WSI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WSI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WSI_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WSI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ONLINE_FLAG' name='noprintset_WSI_ONLINE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ONLINE_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.tdEvent(formId, 'WSI_ONLINE_FLAG')+">")
            arrHtml.push("<span colno='WSI_ONLINE_FLAG' class='"+ms.uiClass(formId, 'WSI_ONLINE_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.uiEvent(formId, 'WSI_ONLINE_FLAG')+" title='"+ms.titleAttr(formId,'WSI_ONLINE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_ONLINE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SEQ' name='noprintset_WSI_DEVICE_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SEQ')+"' style='"+ms.tdStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SEQ')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SEQ' class='"+ms.uiClass(formId, 'WSI_DEVICE_SEQ')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SEQ')+" title='"+ms.titleAttr(formId,'WSI_DEVICE_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WSI_DEVICE_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CHANEL_NO' name='noprintset_WSI_CHANEL_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CHANEL_NO')+"' style='"+ms.tdStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.tdEvent(formId, 'WSI_CHANEL_NO')+">")
            arrHtml.push("<span colno='WSI_CHANEL_NO' class='"+ms.uiClass(formId, 'WSI_CHANEL_NO')+"' style='"+ms.uiStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.uiEvent(formId, 'WSI_CHANEL_NO')+" title='"+ms.titleAttr(formId,'WSI_CHANEL_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_CHANEL_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRAY_FLAG' name='noprintset_WSI_TRAY_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRAY_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.tdEvent(formId, 'WSI_TRAY_FLAG')+">")
            arrHtml.push("<span colno='WSI_TRAY_FLAG' class='"+ms.uiClass(formId, 'WSI_TRAY_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.uiEvent(formId, 'WSI_TRAY_FLAG')+" title='"+ms.titleAttr(formId,'WSI_TRAY_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_TRAY_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_REPEAT_FLAG' name='noprintset_WSI_REPEAT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_REPEAT_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_REPEAT_FLAG')+">")
            arrHtml.push("<span colno='WSI_REPEAT_FLAG' class='"+ms.uiClass(formId, 'WSI_REPEAT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_REPEAT_FLAG')+" title='"+ms.titleAttr(formId,'WSI_REPEAT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_REPEAT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN_OLD' name='noprintset_WSI_ITEM_SN_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_SN_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN_OLD')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_WORKSTATION_SN' name='noprintset_WSI_WORKSTATION_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_WORKSTATION_SN')+"' style='"+ms.tdStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.tdEvent(formId, 'WSI_WORKSTATION_SN')+">")
            arrHtml.push("<span colno='WSI_WORKSTATION_SN' class='"+ms.uiClass(formId, 'WSI_WORKSTATION_SN')+"' style='"+ms.uiStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.uiEvent(formId, 'WSI_WORKSTATION_SN')+" title='"+ms.titleAttr(formId,'WSI_WORKSTATION_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_WORKSTATION_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRUCK_NO' name='noprintset_WSI_TRUCK_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRUCK_NO')+"' style='"+ms.tdStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.tdEvent(formId, 'WSI_TRUCK_NO')+">")
            arrHtml.push("<span colno='WSI_TRUCK_NO' class='"+ms.uiClass(formId, 'WSI_TRUCK_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.uiEvent(formId, 'WSI_TRUCK_NO')+" title='"+ms.titleAttr(formId,'WSI_TRUCK_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_TRUCK_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MO_NUMBER' name='noprintset_WSI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WSI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WSI_MO_NUMBER' class='"+ms.uiClass(formId, 'WSI_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WSI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WSI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WSI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_AREA_ID' name='noprintset_WSI_AREA_ID' class='datagrid-cell "+ms.tdClass(formId, 'WSI_AREA_ID')+"' style='"+ms.tdStyle(formId, 'WSI_AREA_ID')+"' "+ms.tdEvent(formId, 'WSI_AREA_ID')+">")
            arrHtml.push("<span colno='WSI_AREA_ID' class='"+ms.uiClass(formId, 'WSI_AREA_ID')+"' style='"+ms.uiStyle(formId, 'WSI_AREA_ID')+"' "+ms.uiEvent(formId, 'WSI_AREA_ID')+" title='"+ms.titleAttr(formId,'WSI_AREA_ID','IS_TITLE_ATTR',v)+"' >"+v['WSI_AREA_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADTIME' name='noprintset_WSI_LOADTIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADTIME')+"' style='"+ms.tdStyle(formId, 'WSI_LOADTIME')+"' "+ms.tdEvent(formId, 'WSI_LOADTIME')+">")
            arrHtml.push("<span colno='WSI_LOADTIME' class='"+ms.uiClass(formId, 'WSI_LOADTIME')+"' style='"+ms.uiStyle(formId, 'WSI_LOADTIME')+"' "+ms.uiEvent(formId, 'WSI_LOADTIME')+" title='"+ms.titleAttr(formId,'WSI_LOADTIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOADTIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_TYPE' name='noprintset_WSI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='WSI_ITEM_TYPE' class='"+ms.uiClass(formId, 'WSI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' name='noprintset_WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TABLE_NO' name='noprintset_WSI_TABLE_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TABLE_NO')+"' style='"+ms.tdStyle(formId, 'WSI_TABLE_NO')+"' "+ms.tdEvent(formId, 'WSI_TABLE_NO')+">")
            arrHtml.push("<span colno='WSI_TABLE_NO' class='"+ms.uiClass(formId, 'WSI_TABLE_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TABLE_NO')+"' "+ms.uiEvent(formId, 'WSI_TABLE_NO')+" title='"+ms.titleAttr(formId,'WSI_TABLE_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_TABLE_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADPOINT_SN' name='noprintset_WSI_LOADPOINT_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADPOINT_SN')+"' style='"+ms.tdStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.tdEvent(formId, 'WSI_LOADPOINT_SN')+">")
            arrHtml.push("<span colno='WSI_LOADPOINT_SN' class='"+ms.uiClass(formId, 'WSI_LOADPOINT_SN')+"' style='"+ms.uiStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.uiEvent(formId, 'WSI_LOADPOINT_SN')+" title='"+ms.titleAttr(formId,'WSI_LOADPOINT_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOADPOINT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FEEDER_SN' name='noprintset_WSI_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FEEDER_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.tdEvent(formId, 'WSI_FEEDER_SN')+">")
            arrHtml.push("<span colno='WSI_FEEDER_SN' class='"+ms.uiClass(formId, 'WSI_FEEDER_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.uiEvent(formId, 'WSI_FEEDER_SN')+" title='"+ms.titleAttr(formId,'WSI_FEEDER_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FEEDER_SN']+"</span>")
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
    if(formId=='2bf705be618c47afafb6a33e0d0c9376'){<%--物料作业记录--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='WSI_LOT_NO' name='noprintset_WSI_LOT_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO')+">")
            arrHtml.push("<span colno='WSI_LOT_NO' class='"+ms.uiClass(formId, 'WSI_LOT_NO')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE' name='noprintset_WSI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MODEL_CODE' name='noprintset_WSI_MODEL_CODE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MODEL_CODE')+"' style='"+ms.tdStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.tdEvent(formId, 'WSI_MODEL_CODE')+">")
            arrHtml.push("<span colno='WSI_MODEL_CODE' class='"+ms.uiClass(formId, 'WSI_MODEL_CODE')+"' style='"+ms.uiStyle(formId, 'WSI_MODEL_CODE')+"' "+ms.uiEvent(formId, 'WSI_MODEL_CODE')+" title='"+ms.titleAttr(formId,'WSI_MODEL_CODE','IS_TITLE_ATTR',v)+"' >"+v['WSI_MODEL_CODE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOT_NO_OLD' name='noprintset_WSI_LOT_NO_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOT_NO_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.tdEvent(formId, 'WSI_LOT_NO_OLD')+">")
            arrHtml.push("<span colno='WSI_LOT_NO_OLD' class='"+ms.uiClass(formId, 'WSI_LOT_NO_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_LOT_NO_OLD')+"' "+ms.uiEvent(formId, 'WSI_LOT_NO_OLD')+" title='"+ms.titleAttr(formId,'WSI_LOT_NO_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOT_NO_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SN' name='noprintset_WSI_DEVICE_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SN')+"' style='"+ms.tdStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SN')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SN' class='"+ms.uiClass(formId, 'WSI_DEVICE_SN')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SN')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SN')+" title='"+ms.titleAttr(formId,'WSI_DEVICE_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_DEVICE_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT' name='noprintset_WSI_POINT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT')+"' style='"+ms.tdStyle(formId, 'WSI_POINT')+"' "+ms.tdEvent(formId, 'WSI_POINT')+">")
            arrHtml.push("<span colno='WSI_POINT' class='"+ms.uiClass(formId, 'WSI_POINT')+"' style='"+ms.uiStyle(formId, 'WSI_POINT')+"' "+ms.uiEvent(formId, 'WSI_POINT')+" title='"+ms.titleAttr(formId,'WSI_POINT','IS_TITLE_ATTR',v)+"' >"+v['WSI_POINT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_SUPPLIERS' name='noprintset_WSI_SUPPLIERS' class='datagrid-cell "+ms.tdClass(formId, 'WSI_SUPPLIERS')+"' style='"+ms.tdStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.tdEvent(formId, 'WSI_SUPPLIERS')+">")
            arrHtml.push("<span colno='WSI_SUPPLIERS' class='"+ms.uiClass(formId, 'WSI_SUPPLIERS')+"' style='"+ms.uiStyle(formId, 'WSI_SUPPLIERS')+"' "+ms.uiEvent(formId, 'WSI_SUPPLIERS')+" title='"+ms.titleAttr(formId,'WSI_SUPPLIERS','IS_TITLE_ATTR',v)+"' >"+v['WSI_SUPPLIERS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_CODE_OLD' name='noprintset_WSI_ITEM_CODE_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_CODE_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_CODE_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_CODE_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_CODE_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_CODE_OLD')+" title='"+ms.titleAttr(formId,'WSI_ITEM_CODE_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_CODE_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_EMP' name='noprintset_WSI_EMP' class='datagrid-cell "+ms.tdClass(formId, 'WSI_EMP')+"' style='"+ms.tdStyle(formId, 'WSI_EMP')+"' "+ms.tdEvent(formId, 'WSI_EMP')+">")
            arrHtml.push("<span colno='WSI_EMP' class='"+ms.uiClass(formId, 'WSI_EMP')+"' style='"+ms.uiStyle(formId, 'WSI_EMP')+"' "+ms.uiEvent(formId, 'WSI_EMP')+" title='"+ms.titleAttr(formId,'WSI_EMP','IS_TITLE_ATTR',v)+"' >"+v['WSI_EMP']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_COUNT' name='noprintset_WSI_ITEM_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_COUNT')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.tdEvent(formId, 'WSI_ITEM_COUNT')+">")
            arrHtml.push("<span colno='WSI_ITEM_COUNT' class='"+ms.uiClass(formId, 'WSI_ITEM_COUNT')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_COUNT')+"' "+ms.uiEvent(formId, 'WSI_ITEM_COUNT')+" title='"+ms.titleAttr(formId,'WSI_ITEM_COUNT','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_COUNT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_POINT_NUM' name='noprintset_WSI_POINT_NUM' class='datagrid-cell "+ms.tdClass(formId, 'WSI_POINT_NUM')+"' style='"+ms.tdStyle(formId, 'WSI_POINT_NUM')+"' "+ms.tdEvent(formId, 'WSI_POINT_NUM')+">")
            arrHtml.push("<span colno='WSI_POINT_NUM' class='"+ms.uiClass(formId, 'WSI_POINT_NUM')+"' style='"+ms.uiStyle(formId, 'WSI_POINT_NUM')+"' "+ms.uiEvent(formId, 'WSI_POINT_NUM')+" title='"+ms.titleAttr(formId,'WSI_POINT_NUM','IS_TITLE_ATTR',v)+"' >"+v['WSI_POINT_NUM']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_COUNT_OLD' name='noprintset_WSI_COUNT_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_COUNT_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.tdEvent(formId, 'WSI_COUNT_OLD')+">")
            arrHtml.push("<span colno='WSI_COUNT_OLD' class='"+ms.uiClass(formId, 'WSI_COUNT_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_COUNT_OLD')+"' "+ms.uiEvent(formId, 'WSI_COUNT_OLD')+" title='"+ms.titleAttr(formId,'WSI_COUNT_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_COUNT_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ACTIONTYPE' name='noprintset_WSI_ACTIONTYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ACTIONTYPE')+"' style='"+ms.tdStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.tdEvent(formId, 'WSI_ACTIONTYPE')+">")
            arrHtml.push("<span colno='WSI_ACTIONTYPE' class='"+ms.uiClass(formId, 'WSI_ACTIONTYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ACTIONTYPE')+"' "+ms.uiEvent(formId, 'WSI_ACTIONTYPE')+" title='"+ms.titleAttr(formId,'WSI_ACTIONTYPE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ACTIONTYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_PROCESS_FACE' name='noprintset_WSI_PROCESS_FACE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_PROCESS_FACE')+"' style='"+ms.tdStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.tdEvent(formId, 'WSI_PROCESS_FACE')+">")
            arrHtml.push("<span colno='WSI_PROCESS_FACE' class='"+ms.uiClass(formId, 'WSI_PROCESS_FACE')+"' style='"+ms.uiStyle(formId, 'WSI_PROCESS_FACE')+"' "+ms.uiEvent(formId, 'WSI_PROCESS_FACE')+" title='"+ms.titleAttr(formId,'WSI_PROCESS_FACE','IS_TITLE_ATTR',v)+"' >"+v['WSI_PROCESS_FACE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ONLINE_FLAG' name='noprintset_WSI_ONLINE_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ONLINE_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.tdEvent(formId, 'WSI_ONLINE_FLAG')+">")
            arrHtml.push("<span colno='WSI_ONLINE_FLAG' class='"+ms.uiClass(formId, 'WSI_ONLINE_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_ONLINE_FLAG')+"' "+ms.uiEvent(formId, 'WSI_ONLINE_FLAG')+" title='"+ms.titleAttr(formId,'WSI_ONLINE_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_ONLINE_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_DEVICE_SEQ' name='noprintset_WSI_DEVICE_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'WSI_DEVICE_SEQ')+"' style='"+ms.tdStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.tdEvent(formId, 'WSI_DEVICE_SEQ')+">")
            arrHtml.push("<span colno='WSI_DEVICE_SEQ' class='"+ms.uiClass(formId, 'WSI_DEVICE_SEQ')+"' style='"+ms.uiStyle(formId, 'WSI_DEVICE_SEQ')+"' "+ms.uiEvent(formId, 'WSI_DEVICE_SEQ')+" title='"+ms.titleAttr(formId,'WSI_DEVICE_SEQ','IS_TITLE_ATTR',v)+"' >"+v['WSI_DEVICE_SEQ']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_CHANEL_NO' name='noprintset_WSI_CHANEL_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_CHANEL_NO')+"' style='"+ms.tdStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.tdEvent(formId, 'WSI_CHANEL_NO')+">")
            arrHtml.push("<span colno='WSI_CHANEL_NO' class='"+ms.uiClass(formId, 'WSI_CHANEL_NO')+"' style='"+ms.uiStyle(formId, 'WSI_CHANEL_NO')+"' "+ms.uiEvent(formId, 'WSI_CHANEL_NO')+" title='"+ms.titleAttr(formId,'WSI_CHANEL_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_CHANEL_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRAY_FLAG' name='noprintset_WSI_TRAY_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRAY_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.tdEvent(formId, 'WSI_TRAY_FLAG')+">")
            arrHtml.push("<span colno='WSI_TRAY_FLAG' class='"+ms.uiClass(formId, 'WSI_TRAY_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_TRAY_FLAG')+"' "+ms.uiEvent(formId, 'WSI_TRAY_FLAG')+" title='"+ms.titleAttr(formId,'WSI_TRAY_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_TRAY_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_REPEAT_FLAG' name='noprintset_WSI_REPEAT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'WSI_REPEAT_FLAG')+"' style='"+ms.tdStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.tdEvent(formId, 'WSI_REPEAT_FLAG')+">")
            arrHtml.push("<span colno='WSI_REPEAT_FLAG' class='"+ms.uiClass(formId, 'WSI_REPEAT_FLAG')+"' style='"+ms.uiStyle(formId, 'WSI_REPEAT_FLAG')+"' "+ms.uiEvent(formId, 'WSI_REPEAT_FLAG')+" title='"+ms.titleAttr(formId,'WSI_REPEAT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['WSI_REPEAT_FLAG']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN_OLD' name='noprintset_WSI_ITEM_SN_OLD' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN_OLD')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN_OLD')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN_OLD' class='"+ms.uiClass(formId, 'WSI_ITEM_SN_OLD')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN_OLD')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN_OLD')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN_OLD','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN_OLD']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_WORKSTATION_SN' name='noprintset_WSI_WORKSTATION_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_WORKSTATION_SN')+"' style='"+ms.tdStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.tdEvent(formId, 'WSI_WORKSTATION_SN')+">")
            arrHtml.push("<span colno='WSI_WORKSTATION_SN' class='"+ms.uiClass(formId, 'WSI_WORKSTATION_SN')+"' style='"+ms.uiStyle(formId, 'WSI_WORKSTATION_SN')+"' "+ms.uiEvent(formId, 'WSI_WORKSTATION_SN')+" title='"+ms.titleAttr(formId,'WSI_WORKSTATION_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_WORKSTATION_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TRUCK_NO' name='noprintset_WSI_TRUCK_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TRUCK_NO')+"' style='"+ms.tdStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.tdEvent(formId, 'WSI_TRUCK_NO')+">")
            arrHtml.push("<span colno='WSI_TRUCK_NO' class='"+ms.uiClass(formId, 'WSI_TRUCK_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TRUCK_NO')+"' "+ms.uiEvent(formId, 'WSI_TRUCK_NO')+" title='"+ms.titleAttr(formId,'WSI_TRUCK_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_TRUCK_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_MO_NUMBER' name='noprintset_WSI_MO_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'WSI_MO_NUMBER')+"' style='"+ms.tdStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.tdEvent(formId, 'WSI_MO_NUMBER')+">")
            arrHtml.push("<span colno='WSI_MO_NUMBER' class='"+ms.uiClass(formId, 'WSI_MO_NUMBER')+"' style='"+ms.uiStyle(formId, 'WSI_MO_NUMBER')+"' "+ms.uiEvent(formId, 'WSI_MO_NUMBER')+" title='"+ms.titleAttr(formId,'WSI_MO_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['WSI_MO_NUMBER']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_AREA_ID' name='noprintset_WSI_AREA_ID' class='datagrid-cell "+ms.tdClass(formId, 'WSI_AREA_ID')+"' style='"+ms.tdStyle(formId, 'WSI_AREA_ID')+"' "+ms.tdEvent(formId, 'WSI_AREA_ID')+">")
            arrHtml.push("<span colno='WSI_AREA_ID' class='"+ms.uiClass(formId, 'WSI_AREA_ID')+"' style='"+ms.uiStyle(formId, 'WSI_AREA_ID')+"' "+ms.uiEvent(formId, 'WSI_AREA_ID')+" title='"+ms.titleAttr(formId,'WSI_AREA_ID','IS_TITLE_ATTR',v)+"' >"+v['WSI_AREA_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADTIME' name='noprintset_WSI_LOADTIME' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADTIME')+"' style='"+ms.tdStyle(formId, 'WSI_LOADTIME')+"' "+ms.tdEvent(formId, 'WSI_LOADTIME')+">")
            arrHtml.push("<span colno='WSI_LOADTIME' class='"+ms.uiClass(formId, 'WSI_LOADTIME')+"' style='"+ms.uiStyle(formId, 'WSI_LOADTIME')+"' "+ms.uiEvent(formId, 'WSI_LOADTIME')+" title='"+ms.titleAttr(formId,'WSI_LOADTIME','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOADTIME']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_TYPE' name='noprintset_WSI_ITEM_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_TYPE')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.tdEvent(formId, 'WSI_ITEM_TYPE')+">")
            arrHtml.push("<span colno='WSI_ITEM_TYPE' class='"+ms.uiClass(formId, 'WSI_ITEM_TYPE')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_TYPE')+"' "+ms.uiEvent(formId, 'WSI_ITEM_TYPE')+" title='"+ms.titleAttr(formId,'WSI_ITEM_TYPE','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_TYPE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_ITEM_SN' name='noprintset_WSI_ITEM_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.tdStyle(formId, 'WSI_ITEM_SN')+"' "+ms.tdEvent(formId, 'WSI_ITEM_SN')+">")
            arrHtml.push("<span colno='WSI_ITEM_SN' class='"+ms.uiClass(formId, 'WSI_ITEM_SN')+"' style='"+ms.uiStyle(formId, 'WSI_ITEM_SN')+"' "+ms.uiEvent(formId, 'WSI_ITEM_SN')+" title='"+ms.titleAttr(formId,'WSI_ITEM_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_ITEM_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_TABLE_NO' name='noprintset_WSI_TABLE_NO' class='datagrid-cell "+ms.tdClass(formId, 'WSI_TABLE_NO')+"' style='"+ms.tdStyle(formId, 'WSI_TABLE_NO')+"' "+ms.tdEvent(formId, 'WSI_TABLE_NO')+">")
            arrHtml.push("<span colno='WSI_TABLE_NO' class='"+ms.uiClass(formId, 'WSI_TABLE_NO')+"' style='"+ms.uiStyle(formId, 'WSI_TABLE_NO')+"' "+ms.uiEvent(formId, 'WSI_TABLE_NO')+" title='"+ms.titleAttr(formId,'WSI_TABLE_NO','IS_TITLE_ATTR',v)+"' >"+v['WSI_TABLE_NO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_LOADPOINT_SN' name='noprintset_WSI_LOADPOINT_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_LOADPOINT_SN')+"' style='"+ms.tdStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.tdEvent(formId, 'WSI_LOADPOINT_SN')+">")
            arrHtml.push("<span colno='WSI_LOADPOINT_SN' class='"+ms.uiClass(formId, 'WSI_LOADPOINT_SN')+"' style='"+ms.uiStyle(formId, 'WSI_LOADPOINT_SN')+"' "+ms.uiEvent(formId, 'WSI_LOADPOINT_SN')+" title='"+ms.titleAttr(formId,'WSI_LOADPOINT_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_LOADPOINT_SN']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='WSI_FEEDER_SN' name='noprintset_WSI_FEEDER_SN' class='datagrid-cell "+ms.tdClass(formId, 'WSI_FEEDER_SN')+"' style='"+ms.tdStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.tdEvent(formId, 'WSI_FEEDER_SN')+">")
            arrHtml.push("<span colno='WSI_FEEDER_SN' class='"+ms.uiClass(formId, 'WSI_FEEDER_SN')+"' style='"+ms.uiStyle(formId, 'WSI_FEEDER_SN')+"' "+ms.uiEvent(formId, 'WSI_FEEDER_SN')+" title='"+ms.titleAttr(formId,'WSI_FEEDER_SN','IS_TITLE_ATTR',v)+"' >"+v['WSI_FEEDER_SN']+"</span>")
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
