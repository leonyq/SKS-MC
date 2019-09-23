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
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="b80d6492859243b498458c992ab04063" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="b80d6492859243b498458c992ab04063" />
	<input type="hidden" name="b80d6492859243b498458c992ab04063" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'5484df5145e34a02bc72aa5aacad6a39'" />
		<s:set name="_$formId_1" value="'b80d6492859243b498458c992ab04063'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_AREA_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_AREA_SN" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_AREA_SN" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_PROJECT_ID" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_PROJECT_ID" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_PROJECT_ID" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_MO_NUMBER" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_MO_NUMBER" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_MO_NUMBER" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_MODEL_CODE" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_MODEL_CODE" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_MODEL_CODE" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_PROCESS_FACE" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_PROCESS_FACE" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_PROCESS_FACE" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_SN" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_TECH_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_TECH_SN" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_TECH_SN" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_NUM" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_NUM" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_LOT" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_LOT" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_LOT" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_SN_TYPE" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_SN_TYPE" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_SN_TYPE" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_CUST_CODE" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_CUST_CODE" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_CUST_CODE" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_GROUP_CODE" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_GROUP_CODE" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_GROUP_CODE" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_EMP" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_EMP" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_EMP" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_IN_TIME" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_IN_TIME" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_IN_TIME" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_NG_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_NG_NUM" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_NG_NUM" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_SCRAP_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_SCRAP_NUM" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_SCRAP_NUM" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_MISJUDGE_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_MISJUDGE_NUM" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_MISJUDGE_NUM" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_ERROR_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_ERROR_FLAG" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_ERROR_FLAG" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_REFLUX_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_REFLUX_FLAG" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_REFLUX_FLAG" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_BACK_GROUP" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_BACK_GROUP" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_BACK_GROUP" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_NEXT_GROUP" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_NEXT_GROUP" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_NEXT_GROUP" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_SN_RELID" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_SN_RELID" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_SN_RELID" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_FINISH_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_FINISH_FLAG" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_FINISH_FLAG" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_SC_FINISH_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_SC_FINISH_FLAG" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_SC_FINISH_FLAG" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_WORK_STATION" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_WORK_STATION" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_WORK_STATION" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_LINK_NUM" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_LINK_NUM" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_LINK_NUM" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_SCRAP_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_SCRAP_FLAG" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_SCRAP_FLAG" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="WT_GROUP_SEQ" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_GROUP_SEQ" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_GROUP_SEQ" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_TRANSFER_SN" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_TRANSFER_SN" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_TRANSFER_SN" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="WT_BACK_SEQ" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_BACK_SEQ" formId="b80d6492859243b498458c992ab04063" ><bu:ui colNo="WT_BACK_SEQ" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="WT_REWORK_FLAG" formId="b80d6492859243b498458c992ab04063" /></td>
			<bu:td cssClass="dec-self" colNo="WT_REWORK_FLAG" formId="b80d6492859243b498458c992ab04063"  colspan="7"><bu:ui colNo="WT_REWORK_FLAG" formId="b80d6492859243b498458c992ab04063" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="b80d6492859243b498458c992ab04063" formIndex="1" />
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
