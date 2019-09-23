<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
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
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
       <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="inHead" />
    </jsp:include>
           <script type="text/javascript">
        $(function() {
            $("#delSpan").find("span").css('display','none');
			$("#imgSw_paraMapObj_STATUS").attr("onclick",null);
           // document.getElementById("paraMapObj_PHONE_PATH_a").style.display = "none";
			
		 
		});

    </script>
</head>
<body>
	<div class="edit">
	<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
           
			<div class="bd" style="height:420px;">
							  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   				<jsp:param name="modelName" value="VIEW_TYPE_11" />
     				   				<jsp:param name="location" value="editForm" />
  					           </jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="4d5275f6a24f44119737918a3136a935" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="4d5275f6a24f44119737918a3136a935" />
	<input type="hidden" name="4d5275f6a24f44119737918a3136a935" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c8f8708aca88428f85620578951e524c'" />
		<s:set name="_$formId_1" value="'4d5275f6a24f44119737918a3136a935'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CUST_CODE" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUST_CODE" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
			<td class="name" rowspan="5" style="width:64px;vertical-align: bottom;"/><bu:uitn colNo="CUST_LOGO" formId="4d5275f6a24f44119737918a3136a935" /></td>
		        <td class="dec" rowspan="5" style="width:230px;vertical-align: bottom;" id="delSpan"><bu:ui colNo="PHONE_PATH" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CUSTOMER" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUSTOMER" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUST_ABBREVIATION" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUST_ABBREVIATION" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
		</tr>

		<tr>
			<td class="name" /><bu:uitn colNo="CUSTOMER_GRADE" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUSTOMER_GRADE" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="STATUS" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="STATUS" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>

			
		</tr>
				<tr>
		        <td class="name" /><bu:uitn colNo="CUST_BOM" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" ><bu:ui colNo="CUST_BOM" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" disabled="disabled"/></td>			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUST_ADDRESS" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="CUST_ADDRESS" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" style="width:100%;"  disabled="disabled"/></td>
		</tr>

		<tr>
			<td class="name" /><bu:uitn colNo="MEMO" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="MEMO" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" style="width:100%;height:80px;"  disabled="disabled"/></td>
			
		</tr>
		
		<tr style="display:none;">
			<td class="name" /><bu:uitn colNo="PHONE_PATH_S" formId="4d5275f6a24f44119737918a3136a935" /></td>		
               <td class="dec" colspan="3"> <bu:ui colNo="PHONE_PATH_S" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" />
            </td>
		</tr>
	</table>
			<bu:jsVal formId="4d5275f6a24f44119737918a3136a935" formIndex="1" />
									
			</div>
	</form>	
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<!-- js初始化方法 -->
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_11" />
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
     <jsp:param name="modelName" value="VIEW_TYPE_11" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
