<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="有效性验证JS方法" /> <dict:lang value="修改" /></title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="ace" value="1" />
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<style>
		.all{
			margin-top:0px;
		}
		
		</style>
		
		<!-- codeMirror 必须引入的 -->
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/lib/codemirror.css">
		<script src="${path}plf/js/debug/codeMirror/lib/codemirror.js"></script>
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/theme/darcula.css">
		
		<!-- codeMirror javascript 风格 -->
		<script src="${path}plf/js/debug/codeMirror/mode/javascript/javascript.js"></script>
		
		
		<!--支持代码折叠-->
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/addon/fold/foldgutter.css"/>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/foldcode.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/foldgutter.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/brace-fold.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/comment-fold.js"></script>
		
		<!--括号匹配-->
		<script src="${path}plf/js/debug/codeMirror/addon/edit/matchbrackets.js"></script>
		
		<!--启用提示菜单-->
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/addon/hint/show-hint.css">
		<script src="${path}plf/js/debug/codeMirror/addon/hint/show-hint.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/hint/anyword-hint.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/hint/javascript-hint.js"></script>
		
		<!--
		<script src="${path}plf/js/debug/codeMirror/addon/hint/css-hint.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/hint/html-hint.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/hint/javascript-hint.js"></script>
		-->
		
		
		<script src="${path}plf/js/debug/codeMirror/mode/css/css.js"></script>
		<script src="${path}plf/js/debug/codeMirror/mode/xml/xml.js"></script>
		<script src="${path}plf/js/debug/codeMirror/mode/htmlmixed/htmlmixed.js"></script>
		
		<!--括号的自动补全-->
		<script src="${path}plf/js/debug/codeMirror/addon/edit/closebrackets.js"></script>
		
		<!--针对html和xml的标签的自动闭合-->
		<script src="${path}plf/js/debug/codeMirror/addon/edit/closetag.js"></script>
		
		<!-- 代码折叠 -->
		<script src="${path}plf/js/debug/codeMirror/addon/fold/brace-fold.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/xml-fold.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/comment-fold.js"></script>
		
		<!-- 点击某个单词-匹配-全局高亮 -->
		<script src="${path}plf/js/debug/codeMirror/addon/scroll/annotatescrollbar.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/matchesonscrollbar.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/searchcursor.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/match-highlighter.js"></script>
		
		<!-- 匹配标签：点击选中标签的一半，另一半也会高亮-->
		<script src="${path}plf/js/debug/codeMirror/addon/edit/matchtags.js"></script>
		
		<!--ctrl+f查找-->
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/addon/search/matchesonscrollbar.css">
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/addon/dialog/dialog.css">
		<script src="${path}plf/js/debug/codeMirror/addon/search/search.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/searchcursor.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/jump-to-line.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/matchesonscrollbar.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/scroll/annotatescrollbar.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/dialog/dialog.js"></script>
		
		<style>
		<!-- codeMirror 字体大小 -->
		.CodeMirror{
		  font-size:14px;
		}
		
		.CodeMirror-search-field {
	      height: auto!important;
	        border: none!important;
	        outline: none;
	        background: transparent!important;
	        width: 20em!important;
	        color: inherit;
	        font-family: monospace;
	    }
    
		</style>
		
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<!-- <div id="div_head">
			<table class="search_table">
				<tr>
					<td width="100%" align="right">
						
					</td>
				</tr>
			</table>
		</div> -->
			 <s:if test="paraMap.toFlag=='view'">
			 	<!-- 视图模型  修改    视图源码 -->
               	<form id="editForm" name="editForm" action="${path}sys/BussModelAction_editCode.ms" method="post" target="submitFrame">
					<input type="hidden" name="paraMap.ID" value="<s:property value="paraMap.ID" />" />
					<input type="hidden" name="exeid" value="<s:property value="paraMap.ID" />" />
					<input type="hidden" id="paraMap_VIEW_CODE" name="paraMap.VIEW_CODE" />
					<!-- Z20171108 -->
					<input type="hidden" name="paraMap.CREATE_TIME" value="<s:property value="dataMap.CREATE_TIME" />" />
					<input type="hidden" name="paraMap.EDIT_TIME" value="<s:property value="dataMap.EDIT_TIME" />" />
					
					<div id="div_code" style="min-height:400px;">
						<!--  
						<pre id="ace_code" class="ace_editor"><s:property value="dataMap.VIEW_CODE" escape="true" /></pre>
						-->
						<textarea id="ace_code" name="ace_code" ><s:property value="dataMap.VIEW_CODE" escape="true" /></textarea>
					</div>
					<input type="hidden" id="MS_ID_BASE" name="paraMap.MS_ID_BASE" value="<s:property value="dataMap.MS_ID_BASE" />"/>
					<div class="ptop_10 txac" style="box-shadow:initial;padding-top: 0;padding-bottom: 13px;">
						<input type="button" value="<dict:lang value="预览" />" onclick="runCode();" class="layui-btn layui-btn-normal">
							<input type="reset" value="<dict:lang value="重置" />" onclick="reset_view();" class="layui-btn layui-btn-primary" />
							<input type="button" id="submitBut" value="<dict:lang value="提交" />" onclick="edit_view(this);" class="layui-btn">
			    </div>
					
				</form>
				<div id="div_code_preview">
				</div>
			
             </s:if>
             
             <s:elseif test="paraMap.toFlag=='commpage'">
            	<!-- 公用页面           修改 -->
	            <form class="layui-form" id="editForm" name="editForm" action="${path}sys/UserCustomAction_editCommPage.ms" method="post" target="submitFrame">
					<input type="hidden" name="mcIframeName" value="${mcIframeName}">
					 <input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
					  <s:hidden id="paraMap_treeTid" name="treeTid" value="%{paraMap.treeTid}"/>
					<s:hidden name="paraMap.ID" />
					<table class="add_table">
					    <!--  
						<tr>
							<td colspan="6">
								<span class="Point"><span class="Eng">*</span><dict:lang value="为必填项" />
								</span>
							</td>
						</tr>
						-->
						
						<tr>
							<td style="width: 62px;">
								<span class="Eng">*</span><dict:lang value="页面名称" />
							</td>
							<td class="widget">
								<!--  
								<s:textfield name="paraMap.PAGE_NAME" value="%{dataMap.PAGE_NAME}" id="paraMap_PAGE_NAME" 
								
								onkeyup="javascript:util.replaceLikeVal(this)"
								
								maxlength="60" />
								-->
								
								<input type="text" lay-verify="required" name="paraMap.PAGE_NAME" value="<s:property value="dataMap.PAGE_NAME" />" id="paraMap_PAGE_NAME"  onkeyup="javascript:util.replaceLikeVal(this)" maxlength="60"/>
								
							</td>
							
							<td>&nbsp;</td>
							
							<td style="width: 62px;">
								<dict:lang value="页面源码" />
							</td>
							<td > 
							</td>
						</tr>
						<tr>
							<td colspan="5" >
								<!--  
								<pre id="ace_code" class="ace_editor"></pre>
								-->
								<textarea id="ace_code" name="ace_code" ></textarea>
								
								<textarea id="code" hidden="true" name="paraMap.PAGE_CODE" class="tabIndent" wrap="off" style="word-wrap: normal; width: 100%;" rows="20"><s:property value="dataMap.PAGE_CODE" escape="true" /></textarea>
							</td>
						</tr>
					</table>
					<input type="hidden" id="MS_ID_BASE" name="paraMap.MS_ID_BASE" value="<s:property value="dataMap.MS_ID_BASE" />"/>
					
					<div class="ptop_10 txac">
						<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit" style="margin:2px 2px 2px 2px;">提交</button>
						<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
								
					</div>
					
				</form>
            	
        	 </s:elseif>
        	 
        	 <s:elseif test="paraMap.toFlag=='custconfig'">
            	<!-- 客户定制化  定制页面模板 -->
	            <form class="layui-form" id="editForm" name="editForm" action="" method="post" target="submitFrame">
					<input type="hidden" name="mcIframeName" value="${mcIframeName}">
					 <input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
					  <s:hidden id="paraMap_treeTid" name="treeTid" value="%{paraMap.treeTid}"/>
					<s:hidden name="paraMap.ID" />
					<table class="add_table">
					    <!--  
						<tr>
							<td colspan="6">
								<span class="Point"><span class="Eng">*</span><dict:lang value="为必填项" />
								</span>
							</td>
						</tr>
						-->
						
						<tr>
							<td colspan="5" >
								<!--  
								<pre id="ace_code" class="ace_editor"></pre>
								-->
								<textarea id="ace_code" name="ace_code" ></textarea>
								
								<textarea id="code" hidden="true" name="paraMap.PAGE_CODE" class="tabIndent" wrap="off" style="word-wrap: normal; width: 100%;" rows="20"><s:property value="dataMap.PAGE_CODE" escape="true" /></textarea>
							</td>
						</tr>
					</table>
					<input type="hidden" id="MS_ID_BASE" name="paraMap.MS_ID_BASE" value="<s:property value="dataMap.MS_ID_BASE" />"/>
					
					<div class="ptop_10 txac">
						<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
								
					</div>
					
				</form>
            	
        	 </s:elseif>
             
             <s:else>
             	<!-- 表单模型 控件 js函数 -->
             	<form id="editform" name="editform" action="${path}sys/BussModelAction_editForm.ms" method="post" target="submitFrame">
					<s:hidden name="paraMap.MID" />
					<s:hidden name="paraMap.ID" />
					<div id="div_code">
						<!-- 
						<pre id="ace_code" class="ace_editor"><s:property value="VAL_JSFUN" escape="true" /></pre>
						 -->
						<textarea id="ace_code" name="ace_code" ><s:property value="VAL_JSFUN" escape="true" /></textarea>
						
					</div>
					
								<%--<div id="div_code"><textarea id="funCode" name="paramList[<s:property value="#index.index"/>].VAL_JSFUN" rows="20"
										 wrap="off" style="word-wrap: normal; width: 100%;border: none;"><s:property value="VAL_JSFUN" /></textarea>
								</div>
								
									--%>
									
					<div class="ptop_10 txac">
						<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="layui-btn">
						<input type="button" value="<dict:lang value="关闭" />" onclick="closeThis();" class="layui-btn layui-btn-danger">
					</div>
					
				</form>
			
             </s:else>
              
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	
	<%-- 表单模型 控件 js函数--%>
   <script>
   var mcWindow = getSrcByIframeName({mcIframeName:'<c:out value='${mcIframeName}' />',type:'window'});
   
   var isControl = '<c:out value='${funcFlag}' />';//是否控件:control
  	
  	if("control"==isControl){
  		mcWindow=mcWindow.frames["mainFrame"];
  	}
  	
  	var toFlag = '<c:out value='${paraMap.toFlag}' />';
   		
      //初始化ace对象
      /*
      editor = ace.edit("ace_code");      
      //设置风格和语言（更多风格和语言，请到github上相应目录查看）
      theme = "idle_fingers";
      
      language = "javascript";
      var toFlag = '<c:out value='${paraMap.toFlag}' />';
      if(toFlag=='view'){
    	  language = "jsp";
      }
      
      editor.setTheme("ace/theme/" + theme);
      editor.session.setMode("ace/mode/" + language);      
      //字体大小
      editor.setFontSize(14);      
      //设置只读（true时只读，用于展示代码）
      editor.setReadOnly(false);      
      //自动换行,设置为off关闭
      editor.setOption("wrap", "off");
      
      if(toFlag!='view' && toFlag!='commpage'){
    	  editor.setValue(mcWindow.getJsFunCode());
      }
      //启用提示菜单
      ace.require("ace/ext/language_tools");
      editor.setOptions({
              enableBasicAutocompletion: true,
              enableSnippets: true,
              enableLiveAutocompletion: true
      });
      */
      
      var mixedMode = {
        name: "htmlmixed"
      };//jsp
      if(toFlag!='view' && toFlag!='commpage' && toFlag!='custconfig'){
    	  mixedMode = {
	        name: "javascript"
	      };//js
      }
       
      
       //初始化编辑器CodeMirror
       editor = CodeMirror.fromTextArea(document.getElementById("ace_code"), {
        mode: mixedMode,
	    lineNumbers: true,	//显示行号
		theme: "darcula",	//设置主题
		lineWrapping: false,	//自动换行
		foldGutter: true,
		gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"],
		matchBrackets: true,	//括号匹配
		//readOnly: true,        //只读
		
		autoCloseBrackets:true,//-括号的自动补全
		autoCloseTags:true,//针对html和xml的标签的自动闭合
		
		highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},//点击某个单词-匹配-全局高亮
		
		matchTags: {bothTags: true},//匹配标签：点击选中标签的一半，另一半也会高亮
		
		//extraKeys: {"Ctrl": "autocomplete"}//启用提示菜单 按下Ctrl启用提示
		extraKeys: {"Alt-F": "findPersistent","Ctrl": "autocomplete"}

       });
  		
  	   //设置CodeMirror高度
  	   var divHeadH= $("#div_head").height();
	   var docWh= $(document).height();
	   var winWh = $(window).height();		
	   var set_height=winWh-divHeadH-80;
       if(toFlag=='commpage'){
    	  set_height=winWh-divHeadH-150;
       }
       if(toFlag=='custconfig'){
    	  set_height=winWh-divHeadH-100;
       }
	   editor.setSize('auto', set_height+'px');
	   
	   if(toFlag=='commpage' || toFlag=='custconfig'){
	   		var winWh = $(window).width()-55;
	   		editor.setSize(winWh+'px', set_height+'px');
	   }
		
	   //设置初始化值
       if(toFlag!='view' && toFlag!='commpage' && toFlag!='custconfig'){
    	  editor.setValue(mcWindow.getJsFunCode());
       }
       
       //启用提示菜单
      
  </script>
  

	<script type="text/javascript">
	var editorMs = null;
	window.onload = function () {
		/*editorMs = CKEDITOR.replace('code');
			tabIndent.renderAll();*/  // 在IE 下不支持
		util.reloadTabKey($("textarea"));
	};
	
	function edit(thisObj){
		
		 mcWindow.setJsFunCode(editor.getValue());
		closeThis(mcWindow);
	}
	
	function reset() {
		var mcWindow = getSrcByIframeName({mcIframeName:'<c:out value='${mcIframeName}' />',type:'window'});
		//document.getElementById("funCode").value = mcWindow.getJsFunCode();
		
		editor.setValue( mcWindow.getJsFunCode());
		//document.getElementById("funCode").focus();
	}
	
	function closeThis(mcWindow){
		closePopWin();
		//mcWindow.setJsFunObjFoucue();
	}
	
	
	function init() {
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#ace_code").css({height:winWh - divHeadH - 81});
		
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
	
	<%-- 设置textarea 自适应宽度 --%>
	function setTextAreaWidth() {
		var tdWh = $("#div_code").width();
		var docWh = $(document).width();
		var winWh = $(window).width();
		if (docWh > (winWh + 21)) {
			$("#funCode").css({width:tdWh - (docWh - winWh + 7)});
		} else {
			$("#funCode").css({width:tdWh - 2});
		}
	}
	<%-- 设置textarea 自适应高度 --%>
	function setTextAreaHeight(){
		var divHeadH= $("#div_head").height();
		var docWh= $(document).height();
		var winWh = $(window).height();
		$("#funCode").css({height:winWh-divHeadH-21});
	}

</script>


<%-- 视图源码--%>
<script type="text/javascript">
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		isSubmit = false;
		window.location.href = "${path}sys/BussModelAction_showViewCode.ms?paraMap.toFlag=view&paraMap.ID=<s:property value="paraMap.ID" />";
	}
	
	var isSubmit = false;
	function edit_view(thisObj) {
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		$("#paraMap_VIEW_CODE").val(editor.getValue());
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function reset_view() {
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

</script>

<%-- 公用页面           修改 --%>
<script type="text/javascript">
function edit_commpage(thisObj){
	if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
	if(!valData()){
		return ;
	}
	$("#code").val(editor.getValue());
	document.forms.editForm.submit();
	isSubmit = true;
}

function updateCLASS_NAME_TEXT(id,txt){
	$("#"+id).val(txt);
	closePopWin();
	window.location.href = "${path}sys/UserCustomAction_showEditCommClass.ms?paraMap.toFlag=commpage&paraMap.ID=<s:property value='paraMap.ID' />";
}
    
function valData(){
	var paraMap_PAGE_NAME = document.getElementById("paraMap_PAGE_NAME");
   	if(val.isBlank(paraMap_PAGE_NAME)){
   		_alertValMsg(paraMap_PAGE_NAME,"<dict:lang value="页面名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}

	return true;
}

function init_commpage(){
    if($("#code").val()!=""){
    	editor.setValue($("#code").val());
    }
	reloadTabKey();
	
	var divHeadH = $("#div_head").height();
	var docWh = $(document).height();
	var winWh = $(window).height();
	$("#ace_code").css({height:winWh - 53 - 72});
}


<%
/***********************以下为编辑器优化设置*****************************/
/*
//截获了Tab按键，其他的textarea框不进行此配置
    //下面的代码就是为了实现这个功能，原理很简单，采用上一行的缩进就行
    //只要在html中插入脚本调用reloadTabKey()函数就可以了
    //注1：需要jQuery支持，如果不喜欢jQuery改成javascript也很方便的
    //兼容firefox和IE！
*/
%>
    /*------selection operations-------*/
function insertAtCursor(obj, txt) {
	obj.focus();
            //IE support
	if (document.selection) {
		sel = document.selection.createRange();
		sel.text = txt;
	} else {
		var startPos = obj.selectionStart;
		var scrollTop = obj.scrollTop;
		var endPos = obj.selectionEnd;
		obj.value = obj.value.substring(0, startPos) + txt + obj.value.substring(endPos, obj.value.length);
		startPos += txt.length;
		obj.setSelectionRange(startPos, startPos);
		obj.scrollTop = scrollTop;
	}
}
function getCaretPos(ctrl) {
	var caretPos = 0;
	if (document.selection) {
                // IE Support
		var range = document.selection.createRange();
                // We'll use this as a 'dummy'
		var stored_range = range.duplicate();
                // Select all text
		stored_range.moveToElementText(ctrl);
                // Now move 'dummy' end point to end point of original range
		stored_range.setEndPoint("EndToEnd", range);
                // Now we can calculate start and end points
		ctrl.selectionStart = stored_range.text.length - range.text.length;
		ctrl.selectionEnd = ctrl.selectionStart + range.text.length;
		caretPos = ctrl.selectionStart;
	} else {
		if (ctrl.selectionStart || ctrl.selectionStart == "0") {
            // Firefox support
		}
	}
	caretPos = ctrl.selectionStart;
	return (caretPos);
}
function getCurrentLineBlanks(obj) {
	var pos = getCaretPos(obj);
	var str = obj.value;
	var i = pos - 1;
	while (i >= 0) {
		if (str.charAt(i) == "\n") {
			break;
		}
		i--;
	}
	i++;
	var blanks = "";
	while (i < str.length) {
		var c = str.charAt(i);
		if (c == " " || c == "\t") {
			blanks += c;
		} else {
			break;
		}
		i++;
	}
	return blanks;
}
function reloadTabKey() {
	/* set all the tab indent for all the text areas */
	$("textarea").each(function () {
		$(this).keydown(function (eve) {
			if (eve.target != this) {
				return;
			}
			if (eve.keyCode == 13) {
				last_blanks = getCurrentLineBlanks(this);
			} else {
				if (eve.keyCode == 9) {
					eve.preventDefault();
					insertAtCursor(this, "\t");
					this.returnValue = false;
				}
			}
		}).keyup(function (eve) {
			if (eve.target == this && eve.keyCode == 13) {
				insertAtCursor(this, last_blanks);
			}
		});
	});
}

if(toFlag=='commpage' || toFlag=='custconfig'){
	$(function(){
		init_commpage();
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
	    	  form.on('submit(filterSubmit)', function (data) {
	    	  		//util.alert("<dict:lang value="数据正在提交，请稍候" />...");
	    	  		document.getElementById("curIframeName").value=window.frameElement.name;
			       $("#code").val(editor.getValue());
			       return true;
			  }) 
	       
	    });
		
		var ace_editor_height = $(window).height()-155;
		$("#ace_code").css("height",ace_editor_height+'px');
	    
	    
	})
	
}


</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>