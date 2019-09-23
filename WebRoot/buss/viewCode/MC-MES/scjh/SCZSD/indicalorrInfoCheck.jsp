<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="beforePageLoad" />
 </jsp:include>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js?_mc_res_version=<%=PlfStaticRes.PlfJsUi_Include_js %>"></script>
 
	<!-- head里面 -->
	
	<!-- 产品静态资源 -->

	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
                <s:if test="${isDataAuth == '1'}">
                		<span class="dot">*</span><dict:lang value="组织机构" />
                		<s:if test="${fn:length(deptLs)==1}">
                   			<s:select list="deptLs" listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
                   		</s:if>
                   		<s:else>
                			<s:select list="deptLs" headerKey="" headerValue='--%{getText("请选择")}--'
								listKey="id" listValue="name"  name="_DATA_AUTH"
								id="deptLs_data_auth" cssStyle="width: 200px;" cssClass="_VAL_NULL dept_select"/> 
		   				</s:else>
                	</s:if>	
                </div>
			    <div class="optn">
			       <!-- <button type="button" onclick="conFirmInfo();"><i class="ico ico-zxqr"></i><dict:lang value="确认" /></button>-->
			        <button type="button" onclick="addInfo();"><i class="ico ico-ycdc"></i><dict:lang value="发起" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height: 454px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" type="add" />
		<div class="mod">
		<div class="mod-hd">
				<h3 class="tit"><dict:lang value="基本信息" /></h3>
			</div>
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="0bb32b8e54d2487c9e4c61a1c91f2b8a" />
	<input type="hidden" name="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="state" id="state" value="" />
	<input type="hidden" name="addType" id="addType" value="" />
	<input type="hidden" name="addFlag" id="addFlag" value="" />
	<input type="hidden" name="modelCode" id="modelCode" value="" />
	<input type="hidden" name="templateName" id="templateName" value="" />
	<input type="hidden" name="productStep" id="productStep" value="" />
		<s:set name="_$viewId" value="'de5622a8aa7843e686b22b7d21dc4a84'" />
		<s:set name="_$formId_1" value="'0bb32b8e54d2487c9e4c61a1c91f2b8a'" />
		<s:set name="_$type" value="'add'" />
		<!--
		<tr>
			<td class="name" style="width:70px;"/><span class="dot">*</span><bu:uitn colNo="CO_INDICATORR_SN" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_INDICATORR_SN" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_INDICATORR_SN" disabled="disabled" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_INDICATORR_SN}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="CO_MO_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_MO_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_MO_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_MO_NUMBER}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:80px;"/><bu:uitn colNo="T2#PM_MODEL_CODE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="T2#PM_MODEL_CODE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="T2#PM_MODEL_CODE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{T2#PM_MODEL_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T3#CI_ITEM_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec"  colNo="T3#CI_ITEM_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="T3#CI_ITEM_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{T3#CI_ITEM_NAME}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="T3#CI_ITEM_SPEC" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec"  colNo="T3#CI_ITEM_SPEC" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="T3#CI_ITEM_SPEC" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{T3#CI_ITEM_SPEC}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="T2#PM_PRODUCT_STEP" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec"  colNo="T2#PM_PRODUCT_STEP" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="T2#PM_PRODUCT_STEP" id="PM_PRODUCT_STEP" disabled="disabled" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{T2#PM_PRODUCT_STEP}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T2#PM_TARGET_QTY" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec"  colNo="T2#PM_TARGET_QTY" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="T2#PM_TARGET_QTY" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{T2#PM_TARGET_QTY}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="T2#PM_SCHEDULE_DATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec"  colNo="T2#PM_SCHEDULE_DATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="T2#PM_SCHEDULE_DATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" disabled="disabled" value="%{T2#PM_SCHEDULE_DATE}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="CO_STATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec"  colNo="CO_STATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_STATE" disabled="disabled" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_STATE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CO_SECTION_NO" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec"  colNo="CO_SECTION_NO" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_SECTION_NO" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_SECTION_NO}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec"  colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_ARCHIVAL_FILE_NUMBER}" formIndex="1" /></bu:td>
			
		</tr>-->
		
		<tr>
			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="CO_INDICATORR_SN" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_INDICATORR_SN" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_INDICATORR_SN" disabled="disabled" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_INDICATORR_SN}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="CO_MODEL_CODE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_MODEL_CODE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_MODEL_CODE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_MODEL_CODE}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:80px;"/><span class="dot">*</span><bu:uitn colNo="CO_TEMPLATE_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_TEMPLATE_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_TEMPLATE_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_TEMPLATE_NAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_ITEM_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ITEM_NAME" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_ITEM_NAME" disabled="disabled" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_ITEM_NAME}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_ITEM_SPEC" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ITEM_SPEC" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_ITEM_SPEC" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_ITEM_SPEC}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_STATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_STATE" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_STATE"  disabled="disabled" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_STATE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:80px;"/><bu:uitn colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" style="width: 200px;" colNo="CO_ARCHIVAL_FILE_NUMBER" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" ><bu:ui colNo="CO_ARCHIVAL_FILE_NUMBER"  formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_ARCHIVAL_FILE_NUMBER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CO_MEMO" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" /></td>
			<bu:td cssClass="dec" colspan="5" colNo="CO_MEMO" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" style="height:80px;"><bu:ui colNo="CO_MEMO" style="width:100%;height:100%" formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" value="%{CO_MEMO}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
	<input type="hidden" name="formId" id="formId2" value='831b2dbf0dfb494695b7ce66538a1234'/>
	<div class="mod-hd">
				<h3 class="tit"><dict:lang value="明细信息" /></h3>
			</div>
			<div class="mod">
				<div class="mod-bd" style="margin-top:5px;border-bottom: none;">
					<div class="panel datagrid datagrid-div1">
						<div class="datagrid-div2 datagrid-div6 datagrid-view" id="datagrid-view">
							<div class="datagrid-header" style="">
								<div class="datagrid-header-inner" >
									<table  class="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz  " id="datagrid-htable831b2dbf0dfb494695b7ce66538a1234">
									<tbody>
									<tr class="datagrid-header-row thcolor">
												<td class="datagrid-cell" style="width:30px;"></td>
												<td class="datagrid-cell" style="width:30px;">
													<input type="checkbox" id="allSelects" name="allSelect" onchange="getAllItem();" />
												</td>
												<td class="datagrid-cell" style="width:120px;">
													<dict:lang value="检查项目" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="修改时间" />
												</td>
												<td class="datagrid-cell" style="width:80px;display:none;">
													<dict:lang value="" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="状态" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="部门" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="确认人" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="确认时间" />
												</td>
												<td class="datagrid-cell" style="width:80px;">
													<dict:lang value="审核人" />
												</td>
												<td class="datagrid-cell" style="width:150px;">
													<dict:lang value="审核时间" />
												</td>
												<td class="datagrid-cell" style="width:100px;">
													<dict:lang value="影响因素" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="datagrid-body datagrid-div3 scroll" style="height:150px;">
							<table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234" > <!--table-layout:fixed;-->
									<tbody id="addItemInfo">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
			<bu:jsVal formId="0bb32b8e54d2487c9e4c61a1c91f2b8a" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script type="text/javascript">
        $(function(){
            
        })
        $("#paraMap1_CO_TEMPLATE_NAME").change(function(){
    	    var templateName=$(this).val();
    	    
    	    sreachItemInfo();
    	});
        function sreachItemInfo(){
            var itemCode=$("#paraMap1_CO_MODEL_CODE").val();
            var templateName=$("#paraMap1_CO_TEMPLATE_NAME").val();
            if(itemCode!="" && itemCode!=null && templateName!="" && templateName!=null){
                var itemUrl = "${path}buss/bussModel_exeFunc.ms?funcMId=257b37cebe1b4b649af2d5b03e2731ec";
    			util.showLoading("处理中...");
    			$.ajax({
    				type: "POST",
    		    	dataType: "json",
    		    	url: itemUrl,
    		    	data: {
    		    	    "itemCode":itemCode,
    		    	    "templateName":templateName
    		    	},
    				success: function(data){
    		        	$("#addItemInfo").empty();
    					util.closeLoading();
    					//console.log(data);
    					var stateFlag=true;
    					var dataMap=data.ajaxMap;
    					$("#addType").val(dataMap.ADD_TYPE);
    					if(null == data){
    				        return;
    					}
    					if(null != data.ajaxList){
    						var rccList = eval(data.ajaxList);
    						if(rccList.length==0){
    						    //utilsFp.confirmIcon(3,"","","", "未维护默认的检查项目",0,"","");
    				            return;
    						}else{
    						for(var i=0;i<rccList.length;i++){
    							if(rccList[i].ID==null) rccList[i].ID="";
    							if(rccList[i].CO_PROJECT_CODE==null) rccList[i].CO_PROJECT_CODE="";
    							if(rccList[i].CO_PROJECT_NAME==null) rccList[i].CO_PROJECT_NAME="";
    							if(rccList[i].EDIT_TIME==null) rccList[i].EDIT_TIME="";
    							if(rccList[i].CO_STATE==null) rccList[i].CO_STATE="1";
    							if(rccList[i].CO_MODEL_STATE==null) rccList[i].CO_MODEL_STATE="1";
    							if(rccList[i].CO_DEPT_ID==null) rccList[i].CO_DEPT_ID="";
    							if(rccList[i].CO_DEPT_NAME==null) rccList[i].CO_DEPT_NAME="";
    							if(rccList[i].CO_CONFIRM_ID==null) rccList[i].CO_CONFIRM_ID="";
    							if(rccList[i].CO_CONFIRM_NAME==null) rccList[i].CO_CONFIRM_NAME="";
    							if(rccList[i].CO_CONFIRM_TIME==null) rccList[i].CO_CONFIRM_TIME="";
    							if(rccList[i].CO_CHECK_ID==null) rccList[i].CO_CHECK_ID="";
    							if(rccList[i].CO_CHECK_NAME==null) rccList[i].CO_CHECK_NAME="";
    							if(rccList[i].CO_CHECK_TIME==null) rccList[i].CO_CHECK_TIME="";
    							if(rccList[i].CO_AFFECT_INFO==null) rccList[i].CO_AFFECT_INFO="";
    							if(rccList[i].AFFECT_INFO_NAME==null) rccList[i].AFFECT_INFO_NAME="";
    							var tempFlag="";
    							if(rccList[i].CO_STATE=='1'){ tempFlag="<span class='state' style='background-color:#ff9900;color:#FFFFFF;width:45px'>未确认</span>";}
    							else if(rccList[i].CO_STATE=='2') {tempFlag="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>已确认</span>";}
    							else if(rccList[i].CO_STATE=='3') {tempFlag="<span class='state' style='background-color:#4a86e8;color:#FFFFFF;width:45px'>已审核</span>";}
    							
    							if(rccList[i].CO_MODEL_STATE=='1'){ tempFlag2="<span class='state' style='background-color:#ff9900;color:#FFFFFF;width:45px'>未确认</span>";}
    							else if(rccList[i].CO_MODEL_STATE=='2') {tempFlag2="<span class='state' style='background-color:#4e9d0f;color:#FFFFFF;width:45px'>已确认</span>";}
    							var coState=rccList[i].CO_MODEL_STATE;
    							
    							if(coState=="" || coState=="1"){
    							    stateFlag=false;
    							}
    							var time1="";
    							var time2="";
    							var time3="";
    							if(rccList[i].EDIT_TIME!=null) {time1=(rccList[i].EDIT_TIME).replace("T", " ")};
    							if(rccList[i].CO_CONFIRM_TIME!=null) {time2=(rccList[i].CO_CONFIRM_TIME).replace("T", " ")};
    							if(rccList[i].CO_CHECK_TIME!=null) {time3=(rccList[i].CO_CHECK_TIME).replace("T", " ")};
    						    $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody:last").append("<tr id='trr" + (i + 1) + "' ></tr>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>" + (i + 1) + "<input type='hidden' name='INFO_ID' value='"+rccList[i].ID+"'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-2' style='width:30px;text-align: center;'><input type='checkbox' name='isSelect1'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:120px;text-align: left;' title='"+rccList[i].CO_PROJECT_NAME+"'>" + rccList[i].CO_PROJECT_NAME + "<input type='hidden' name='PROJECT_CODE' value='" + rccList[i].CO_PROJECT_CODE + "'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align: center;' title='"+time1+"' >" + time1 + "</td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-5' style='width:80px;text-align: center;display:none;' >" + tempFlag + "<input type='hidden' name='CO_STATE' value='" + rccList[i].CO_STATE + "'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-12' style='width:80px;text-align: center;' >" + tempFlag2 + "<input type='hidden'  name='CO_MODEL_STATE' value='" + rccList[i].CO_MODEL_STATE + "'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-6' style='width:100px;text-align: center;' title='"+rccList[i].CO_DEPT_NAME+"'>" + rccList[i].CO_DEPT_NAME + "<input type='hidden' name='DEPT_ID' value='" + rccList[i].CO_DEPT_ID + "'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-7' style='width:80px;text-align: center;' title='"+rccList[i].CO_CONFIRM_NAME+"'>" + rccList[i].CO_CONFIRM_NAME + "<input type='hidden' name='CONFIRM_ID' value='" + rccList[i].CO_CONFIRM_ID + "'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-8' style='width:150px;text-align: center;' title='"+time2+"'>" + time2 + "<input type='hidden' name='CONFIRM_TIME' value='" + rccList[i].CO_CONFIRM_TIME + "'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-9' style='width:80px;text-align: center;' title='"+rccList[i].CO_CHECK_NAME+"'>" + rccList[i].CO_CHECK_NAME + "<input type='hidden' name='CHECK_ID' value='" + rccList[i].CO_CHECK_ID + "'/></td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-10' style='width:150px;text-align: center;' title='"+time3+"'>" + time3 + "</td>");
            					$("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tr:last").append("<td class='datagrid-cell datagrid-cell-11' style='width:100px;text-align: left;' title='"+rccList[i].AFFECT_INFO_NAME+"'>" + rccList[i].AFFECT_INFO_NAME + "<input type='hidden' name='AFFECT_INFO' value='" + rccList[i].CO_AFFECT_INFO + "'/></td>");
        		
    						}	
    					    	
                            if(stateFlag==true){
                                //全部确认 已审核
                                $("#paraMap1_CO_STATE_chosen").removeAttr("disabled");
    						    $("#paraMap1_CO_STATE").find("option[value='2']").attr("selected",true);
    						    $("#paraMap1_CO_STATE").trigger("chosen:updated");
    						    $("#paraMap1_CO_STATE_chosen").attr("disabled",true);
    						    $("#state").val("2");
                            }else{
                                //待审核
                                $("#paraMap1_CO_STATE_chosen").removeAttr("disabled");
    						    $("#paraMap1_CO_STATE").find("option[value='1']").attr("selected",true);
    						    $("#paraMap1_CO_STATE").trigger("chosen:updated");
    						    $("#paraMap1_CO_STATE_chosen").attr("disabled",true);
    						    $("#state").val("1");
                            }
    						var tableTrJs = $("#datagrid-btable-ajax831b2dbf0dfb494695b7ce66538a1234 tbody tr");
    						_tongLineColor(tableTrJs);
    						clickTr('addItemInfo');
    						defTableWidthRewrite("831b2dbf0dfb494695b7ce66538a1234");
    					} }
    				},
    				error: function(msg){
    					util.closeLoading();
    					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    			    }
    			});
			}else{
			    $("#addItemInfo").empty();
			}
        }
        function clearItemInfo(){
            $("#addItemInfo").empty();
        }
        //全选
		function getAllItem() {
		console.log($("#allSelects").attr("checked"));
			if($("#allSelects").attr("checked") == "checked") {
				$("#addItemInfo :checkbox").attr("checked", true);
			} else {
				$("#addItemInfo :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		function getAllItem2() {
			if($("#item_list_cb").attr("checked") == "checked") {
				$("#itemTbody :checkbox").attr("checked", true);
			} else {
				$("#itemTbody :checkbox").each(function() {
					$(this).attr("checked", false);
				});
			}
		}
		//点击行寄选中该行
		function clickTr(tableId) {
			$("#" + tableId + " tr").unbind("click");
			$("#" + tableId + " tr input[type=checkbox]").unbind("click");
			$("#" + tableId + " tr").on("click", function(e) {
				var trId = $(this).attr("id");
				if($("#" + trId + " :checkbox").attr("checked")) {
					$("#" + trId + " :checkbox").prop("checked", false);
					$("#" + trId).css("background-color", "");
				} else {
					$("#" + tableId + " input[type='checkbox']").each(function() {
						if($(this).attr("checked")) {
							$(this).prop("checked", false);
							$(this).parents("tr").css("background-color", "");
						}
					});
					$("#" + trId + " :checkbox").prop("checked", true);
					$("#" + trId).css("background-color", "#a0c8e5");
				}
			});

			$("#" + tableId + " tr input[type=checkbox]").click(function(e) {
				e.stopPropagation();
				var style = $(this).parents("tr").attr("style");
				if(style && style.indexOf("background-color") > -1) {
					$(this).parents("tr").css("background-color", "");
				} else {
					$(this).parents("tr").css("background-color", "#a0c8e5");
				}
			});
		}
		function conFirmInfo(){
		    var state=$("#state").val();
	        $("#state").val($("#paraMap1_CO_STATE").val());
	        $("#modelCode").val($("#paraMap1_CO_MODEL_CODE").val());
	        $("#templateName").val($("#paraMap1_CO_TEMPLATE_NAME").val());
		    if($("#deptLs_data_auth").val() == null || $("#deptLs_data_auth").val() ==""){
               	_alertValMsg($('#deptLs_data_auth_chosen'), "<dict:lang value="该项不能为空" />");
                 return ;
            }
		    //if($("#paraMap1_CO_INDICATORR_SN").val()==""){
	            //_alertValMsg($("#paraMap1_CO_INDICATORR_SN"), "<dict:lang value="该项不能为空" />");
	    	    //return;
            //}
		    //if($("#paraMap1_CO_MO_NUMBER").val()==""){
	        //    _alertValMsg($("#paraMap1_CO_MO_NUMBER_SHOW"), "<dict:lang value="该项不能为空" />");
	    	//    return;
            //}
            if($("#paraMap1_CO_MODEL_CODE_SHOW").val()==""){
	            _alertValMsg($("#paraMap1_CO_MODEL_CODE_SHOW"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
            if($("#paraMap1_CO_TEMPLATE_NAME").val()==""){
	            _alertValMsg($("#paraMap1_CO_TEMPLATE_NAME_chosen"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
		    if(state!="2"){
		        utilsFp.confirmIcon(3,"","","", "检查项目未全部确认",0,"","");
				return;
		    }
		    
            $("#addFlag").val("confirm");
            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=2d1346528abf4e29a09f5cdfe94ade1f";
            document.forms.addForm.submit();
		}
		function addInfo(){
		    $("#state").val($("#paraMap1_CO_STATE").val());
	        $("#modelCode").val($("#paraMap1_CO_MODEL_CODE").val());
	        $("#templateName").val($("#paraMap1_CO_TEMPLATE_NAME").val());
		    if($("#deptLs_data_auth").val() == null || $("#deptLs_data_auth").val() ==""){
               	_alertValMsg($('#deptLs_data_auth_chosen'), "<dict:lang value="该项不能为空" />");
                 return ;
            }
		    //if($("#paraMap1_CO_INDICATORR_SN").val()==""){
	            //_alertValMsg($("#paraMap1_CO_INDICATORR_SN"), "<dict:lang value="该项不能为空" />");
	    	    //return;
            //}
		    if($("#paraMap1_CO_MODEL_CODE_SHOW").val()==""){
	            _alertValMsg($("#paraMap1_CO_MODEL_CODE_SHOW"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
            if($("#paraMap1_CO_TEMPLATE_NAME").val()==""){
	            _alertValMsg($("#paraMap1_CO_TEMPLATE_NAME_chosen"), "<dict:lang value="该项不能为空" />");
	    	    return;
            }
            $("#addFlag").val("add");
            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=2d1346528abf4e29a09f5cdfe94ade1f";
            document.forms.addForm.submit();
    	}
    	function searchOutItem(paginationImpl){
            var url = "${path}buss/bussModel_exeFunc.ms?funcMId=6bb8855d3e354d7c9baba03c563ae42d&formId=%{formId}";
        	SearchOutItemInfo(paginationImpl,url);
        }
    </script>
<script>(function($){
  $(window).on('load',function(){
   setPopScroll('.scroll','.datagrid-header-inner');
   setPopScroll('.scroll1','.datagrid-header-inner1');
   setPopScroll('.scroll2','.datagrid-header-inner2');
  })
})(jQuery)</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
