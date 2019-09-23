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
			    	        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="167639778c8f4ee08caad77b61e5081c" type="edit" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="167639778c8f4ee08caad77b61e5081c" />
	<input type="hidden" name="167639778c8f4ee08caad77b61e5081c" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'cc0e1f728f23464db5fee6a9384ee9b4'" />
		<s:set name="_$formId_1" value="'167639778c8f4ee08caad77b61e5081c'" />
		<s:set name="_$type" value="'edit'"/>
		<tr>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_SN" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_NAME" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_CODE" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_STANDARD" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MODEL_NAME" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><span class="dot">*</span><bu:uitn colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_PROCESS_FACE" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_STAUS" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_ITEM_COUNT" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MOUNT_SPEED" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" /></td>
			<bu:td cssClass="dec-self" colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" ><bu:ui colNo="CM_MEMO" formId="167639778c8f4ee08caad77b61e5081c" dataId="${dataId}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="167639778c8f4ee08caad77b61e5081c" formIndex="1" />		<div style="padding:1px;"></div>

		<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="料站表明细" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('1abddbae1d704169a987c0af3e06c1df','2','','','');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('1abddbae1d704169a987c0af3e06c1df','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner1abddbae1d704169a987c0af3e06c1df">
								<bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="2"  selfformid="1abddbae1d704169a987c0af3e06c1df" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'1abddbae1d704169a987c0af3e06c1df')" >
							<table class="glxb-table" style="width:100%" id="addTable_1abddbae1d704169a987c0af3e06c1df" >
								<tbody id="tbody_1abddbae1d704169a987c0af3e06c1df" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
		<div style="padding:1px;"></div>

		<div class="mod" >
			<div class="mod-hd"> 
				<h3 class="tit"><dict:lang value="关联线别" /></h3>
					<div class="extend-btn" style="float: right;margin-top:15px;">
						<button type="button"    onclick="_addRowExtend('99b52ba36c464464aef5216e173ca678','3','','','');"     style="padding:0;" title="<dict:lang value="添加" />">   <i class="ico ico-kl-new-add ico-small"></i>
						</button>
						<button type="button" onclick="_delRowExtend('99b52ba36c464464aef5216e173ca678','');"     style="padding:0"   title="<dict:lang value="移除" /> " >   <i class="ico ico-sc-new-add ico-small"></i> 
						</button> 
					</div>
			</div>
			<div class="mod-bd" >
				<div class="panel datagrid datagrid-div1">
					<div class="datagrid-div2 datagrid-div6 datagrid-view"   >
						<div class="datagrid-header" >
							<div class="datagrid-header-inner" id="datagrid-header-inner99b52ba36c464464aef5216e173ca678">
								<bu:addSub formid="167639778c8f4ee08caad77b61e5081c" formIndex="3"  selfformid="99b52ba36c464464aef5216e173ca678" hidecol=""  viewid="" />
							</div>
						</div>
						<div class="datagrid-body datagrid-div3"  style="height:150px" onscroll="ajaxTableScroll(this,'99b52ba36c464464aef5216e173ca678')" >
							<table class="glxb-table" style="width:100%" id="addTable_99b52ba36c464464aef5216e173ca678" >
								<tbody id="tbody_99b52ba36c464464aef5216e173ca678" >
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		 </div>
<script>
function initEditDataLs(){
var relColVal=$("#paraMapObj_CM_SN").val();
getEditRows("1abddbae1d704169a987c0af3e06c1df","2","167639778c8f4ee08caad77b61e5081c","","169fb0cbc258411b9fff8e59f9ff7ff5",relColVal);
getEditRows("99b52ba36c464464aef5216e173ca678","3","167639778c8f4ee08caad77b61e5081c","","f3a8e0d4da0542539db9956286dd37e8",relColVal);
$('table').find('tbody tr:eq(0)').click();
}
</script>

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
