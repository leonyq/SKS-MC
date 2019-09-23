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
			        <button type="button" onclick="add(this,'${formId}');"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="ec9ecb539af6461e98b5ccd5ec9b17ad" />
	<input type="hidden" name="ec9ecb539af6461e98b5ccd5ec9b17ad" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="1" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'e9490f80b9fb409a86b6a192354e666e'" />
		<s:set name="_$formId_1" value="'ec9ecb539af6461e98b5ccd5ec9b17ad'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-four" /><bu:uitn colNo="QWL_EVENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_EVENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_EVENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_EVENT}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="QWL_STATUS" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_STATUS" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_STATUS" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_STATUS}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="QWL_TYPE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_TYPE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_TYPE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_TYPE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="QWL_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="QWL_AREA_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_AREA_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_AREA_SN" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_AREA_SN}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="QWL_MO_NUMBER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MO_NUMBER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MO_NUMBER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_MO_NUMBER}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="QWL_MODEL_CODE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_MODEL_CODE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_MODEL_CODE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_MODEL_CODE}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="QWL_CONTENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_CONTENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CONTENT" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_CONTENT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="QWL_REASON" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_REASON" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_REASON" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_REASON}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="QWL_SOLUTION" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_SOLUTION" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_SOLUTION" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_SOLUTION}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="QWL_CLOSER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_CLOSER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CLOSER" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_CLOSER}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="QWL_CLOSE_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_CLOSE_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_CLOSE_TIME" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_CLOSE_TIME}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name-four" /><bu:uitn colNo="QWL_REMARK" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_REMARK" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_REMARK" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_REMARK}" formIndex="1" /></bu:td>
		<td>&nbsp;</td>
			<td class="name-four" /><bu:uitn colNo="QWL_PROCESS_FACE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" /></td>
			<bu:td cssClass="dec-self" colNo="QWL_PROCESS_FACE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" ><bu:ui colNo="QWL_PROCESS_FACE" formId="ec9ecb539af6461e98b5ccd5ec9b17ad" value="%{QWL_PROCESS_FACE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="ec9ecb539af6461e98b5ccd5ec9b17ad" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
      <jsp:param name="modelName" value="VIEW_TYPE_11" />
       <jsp:param name="location" value="jsLoading" />
    </jsp:include>

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
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
