<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<!-- head里面 -->
	  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
	     <jsp:param name="modelName" value="VIEW_TYPE_18" />
	     <jsp:param name="location" value="inHead" />
	  </jsp:include>
</head>
<body style="background-color:#fff;overflow:hidden;">
	<div class="edit">
			<div class="bd" style="border: none">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="c5a94bc73341487cb6fc5f9c0ee93e9d" />
	<input type="hidden" name="c5a94bc73341487cb6fc5f9c0ee93e9d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'178a85de4d56444d9d431eace0fee0d7'" />
		<s:set name="_$formId_1" value="'c5a94bc73341487cb6fc5f9c0ee93e9d'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_CODE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_NAME" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_TYPE" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_LEVEL" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" /></td>
			<bu:td cssClass="dec" colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" ><bu:ui colNo="CEC_DESC" formId="c5a94bc73341487cb6fc5f9c0ee93e9d" dataId="${dataId}" formIndex="1" style="height:80px;width:230px;"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="c5a94bc73341487cb6fc5f9c0ee93e9d" formIndex="1" />
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
    <script>
        	$(function(){
        	    $('.dialog-bd',parent.document).css('padding-top','0');
        	})
    </script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>