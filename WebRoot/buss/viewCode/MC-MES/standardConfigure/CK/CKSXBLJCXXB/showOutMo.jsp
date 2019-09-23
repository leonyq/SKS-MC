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
input {
    width : 200px !important;
}
</style>
</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="dc22be86e17d468fa1b1daffaab81702" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="dc22be86e17d468fa1b1daffaab81702" />
	<input type="hidden" id="prefixInd" name="dc22be86e17d468fa1b1daffaab81702" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f0ed4b48e0294d709874b8cafacdd53a'" />
		<s:set name="_$formId_1" value="'dc22be86e17d468fa1b1daffaab81702'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td class="name" style="width:90px;"/><bu:uitn colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MO_NUMBER" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		    			
            <td class="name" style="width:90px;"/><bu:uitn colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_CODE" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
			
		    	<td class="name" style="width:90px;"/><bu:uitn colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" style="width:200px;"  colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_NAME" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MODEL_STANDARD" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
		
		    <td class="name" /><bu:uitn colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_MO_NUM" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_OUT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
			
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_PREPARA_INTERVAL" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_OPERATE_TIME" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" /></bu:td>
	
			<td class="name" /><bu:uitn colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_STANDARD_HOURS" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_CURRENT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
	
	        <td class="name" /><bu:uitn colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_STATUS" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px" readonly="readonly"/></bu:td>
	
			<td class="name" /><bu:uitn colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_PROCESS_FACE" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		
		
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_NEXT_NUM" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>	
            
			<td class="name" style="width:90px;"/><bu:uitn colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self"  style="width:200px;" colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" ><bu:ui colNo="WOM_NEXT_TIME" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="width:200px"/></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" /></td>
			<bu:td cssClass="dec-self" colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" colspan="7"><bu:ui colNo="WOM_MEMO" formId="dc22be86e17d468fa1b1daffaab81702" dataId="${dataId}" formIndex="1" style="height:80px;width:97.5%;"/></bu:td>
		
		</tr>
	</table>
			<bu:jsVal formId="dc22be86e17d468fa1b1daffaab81702" formIndex="1" />
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
