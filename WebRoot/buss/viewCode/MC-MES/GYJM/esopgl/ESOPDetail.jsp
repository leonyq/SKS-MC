<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>        
</head>
<body style="background-color:#fff;">
	<div class="edit">
			<div class="bd" style="border: none">
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="62e5f8f76eab45ddbcf24c091ee691ce" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="62e5f8f76eab45ddbcf24c091ee691ce" />
	<input type="hidden" name="62e5f8f76eab45ddbcf24c091ee691ce" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a912c7d3b5d64e7ab63ffb870b8171c0'" />
		<s:set name="_$formId_1" value="'62e5f8f76eab45ddbcf24c091ee691ce'" />
		<s:set name="_$type" value="'detail'"/>
		
		
		<tr>
			<td class="name" style="width:70px;"/><bu:uitn colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_SN" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:70px;"/><bu:uitn colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" style="width:235px;" colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
		     	<td class="name" style="width:70px;"/><bu:uitn colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_PRODUCT_STEP" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>

             		<td class="name" style="width:70px;"/><bu:uitn colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_PROCESS_FACE" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>

				
		</tr>
		<tr>
		        <td class="name" style="width:70px;"/><bu:uitn colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_GROUP" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>

			
		        <td class="name" style="width:70px;"/><bu:uitn colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
		        <bu:td cssClass="dec" colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_MODEL_CODE" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
	
		</tr>
		
		<tr>
		    	<td class="name" style="width:70px;"/><bu:uitn colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="PRODUCT_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
                  
			<td class="name" style="width:70px;"/><bu:uitn colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="PRODUCT_STANDARD" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
		<!--
		        <td class="name" style="width:70px;"/><bu:uitn colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_VALID_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" />
			-->
			&#x3000;&#x3000;&#x3000;&#x3000;
			<bu:uitn colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" />
			<bu:ui colNo="CSI_DEFAULT_FLAG" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" />
                        </bu:td>
			
			
		</tr>
		
		<tr>
		       <td class="name" style="width:70px;"/><bu:uitn colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_VERSION" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
                       
			<td class="name" style="width:70px;"/><bu:uitn colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" ><bu:ui colNo="CSI_SYS_NAME" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
		        <td class="name" style="width:70px;"/><bu:uitn colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" /></td>
			<bu:td cssClass="dec" colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" colspan="3"><bu:ui colNo="CSI_MEMO" formId="62e5f8f76eab45ddbcf24c091ee691ce" dataId="${dataId}"  style="height:80px;width:100%;" formIndex="1" /></bu:td>

		
		</tr>
	</table>
			<bu:jsVal formId="62e5f8f76eab45ddbcf24c091ee691ce" formIndex="1" />
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
				 $('.dialog-bd',parent.document).css('background-color','#fff');
			});
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

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