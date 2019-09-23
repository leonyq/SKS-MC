<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="公用页面" /><dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
		  <table class="func_table">
	    	<tr>
	      <td width="100%" align="right">
					<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="botton_img_add">
	      </td>
	      </tr>
			</table>
			<form id="editForm" name="editForm" action="${path}sys/MClzMgrAction_editCommPage.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.ID" />
				<table class="add_table">
					<tr>
						<td colspan="6">
							<span class="Point"><span class="Eng">*</span><dict:lang value="为必填项" />
							</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="tr1">
							<dict:lang value="页面名称" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:textfield name="paraMap.PAGE_NAME" value="%{dataMap.PAGE_NAME}" id="paraMap_PAGE_NAME" maxlength="60" />
						</td>
						<td width="20%" class="tr1">
							<dict:lang value="页面源码" />
						</td>
						<td > 
						</td>
					</tr>
					<tr>
						<td colspan="4" >
							<textarea id="code" name="paraMap.PAGE_CODE" class="tabIndent" wrap="off" style="word-wrap: normal; width: 100%;" rows="20"><s:property value="dataMap.PAGE_CODE" escape="true" /></textarea>
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

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
		document.forms.editForm.submit();
		isSubmit = true;
	}
	
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var tableName = "<s:property value="%{@com.more.fw.core.sysmain.model.TableName@MS_COMM_CLASS}"/>";
		var url = "${path}sys/BussModelAction_cfgClsCode.ms?paraMap.CODE_ID="+codeId+"&paraMap.OWNER_ID="+OWNER_ID
				+"&paraMap.OWNER_TYPE="+OWNER_TYPE+"&paraMap.CLASS_NAME_TEXT_ID="+CLASS_NAME_TEXT_ID+"&paraMap.tableName="
				+tableName+"&paraMap.colName="+colName;
		showPopWin(url, "100%", "100%",null,"<dict:lang value="修改类源码"/>");
		//window.open(url);
	}
	
	function updateCLASS_NAME_TEXT(id,txt){
		$("#"+id).val(txt);
		closePopWin();
		window.location.href = "${path}sys/MClzMgrAction_showEditCommClass.ms?paraMap.ID=<s:property value='paraMap.ID' />";
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
		
		reloadTabKey();
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

</script>


</body>
<%@ include file="/plf/common/pub_end.jsp"%>