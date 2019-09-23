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
<body style="background-color:white;">
	<div class="edit">
			<div class="bd" style="border: none;height:300px;">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="fe2f562eab2645eea5c2c4131957c06c" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="fe2f562eab2645eea5c2c4131957c06c" />
	<input type="hidden" name="fe2f562eab2645eea5c2c4131957c06c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'3bdfa04c01884c13a33aeb5f42a44bca'" />
		<s:set name="_$formId_1" value="'fe2f562eab2645eea5c2c4131957c06c'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width: 100px;" /><bu:uitn colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_TEST_STEP" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width: 110px;"/><bu:uitn colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" style="width: 230px;" colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_SAMPLE_TYPE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_PRICESS_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CREATE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DIVIDE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DIVIDE_VALUE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_JUDGE_MODE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<!--<td class="name" /><bu:uitn colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_DEFAULT_FLAG}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" value="%{QSC_AUTO_EXAMINE}" formIndex="1" /></bu:td>
			-->
			
			<td style="width: 90px;text-align: right;">
				<bu:uitn colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" />
		        </td>
			<td>&nbsp;
				<bu:ui colNo="QSC_DEFAULT_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" />
				&#x3000;
				<bu:uitn colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" />
				<bu:ui colNo="QSC_AUTO_EXAMINE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" />
			</td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CTRL_FLAG" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_NORMAL_RELAX" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_RELAX_NORMAL" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_NUM" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_STRICT_TOTAL" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" /></td>
			<bu:td cssClass="dec" colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" ><bu:ui colNo="QSC_CREATE_RULE" formId="fe2f562eab2645eea5c2c4131957c06c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="fe2f562eab2645eea5c2c4131957c06c" formIndex="1" />
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
