<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
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
</head>
<body>
	<div class="edit">
            <div class="hd">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
			    	        <button type="button" onclick="editFeeder(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name=iframeId value="${iframeId}">
										<!-- <table class="basic-table">
											<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
											</tr>
										</table>-->
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="90caa73200734f6c938d5aa280a9664a" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="90caa73200734f6c938d5aa280a9664a" />
	<input type="hidden" name="90caa73200734f6c938d5aa280a9664a" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'c4965d60479e42cc8a5b906cf40c8aa8'" />
		<s:set name="_$formId_1" value="'90caa73200734f6c938d5aa280a9664a'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:250px;" colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" style="width:100px;"/><span class="dot">*</span><bu:uitn colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec"  style="width:250px;" colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec"  colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" style="width:100px;"/><bu:uitn colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
			
			<td class="name" /><bu:uitn colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<!--<tr>
			<td class="name-six" style="100px;"/><span class="dot">*</span><bu:uitn colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCS_SPEC" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name-six" /><span class="dot">*</span><bu:uitn colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" style="width:200px;" colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_LEFT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_RIGHT_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MIDDLE_CHANNEL_SN" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCT_MAX_COUNT" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec-self" colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_TYPE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec-self" colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_VALUE" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec-self" colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_MT_NOTNUM" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" /></td>
			<bu:td cssClass="dec" colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" ><bu:ui colNo="TCF_FEEDER_ID" formId="90caa73200734f6c938d5aa280a9664a" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>-->
		
	</table>
			<bu:jsVal formId="90caa73200734f6c938d5aa280a9664a" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
                <bu:submit viewId="c4965d60479e42cc8a5b906cf40c8aa8" />
		<bu:script viewId="c4965d60479e42cc8a5b906cf40c8aa8" />
	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
			if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
			if(!val.valNullData()){
				return ;
			}
			if(!valData()){
				return ;
			}
			if(!val.valOjbsData()){
				return ;
			}
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide();
			document.forms.editForm.submit();
			isQuery = true;
		}
		
		
		function alertInfo(msg){
			isQuery = false;
			utilsFp.alert(msg);
		}
		
		function reloadPg(msg){
			isQuery = false;
			parentWindow.reloadPg(msg);;
		}

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			if($("input[type='hidden'][name='formIds']").length>1){
				initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			}
			var tct_type=$("#paraMapObj_TCT_TYPE").val();
			if(tct_type==1){
				$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
				$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
			}else if(tct_type==2){
				$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
			}else if(tct_type==3){
				$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
				$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
			}
		
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		
		$('#paraMapObj_TCF_FEEDER_SN').bind('keyup', function () {
	     		$("#paraMapObj_TCT_TYPE option:eq(0)").attr("selected","selected");
        	 });
		$("#paraMapObj_TCT_TYPE").change(function(){
			var tct_type=$(this).val();
			var sn_val=$("#paraMapObj_TCF_FEEDER_SN").val();
			if(sn_val!=""){
				if(tct_type==0){
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				}else if(tct_type==1){
					//单(左)通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
					var sn_val_left=sn_val+"A";
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
				
				}else if(tct_type==2){
					//右通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
					var sn_val_left=sn_val+"L";
					var sn_val_right=sn_val+"R";
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val(sn_val_right);
				
				
				}else if(tct_type==3){
					//中间通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
					var sn_val_left=sn_val+"L";
					var sn_val_right=sn_val+"R";
					var sn_val_middle=sn_val+"M";
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val(sn_val_left);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val(sn_val_right);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val(sn_val_middle);
				
				}
			}else if(sn_val==""){
				if(tct_type==0){
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				}else if(tct_type==1){
					//单(左)通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				}else if(tct_type==2){
					//右通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled","true");
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				}else if(tct_type==3){
					//中间通道
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").attr("disabled",false);
					$("#paraMapObj_TCF_LEFT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_RIGHT_CHANNEL_SN").val("");
					$("#paraMapObj_TCF_MIDDLE_CHANNEL_SN").val("");
				
				}
			}
		});
	<%-- //自定义每个字段的有效性验证方法体(默认入参thisObj为字段的DOM表单对象，title为该字段的名称)
	var maxLen =5;
	if(thisObj.value.length < maxLen ){
		_alertValMsg(thisObj,title + " %{getText("字段长度不能小于")}" + maxLen);
		return false;
	}else{
		return true;
	}
	 --%>

</script>
<bu:submit viewId="c4965d60479e42cc8a5b906cf40c8aa8" />
<bu:script viewId="c4965d60479e42cc8a5b906cf40c8aa8" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
