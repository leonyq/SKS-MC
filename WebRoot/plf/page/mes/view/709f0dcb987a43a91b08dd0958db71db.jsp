<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
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
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd _height" style="padding-bottom: 15px;">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<input type="hidden" name="formId" value="99c3f63c8b62498589698545e9de3b18" />
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="99c3f63c8b62498589698545e9de3b18" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="99c3f63c8b62498589698545e9de3b18" />
	<input type="hidden" name="99c3f63c8b62498589698545e9de3b18" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="paraMap1_CTI_ITEM_CODE" name="paraMap1@0#CTI_ITEM_CODE">
	<input type="hidden" id="bomId" value="">
		<s:set name="_$viewId" value="'03f3e8d282704c85a18f4c826579b5aa'" />
		<s:set name="_$formId_1" value="'99c3f63c8b62498589698545e9de3b18'" />
		<s:set name="_$type" value="'add'" />
		<input type="hidden" name="paraMap2.type" value="add" />
		<tr>
			<td class="name" style="width:64px;"><span class="dot">*</span><bu:uitn colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_MODEL_CODE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_MODEL_CODE}" formIndex="1" /></bu:td>
		
			<td class="name"  style="width:64px;"><bu:uitn colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec"  style="width:230px;" colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_TYPE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ITEM_TYPE}" formIndex="1" onchange="itemOrAssis();"/></bu:td>
			</tr>
		<tr>
			<td class="name" ><dict:lang value="机种名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="MODEL_NAME" name="MODEL_NAME" disabled="disabled"/></td>
		
			<td class="name" ><dict:lang value="机种规格" /></td>
			<td class="dec"><input type="text" class=" input isSubmit " id="MODEL_GUIGE" name="MODEL_GUIGE" disabled="disabled" /></td>
			</tr>
		<tr>
			<td class="name" ><span class="dot">*</span><bu:uitn colNo="CTI_ITEM_CODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td id="ctiItemCode" cssClass="dec" colNo="CTI_ITEM_CTRL" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_CTRL" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ITEM_CTRL}" formIndex="2" /></bu:td>
			<bu:td id="ctiAssisCode" cssClass="dec" colNo="CTI_ASSIS_CTRL" formId="99c3f63c8b62498589698545e9de3b18" ></div><bu:ui colNo="CTI_ASSIS_CTRL" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ASSIS_CTRL}" formIndex="2" /></bu:td>
			
			<td class="name" ><bu:uitn colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_CONTROL_MODE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_CONTROL_MODE}" formIndex="1" /></bu:td>
			</tr>
		<tr>
			<td class="name" ><dict:lang value="物料名称" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_NAME" name="ITEM_NAME" disabled="disabled" /></td>
		
			<td class="name" ><dict:lang value="物料规格" /></td>
			<td class="dec" ><input type="text" class=" input isSubmit " id="ITEM_GUIGE" name="ITEM_GUIGE" disabled="disabled" /></td>
			</tr>
		<tr>
			<td class="name" ><span class="dot">*</span><bu:uitn colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_PRODUCT_STEP" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_PRODUCT_STEP}" formIndex="1" /></bu:td>
		
			<td class="name" ><span class="dot">*</span><bu:uitn colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_GROUP" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_GROUP}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" ><span class="dot">*</span><bu:uitn colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSY_SEQ" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ASSY_SEQ}" formIndex="1" /></bu:td>
		
			<td class="name" ><span class="dot">*</span><bu:uitn colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ASSB_QTY" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ASSB_QTY}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" ><bu:uitn colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" ><bu:ui colNo="CTI_ITEM_SOURCE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ITEM_SOURCE}" formIndex="1" /></bu:td>
		
			<td class="name" ><span class="dot">*</span><bu:uitn colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18"  colspan="3"><bu:ui colNo="CTI_ASSY_MESSAGE" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_ASSY_MESSAGE}" formIndex="1" /></bu:td>
			</tr>
		<tr>
			<td class="name" ><bu:uitn colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" /></td>
			<bu:td cssClass="dec" colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" colspan="3"><bu:ui colNo="CTI_MEMO" formId="99c3f63c8b62498589698545e9de3b18" value="%{CTI_MEMO}" style="width:100%;height:80px;" formIndex="1" /></bu:td>
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
		if ($("#paraMap1_CTI_ITEM_TYPE").val()=="0") {
			$("#paraMap1_CTI_ITEM_CODE").val("");
			$("#paraMap1_CTI_ITEM_CTRL_SHOW").val("");
			$("#paraMap1_CTI_ASSIS_CTRL_SHOW").val("");
			$("#ctiItemCode").val("");
			$("#ITEM_NAME").val("");
			$("#ITEM_GUIGE").val("");
			document.getElementById("ctiItemCode").style.display = "block";
			document.getElementById("ctiAssisCode").style.display = "none";
		}else if ($("#paraMap1_CTI_ITEM_TYPE").val()=="1") {
			$("#paraMap1_CTI_ITEM_CODE").val("");
			$("#paraMap1_CTI_ITEM_CTRL_SHOW").val("");
			$("#paraMap1_CTI_ASSIS_CTRL_SHOW").val("");
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
	document.getElementById("paraMap2_CTI_ITEM_CTRL_SHOW").disabled = true;
	getGroup();
	$("#paraMap1_CTI_ASSY_MESSAGE").val(str);
};

       function getGroup(){
        	//var url = routeService();
        	var top = 5;
        	$.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"buss/bussModel_exeFunc.ms?FUNC_CODE=F3162&funcMId=05d38fe1985b41108e4953c4d112a647",
     		    data: "routeStep="+$("#paraMap1_CTI_PRODUCT_STEP").val()+"&flag=getGroup",
     			success: function(data){
     					util.closeLoading();
     					$("#paraMap1_CTI_GROUP").empty();
     					if(data.ajaxList != null && data.ajaxList != ""){
     						for ( var i = 0; i < data.ajaxList.length; i++) {
     							$("#paraMap1_CTI_GROUP").append("<option value='"+data.ajaxList[i].GROUP_CODE+"' >"+data.ajaxList[i].GROUP_NAME+"</option>");			
     					}
     					$("#paraMap1_CTI_GROUP").trigger("chosen:updated");
						}
     				},
     			error: function(msg){
     					util.closeLoading();
     					//utilsFp.alert("error:"+msg);
     					utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
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
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
