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
<style>
    .checkbox{
       	 
    }
    .label{
        margin-left:5px;
    }
    .span{
        display:inline-block;
        width: 130px;
        margin-bottom: 10px;
    }
    .tips{
        font-weight:bold;
        color:#164b94;
        font-size:14px;
        margin-bottom:10px;
    }
    </style>
	
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                
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
			        <button type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="348dd6256fd14627b7a1363cb4ada379" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="348dd6256fd14627b7a1363cb4ada379" />
	<input type="hidden" id="prefixInd" name="348dd6256fd14627b7a1363cb4ada379" value="paraMap1@" />
	<input type="hidden"  name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a3751de3bc7b44ea810064b4f2f10254'" />
		<s:set name="_$formId_1" value="'348dd6256fd14627b7a1363cb4ada379'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="TPP_MO_NUMBER" formId="348dd6256fd14627b7a1363cb4ada379" /></td>
			<bu:td cssClass="dec-self" colNo="TPP_MO_NUMBER" formId="348dd6256fd14627b7a1363cb4ada379" ><bu:ui style="width:100%" colNo="TPP_MO_NUMBER" formId="348dd6256fd14627b7a1363cb4ada379" value="%{TPP_MO_NUMBER}" formIndex="1" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="TPP_GROUP_CODE" formId="348dd6256fd14627b7a1363cb4ada379" /></td>
			<bu:td cssClass="dec-self" colNo="TPP_GROUP_CODE" formId="348dd6256fd14627b7a1363cb4ada379" ><bu:ui style="width:100%" colNo="TPP_GROUP_CODE" formId="348dd6256fd14627b7a1363cb4ada379" value="%{TPP_GROUP_CODE}" formIndex="1" readonly="readonly"/></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="TPP_SN" formId="348dd6256fd14627b7a1363cb4ada379" /></td>
			<bu:td cssClass="dec-self" colNo="TPP_SN" formId="348dd6256fd14627b7a1363cb4ada379" ><bu:ui style="width:100%" colNo="TPP_SN" formId="348dd6256fd14627b7a1363cb4ada379" value="%{TPP_SN}" formIndex="1" /></bu:td>
		</tr>
	
		<tr>
			<td class="name-three" /><bu:uitn colNo="TPP_REASON" formId="348dd6256fd14627b7a1363cb4ada379" /></td>
			<bu:td cssClass="dec-self" colNo="TPP_REASON" formId="348dd6256fd14627b7a1363cb4ada379" ><bu:ui colNo="TPP_REASON" style="height:80px;" formId="348dd6256fd14627b7a1363cb4ada379" value="%{TPP_REASON}" formIndex="1" /></bu:td>
		</tr>
	</table>
	<div class="" id="proSn" style="height:130px;overflow: auto;">
       
    </div>
			<bu:jsVal formId="348dd6256fd14627b7a1363cb4ada379" formIndex="1" />
				
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
var workSn;
var moNumber;
var groupCode;
$(function(){
    workSn = getParam("workSn");
    moNumber = getParam("moNumber");
    groupCode = getParam("groupCode");
    $("#paraMap1_TPP_SN").removeAttr("disabled");
    $("#paraMap1_TPP_SN").attr("placeholder","输入产品SN回车");
    $("#paraMap1_TPP_SN").focus();
    $("#paraMap1_TPP_SN").attr("onkeydown","checkSn();");
    $("#paraMap1_TPP_MO_NUMBER").val(moNumber);
    $("#paraMap1_TPP_GROUP_CODE").val(groupCode);
    getSnInfo();
})
function getSnInfo(){
    util.showLoading("处理中...");
			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=35fcbd56d6b340f9a8949dd1c3985f9b";
	       $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	               "groupCode" : groupCode,
	               "moNumber" : moNumber
	           },
	           url:loadItemUrl,
	           success:function(data){	
	               util.closeLoading();
                	if(null==data){
                	    return;
                	}
                	if(null!=data.ajaxMap){
                	    $("#paraMap1_TPP_GROUP_CODE").val(data.ajaxMap.GROUP_NAME);
                	}
                	if(null!=data.ajaxList){
                	    var rccList = eval(data.ajaxList);	
                        var tempH="";
                	   	for(var i=0;i<rccList.length;i++){
                	   	    tempH+='<span class="span">';
                	   	    tempH+='<input type="checkbox" class="checkbox" id="'+rccList[i].WT_SN+'" />';
                	   	    tempH+='<label for="'+rccList[i].WT_SN+'" class="label">'+rccList[i].WT_SN+'</label>';
                            tempH+='</span>'
                	    }
                	    $('#proSn').html(tempH);
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
function checkSn(){
    if(event.keyCode == 13){
        
			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=086cd9fbfe7048b09503bf38b9aaf571";	
            var psn = $.trim($("#paraMap1_TPP_SN").val());
            if(psn==""){
                utilsFp.confirmIcon(3,"","","", "请输入产品SN",0,"300","");
                return;
            }
            util.showLoading("处理中...");
	       $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	               "workSn" : workSn,
	               "psn" : psn
	           },
	           url:loadItemUrl,
	           success:function(data){	
	               util.closeLoading();
                	if(null==data){
                	    return;
                	}
                	if(data.ajaxString.indexOf("OK")!=0){						 
                        utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"300","");
                        return;
                    }else{
                        $("#"+psn).attr("checked","checked");
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
function addCal(){
    var proSns="";
    $(".checkbox:checked").each(function(i,item){
        if(proSns==""){
            proSns = $(item).attr('id');
        }else{
            proSns = proSns + "," + $(item).attr('id');
        }
    });
    var reason = $("#paraMap1_TPP_REASON").val();
    if(reason==""){
        utilsFp.confirmIcon(3,"","","", "请填写挂起原因",0,"300","");
        return;
    }
    if(proSns==""){
        utilsFp.confirmIcon(3,"","","", "请选择挂起产品",0,"300","");
        return;
    }
    util.showLoading("处理中...");
			var loadItemUrl="${path}buss/bussModel_exeFunc.ms?funcMId=9c9f19cd8003451d8f1a85a12aab2cb1";
	       $.ajax({
	           type:"post",
	           dataType:"json",
	           data: {
	               "groupCode" : groupCode,
	               "moNumber" : moNumber,
	               "sn" : proSns,
	               "reason" : reason
	           },
	           url:loadItemUrl,
	           success:function(data){	
	               util.closeLoading();
                	msgPop("保存成功","","摩尔提示",200,150,3000);
                   closeWindow();
	           },
	           error:function(msg){
	                if(msg.readyState!=0){
    	               util.closeLoading();
    	               utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
	                }
	           }
	       });
}
/**
 * 获取指定的URL参数值
 * URL:http://www.quwan.com/index?name=tyler
 * 参数：paramName URL参数
 * 调用方法:getParam("name")
 * 返回值:tyler
 */
function getParam(paramName) {
    paramValue = "", isFound = !1;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;
        while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
    }
    return paramValue == "" && (paramValue = null), paramValue
}
</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
