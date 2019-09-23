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
		<dict:lang value="SPI测试详情" />
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
		<bu:header formId ="3a5cbd1740994e04b2a6c10379f1561f"/>

    
     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
         <jsp:param name="modelName" value="VIEW_TYPE_17" />
         <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->
    
	
	<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
	</object>
    <style>
	.optn{
	    margin-right:10px;
	}
	.none{
	    display:none;
	}
    </style>
</head>

<body> 
    <div class="content-in" >
        <div class="dlist" >
            <div class="hd">
		<bu:func viewId="744302b4725147a4bc78198571e8c47e" />
            </div>
            <div class="bd" >
                <div class="search-box" style="height: 40px;">
                <div class="search-box_1" style="display:none">
                    <form id="searchForm" name="searchForm"  action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     
		<bu:search viewId="744302b4725147a4bc78198571e8c47e" />
                   </form>
                   <a href="javascript:void(0);" class="more"></a>
                   </div>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPage3a5cbd1740994e04b2a6c10379f1561f" id="formPage3a5cbd1740994e04b2a6c10379f1561f" value="${formPage3a5cbd1740994e04b2a6c10379f1561f}"/>
		<input type="hidden" name="formId" id="formId1" value='3a5cbd1740994e04b2a6c10379f1561f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="3a5cbd1740994e04b2a6c10379f1561f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax3a5cbd1740994e04b2a6c10379f1561f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-inner3a5cbd1740994e04b2a6c10379f1561f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" style="min-width:2700px;" id="datagrid-htable3a5cbd1740994e04b2a6c10379f1561f">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
			<td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="3a5cbd1740994e04b2a6c10379f1561f" i18n="1"/></td>
			<td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_3a5cbd1740994e04b2a6c10379f1561f" onclick="_selectAjaxTableAllData(this,'3a5cbd1740994e04b2a6c10379f1561f')" style="cursor: pointer;"title="全选"/></span></td>
			<td name="noprintset_RESULT_ID" style="display:none" class="datagrid-cell"><bu:uitn colNo="RESULT_ID" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_AXISNO" class="datagrid-cell none"><bu:uitn colNo="AXISNO" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_BLOCKNO" class="datagrid-cell none"><bu:uitn colNo="BLOCKNO" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_BRIDGE" class="datagrid-cell none"><bu:uitn colNo="BRIDGE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CENTERX" class="datagrid-cell none"><bu:uitn colNo="CENTERX" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CENTERY" class="datagrid-cell none"><bu:uitn colNo="CENTERY" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_COMPONENT" class="datagrid-cell" style="width:150px;"><bu:uitn colNo="COMPONENT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CONFIGURATIONNO" class="datagrid-cell none"><bu:uitn colNo="CONFIGURATIONNO" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_MASKTHICKNESS" class="datagrid-cell none"><bu:uitn colNo="MASKTHICKNESS" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_MOUNTBLOCKNO" class="datagrid-cell none"><bu:uitn colNo="MOUNTBLOCKNO" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_PADNO" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="PADNO" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RESULT" class="datagrid-cell"  style="width:120px;"><bu:uitn colNo="RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_AREA_NGLOWERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="AREA_NGLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_AREA_NGUPPERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="AREA_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_AREA_RESULT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="AREA_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_AREA_VALUE" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="AREA_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_AREA_WARNLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="AREA_WARNLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_AREA_WARNUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="AREA_WARNUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CROSS_NGLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="CROSS_NGLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CROSS_NGUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="CROSS_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CROSS_RESULT" class="datagrid-cell none"><bu:uitn colNo="CROSS_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CROSS_VALUE" class="datagrid-cell none"><bu:uitn colNo="CROSS_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CROSS_WARNLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="CROSS_WARNLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_CROSS_WARNUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="CROSS_WARNUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_HEIGHT_NGLOWERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="HEIGHT_NGLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_HEIGHT_NGUPPERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="HEIGHT_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_HEIGHT_RESULT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="HEIGHT_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_HEIGHT_VALUE" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="HEIGHT_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_HEIGHT_WARNLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="HEIGHT_WARNLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_HEIGHT_WARNUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="HEIGHT_WARNUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_NOPASTE_NGLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="NOPASTE_NGLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_NOPASTE_NGUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="NOPASTE_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_NOPASTE_RESULT" class="datagrid-cell none"><bu:uitn colNo="NOPASTE_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_NOPASTE_VALUE" class="datagrid-cell none"><bu:uitn colNo="NOPASTE_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_NOPASTE_WARNLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="NOPASTE_WARNLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_NOPASTE_WARNUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="NOPASTE_WARNUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETX_NGLOWERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="OFFSETX_NGLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETX_NGUPPERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="OFFSETX_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETX_RESULT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="OFFSETX_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETX_VALUE" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="OFFSETX_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETX_WARNLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="OFFSETX_WARNLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETX_WARNUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="OFFSETX_WARNUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETY_NGLOWERLIMIT" class="datagrid-cell" style="width:120px;"> <bu:uitn colNo="OFFSETY_NGLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETY_NGUPPERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="OFFSETY_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETY_RESULT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="OFFSETY_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETY_VALUE" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="OFFSETY_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETY_WARNLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="OFFSETY_WARNLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_OFFSETY_WARNUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="OFFSETY_WARNUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RISE_NGLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="RISE_NGLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RISE_NGUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="RISE_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RISE_RESULT" class="datagrid-cell none"><bu:uitn colNo="RISE_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RISE_VALUE" class="datagrid-cell none"><bu:uitn colNo="RISE_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RISE_WARNLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="RISE_WARNLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RISE_WARNUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="RISE_WARNUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_VOLUME_NGLOWERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="VOLUME_NGLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_VOLUME_NGUPPERLIMIT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="VOLUME_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_VOLUME_RESULT" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="VOLUME_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_VOLUME_VALUE" class="datagrid-cell" style="width:120px;"><bu:uitn colNo="VOLUME_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_VOLUME_WARNLOWERLIMIT" class="datagrid-cell none"><bu:uitn colNo="VOLUME_WARNLOWERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_VOLUME_WARNUPPERLIMIT" class="datagrid-cell none"><bu:uitn colNo="VOLUME_WARNUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RESERVED1" class="datagrid-cell none"><bu:uitn colNo="RESERVED1" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RESERVED2" class="datagrid-cell none"><bu:uitn colNo="RESERVED2" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RESERVED3" class="datagrid-cell none"><bu:uitn colNo="RESERVED3" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_RESERVED4" class="datagrid-cell none"><bu:uitn colNo="RESERVED4" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
		    <td name="noprintset_SHARP2D_NGUPPERLIMIT" class="datagrid-cell " style="width:120px;"><bu:uitn colNo="SHARP2D_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_SHARP2D_RESULT" class="datagrid-cell " style="width:120px;"><bu:uitn colNo="SHARP2D_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_SHARP2D_VALUE" class="datagrid-cell " style="width:120px;"><bu:uitn colNo="SHARP2D_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
		    <td name="noprintset_SHARP3D_NGUPPERLIMIT" class="datagrid-cell " style="width:120px;"><bu:uitn colNo="SHARP3D_NGUPPERLIMIT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_SHARP3D_RESULT" class="datagrid-cell " style="width:120px;"><bu:uitn colNo="SHARP3D_RESULT" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>
			<td name="noprintset_SHARP3D_VALUE" class="datagrid-cell " style="width:120px;"><bu:uitn colNo="SHARP3D_VALUE" formId="3a5cbd1740994e04b2a6c10379f1561f" /></td>

		</bu:tr>
		</tbody>
		</bu:table>
		</div>
		</div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv3a5cbd1740994e04b2a6c10379f1561f" onscroll="ajaxTableScroll(this,'3a5cbd1740994e04b2a6c10379f1561f')">
		<table class="datagrid-btable fixedTable dblClick"  style="min-width:2700px;"  id="datagrid-btable-ajax3a5cbd1740994e04b2a6c10379f1561f">
		<tbody id="tbody_3a5cbd1740994e04b2a6c10379f1561f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPage3a5cbd1740994e04b2a6c10379f1561f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTableThis&formId=3a5cbd1740994e04b2a6c10379f1561f&showLoading=0" />
			</div>
		</c:if>

 <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
 <div class="hd" style="background-color: #f6f5f7;height: 35px;">
 <div class="optn" style="top:45px;right:30px;">
 <button type="button" onclick="printset_17('3a5cbd1740994e04b2a6c10379f1561f','1');">打印</button>
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
 <td style="width: 100px;text-align: right;"><span>主表主键</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RESULT_ID" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RESULT_ID" value="" title_name="主表主键" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>轴编号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AXISNO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AXISNO" value="" title_name="轴编号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>程序块编号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="BLOCKNO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="BLOCKNO" value="" title_name="程序块编号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>焊桥</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="BRIDGE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="BRIDGE" value="" title_name="焊桥" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>中心X坐标</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CENTERX" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CENTERX" value="" title_name="中心X坐标" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>中心YX坐标</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CENTERY" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CENTERY" value="" title_name="中心YX坐标" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>零件名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="COMPONENT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="COMPONENT" value="" title_name="零件名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>配置编号名</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CONFIGURATIONNO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CONFIGURATIONNO" value="" title_name="配置编号名" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>罩厚</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MASKTHICKNESS" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MASKTHICKNESS" value="" title_name="罩厚" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>MOUNT块编号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="MOUNTBLOCKNO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="MOUNTBLOCKNO" value="" title_name="MOUNT块编号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>焊盘编号</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="PADNO" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="PADNO" value="" title_name="焊盘编号" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>判定结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RESULT" value="" title_name="判定结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>面积NG下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AREA_NGLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AREA_NGLOWERLIMIT" value="" title_name="面积NG下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>面积NG上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AREA_NGUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AREA_NGUPPERLIMIT" value="" title_name="面积NG上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>面积结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AREA_RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AREA_RESULT" value="" title_name="面积结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>面积</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AREA_VALUE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AREA_VALUE" value="" title_name="面积" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>面积WARN下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AREA_WARNLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AREA_WARNLOWERLIMIT" value="" title_name="面积WARN下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>面积WARN上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="AREA_WARNUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="AREA_WARNUPPERLIMIT" value="" title_name="面积WARN上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>掠过NG下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CROSS_NGLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CROSS_NGLOWERLIMIT" value="" title_name="掠过NG下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>掠过NG上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CROSS_NGUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CROSS_NGUPPERLIMIT" value="" title_name="掠过NG上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>掠过结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CROSS_RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CROSS_RESULT" value="" title_name="掠过结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>掠过</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CROSS_VALUE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CROSS_VALUE" value="" title_name="掠过" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>掠过WARN下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CROSS_WARNLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CROSS_WARNLOWERLIMIT" value="" title_name="掠过WARN下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>掠过WARN上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="CROSS_WARNUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="CROSS_WARNUPPERLIMIT" value="" title_name="掠过WARN上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>高度NG下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="HEIGHT_NGLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="HEIGHT_NGLOWERLIMIT" value="" title_name="高度NG下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>高度NG上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="HEIGHT_NGUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="HEIGHT_NGUPPERLIMIT" value="" title_name="高度NG上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>高度结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="HEIGHT_RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="HEIGHT_RESULT" value="" title_name="高度结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>高度</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="HEIGHT_VALUE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="HEIGHT_VALUE" value="" title_name="高度" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>高度WARN下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="HEIGHT_WARNLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="HEIGHT_WARNLOWERLIMIT" value="" title_name="高度WARN下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>高度WARN上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="HEIGHT_WARNUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="HEIGHT_WARNUPPERLIMIT" value="" title_name="高度WARN上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>无焊锡NG下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NOPASTE_NGLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NOPASTE_NGLOWERLIMIT" value="" title_name="无焊锡NG下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>无焊锡NG上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NOPASTE_NGUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NOPASTE_NGUPPERLIMIT" value="" title_name="无焊锡NG上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>无焊锡结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NOPASTE_RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NOPASTE_RESULT" value="" title_name="无焊锡结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>无焊锡</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NOPASTE_VALUE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NOPASTE_VALUE" value="" title_name="无焊锡" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>无焊锡WARN下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NOPASTE_WARNLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NOPASTE_WARNLOWERLIMIT" value="" title_name="无焊锡WARN下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>无焊锡WARN上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="NOPASTE_WARNUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="NOPASTE_WARNUPPERLIMIT" value="" title_name="无焊锡WARN上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>X错位NG下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETX_NGLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETX_NGLOWERLIMIT" value="" title_name="X错位NG下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>X错位NG上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETX_NGUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETX_NGUPPERLIMIT" value="" title_name="X错位NG上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>X错位结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETX_RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETX_RESULT" value="" title_name="X错位结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>X错位</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETX_VALUE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETX_VALUE" value="" title_name="X错位" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>X错位WARN下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETX_WARNLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETX_WARNLOWERLIMIT" value="" title_name="X错位WARN下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>X错位WARN上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETX_WARNUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETX_WARNUPPERLIMIT" value="" title_name="X错位WARN上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>Y错位NG下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETY_NGLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETY_NGLOWERLIMIT" value="" title_name="Y错位NG下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>Y错位NG上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETY_NGUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETY_NGUPPERLIMIT" value="" title_name="Y错位NG上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>Y错位结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETY_RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETY_RESULT" value="" title_name="Y错位结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>Y错位</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETY_VALUE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETY_VALUE" value="" title_name="Y错位" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>Y错位WARN下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETY_WARNLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETY_WARNLOWERLIMIT" value="" title_name="Y错位WARN下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>Y错位WARN上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="OFFSETY_WARNUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="OFFSETY_WARNUPPERLIMIT" value="" title_name="Y错位WARN上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>突起NG下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RISE_NGLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RISE_NGLOWERLIMIT" value="" title_name="突起NG下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>突起NG上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RISE_NGUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RISE_NGUPPERLIMIT" value="" title_name="突起NG上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>突起结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RISE_RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RISE_RESULT" value="" title_name="突起结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>突起</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RISE_VALUE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RISE_VALUE" value="" title_name="突起" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>突起WARN下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RISE_WARNLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RISE_WARNLOWERLIMIT" value="" title_name="突起WARN下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>突起WARN上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RISE_WARNUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RISE_WARNUPPERLIMIT" value="" title_name="突起WARN上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>体积NG下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="VOLUME_NGLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="VOLUME_NGLOWERLIMIT" value="" title_name="体积NG下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>体积NG上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="VOLUME_NGUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="VOLUME_NGUPPERLIMIT" value="" title_name="体积NG上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>体积结果</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="VOLUME_RESULT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="VOLUME_RESULT" value="" title_name="体积结果" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>体积（m³）</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="VOLUME_VALUE" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="VOLUME_VALUE" value="" title_name="体积（m³）" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>体积WARN下限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="VOLUME_WARNLOWERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="VOLUME_WARNLOWERLIMIT" value="" title_name="体积WARN下限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>体积WARN上限</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="VOLUME_WARNUPPERLIMIT" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="VOLUME_WARNUPPERLIMIT" value="" title_name="体积WARN上限" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>预备</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RESERVED1" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RESERVED1" value="" title_name="预备" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>预备</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RESERVED2" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RESERVED2" value="" title_name="预备" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>预备</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RESERVED3" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RESERVED3" value="" title_name="预备" />px
 </td>
 </tr>
 <tr>
 <td style="width: 100px;text-align: right;"><span>预备</span></td>
 <td style="padding-left: 5px;">
 <input type="checkbox" name="RESERVED4" value="1" checked="checked" />
 </td>
 <td style="padding-left: 5px;">
 <input type="text" name="RESERVED4" value="" title_name="预备" />px
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
		<bu:submit viewId="744302b4725147a4bc78198571e8c47e" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="744302b4725147a4bc78198571e8c47e" />
    
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
    if(formId=='3a5cbd1740994e04b2a6c10379f1561f'){<%--SPI测试详情--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
            arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESULT_ID' name='noprintset_RESULT_ID' class='datagrid-cell "+ms.tdClass(formId, 'RESULT_ID')+"' style='display:none"+ms.tdStyle(formId, 'RESULT_ID')+"' "+ms.tdEvent(formId, 'RESULT_ID')+">")
            arrHtml.push("<span colno='RESULT_ID' class='"+ms.uiClass(formId, 'RESULT_ID')+"' style='"+ms.uiStyle(formId, 'RESULT_ID')+"' "+ms.uiEvent(formId, 'RESULT_ID')+" title='"+ms.titleAttr(formId,'RESULT_ID','IS_TITLE_ATTR',v)+"' >"+v['RESULT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AXISNO' name='noprintset_AXISNO' class='datagrid-cell none "+ms.tdClass(formId, 'AXISNO')+"' style='"+ms.tdStyle(formId, 'AXISNO')+"' "+ms.tdEvent(formId, 'AXISNO')+">")
            arrHtml.push("<span colno='AXISNO' class='"+ms.uiClass(formId, 'AXISNO')+"' style='"+ms.uiStyle(formId, 'AXISNO')+"' "+ms.uiEvent(formId, 'AXISNO')+" title='"+ms.titleAttr(formId,'AXISNO','IS_TITLE_ATTR',v)+"' >"+v['AXISNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BLOCKNO' name='noprintset_BLOCKNO' class='datagrid-cell none "+ms.tdClass(formId, 'BLOCKNO')+"' style='"+ms.tdStyle(formId, 'BLOCKNO')+"' "+ms.tdEvent(formId, 'BLOCKNO')+">")
            arrHtml.push("<span colno='BLOCKNO' class='"+ms.uiClass(formId, 'BLOCKNO')+"' style='"+ms.uiStyle(formId, 'BLOCKNO')+"' "+ms.uiEvent(formId, 'BLOCKNO')+" title='"+ms.titleAttr(formId,'BLOCKNO','IS_TITLE_ATTR',v)+"' >"+v['BLOCKNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BRIDGE' name='noprintset_BRIDGE' class='datagrid-cell none "+ms.tdClass(formId, 'BRIDGE')+"' style='"+ms.tdStyle(formId, 'BRIDGE')+"' "+ms.tdEvent(formId, 'BRIDGE')+">")
            arrHtml.push("<span colno='BRIDGE' class='"+ms.uiClass(formId, 'BRIDGE')+"' style='"+ms.uiStyle(formId, 'BRIDGE')+"' "+ms.uiEvent(formId, 'BRIDGE')+" title='"+ms.titleAttr(formId,'BRIDGE','IS_TITLE_ATTR',v)+"' >"+v['BRIDGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CENTERX' name='noprintset_CENTERX' class='datagrid-cell none "+ms.tdClass(formId, 'CENTERX')+"' style='"+ms.tdStyle(formId, 'CENTERX')+"' "+ms.tdEvent(formId, 'CENTERX')+">")
            arrHtml.push("<span colno='CENTERX' class='"+ms.uiClass(formId, 'CENTERX')+"' style='"+ms.uiStyle(formId, 'CENTERX')+"' "+ms.uiEvent(formId, 'CENTERX')+" title='"+ms.titleAttr(formId,'CENTERX','IS_TITLE_ATTR',v)+"' >"+v['CENTERX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CENTERY' name='noprintset_CENTERY' class='datagrid-cell none "+ms.tdClass(formId, 'CENTERY')+"' style='"+ms.tdStyle(formId, 'CENTERY')+"' "+ms.tdEvent(formId, 'CENTERY')+">")
            arrHtml.push("<span colno='CENTERY' class='"+ms.uiClass(formId, 'CENTERY')+"' style='"+ms.uiStyle(formId, 'CENTERY')+"' "+ms.uiEvent(formId, 'CENTERY')+" title='"+ms.titleAttr(formId,'CENTERY','IS_TITLE_ATTR',v)+"' >"+v['CENTERY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='COMPONENT' name='noprintset_COMPONENT' class='datagrid-cell "+ms.tdClass(formId, 'COMPONENT')+"' style='"+ms.tdStyle(formId, 'COMPONENT')+"' "+ms.tdEvent(formId, 'COMPONENT')+">")
            arrHtml.push("<span colno='COMPONENT' class='"+ms.uiClass(formId, 'COMPONENT')+"' style='"+ms.uiStyle(formId, 'COMPONENT')+"' "+ms.uiEvent(formId, 'COMPONENT')+" title='"+ms.titleAttr(formId,'COMPONENT','IS_TITLE_ATTR',v)+"' >"+v['COMPONENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CONFIGURATIONNO' name='noprintset_CONFIGURATIONNO' class='datagrid-cell none "+ms.tdClass(formId, 'CONFIGURATIONNO')+"' style='"+ms.tdStyle(formId, 'CONFIGURATIONNO')+"' "+ms.tdEvent(formId, 'CONFIGURATIONNO')+">")
            arrHtml.push("<span colno='CONFIGURATIONNO' class='"+ms.uiClass(formId, 'CONFIGURATIONNO')+"' style='"+ms.uiStyle(formId, 'CONFIGURATIONNO')+"' "+ms.uiEvent(formId, 'CONFIGURATIONNO')+" title='"+ms.titleAttr(formId,'CONFIGURATIONNO','IS_TITLE_ATTR',v)+"' >"+v['CONFIGURATIONNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MASKTHICKNESS' name='noprintset_MASKTHICKNESS' class='datagrid-cell none "+ms.tdClass(formId, 'MASKTHICKNESS')+"' style='"+ms.tdStyle(formId, 'MASKTHICKNESS')+"' "+ms.tdEvent(formId, 'MASKTHICKNESS')+">")
            arrHtml.push("<span colno='MASKTHICKNESS' class='"+ms.uiClass(formId, 'MASKTHICKNESS')+"' style='"+ms.uiStyle(formId, 'MASKTHICKNESS')+"' "+ms.uiEvent(formId, 'MASKTHICKNESS')+" title='"+ms.titleAttr(formId,'MASKTHICKNESS','IS_TITLE_ATTR',v)+"' >"+v['MASKTHICKNESS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MOUNTBLOCKNO' name='noprintset_MOUNTBLOCKNO' class='datagrid-cell none "+ms.tdClass(formId, 'MOUNTBLOCKNO')+"' style='"+ms.tdStyle(formId, 'MOUNTBLOCKNO')+"' "+ms.tdEvent(formId, 'MOUNTBLOCKNO')+">")
            arrHtml.push("<span colno='MOUNTBLOCKNO' class='"+ms.uiClass(formId, 'MOUNTBLOCKNO')+"' style='"+ms.uiStyle(formId, 'MOUNTBLOCKNO')+"' "+ms.uiEvent(formId, 'MOUNTBLOCKNO')+" title='"+ms.titleAttr(formId,'MOUNTBLOCKNO','IS_TITLE_ATTR',v)+"' >"+v['MOUNTBLOCKNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PADNO' name='noprintset_PADNO' class='datagrid-cell "+ms.tdClass(formId, 'PADNO')+"' style='"+ms.tdStyle(formId, 'PADNO')+"' "+ms.tdEvent(formId, 'PADNO')+">")
            arrHtml.push("<span colno='PADNO' class='"+ms.uiClass(formId, 'PADNO')+"' style='"+ms.uiStyle(formId, 'PADNO')+"' "+ms.uiEvent(formId, 'PADNO')+" title='"+ms.titleAttr(formId,'PADNO','IS_TITLE_ATTR',v)+"' >"+v['PADNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESULT' name='noprintset_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'RESULT')+"' style='"+ms.tdStyle(formId, 'RESULT')+"' "+ms.tdEvent(formId, 'RESULT')+">")
            arrHtml.push("<span colno='RESULT' class='"+ms.uiClass(formId, 'RESULT')+"' style='"+ms.uiStyle(formId, 'RESULT')+"' "+ms.uiEvent(formId, 'RESULT')+" title='"+ms.titleAttr(formId,'RESULT','IS_TITLE_ATTR',v)+"' >"+v['RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NGLOWERLIMIT' name='noprintset_AREA_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'AREA_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'AREA_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='AREA_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'AREA_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'AREA_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'AREA_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'AREA_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['AREA_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NGUPPERLIMIT' name='noprintset_AREA_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'AREA_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'AREA_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='AREA_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'AREA_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'AREA_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'AREA_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'AREA_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['AREA_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_RESULT' name='noprintset_AREA_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'AREA_RESULT')+"' style='"+ms.tdStyle(formId, 'AREA_RESULT')+"' "+ms.tdEvent(formId, 'AREA_RESULT')+">")
            arrHtml.push("<span colno='AREA_RESULT' class='"+ms.uiClass(formId, 'AREA_RESULT')+"' style='"+ms.uiStyle(formId, 'AREA_RESULT')+"' "+ms.uiEvent(formId, 'AREA_RESULT')+" title='"+ms.titleAttr(formId,'AREA_RESULT','IS_TITLE_ATTR',v)+"' >"+v['AREA_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_VALUE' name='noprintset_AREA_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'AREA_VALUE')+"' style='"+ms.tdStyle(formId, 'AREA_VALUE')+"' "+ms.tdEvent(formId, 'AREA_VALUE')+">")
            arrHtml.push("<span colno='AREA_VALUE' class='"+ms.uiClass(formId, 'AREA_VALUE')+"' style='"+ms.uiStyle(formId, 'AREA_VALUE')+"' "+ms.uiEvent(formId, 'AREA_VALUE')+" title='"+ms.titleAttr(formId,'AREA_VALUE','IS_TITLE_ATTR',v)+"' >"+v['AREA_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_WARNLOWERLIMIT' name='noprintset_AREA_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'AREA_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'AREA_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'AREA_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='AREA_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'AREA_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'AREA_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'AREA_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'AREA_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['AREA_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_WARNUPPERLIMIT' name='noprintset_AREA_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'AREA_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'AREA_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'AREA_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='AREA_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'AREA_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'AREA_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'AREA_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'AREA_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['AREA_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_NGLOWERLIMIT' name='noprintset_CROSS_NGLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'CROSS_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'CROSS_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='CROSS_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'CROSS_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'CROSS_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'CROSS_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'CROSS_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_NGUPPERLIMIT' name='noprintset_CROSS_NGUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'CROSS_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'CROSS_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='CROSS_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'CROSS_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'CROSS_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'CROSS_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'CROSS_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_RESULT' name='noprintset_CROSS_RESULT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_RESULT')+"' style='"+ms.tdStyle(formId, 'CROSS_RESULT')+"' "+ms.tdEvent(formId, 'CROSS_RESULT')+">")
            arrHtml.push("<span colno='CROSS_RESULT' class='"+ms.uiClass(formId, 'CROSS_RESULT')+"' style='"+ms.uiStyle(formId, 'CROSS_RESULT')+"' "+ms.uiEvent(formId, 'CROSS_RESULT')+" title='"+ms.titleAttr(formId,'CROSS_RESULT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_VALUE' name='noprintset_CROSS_VALUE' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_VALUE')+"' style='"+ms.tdStyle(formId, 'CROSS_VALUE')+"' "+ms.tdEvent(formId, 'CROSS_VALUE')+">")
            arrHtml.push("<span colno='CROSS_VALUE' class='"+ms.uiClass(formId, 'CROSS_VALUE')+"' style='"+ms.uiStyle(formId, 'CROSS_VALUE')+"' "+ms.uiEvent(formId, 'CROSS_VALUE')+" title='"+ms.titleAttr(formId,'CROSS_VALUE','IS_TITLE_ATTR',v)+"' >"+v['CROSS_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_WARNLOWERLIMIT' name='noprintset_CROSS_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'CROSS_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'CROSS_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='CROSS_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'CROSS_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'CROSS_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'CROSS_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'CROSS_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_WARNUPPERLIMIT' name='noprintset_CROSS_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'CROSS_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'CROSS_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='CROSS_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'CROSS_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'CROSS_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'CROSS_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'CROSS_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_NGLOWERLIMIT' name='noprintset_HEIGHT_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'HEIGHT_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'HEIGHT_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='HEIGHT_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'HEIGHT_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'HEIGHT_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'HEIGHT_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_NGUPPERLIMIT' name='noprintset_HEIGHT_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'HEIGHT_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'HEIGHT_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='HEIGHT_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'HEIGHT_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'HEIGHT_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'HEIGHT_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_RESULT' name='noprintset_HEIGHT_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'HEIGHT_RESULT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_RESULT')+"' "+ms.tdEvent(formId, 'HEIGHT_RESULT')+">")
            arrHtml.push("<span colno='HEIGHT_RESULT' class='"+ms.uiClass(formId, 'HEIGHT_RESULT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_RESULT')+"' "+ms.uiEvent(formId, 'HEIGHT_RESULT')+" title='"+ms.titleAttr(formId,'HEIGHT_RESULT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_VALUE' name='noprintset_HEIGHT_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'HEIGHT_VALUE')+"' style='"+ms.tdStyle(formId, 'HEIGHT_VALUE')+"' "+ms.tdEvent(formId, 'HEIGHT_VALUE')+">")
            arrHtml.push("<span colno='HEIGHT_VALUE' class='"+ms.uiClass(formId, 'HEIGHT_VALUE')+"' style='"+ms.uiStyle(formId, 'HEIGHT_VALUE')+"' "+ms.uiEvent(formId, 'HEIGHT_VALUE')+" title='"+ms.titleAttr(formId,'HEIGHT_VALUE','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_WARNLOWERLIMIT' name='noprintset_HEIGHT_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'HEIGHT_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'HEIGHT_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='HEIGHT_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'HEIGHT_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'HEIGHT_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'HEIGHT_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_WARNUPPERLIMIT' name='noprintset_HEIGHT_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'HEIGHT_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'HEIGHT_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='HEIGHT_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'HEIGHT_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'HEIGHT_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'HEIGHT_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_NGLOWERLIMIT' name='noprintset_NOPASTE_NGLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'NOPASTE_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='NOPASTE_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'NOPASTE_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'NOPASTE_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'NOPASTE_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_NGUPPERLIMIT' name='noprintset_NOPASTE_NGUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'NOPASTE_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='NOPASTE_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'NOPASTE_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'NOPASTE_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'NOPASTE_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_RESULT' name='noprintset_NOPASTE_RESULT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_RESULT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_RESULT')+"' "+ms.tdEvent(formId, 'NOPASTE_RESULT')+">")
            arrHtml.push("<span colno='NOPASTE_RESULT' class='"+ms.uiClass(formId, 'NOPASTE_RESULT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_RESULT')+"' "+ms.uiEvent(formId, 'NOPASTE_RESULT')+" title='"+ms.titleAttr(formId,'NOPASTE_RESULT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_VALUE' name='noprintset_NOPASTE_VALUE' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_VALUE')+"' style='"+ms.tdStyle(formId, 'NOPASTE_VALUE')+"' "+ms.tdEvent(formId, 'NOPASTE_VALUE')+">")
            arrHtml.push("<span colno='NOPASTE_VALUE' class='"+ms.uiClass(formId, 'NOPASTE_VALUE')+"' style='"+ms.uiStyle(formId, 'NOPASTE_VALUE')+"' "+ms.uiEvent(formId, 'NOPASTE_VALUE')+" title='"+ms.titleAttr(formId,'NOPASTE_VALUE','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_WARNLOWERLIMIT' name='noprintset_NOPASTE_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'NOPASTE_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='NOPASTE_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'NOPASTE_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'NOPASTE_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'NOPASTE_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_WARNUPPERLIMIT' name='noprintset_NOPASTE_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'NOPASTE_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='NOPASTE_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'NOPASTE_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'NOPASTE_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'NOPASTE_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_NGLOWERLIMIT' name='noprintset_OFFSETX_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETX_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETX_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETX_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'OFFSETX_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETX_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETX_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_NGUPPERLIMIT' name='noprintset_OFFSETX_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETX_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETX_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETX_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'OFFSETX_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETX_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETX_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_RESULT' name='noprintset_OFFSETX_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETX_RESULT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_RESULT')+"' "+ms.tdEvent(formId, 'OFFSETX_RESULT')+">")
            arrHtml.push("<span colno='OFFSETX_RESULT' class='"+ms.uiClass(formId, 'OFFSETX_RESULT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_RESULT')+"' "+ms.uiEvent(formId, 'OFFSETX_RESULT')+" title='"+ms.titleAttr(formId,'OFFSETX_RESULT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_VALUE' name='noprintset_OFFSETX_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETX_VALUE')+"' style='"+ms.tdStyle(formId, 'OFFSETX_VALUE')+"' "+ms.tdEvent(formId, 'OFFSETX_VALUE')+">")
            arrHtml.push("<span colno='OFFSETX_VALUE' class='"+ms.uiClass(formId, 'OFFSETX_VALUE')+"' style='"+ms.uiStyle(formId, 'OFFSETX_VALUE')+"' "+ms.uiEvent(formId, 'OFFSETX_VALUE')+" title='"+ms.titleAttr(formId,'OFFSETX_VALUE','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_WARNLOWERLIMIT' name='noprintset_OFFSETX_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'OFFSETX_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETX_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETX_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'OFFSETX_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETX_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETX_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_WARNUPPERLIMIT' name='noprintset_OFFSETX_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'OFFSETX_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETX_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETX_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'OFFSETX_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETX_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETX_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_NGLOWERLIMIT' name='noprintset_OFFSETY_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETY_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETY_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETY_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'OFFSETY_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETY_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETY_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_NGUPPERLIMIT' name='noprintset_OFFSETY_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETY_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETY_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETY_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'OFFSETY_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETY_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETY_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_RESULT' name='noprintset_OFFSETY_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETY_RESULT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_RESULT')+"' "+ms.tdEvent(formId, 'OFFSETY_RESULT')+">")
            arrHtml.push("<span colno='OFFSETY_RESULT' class='"+ms.uiClass(formId, 'OFFSETY_RESULT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_RESULT')+"' "+ms.uiEvent(formId, 'OFFSETY_RESULT')+" title='"+ms.titleAttr(formId,'OFFSETY_RESULT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_VALUE' name='noprintset_OFFSETY_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETY_VALUE')+"' style='"+ms.tdStyle(formId, 'OFFSETY_VALUE')+"' "+ms.tdEvent(formId, 'OFFSETY_VALUE')+">")
            arrHtml.push("<span colno='OFFSETY_VALUE' class='"+ms.uiClass(formId, 'OFFSETY_VALUE')+"' style='"+ms.uiStyle(formId, 'OFFSETY_VALUE')+"' "+ms.uiEvent(formId, 'OFFSETY_VALUE')+" title='"+ms.titleAttr(formId,'OFFSETY_VALUE','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_WARNLOWERLIMIT' name='noprintset_OFFSETY_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'OFFSETY_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETY_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETY_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'OFFSETY_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETY_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETY_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_WARNUPPERLIMIT' name='noprintset_OFFSETY_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'OFFSETY_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETY_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETY_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'OFFSETY_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETY_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETY_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_NGLOWERLIMIT' name='noprintset_RISE_NGLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'RISE_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'RISE_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='RISE_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'RISE_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'RISE_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'RISE_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'RISE_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['RISE_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_NGUPPERLIMIT' name='noprintset_RISE_NGUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'RISE_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'RISE_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='RISE_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'RISE_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'RISE_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'RISE_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'RISE_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['RISE_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_RESULT' name='noprintset_RISE_RESULT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_RESULT')+"' style='"+ms.tdStyle(formId, 'RISE_RESULT')+"' "+ms.tdEvent(formId, 'RISE_RESULT')+">")
            arrHtml.push("<span colno='RISE_RESULT' class='"+ms.uiClass(formId, 'RISE_RESULT')+"' style='"+ms.uiStyle(formId, 'RISE_RESULT')+"' "+ms.uiEvent(formId, 'RISE_RESULT')+" title='"+ms.titleAttr(formId,'RISE_RESULT','IS_TITLE_ATTR',v)+"' >"+v['RISE_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_VALUE' name='noprintset_RISE_VALUE' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_VALUE')+"' style='"+ms.tdStyle(formId, 'RISE_VALUE')+"' "+ms.tdEvent(formId, 'RISE_VALUE')+">")
            arrHtml.push("<span colno='RISE_VALUE' class='"+ms.uiClass(formId, 'RISE_VALUE')+"' style='"+ms.uiStyle(formId, 'RISE_VALUE')+"' "+ms.uiEvent(formId, 'RISE_VALUE')+" title='"+ms.titleAttr(formId,'RISE_VALUE','IS_TITLE_ATTR',v)+"' >"+v['RISE_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_WARNLOWERLIMIT' name='noprintset_RISE_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'RISE_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'RISE_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='RISE_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'RISE_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'RISE_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'RISE_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'RISE_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['RISE_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_WARNUPPERLIMIT' name='noprintset_RISE_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'RISE_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'RISE_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='RISE_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'RISE_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'RISE_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'RISE_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'RISE_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['RISE_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_NGLOWERLIMIT' name='noprintset_VOLUME_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'VOLUME_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'VOLUME_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'VOLUME_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='VOLUME_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'VOLUME_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'VOLUME_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'VOLUME_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'VOLUME_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_NGUPPERLIMIT' name='noprintset_VOLUME_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'VOLUME_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'VOLUME_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'VOLUME_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='VOLUME_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'VOLUME_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'VOLUME_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'VOLUME_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'VOLUME_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_RESULT' name='noprintset_VOLUME_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'VOLUME_RESULT')+"' style='"+ms.tdStyle(formId, 'VOLUME_RESULT')+"' "+ms.tdEvent(formId, 'VOLUME_RESULT')+">")
            arrHtml.push("<span colno='VOLUME_RESULT' class='"+ms.uiClass(formId, 'VOLUME_RESULT')+"' style='"+ms.uiStyle(formId, 'VOLUME_RESULT')+"' "+ms.uiEvent(formId, 'VOLUME_RESULT')+" title='"+ms.titleAttr(formId,'VOLUME_RESULT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_VALUE' name='noprintset_VOLUME_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'VOLUME_VALUE')+"' style='"+ms.tdStyle(formId, 'VOLUME_VALUE')+"' "+ms.tdEvent(formId, 'VOLUME_VALUE')+">")
            arrHtml.push("<span colno='VOLUME_VALUE' class='"+ms.uiClass(formId, 'VOLUME_VALUE')+"' style='"+ms.uiStyle(formId, 'VOLUME_VALUE')+"' "+ms.uiEvent(formId, 'VOLUME_VALUE')+" title='"+ms.titleAttr(formId,'VOLUME_VALUE','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_WARNLOWERLIMIT' name='noprintset_VOLUME_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'VOLUME_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'VOLUME_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'VOLUME_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='VOLUME_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'VOLUME_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'VOLUME_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'VOLUME_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'VOLUME_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_WARNUPPERLIMIT' name='noprintset_VOLUME_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'VOLUME_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'VOLUME_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'VOLUME_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='VOLUME_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'VOLUME_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'VOLUME_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'VOLUME_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'VOLUME_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESERVED1' name='noprintset_RESERVED1' class='datagrid-cell none "+ms.tdClass(formId, 'RESERVED1')+"' style='"+ms.tdStyle(formId, 'RESERVED1')+"' "+ms.tdEvent(formId, 'RESERVED1')+">")
            arrHtml.push("<span colno='RESERVED1' class='"+ms.uiClass(formId, 'RESERVED1')+"' style='"+ms.uiStyle(formId, 'RESERVED1')+"' "+ms.uiEvent(formId, 'RESERVED1')+" title='"+ms.titleAttr(formId,'RESERVED1','IS_TITLE_ATTR',v)+"' >"+v['RESERVED1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESERVED2' name='noprintset_RESERVED2' class='datagrid-cell none "+ms.tdClass(formId, 'RESERVED2')+"' style='"+ms.tdStyle(formId, 'RESERVED2')+"' "+ms.tdEvent(formId, 'RESERVED2')+">")
            arrHtml.push("<span colno='RESERVED2' class='"+ms.uiClass(formId, 'RESERVED2')+"' style='"+ms.uiStyle(formId, 'RESERVED2')+"' "+ms.uiEvent(formId, 'RESERVED2')+" title='"+ms.titleAttr(formId,'RESERVED2','IS_TITLE_ATTR',v)+"' >"+v['RESERVED2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESERVED3' name='noprintset_RESERVED3' class='datagrid-cell none "+ms.tdClass(formId, 'RESERVED3')+"' style='"+ms.tdStyle(formId, 'RESERVED3')+"' "+ms.tdEvent(formId, 'RESERVED3')+">")
            arrHtml.push("<span colno='RESERVED3' class='"+ms.uiClass(formId, 'RESERVED3')+"' style='"+ms.uiStyle(formId, 'RESERVED3')+"' "+ms.uiEvent(formId, 'RESERVED3')+" title='"+ms.titleAttr(formId,'RESERVED3','IS_TITLE_ATTR',v)+"' >"+v['RESERVED3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESERVED4' name='noprintset_RESERVED4' class='datagrid-cell none "+ms.tdClass(formId, 'RESERVED4')+"' style='"+ms.tdStyle(formId, 'RESERVED4')+"' "+ms.tdEvent(formId, 'RESERVED4')+">")
            arrHtml.push("<span colno='RESERVED4' class='"+ms.uiClass(formId, 'RESERVED4')+"' style='"+ms.uiStyle(formId, 'RESERVED4')+"' "+ms.uiEvent(formId, 'RESERVED4')+" title='"+ms.titleAttr(formId,'RESERVED4','IS_TITLE_ATTR',v)+"' >"+v['RESERVED4']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='SHARP2D_NGUPPERLIMIT' name='noprintset_SHARP2D_NGUPPERLIMIT' class='datagrid-cell  "+ms.tdClass(formId, 'SHARP2D_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'SHARP2D_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'SHARP2D_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='SHARP2D_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'SHARP2D_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'SHARP2D_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'SHARP2D_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'SHARP2D_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['SHARP2D_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP2D_RESULT' name='noprintset_SHARP2D_RESULT' class='datagrid-cell  "+ms.tdClass(formId, 'SHARP2D_RESULT')+"' style='"+ms.tdStyle(formId, 'SHARP2D_RESULT')+"' "+ms.tdEvent(formId, 'SHARP2D_RESULT')+">")
            arrHtml.push("<span colno='SHARP2D_RESULT' class='"+ms.uiClass(formId, 'SHARP2D_RESULT')+"' ='"+ms.uiStyle(formId, 'SHARP2D_RESULT')+"' "+ms.uiEvent(formId, 'SHARP2D_RESULT')+" title='"+ms.titleAttr(formId,'SHARP2D_RESULT','IS_TITLE_ATTR',v)+"' >"+v['SHARP2D_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP2D_VALUE' name='noprintset_SHARP2D_VALUE' class='datagrid-cell  "+ms.tdClass(formId, 'SHARP2D_VALUE')+"' style='"+ms.tdStyle(formId, 'SHARP2D_VALUE')+"' "+ms.tdEvent(formId, 'SHARP2D_VALUE')+">")
            arrHtml.push("<span colno='SHARP2D_VALUE' class='"+ms.uiClass(formId, 'SHARP2D_VALUE')+"' style='"+ms.uiStyle(formId, 'SHARP2D_VALUE')+"' "+ms.uiEvent(formId, 'SHARP2D_VALUE')+" title='"+ms.titleAttr(formId,'SHARP2D_VALUE','IS_TITLE_ATTR',v)+"' >"+v['SHARP2D_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP3D_NGUPPERLIMIT' name='noprintset_SHARP3D_NGUPPERLIMIT' class='datagrid-cell  "+ms.tdClass(formId, 'SHARP3D_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'SHARP3D_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'SHARP3D_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='SHARP3D_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'SHARP3D_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'SHARP3D_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'SHARP3D_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'SHARP3D_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['SHARP3D_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP3D_RESULT' name='noprintset_SHARP3D_RESULT' class='datagrid-cell  "+ms.tdClass(formId, 'SHARP3D_RESULT')+"' style='"+ms.tdStyle(formId, 'SHARP3D_RESULT')+"' "+ms.tdEvent(formId, 'SHARP3D_RESULT')+">")
            arrHtml.push("<span colno='SHARP3D_RESULT' class='"+ms.uiClass(formId, 'SHARP3D_RESULT')+"' style='"+ms.uiStyle(formId, 'SHARP3D_RESULT')+"' "+ms.uiEvent(formId, 'SHARP3D_RESULT')+" title='"+ms.titleAttr(formId,'SHARP3D_RESULT','IS_TITLE_ATTR',v)+"' >"+v['SHARP3D_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP3D_VALUE' name='noprintset_SHARP3D_VALUE' class='datagrid-cell  "+ms.tdClass(formId, 'SHARP3D_VALUE')+"' style='"+ms.tdStyle(formId, 'SHARP3D_VALUE')+"' "+ms.tdEvent(formId, 'SHARP3D_VALUE')+">")
            arrHtml.push("<span colno='SHARP3D_VALUE' class='"+ms.uiClass(formId, 'SHARP3D_VALUE')+"' style='"+ms.uiStyle(formId, 'SHARP3D_VALUE')+"' "+ms.uiEvent(formId, 'SHARP3D_VALUE')+" title='"+ms.titleAttr(formId,'SHARP3D_VALUE','IS_TITLE_ATTR',v)+"' >"+v['SHARP3D_VALUE']+"</span>")
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
    if(formId=='3a5cbd1740994e04b2a6c10379f1561f'){<%--SPI测试详情--%>
        $.each(uiTxt,function(i,v){
            var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
            arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
            arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
            getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
            arrHtml.push("<td colno='RESULT_ID' name='noprintset_RESULT_ID' class='datagrid-cell "+ms.tdClass(formId, 'RESULT_ID')+"' style='"+ms.tdStyle(formId, 'RESULT_ID')+"' "+ms.tdEvent(formId, 'RESULT_ID')+">")
            arrHtml.push("<span colno='RESULT_ID' class='"+ms.uiClass(formId, 'RESULT_ID')+"' style='"+ms.uiStyle(formId, 'RESULT_ID')+"' "+ms.uiEvent(formId, 'RESULT_ID')+" title='"+ms.titleAttr(formId,'RESULT_ID','IS_TITLE_ATTR',v)+"' >"+v['RESULT_ID']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AXISNO' name='noprintset_AXISNO' class='datagrid-cell none "+ms.tdClass(formId, 'AXISNO')+"' style='"+ms.tdStyle(formId, 'AXISNO')+"' "+ms.tdEvent(formId, 'AXISNO')+">")
            arrHtml.push("<span colno='AXISNO' class='"+ms.uiClass(formId, 'AXISNO')+"' style='"+ms.uiStyle(formId, 'AXISNO')+"' "+ms.uiEvent(formId, 'AXISNO')+" title='"+ms.titleAttr(formId,'AXISNO','IS_TITLE_ATTR',v)+"' >"+v['AXISNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BLOCKNO' name='noprintset_BLOCKNO' class='datagrid-cell none "+ms.tdClass(formId, 'BLOCKNO')+"' style='"+ms.tdStyle(formId, 'BLOCKNO')+"' "+ms.tdEvent(formId, 'BLOCKNO')+">")
            arrHtml.push("<span colno='BLOCKNO' class='"+ms.uiClass(formId, 'BLOCKNO')+"' style='"+ms.uiStyle(formId, 'BLOCKNO')+"' "+ms.uiEvent(formId, 'BLOCKNO')+" title='"+ms.titleAttr(formId,'BLOCKNO','IS_TITLE_ATTR',v)+"' >"+v['BLOCKNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='BRIDGE' name='noprintset_BRIDGE' class='datagrid-cell none "+ms.tdClass(formId, 'BRIDGE')+"' style='"+ms.tdStyle(formId, 'BRIDGE')+"' "+ms.tdEvent(formId, 'BRIDGE')+">")
            arrHtml.push("<span colno='BRIDGE' class='"+ms.uiClass(formId, 'BRIDGE')+"' style='"+ms.uiStyle(formId, 'BRIDGE')+"' "+ms.uiEvent(formId, 'BRIDGE')+" title='"+ms.titleAttr(formId,'BRIDGE','IS_TITLE_ATTR',v)+"' >"+v['BRIDGE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CENTERX' name='noprintset_CENTERX' class='datagrid-cell none "+ms.tdClass(formId, 'CENTERX')+"' style='"+ms.tdStyle(formId, 'CENTERX')+"' "+ms.tdEvent(formId, 'CENTERX')+">")
            arrHtml.push("<span colno='CENTERX' class='"+ms.uiClass(formId, 'CENTERX')+"' style='"+ms.uiStyle(formId, 'CENTERX')+"' "+ms.uiEvent(formId, 'CENTERX')+" title='"+ms.titleAttr(formId,'CENTERX','IS_TITLE_ATTR',v)+"' >"+v['CENTERX']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CENTERY' name='noprintset_CENTERY' class='datagrid-cell none "+ms.tdClass(formId, 'CENTERY')+"' style='"+ms.tdStyle(formId, 'CENTERY')+"' "+ms.tdEvent(formId, 'CENTERY')+">")
            arrHtml.push("<span colno='CENTERY' class='"+ms.uiClass(formId, 'CENTERY')+"' style='"+ms.uiStyle(formId, 'CENTERY')+"' "+ms.uiEvent(formId, 'CENTERY')+" title='"+ms.titleAttr(formId,'CENTERY','IS_TITLE_ATTR',v)+"' >"+v['CENTERY']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='COMPONENT' name='noprintset_COMPONENT' class='datagrid-cell "+ms.tdClass(formId, 'COMPONENT')+"' style='"+ms.tdStyle(formId, 'COMPONENT')+"' "+ms.tdEvent(formId, 'COMPONENT')+">")
            arrHtml.push("<span colno='COMPONENT' class='"+ms.uiClass(formId, 'COMPONENT')+"' style='"+ms.uiStyle(formId, 'COMPONENT')+"' "+ms.uiEvent(formId, 'COMPONENT')+" title='"+ms.titleAttr(formId,'COMPONENT','IS_TITLE_ATTR',v)+"' >"+v['COMPONENT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CONFIGURATIONNO' name='noprintset_CONFIGURATIONNO' class='datagrid-cell none "+ms.tdClass(formId, 'CONFIGURATIONNO')+"' style='"+ms.tdStyle(formId, 'CONFIGURATIONNO')+"' "+ms.tdEvent(formId, 'CONFIGURATIONNO')+">")
            arrHtml.push("<span colno='CONFIGURATIONNO' class='"+ms.uiClass(formId, 'CONFIGURATIONNO')+"' style='"+ms.uiStyle(formId, 'CONFIGURATIONNO')+"' "+ms.uiEvent(formId, 'CONFIGURATIONNO')+" title='"+ms.titleAttr(formId,'CONFIGURATIONNO','IS_TITLE_ATTR',v)+"' >"+v['CONFIGURATIONNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MASKTHICKNESS' name='noprintset_MASKTHICKNESS' class='datagrid-cell none "+ms.tdClass(formId, 'MASKTHICKNESS')+"' style='"+ms.tdStyle(formId, 'MASKTHICKNESS')+"' "+ms.tdEvent(formId, 'MASKTHICKNESS')+">")
            arrHtml.push("<span colno='MASKTHICKNESS' class='"+ms.uiClass(formId, 'MASKTHICKNESS')+"' style='"+ms.uiStyle(formId, 'MASKTHICKNESS')+"' "+ms.uiEvent(formId, 'MASKTHICKNESS')+" title='"+ms.titleAttr(formId,'MASKTHICKNESS','IS_TITLE_ATTR',v)+"' >"+v['MASKTHICKNESS']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='MOUNTBLOCKNO' name='noprintset_MOUNTBLOCKNO' class='datagrid-cell none "+ms.tdClass(formId, 'MOUNTBLOCKNO')+"' style='"+ms.tdStyle(formId, 'MOUNTBLOCKNO')+"' "+ms.tdEvent(formId, 'MOUNTBLOCKNO')+">")
            arrHtml.push("<span colno='MOUNTBLOCKNO' class='"+ms.uiClass(formId, 'MOUNTBLOCKNO')+"' style='"+ms.uiStyle(formId, 'MOUNTBLOCKNO')+"' "+ms.uiEvent(formId, 'MOUNTBLOCKNO')+" title='"+ms.titleAttr(formId,'MOUNTBLOCKNO','IS_TITLE_ATTR',v)+"' >"+v['MOUNTBLOCKNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='PADNO' name='noprintset_PADNO' class='datagrid-cell "+ms.tdClass(formId, 'PADNO')+"' style='"+ms.tdStyle(formId, 'PADNO')+"' "+ms.tdEvent(formId, 'PADNO')+">")
            arrHtml.push("<span colno='PADNO' class='"+ms.uiClass(formId, 'PADNO')+"' style='"+ms.uiStyle(formId, 'PADNO')+"' "+ms.uiEvent(formId, 'PADNO')+" title='"+ms.titleAttr(formId,'PADNO','IS_TITLE_ATTR',v)+"' >"+v['PADNO']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESULT' name='noprintset_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'RESULT')+"' style='"+ms.tdStyle(formId, 'RESULT')+"' "+ms.tdEvent(formId, 'RESULT')+">")
            arrHtml.push("<span colno='RESULT' class='"+ms.uiClass(formId, 'RESULT')+"' style='"+ms.uiStyle(formId, 'RESULT')+"' "+ms.uiEvent(formId, 'RESULT')+" title='"+ms.titleAttr(formId,'RESULT','IS_TITLE_ATTR',v)+"' >"+v['RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NGLOWERLIMIT' name='noprintset_AREA_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'AREA_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'AREA_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='AREA_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'AREA_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'AREA_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'AREA_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'AREA_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['AREA_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_NGUPPERLIMIT' name='noprintset_AREA_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'AREA_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'AREA_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'AREA_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='AREA_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'AREA_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'AREA_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'AREA_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'AREA_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['AREA_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_RESULT' name='noprintset_AREA_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'AREA_RESULT')+"' style='"+ms.tdStyle(formId, 'AREA_RESULT')+"' "+ms.tdEvent(formId, 'AREA_RESULT')+">")
            arrHtml.push("<span colno='AREA_RESULT' class='"+ms.uiClass(formId, 'AREA_RESULT')+"' style='"+ms.uiStyle(formId, 'AREA_RESULT')+"' "+ms.uiEvent(formId, 'AREA_RESULT')+" title='"+ms.titleAttr(formId,'AREA_RESULT','IS_TITLE_ATTR',v)+"' >"+v['AREA_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_VALUE' name='noprintset_AREA_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'AREA_VALUE')+"' style='"+ms.tdStyle(formId, 'AREA_VALUE')+"' "+ms.tdEvent(formId, 'AREA_VALUE')+">")
            arrHtml.push("<span colno='AREA_VALUE' class='"+ms.uiClass(formId, 'AREA_VALUE')+"' style='"+ms.uiStyle(formId, 'AREA_VALUE')+"' "+ms.uiEvent(formId, 'AREA_VALUE')+" title='"+ms.titleAttr(formId,'AREA_VALUE','IS_TITLE_ATTR',v)+"' >"+v['AREA_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_WARNLOWERLIMIT' name='noprintset_AREA_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'AREA_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'AREA_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'AREA_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='AREA_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'AREA_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'AREA_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'AREA_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'AREA_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['AREA_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='AREA_WARNUPPERLIMIT' name='noprintset_AREA_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'AREA_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'AREA_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'AREA_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='AREA_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'AREA_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'AREA_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'AREA_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'AREA_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['AREA_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_NGLOWERLIMIT' name='noprintset_CROSS_NGLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'CROSS_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'CROSS_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='CROSS_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'CROSS_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'CROSS_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'CROSS_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'CROSS_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_NGUPPERLIMIT' name='noprintset_CROSS_NGUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'CROSS_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'CROSS_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='CROSS_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'CROSS_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'CROSS_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'CROSS_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'CROSS_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_RESULT' name='noprintset_CROSS_RESULT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_RESULT')+"' style='"+ms.tdStyle(formId, 'CROSS_RESULT')+"' "+ms.tdEvent(formId, 'CROSS_RESULT')+">")
            arrHtml.push("<span colno='CROSS_RESULT' class='"+ms.uiClass(formId, 'CROSS_RESULT')+"' style='"+ms.uiStyle(formId, 'CROSS_RESULT')+"' "+ms.uiEvent(formId, 'CROSS_RESULT')+" title='"+ms.titleAttr(formId,'CROSS_RESULT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_VALUE' name='noprintset_CROSS_VALUE' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_VALUE')+"' style='"+ms.tdStyle(formId, 'CROSS_VALUE')+"' "+ms.tdEvent(formId, 'CROSS_VALUE')+">")
            arrHtml.push("<span colno='CROSS_VALUE' class='"+ms.uiClass(formId, 'CROSS_VALUE')+"' style='"+ms.uiStyle(formId, 'CROSS_VALUE')+"' "+ms.uiEvent(formId, 'CROSS_VALUE')+" title='"+ms.titleAttr(formId,'CROSS_VALUE','IS_TITLE_ATTR',v)+"' >"+v['CROSS_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_WARNLOWERLIMIT' name='noprintset_CROSS_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'CROSS_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'CROSS_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='CROSS_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'CROSS_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'CROSS_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'CROSS_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'CROSS_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='CROSS_WARNUPPERLIMIT' name='noprintset_CROSS_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'CROSS_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'CROSS_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'CROSS_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='CROSS_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'CROSS_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'CROSS_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'CROSS_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'CROSS_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['CROSS_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_NGLOWERLIMIT' name='noprintset_HEIGHT_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'HEIGHT_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'HEIGHT_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='HEIGHT_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'HEIGHT_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'HEIGHT_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'HEIGHT_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_NGUPPERLIMIT' name='noprintset_HEIGHT_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'HEIGHT_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'HEIGHT_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='HEIGHT_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'HEIGHT_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'HEIGHT_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'HEIGHT_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_RESULT' name='noprintset_HEIGHT_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'HEIGHT_RESULT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_RESULT')+"' "+ms.tdEvent(formId, 'HEIGHT_RESULT')+">")
            arrHtml.push("<span colno='HEIGHT_RESULT' class='"+ms.uiClass(formId, 'HEIGHT_RESULT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_RESULT')+"' "+ms.uiEvent(formId, 'HEIGHT_RESULT')+" title='"+ms.titleAttr(formId,'HEIGHT_RESULT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_VALUE' name='noprintset_HEIGHT_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'HEIGHT_VALUE')+"' style='"+ms.tdStyle(formId, 'HEIGHT_VALUE')+"' "+ms.tdEvent(formId, 'HEIGHT_VALUE')+">")
            arrHtml.push("<span colno='HEIGHT_VALUE' class='"+ms.uiClass(formId, 'HEIGHT_VALUE')+"' style='"+ms.uiStyle(formId, 'HEIGHT_VALUE')+"' "+ms.uiEvent(formId, 'HEIGHT_VALUE')+" title='"+ms.titleAttr(formId,'HEIGHT_VALUE','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_WARNLOWERLIMIT' name='noprintset_HEIGHT_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'HEIGHT_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'HEIGHT_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='HEIGHT_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'HEIGHT_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'HEIGHT_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'HEIGHT_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='HEIGHT_WARNUPPERLIMIT' name='noprintset_HEIGHT_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'HEIGHT_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'HEIGHT_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'HEIGHT_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='HEIGHT_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'HEIGHT_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'HEIGHT_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'HEIGHT_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'HEIGHT_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['HEIGHT_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_NGLOWERLIMIT' name='noprintset_NOPASTE_NGLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'NOPASTE_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='NOPASTE_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'NOPASTE_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'NOPASTE_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'NOPASTE_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_NGUPPERLIMIT' name='noprintset_NOPASTE_NGUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'NOPASTE_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='NOPASTE_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'NOPASTE_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'NOPASTE_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'NOPASTE_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_RESULT' name='noprintset_NOPASTE_RESULT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_RESULT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_RESULT')+"' "+ms.tdEvent(formId, 'NOPASTE_RESULT')+">")
            arrHtml.push("<span colno='NOPASTE_RESULT' class='"+ms.uiClass(formId, 'NOPASTE_RESULT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_RESULT')+"' "+ms.uiEvent(formId, 'NOPASTE_RESULT')+" title='"+ms.titleAttr(formId,'NOPASTE_RESULT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_VALUE' name='noprintset_NOPASTE_VALUE' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_VALUE')+"' style='"+ms.tdStyle(formId, 'NOPASTE_VALUE')+"' "+ms.tdEvent(formId, 'NOPASTE_VALUE')+">")
            arrHtml.push("<span colno='NOPASTE_VALUE' class='"+ms.uiClass(formId, 'NOPASTE_VALUE')+"' style='"+ms.uiStyle(formId, 'NOPASTE_VALUE')+"' "+ms.uiEvent(formId, 'NOPASTE_VALUE')+" title='"+ms.titleAttr(formId,'NOPASTE_VALUE','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_WARNLOWERLIMIT' name='noprintset_NOPASTE_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'NOPASTE_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='NOPASTE_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'NOPASTE_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'NOPASTE_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'NOPASTE_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='NOPASTE_WARNUPPERLIMIT' name='noprintset_NOPASTE_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'NOPASTE_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'NOPASTE_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'NOPASTE_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='NOPASTE_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'NOPASTE_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'NOPASTE_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'NOPASTE_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'NOPASTE_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['NOPASTE_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_NGLOWERLIMIT' name='noprintset_OFFSETX_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETX_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETX_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETX_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'OFFSETX_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETX_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETX_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_NGUPPERLIMIT' name='noprintset_OFFSETX_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETX_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETX_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETX_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'OFFSETX_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETX_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETX_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_RESULT' name='noprintset_OFFSETX_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETX_RESULT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_RESULT')+"' "+ms.tdEvent(formId, 'OFFSETX_RESULT')+">")
            arrHtml.push("<span colno='OFFSETX_RESULT' class='"+ms.uiClass(formId, 'OFFSETX_RESULT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_RESULT')+"' "+ms.uiEvent(formId, 'OFFSETX_RESULT')+" title='"+ms.titleAttr(formId,'OFFSETX_RESULT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_VALUE' name='noprintset_OFFSETX_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETX_VALUE')+"' style='"+ms.tdStyle(formId, 'OFFSETX_VALUE')+"' "+ms.tdEvent(formId, 'OFFSETX_VALUE')+">")
            arrHtml.push("<span colno='OFFSETX_VALUE' class='"+ms.uiClass(formId, 'OFFSETX_VALUE')+"' style='"+ms.uiStyle(formId, 'OFFSETX_VALUE')+"' "+ms.uiEvent(formId, 'OFFSETX_VALUE')+" title='"+ms.titleAttr(formId,'OFFSETX_VALUE','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_WARNLOWERLIMIT' name='noprintset_OFFSETX_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'OFFSETX_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETX_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETX_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'OFFSETX_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETX_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETX_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETX_WARNUPPERLIMIT' name='noprintset_OFFSETX_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'OFFSETX_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETX_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETX_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETX_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'OFFSETX_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETX_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETX_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETX_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETX_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_NGLOWERLIMIT' name='noprintset_OFFSETY_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETY_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETY_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETY_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'OFFSETY_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETY_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETY_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_NGUPPERLIMIT' name='noprintset_OFFSETY_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETY_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETY_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETY_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'OFFSETY_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETY_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETY_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_RESULT' name='noprintset_OFFSETY_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETY_RESULT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_RESULT')+"' "+ms.tdEvent(formId, 'OFFSETY_RESULT')+">")
            arrHtml.push("<span colno='OFFSETY_RESULT' class='"+ms.uiClass(formId, 'OFFSETY_RESULT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_RESULT')+"' "+ms.uiEvent(formId, 'OFFSETY_RESULT')+" title='"+ms.titleAttr(formId,'OFFSETY_RESULT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_VALUE' name='noprintset_OFFSETY_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'OFFSETY_VALUE')+"' style='"+ms.tdStyle(formId, 'OFFSETY_VALUE')+"' "+ms.tdEvent(formId, 'OFFSETY_VALUE')+">")
            arrHtml.push("<span colno='OFFSETY_VALUE' class='"+ms.uiClass(formId, 'OFFSETY_VALUE')+"' style='"+ms.uiStyle(formId, 'OFFSETY_VALUE')+"' "+ms.uiEvent(formId, 'OFFSETY_VALUE')+" title='"+ms.titleAttr(formId,'OFFSETY_VALUE','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_WARNLOWERLIMIT' name='noprintset_OFFSETY_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'OFFSETY_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETY_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETY_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'OFFSETY_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETY_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETY_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='OFFSETY_WARNUPPERLIMIT' name='noprintset_OFFSETY_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'OFFSETY_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'OFFSETY_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'OFFSETY_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='OFFSETY_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'OFFSETY_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'OFFSETY_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'OFFSETY_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'OFFSETY_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['OFFSETY_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_NGLOWERLIMIT' name='noprintset_RISE_NGLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'RISE_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'RISE_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='RISE_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'RISE_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'RISE_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'RISE_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'RISE_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['RISE_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_NGUPPERLIMIT' name='noprintset_RISE_NGUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'RISE_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'RISE_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='RISE_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'RISE_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'RISE_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'RISE_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'RISE_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['RISE_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_RESULT' name='noprintset_RISE_RESULT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_RESULT')+"' style='"+ms.tdStyle(formId, 'RISE_RESULT')+"' "+ms.tdEvent(formId, 'RISE_RESULT')+">")
            arrHtml.push("<span colno='RISE_RESULT' class='"+ms.uiClass(formId, 'RISE_RESULT')+"' style='"+ms.uiStyle(formId, 'RISE_RESULT')+"' "+ms.uiEvent(formId, 'RISE_RESULT')+" title='"+ms.titleAttr(formId,'RISE_RESULT','IS_TITLE_ATTR',v)+"' >"+v['RISE_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_VALUE' name='noprintset_RISE_VALUE' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_VALUE')+"' style='"+ms.tdStyle(formId, 'RISE_VALUE')+"' "+ms.tdEvent(formId, 'RISE_VALUE')+">")
            arrHtml.push("<span colno='RISE_VALUE' class='"+ms.uiClass(formId, 'RISE_VALUE')+"' style='"+ms.uiStyle(formId, 'RISE_VALUE')+"' "+ms.uiEvent(formId, 'RISE_VALUE')+" title='"+ms.titleAttr(formId,'RISE_VALUE','IS_TITLE_ATTR',v)+"' >"+v['RISE_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_WARNLOWERLIMIT' name='noprintset_RISE_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'RISE_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'RISE_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='RISE_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'RISE_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'RISE_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'RISE_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'RISE_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['RISE_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RISE_WARNUPPERLIMIT' name='noprintset_RISE_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'RISE_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'RISE_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'RISE_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='RISE_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'RISE_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'RISE_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'RISE_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'RISE_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['RISE_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_NGLOWERLIMIT' name='noprintset_VOLUME_NGLOWERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'VOLUME_NGLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'VOLUME_NGLOWERLIMIT')+"' "+ms.tdEvent(formId, 'VOLUME_NGLOWERLIMIT')+">")
            arrHtml.push("<span colno='VOLUME_NGLOWERLIMIT' class='"+ms.uiClass(formId, 'VOLUME_NGLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'VOLUME_NGLOWERLIMIT')+"' "+ms.uiEvent(formId, 'VOLUME_NGLOWERLIMIT')+" title='"+ms.titleAttr(formId,'VOLUME_NGLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_NGLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_NGUPPERLIMIT' name='noprintset_VOLUME_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'VOLUME_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'VOLUME_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'VOLUME_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='VOLUME_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'VOLUME_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'VOLUME_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'VOLUME_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'VOLUME_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_RESULT' name='noprintset_VOLUME_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'VOLUME_RESULT')+"' style='"+ms.tdStyle(formId, 'VOLUME_RESULT')+"' "+ms.tdEvent(formId, 'VOLUME_RESULT')+">")
            arrHtml.push("<span colno='VOLUME_RESULT' class='"+ms.uiClass(formId, 'VOLUME_RESULT')+"' style='"+ms.uiStyle(formId, 'VOLUME_RESULT')+"' "+ms.uiEvent(formId, 'VOLUME_RESULT')+" title='"+ms.titleAttr(formId,'VOLUME_RESULT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_VALUE' name='noprintset_VOLUME_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'VOLUME_VALUE')+"' style='"+ms.tdStyle(formId, 'VOLUME_VALUE')+"' "+ms.tdEvent(formId, 'VOLUME_VALUE')+">")
            arrHtml.push("<span colno='VOLUME_VALUE' class='"+ms.uiClass(formId, 'VOLUME_VALUE')+"' style='"+ms.uiStyle(formId, 'VOLUME_VALUE')+"' "+ms.uiEvent(formId, 'VOLUME_VALUE')+" title='"+ms.titleAttr(formId,'VOLUME_VALUE','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_VALUE']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_WARNLOWERLIMIT' name='noprintset_VOLUME_WARNLOWERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'VOLUME_WARNLOWERLIMIT')+"' style='"+ms.tdStyle(formId, 'VOLUME_WARNLOWERLIMIT')+"' "+ms.tdEvent(formId, 'VOLUME_WARNLOWERLIMIT')+">")
            arrHtml.push("<span colno='VOLUME_WARNLOWERLIMIT' class='"+ms.uiClass(formId, 'VOLUME_WARNLOWERLIMIT')+"' style='"+ms.uiStyle(formId, 'VOLUME_WARNLOWERLIMIT')+"' "+ms.uiEvent(formId, 'VOLUME_WARNLOWERLIMIT')+" title='"+ms.titleAttr(formId,'VOLUME_WARNLOWERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_WARNLOWERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='VOLUME_WARNUPPERLIMIT' name='noprintset_VOLUME_WARNUPPERLIMIT' class='datagrid-cell none "+ms.tdClass(formId, 'VOLUME_WARNUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'VOLUME_WARNUPPERLIMIT')+"' "+ms.tdEvent(formId, 'VOLUME_WARNUPPERLIMIT')+">")
            arrHtml.push("<span colno='VOLUME_WARNUPPERLIMIT' class='"+ms.uiClass(formId, 'VOLUME_WARNUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'VOLUME_WARNUPPERLIMIT')+"' "+ms.uiEvent(formId, 'VOLUME_WARNUPPERLIMIT')+" title='"+ms.titleAttr(formId,'VOLUME_WARNUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['VOLUME_WARNUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESERVED1' name='noprintset_RESERVED1' class='datagrid-cell none "+ms.tdClass(formId, 'RESERVED1')+"' style='"+ms.tdStyle(formId, 'RESERVED1')+"' "+ms.tdEvent(formId, 'RESERVED1')+">")
            arrHtml.push("<span colno='RESERVED1' class='"+ms.uiClass(formId, 'RESERVED1')+"' style='"+ms.uiStyle(formId, 'RESERVED1')+"' "+ms.uiEvent(formId, 'RESERVED1')+" title='"+ms.titleAttr(formId,'RESERVED1','IS_TITLE_ATTR',v)+"' >"+v['RESERVED1']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESERVED2' name='noprintset_RESERVED2' class='datagrid-cell none "+ms.tdClass(formId, 'RESERVED2')+"' style='"+ms.tdStyle(formId, 'RESERVED2')+"' "+ms.tdEvent(formId, 'RESERVED2')+">")
            arrHtml.push("<span colno='RESERVED2' class='"+ms.uiClass(formId, 'RESERVED2')+"' style='"+ms.uiStyle(formId, 'RESERVED2')+"' "+ms.uiEvent(formId, 'RESERVED2')+" title='"+ms.titleAttr(formId,'RESERVED2','IS_TITLE_ATTR',v)+"' >"+v['RESERVED2']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESERVED3' name='noprintset_RESERVED3' class='datagrid-cell none "+ms.tdClass(formId, 'RESERVED3')+"' style='"+ms.tdStyle(formId, 'RESERVED3')+"' "+ms.tdEvent(formId, 'RESERVED3')+">")
            arrHtml.push("<span colno='RESERVED3' class='"+ms.uiClass(formId, 'RESERVED3')+"' style='"+ms.uiStyle(formId, 'RESERVED3')+"' "+ms.uiEvent(formId, 'RESERVED3')+" title='"+ms.titleAttr(formId,'RESERVED3','IS_TITLE_ATTR',v)+"' >"+v['RESERVED3']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='RESERVED4' name='noprintset_RESERVED4' class='datagrid-cell none "+ms.tdClass(formId, 'RESERVED4')+"' style='"+ms.tdStyle(formId, 'RESERVED4')+"' "+ms.tdEvent(formId, 'RESERVED4')+">")
            arrHtml.push("<span colno='RESERVED4' class='"+ms.uiClass(formId, 'RESERVED4')+"' style='"+ms.uiStyle(formId, 'RESERVED4')+"' "+ms.uiEvent(formId, 'RESERVED4')+" title='"+ms.titleAttr(formId,'RESERVED4','IS_TITLE_ATTR',v)+"' >"+v['RESERVED4']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='SHARP2D_NGUPPERLIMIT' name='noprintset_SHARP2D_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'SHARP2D_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'SHARP2D_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'SHARP2D_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='SHARP2D_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'SHARP2D_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'SHARP2D_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'SHARP2D_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'SHARP2D_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['SHARP2D_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP2D_RESULT' name='noprintset_SHARP2D_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'SHARP2D_RESULT')+"' style='"+ms.tdStyle(formId, 'SHARP2D_RESULT')+"' "+ms.tdEvent(formId, 'SHARP2D_RESULT')+">")
            arrHtml.push("<span colno='SHARP2D_RESULT' class='"+ms.uiClass(formId, 'SHARP2D_RESULT')+"' style='"+ms.uiStyle(formId, 'SHARP2D_RESULT')+"' "+ms.uiEvent(formId, 'SHARP2D_RESULT')+" title='"+ms.titleAttr(formId,'SHARP2D_RESULT','IS_TITLE_ATTR',v)+"' >"+v['SHARP2D_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP2D_VALUE' name='noprintset_SHARP2D_VALUE' class='datagrid-cell "+ms.tdClass(formId, 'SHARP2D_VALUE')+"' style='"+ms.tdStyle(formId, 'SHARP2D_VALUE')+"' "+ms.tdEvent(formId, 'SHARP2D_VALUE')+">")
            arrHtml.push("<span colno='SHARP2D_VALUE' class='"+ms.uiClass(formId, 'SHARP2D_VALUE')+"' style='"+ms.uiStyle(formId, 'SHARP2D_VALUE')+"' "+ms.uiEvent(formId, 'SHARP2D_VALUE')+" title='"+ms.titleAttr(formId,'SHARP2D_VALUE','IS_TITLE_ATTR',v)+"' >"+v['SHARP2D_VALUE']+"</span>")
            arrHtml.push("</td>");
            
            arrHtml.push("<td colno='SHARP3D_NGUPPERLIMIT' name='noprintset_SHARP3D_NGUPPERLIMIT' class='datagrid-cell "+ms.tdClass(formId, 'SHARP3D_NGUPPERLIMIT')+"' style='"+ms.tdStyle(formId, 'SHARP3D_NGUPPERLIMIT')+"' "+ms.tdEvent(formId, 'SHARP3D_NGUPPERLIMIT')+">")
            arrHtml.push("<span colno='SHARP3D_NGUPPERLIMIT' class='"+ms.uiClass(formId, 'SHARP3D_NGUPPERLIMIT')+"' style='"+ms.uiStyle(formId, 'SHARP3D_NGUPPERLIMIT')+"' "+ms.uiEvent(formId, 'SHARP3D_NGUPPERLIMIT')+" title='"+ms.titleAttr(formId,'SHARP3D_NGUPPERLIMIT','IS_TITLE_ATTR',v)+"' >"+v['SHARP3D_NGUPPERLIMIT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP3D_RESULT' name='noprintset_SHARP3D_RESULT' class='datagrid-cell "+ms.tdClass(formId, 'SHARP3D_RESULT')+"' style='"+ms.tdStyle(formId, 'SHARP3D_RESULT')+"' "+ms.tdEvent(formId, 'SHARP3D_RESULT')+">")
            arrHtml.push("<span colno='SHARP3D_RESULT' class='"+ms.uiClass(formId, 'SHARP3D_RESULT')+"' style='"+ms.uiStyle(formId, 'SHARP3D_RESULT')+"' "+ms.uiEvent(formId, 'SHARP3D_RESULT')+" title='"+ms.titleAttr(formId,'SHARP3D_RESULT','IS_TITLE_ATTR',v)+"' >"+v['SHARP3D_RESULT']+"</span>")
            arrHtml.push("</td>");
            arrHtml.push("<td colno='SHARP3D_VALUE' name='noprintset_SHARP3D_VALUE' class='datagrid-cell  "+ms.tdClass(formId, 'SHARP3D_VALUE')+"' style='"+ms.tdStyle(formId, 'SHARP3D_VALUE')+"' "+ms.tdEvent(formId, 'SHARP3D_VALUE')+">")
            arrHtml.push("<span colno='SHARP3D_VALUE' class='"+ms.uiClass(formId, 'SHARP3D_VALUE')+"' style='"+ms.uiStyle(formId, 'SHARP3D_VALUE')+"' "+ms.uiEvent(formId, 'SHARP3D_VALUE')+" title='"+ms.titleAttr(formId,'SHARP3D_VALUE','IS_TITLE_ATTR',v)+"' >"+v['SHARP3D_VALUE']+"</span>")
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
function listAjaxTable(){}
function listAjaxTableThis(formId){
                    var currentPage="";
                    var pageRecord="";
                    var isFirstLoad;
                    //var url = "/N2/buss/bussModel_listMsData.ms?uiRaw="+"{\""+formId+"\":\"CREATE_TIME,CREATE_USER\"}";
                    var url = "/N2/buss/bussModel_listMsData.ms";
                    var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
                    if(isPage(formId)){
                        var isFirstLoad = firstLoadThisPage(formId);
                        var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
                        var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
                    }
                    util.showLoading("处理中...");
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: url,
                        data:searchParams+"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
                        success: function(data){
                            if(data.RES){
                                var ms = new MSdata(data);
                                var page = ms.page(formId);
                                createTableModel(ms,formId);
                                if(isPage(formId)){
                                    initPage(page,formId);
                                }
                            }else{
                                utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                            }
                            clearChildTable();
                        	util.closeLoading();
                        },
                        error: function(msg){
                        	if(msg.readyState!=0){
				              util.closeLoading();
				              utilsFp.confirmIcon(3,"","","", msg,"","260","145");
                            }
                        }
                    });
                }
    function query(){
        listAjaxTableThis($("#formId1").val());
    }
    $(function(){
        $(".search_table td").first().hide();
        $(".search_table td").eq(1).hide();
        $(".search-box_1").show();
        $(".search_table input").first().val(getUrlParam("dataId"));
        query();
    });
    //获取地址参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg); //匹配目标参数
        if (r != null) return unescape(r[2]);
        return null; //返回参数值
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
