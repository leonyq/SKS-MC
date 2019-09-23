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
			        <button type="button" onclick="addInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" style="height:300px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="2387cf6ddf684e6b9259dccd40aed2d6" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2387cf6ddf684e6b9259dccd40aed2d6" />
	<input type="hidden" name="2387cf6ddf684e6b9259dccd40aed2d6" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="itemCode" id="itemCode" value="" />
	<input type="hidden" name="itemNum" id="itemNum" value="" />
	<input type="hidden" name="lotNo" id="lotNo" value="" />
	
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'de58429937a043b69d9d77f09acbbe00'" />
		<s:set name="_$formId_1" value="'2387cf6ddf684e6b9259dccd40aed2d6'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:120px;"/><span class="dot">*</span><bu:uitn colNo="WIC_ITEM_SN" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WIC_ITEM_SN" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WIC_ITEM_SN" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WIC_ITEM_SN}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:140px;"/><bu:uitn colNo="WSI_ITEM_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:230px;" colNo="WSI_ITEM_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_ITEM_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:120px;"/><bu:uitn colNo="WSI_ITEM_NUM" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:280px;" colNo="WSI_ITEM_NUM" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_ITEM_NUM" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_ITEM_NUM}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:120px;"/><bu:uitn colNo="WSI_LOT_NO" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:280px;" colNo="WSI_LOT_NO" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_LOT_NO" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_LOT_NO}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
		    <td class="name" style="width:120px;"/><bu:uitn colNo="WSI_DOC_NUM" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:280px;" colNo="WSI_DOC_NUM" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_DOC_NUM" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_DOC_NUM}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:120px;"/><bu:uitn colNo="WSI_CONNECT_DOC" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:280px;" colNo="WSI_CONNECT_DOC" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_CONNECT_DOC" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_CONNECT_DOC}" formIndex="1" /></bu:td>
	    </tr>
		<tr>
			<td class="name" style="width:120px;"/><bu:uitn colNo="WSI_SUP_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:280px;" colNo="WSI_SUP_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_SUP_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_SUP_CODE}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:120px;"/><bu:uitn colNo="WSI_CUST_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:280px;" colNo="WSI_CUST_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_CUST_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_CUST_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:120px;"/><bu:uitn colNo="WSI_INVALID_DATE" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:280px;" colNo="WSI_INVALID_DATE" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_INVALID_DATE" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_INVALID_DATE}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:120px;"/><bu:uitn colNo="WSI_WH_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" /></td>
			<bu:td cssClass="dec" style="width:280px;" colNo="WSI_WH_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" ><bu:ui colNo="WSI_WH_CODE" formId="2387cf6ddf684e6b9259dccd40aed2d6" value="%{WSI_WH_CODE}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="2387cf6ddf684e6b9259dccd40aed2d6" formIndex="1" />
				
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
	    var itemCode="";
	    var itemNum="";
	    var lotNo="";
	    $(function(){
            $("#paraMap1_WSI_LOT_NO").attr("disabled",false);
	        $("#paraMap1_WSI_ITEM_NUM").attr("disabled",false);
	        $("#paraMap1_WIC_ITEM_SN").attr("placeholder","请输入物料SN,按Enter键");
        });
		$("#paraMap1_WIC_ITEM_SN").keydown(function(event){
　　　　			if(event.keyCode == 13){
　　　　　　		var itemSn = $.trim($("#paraMap1_WIC_ITEM_SN").val());
　　　　　　		if(itemSn!=""){
　　　　　　		    var url="${path}buss/bussModel_exeFunc.ms?funcMId=143850580bf64f14ae8c5de7a8807b6a";
    			        jQuery.ajax({
    			 			type: "POST",
    			 	   		dataType: "json",
    			 	    	url: url,
    			 	    	data: {
    			 	    	    "itemSn" : itemSn
    			 	    	},
    			 			success: function(data){
    			 				var dataMap=data.ajaxMap;
    			 				if(dataMap==null){
    			 				    utilsFp.confirmIcon(3,"","","", "物料SN不存在,请更换",0,"","");
    			 				    $("#paraMap1_WIC_ITEM_SN").val("");
                        	        $("#paraMap1_WSI_ITEM_CODE_SHOW").val("");
                        	        $("#paraMap1_WSI_ITEM_CODE").val("");
                        	        $("#paraMap1_WSI_ITEM_NUM").val("");
                        	        $("#paraMap1_WSI_LOT_NO").val("");
	                                $("#paraMap1_WSI_CONNECT_DOC").val("");
	                                $("#paraMap1_WSI_SUP_CODE").val("");
	                                $("#paraMap1_WSI_CUST_CODE").val("");
	                                $("#paraMap1_WSI_INVALID_DATE").val("");
	                                $("#paraMap1_WSI_WH_CODE").val("");
	                                $("#paraMap1_WSI_DOC_NUM").val("");
                                    $("#paraMap1_WSI_ITEM_SN").focus();
                                    return;
    			 				}else{
    			 				    if(dataMap.WSI_ITEM_CODE == null) dataMap.WSI_ITEM_CODE = "";
        			 				if(dataMap.WSI_ITEM_NUM == null) dataMap.WSI_ITEM_NUM = "";
        			 				if(dataMap.WSI_LOT_NO == null) dataMap.WSI_LOT_NO = "";
        			 				if(dataMap.WSI_CONNECT_DOC == null) dataMap.WSI_CONNECT_DOC = "";
        			 				if(dataMap.WSI_SUP_CODE == null) dataMap.WSI_SUP_CODE = "";
        			 				if(dataMap.WSI_CUST_CODE == null) dataMap.WSI_CUST_CODE = "";
        			 				if(dataMap.WSI_INVALID_DATE == null) dataMap.WSI_INVALID_DATE = "";
        			 				if(dataMap.WSI_WH_CODE == null) dataMap.WSI_WH_CODE = "";
        			 				if(dataMap.WSI_DOC_NUM == null) dataMap.WSI_DOC_NUM = "";
        			 				itemCode=dataMap.WSI_ITEM_CODE;
                            	    itemNum=dataMap.WSI_ITEM_NUM;
                            	    lotNo=dataMap.WSI_LOT_NO;
    			 				    $("#paraMap1_WSI_ITEM_CODE_SHOW").val(dataMap.WSI_ITEM_CODE);
                        	        $("#paraMap1_WSI_ITEM_CODE").val(dataMap.WSI_ITEM_CODE);
                        	        $("#paraMap1_WSI_ITEM_NUM").val(dataMap.WSI_ITEM_NUM);
                        	        $("#paraMap1_WSI_LOT_NO").val(dataMap.WSI_LOT_NO);
	                                $("#paraMap1_WSI_CONNECT_DOC").val(dataMap.WSI_CONNECT_DOC);
	                                $("#paraMap1_WSI_SUP_CODE").val(dataMap.WSI_SUP_CODE);
	                                $("#paraMap1_WSI_CUST_CODE").val(dataMap.WSI_CUST_CODE);
	                                $("#paraMap1_WSI_INVALID_DATE").val(dataMap.WSI_INVALID_DATE);
	                                $("#paraMap1_WSI_WH_CODE").val(dataMap.WSI_WH_CODE);
	                                $("#paraMap1_WSI_DOC_NUM").val(dataMap.WSI_DOC_NUM);
    			 				}
    			 			},
    			 			error: function(data){
    			 				util.closeLoading();
    			 				
    			 	  }
    			});
　　　　	}
　　　　}
　　}); 
    function addInfo(){    
		
            if(itemCode==$.trim($("#paraMap1_WSI_ITEM_CODE").val()) && itemNum==$.trim($("#paraMap1_WSI_ITEM_NUM").val()) && lotNo==$.trim($("#paraMap1_WSI_LOT_NO").val())){
                utilsFp.confirmIcon(3, "", "", "", "<dict:lang value="物料无变更" />", 0, "260", "");
				return;
            }
            if($("#paraMap1_WIC_ITEM_SN").val() == null || $("#paraMap1_WIC_ITEM_SN").val() ==""){
               	_alertValMsg($('#paraMap1_WIC_ITEM_SN_SHOW'), "<dict:lang value="该项不能为空" />");
                 return ;
            }  
            if(!(/^(\+|-)?\d+$/.test($("#paraMap1_WSI_ITEM_NUM").val())) && $("#paraMap1_WSI_ITEM_NUM").val()!=""){
                _alertValMsg($('#paraMap1_WSI_ITEM_NUM'), "<dict:lang value="该项只能为正整数" />");
                 return ;
            }
				
            if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
			$("#addForm").append($("#isCloseWin").clone());
			$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
			
            $("#itemCode").val($.trim($("#paraMap1_WSI_ITEM_CODE").val()));
            $("#itemNum").val($.trim($("#paraMap1_WSI_ITEM_NUM").val()));
            $("#lotNo").val($.trim($("#paraMap1_WSI_LOT_NO").val()));

            document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=61ab33fa45d642f29f3981cb47d42dc0";
            document.forms.addForm.submit();
                        
    }
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

<!-- 页面结束 -->
 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>
