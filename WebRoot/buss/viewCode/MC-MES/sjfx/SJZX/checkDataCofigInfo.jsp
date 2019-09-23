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

</head>
<body>
	<div class="edit">
			<div class="bd" style="border: none">
				<form id="detailForm" name="detailForm" action="#" method="post" />
					 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_18" />
     				   <jsp:param name="location" value="detailForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="1b93e70af7b84ddf8ddb462e287b9087" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="1b93e70af7b84ddf8ddb462e287b9087" />
	<input type="hidden" id="prefixInd" name="1b93e70af7b84ddf8ddb462e287b9087" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'5be41277a69e4634927e26b6ab9d53e5'" />
		<s:set name="_$formId_1" value="'1b93e70af7b84ddf8ddb462e287b9087'" />
		<s:set name="_$type" value="'detail'"/>
		<tr>
			<td style="width:60px;" class="name-three" /><bu:uitn colNo="CREATE_TIME" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
		<td colNo="CREATE_TIME" class="dec"><input type="text" name="select" class="input isSubmit" readonly="readonly" value="" id ="paraMapObj_CREATE_TIME"></td>
			
			<td style="width:60px;" class="name" /><bu:uitn colNo="CDS_DEVICE_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_DEVICE_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_DEVICE_TYPE" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_DEVICE_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width:60px;" class="name" /><bu:uitn colNo="CDS_DEVICE_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_DEVICE_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_DEVICE_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_DEVICE_SN}" formIndex="1" /></bu:td>
			
			<td style="width:60px;" class="name" /><bu:uitn colNo="CDS_AREA_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_AREA_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_AREA_SN" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_AREA_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width:60px;" class="name" /><bu:uitn colNo="CDS_AREA_NAME" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CDS_AREA_NAME" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_AREA_NAME" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_AREA_NAME}" formIndex="1" /></bu:td>
			
			<td style="width:60px;" class="name" /><bu:uitn colNo="CREATE_USER" formId="1b93e70af7b84ddf8ddb462e287b9087" /></td>
			<bu:td cssClass="dec" colNo="CREATE_USER" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CREATE_USER" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CREATE_USER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td style="width:60px;"  class="name" /><bu:uitn colNo="CDS_DATA" formId="1b93e70af7b84ddf8ddb462e287b9087" /><span><dict:lang value="(SQL)" /></span></td>
			<bu:td colspan='3' cssClass="dec" colNo="CDS_DATA" formId="1b93e70af7b84ddf8ddb462e287b9087" ><bu:ui colNo="CDS_DATA" style="width:608px;height:150px;" formId="1b93e70af7b84ddf8ddb462e287b9087" value="%{CDS_DATA}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td colspan='4' class="name"  style="text-align:left;" /><span class="dot">*</span><span><dict:lang value="请按下列格式输入SQL：SELECT 字段1,字段2... FROM 表 WHERE 字段1={参数}"/></span>
           <span>,</span><span><dict:lang value="参数外面不能加单引号"/>,</span>
            <span><dict:lang value="查询结果以字段作为表头"/>,</span>
            <span><dict:lang value="如有需要中文请将字段as为所需要的名称"/></span></td>
		</tr>
	</table>
			<bu:jsVal formId="1b93e70af7b84ddf8ddb462e287b9087" formIndex="1" />
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
<script type="text/javascript">
   	    getInitInfo();	
    	function getInitInfo(){ 
		//console.log(itemUrl);
		var infoId=$("input[name='dataId']").val();
		console.log(infoId);
		var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=3667125771534290b9d134b3008ac48a";
			util.showLoading("处理中...");
			$.ajax({
				type: "POST",
		    	dataType: "json",
		    	url: itemUrl,
		    	data: {"infoId":infoId},
				success: function(data){
			    	util.closeLoading();	
				     var dataMap=data.ajaxMap;
				     console.log(dataMap);
				
				    $("#paraMapObj_CREATE_TIME").val(dataMap.CREATE_TIME);
				    $("#paraMapObj_CDS_DEVICE_TYPE").val(dataMap.VALUE);
				    $("#paraMapObj_CDS_DEVICE_SN").val(dataMap.CDS_DEVICE_SN);
				    $("#paraMapObj_CDS_AREA_SN").val(dataMap.CDS_AREA_SN); 
				    $("#paraMapObj_CDS_AREA_NAME").val(dataMap.CDS_AREA_NAME); 
				    $("#paraMapObj_CREATE_USER").val(dataMap.NAME); 
				    $("#paraMapObj_CDS_DATA").val(dataMap.CDS_DATA); 
				},
				error: function(msg){
					util.closeLoading();
					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
			    }
			});
		}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_18" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
