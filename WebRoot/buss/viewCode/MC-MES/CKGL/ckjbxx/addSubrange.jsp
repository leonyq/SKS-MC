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
			        <button id="saveBtn" type="button" onclick="addCal();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			   
			</div>
			<div class="bd" >
	    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="7e97b82277324898b85d8a12875adab9" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="WA_AREA_TYPE" id="WA_AREA_TYPE" />
	<input type="hidden" name="WA_SUPERIOR_SN" id="WA_SUPERIOR_SN" />
	<input type="hidden" name="formIds" value="7e97b82277324898b85d8a12875adab9" />
	<input type="hidden" name="7e97b82277324898b85d8a12875adab9" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'11342af687e94be694af08dda82e4e84'" />
		<s:set name="_$formId_1" value="'7e97b82277324898b85d8a12875adab9'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name"  style="width:80px" /><span class="dot">*</span><bu:uitn colNo="WA_ADD_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_ADD_TYPE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_ADD_TYPE" formId="7e97b82277324898b85d8a12875adab9" onchange="changeAddType();" value="%{WA_ADD_TYPE}" formIndex="1" style="width:200px;" /></bu:td>
            			
            <td class="name" /><bu:uitn colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_TYPE" formId="7e97b82277324898b85d8a12875adab9" onchange="changeType();" value="%{WA_AREA_TYPE}" formIndex="1" style="width:200px;" /></bu:td>
				    	
            <td class="name" /><bu:uitn colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SUPERIOR_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SUPERIOR_SN}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WA_SN_PREFIX" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WA_SN_PREFIX" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SN_PREFIX" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SN_PREFIX}" formIndex="1" style="width:200px;" /></bu:td>	
				
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_START_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_START_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_START_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_START_SN}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_SN_NUM" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WA_SN_NUM" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SN_NUM" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SN_NUM}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_SN}" formIndex="1" style="width:200px;" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_AREA_NAME" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_AREA_NAME}" formIndex="1" style="width:200px;" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_RELATE_ORDERSET" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_RELATE_ORDERSET}" formIndex="1" style="width:200px;" /></bu:td>
		</tr>
		
		
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STAROGE_TYPE" formId="7e97b82277324898b85d8a12875adab9" onchange="changeState();" value="%{WA_STAROGE_TYPE}" formIndex="1" style="width:200px;" /></bu:td>
		    
		    <td class="name" /><bu:uitn colNo="WA_FACE" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_FACE" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_FACE" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_FACE}" formIndex="1" style="width:200px;" /></bu:td>
		   
		  <td class="name" /><bu:uitn colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_IP" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_IP}" formIndex="1" style="width:200px;" /></bu:td>	

		    	
           
		    
		    	
		</tr>
		<tr>
		     <td class="name" /><bu:uitn colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_SN" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_SN}" formIndex="1" style="width:200px;" /></bu:td>
		    
		    <td class="name" /><bu:uitn colNo="WA_SHELF_PREFIX" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_SHELF_PREFIX" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_SHELF_PREFIX" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_SHELF_PREFIX}" formIndex="1" style="width:200px;" /></bu:td>

		
            <td class="name" /><bu:uitn colNo="WA_START_SHELF" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_START_SHELF" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_START_SHELF" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_START_SHELF}" formIndex="1" style="width:200px;" /></bu:td>
				    	
		  
			
           
           
		</tr>
		<tr>			
            <td class="name" /><bu:uitn colNo="WA_STOREY_NO" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STOREY_NO" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STOREY_NO" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STOREY_NO}" formIndex="1" style="width:200px;" /></bu:td>
		    	            			
	
            <td class="name" /><bu:uitn colNo="WA_FLOW_NUM" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_FLOW_NUM" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_FLOW_NUM" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_FLOW_NUM}" formIndex="1" style="width:200px;" /></bu:td>
		    	

		    
            <td class="name" /><bu:uitn colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_STORAGE_CAPACITY" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_STORAGE_CAPACITY}" formIndex="1" style="width:200px;" /></bu:td>
	    
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" /></td>
			<bu:td cssClass="dec" colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" ><bu:ui colNo="WA_VOLUME" formId="7e97b82277324898b85d8a12875adab9" value="%{WA_VOLUME}" formIndex="1" style="width:200px;" /></bu:td>
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
<bu:script viewId="11342af687e94be694af08dda82e4e84" />
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
var areaType = '${dataMap.areaType}';
var highSn = '${dataMap.highSn}';
var tempOption = "<option value='2'><dict:lang value='库区' /></option><option value='3'><dict:lang value='库位'/></option>";
$(function(){
	
	$("#paraMap1_WA_SUPERIOR_SN").val(highSn);
	if(areaType==1){
		$("#paraMap1_WA_AREA_TYPE").removeAttr("disabled");
		$("#paraMap1_WA_AREA_TYPE").empty();
		$("#paraMap1_WA_AREA_TYPE").append(tempOption);
		$("#paraMap1_WA_AREA_TYPE").trigger("chosen:updated");
		
	}else if(areaType==2){
		$("#paraMap1_WA_AREA_TYPE").removeAttr("disabled");
		$("#paraMap1_WA_AREA_TYPE").empty();
		$("#paraMap1_WA_AREA_TYPE").append(tempOption);
		$("#paraMap1_WA_AREA_TYPE").trigger("chosen:updated");
	//	$("#paraMap1_WA_STOREY_NO").removeAttr("disabled");
		
		/*$("#paraMap1_WA_AREA_TYPE").val("3");
		$("#paraMap1_WA_AREA_TYPE").trigger("chosen:updated");*/
	}
	changeType();
	changeAddType();
})
function setHid(){
	$("#WA_AREA_TYPE").val($("#paraMap1_WA_AREA_TYPE").val());
	$("#WA_SUPERIOR_SN").val($("#paraMap1_WA_SUPERIOR_SN").val());
}
function changeState(){
    if($("#paraMap1_WA_STAROGE_TYPE").val()==1){ //電子貨架
        if($("#paraMap1_WA_ADD_TYPE").val()==2){
            $("#paraMap1_WA_SHELF_SN").attr("disabled","disabled");
            $("#paraMap1_WA_SHELF_SN").attr("class"," input isSubmit readonly  _VAL_DATABASE");	
            $("#paraMap1_WA_SHELF_PREFIX").removeAttr("disabled");
            $("#paraMap1_WA_SHELF_PREFIX").attr("class"," input isSubmit _VAL_DATABASE");
            $("#paraMap1_WA_START_SHELF").removeAttr("disabled");
            $("#paraMap1_WA_START_SHELF").attr("class","_VAL_NULL input isSubmit  _VAL_DATABASE");
        }else{
            $("#paraMap1_WA_SHELF_SN").removeAttr("disabled");
            $("#paraMap1_WA_SHELF_SN").attr("class","_VAL_NULL input isSubmit  _VAL_DATABASE");	
            $("#paraMap1_WA_START_SHELF").attr("disabled","disabled");
            $("#paraMap1_WA_START_SHELF").attr("class"," input isSubmit readonly  _VAL_DATABASE");	
            $("#paraMap1_WA_SHELF_PREFIX").attr("disabled","disabled");
            $("#paraMap1_WA_SHELF_PREFIX").attr("class"," input isSubmit readonly _VAL_DATABASE");
        }
        
    }else if($("#paraMap1_WA_STAROGE_TYPE").val()==2){ //普通貨架
        //$("#paraMap1_WA_SHELF_SN").attr("class"," input isSubmit  _VAL_DATABASE");
	    //$("#paraMap1_WA_START_SHELF").attr("class"," input isSubmit  _VAL_DATABASE");
	    if($("#paraMap1_WA_ADD_TYPE").val()==2){
            $("#paraMap1_WA_SHELF_SN").attr("disabled","disabled");
            $("#paraMap1_WA_SHELF_SN").attr("class"," input isSubmit readonly  _VAL_DATABASE");	
            $("#paraMap1_WA_SHELF_PREFIX").removeAttr("disabled");
            $("#paraMap1_WA_SHELF_PREFIX").attr("class"," input isSubmit _VAL_DATABASE");
            $("#paraMap1_WA_START_SHELF").removeAttr("disabled");
            $("#paraMap1_WA_START_SHELF").attr("class"," input isSubmit  _VAL_DATABASE");
        }else{
            $("#paraMap1_WA_SHELF_SN").removeAttr("disabled");
            $("#paraMap1_WA_SHELF_SN").attr("class"," input isSubmit  _VAL_DATABASE");	
            $("#paraMap1_WA_START_SHELF").attr("disabled","disabled");
            $("#paraMap1_WA_START_SHELF").attr("class"," input isSubmit readonly  _VAL_DATABASE");	
            $("#paraMap1_WA_SHELF_PREFIX").attr("disabled","disabled");
            $("#paraMap1_WA_SHELF_PREFIX").attr("class"," input isSubmit readonly _VAL_DATABASE");
        }
    }
}
//改变新增方式
function changeAddType(){
    if($("#paraMap1_WA_ADD_TYPE").val()==1){ //个体
        $("#paraMap1_WA_SN_PREFIX").attr("disabled","disabled");
        $("#paraMap1_WA_SN_PREFIX").attr("class","input isSubmit  readonly _VAL_DATABASE");
        $("#paraMap1_WA_START_SN").attr("disabled","disabled");
        $("#paraMap1_WA_START_SN").attr("class","input isSubmit  readonly _VAL_DATABASE");
        $("#paraMap1_WA_SN_NUM").attr("disabled","disabled");
        $("#paraMap1_WA_SN_NUM").attr("class","input isSubmit  readonly _VAL_DATABASE");
        $("#paraMap1_WA_AREA_SN").removeAttr("disabled");
        $("#paraMap1_WA_AREA_SN").attr("class","_VAL_NULL input isSubmit _VAL_DATABASE");
        
        changeType();
        changeState();
    }else if($("#paraMap1_WA_ADD_TYPE").val()==2){ //批量
        $("#paraMap1_WA_SN_PREFIX").removeAttr("disabled");
        $("#paraMap1_WA_SN_PREFIX").attr("class","input isSubmit  _VAL_DATABASE");
        $("#paraMap1_WA_START_SN").removeAttr("disabled");
        $("#paraMap1_WA_START_SN").attr("class","_VAL_NULL input isSubmit  _VAL_DATABASE");
        $("#paraMap1_WA_SN_NUM").removeAttr("disabled");
        $("#paraMap1_WA_SN_NUM").attr("class","_VAL_NULL input isSubmit  _VAL_DATABASE");
        $("#paraMap1_WA_AREA_SN").attr("disabled","disabled");
        $("#paraMap1_WA_AREA_SN").attr("class"," input isSubmit  readonly _VAL_DATABASE");
        
        changeType();
        changeState();
    }
}
//如果选择的是库位则要选择货架
function changeType(){
    if($("#paraMap1_WA_AREA_TYPE").val()==3){
        //$("#paraMap1_WA_STAROGE_TYPE").val("2");
        $("#paraMap1_WA_STAROGE_TYPE").removeAttr("disabled");
        $("#paraMap1_WA_STAROGE_TYPE").trigger("chosen:updated");
        $("#paraMap1_WA_STAROGE_TYPE").attr("class","_VAL_NULL input isSubmit _VAL_OjbsData dept_select");
        $("#paraMap1_WA_FACE").removeAttr("disabled");
        $("#paraMap1_WA_FACE").val("S");
        $("#paraMap1_WA_FACE").trigger("chosen:updated");
        $("#paraMap1_WA_FACE").attr("class","_VAL_NULL input isSubmit _VAL_OjbsData dept_select");
        $("#paraMap1_WA_STOREY_NO").removeAttr("disabled");
        $("#paraMap1_WA_STOREY_NO").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData  isaddSubmit");
        $("#paraMap1_WA_STOREY_NO").val("1");
        $("#paraMap1_WA_FLOW_NUM").removeAttr("disabled");
        $("#paraMap1_WA_FLOW_NUM").attr("class","_VAL_NULL input isSubmit  _VAL_OjbsData  isaddSubmit");
        $("#paraMap1_WA_FLOW_NUM").val("3");
        
        
    }else{
        $("#paraMap1_WA_STAROGE_TYPE").val("");
        $("#paraMap1_WA_STAROGE_TYPE").attr("disabled","disabled");
        $("#paraMap1_WA_STAROGE_TYPE").trigger("chosen:updated");
        $("#paraMap1_WA_STAROGE_TYPE").attr("class"," input isSubmit _VAL_OjbsData dept_select");
        $("#paraMap1_WA_FACE").val("");
        $("#paraMap1_WA_FACE").attr("disabled","disabled");
        $("#paraMap1_WA_FACE").trigger("chosen:updated");
        $("#paraMap1_WA_FACE").attr("class"," input isSubmit _VAL_OjbsData dept_select");
        $("#paraMap1_WA_SHELF_SN").attr("disabled","disabled");
        $("#paraMap1_WA_SHELF_SN").attr("class"," input isSubmit readonly _VAL_DATABASE");
        
        $("#paraMap1_WA_SHELF_PREFIX").attr("disabled","disabled");
        $("#paraMap1_WA_SHELF_PREFIX").attr("class"," input isSubmit readonly _VAL_DATABASE");
        $("#paraMap1_WA_START_SHELF").attr("disabled","disabled");
        $("#paraMap1_WA_START_SHELF").attr("class"," input isSubmit readonly _VAL_DATABASE");
        $("#paraMap1_WA_STOREY_NO").val("");
        $("#paraMap1_WA_FLOW_NUM").val("");
        $("#paraMap1_WA_STOREY_NO").attr("disabled","disabled");
        $("#paraMap1_WA_FLOW_NUM").attr("disabled","disabled");
    }
}

$(function(){
   

	var obj = document.getElementById("paraMap1_WA_START_SN");
   var json = {"UI_RULE_RIGHT":"","UI_RULE_TIP":"请输入0或正整数","UI_RULE_LEFT":"0","UI_RULE":"number"};
   obj.validateJson = json;
   addLoadEvent(function () 
   {
   initValidate(obj);
   });
})
function checkNum(){
        var startSn = $.trim($("#paraMap1_WA_START_SN").val());
        var endSn = $.trim($("#paraMap1_WA_END_SN").val());
		/*if(!(/^(\+|-)?\d+$/.test( startSn )) || startSn < 0){
			    _alertValMsg($("#paraMap1_WA_START_SN"),"<dict:lang value="该项必须为0或正整数" />");
			    return "0";  
		}
		if(!(/^(\+|-)?\d+$/.test( endSn )) || endSn < 0){
			    _alertValMsg($("#paraMap1_WA_END_SN"),"<dict:lang value="该项必须为0或正整数" />");
			    return "0";  
		}*/
		if(parseInt(startSn)>=parseInt(endSn)){
		        _alertValMsg($("#paraMap1_WA_START_SN"),"<dict:lang value="起始编码应小于结束编码" />");
			    return "0"; 
		}
}
var isQuery = false;
function addCal(){
           /* if(isQuery){
    	        //utilsFp.confirmIcon(1,"","","", "<dict:lang value="数据正在提交，请稍候..."/>",0,"300","");
    	        return;
    	    }*/
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
            var tempFl = checkNum();
            if(tempFl=="0"){
                return;
            }
            
            var nums=Number($("#paraMap1_WA_FLOW_NUM").val());
            var snNum=$("#paraMap1_WA_SN_NUM").val();
            var waStartSn=Number($("#paraMap1_WA_START_SN").val());
            var maxSn=(Number(snNum)+waStartSn-1)+"";
           var types=$("#paraMap1_WA_AREA_TYPE").val();
           if(types=="3"){
            if(maxSn.length>nums){
                _alertValMsg($("#paraMap1_WA_START_SN"),"<dict:lang value="最高编码超过流水位数" />");
                return;
            }
             if(snNum.length>nums){
                _alertValMsg($("#paraMap1_WA_SN_NUM"),"<dict:lang value="数量超过流水位数" />");
                return;
            }
            }
            
            if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			
                        setHid();
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=fd4a131ccd2143e192b5ae346060187d";
                        document.forms.addForm.submit();
            isQuery = true;
            $("#saveBtn").removeAttr("disabled");
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
