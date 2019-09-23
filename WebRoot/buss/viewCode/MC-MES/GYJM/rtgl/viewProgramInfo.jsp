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
<body>
	<div class="edit">
			<div class="bd"  style="height:400px;border:0;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="cc45a8ab4c87407090593be875962853" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cc45a8ab4c87407090593be875962853" />
	<input type="hidden" name="cc45a8ab4c87407090593be875962853" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'b61049cbd8104375858fa03ccb61532d'" />
		<s:set name="_$formId_1" value="'cc45a8ab4c87407090593be875962853'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_SN" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_NAME" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_PRODUCT_STEP" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_PROCESS_FACE" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_GROUP" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_MODEL_CODE" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853"  ><bu:ui colNo="CPI_MODEL_NAME" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name-three" /><bu:uitn colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853"  colspan="4"><bu:ui colNo="CPI_MODEL_SPEC" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_DEFAULT_FLAG" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_VERSION" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>

		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="EDIT_USER" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="EDIT_USER" formId="cc45a8ab4c87407090593be875962853"  ><bu:ui colNo="EDIT_USER" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>

			<td class="name-three" /><bu:uitn colNo="EDIT_TIME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="EDIT_TIME" formId="cc45a8ab4c87407090593be875962853"  ><bu:ui colNo="EDIT_TIME" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CPI_SYS_NAME" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_SYS_NAME" formId="cc45a8ab4c87407090593be875962853" ><bu:ui colNo="CPI_SYS_NAME" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CPI_MEMO" formId="cc45a8ab4c87407090593be875962853" /></td>
			<bu:td cssClass="dec-self" colNo="CPI_MEMO" formId="cc45a8ab4c87407090593be875962853"  style="height:80px;" colspan="3"><bu:ui colNo="CPI_MEMO" style="width: 93%;height: 100%;" formId="cc45a8ab4c87407090593be875962853" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
	</table>
			<bu:jsVal formId="cc45a8ab4c87407090593be875962853" formIndex="1" />
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
    	<script>
    	    	$(function(){
    	    	    $('.dialog-bd',parent.document).css('background-color','#fff');
    	    	})
    	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
