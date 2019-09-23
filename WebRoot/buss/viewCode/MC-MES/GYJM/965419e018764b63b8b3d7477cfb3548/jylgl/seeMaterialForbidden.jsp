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
	<style>
		.input {
		  width:300px !important;
		}
		#paraMapObj_CF_MEMO{
		  width:300px !important;
		}
	</style>
	
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
<body style="background-color:#fff">
	<div class="edit">
			<div class="bd" style="border: none">
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="09206fb514ca4b258beb531bc903334b" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="09206fb514ca4b258beb531bc903334b" />
	<input type="hidden" name="09206fb514ca4b258beb531bc903334b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a58a0fa941eb4f7d86a456e8bef6f072'" />
		<s:set name="_$formId_1" value="'09206fb514ca4b258beb531bc903334b'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
		<td class="name"  style="width:72px" /><span class="dot"></span><bu:uitn colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" id="CF_TYPE_T" /></td>
		<td class="dec"   style="width:300px"><bu:ui colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" onchange="select()" id="paraMap1_CF_TYPE" /></td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec" style="text-align:left;"><bu:ui colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1"/></td>
		</tr>
		<tr>
		<td class="name " ><bu:uitn colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" /></td>
                <td class="dec" ><bu:ui colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" id="CF_PROJECT_ID" /></td>
                </tr>
                <tr>
                <td class="name " ><bu:uitn colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
                <td class="dec"><bu:ui colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" id="MODEL_CODE" /></td>
		</tr>
					<tr>
						<td class="name"><bu:uitn colNo="CF_MODEL_CODE_VER" formId="09206fb514ca4b258beb531bc903334b"/></td>
						<td class="dec"><bu:ui style="width:300px;" colNo="CF_MODEL_CODE_VER" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" readonly="readonly" formIndex="1" id="CF_MODEL_CODE_VER" />
						</td>
					</tr>			
		<tr>
		<td class="name" /><bu:uitn colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui colNo="CF_ITEM_CODE" id="forbidden_code" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui id="CF_ITEM_NAME" colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
		<td class="name" /><bu:uitn colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td class="dec"><bu:ui id="CF_ITEM_DESC" colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" /></td>
		</tr>	
		<tr>
		<td class="name"/><bu:uitn colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" /></td>
		<td colspan="3" style="height:80px;" class="dec"><bu:ui colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" dataId="${dataId}" formIndex="1" style="width:230px;height:100%;" readonly="readonly"/></td>
		</tr>	
	</table>
			<bu:jsVal formId="09206fb514ca4b258beb531bc903334b" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>

</script>

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
