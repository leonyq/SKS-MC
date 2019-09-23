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
			        
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="8c048b8e35874c168fbff6ab0fee4d69" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="8c048b8e35874c168fbff6ab0fee4d69" />
	<input type="hidden" id="prefixInd" name="8c048b8e35874c168fbff6ab0fee4d69" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'430327d201c34fd3889ec3b14616b4a1'" />
		<s:set name="_$formId_1" value="'8c048b8e35874c168fbff6ab0fee4d69'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name-four" ><bu:uitn colNo="WHL_SN" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_SN" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_SN" formId="8c048b8e35874c168fbff6ab0fee4d69" value="%{WHL_SN}" formIndex="1" style="width:100%"/></bu:td>
		</tr>
		<tr>
			<td class="name-four" ><bu:uitn colNo="WHL_POINT" formId="8c048b8e35874c168fbff6ab0fee4d69" /></td>
			<bu:td cssClass="dec-self" colNo="WHL_POINT" formId="8c048b8e35874c168fbff6ab0fee4d69" ><bu:ui colNo="WHL_POINT" formId="8c048b8e35874c168fbff6ab0fee4d69" value="%{WHL_POINT}" formIndex="1" style="width:100%" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name-four" >结果</td>
			<td  class="dec-self" /><bu:ui colNo="WHL_TIPS_BOX" formId="8c048b8e35874c168fbff6ab0fee4d69"  formIndex="1" style="height:80px;" readonly="readonly"/></td>
		</tr>
	</table>
			<bu:jsVal formId="8c048b8e35874c168fbff6ab0fee4d69" formIndex="1" />
				
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
$(function(){
    $("#paraMap1_WHL_SN").attr("onkeydown","checkSn();");
    $("#paraMap1_WHL_POINT").attr("onkeydown","removeInfo();");
})
//校验产品SN
function checkSn(){
    if(event.keyCode == 13){
        var whlSn = $.trim($("#paraMap1_WHL_SN").val());
            util.showLoading("处理中...");
    			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=5a0c775c8ab542529d78b1eae4c6dc8d";
    	       $.ajax({
    	           type:"post",
    	           dataType:"json",
    	           data: {
    	               "whlSn" : whlSn
    	           },
    	           url:loadItemUrl,
    	           success:function(data){		
                    	util.closeLoading();
                    	if(null==data){
                    	    return;
                    	}
                    	if(null!=data.ajaxMap){
                    	   	if(data.ajaxMap.res=="succ"){
                    	   	    $("#paraMap1_WHL_TIPS_BOX").val("OK");
                    	   	    $("#paraMap1_WHL_TIPS_BOX").attr("style","font-size:28px;height:80px;");
                    	   	    $("#paraMap1_WHL_POINT").removeAttr("readonly");
                    	   	    $("#paraMap1_WHL_POINT").val("").focus();
                    	   	}else{
                    	   	    $("#paraMap1_WHL_TIPS_BOX").val("产品信息不存在");
                    	   	    $("#paraMap1_WHL_TIPS_BOX").attr("style","color:red;font-size:28px;height:80px;");
                    	   	}
                    	}
    	           },
    	           error:function(msg){
    	                if(msg.readyState!=0){
        	               util.closeLoading();
        	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    	                }
    	           }
    	       });	
    }
}
function removeInfo(){
    if(event.keyCode == 13){
        var whlSn = $.trim($("#paraMap1_WHL_SN").val());	
        var point = $.trim($("#paraMap1_WHL_POINT").val());
            util.showLoading("处理中...");
    			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=7f45ca59e3334e0e9e8f61b9a1c329cc";
    	       $.ajax({
    	           type:"post",
    	           dataType:"json",
    	           data: {
    	               "whlSn" : whlSn,
    	               "point" : point
    	           },
    	           url:loadItemUrl,
    	           success:function(data){	
                    	util.closeLoading();
                    	if(null==data){
                    	    return;
                    	}
                    	if(null!=data.ajaxMap){
                    	   	if(data.ajaxMap.res=="succ"){
                    	   	    $("#paraMap1_WHL_TIPS_BOX").val("解除关联成功");
                    	   	    $("#paraMap1_WHL_TIPS_BOX").attr("style","font-size:28px;height:80px;");
                    	   	    $("#paraMap1_WHL_POINT").val("").focus();
                    	   	}else{
                    	   	    $("#paraMap1_WHL_TIPS_BOX").val(data.ajaxMap.res);
                    	   	    $("#paraMap1_WHL_TIPS_BOX").attr("style","color:red;font-size:28px;height:80px;");
                    	   	}
                    	}
    	           },
    	           error:function(msg){
    	                if(msg.readyState!=0){
        	               util.closeLoading();
        	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
    	                }
    	           }
    	       });	
    }
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
