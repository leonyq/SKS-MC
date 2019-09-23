<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<%@ include file="/plf/common/pub_meta.jsp"%>
<title><dict:lang value="自定义脚本" />
</title>

<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="HotKey" value="1" />
	<jsp:param name="ace" value="1" />
	<jsp:param name="ckeditor" value="0" />
	<jsp:param name="tabIndent" value="0" />
</jsp:include>
</head>

<body>
	<div class="all">
		<form id="saveForm" name="saveForm" action="${path}sys/CsUpdateAction_saveCustomScript.ms" method="post" target="submitFrame">
			<div id="div_head">
				<table class="func_table">
					<%-- <tr>
						<td width="60%"></td>
						<td width="40%" align="right">
							<input type="button" value="<dict:lang value="保存" />" onclick="save(this)"  class="button_view" style="width:auto;align:right" />
							<input type="button" value="<dict:lang value="取消" />" onclick="quit(this)" class="button_view"   style="width:auto;align:right" />
						</td> --%>
					</tr>
				</table>
			</div>

			<div>
				<%-- <input type="text" id = "SCRIPT_NAME" name="paraMap.SCRIPT_NAME" value="<s:property value="paraMap.SCRIPT_NAME" />" /> --%>
				<input type="hidden" id = "SCRIPT_CODE" name="paraMap.SCRIPT_CODE" value="<s:property value="paraMap.SCRIPT_CODE" />" />
				<div id="div_code">
					<pre id="ace_code" name = "paraMap.SCRIPT_CODE" class="ace_editor" style="min-height:400px"></pre>
				</div>
				<div id="div_code_preview"></div>
			</div>
		</form>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0"
			height="0"></iframe>
	</div>

	<script>
		//初始化ace对象
		editor = ace.edit("ace_code");
		//设置风格和语言（更多风格和语言，请到github上相应目录查看）
		theme = "idle_fingers"//clouds
		language = "java"
		editor.setTheme("ace/theme/" + theme);
		editor.session.setMode("ace/mode/" + language);
		//字体大小
		editor.setFontSize(14);
		//设置只读（true时只读，用于展示代码）
		editor.setReadOnly(true);
		//自动换行,设置为off关闭
		editor.setOption("wrap", "off")
		//启用提示菜单
		ace.require("ace/ext/language_tools");
		editor.setOptions({
			enableBasicAutocompletion : true,
			enableSnippets : true,
			enableLiveAutocompletion : true
		});
		var scriptCode = $("#SCRIPT_CODE").val(); 
		editor.setValue(scriptCode);
	</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>