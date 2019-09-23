<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head >
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
		<script type="text/javascript">
		var addTableTrMap;
	</script>

	<script>
	//加载父ifream中的js\css文件
		$(function(){
        		$("#paraMap1_CREATE_TIME").val('${dataMap.nowDate}');
        		});
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
            		<div style="margin-left:10px;"><input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0"/><dict:lang value="保存并关闭窗口" /></div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<input type="hidden" name="iframeId" value="${iframeId}">
				<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
	<table class="basic-table">
	<input type="hidden" name="formIds" value="fe095434a96d487688e6bcb3ff6dc09b" />
	<input type="hidden" name="fe095434a96d487688e6bcb3ff6dc09b" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
	<input type="hidden" name="paraMap1@0#CREATE_USER" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].id}" />" />
		<s:set name="_$viewId" value="'e517f0c152cd478ba10e92d9f9e98642'" />
		<s:set name="_$formId_1" value="'fe095434a96d487688e6bcb3ff6dc09b'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name" style="width:63px;"><span class="dot">*</span><bu:uitn colNo="CREATE_USER" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><input type="text" value="<s:property value="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USERDTO_KEY].name}"/>" disabled="disabled" class="input"/></td>
			<td class="name" style="width:52px;"><bu:uitn colNo="MODNAME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" style="width:230px;"><bu:ui colNo="MODNAME" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{MODNAME}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name "><bu:uitn colNo="PROJECT" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><bu:ui colNo="PROJECT" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{PROJECT}" formIndex="1" /></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="TYPE" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><bu:ui colNo="TYPE" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{TYPE}" formIndex="1" cssClass="_VAL_NULL isSubmit" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="CREATE_TIME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec"><bu:ui colNo="CREATE_TIME" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{CREATE_TIME}" formIndex="1" /></td>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="STATE" formId="fe095434a96d487688e6bcb3ff6dc09b" cssClass="name " /></td>
			<td class="dec"><bu:ui colNo="STATE" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{STATE}" formIndex="1" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="THEME" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" colspan="3"><bu:ui colNo="THEME" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{THEME}" formIndex="1"  style="width:100%;height:25px;"/></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="DETAIL" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" colspan="3" height="80px"><bu:ui colNo="DETAIL" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{DETAIL}" formIndex="1"  style="width:100%;height:100%;" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="REASON" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" colspan="3" height="80px"><bu:ui colNo="REASON" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{REASON}" formIndex="1"  style="width:100%;height:100%;" /></td>
		</tr>
		<tr>
			<td class="name "><span class="dot">*</span><bu:uitn colNo="COUNTERMOVE" formId="fe095434a96d487688e6bcb3ff6dc09b" /></td>
			<td class="dec" colspan="3" height="80px"><bu:ui colNo="COUNTERMOVE" formId="fe095434a96d487688e6bcb3ff6dc09b" value="%{COUNTERMOVE}" formIndex="1" style="width:100%;height:100%;" /></td>
		</tr>
	</table>
			<bu:jsVal formId="fe095434a96d487688e6bcb3ff6dc09b" formIndex="1"/>
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
<bu:script viewId="e517f0c152cd478ba10e92d9f9e98642" />
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
