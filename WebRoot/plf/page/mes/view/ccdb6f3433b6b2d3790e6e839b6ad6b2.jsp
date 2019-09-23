<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<style>
		._height{height:352px !important;}
	</style>
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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd _height" style="padding-bottom: 15px;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="99c3f63c8b62498589698545e9de3b18">
								<input type="hidden" name=iframeId value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="99c3f63c8b62498589698545e9de3b18" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="99c3f63c8b62498589698545e9de3b18" />
	<input type="hidden" name="99c3f63c8b62498589698545e9de3b18" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="bomId" >
	<!-- <input type="hidden" id="paraMapObj_CTI_ITEM_CODE" name="paraMapObj.CTI_ITEM_CODE"> -->
		<s:set name="_$viewId" value="'0cf8739b23d04b1b969b472ff554f0c5'" />
		<s:set name="_$formId_1" value="'99c3f63c8b62498589698545e9de3b18'" />
		<s:set name="_$type" value="'edit'" />
		<input type="hidden" name="paraMap2.type" value="edit" />
		<tr>
			<td class="name" style="width:68px;"/><span class="dot">*</span><bu:uitn colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:68px;"/><bu:uitn colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" ><dict:lang value="机种名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="MODEL_NAME" name="MODEL_NAME" disabled="disabled"/></td>
		
			<td class="name" ><dict:lang value="机种规格" /></td>
			<td class="dec"><input type="text" class=" input isSubmit " id="MODEL_GUIGE" name="MODEL_GUIGE" disabled="disabled" /></td>
			</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td id="ctiItemCode" cssClass="dec" colNo="CTI_ITEM_CTRL" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_CTRL" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="2" /></bu:td>
			<bu:td id="ctiAssisCode" cssClass="dec" colNo="CTI_ASSIS_CTRL" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSIS_CTRL" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="2" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
			<td class="name" ><dict:lang value="物料名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_NAME" name="ITEM_NAME" disabled="disabled" /></td>
			<td class="name" ><dict:lang value="物料规格" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_GUIGE" name="ITEM_GUIGE" disabled="disabled" /></td>
			</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec-self" colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18"  colspan="3"><bu:ui colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" style="height:80px;width:100%;" formIndex="1" /></bu:td>
		</tr>
		<tr style="display: none">
			<bu:td cssClass="dec" colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="99c3f63c8b62498589698545e9de3b18" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
	
	
	function itemOrAssis(){
		if ($("#paraMapObj_CTI_ITEM_TYPE").val()=="0") {
			$("#paraMapObj_CTI_ITEM_CODE").val("");
			$("#paraMapObj_CTI_ITEM_CTRL_SHOW").val("");
			$("#paraMapObj_CTI_ASSIS_CTRL_SHOW").val("");
			$("#ctiItemCode").val("");
			$("#ITEM_NAME").val("");
			$("#ITEM_GUIGE").val("");
			document.getElementById("ctiItemCode").style.display = "block";
			document.getElementById("ctiAssisCode").style.display = "none";
		}else if ($("#paraMapObj_CTI_ITEM_TYPE").val()=="1") {
			$("#paraMapObj_CTI_ITEM_CODE").val("");
			$("#paraMapObj_CTI_ITEM_CTRL_SHOW").val("");
			$("#paraMapObj_CTI_ASSIS_CTRL_SHOW").val("");
			$("#ctiAssisCode").val("");
			$("#ITEM_NAME").val("");
			$("#ITEM_GUIGE").val("");
			document.getElementById("ctiAssisCode").style.display = "block";
			document.getElementById("ctiItemCode").style.display = "none";
		}
	}
var str = "";
window.onload = function(){
	str = "<dict:lang value="请输入管控物料" /> | ";
	document.getElementById("ctiAssisCode").style.display = "none";
	getGroup();
	editHuixian();
	$("#paraMapObj_CTI_ASSY_MESSAGE").val(str);
};

       function getGroup(){
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?FUNC_CODE=F3162&funcMId=05d38fe1985b41108e4953c4d112a647",
     		    data: "routeStep="+$("#paraMapObj_CTI_PRODUCT_STEP").val()+"&flag=getGroup",
     			success: function(data){
     					$("#paraMapObj_CTI_GROUP").empty();
     					if(data.ajaxList != null && data.ajaxList != ""){
     						for ( var i = 0; i < data.ajaxList.length; i++) {
     							$("#paraMapObj_CTI_GROUP").append("<option value='"+data.ajaxList[i].GROUP_CODE+"' >"+data.ajaxList[i].GROUP_NAME+"</option>");			
     					}
     					$("#paraMapObj_CTI_GROUP").trigger("chosen:updated");
						}
     				},
     			error: function(msg){
     					utilsFp.alert("error:"+msg);
     			  }
     			});		
        }
        
      function editHuixian(){
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?FUNC_CODE=F3162&funcMId=05d38fe1985b41108e4953c4d112a647",
     		    data: "ctiItemCode="+$("#paraMapObj_CTI_ITEM_CODE").val()+"&ctiModelCode="+$("#paraMapObj_CTI_MODEL_CODE").val()+"&flag=editHuixian&assisItem="+$("#paraMapObj_CTI_ITEM_TYPE").val(),
     			success: function(data){
     					if(data.ajaxList != null && data.ajaxList != ""){
     						$("#MODEL_NAME").val(data.ajaxList[0].CI_ITEM_NAME);
     						$("#MODEL_GUIGE").val(data.ajaxList[0].CI_ITEM_SPEC);
						}
     					if(data.ajaxMap != null && data.ajaxMap != ""){
     						$("#ITEM_NAME").val(data.ajaxMap.CI_ITEM_NAME);
     						$("#ITEM_GUIGE").val(data.ajaxMap.CI_ITEM_SPEC);
						}
						if ($("#paraMapObj_CTI_ITEM_TYPE").val()=="0") {
							document.getElementById("ctiItemCode").style.display = "block";
							document.getElementById("ctiAssisCode").style.display = "none";
							$("#paraMapObj_CTI_TIEM_CTRL").val($("#paraMapObj_CTI_ITEM_CODE").val());
							$("#paraMapObj_CTI_TIEM_CTRL_SHOW").val($("#paraMapObj_CTI_ITEM_CODE").val());
						}else if ($("#paraMapObj_CTI_ITEM_TYPE").val()=="1") {
							document.getElementById("ctiAssisCode").style.display = "block";
							document.getElementById("ctiItemCode").style.display = "none";
							$("#paraMapObj_CTI_ASSIS_CTRL").val($("#paraMapObj_CTI_ITEM_CODE").val());
							$("#paraMapObj_CTI_ASSIS_CTRL_SHOW").val($("#paraMapObj_CTI_ITEM_CODE").val());
						}
     				},
     			error: function(msg){
     					utilsFp.alert("error:"+msg);
     			  }
     			});		
        }
	
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
		var isQuery = false;
		function edit(thisObj){
			$("#paraMapObj_CTI_ITEM_CTRL").remove();
			$("#paraMapObj_CTI_ASSIS_CTRL").remove();
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
				
		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataAx.ms";
			var addTtable = $('#addTable_'+tableId);
			var tableTrJq = addTtable.find("tbody tr");
			var row_count = tableTrJq.length;
			if(row_count == 0){
				curRowSeq=0;
			}
			var FORM_COL_ID_D = $('#addTable_FORM_COL_ID_D'+tableId).val();// <%-- 该值应该等于subRelColId --%>
		  jQuery.ajax({
				type: "POST",
		    dataType: "json",
		    url: url,
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal},
				success: function(data){
					util.closeLoading();
					if("" == $("#aaaa").val()){
					$("#aaaa").val(data.ajaxPage.tableData);
					}else{
					$("#bbbb").val(data.ajaxPage.tableData);
					}
					var row = $(data.ajaxPage.tableData);
					_toClickColor(row);// <%-- 行点击着色 --%>
					addTtable.append(row);
					var dataCountObj = $("input[name='paraMap"+formIndex+formSplit+FORM_PAGE_DATA_COUNT_FLAG+"']");
					dataCountObj.val(row_count+ 1);
					curRowSeq=curRowSeq+row.length;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					util.closeLoading();
					var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
					if (null != sessionstatus && sessionstatus == "noAuthority") {
					}else{
						util.alert("error:"+errorThrown);
					}
			   }
			});
		}
		
		function init(){
			if($("#leftTable-kz").length>0){
				$("#leftTable-kz").show();
			}
			
			if($("#leftTable").length>0){
				$("#leftTable").show();
			}
			initEditDataLs();<%-- 初始化编辑关联子表单数据列表 --%>
			/*
			var formIds = $("input[type='hidden'][name='formIds']").val();
			var formIdLs = formIds.split(",");
			for(var i=0,j=formIdLs.length;i<j;i++){
				getEditRows(formIdLs[i],"0");
			}
			*/
		}
		

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

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
