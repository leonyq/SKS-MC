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
	<style>
		input[type="text"]{
			width:200px !important;
		}
		
.state {
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
		<bu:set name="paraMapObj" value="${dataId}" formId="f5784c7d07bc4bec819f984e32e761e7" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="f5784c7d07bc4bec819f984e32e761e7" />
	<input type="hidden" name="f5784c7d07bc4bec819f984e32e761e7" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'704ae2734c644363b22ed1dd8c970326'" />
		<s:set name="_$formId_1" value="'f5784c7d07bc4bec819f984e32e761e7'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:60px;"/><bu:uitn colNo="WID_ITEM_SN" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" style="width:200px" colNo="WID_ITEM_SN" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_ITEM_SN" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		
			<td class="name" style="width:60px;" /><bu:uitn colNo="WID_ITEM_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" style="width:200px" colNo="WID_ITEM_CODE" formId="f5784c7d07bc4bec819f984e32e761e7"  ><bu:ui colNo="WID_ITEM_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
	
			<td class="name" style="width:60px;" /><bu:uitn colNo="WID_ITEM_STATUS" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" style="width:200px" colNo="WID_ITEM_STATUS" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_ITEM_STATUS" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WID_UPLOAD_FLAG" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_UPLOAD_FLAG" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_UPLOAD_FLAG" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WID_DOC_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_DOC_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_DOC_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WID_SUP_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_SUP_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_SUP_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WID_CUST_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_CUST_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_CUST_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WID_WH_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_WH_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_WH_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WID_DISTRICT_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_DISTRICT_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_DISTRICT_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WID_STORAGE_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_STORAGE_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_STORAGE_CODE" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WID_STOCK_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_STOCK_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_STOCK_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WID_INVENTORY_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_INVENTORY_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_INVENTORY_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WID_PROFIT_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_PROFIT_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_PROFIT_NUM" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WID_UPLOAD_TIME" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_UPLOAD_TIME" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_UPLOAD_TIME" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WID_INVENTORY_TIME" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_INVENTORY_TIME" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_INVENTORY_TIME" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WID_INVENTORY_EMP" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_INVENTORY_EMP" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_INVENTORY_EMP" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
	
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WID_MEMO" formId="f5784c7d07bc4bec819f984e32e761e7" /></td>
			<bu:td cssClass="dec" colNo="WID_MEMO" colspan="5" formId="f5784c7d07bc4bec819f984e32e761e7" ><bu:ui colNo="WID_MEMO" formId="f5784c7d07bc4bec819f984e32e761e7" dataId="${dataId}" formIndex="1" style="width:100%;height:80px;" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="f5784c7d07bc4bec819f984e32e761e7" formIndex="1" />
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
