<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
	
			<!-- head里面 -->
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
  <!-- 产品静态资源 -->

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="640840a5c9ad4beba8b135096ed4ce00" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="640840a5c9ad4beba8b135096ed4ce00" />
	<input type="hidden" id="prefixInd" name="640840a5c9ad4beba8b135096ed4ce00" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'91d817c32deb4b06a224983819ed58ce'" />
		<s:set name="_$formId_1" value="'640840a5c9ad4beba8b135096ed4ce00'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
			<bu:td cssClass="dec-self" colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="THRESHOLD_TYPE" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
			<bu:td cssClass="dec-self" colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="FACTORY_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
			<bu:td cssClass="dec-self" colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="WORK_STATION_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name-six" /><bu:uitn colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
			<bu:td cssClass="dec-self" colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="ITEM_CODE" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" /></td>
			<bu:td cssClass="dec-self" colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" ><bu:ui colNo="THRESHOLD_NUM" formId="640840a5c9ad4beba8b135096ed4ce00" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="640840a5c9ad4beba8b135096ed4ce00" formIndex="1" />		<div style="padding:1px;"></div>
		<%--
		<bu:form viewId="91d817c32deb4b06a224983819ed58ce" formId="ec7d8835a55f4dfbae645cf1192a6a97" isSubForm="1" list="dataListSub" formidFirstId="640840a5c9ad4beba8b135096ed4ce00" relColIds="" subFormIds="" subRelColIds="" />
		--%>
		<div class="mod" >
			<div class="mod-hd">
				<h3 class="tit"><dict:lang value="量级配置" /></h3>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-innerec7d8835a55f4dfbae645cf1192a6a97">
								<bu:addSub formid="640840a5c9ad4beba8b135096ed4ce00" formIndex="2"  selfformid="ec7d8835a55f4dfbae645cf1192a6a97" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'ec7d8835a55f4dfbae645cf1192a6a97')" >
							<table class="glxb-table" style="width:100%" id="addTable_ec7d8835a55f4dfbae645cf1192a6a97" >
								<tbody id="tbody_ec7d8835a55f4dfbae645cf1192a6a97" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script>
		function initEditDataLs(){
			getEditRows("ec7d8835a55f4dfbae645cf1192a6a97","2","640840a5c9ad4beba8b135096ed4ce00","","a86f0d2967e04ae2bb95a9aa8dfb8a02","");
			$('table').find('tbody tr:eq(0)').click();
		}
	</script>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
  	
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<script>
	debugger;
	$("input[id$='_LEVEL_NAME']").attr("readonly",true);
	$("input[id$='_LEVEL_LOW']").attr("readonly",true);
	$("input[id$='_LEVEL_HIGHT']").attr("readonly",true);
	$("input[id$='_THRESHOLD_NUM']").attr("readonly",true);
</script>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
