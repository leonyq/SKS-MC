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
			    	<div class="optn">
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i>取消</button>
        					<button type="button" onclick="resetForm();" ><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			    </div>

			</div>
			<div class="bd"  style="height: 335px;width:685px;">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame" enctype="multipart/form-data"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="iframeId" value="${iframeId}">
								<input type="hidden" name="dataId" value="${dataId}">
								<input type="hidden" name="edit_type" value="update">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="4d5275f6a24f44119737918a3136a935" type="edit" />
	<table class="basic-table"  style="margin-right:30px">
	<input type="hidden" name="formIds" value="4d5275f6a24f44119737918a3136a935" />
	<input type="hidden" name="4d5275f6a24f44119737918a3136a935" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f0e3305b8f0e433d95739c1d69336781'" />
		<s:set name="_$formId_1" value="'4d5275f6a24f44119737918a3136a935'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:63px;"/><span class="dot">*</span><bu:uitn colNo="CUST_CODE" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUST_CODE" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
			<td class="name" rowspan="5" style="width:64px;vertical-align: bottom;"/><bu:uitn colNo="CUST_LOGO" formId="4d5275f6a24f44119737918a3136a935" /></td>
		        <td class="dec" rowspan="5" style="width:230px;vertical-align: bottom;"><bu:ui colNo="PHONE_PATH" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CUSTOMER" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUSTOMER" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUST_ABBREVIATION" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUST_ABBREVIATION" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUST_GROUP" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" ><bu:ui colNo="CUST_GROUP" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUSTOMER_GRADE" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="CUSTOMER_GRADE" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="STATUS" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec"><bu:ui colNo="STATUS" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
		        <td class="name" /><bu:uitn colNo="CUST_BOM" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" ><bu:ui colNo="CUST_BOM" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" /></td>
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CUST_ADDRESS" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="CUST_ADDRESS" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" style="width:100%;"/></td>
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="MEMO" formId="4d5275f6a24f44119737918a3136a935" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="MEMO" formId="4d5275f6a24f44119737918a3136a935" dataId="${dataId}" formIndex="1" style="width:100%;height:80px;"/></td>
			
		</tr>
	</table>
			<bu:jsVal formId="4d5275f6a24f44119737918a3136a935" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
         <bu:submit viewId="f0e3305b8f0e433d95739c1d69336781" />
         <bu:script viewId="f0e3305b8f0e433d95739c1d69336781" />
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
        $("#paraMapObj_PHONE_PATH").change(function(){
	var $file = $(this);
var fileObj = $file[0];
if(fileObj && fileObj.files && fileObj.files[0]){
	var objUrl = getObjectURL(this.files[0]) ;
	if (objUrl) {
		$("#img0").attr("src", objUrl) ;
	}
}
else{
//IE下，使用滤镜
                  fileObj.select();
                  var hhotoObj = document.getElementById("paraMapObj_PHOTO_PATH");
		var imgObjPreview = document.getElementById("img0");
			hhotoObj.select();
			var imgSrc = document.selection.createRange().text;
			var imgId = document.getElementById("photoImg");
			imgId.style.width = '100px';
		    imgId.style.height = '100px';
						try {
				imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				imgId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				//utilsFp.alert("<dict:lang value='您上传的图片格式不正确' />");
				utilsFp.confirmIcon(3,"","","", "<dict:lang value="您上传的图片格式不正确" />",0,"","");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty(); 
}
}) ;

function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
