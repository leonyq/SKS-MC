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
			<div class="bd" style="border: none;    height: 470px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c5b9c9cc6c8445029a1854920fc91303" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c5b9c9cc6c8445029a1854920fc91303" />
	<input type="hidden" name="c5b9c9cc6c8445029a1854920fc91303" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'91d60c4e09704179b4fb5d0492fb779b'" />
		<s:set name="_$formId_1" value="'c5b9c9cc6c8445029a1854920fc91303'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_DEVICE_SN" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_DEVICE_SN" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_DEVICE_SN" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CD_DEVICE_NAME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="T2#VALUE" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="T2#VALUE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="T2#VALUE" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_STOP_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_STOP_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_STOP_TYPE" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CDD_START_TIME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_DEVICE_NAME" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_START_TIME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name" />
			<bu:uitn colNo="CDD_END_TIME" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CDD_DEVICE_TYPE" formId="c5b9c9cc6c8445029a1854920fc91303">
				<bu:ui colNo="CDD_END_TIME" style="width:200px;" formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_STOP_REASON" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_STOP_REASON" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_STOP_REASON" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_TEMPORARY_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_TEMPORARY_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_TEMPORARY_METHOD" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_LONGTERM_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_LONGTERM_METHOD" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_LONGTERM_METHOD" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name" />
			<bu:uitn colNo="CDD_MEMO" formId="c5b9c9cc6c8445029a1854920fc91303" />
			</td>
			<bu:td cssClass="dec" colNo="CDD_MEMO" formId="c5b9c9cc6c8445029a1854920fc91303" style="height:80px;" colspan="5">
				<bu:ui colNo="CDD_MEMO" style="width:100%;height:100%"  formId="c5b9c9cc6c8445029a1854920fc91303" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
	</table>
			<bu:jsVal formId="c5b9c9cc6c8445029a1854920fc91303" formIndex="1" />
				</form>	
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

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
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
