<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<style type="text/css">
.input {
	width:200px !important;
}
</style>
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
<body style="overflow:auto;background-color:#fff;">
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="46a2000d9dd641acab47c18beb57b9d0" type="edit" />
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="异常单信息" /></h3>	
  </div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="46a2000d9dd641acab47c18beb57b9d0" />
	<input type="hidden" name="46a2000d9dd641acab47c18beb57b9d0" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'399c4d23ef684536821b1f5985b49884'" />
		<s:set name="_$formId_1" value="'46a2000d9dd641acab47c18beb57b9d0'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_DOC_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MO_NUMBER" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_CUST_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_CODE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_NAME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MODEL_SPEC" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_ERROR_TYPE" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>

			<td class="name" /><bu:uitn colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_INSPECT_SN" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_SUBMIT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_AREA_SN" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_INSPECT_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_ERROR_NUM" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_ERROR_DESC" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ERROR_DESC" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_ERROR_DESC" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" /><bu:uitn colNo="CQI_CREATE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_CREATE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_CREATE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CQI_CREATE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_CREATE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_CREATE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
	</table>
	
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="异常分析" /></h3>	
        
	</div>
	<table class="basic-table" >
        	
        	<tr>
			<td class="name" style="width:54px;"/><bu:uitn colNo="CQI_ERROR_CAUSE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ERROR_CAUSE" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_ERROR_CAUSE" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_OUTFLOW_CAUSE" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_OUTFLOW_CAUSE" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_OUTFLOW_CAUSE" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec">&nbsp;</td>
		
			<td class="name" style="width:284px;"/><bu:uitn colNo="CQI_ANALYSIS_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ANALYSIS_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_ANALYSIS_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CQI_ANALYSIS_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_ANALYSIS_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_ANALYSIS_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
	</table>
	
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="责任判定" /></h3>	
        
	</div>
	<table class="basic-table" >
        	
        	<tr>
			<td class="name" style="width:54px;"/><bu:uitn colNo="CQI_RESPONSIBLE_DEP" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_RESPONSIBLE_DEP" formId="46a2000d9dd641acab47c18beb57b9d0"><bu:ui colNo="CQI_RESPONSIBLE_DEP" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_RESPONSIBLE_DESC" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_RESPONSIBLE_DESC" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_RESPONSIBLE_DESC" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec" style="width:200px;">&nbsp;</td>
		
			<td class="name" style="width:90px;"/><bu:uitn colNo="CQI_JUDGE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_JUDGE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_JUDGE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CQI_JUDGE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_JUDGE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_JUDGE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
	</table>
	
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="异常对策" /></h3>	
        
	</div>
	<table class="basic-table" >
        	
        	<tr>
			<td class="name" style="width:54px;"/><bu:uitn colNo="CQI_SHORT_METHOD" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_SHORT_METHOD" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_SHORT_METHOD" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_LONG_METHOD" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_LONG_METHOD" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_LONG_METHOD" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec" style="width:200px;">&nbsp;</td>
		
			<td class="name" style="width:90px;"/><bu:uitn colNo="CQI_MAKE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MAKE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MAKE_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CQI_MAKE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MAKE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_MAKE_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
	</table>
	
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="执行结果" /></h3>	
    </div>
        <table class="basic-table" >
        	
        	<tr>
			<td class="name" style="width:54px;"/><bu:uitn colNo="CQI_RESULT_CHECK" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_RESULT_CHECK" formId="46a2000d9dd641acab47c18beb57b9d0"><bu:ui colNo="CQI_RESULT_CHECK" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CQI_MEMO" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_MEMO" formId="46a2000d9dd641acab47c18beb57b9d0" style="height:80px;" colspan="5"><bu:ui colNo="CQI_MEMO" style="width: 100%;height: 100%;" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
		<tr>
			<td class="name">&nbsp;</td>
			<td class="dec" style="width:200px;">&nbsp;</td>
		
			<td class="name" style="width:90px;"/><bu:uitn colNo="CQI_CHECK_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_CHECK_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_CHECK_EMP" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		
			<td class="name" style="width:85px;"/><bu:uitn colNo="CQI_CHECK_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" /></td>
			<bu:td cssClass="dec" colNo="CQI_CHECK_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" ><bu:ui colNo="CQI_CHECK_TIME" formId="46a2000d9dd641acab47c18beb57b9d0" dataId="${dataId}" formIndex="1" disabled="disabled" /></bu:td>
		</tr>
	</table>
	
		
        
 </div>
			<bu:jsVal formId="46a2000d9dd641acab47c18beb57b9d0" formIndex="1" />
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
 <script>(function($){
  $(window).on('load',function(){
    setPopScroll('body');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
