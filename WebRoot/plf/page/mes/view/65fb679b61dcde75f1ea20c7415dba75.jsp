<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
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
			        <button type="button" onclick="parent.closePopWin();"><i class="ico ico-cancel"></i>取消</button>
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
		<bu:set name="paraMapObj" value="${dataId}" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" type="add" />
	<table class="add_table" >
	<input type="hidden" name="formIds" value="f3ccf2b66c9c4a9f927ed0cd2a8c5089" />
	<input type="hidden" name="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'596e5e64d44e4f3f81815ae0f82e7955'" />
		<s:set name="_$formId_1" value="'f3ccf2b66c9c4a9f927ed0cd2a8c5089'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="tr1" /><span class="dot"></span><bu:uitn colNo="U_ID2" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="U_ID2" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="U_ID2" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{U_ID2}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="POP_SEL_S" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="POP_SEL_S" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="POP_SEL_S" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{POP_SEL_S}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><bu:uitn colNo="UP_FILE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="UP_FILE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="UP_FILE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UP_FILE}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="POP_SEL_M" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="POP_SEL_M" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="POP_SEL_M" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{POP_SEL_M}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><bu:uitn colNo="BUTTON" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="BUTTON" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="BUTTON" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{BUTTON}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="UP_FILE_SIZE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="UP_FILE_SIZE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="UP_FILE_SIZE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UP_FILE_SIZE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><bu:uitn colNo="UP_FILE_SAVE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="UP_FILE_SAVE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="UP_FILE_SAVE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UP_FILE_SAVE}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="USER_POP" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="USER_POP" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="USER_POP" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{USER_POP}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><span class="dot"></span><bu:uitn colNo="UNAME" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="UNAME" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="UNAME" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{UNAME}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="STATE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="STATE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="STATE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{STATE}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><bu:uitn colNo="M_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="M_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="M_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{M_CHECK}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="S_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="S_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="S_CHECK" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{S_CHECK}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><bu:uitn colNo="TIMES" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="TIMES" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="TIMES" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{TIMES}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="TT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="TT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="TT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{TT}" formIndex="1" /></bu:td>
		</tr>
		<tr>
			<td class="tr1" /><bu:uitn colNo="MU_TEXT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="MU_TEXT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="MU_TEXT" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{MU_TEXT}" formIndex="1" /></bu:td>
			<td class="tr1" /><bu:uitn colNo="AGE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" /></td>
			<bu:td colNo="AGE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" ><bu:ui colNo="AGE" formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" value="%{AGE}" formIndex="1" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="f3ccf2b66c9c4a9f927ed0cd2a8c5089" formIndex="1" />
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

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>
