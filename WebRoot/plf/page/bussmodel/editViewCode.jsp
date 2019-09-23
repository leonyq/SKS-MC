<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="视图源码" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="HotKey" value="1" />
		<jsp:param name="ace" value="1" />
		<jsp:param name="ckeditor" value="0" />
		<jsp:param name="tabIndent" value="0" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div>
		<div>
			<form id="editForm" name="editForm" action="${path}sys/BussModelAction_editCode.ms" method="post" target="submitFrame">
				<input type="hidden" name="paraMap.ID" value="<s:property value="paraMap.ID" />" />
				<input type="hidden" name="exeid" value="<s:property value="paraMap.ID" />" />
				<input type="hidden" id="paraMap_VIEW_CODE" name="paraMap.VIEW_CODE" />
				<!-- Z20171108 -->
				<input type="hidden" name="paraMap.CREATE_TIME" value="<s:property value="dataMap.CREATE_TIME" />" />
				<input type="hidden" name="paraMap.EDIT_TIME" value="<s:property value="dataMap.EDIT_TIME" />" />
				
				<div id="div_code" style="min-height:400px;">
					<pre id="ace_code" class="ace_editor"><s:property value="dataMap.VIEW_CODE" escape="true" /></pre>
				</div>
				<input type="hidden" id="MS_ID_BASE" name="paraMap.MS_ID_BASE" value="<s:property value="dataMap.MS_ID_BASE" />"/>
				<div class="ptop_10 txac" style="box-shadow:initial;padding-top: 0;padding-bottom: 13px;">
					<input type="button" value="<dict:lang value="预览" />" onclick="runCode();" class="layui-btn layui-btn-normal">
						<input type="reset" value="<dict:lang value="重置" />" onclick="reset();" class="layui-btn layui-btn-primary" />
						<input type="button" id="submitBut" value="<dict:lang value="提交" />" onclick="edit(this);" class="layui-btn">
		    </div>
				
			</form>
			
			
			<div id="div_code_preview">
			</div>
		</div>
	</div>
	
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	
	
	
   <script>
      function initAce(){
    	//初始化ace对象
  		editor = ace.edit("ace_code");      
  		//设置风格和语言（更多风格和语言，请到github上相应目录查看）
  		theme = "idle_fingers"
  		language = "jsp"
  		editor.setTheme("ace/theme/" + theme);
  		editor.session.setMode("ace/mode/" + language);      
  		//字体大小
  		editor.setFontSize(14);      
  		//设置只读（true时只读，用于展示代码）
  		editor.setReadOnly(false);      
  		//自动换行,设置为off关闭
  		editor.setOption("wrap", "off")      
  		//启用提示菜单
  		ace.require("ace/ext/language_tools");
  		editor.setOptions({
  	        enableBasicAutocompletion: true,
  	        enableSnippets: true,
  	        enableLiveAutocompletion: true
  	    });
    	  
      }
      
  </script>
  

	<script type="text/javascript">
	var editorMs = null;
	window.onload = function () {
		/*editorMs = CKEDITOR.replace('code');
			tabIndent.renderAll();*/  // 在IE 下不支持
		util.reloadTabKey($("textarea"));
		
		//初始化ace
		initAce();
	};
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		isSubmit = false;
		window.location.href = "${path}sys/BussModelAction_showViewCode.ms?paraMap.ID=<s:property value="paraMap.ID" />";
	}
	
	var isSubmit = false;
	function edit(thisObj) {
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		$("#paraMap_VIEW_CODE").val(editor.getValue());
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function reset() {
		document.editForm.reset();
	}
	
	function viewCode(thisObj) {
		if("<dict:lang value="源码" />" == thisObj.value){
			$("#div_code_preview").hide();
			$("#div_code").show();
			thisObj.value= "<dict:lang value="预览" />";
		}else{
			$("#div_code").hide();
			$("#div_code_preview").show();
			$("#div_code_preview").html($("#code").val());
			thisObj.value= "<dict:lang value="源码" />";
		}
	}
	
	function runCode() {
		var oldUrl = document.editForm.action;
		var oldTarget = document.editForm.target;
		document.editForm.action = "${path}buss/bussModel_runCode.ms";
		document.editForm.target = "_blank";
		document.editForm.submit();
		document.editForm.action= oldUrl;
		document.editForm.target = oldTarget;
	}

	function init() {
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		
		$("#ace_code").css({height:winWh - divHeadH - 57});
		
		<%-- 设置页面保存的执键 --%>
		setHotKey(83);
		setHotKeyAct(document.getElementById("submitBut"));
	}
	
	<%-- 设置textarea 自适应高度 --%>
	if (window.navigator.userAgent.indexOf("MSIE") > -1) {
			util.setTextAreaWidth("div_code","code");
			util.setTextAreaHeight("code",$("#div_head").height());
			$(window).resize(function () {
				util.setTextAreaWidth("div_code","code");
				util.setTextAreaHeight("code",$("#div_head").height());
		});
	} else {
		$("#code").css({width:"100%"});
	}

</script>


</body>
<%@ include file="/plf/common/pub_end.jsp"%>