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
			        <button type="button" onclick="addScarp()"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="f40408a50af34aafb9f5ccc3194cfbf7" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="f40408a50af34aafb9f5ccc3194cfbf7" />
	<input type="hidden" name="f40408a50af34aafb9f5ccc3194cfbf7" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="scarp_id" id="scarp_id"/>
	<input type="hidden" name="cfs_item_type" id="cfs_item_type"/>
	
		<s:set name="_$viewId" value="'43d2da4a1b90409f8bd5f08b81cdec30'" />
		<s:set name="_$formId_1" value="'f40408a50af34aafb9f5ccc3194cfbf7'" />
		<s:set name="_$type" value="'add'" />
		
		<tr>
			<td class="name-six" /><bu:uitn colNo="CTFS_TIN_SN" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec-self" colNo="CTFS_TIN_SN" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CTFS_TIN_SN" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CTFS_TIN_SN}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFS_ITEM_CODE" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec-self" colNo="CFS_ITEM_CODE" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFS_ITEM_CODE" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFS_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_ASSISTANTTOOLNAME" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ASSISTANTTOOLNAME" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFI_ASSISTANTTOOLNAME" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFI_ASSISTANTTOOLNAME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFI_ASSISTANTTOOLSPEC" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_ASSISTANTTOOLSPEC" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFI_ASSISTANTTOOLSPEC" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFI_ASSISTANTTOOLSPEC}" formIndex="1" /></bu:td>
		</tr>
		
		<tr>
			<td class="name-three" /><bu:uitn colNo="CFI_SUPPLIER" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec-self" colNo="CFI_SUPPLIER" formId="f40408a50af34aafb9f5ccc3194cfbf7"  colspan="4"><bu:ui colNo="CFI_SUPPLIER" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFI_SUPPLIER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFS_SCARP_TYPE" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec-self" colNo="CFS_SCARP_TYPE" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFS_SCARP_TYPE" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFS_SCARP_TYPE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-six" /><bu:uitn colNo="CFS_SCARP_REASON" formId="f40408a50af34aafb9f5ccc3194cfbf7" /></td>
			<bu:td cssClass="dec-self" colNo="CFS_SCARP_REASON" formId="f40408a50af34aafb9f5ccc3194cfbf7" ><bu:ui colNo="CFS_SCARP_REASON" formId="f40408a50af34aafb9f5ccc3194cfbf7" value="%{CFS_SCARP_REASON}" formIndex="1" style="width:229px;height:80px;"/></bu:td>
		</tr>
		
		
		 
	</table>
			<bu:jsVal formId="f40408a50af34aafb9f5ccc3194cfbf7" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
                <bu:submit viewId="43d2da4a1b90409f8bd5f08b81cdec30" />
		<bu:script viewId="43d2da4a1b90409f8bd5f08b81cdec30" />
<script type="text/javascript">
	function init(){
		if($("#leftTable-kz").length>0){
			$("#leftTable-kz").show();
		}
		
		if($("#leftTable").length>0){
			$("#leftTable").show();
		}
		
		
		$("#paraMap1_CFI_ASSISTANTTOOLNAME").removeAttr("disabled");
		$("#paraMap1_CFI_ASSISTANTTOOLSPEC").removeAttr("disabled");
		$("#paraMap1_CFI_SUPPLIER").removeAttr("disabled");
		
		$("#").attr("readonly","readonly");
		$("#").addClass("readonly"); 
		
		$("#paraMap1_CTFS_TIN_SN").attr("readonly","readonly");
		$("#paraMap1_CTFS_TIN_SN").addClass("readonly");
		
		$("#paraMap1_CFS_ITEM_CODE").attr("readonly","readonly");
		$("#paraMap1_CFS_ITEM_CODE").addClass("readonly"); 
		
		$("#paraMap1_CFI_ASSISTANTTOOLNAME").attr("readonly","readonly");
		$("#paraMap1_CFI_ASSISTANTTOOLNAME").addClass("readonly"); 
		
		$("#paraMap1_CFI_ASSISTANTTOOLSPEC").attr("readonly","readonly");
		$("#paraMap1_CFI_ASSISTANTTOOLSPEC").addClass("readonly"); 
		
		$("#paraMap1_CFI_SUPPLIER").attr("readonly","readonly");
		$("#paraMap1_CFI_SUPPLIER").addClass("readonly"); 
		
		
		$("#paraMap1_CTFS_TIN_SN").val('${dataMap.ctfsTinSn}');
		$("#paraMap1_CFS_ITEM_CODE").val('${dataMap.cfsItemCode}');
		$("#paraMap1_CFI_ASSISTANTTOOLNAME").val('${dataMap.cfiAssistanttoolName}');
		$("#paraMap1_CFI_ASSISTANTTOOLSPEC").val('${dataMap.cfiAssistanttoolSpec}');
		$("#paraMap1_CFI_SUPPLIER").val('${dataMap.cfiSupplier}');
		
		$("#scarp_id").val('${dataMap.scarpId}');
		$("#cfs_item_type").val('${dataMap.cfsItemType}');
		
		
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

