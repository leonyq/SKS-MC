<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="代码块验证" /> <dict:lang value="修改" /></title>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="ace" value="1" />
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		
		<!-- codeMirror 必须引入的 -->
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/lib/codemirror.css">
		<script src="${path}plf/js/debug/codeMirror/lib/codemirror.js"></script>
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/theme/darcula.css">
		
		<!-- codeMirror sql 风格 -->
		<script src="${path}plf/js/debug/codeMirror/mode/sql/sql.js"></script>
		
		<!--支持代码折叠-->
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/addon/fold/foldgutter.css"/>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/foldcode.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/foldgutter.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/brace-fold.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/fold/comment-fold.js"></script>
		
		<!--括号匹配-->
		<script src="${path}plf/js/debug/codeMirror/addon/edit/matchbrackets.js"></script>
		
		<!--自动补全-->
		<link rel="stylesheet" href="${path}plf/js/debug/codeMirror/addon/hint/show-hint.css">
		<script src="${path}plf/js/debug/codeMirror/addon/hint/show-hint.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/hint/anyword-hint.js"></script>
		
		<!--启用提示菜单-->
		<link type="text/css" rel="stylesheet" href="${path}plf/js/debug/codeMirror/addon/hint/show-hint.css" />
    	<script type="text/javascript" src="${path}plf/js/debug/codeMirror/addon/hint/show-hint.js"></script>
    	<script type="text/javascript" src="${path}plf/js/debug/codeMirror/addon/hint/sql-hint.js"></script>
		
		<!--括号的自动补全-->
		<script src="${path}plf/js/debug/codeMirror/addon/edit/closebrackets.js"></script>
		
		<!-- 点击某个单词-匹配-全局高亮 -->
		<script src="${path}plf/js/debug/codeMirror/addon/scroll/annotatescrollbar.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/matchesonscrollbar.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/searchcursor.js"></script>
		<script src="${path}plf/js/debug/codeMirror/addon/search/match-highlighter.js"></script>
		
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
		</style>
		
</head>
<body >
	<div class="all layui-form">
		<div class="add_table_div" >
		<div id="div_head">
			<table class="add_table">
					<tr>
						<td style="width:50px;">
							<dict:lang value="数据源" />
						</td>
						<td colspan="3" class="widget" style="width:450px;">
						
							<label
		                    for="codeType_0" class="cursor_hand"><input
		                      type="radio" id="codeType_0" name="paraMap.codeType"
		                      value="CODE_BASE" onclick="loadClsCode(this.value)"  title="BASE"/></label>
		                      
		                    <label for="codeType_1" class="cursor_hand"><input
		                      type="radio" id="codeType_1" name="paraMap.codeType"
		                      value="CODE_ORACLE" onclick="loadClsCode(this.value)"  title="ORACLE"/></label>
		                      
		                    <label for="codeType_2" class="cursor_hand"><input
		                      type="radio" id="codeType_2" name="paraMap.codeType"
		                      value="CODE_SQLSERVER" onclick="loadClsCode(this.value)"  title="SQLSERVER"/></label>
		                      
		                    <label for="codeType_3" class="cursor_hand"><input
		                      type="radio" id="codeType_3" name="paraMap.codeType"
		                      value="CODE_MYSQL" onclick="loadClsCode(this.value)"  title="MYSQL"/></label>
		                      
		                      <label for="codeType_4" class="cursor_hand"><input
		                      type="radio" id="codeType_4" name="paraMap.codeType"
		                      value="CODE_PG" onclick="loadClsCode(this.value)"  title="PG"/></label>
                      
						</td>
						


					</tr> 
					
				</table>
				</div>
				</br>

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
							
								--%><div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="layui-btn">
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
   var mcWindow = getSrcByIframeName({mcIframeName:'<c:out value='${mcIframeName}' />',type:'window'}).frames["mainFrame"];
   
   var isControl = '<c:out value='${funcFlag}' />';//是否控件:control
  	
  	var languageType = '<c:out value='${languageType}' />';//语言
 	
  	var dbType = '<c:out value='${dbType}' />';//数据来源
   		
      //初始化ace对象
      /*
      editor = ace.edit("ace_code");      
      //设置风格和语言（更多风格和语言，请到github上相应目录查看）
      theme = "idle_fingers";
      language = "sql";
      editor.setTheme("ace/theme/" + theme);
      editor.session.setMode("ace/mode/" + language);      
      //字体大小
      editor.setFontSize(14);      
      //设置只读（true时只读，用于展示代码）
      editor.setReadOnly(false);      
      //自动换行,设置为off关闭
      editor.setOption("wrap", "off");
      editor.setValue(mcWindow.getJsFunCode());
      //启用提示菜单
      ace.require("ace/ext/language_tools");
      editor.setOptions({
              enableBasicAutocompletion: true,
              enableSnippets: true,
              enableLiveAutocompletion: true
      });
      */
       
       //初始化编辑器CodeMirror
       editor = CodeMirror.fromTextArea(document.getElementById("ace_code"), {
	    lineNumbers: true,	//显示行号
		theme: "darcula",	//设置主题
		lineWrapping: false,	//自动换行
		foldGutter: true,
		gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"],
		matchBrackets: true,	//括号匹配
		//readOnly: true,        //只读
		
		autoCloseBrackets:true,//-括号的自动补全
		highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},//点击某个单词-匹配-全局高亮
		
		//extraKeys: {"Ctrl": "autocomplete"}//启用提示菜单 按下Ctrl启用提示
		extraKeys: {"Alt-F": "findPersistent","Ctrl": "autocomplete"}

       });
       
       //启用提示菜单
       //editor.on('keyup', function() {
       //     editor.showHint(); //满足自动触发自动联想功能
       //});
  		
  	   //设置CodeMirror高度
  	   var divHeadH= $("#div_head").height();
	   var docWh= $(document).height();
	   var winWh = $(window).height();		
	   var set_height=winWh-divHeadH-120;
	   editor.setSize('auto', set_height+'px');
		
	   //设置初始化值
       editor.setValue(mcWindow.getJsFunCode());
           	
  </script>
  

	<script type="text/javascript">
	layui.use('form', function(){
	    	  var form = layui.form;
	    });
	    
	    function loadClsCode(val){
			/* if("CODE_BASE" == val){
				mcWindow.getSqlFunCode(val);
			}else if("CODE_ORACLE" == val){
			
			}else if("CODE_SQLSERVER" == val){
			
			}else if("CODE_MYSQL" == val){
			
			}else if("CODE_PG" == val ){
			
			} */
			var sqlCode = mcWindow.getSqlFunCode(val);	    
	    	editor.setValue(sqlCode);
	    }
	    
	var editorMs = null;
	window.onload = function () {
		/*editorMs = CKEDITOR.replace('code');
			tabIndent.renderAll();*/  // 在IE 下不支持
		util.reloadTabKey($("textarea"));
	};
	
	function edit(thisObj){
		
		var val = $("input[type=radio]:checked").val();
		
		if("CODE_BASE" == val){
				mcWindow.setSqlFunCode("comm_sql",editor.getValue(),val);
			}else if("CODE_ORACLE" == val){
				mcWindow.setSqlFunCode("oracle_sql",editor.getValue(),val);
			}else if("CODE_SQLSERVER" == val){
				mcWindow.setSqlFunCode("sqlserver_sql",editor.getValue(),val);
			}else if("CODE_MYSQL" == val){
				mcWindow.setSqlFunCode("mysql_sql",editor.getValue(),val);
			}else if("CODE_PG" == val ){
				mcWindow.setSqlFunCode("pg_sql",editor.getValue(),val);
			}
	
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
	$(function(){
	if("comm" ==dbType){
			setValCode("CODE_BASE");
		}else if("oracle"==dbType){
		setValCode("CODE_ORACLE");
		}else if("sqlserver"==dbType){
		setValCode("CODE_SQLSERVER");
		}else if("mysql" ==dbType){
		setValCode("CODE_MYSQL");
		}else if("pg" ==dbType){
		setValCode("CODE_PG");
		}
	});
	function setValCode(type){
		
		$("input[type=radio][value=" + type + "]").attr("checked",
					'checked');
					editor.setValue(mcWindow.getSqlFunCode(type));
	}
	function init() {
		var divHeadH = $("#div_head").height();
		var docWh = $(document).height();
		var winWh = $(window).height();
		$("#ace_code").css({height:winWh - divHeadH - 106});
		
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