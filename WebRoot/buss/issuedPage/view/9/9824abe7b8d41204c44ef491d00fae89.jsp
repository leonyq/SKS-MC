<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
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
	<script>
	//加载父ifream中的js\css文件

		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
	</script>
	<script type="text/javascript">
		var addTableTrMap;
	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
                <div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="addFeeder();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
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
			<td class="name" style="width:100px;"/><bu:uitn colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a"  /></td>
			<bu:td cssClass="dec" style="width:250px;" colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a" value="%{ADD_TYPE}" formIndex="2" /></bu:td>
			
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCT_MAX_COUNT}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:250px;" colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_FEEDER_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" value="%{BATCH_NUMBER}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCS_SPEC}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCT_TYPE}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_LEFT_CHANNEL_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_RIGHT_CHANNEL_SN}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MIDDLE_CHANNEL_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MT_TYPE}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MT_VALUE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MT_NOTNUM}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-three" /><bu:uitn colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a"  colspan="7"><bu:ui colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_FEEDER_ID}" formIndex="1" /></bu:td>
		</tr>
		<!--<tr>
			<td class="name" /><bu:uitn colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a"  /></td>
			<bu:td cssClass="dec" style="width:250px;" colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="ADD_TYPE" formId="90caa73200734f6c938d5aa280a9664a" value="%{ADD_TYPE}" formIndex="2" /></bu:td>
		
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:250px;" colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_FEEDER_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="BATCH_NUMBER" formId="90caa73200734f6c938d5aa280a9664a" value="%{BATCH_NUMBER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCS_SPEC}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCT_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCT_MAX_COUNT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_LEFT_CHANNEL_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_RIGHT_CHANNEL_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MIDDLE_CHANNEL_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MT_TYPE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MT_VALUE}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_MT_NOTNUM}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a"  colspan="7"><bu:ui colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" value="%{TCF_FEEDER_ID}" formIndex="1" /></bu:td>
		</tr>-->
	</table>
			<bu:jsVal formId="90caa73200734f6c938d5aa280a9664a" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

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
		}
	});
	$('#paraMap1_TCF_FEEDER_SN').bind('keyup', function () {
	     $("#paraMap1_TCT_TYPE option:eq(0)").attr("selected","selected");
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
             	_alertValMsg($('#paraMap1_BATCH_NUMBER'),"<dict:lang value="该项只能为数字" />");
             }
         });
         $('#paraMap1_TCT_MAX_COUNT').bind('keyup', function () {
	     var calwStart=$("#paraMap1_TCT_MAX_COUNT");
             if( ! /^([\d]+|([\d]+[.]?|[\d]+[.]?[\d]+))$/.test(this.value)){
             	this.value='';
             	_alertValMsg($('#paraMap1_TCT_MAX_COUNT'),"<dict:lang value="该项只能为数字" />");
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
