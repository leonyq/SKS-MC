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
			<div class="bd">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editAjaxComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="definedMsg" value="${definedMsg}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="iframeId" value="${iframeId}">
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
		<bu:set name="paraMapObj" value="${dataId}" formId="2ea95967d56649819c804bb7f19c6cbc" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="2ea95967d56649819c804bb7f19c6cbc" />
	<input type="hidden" name="2ea95967d56649819c804bb7f19c6cbc" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cb004470cf014dc7a627c07ddf49e715'" />
		<s:set name="_$formId_1" value="'2ea95967d56649819c804bb7f19c6cbc'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:93px;"/><span class="dot">*</span><bu:uitn colNo="MODEL_NAME" formId="2ea95967d56649819c804bb7f19c6cbc" /></td>
			<bu:td cssClass="dec" colNo="MODEL_NAME" formId="2ea95967d56649819c804bb7f19c6cbc" ><bu:ui colNo="MODEL_NAME" formId="2ea95967d56649819c804bb7f19c6cbc" dataId="${dataId}" formIndex="1" style="width:300px;" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="MODEL_TYPE" formId="2ea95967d56649819c804bb7f19c6cbc" /></td>
			<bu:td cssClass="dec" colNo="MODEL_TYPE" formId="2ea95967d56649819c804bb7f19c6cbc" ><bu:ui colNo="MODEL_TYPE" formId="2ea95967d56649819c804bb7f19c6cbc" dataId="${dataId}" formIndex="1" style="width:300px;" disabled="disabled"/></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="ENABLE_FLAG" formId="2ea95967d56649819c804bb7f19c6cbc" /></td>
			<bu:td cssClass="dec" colNo="ENABLE_FLAG" formId="2ea95967d56649819c804bb7f19c6cbc" >
				<bu:ui colNo="ENABLE_FLAG" formId="2ea95967d56649819c804bb7f19c6cbc" dataId="${dataId}" formIndex="1" disabled="disabled"/>
				&#x3000;&#x3000;
				<bu:uitn colNo="DEFAULT_FLAG" formId="2ea95967d56649819c804bb7f19c6cbc" />
				<bu:ui colNo="DEFAULT_FLAG" formId="2ea95967d56649819c804bb7f19c6cbc" dataId="${dataId}" formIndex="1" disabled="disabled"/>
			</bu:td>
		
			
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="MODEL_FILE" formId="2ea95967d56649819c804bb7f19c6cbc" /></td>
			<bu:td cssClass="dec" colNo="MODEL_FILE" formId="2ea95967d56649819c804bb7f19c6cbc"  colspan="3"><bu:ui colNo="MODEL_FILE" formId="2ea95967d56649819c804bb7f19c6cbc" dataId="${dataId}" formIndex="1" style="width:300px;" disabled="disabled"/></bu:td>
		</tr>
		</tr>
			<td class="name" /><bu:uitn colNo="MEMO" formId="2ea95967d56649819c804bb7f19c6cbc" /></td>
			<bu:td cssClass="dec" colNo="MEMO" formId="2ea95967d56649819c804bb7f19c6cbc" ><bu:ui colNo="MEMO" formId="2ea95967d56649819c804bb7f19c6cbc" dataId="${dataId}" formIndex="1"  style="width:300px;height:80px;" disabled="disabled"/></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="2ea95967d56649819c804bb7f19c6cbc" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

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
			if(!val.valDataBaseSetData()){
                return ;
            }
			//解决附件清空时，无法传到后台的问题;解决checkbox清空时，无法传到后台的问题	
			emptyValToHide('N');
			document.forms.editForm.submit();
			isQuery = true;
		}
		

		//重置	
		function resetForm(){
			$("#editForm")[0].reset();
		}
				
		var FORM_COL_ID_D=null;
		
		/**删除附件
		*参数:a 标签ID，文件名，文件路径，输入框ID，输入框名称
		**/
		function delFile(aId,fileName,filePath,inputId,inputName){
			var obj = new Object();
			obj.fileName = fileName;
			obj.filePath = filePath;
			obj.inputId = inputId;
			obj.inputName = inputName;
			obj.aId = aId;
			utilsFp.confirmIcon(1,"","delFileConFirm",obj, "<dict:lang value="删除之后不可恢复，确定删除吗？" />","1","260","");
			//util.confirm(delFileConFirm,"<dict:lang value="删除之后不可恢复，确定删除吗？" />",obj);
		}
		var fileMap = new Map();//临时存放file相关input
		function delFileConFirm(obj){
			util.showLoading();
			var url ="${path}buss/bussModel_delFileAx.ms";
		  $.ajax({
				type: "POST",
			    dataType: "json",
			    url: url,
			    data:{'paraMap.FILENAME':obj.fileName,'paraMap.FILEPATH':obj.filePath},
					success: function(data){
						util.closeLoading();
						if(data.ajaxMap != null){
							if(data.ajaxMap.msg == "1"){
								//util.alert("<dict:lang value="删除成功！" />");
								$("#"+obj.aId).parent().find("input").each(function(idx){
									this.value = "";
								});
								fileMap.put(obj.inputName,$("#"+obj.aId).parent().find("input"));
								$("#"+obj.aId).parent().html("<input type='file' name='"+obj.inputName+"' id='"+obj.inputId+"' class='_VAL_NULL input isSubmit _VAL_OjbsData' />");
							}else{
								util.alert("error:"+data.ajaxMap.msg);
							}
						}else{
							util.alert("<dict:lang value="服务器无响应，请稍候再试！" />");
						}
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
