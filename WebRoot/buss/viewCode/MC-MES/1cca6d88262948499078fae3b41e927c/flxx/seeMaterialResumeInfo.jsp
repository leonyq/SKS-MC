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
	  
	  <style>
	    .state{
            display: inline-block;
            width: 45px;
            height: 20px;
            line-height: 20px;
            color: #fff;
            text-align: center;
            font-size: 12px;
            border-radius: 2px;
        }
	  </style>
</head>
<body style="background-color:#fff;">
	<div class="edit">
			<div class="bd" style="border: none">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="62aabb92147842e1983bcfcda04f9a1d" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="62aabb92147842e1983bcfcda04f9a1d" />
	<input type="hidden" name="62aabb92147842e1983bcfcda04f9a1d" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f965a548d05c49c3a8612e7c73883ad6'" />
		<s:set name="_$formId_1" value="'62aabb92147842e1983bcfcda04f9a1d'" />
		<s:set name="_$type" value="'detail'"/>
		
		<tr>
			<td class="name" style="width:60px;"/><bu:uitn colNo="CTO_TIN_SN" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="CTO_TIN_SN" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_TIN_SN" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:60px;"/><bu:uitn colNo="CTO_OPERATE_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" style="width:235px;" colNo="CTO_OPERATE_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_OPERATE_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			
			<td class="name" /><bu:uitn colNo="CTO_ITEM_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="CTO_ITEM_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_ITEM_TYPE" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CTO_TIN_CODEE" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="CTO_TIN_CODEE" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_TIN_CODEE" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		
		<tr>
			<td class="name" /><bu:uitn colNo="CTO_TIN_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="CTO_TIN_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_TIN_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTO_TIN_SPEC" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="CTO_TIN_SPEC" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_TIN_SPEC" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTO_TIN_LOT" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="CTO_TIN_LOT" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_TIN_LOT" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CTO_SUPPLIER_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="CTO_SUPPLIER_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_SUPPLIER_NAME" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		
		<tr>
			<td class="name" /><bu:uitn colNo="CTO_OPERATE_TIME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="CTO_OPERATE_TIME" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="CTO_OPERATE_TIME" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="T2#NAME" formId="62aabb92147842e1983bcfcda04f9a1d" /></td>
			<bu:td cssClass="dec" colNo="T2#NAME" formId="62aabb92147842e1983bcfcda04f9a1d" ><bu:ui colNo="T2#NAME" formId="62aabb92147842e1983bcfcda04f9a1d" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="62aabb92147842e1983bcfcda04f9a1d" formIndex="1" />
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