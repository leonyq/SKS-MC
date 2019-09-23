<!-- 多级拓展修改 -->
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改" /></title>
	<style type="text/css">
	#addTable_b9f80468a9fe4b74ada4fceff23db738 {width: 1000px;}
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
			    	<div class="optn">
			    	        <button type="button" onclick="editSave(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="881411561f8f4940ac22575c4b8f02ef" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="881411561f8f4940ac22575c4b8f02ef" />
	<input type="hidden" name="881411561f8f4940ac22575c4b8f02ef" value="paraMap0@" />
	<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
	<input type="hidden" name="relcol" value="3a6a195ea82c4ebbaaaacc3ee52c6438" />		<s:set name="_$viewId" value="'fc3aa88df71b4fda83879d2406270ffb'" />
		<s:set name="_$formId_0" value="'881411561f8f4940ac22575c4b8f02ef'" />
		<s:set name="_$type" value="'edit'" />
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_ITEM_CODE" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="0" /></bu:td>
		
			<td class="name" style="width:124px"/><bu:uitn colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="T2#CI_ITEM_NAME" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="T2#CI_ITEM_SPEC" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="0" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_VER" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_STATUS" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="0" /></bu:td>
		
			<td class="name" /><span class="dot">*</span><bu:uitn colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_DEFAULT" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" /></td>
			<bu:td cssClass="dec" colspan="3" colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" ><bu:ui colNo="CB_REMARK" formId="881411561f8f4940ac22575c4b8f02ef" dataId="${dataId}" formIndex="0" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="881411561f8f4940ac22575c4b8f02ef" formIndex="0" />		<div style="padding:1px;"></div>

<bu:editcpwin exeid="%{exeid}" formId="%{formId}" dataId="%{dataId}" hide="false"  hidecol="" viewid="1da7e322a2744995a418936d029737db"/>

									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<script type="text/javascript">
		var parentWindow;
		var hidecol="";
		$(function(){
			parentWindow = top.$("#"+window.frameElement.name)[0].contentWindow;
		});
		var isQuery = false;
		
		function showAddPopWin(viewid,exeid)
		{
			var piframeId = window.frameElement.id;
			var relcol = $("input[type='hidden'][name='relcol']").val();
			var url;
			var trid = getCurRow();
			var formid = 1;
			{
				url = "${path}buss/bussModel.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&relcol=" + relcol + "&viewid=" + viewid + "&formid=" + formid + "&trid=" + trid;
			}
			showPopWinFp(url, 700, 350,"","<dict:lang value="新增"/>","add","");
		}
		function showEditPopWin(e ,viewid ,trid, col)
		{
			var piframeId = window.frameElement.id;
			var id = $(e).parent().parent()[0].id;
			var inputs = $(e).parent().siblings().find("input");
			var data = "{";
			for(var i = 0,len = inputs.length; i < len; i++)
			{
				if(i == len - 1)
				{
					data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\"";
				}				
				else
				{
					data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\",";
				}
			}
			data = data + "}";
			var relcol = $("input[type='hidden'][name='relcol']").val();
			var url ;
			var formid = 1;
			var trnum = col.substring(col.indexOf('@')+1);
			
			if(viewid != null)
			{
				url = "${path}buss/bussModel.ms?exeid=" + viewid + "&piframeId=" + piframeId + "&data=" + data + "&relcol=" + relcol+"&trId=" + trid + "&col=" +  col + "&formid=" + formid + "&trid=" + trnum ;
			}
			else
			{	
				url = "${path}buss/bussModel_forEditCommPop.ms?exeid=" + exeid + "&piframeId=" + piframeId + "&data=" + data +"&trId=" + trid + "&relcol=" + relcol ;
			}
			showPopWinFp(url, 800, 400,"","<dict:lang value="修改"/>","edit","");
		}
		
		function findData(trId){
			var tr = document.getElementById(trId);
			var inputs = tr.getElementsByTagName("input");
			var data = "{";
			var map = "\"" + trId + "_key\":" + "[";
			for(var i = 0,len = inputs.length; i < len; i++)
			{
				data += "\"" + inputs[i].id + "\":\"" + inputs[i].value + "\",";
				if(i == len - 1)
				{
					map += "\"" + inputs[i].id + "\"";
				}				
				else
				{
					map += "\"" + inputs[i].id + "\",";
				}
			}
			map += "]";
			data += map;
			data = data + "}";
			var result = data;
			return result;
		}
		
		function findTr(trId){
			var tr = document.getElementsByName(trId);
			return $(tr).clone(1) ;
		}
		
		function addData(data,exeid,viewid){
			var colParams = "";
			return addRowPop(exeid,'1', colParams,data,'add',viewid,hidecol);
			//$("table tbody").append(data);
		}
		
		function editData(data,trId,colno)
		{
			var colId = trId.substring('addTableTr'.length,trId.indexOf('_'));
			if(document.getElementsByName('td_'+trId+'#'+ colno)[0] != null)
			{
				$(document.getElementsByName('td_'+trId+'#'+ colno)[0]).empty();
				$(document.getElementsByName('td_'+trId+'#'+ colno)[0]).append(data);
				
				$(".glxb-table .chosen-container").css("width","100%");
			}
			
		}
		
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
			emptyValToHide('N');
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
		function getEditRows(tableId,formIndex,formidFirstId,subFormId,subRelColId,relColVal,viewid){
		 
			util.showLoading();
			var url ="${path}buss/bussModel_editSubDataPopAx.ms";
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
		    data:{'paraMap.FORMID':tableId,'paraMap.formIndex':formIndex,'paraMap.FORM_COL_ID_D':FORM_COL_ID_D,'paraMap.trIndex':curRowSeq,'paraMap.formidFirstId':formidFirstId,'paraMap.subFormId':subFormId,'paraMap.subRelColId':subRelColId,'paraMap.relColVal':relColVal,'paraMap.viewid':viewid,'paraMap.hidecol':hidecol},
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
					setChosen();
					$(".glxb-table .chosen-container").css("width","100%");
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
<bu:script viewId="fc3aa88df71b4fda83879d2406270ffb" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>