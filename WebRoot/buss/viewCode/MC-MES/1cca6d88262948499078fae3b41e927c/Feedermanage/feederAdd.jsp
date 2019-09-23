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
	<div class="edit" style="height:260px">
	<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
            <div class="hd">
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
			        <button type="button" onclick="addFeeder();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height: 234px;">
						    			
					<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    				   <jsp:param name="modelName" value="VIEW_TYPE_10" />
     				   <jsp:param name="location" value="addForm" />
  					</jsp:include>
		<bu:set name="paraMapObj" value="${dataId}" formId="90caa73200734f6c938d5aa280a9664a" type="add" />
	<table class="basic-table"   >
	<input type="hidden" name="formIds" value="90caa73200734f6c938d5aa280a9664a" />
	<input type="hidden" name="90caa73200734f6c938d5aa280a9664a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="paraMap1@0#CREATE_USER" id="paraMap1_CREATE_USER" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}" />">
		<s:set name="_$viewId" value="'c33f9fa5264948af9ffa49574b2a834c'" />
		<s:set name="_$formId_1" value="'90caa73200734f6c938d5aa280a9664a'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name"  style="width:95px;"/><bu:uitn colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a"  /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a" value="%{ADD_TYPE}" formIndex="2" style="width:200px;"/></bu:td>
			
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec"  colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_FEEDER_SN}" formIndex="1" style="width:200px;"/></bu:td>
			
			<td class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec"  colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" value="%{BATCH_NUMBER}" formIndex="1" style="width:200px;"/></bu:td>
			
		</tr>
		
		<tr>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCS_SPEC}" formIndex="1" style="width:200px;"/></bu:td>
		

			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCT_TYPE}" formIndex="1" style="width:200px;"/></bu:td>
			
        	<td class="name" /><bu:uitn colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a"  colspan="7"><bu:ui colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_FEEDER_ID}" formIndex="1" style="width:200px;"/></bu:td>
        </tr>
		
		<tr>
		    <td class="name" /><bu:uitn colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_LEFT_CHANNEL_SN}" formIndex="1" style="width:200px;"/></bu:td>
		
	        <td class="name" /><bu:uitn colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_RIGHT_CHANNEL_SN}" formIndex="1" style="width:200px;"/></bu:td>
		
	        <td class="name" /><bu:uitn colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MIDDLE_CHANNEL_SN}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		
		<tr>
		     <td class="name" /><span class="dot">*</span><bu:uitn colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec"  colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCT_MAX_COUNT}" formIndex="1" style="width:200px;"/></bu:td>
		
            <td class="name" /><span class="dot">*</span><bu:uitn colNo="TCS_USE_TIME" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_USE_TIME" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_USE_TIME" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCS_USE_TIME}" formIndex="1" style="width:200px;"/></bu:td>
		    	
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="TCS_REMIND_NUM" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_REMIND_NUM" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_REMIND_NUM" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCS_REMIND_NUM}" formIndex="1" style="width:200px;"/></bu:td>
			
		</tr>
		
		<tr>
			 <td class="name" /><span class="dot">*</span><bu:uitn colNo="TCS_MAX_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_MAX_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_MAX_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCS_MAX_CYCLE}" formIndex="1" style="width:200px;"/></bu:td>
		    	
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="TCS_MT_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_MT_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_MT_CYCLE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCS_MT_CYCLE}" formIndex="1" style="width:200px;"/></bu:td>
		
		 <td class="name" /><span class="dot">*</span><bu:uitn colNo="TCS_REMIND_DAY" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_REMIND_DAY" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_REMIND_DAY" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCS_REMIND_DAY}" formIndex="1" style="width:200px;"/></bu:td>
		</tr>
		
		
	</table>
			<bu:jsVal formId="90caa73200734f6c938d5aa280a9664a" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_10" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		//$("#paraMap1_BATCH_NUMBER").attr("disabled",false);
		$("#paraMap1_TCF_FEEDER_SN").addClass("_VAL_NULL");
		
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
		
	}//初始化方法
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	function closeWinFun(){
		$("#isCloseWin").attr
		if($("#isCloseWin").attr("checked")) {
			$("#isCloseWinVal").val("1");
			//alert($("#isCloseWinVal").val());
		} else {
			$("#isCloseWinVal").val("0");
			//alert($("#isCloseWinVal").val());
		}
	}
	$(function(){
	    getInfoByLoacl();
	    
	})
	//从本地存储localStorage（长期存储）获取数据
	function getInfoByLoacl(){
	    var tempExeId = $("input[name='exeid']").val();
	    var data2 = JSON.parse(localStorage.getItem('feederInfo'));
	    //console.log(data2.feederExeId);
	    if(data2!=null&&data2.feederExeId==tempExeId){
	        $("#paraMap1_TCT_MAX_COUNT").val(data2.TCT_MAX_COUNT);
	        $("#paraMap1_TCS_USE_TIME").val(data2.TCS_USE_TIME);
	        $("#paraMap1_TCS_REMIND_NUM").val(data2.TCS_REMIND_NUM);
	        $("#paraMap1_TCS_MAX_CYCLE").val(data2.TCS_MAX_CYCLE);
	        $("#paraMap1_TCS_MT_CYCLE").val(data2.TCS_MT_CYCLE);
	        $("#paraMap1_TCS_REMIND_DAY").val(data2.TCS_REMIND_DAY);
	    }
	}
	//保存数据到本地localStorage（长期存储）
	function setInfoByLocal(){
	    const info = {
            feederExeId: $("input[name='exeid']").val(),
            TCT_MAX_COUNT: $("#paraMap1_TCT_MAX_COUNT").val(),
            TCS_USE_TIME: $("#paraMap1_TCS_USE_TIME").val(),
            TCS_REMIND_NUM: $("#paraMap1_TCS_REMIND_NUM").val(),
            TCS_MAX_CYCLE: $("#paraMap1_TCS_MAX_CYCLE").val(),
            TCS_MT_CYCLE: $("#paraMap1_TCS_MT_CYCLE").val(),
            TCS_REMIND_DAY: $("#paraMap1_TCS_REMIND_DAY").val()
        };
        localStorage.setItem('feederInfo', JSON.stringify(info));
	}
	//新增方式
	$("#paraMap2_ADD_TYPE").change(function(){
	        var add_type=$(this).val();
		if(add_type==1){
			//个体
			$("#paraMap1_BATCH_NUMBER").attr("disabled","true");
			$("#paraMap1_TCF_FEEDER_SN").attr("disabled",false);
			$("#paraMap1_BATCH_NUMBER").val("");
			$("#paraMap1_TCF_FEEDER_SN").addClass("_VAL_NULL");
			$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
			$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
			$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
			//$("#paraMap1_TCT_TYPE option:eq(0)").attr("selected","selected");
			//$("#paraMap1_TCS_SPEC option:eq(0)").attr("selected","selected");
			$("#paraMap1_TCS_SPEC").trigger("chosen:updated");
			$("#paraMap1_TCT_TYPE").trigger("chosen:updated");
		}else if(add_type==2){
			//批量
			$("#paraMap1_TCF_FEEDER_SN").attr("disabled","true");
			$("#paraMap1_BATCH_NUMBER").attr("disabled",false);
			$("#paraMap1_TCF_FEEDER_SN").val("");
			$("#paraMap1_TCF_LEFT_CHANNEL_SN").val("");
			$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val("");
			$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
			$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled","true");
			$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
			$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
			$("#paraMap1_BATCH_NUMBER").addClass("_VAL_NULL");
			//$("#paraMap1_TCT_TYPE option:eq(0)").attr("selected","selected");
			//$("#paraMap1_TCS_SPEC option:eq(0)").attr("selected","selected");
			$("#paraMap1_TCS_SPEC").trigger("chosen:updated");
			$("#paraMap1_TCT_TYPE").trigger("chosen:updated");
		}
	});
	$('#paraMap1_TCF_FEEDER_SN').bind('keyup', function () {
	     $("#paraMap1_TCT_TYPE option:eq(0)").attr("selected","selected");
	     $("#paraMap1_TCF_LEFT_CHANNEL_SN").val("");
	     $("#paraMap1_TCF_RIGHT_CHANNEL_SN").val("");
	     $("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
        });
         
         
	//FEEDER类型
	$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
	$("#paraMap1_TCT_TYPE").change(function(){
	
	        var add_type=$("#paraMap2_ADD_TYPE").val();
		
		var tct_type=$(this).val();
		var sn_val=$("#paraMap1_TCF_FEEDER_SN").val();
		if(sn_val!=""){
		   if(add_type==2){
		        $("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled","true");
			$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
			$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
	           }else{
			if(tct_type==0){
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
			}else if(tct_type==1){
				//单(左)通道
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
				var sn_val_left=sn_val+"A";
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
				
			}else if(tct_type==2){
				//右通道
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
				var sn_val_left=sn_val+"L";
				var sn_val_right=sn_val+"R";
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val(sn_val_right);
				
				
			}else if(tct_type==3){
				//中间通道
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
				var sn_val_left=sn_val+"L";
				var sn_val_right=sn_val+"R";
				var sn_val_middle=sn_val+"M";
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val(sn_val_right);
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val(sn_val_middle);
				
			}
	             }
		}else if(sn_val==""){
		     if(add_type==2){
		        $("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled","true");
			$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
			$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
	             }else{
			if(tct_type==0){
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
			}else if(tct_type==1){
				//单(左)通道
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
			}else if(tct_type==2){
				//右通道
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
			}else if(tct_type==3){
				//中间通道
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
				$("#paraMap1_TCF_LEFT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_RIGHT_CHANNEL_SN").val("");
				$("#paraMap1_TCF_MIDDLE_CHANNEL_SN").val("");
				
			}
		     }
		}
	});
	
	//数字验证
	$('#paraMap1_BATCH_NUMBER').bind('keyup', function () {
	     var calwStart=$("#paraMap1_BATCH_NUMBER");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
             	_alertValMsg($('#paraMap1_BATCH_NUMBER'),"<dict:lang value="该项只能为正整数数字" />");
             }
         });
         $('#paraMap1_TCT_MAX_COUNT').bind('keyup', function () {
	     var calwStart=$("#paraMap1_TCT_MAX_COUNT");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
             	_alertValMsg($('#paraMap1_TCT_MAX_COUNT'),"<dict:lang value="该项只能为数字" />");
             }
         });
         
         function addFeeder(){
         localStorage.clear();
         setInfoByLocal();
   //alert($("#isCloseWin").val());
   $("#paraMap1_TCS_SPEC").addClass('_VAL_NULL');
   $("#paraMap1_TCT_TYPE").addClass('_VAL_NULL');
   if($("#paraMap2_ADD_TYPE").val()==1){
      $("#paraMap1_TCF_FEEDER_SN").addClass('_VAL_NULL');
      $("#paraMap1_BATCH_NUMBER").removeClass('_VAL_NULL');
   }else{
      $("#paraMap1_BATCH_NUMBER").addClass('_VAL_NULL');
      $("#paraMap1_TCF_FEEDER_SN").removeClass('_VAL_NULL');
   }

            if(!val.valNullData()){ 
                return ;
             }
   
            if(!valData()){
				return ;
			}
			if(!val.valDataBaseSetData()){
		        return ;
        	}
			if($('#paraMap1_TCT_MAX_COUNT').val()==""){
			    _alertValMsg($('#paraMap1_TCT_MAX_COUNT'),"<dict:lang value="该项不能为空" />");
			}else if($('#paraMap1_TCS_USE_TIME').val()==""){
			    _alertValMsg($('#paraMap1_TCS_USE_TIME'),"<dict:lang value="该项不能为空" />");
			}else if($('#paraMap1_TCS_REMIND_NUM').val()==""){
			    _alertValMsg($('#paraMap1_TCS_REMIND_NUM'),"<dict:lang value="该项不能为空" />");
			}else if($('#paraMap1_TCS_MAX_CYCLE').val()==""){
			    _alertValMsg($('#paraMap1_TCS_MAX_CYCLE'),"<dict:lang value="该项不能为空" />");
			}else if($('#paraMap1_TCS_MT_CYCLE').val()==""){
			    _alertValMsg($('#paraMap1_TCS_MT_CYCLE'),"<dict:lang value="该项不能为空" />");
			}else if($('#paraMap1_TCS_REMIND_DAY').val()==""){
			    _alertValMsg($('#paraMap1_TCS_REMIND_DAY'),"<dict:lang value="该项不能为空" />");
			}else{
			
			    $DisInput = $(":input[disabled='disabled'][class*='isaddSubmit']");
			$DisInput.attr("disabled", false); 
                         if($("#isCloseWin") && $("#addForm").find("#isCloseWin").length == 0){
				$("#addForm").append($("#isCloseWin").clone());
				$("#addForm").find("#isCloseWin").wrap("<div id=\"isCloseWinDiv\" style=\"display:none;\"></div>");
			}
			$("#saveBtn").prop("disabled","disabled");
                   
                        document.forms.addForm.action = "${path}buss/bussModel_exeFunc.ms?funcMId=c09b4a0ed02b4be2bd0ad1e4ac9a870f"; 
       
			document.forms.addForm.submit();
			isQuery = true;
			$DisInput.attr("disabled", true);
			    
			}
			
			
  
}

    $('#paraMap1_TCT_MAX_COUNT').bind('keyup', function () {
	var calwStart=$("#paraMap1_TCT_MAX_COUNT");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_TCT_MAX_COUNT'),"<dict:lang value="该项只能为正整数" />");
             }
         });		

    $('#paraMap1_TCS_USE_TIME').bind('keyup', function () {
	var calwStart=$("#paraMap1_TCS_USE_TIME");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_TCS_USE_TIME'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
    $('#paraMap1_TCS_REMIND_NUM').bind('keyup', function () {
	var calwStart=$("#paraMap1_TCS_REMIND_NUM");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_TCS_REMIND_NUM'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
    $('#paraMap1_TCS_MAX_CYCLE').bind('keyup', function () {
	var calwStart=$("#paraMap1_TCS_MAX_CYCLE");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_TCS_MAX_CYCLE'),"<dict:lang value="该项只能为正整数" />");
             }
         });
         
    $('#paraMap1_TCS_MT_CYCLE').bind('keyup', function () {
	var calwStart=$("#paraMap1_TCS_MT_CYCLE");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_TCS_MT_CYCLE'),"<dict:lang value="该项只能为正整数" />");
             }
         });
    $('#paraMap1_TCS_REMIND_DAY').bind('keyup', function () {
	var calwStart=$("#paraMap1_TCS_REMIND_DAY");
             if( !/^[0-9]+$/.test(this.value)){
             	this.value='';
               
             	_alertValMsg($('#paraMap1_TCS_REMIND_DAY'),"<dict:lang value="该项只能为正整数" />");
             }
         });
</script>
<bu:submit viewId="c33f9fa5264948af9ffa49574b2a834c" />
<bu:script viewId="c33f9fa5264948af9ffa49574b2a834c" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

 <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
     <jsp:param name="modelName" value="VIEW_TYPE_10" />
     <jsp:param name="location" value="pageOver" />
 </jsp:include>