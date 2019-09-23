<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	
	<style>
		input[type="text"]{
			width:300px !important;
		}
		
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
	
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="9e2c713356a048c8a99bf86defe6cb1e" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="9e2c713356a048c8a99bf86defe6cb1e" />
	<input type="hidden" name="9e2c713356a048c8a99bf86defe6cb1e" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'ea3b066368674dbd939fe8de8f227b50'" />
		<s:set name="_$formId_1" value="'9e2c713356a048c8a99bf86defe6cb1e'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:143px;"/><bu:uitn colNo="QI_NAME" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<bu:td cssClass="dec" colNo="QI_NAME" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_NAME" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1"  /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QI_TYPE" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<bu:td cssClass="dec" colNo="QI_TYPE" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_TYPE" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QI_DEFAULT_FALG" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<bu:td cssClass="dec"  formId="9e2c713356a048c8a99bf86defe6cb1e" >
			<bu:ui colNo="QI_DEFAULT_FALG" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" />
			&#x3000;&#x3000;
			<bu:uitn colNo="QI_ALTERATE_FLAG" formId="9e2c713356a048c8a99bf86defe6cb1e" />
			<bu:ui colNo="QI_ALTERATE_FLAG" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" />	
			</bu:td>
		</tr>
	
		<tr>
			<td class="name" /><bu:uitn colNo="QI_ADVANCE_ALARM" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<bu:td cssClass="dec" colNo="QI_ADVANCE_ALARM" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_ADVANCE_ALARM" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QI_MODEL" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<bu:td cssClass="dec" colNo="QI_MODEL" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_MODEL" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="QI_INPUT_TIME" formId="9e2c713356a048c8a99bf86defe6cb1e" /></td>
			<bu:td cssClass="dec" colNo="QI_INPUT_TIME" formId="9e2c713356a048c8a99bf86defe6cb1e" ><bu:ui colNo="QI_INPUT_TIME" formId="9e2c713356a048c8a99bf86defe6cb1e" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="9e2c713356a048c8a99bf86defe6cb1e" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
        <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_18" />
        <jsp:param name="location" value="jsLoading" />
  	</jsp:include>
	<script type="text/javascript">
	
		
		if('${dataList[0].QI_DEFAULT_FALG}'=="Y"){
			$("#QI_DEFAULT_FALG").attr("checked","checked");	
		}else{
		    $("#QI_DEFAULT_FALG").attr("checked",false);	
		}
		if('${dataList[0].QI_ALTERATE_FLAG}'=="Y"){
			$("#QI_ALTERATE_FLAG").attr("checked","checked");
		}else{
			$("#QI_ALTERATE_FLAG").attr("checked",false);
		}
		
	$("input[type=checkbox]").attr("disabled","disabled");	
		
	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>