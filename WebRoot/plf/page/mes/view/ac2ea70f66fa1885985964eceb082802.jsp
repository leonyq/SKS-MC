<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
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
			        <button type="button" onclick="saveScrapInfo();"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addAjaxComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<input type="hidden" name="formId" value="${formId}">
										<input type="hidden" name=iframeId value="${iframeId}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="802134fcde97488a9c3dea5e9081c3fd" type="add" />
	<table class="basic-table" style="max-width:750px;">
	<input type="hidden" name="formIds" value="802134fcde97488a9c3dea5e9081c3fd" />
	<input type="hidden" name="802134fcde97488a9c3dea5e9081c3fd" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" id="ID" name="ID"/>	
	<input type="hidden" id="FS_SCR_CONFIRM" name="FS_SCR_CONFIRM"/>
	<input type="hidden" id="FS_SCR_CHECK" name="FS_SCR_CHECK"/>
	<input type="hidden" id="FS_SCR_REASON" name="FS_SCR_REASON"/>
		<s:set name="_$viewId" value="'6514cd76618f4bf2bcdd08d1cd4d3a6d'" />
		<s:set name="_$formId_1" value="'802134fcde97488a9c3dea5e9081c3fd'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><bu:uitn colNo="FS_FEEDER_SN" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec-self" colNo="FS_FEEDER_SN" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_FEEDER_SN"  formId="802134fcde97488a9c3dea5e9081c3fd" value="${dataList[0].TCF_FEEDER_SN}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="FS_FEEDER_TYPE" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec-self" colNo="FS_FEEDER_TYPE" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_FEEDER_TYPE"  formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_FEEDER_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FS_FEEDER_SPEC" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec-self" colNo="FS_FEEDER_SPEC" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_FEEDER_SPEC"  formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_FEEDER_SPEC}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="FS_SCR_APPLAYER" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec-self" colNo="FS_SCR_APPLAYER" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_APPLAYER"  formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_APPLAYER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FS_SCR_CONFIRM" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec-self" colNo="FS_SCR_CONFIRM" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_CONFIRM" formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_CONFIRM}" formIndex="1" /></bu:td>
		
			<td class="name" /><bu:uitn colNo="FS_SCR_CHECK" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec-self" colNo="FS_SCR_CHECK" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_CHECK"  formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_CHECK}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="FS_SCR_REASON" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec-self" colspan="3" colNo="FS_SCR_REASON" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_REASON" style="height:80px;" formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_REASON}" formIndex="1" /></bu:td>
		
			
		</tr>
		
		<tr>
			
		
			<td class="name" style="display:none;" /><bu:uitn colNo="FS_SCR_DATE" formId="802134fcde97488a9c3dea5e9081c3fd" /></td>
			<bu:td cssClass="dec" style="display:none;" colNo="FS_SCR_DATE" formId="802134fcde97488a9c3dea5e9081c3fd" ><bu:ui colNo="FS_SCR_DATE" formId="802134fcde97488a9c3dea5e9081c3fd" value="%{FS_SCR_DATE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="802134fcde97488a9c3dea5e9081c3fd" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
	
	$("#paraMap1_FS_FEEDER_SN").val('${dataList[0].TCF_FEEDER_SN}');
	$("#paraMap1_FS_FEEDER_TYPE").val('${dataList[0].TCT_TYPE}');
	$("#paraMap1_FS_FEEDER_SPEC").val('${dataList[0].TCS_SPEC}');
	$("#paraMap1_FS_SCR_APPLAYER").val('${dataList[0].CREATE_USER}');
	$("#ID").val('${dataMap.ID}');
	
	$("#paraMap1_FS_SCR_CONFIRM_SHOW").val('${dataMap.FS_SCR_CONFIRM}');//
	$("#paraMap1_FS_SCR_CHECK_SHOW").val('${dataMap.FS_SCR_CHECK}');
	$("#paraMap1_FS_SCR_CONFIRM").val('${dataMap.FS_SCR_CONFIRM}');//
	$("#paraMap1_FS_SCR_CHECK").val('${dataMap.FS_SCR_CHECK}');
	
	
	$("#paraMap1_FS_SCR_REASON").val('${dataMap.FS_SCR_REASON}');
	
	$("#paraMap1_FS_FEEDER_SN").attr("readonly","readonly");
	$("#paraMap1_FS_FEEDER_TYPE").attr("disabled",true);
	$("#paraMap1_FS_FEEDER_SPEC").attr("disabled",true);
	$("#paraMap1_FS_SCR_APPLAYER").attr("readonly","readonly");
</script>
<bu:submit viewId="6514cd76618f4bf2bcdd08d1cd4d3a6d" />
<bu:script viewId="6514cd76618f4bf2bcdd08d1cd4d3a6d" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
