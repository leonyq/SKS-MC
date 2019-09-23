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
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
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
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="2ea06dc3c4414e1db802eab7ed38e3ef" type="add" />
<div class="mod">		
  <div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:130px;border: none;">
	<table class="basic-table" >
	<s:hidden id ="curUserName" name="curUserName" value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}'/>
	<s:hidden id ="curUserId" name="curUserId" value='%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}'/>
	<input type="hidden" name="formIds" value="2ea06dc3c4414e1db802eab7ed38e3ef" />
	<input type="hidden" id="prefixInd" name="2ea06dc3c4414e1db802eab7ed38e3ef" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'3c5060115b1a44eabd54a7c1a5b5ea0d'" />
		<s:set name="_$formId_1" value="'2ea06dc3c4414e1db802eab7ed38e3ef'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TAI_PROJECT_ID" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_PROJECT_ID" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_PROJECT_ID" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_PROJECT_ID}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TAI_TYPE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_TYPE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_TYPE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_TYPE}" formIndex="1" onchange="changeType();"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TAI_MKDH" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MKDH" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MKDH" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_MKDH}" formIndex="1" readonly="readonly"/></bu:td>
		
			<td class="name" /><bu:uitn colNo="TAI_MKJD" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MKJD" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MKJD" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_MKJD}" formIndex="1" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TAI_MKBB" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MKBB" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MKBB" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_MKBB}" formIndex="1" readonly="readonly"/></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TAI_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TAI_FIND_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_FIND_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_FIND_TIME" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_FIND_TIME}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="TAI_REPORT_EMP" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_REPORT_EMP" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><input type="text" id="username" readonly="readonly" class=" input isSubmit  _VAL_DATABASE"></bu:td>
		
			
			<bu:td cssClass="dec" colNo="TAI_REPORT_EMP" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_REPORT_EMP" style="display:none;" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_REPORT_EMP}" formIndex="1" /></bu:td>
		</tr>
		<tr style="display:none;">
		    	<td class="name" /><bu:uitn colNo="TAI_STATUS" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_STATUS" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_STATUS" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_STATUS}" formIndex="1" /></bu:td>
		
		</tr>
		
	</table>
	</div>	
    
    <div id="content1">
    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="图纸不符" /></h3>	
    </div>
    <div class="mod-hd" style="height:130px;border: none;">	
        <table class="basic-table" >
        <tr>
			<td class="name" /><bu:uitn colNo="TAI_DRAW_MARKMODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_DRAW_MARKMODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_DRAW_MARKMODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_DRAW_MARKMODEL}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TAI_MATTER_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MATTER_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MATTER_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_MATTER_MODEL}" formIndex="1" /></bu:td>
		</tr>	
		</table>
    </div>
    </div>
    <div id="content2" style="display:none;">
    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="缺件" /></h3>	
    </div>
    <div class="mod-hd" style="height:130px;border: none;">	
        <table class="basic-table" >
        <tr>
			<td class="name" /><bu:uitn colNo="TAI_DEVICE_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_DEVICE_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_DEVICE_MODEL" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_DEVICE_MODEL}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TAI_SINGLE_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_SINGLE_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_SINGLE_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_SINGLE_NUM}" formIndex="1" /></bu:td>
		</tr>	
	    <tr>
			<td class="name" /><bu:uitn colNo="TAI_MISS_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_MISS_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" ><bu:ui colNo="TAI_MISS_NUM" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_MISS_NUM}" formIndex="1" /></bu:td>
		</tr>
		</table>
    </div>
    </div>
    <div id="content3" style="display:none;">
    <div class="mod-hd">		
        <h3 class="tit"><dict:lang value="其它" /></h3>	
    </div>
    <div class="mod-hd" style="height:130px;border: none;">		
        <table class="basic-table" >
        <tr>
			<td class="name" style="width: 68px;"/><bu:uitn colNo="TAI_INFO_DESCRIBE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" /></td>
			<bu:td cssClass="dec" colNo="TAI_INFO_DESCRIBE" formId="2ea06dc3c4414e1db802eab7ed38e3ef" colspan="3"><bu:ui colNo="TAI_INFO_DESCRIBE" style="width:100%;height:80px" formId="2ea06dc3c4414e1db802eab7ed38e3ef" value="%{TAI_INFO_DESCRIBE}" formIndex="1" /></bu:td>
			</tr>	
		</table>
    </div>
    </div>
    </div>
			<bu:jsVal formId="2ea06dc3c4414e1db802eab7ed38e3ef" formIndex="1" />
				
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
<script>
    	function changeType(){
    	    var type = $("#paraMap1_TAI_TYPE").val();
    	    if(type=="1"){
    	        $("#content1").attr("style","display:block");
    	        $("#content2").attr("style","display:none");
    	        $("#content3").attr("style","display:none");
    	    }else if(type=="2"){
    	        $("#content1").attr("style","display:none");
    	        $("#content2").attr("style","display:block");
    	        $("#content3").attr("style","display:none");
    	    }else if(type=="3"){
    	        $("#content1").attr("style","display:none");
    	        $("#content2").attr("style","display:none");
    	        $("#content3").attr("style","display:block");
    	    }
    	}
    	var type='${param.type}';
    	function getProInfo(snInfo){
            util.showLoading("处理中...");
        			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=eab326e111dc4853a7a89dfd66c7ee7e";
        	       $.ajax({
        	           type:"post",
        	           dataType:"json",
        	           data: {
        	               "snInfo" : snInfo
        	           },
        	           url:loadItemUrl,
        	           success:function(data){
                        	util.closeLoading();
                        	if(null==data){
                        	    return;
                        	}
                        	$("#paraMap1_TAI_MKDH").val(data.ajaxList[0].PRODUCT_MATERIAL);
                        	$("#paraMap1_TAI_MKJD").val(data.ajaxList[0].PRODUCT_MODEL);
                        	$("#paraMap1_TAI_MKBB").val(data.ajaxList[0].PRODUCT_VER);
                        	$("#paraMap1_TAI_NUM").val(data.ajaxList[0].PRODUCT_COUNT);
        	           },
        	           error:function(msg){
        	                if(msg.readyState!=0){
            	               util.closeLoading();
            	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
        	                }
        	           }
        	  });
        }
    	$(function(){
    	    $("#paraMap1_TAI_FIND_TIME").val(timeEndString());
    	    $("#username").val($("#curUserName").val());
    	    $("#paraMap1_TAI_REPORT_EMP").val($("#curUserId").val());
    	    $("#paraMap1_TAI_STATUS").val("1");
    	    if(type=="llqd"){
    	        var iframeId1='${param.iframeId}';
    	        var projectId ='${param.projectId}';
    	        $("input[name='iframeId']").val(iframeId1);
    	        $("#paraMap1_TAI_PROJECT_ID").val(projectId);
    	        $("#paraMap1_TAI_PROJECT_ID_SHOW").val(projectId);
	            getProInfo(projectId);
    	    }
    	})
    	function timeEndString(){
            var datetime = new Date();
            //datetime.setTime(time);
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
            var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
            var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
            return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
        }
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
