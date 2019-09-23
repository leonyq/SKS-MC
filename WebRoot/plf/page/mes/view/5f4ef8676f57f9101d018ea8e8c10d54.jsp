<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
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
			    	        <button type="button" onclick="editNew(this);"><i class="ico ico-save"></i><dict:lang value="提交" /></button>
				<button type="button" onclick="resetForm();"><i class="ico ico-gk"></i>重置</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="关闭" /></button>
			    </div>

			</div>
			<div class="bd">
					<form id="editForm" name="editForm" action="${path}buss/bussModel_editComm.ms" method="post" target="submitFrame"
								<bu:formet exeid="%{exeid}" />>
								<input type="hidden" name="exeid" value="${exeid}">
								<input type="hidden" name="formId" value="${formId}">
								<input type="hidden" name="dataId" value="${dataId}">
										
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="cbf03836bb0348aca9f40ef9665c6e2b" />
	<input type="hidden" name="cbf03836bb0348aca9f40ef9665c6e2b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'f36e8a5a759442fd83e01448ca25dd3d'" />
		<s:set name="_$formId_1" value="'cbf03836bb0348aca9f40ef9665c6e2b'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="tr1" /><bu:uitn colNo="LIST_ID" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></td>
			<bu:td colNo="LIST_ID" formId="cbf03836bb0348aca9f40ef9665c6e2b" ><bu:ui colNo="LIST_ID" formId="cbf03836bb0348aca9f40ef9665c6e2b" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="LIST_NAME" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></td>
			<bu:td colNo="LIST_NAME" formId="cbf03836bb0348aca9f40ef9665c6e2b" ><bu:ui colNo="LIST_NAME" formId="cbf03836bb0348aca9f40ef9665c6e2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><bu:uitn colNo="LIST_TIME" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></td>
			<bu:td colNo="LIST_TIME" formId="cbf03836bb0348aca9f40ef9665c6e2b" ><bu:ui colNo="LIST_TIME" formId="cbf03836bb0348aca9f40ef9665c6e2b" dataId="${dataId}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="LIST_CONTENT" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></td>
			<bu:td colNo="LIST_CONTENT" formId="cbf03836bb0348aca9f40ef9665c6e2b" ><bu:ui colNo="LIST_CONTENT" formId="cbf03836bb0348aca9f40ef9665c6e2b" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><bu:uitn colNo="LIST_PHOTO" formId="cbf03836bb0348aca9f40ef9665c6e2b" /></td>
			<bu:td colNo="LIST_PHOTO" formId="cbf03836bb0348aca9f40ef9665c6e2b" ><bu:ui colNo="LIST_PHOTO" formId="cbf03836bb0348aca9f40ef9665c6e2b" dataId="${dataId}" formIndex="1" /></bu:td>
		
		</tr>
	</table>
			<bu:jsVal formId="cbf03836bb0348aca9f40ef9665c6e2b" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
		var isQuery = false;
		function editNew(thisObj){
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
		
		//function reloadPg(msg){
		//	isQuery = false;
		//	parent.reloadPg(msg);;
		//}

		var FORM_COL_ID_D=null;
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal){
			utilsFp.showLoading();
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

</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
