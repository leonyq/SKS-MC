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
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="394edf1e00694f07926e12e70ddeb7bb" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="394edf1e00694f07926e12e70ddeb7bb" />
	<input type="hidden" name="394edf1e00694f07926e12e70ddeb7bb" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'2f222a72f0f14fb78750a85e193f1c14'" />
		<s:set name="_$formId_1" value="'394edf1e00694f07926e12e70ddeb7bb'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CFO_FIX_SN" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_FIX_SN" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_FIX_SN" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFO_ITEM_TYPE" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_TYPE" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_ITEM_TYPE" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
	
			
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CFO_ITEM_CODE" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_CODE" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_ITEM_CODE" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CFO_ITEM_NAME" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_NAME" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_ITEM_NAME" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="CFO_ITEM_SPEC" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_SPEC" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_ITEM_SPEC" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFO_OPERATE_TYPE" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_OPERATE_TYPE" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_OPERATE_TYPE" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFO_OPERATE_TIME" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_OPERATE_TIME" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_OPERATE_TIME" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CFO_OPEATOR" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_OPEATOR" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_OPEATOR" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>	
        <tr>
            <td class="name" /><bu:uitn colNo="CFO_ITEM_CURUSER" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFO_ITEM_CURUSER" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui colNo="CFO_ITEM_CURUSER" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
        </tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CFI_MEMO" formId="394edf1e00694f07926e12e70ddeb7bb" /></td>
			<bu:td cssClass="dec" colNo="CFI_MEMO" colspan="4" formId="394edf1e00694f07926e12e70ddeb7bb" ><bu:ui style="height:80px;width:534px" colNo="CFI_MEMO" formId="394edf1e00694f07926e12e70ddeb7bb" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="394edf1e00694f07926e12e70ddeb7bb" formIndex="1" />
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
