<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="公用页面" /><dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="ace" value="1" />
		<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
			<div  class="add_table_div">
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
							
							<input type="text" lay-verify="required" name="paraMap.PAGE_NAME" value="<s:property value="dataMap.PAGE_NAME" />" id="paraMap_PAGE_NAME"  onkeyup="util.replaceLikeVal(this)" maxlength="60"/>
							
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
							<pre id="ace_code" class="ace_editor"></pre>
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
			</div>
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<script>
		//初始化ace对象
		editor = ace.edit("ace_code");
		//设置风格和语言（更多风格和语言，请到github上相应目录查看）
		theme = "idle_fingers";//clouds
		language = "java";
		editor.setTheme("ace/theme/" + theme);
		editor.session.setMode("ace/mode/" + language);
		//字体大小
		editor.setFontSize(14);
		//设置只读（true时只读，用于展示代码）
		editor.setReadOnly(false);
		//自动换行,设置为off关闭
		editor.setOption("wrap", "off");
		//启用提示菜单
		ace.require("ace/ext/language_tools");
		editor.setOptions({
			enableBasicAutocompletion : true,
			enableSnippets : true,
			enableLiveAutocompletion : true
		});
	</script>
	<script type="text/javascript">
	
	var isSubmit = false;
	function reloadPg(msg){
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return ;
		}
		$("#code").val(editor.getValue());
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var tableName = "<s:property value="%{@com.more.fw.core.sysmain.model.TableName@MS_COMM_CLASS}"/>";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName;
		showPopWin(url, "100%", "100%",null,"<dict:lang value="类源码"/> <dict:lang value="修改"/>");
		//window.open(url);
	}
	
	function updateCLASS_NAME_TEXT(id,txt){
		$("#"+id).val(txt);
		closePopWin();
		window.location.href = "${path}sys/UserCustomAction_showEditCommClass.ms?paraMap.ID=<s:property value='paraMap.ID' />";
	}
        
	function valData(){
		var paraMap_PAGE_NAME = document.getElementById("paraMap_PAGE_NAME");
	   	if(val.isBlank(paraMap_PAGE_NAME)){
	   		_alertValMsg(paraMap_PAGE_NAME,"<dict:lang value="页面名称" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
    
		return true;
	}
	
	function init(){
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
	
	$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;
	    	  
	    	  form.on('submit(filterSubmit)', function (data) {
	    	  		util.alert("<dict:lang value="数据正在提交，请稍候" />...");
	    	  		document.getElementById("curIframeName").value=window.frameElement.name;
			       $("#code").val(editor.getValue());
			       return true;
			  }) 
           
	    });
		
		var ace_editor_height = $(window).height()-155;
		$("#ace_code").css("height",ace_editor_height+'px');
	    
	    
	})

</script>


</body>
<%@ include file="/plf/common/pub_end.jsp"%>