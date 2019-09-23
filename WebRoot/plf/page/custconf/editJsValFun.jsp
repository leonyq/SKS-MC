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

			<form id="editform" name="editform" action="${path}sys/BussModelAction_editForm.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.MID" />
				<s:hidden name="paraMap.ID" />
				<div id="div_code">
					<pre id="ace_code" class="ace_editor"><s:property value="dataMap.PAGE_CODE" escape="true" /></pre>
				</div>
				
							<%--<div id="div_code"><textarea id="funCode" name="paramList[<s:property value="#index.index"/>].VAL_JSFUN" rows="20"
									 wrap="off" style="word-wrap: normal; width: 100%;border: none;"><s:property value="VAL_JSFUN" /></textarea>
							</div>
							
								--%><div class="ptop_10 txac">
							<input type="button" value="<dict:lang value="关闭" />" onclick="closeThis();" class="layui-btn layui-btn-danger">
		</div>
			</form>
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	
   <script>
   var mcWindow = getSrcByIframeName({mcIframeName:'<c:out value='${mcIframeName}' />',type:'window'});
   
   var isControl = '<c:out value='${funcFlag}' />';//是否控件:control
  	
  	if("control"==isControl){
  		mcWindow=mcWindow.frames["mainFrame"];
  	}
   		
      //初始化ace对象
      editor = ace.edit("ace_code");      
      //设置风格和语言（更多风格和语言，请到github上相应目录查看）
      theme = "idle_fingers";
      language = "javascript";
      editor.setTheme("ace/theme/" + theme);
      editor.session.setMode("ace/mode/" + language);      
      //字体大小
      editor.setFontSize(14);      
      //设置只读（true时只读，用于展示代码）
      editor.setReadOnly(false);      
      //自动换行,设置为off关闭
      editor.setOption("wrap", "off");
      //alert(page_code);
      //editor.setValue(mcWindow.getJsFunCode());
      //启用提示菜单
      ace.require("ace/ext/language_tools");
      editor.setOptions({
              enableBasicAutocompletion: true,
              enableSnippets: true,
              enableLiveAutocompletion: true
          });
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

</body>
<%@ include file="/plf/common/pub_end.jsp"%>