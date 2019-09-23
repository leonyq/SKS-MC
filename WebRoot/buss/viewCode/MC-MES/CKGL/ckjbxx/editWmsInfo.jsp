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
                <div style="margin-left:40px;">
                
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
			<div class="bd"  style="height: 350px;">
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="7e97b82277324898b85d8a12875adab9" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="WA_AREA_SN" id="WA_AREA_SN" />
	<input type="hidden" name="WA_AREA_TYPE" id="WA_AREA_TYPE" />
	<input type="hidden" name="WA_SUPERIOR_SN" id="WA_SUPERIOR_SN" />
	<input type="hidden" name="formIds" value="7e97b82277324898b85d8a12875adab9" />
	<input type="hidden" name="7e97b82277324898b85d8a12875adab9" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'66762ec235564663a097cea70f25d92a'" />
		<s:set name="_$formId_1" value="'7e97b82277324898b85d8a12875adab9'" />
		<s:set name="_$type" value="'add'" />
		<tr>
		    <td class="name" style="width:80px" /><bu:uitn colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_TYPE}" formIndex="1" style="width:200px;" /></bu:td>
		    	
	        <td class="name" /><bu:uitn colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SUPERIOR_SN}" formIndex="1" style="width:200px;" /></bu:td>
		
            <td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" onchange="changeState();" value="%{WA_STAROGE_TYPE}" formIndex="1" style="width:200px;" /></bu:td>
			
			
			
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_SN}" formIndex="1" style="width:200px;" /></bu:td>
		
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" style="width:220px;" colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_NAME}" formIndex="1" style="width:200px;" /></bu:td>	
		
		    <td class="name" /><bu:uitn colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_RELATE_ORDERSET}" formIndex="1" style="width:200px;" /></bu:td>
		
		</tr>
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_FACE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_FACE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_FACE" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_FACE}" formIndex="1" style="width:200px;" /></bu:td>
		
	        <td class="name" /><bu:uitn colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_IP}" formIndex="1" style="width:200px;" /></bu:td>
	        		
            <td class="name" /><bu:uitn colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_SN}" formIndex="1" style="width:200px;" /></bu:td>
		
			
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WA_STOREY_NO" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STOREY_NO" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STOREY_NO" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STOREY_NO}" formIndex="1" style="width:200px;" /></bu:td>
		    	
		    <td class="name" /><bu:uitn colNo="WA_FLOW_NUM" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_FLOW_NUM" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_FLOW_NUM" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_FLOW_NUM}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="WA_FLOW_NO" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_FLOW_NO" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_FLOW_NO" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_FLOW_NO}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
		    <td class="name" /><bu:uitn colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STORAGE_CAPACITY}" formIndex="1" style="width:200px;" /></bu:td>
		    <!--
			<td class="name" /><bu:uitn colNo="WA_STORAGE_FLAG" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STORAGE_FLAG" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STORAGE_FLAG" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STORAGE_FLAG}" formIndex="1" style="width:200px;" /></bu:td>
			-->
			<td class="name" /><bu:uitn colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9"  ><bu:ui colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" dataId="${dataId}" formIndex="1" style="width:200px;" /></bu:td>
		    <!--
			<td class="name" /><bu:uitn colNo="WA_VALID_FLAG" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_VALID_FLAG" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_VALID_FLAG" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_VALID_FLAG}" formIndex="1" /></bu:td>
		    -->	
            <td class="name" /><bu:uitn colNo="WA_BAD_FLAG" formId="7e97b82277324898b85d8a12875adab9" /></td>
		    <bu:td cssClass="dec" colNo="WA_BAD_FLAG" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_BAD_FLAG" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_BAD_FLAG}" formIndex="1"  /></bu:td>
	        			
    
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WA_MEMO" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_MEMO" formId="7e97b82277324898b85d8a12875adab9" style="height:80px;" colspan="5" ><bu:ui colNo="WA_MEMO" style="height:100%;width:100%;" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_MEMO}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" />说明：</td>
			<bu:td cssClass="dec-self" colNo="说明" formId="076c88e377ff4b5abf801455c055a202" style="height:50px;" colspan="5">容量按个体算,容积单位为m³;新增货位需填写所属层数及流水位数;货位有单面/正面/反面之分,
			默认为单面;电子货架需设置货架服务IP及库位硬体编码。
			</bu:td>
		</tr>
	</table>
			<bu:jsVal formId="7e97b82277324898b85d8a12875adab9" formIndex="1" />
				
			</div>
		 </form>
	</div>
<bu:script viewId="66762ec235564663a097cea70f25d92a" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
function changeState(){
    if($("#paraMap1_WA_STAROGE_TYPE").val()==1){ //電子貨架
        $("#paraMap1_WA_SHELF_SN").attr("class","_VAL_NULL input isSubmit  _VAL_DATABASE");
    }else if($("#paraMap1_WA_STAROGE_TYPE").val()==2){ //普通貨架
        $("#paraMap1_WA_SHELF_SN").attr("class"," input isSubmit  _VAL_DATABASE");
    }
}
//如果选择的是库位则要选择货架
function changeType(){
    if($("#paraMap1_WA_AREA_TYPE").val()==3){
        $("#paraMap1_WA_STOREY_NO").removeAttr("disabled");
         $("#paraMap1_WA_STOREY_NO").attr("class","_VAL_NULL input isSubmit _VAL_OjbsData isaddSubmit _VAL_DATABASE");
         
    }else{
        $("#paraMap1_WA_STAROGE_TYPE").val("");
        $("#paraMap1_WA_STAROGE_TYPE").attr("disabled","disabled");
        $("#paraMap1_WA_STAROGE_TYPE").trigger("chosen:updated");
        $("#paraMap1_WA_STAROGE_TYPE").attr("class"," input isSubmit _VAL_OjbsData dept_select");
        $("#paraMap1_WA_SHELF_SN").attr("disabled","disabled");
        $("#paraMap1_WA_SHELF_SN").attr("class"," input isSubmit readonly _VAL_DATABASE");
        $("#paraMap1_WA_FACE").attr("disabled","disabled");
        $("#paraMap1_WA_FACE").trigger("chosen:updated");
        $("#paraMap1_WA_FACE").attr("class"," input isSubmit _VAL_OjbsData dept_select");
    }
}
$(function(){
        
        $("#paraMap1_WA_AREA_SN").attr("class"," input isSubmit  readonly isaddSubmit");
        $("#paraMap1_WA_AREA_SN").attr("disabled","disabled");
	$.ajax({
			    type: "POST",
			    dataType: "json",
			    url: "${path}buss/bussModel_exeFunc.ms?funcMId=7473519517ab493e9c750f9c9a906831",
			    data: {"areaSn":"${dataMap.areaSn}","dataAuth":"${sessionScope.mcDataAuth}"},
				success: function(data){
						if(null != data.ajaxList){
							var rccList = eval(data.ajaxList);
							$("#WA_AREA_SN").val(rccList[0].WA_AREA_SN);
							$("#WA_AREA_TYPE").val(rccList[0].WA_AREA_TYPE);
							$("#WA_SUPERIOR_SN").val(rccList[0].WA_SUPERIOR_SN);
							if(rccList[0].WA_SUPERIOR_SN=='-1') rccList[0].WA_SUPERIOR_SN="";
							$("#deptLs_data_auth").val(rccList[0].DATA_AUTH);
							$("#deptLs_data_auth").trigger("chosen:updated");
							$("#paraMap1_WA_AREA_SN").val(rccList[0].WA_AREA_SN);
							$("#paraMap1_WA_AREA_NAME").val(rccList[0].WA_AREA_NAME);
							$("#paraMap1_WA_AREA_TYPE").val(rccList[0].WA_AREA_TYPE);
							$("#paraMap1_WA_AREA_TYPE").trigger("chosen:updated");
							$("#paraMap1_WA_SUPERIOR_SN").val(rccList[0].WA_SUPERIOR_SN);
							$("#paraMap1_WA_STORAGE_CAPACITY").val(rccList[0].WA_STORAGE_CAPACITY);
							$("#paraMap1_WA_RELATE_ORDERSET").val(rccList[0].WA_RELATE_ORDERSET);
							$("#paraMap1_WA_RELATE_ORDERSET").trigger("chosen:updated");
							$("#paraMap1_WA_SHELF_SN").val(rccList[0].WA_SHELF_SN);
							$("#paraMap1_WA_SHELF_IP").val(rccList[0].WA_SHELF_IP);
							$("#paraMap1_WA_STORAGE_FLAG").val(rccList[0].WA_STORAGE_FLAG);
							$("#paraMap1_WA_STAROGE_TYPE").val(rccList[0].WA_STAROGE_TYPE);
							$("#paraMap1_WA_STAROGE_TYPE").trigger("chosen:updated");
						    $("#paraMap1_WA_VOLUME").val(rccList[0].WA_VOLUME);
							$("#paraMap1_WA_MEMO").val(rccList[0].WA_MEMO);
							$("#paraMap1_WA_FACE").val(rccList[0].WA_FACE);
							 $("#paraMap1_WA_FACE").trigger("chosen:updated");
							 $("#paraMap1_WA_FLOW_NUM").val(rccList[0].WA_FLOW_NUM);
							 $("#paraMap1_WA_STOREY_NO").val(rccList[0].WA_STOREY_NO);
							 $("#paraMap1_WA_FLOW_NO").val(rccList[0].WA_FLOW_NO);
							if(rccList[0].WA_BAD_FLAG=="Y"){
							    $("#paraMap1_WA_BAD_FLAG_1").attr("checked",true);
							}
							changeType();
							changeState();
							
						}
						
					},
				error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }
				});
})
function addCal(){
            if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
		    if(!val.valDataBaseSetData()){
                return ;
            }
                       
                        var WA_AREA_TYPES=$("#WA_AREA_TYPE").val();
                        var face=$("#paraMap1_WA_FACE").val();
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=3aa3eb03580b482e994f90c24bb53f9c&WA_AREA_TYPES="+WA_AREA_TYPES;
                        
                        document.forms.addForm.submit();

}
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
