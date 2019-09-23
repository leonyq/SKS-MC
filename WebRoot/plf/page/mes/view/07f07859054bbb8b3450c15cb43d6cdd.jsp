<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="下达" /></title>
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
			    	        <button type="button" onclick="addIssued(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
        					<button type="button" onclick="closeWindow();" ><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" target="submitFrame"
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
<div class="mod">
<div class="mod-hd">		
  <h3 class="tit"><dict:lang value="基本信息" /></h3>	
  </div>
  <div class="mod-hd" style="height:150px">
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="d34c8f48bead40d88c24a153c731de82" />
	<input type="hidden" name="d34c8f48bead40d88c24a153c731de82" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'a460a8a06b2848369b056bab08639546'" />
		<s:set name="_$formId_1" value="'d34c8f48bead40d88c24a153c731de82'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" style="width:90px"/><bu:uitn colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PROJECT_ID" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PROJECT_ID" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		
		    <td class="name"  style="width:90px"/><bu:uitn colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec"  style="width:230px" colNo="PROJECT_STEP" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PROJECT_STEP" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit"  formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_COUNT" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_COUNT" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="FQC_COUNT" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="FQC_COUNT" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_MATERIAL" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_MATERIAL" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="FINISH_COUNT" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="FINISH_COUNT" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		<tr>
			<td class="name" /><bu:uitn colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_NAME" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_NAME" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" /></td>
			<bu:td cssClass="dec" colNo="PRODUCT_STANDARD" formId="d34c8f48bead40d88c24a153c731de82" ><bu:ui colNo="PRODUCT_STANDARD" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="d34c8f48bead40d88c24a153c731de82" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
		
		
	
	</table>
	</div>
	
	<DIV id="content1">
	<div class="mod-hd">		
        <h3 class="tit"><dict:lang value="制令单信息" /></h3>	
        </div>
        <div class="mod-hd" style="height:220px">	
	   <table class="basic-table" id="table2" name="table2">
		<tr><input type="hidden" name="maxMonumber" id="maxMonumber" value="${dataMap.PM_TARGET_QTY}">
			<td class="name"  style="width:90px"/><bu:uitn colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MO_NUMBER" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MO_NUMBER" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formId="9b18994844b049f2ad90204b77793334" value="%{PM_MO_NUMBER}" formIndex="1" /></bu:td>
		    <td class="name"  style="width:90px"/><span class="dot">*</span><bu:uitn colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec"  style="width:230px" colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_TARGET_QTY" formId="9b18994844b049f2ad90204b77793334" value="%{PM_TARGET_QTY}" formIndex="1" /></bu:td>	
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_AREA_SN" formId="9b18994844b049f2ad90204b77793334" value="%{PM_AREA_SN}" formIndex="1" /></bu:td>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_PROCESS_FACE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_PROCESS_FACE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_SCHEDULE_DATE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_SCHEDULE_DATE}" formIndex="1" /></bu:td>
		    <td class="name" /><span class="dot">*</span><bu:uitn colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_DUE_DATE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_DUE_DATE}" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_ISSUED_DATE" formId="9b18994844b049f2ad90204b77793334" value="%{PM_ISSUED_DATE}" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formIndex="1" /></bu:td>
		    <td class="name" /><bu:uitn colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_ISSUED_EMP" formId="9b18994844b049f2ad90204b77793334" value="%{PM_ISSUED_EMP}" disabled="disabled" cssClass="input isSubmit  readonly isaddSubmit" formIndex="1" /></bu:td>
		
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="PM_MEMO" formId="9b18994844b049f2ad90204b77793334" /></td>
			<bu:td cssClass="dec" colNo="PM_MEMO" colspan="3" formId="9b18994844b049f2ad90204b77793334" ><bu:ui colNo="PM_MEMO"  rows="3" formId="9b18994844b049f2ad90204b77793334" value="%{PM_MEMO}" formIndex="1" /></bu:td>
		</tr>
		
	</table>
	</div>
	</div>
	</div>
			<bu:jsVal formId="d34c8f48bead40d88c24a153c731de82" formIndex="1" />		<div style="padding:1px;"></div>

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
			     $("#paraMapObj_PRODUCT_MATERIAL_SHOW_BUTTON").remove();
			     $("#paraMapObj_PM_TARGET_QTY").val('${dataMap.PM_TARGET_QTY}');
			     $("#paraMapObj_PM_ISSUED_DATE").val('${dataMap.nowDate}');
	             $("#paraMapObj_PM_ISSUED_EMP").val('${dataMap.userId}');
				 $("#paraMapObj_PM_MO_NUMBER").val('${dataMap.PM_MO_NUMBER}');
				 
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
<bu:script viewId="a460a8a06b2848369b056bab08639546" />

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
