<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true"%>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<style>
		.dec input{
			width:200px;
		}
		.dec .chosen-container{
			width:200px !important;
		}
		td .state1{
			width: 50px;
   			height: 20px;
    			display: inline-block;
    			background-color: red;
    			border-radius: 5px;
    			color: #fff;
		}
		td .state2{
			width: 50px;
   			height: 20px;
    			display: inline-block;
    			background-color: green;
    			border-radius: 5px;
    			color: #fff;
		}
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
		
	var paginationImpl = {};
	
	function comparison(){
		getComparison("0");
	}
	$(function(){
		getComparison("1");
	});
		//加载——对比当前信息跟选择制令单相关信息
		function getComparison(flag){
		      
		      console.log(flag);
		      var pdoDeviceSn= $("#paraMapObj_PDO_DEVICE_SN").val();
		      var pdoNumber= $("#paraMapObj_PDO_NUMBER").val();
		      var pdoProcessFace= $("#paraMapObj_PDO_PROCESS_FACE").val();
		      var pdoModelCode= $("#paraMapObj_PDO_MODEL_CODE").val();
		      var pdoAreaSn= $("#paraMapObj_PDO_AREA_SN").val();
		      var pdoNumber_s= $("#paraMapObj_PDO_NUMBER_S").val();
		      var pdoModelCode_s= $("#paraMapObj_PDO_MODEL_CODE_S").val();
		      var pdoProcessFace_s= $("#paraMapObj_PDO_PROCESS_FACE_S").val();
			  var pdoNumber_s_err = document.getElementById("paraMapObj_PDO_NUMBER_S_SHOW");
			  var pdoProcessFace_s_err = document.getElementById("paraMapObj_PDO_PROCESS_FACE_S");
			  if(flag == 0){
			     if (pdoNumber == pdoNumber_s) {
					_alertValMsg(pdoNumber_s_err,"<dict:lang value="转产制令单不能是当前制令单" />");
			      	return ;
				}
			      if(""==pdoNumber_s){
	   					_alertValMsg(pdoNumber_s_err,"<dict:lang value="请选择转产制令单" />");
			      		return ;
			      }
			      if(""==pdoProcessFace_s){
	   					_alertValMsg(pdoProcessFace_s_err,"<dict:lang value="请选择转产生产面别" />");
			      		return ;
			      }
			    }
			    /*var isFirstLoad = firstLoadThisPage(paginationImpl);
    	var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
    	var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;*/
		      $.ajax({
						type: "POST",
					    dataType: "json",
					    url: "buss/bussModel_exeFunc.ms?funcMId=25242f2eca9a40e7a11e2826032cf565",
					    data: "flag="+flag+"&pdoDeviceSn="+pdoDeviceSn+"&pdoNumber="+pdoNumber+"&pdoProcessFace="+pdoProcessFace
					    	+"&pdoModelCode="+pdoModelCode+"&pdoAreaSn="+pdoAreaSn+"&pdoNumber_s="+pdoNumber_s
					    	+"&pdoModelCode_s="+pdoModelCode_s+"&pdoProcessFace_s="+pdoProcessFace_s,
						success: function(data){
								util.closeLoading();
								if(null == data){return ;}
								if(null != data.ajaxString){
									utilsFp.confirmIcon(3,"","","", data.ajaxString,0,"300","");
									return;
								}
								
								if(null != data.ajaxList){
									$("#identical").val(data.ajaxList[0]);
									$("#difference").val(data.ajaxList[1]);
								}
								$("#dbTbody").empty();
								
								if(null != data.ajaxPage.dataList){
									var reList = eval(data.ajaxPage.dataList);
									console.log(reList);
										for(var i = 0;i < reList.length; i++){
											$("#dbTbody").append("<tr id='"+reList[i].CODE+"' onclick=\"ECCRow('"+reList[i].CMO_TABLE_NO+"');\" ></tr>");
											$("#dbTbody tr:last").append("<td style='width: 30px;text-align: center;'>"+(i+1)+"</td>");
											/* $("#dbTbody tr:last").append("<td style='width: 30px;text-align: center;'><input type='checkbox' id='cb_"+reList[i].CODE+"' name='"+reList[i].NAME+"' value='"+reList[i].CODE+"'/></td>"); */
											$("#dbTbody tr:last").append("<td style='width: 130px;'>"+reList[i].CMO_TABLE_NO+"</td>");
											$("#dbTbody tr:last").append("<td style='width: 140px;'>"+reList[i].CMO_LOADPOINT+"</td>");
											$("#dbTbody tr:last").append("<td style='width: 80px;text-align: center;'>"+reList[i].CMO_LOADPOINT+"</td>");//CMO_CHANEL_SN
											if(reList[i].RESULT == undefined){
												reList[i].RESULT = "";
											}
											if(reList[i].RESULT == "1"){
												$("#dbTbody tr:last").append("<td style='width: 90px;text-align: center;'><span class='state1'>差异</span></td>");
											}else if(reList[i].RESULT == "0"){
												$("#dbTbody tr:last").append("<td style='width: 90px;text-align: center;'><span class='state2'>相同</span></td>");
											}else{
												$("#dbTbody tr:last").append("<td style='width: 90px;text-align: center;'></td>");
												}
											$("#dbTbody tr:last").append("<td style='width: 130px;'>"+reList[i].CMO_ITEM_CODE+"</td>");
											$("#dbTbody tr:last").append("<td style='width: 110px;'>"+reList[i].CI_ITEM_NAME+"</td>");
											if (reList[i].CI_ITEM_SPEC == null) {
												reList[i].CI_ITEM_SPEC = "";
											}
											$("#dbTbody tr:last").append("<td>"+reList[i].CI_ITEM_SPEC+"</td>");
										}
										init();
										//pageFun(data.ajaxPage,"formId1");
								}
							},
						error: function(msg){
								util.closeLoading();
								utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
						  }
						});
		}
		
function conserve(){
    if($("#identical").val()<=0){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前设备没有相同料站物料，不能进行转产" />",0,"","");
				 return ;
	}
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
	
	$("#PDO_AREA_SN").val($("#paraMapObj_PDO_AREA_SN").val());
	$("#PDO_DEVICE_SN").val($("#paraMapObj_PDO_DEVICE_SN").val());
	$("#PDO_NUMBER").val($("#paraMapObj_PDO_NUMBER").val());
	$("#PDO_MODEL_CODE").val($("#paraMapObj_PDO_MODEL_CODE").val());
	$("#PDO_PROCESS_FACE").val($("#paraMapObj_PDO_PROCESS_FACE").val());
	$("#PDO_NUMBER_S").val($("#paraMapObj_PDO_NUMBER_S").val());
	$("#PDO_MODEL_CODE_S").val($("#paraMapObj_PDO_MODEL_CODE_S").val());
	$("#PDO_PROCESS_FACE_S").val($("#paraMapObj_PDO_PROCESS_FACE_S").val());
	
	//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
	emptyValToHide();
	document.forms.editForm.action="${path}buss/bussModel_exeFunc.ms?funcMId=2ba4208ebdcc4416a3520c3de1f88a24";
	document.forms.editForm.submit();
	isQuery = true;
}
		
		
		
		
	</script>
</head>
<body style="overflow:hidden;">
<div class="mod">
	<div class="edit">
            <div class="hd" style="    background-color: #f6f5f7; margin: 0;padding-bottom: 10px;">
                <%--<h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2>--%>
			    	<div class="optn">
        					<button type="button" onclick="comparison();" ><i class="ico ico-gk"></i><dict:lang value="加载" /></button>
			    	        <button type="button" onclick="conserve();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd" style="height:550px;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="<c:out value='${exeid}' />">
								<input type="hidden" name="definedMsg" value="<c:out value='${definedMsg}' />">
								<input type="hidden" name="formId" value="<c:out value='${formId}' />">
								<input type="hidden" name="dataId" value="<c:out value='${dataId}' />">
								<input type="hidden" name=iframeId value="<c:out value='${iframeId}' />">
								<input type="hidden" id="PDO_AREA_SN" name="PDO_AREA_SN">
								<input type="hidden" id="PDO_DEVICE_SN" name="PDO_DEVICE_SN">
								<input type="hidden" id="PDO_NUMBER" name="PDO_NUMBER">
								<input type="hidden" id="PDO_MODEL_CODE" name="PDO_MODEL_CODE">
								<input type="hidden" id="PDO_PROCESS_FACE" name="PDO_PROCESS_FACE">
								<input type="hidden" id="PDO_NUMBER_S" name="PDO_NUMBER_S">
								<input type="hidden" id="PDO_MODEL_CODE_S" name="PDO_MODEL_CODE_S">
								<input type="hidden" id="PDO_PROCESS_FACE_S" name="PDO_PROCESS_FACE_S">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="dab546190c604b8b9ff1e67e1d20ab72" type="edit" />
		
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="在线信息" /></h3>
	</div>
	<table class="basic-table" >
	<input type="hidden" id="techSn" name="techSn">
	<input type="hidden" name="formIds" value="dab546190c604b8b9ff1e67e1d20ab72" />
	<input type="hidden" name="dab546190c604b8b9ff1e67e1d20ab72" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'1e1d1e4a06e04345a57e8231db401625'" />
		<s:set name="_$formId_1" value="'dab546190c604b8b9ff1e67e1d20ab72'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_AREA_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="PDO_AREA_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_AREA_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_DEVICE_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="PDO_DEVICE_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_DEVICE_SN" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_NUMBER" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="PDO_NUMBER" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_NUMBER" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PDO_MODEL_CODE" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" colNo="PDO_MODEL_CODE" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_MODEL_CODE" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="PDO_ITEM_NAME" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" colNo="PDO_ITEM_NAME" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_ITEM_NAME" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="PDO_PROCESS_FACE" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" colNo="PDO_PROCESS_FACE" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_PROCESS_FACE" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
			<bu:jsVal formId="dab546190c604b8b9ff1e67e1d20ab72" formIndex="1" />
	
	
	<div class="mod-hd">
		<h3 class="tit"><dict:lang value="转产信息" /></h3>
	</div>
	<table class="basic-table" >
		<tr>
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_NUMBER_S" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="PDO_NUMBER_S" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_NUMBER_S" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_MODEL_CODE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:225px;" colNo="PDO_MODEL_CODE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_MODEL_CODE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		
			<td class="name" style="width:52px;"/><bu:uitn colNo="PDO_ITEM_NAME_S" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" style="width:205px;" colNo="PDO_ITEM_NAME_S" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_ITEM_NAME_S" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PDO_PROCESS_FACE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" /></td>
			<bu:td cssClass="dec" colNo="PDO_PROCESS_FACE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" ><bu:ui colNo="PDO_PROCESS_FACE_S" formId="dab546190c604b8b9ff1e67e1d20ab72" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
	
	
	<div>
		<div class="mod-hd">
			<h3 class="tit"><dict:lang value="比对信息" /></h3>
		</div>
		<table style="width: 100%;margin-top: 10px;">
			<tr>
				<td class="name" style="width: 52px;text-align: right;"><dict:lang value="相同"/></td>
			    	<td class="dec" style="width: 225px;text-align: left;padding-left: 5px;"><input class="input"  type="text" id="identical"/></td>
			    	<td class="name" style="width: 52px;text-align: right;"><dict:lang value="差异"/></td>
			    	<td class="dec" style="width: 225px;text-align: left;padding-left: 5px;"><input class="input"  type="text" id="difference"/></td>
				<td class="name" style="width: 52px;"></td>
				<td class="dec" style="width: 205px;padding-left: 5px;"></td>
			 </tr>
		</table>
		<table class="dlist-table table-line" style="width: 100%;table-layout:fixed;margin-top: 10px">
			<thead>
				<tr>
					<th style="width: 30px;"></th >
					<th style="width: 130px;"><dict:lang value="TABLE" /></th >
					<th style="width: 140px;"><dict:lang value="料站" /></th >
					<th style="width: 80px;"><dict:lang value="通道1" /></th >
					<th style="width: 90px;"><dict:lang value="对比结果" /></th >
					<th style="width: 130px;"><dict:lang value="物料料号" /></th >
					<th style="width: 110px;"><dict:lang value="物料名称" /></th >
					<th ><dict:lang value="规格" /></th >
				</tr>
			</thead>
		</table>
		<div style="overflow:auto;height:200px;">
		<table class="dlist-table" style="width: 100%;table-layout:fixed;">
		<tbody id="dbTbody">
		
		</tbody>
		</table>
		</div>
	
	
	
	</div>
	
	
	
	</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	
	
</div>

	<script type="text/javascript">
			var parentWindow;
			$(function(){
				 parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
			});
			
		var isQuery = false;
		function edit(thisObj){
			if($("#identical").val()<=0){
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="当前设备没有相同料站物料，不能进行转产" />",0,"","");
				 return ;
			}
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
			$(".dlist-table").each(function(seq){
				var tableTrJs = $(this).find("tbody tr");
				_tongLineColor(tableTrJs);
			});
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
<script type="text/javascript" src="${path}plf/page/fp/js/popMultPage.js"></script>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
