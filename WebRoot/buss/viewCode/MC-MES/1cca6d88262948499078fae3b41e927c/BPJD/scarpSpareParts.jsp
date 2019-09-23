<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
  <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="inHead" />
  </jsp:include>
	<!-- head里面 -->
</head>
<body>
	<div class="edit">
		<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms?<s:property value='%{@com.more.fw.core.common.method.Constants@FUNC_CODE}' />=<s:property value='%{FUNC_CODE_2}' />" method="post" <bu:formet exeid="%{exeid}" />
					target="submitFrame">
            <div class="hd">
            	
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;">
                <div style="display:none;" class="save-close" <dict:lang value = "关闭保存并关闭窗口" /> onclick="saveClose(this)"></div><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
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
			        <button type="button" onclick="scrap();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:320px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="cbef7e8bb8b04fd2980ff69ee3725893" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cbef7e8bb8b04fd2980ff69ee3725893" />
	<input type="hidden" name="cbef7e8bb8b04fd2980ff69ee3725893" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="addType" id="addType" value="" />
		<s:set name="_$viewId" value="'b412956c73704305bb7f090022aa730a'" />
		<s:set name="_$formId_1" value="'cbef7e8bb8b04fd2980ff69ee3725893'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name"  style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="WSS_ADD_TYPE" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WSS_ADD_TYPE" formId="cbef7e8bb8b04fd2980ff69ee3725893" ><bu:ui colNo="WSS_ADD_TYPE" formId="cbef7e8bb8b04fd2980ff69ee3725893" value="%{WSS_ADD_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name"  style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="WSS_ITEM_SN" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WSS_ITEM_SN" formId="cbef7e8bb8b04fd2980ff69ee3725893" ><bu:ui colNo="WSS_ITEM_SN" formId="cbef7e8bb8b04fd2980ff69ee3725893" value="%{WSS_ITEM_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name"  style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="WSS_ITEM_CODE" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WSS_ITEM_CODE" formId="cbef7e8bb8b04fd2980ff69ee3725893" ><bu:ui colNo="WSS_ITEM_CODE" formId="cbef7e8bb8b04fd2980ff69ee3725893" value="%{WSS_ITEM_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name"  style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="WSS_ITEM_NUM" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WSS_ITEM_NUM" formId="cbef7e8bb8b04fd2980ff69ee3725893" ><bu:ui colNo="WSS_ITEM_NUM" formId="cbef7e8bb8b04fd2980ff69ee3725893" value="%{WSS_ITEM_NUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSS_ITEM_NAME" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<bu:td cssClass="dec" colNo="WSS_ITEM_NAME" formId="cbef7e8bb8b04fd2980ff69ee3725893" ><bu:ui colNo="WSS_ITEM_NAME" formId="cbef7e8bb8b04fd2980ff69ee3725893" value="%{WSS_ITEM_NAME}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name" /><bu:uitn colNo="WSS_ITEM_SPEC" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<bu:td cssClass="dec" colNo="WSS_ITEM_SPEC" formId="cbef7e8bb8b04fd2980ff69ee3725893" ><bu:ui colNo="WSS_ITEM_SPEC" formId="cbef7e8bb8b04fd2980ff69ee3725893" value="%{WSS_ITEM_SPEC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSS_PRODUCE_DATE" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<bu:td cssClass="dec" colNo="WSS_PRODUCE_DATE" formId="cbef7e8bb8b04fd2980ff69ee3725893" ><bu:ui colNo="WSS_PRODUCE_DATE" formId="cbef7e8bb8b04fd2980ff69ee3725893" value="%{WSS_PRODUCE_DATE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WSS_MEMO" formId="cbef7e8bb8b04fd2980ff69ee3725893" /></td>
			<bu:td cssClass="dec" colNo="WSS_MEMO" formId="cbef7e8bb8b04fd2980ff69ee3725893"  colspan="4"><bu:ui style="height:80px;width:100%" colNo="WSS_MEMO" formId="cbef7e8bb8b04fd2980ff69ee3725893" value="%{WSS_MEMO}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="cbef7e8bb8b04fd2980ff69ee3725893" formIndex="1" />
				
			</div>
		 </form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<script type="text/javascript">
	//新增方式
	$("#paraMap1_WSS_ADD_TYPE").change(function(){
	    var addType=$(this).val();
	    if(addType==1){
	        //个体
	        $("#paraMap1_WSS_ITEM_CODE_SHOW").val("");
	        $("#paraMap1_WSS_ITEM_CODE").val("");
	        $("#paraMap1_WSS_ITEM_NAME").val("");
	        $("#paraMap1_WSS_ITEM_SPEC").val("");
	        $("#paraMap1_WSS_ITEM_CODE_SHOW").attr("disabled",true);
	        $("#paraMap1_WSS_ITEM_SN").attr("disabled",false);
	         $("#paraMap1_WSS_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
	    }else if(addType==2){
	        //批量
	        $("#paraMap1_WSS_ITEM_SN").val("");
	        $("#paraMap1_WSS_ITEM_CODE_SHOW").val("");
	        $("#paraMap1_WSS_ITEM_CODE").val("");
	        $("#paraMap1_WSS_ITEM_NAME").val("");
	        $("#paraMap1_WSS_ITEM_SPEC").val("");
	        $("#paraMap1_WSS_ITEM_CODE_SHOW").attr("disabled",false);
	        $("#paraMap1_WSS_ITEM_SN").attr("disabled",true);
	        $("#paraMap1_WSS_ITEM_SN").attr("placeholder","");
	    }
	});
	function scrap(){
	    //if(!valData()){
			//return ;
		//}
		//if(!val.valOjbsData()){
			//return ;
		//}
		//if(!val.valDataBaseSetData()){
            //return ;
        //}
        var scdataAuth = $("#deptLs_data_auth").val();
	    if(scdataAuth==""){
	        _alertValMsg($("#deptLs_data_auth"), "<dict:lang value="该项不能为空" />");
	    	return;
	    }        
	    var addType=$("#paraMap1_WSS_ADD_TYPE").val();
	    if(addType==""){
	        _alertValMsg($("#paraMap1_WSS_ADD_TYPE_chosen"), "<dict:lang value="该项不能为空" />");
	    	return;
	    }else{
	        if(addType=="1"){
	            if($("#paraMap1_WSS_ITEM_SN").val()==""){
    	            _alertValMsg($("#paraMap1_WSS_ITEM_SN"), "<dict:lang value="该项不能为空" />");
    	    	    return;		
                }
	        }else if(addType=="2"){
	            if($("#paraMap1_WSS_ITEM_CODE").val()==""){
    	            _alertValMsg($("#paraMap1_WSS_ITEM_CODE_SHOW"), "<dict:lang value="该项不能为空" />");
    	    	    return;	
    	    	}
	        }
	    }
	    if($("#paraMap1_WSS_ITEM_NUM").val()==""){
	        _alertValMsg($("#paraMap1_WSS_ITEM_NUM"), "<dict:lang value="该项不能为空" />");
	    	return;
	    }else{
	        if(!/^\+?[1-9][0-9]*$/.test($("#paraMap1_WSS_ITEM_NUM").val())) {
				_alertValMsg($('#paraMap1_WSS_ITEM_NUM'), "<dict:lang value="该项只能为正整数" />");
				return;
			}
	    }
                        
        $("#addType").val(addType);
        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=f4dd24ee04124c69b349311781f691ef";
        document.forms.addForm.submit();
	}
	$("#paraMap1_WSS_ITEM_SN").keydown(function(event){
　　　　			if(event.keyCode == 13){
　　　　　　		var itemSn = $("#paraMap1_WSS_ITEM_SN").val();
　　　　　　		if(itemSn!=""){
　　　　　　		    var url="${path}buss/bussModel_exeFunc.ms?funcMId=8b052dadedeb4237b4fe02d2791cac16&formId=%{formId}";
    			        jQuery.ajax({
    			 			type: "POST",
    			 	   		dataType: "json",
    			 	    	url: url+"&itemSn="+itemSn,
    			 			success: function(data){
    			 				var dataMap=data.ajaxMap;
    			 				if(dataMap.FLAG=="FALSE"){
    			 				    utilsFp.confirmIcon(3,"","","", "物料SN不存在,请更换",0,"","");
    			 				    $("#paraMap1_WSS_ITEM_SN").val("");
                        	        $("#paraMap1_WSS_ITEM_CODE_SHOW").val("");
                        	        $("#paraMap1_WSS_ITEM_CODE").val("");
                        	        $("#paraMap1_WSS_ITEM_NAME").val("");
                        	        $("#paraMap1_WSS_ITEM_SPEC").val("");
                                    $("#paraMap1_WSS_ITEM_SN").focus();
                                    return;
    			 				}else{
                        	        $("#paraMap1_WSS_ITEM_CODE_SHOW").val(dataMap.ITEM_CODE);
                        	        $("#paraMap1_WSS_ITEM_CODE").val(dataMap.ITEM_CODE);
                        	        $("#paraMap1_WSS_ITEM_NAME").val(dataMap.ITEM_NAME);
                        	        $("#paraMap1_WSS_ITEM_SPEC").val(dataMap.ITEM_SPEC);
    			 				}
    			 			},
    			 			error: function(XMLHttpRequest, textStatus, errorThrown){
    			 				util.closeLoading();
    			 				var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
    			 				if (null != sessionstatus && sessionstatus == "noAuthority") {
    			 				}else{
    			 			}
    			 	  }
    			});
　　　　	}
　　　　}
　　});
	</script>
	 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    	<jsp:param name="modelName" value="VIEW_TYPE_10" />
     	<jsp:param name="location" value="jsLoading" />
  	</jsp:include>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
