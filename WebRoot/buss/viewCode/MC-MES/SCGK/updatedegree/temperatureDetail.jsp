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
 
  .basic-table 	input{

      width:200px !important;

  }
  </style>

</head>
<body>
	<div class="edit">
			<div class="bd" style="height:470px;border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="ec819630ac4041b1ace478a3c5163782" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ec819630ac4041b1ace478a3c5163782" />
	<input type="hidden" name="ec819630ac4041b1ace478a3c5163782" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'17936affb481469885c4fea8d4a65233'" />
		<s:set name="_$formId_1" value="'ec819630ac4041b1ace478a3c5163782'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
		<td class="name" /><bu:uitn colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec"  colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782"><bu:ui colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" style="width:180px;"/></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<td class="name" /><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782"  ><bu:ui colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		    	<td class="name" /><bu:uitn colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
				<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
	
			<td class="name" /><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
			<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		
		
			<tr>
			<td class="name" /><bu:uitn colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782"  colspan="7"><div style="width:850px;height:360px; overflow-y: scroll; word-wrap:break-word; border:1px solid #ccc;"  ><bu:ui colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1"  /></div></bu:td>
		</tr>
	
	<!--	
		<tr>
		<td class="name" /><bu:uitn colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782"  ><bu:ui colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>  -->
		
		
		
		
		
		
		
		
		
	<!--	<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="MO_NUMBER" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_PROJECT_ID" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_MODEL_CODE" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><bu:uitn colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="P#PM_AREA_SN" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="WORK_STATION" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="CURVE_TYPE" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="BEGIN_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="END_TIME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" ><bu:ui colNo="FILE_NAME" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
		<tr>
			<td class="name-three" /><bu:uitn colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" /></td>
			<bu:td cssClass="dec-self" colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782"  colspan="3"><bu:ui colNo="REMARK" formId="ec819630ac4041b1ace478a3c5163782" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
	</table>
			<bu:jsVal formId="ec819630ac4041b1ace478a3c5163782" formIndex="1" />
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
