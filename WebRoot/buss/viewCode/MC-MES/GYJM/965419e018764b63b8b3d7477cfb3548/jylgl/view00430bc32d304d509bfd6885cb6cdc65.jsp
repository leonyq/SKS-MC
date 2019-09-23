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
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>

			</div>
			<div class="bd">
						    			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
										target="submitFrame">
										<input type="hidden" name="exeid" value="${exeid}">
										<input type="hidden" name="definedMsg" value="${definedMsg}">
										<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
										<s:token />
										<table class="func_table">
											<tr>
												<td width="100%" align="right">
						
												</td>
											</tr>
										</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="09206fb514ca4b258beb531bc903334b" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="09206fb514ca4b258beb531bc903334b" />
	<input type="hidden" name="09206fb514ca4b258beb531bc903334b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'00430bc32d304d509bfd6885cb6cdc65'" />
		<s:set name="_$formId_1" value="'09206fb514ca4b258beb531bc903334b'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" /><bu:uitn colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" ><bu:ui colNo="CF_TYPE" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_TYPE}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" ><bu:ui colNo="CF_PROJECT_ID" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_PROJECT_ID}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" ><bu:ui colNo="CF_MODEL_CODE" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_MODEL_CODE}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" ><bu:ui colNo="CF_ITEM_CODE" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_ITEM_CODE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" ><bu:ui colNo="CF_ITEM_NAME" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_ITEM_NAME}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" ><bu:ui colNo="CF_ITEM_DESC" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_ITEM_DESC}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" ><bu:ui colNo="CF_STATUS" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_STATUS}" formIndex="1" /></bu:td>
			<td class="name" /><bu:uitn colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" ><bu:ui colNo="CF_MEMO" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_MEMO}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="name" /><bu:uitn colNo="CF_CREATE_DATE" formId="09206fb514ca4b258beb531bc903334b" /></td>
			<bu:td cssClass="dec" colNo="CF_CREATE_DATE" formId="09206fb514ca4b258beb531bc903334b"><bu:ui colNo="CF_CREATE_DATE" formId="09206fb514ca4b258beb531bc903334b" value="%{CF_CREATE_DATE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="09206fb514ca4b258beb531bc903334b" formIndex="1" />
									</form>
			</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();

	}//初始化方法
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
