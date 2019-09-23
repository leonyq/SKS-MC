<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><s:property value="%{getText('viewCode.title')}"/></title>
	<jsp:include page="/plf/common/pub_head.jsp" >
			<jsp:param name="ckeditor" value="0" />
			<jsp:param name="tabIndent" value="0" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	</head>
<body>
<div class="all">
	<div>
	<form id="editform" name="editform" action="${path}sys/BussModelAction_editCode.ms?paraMap.ID=<s:property value="paraMap.ID"/>" method="post">
	<div id="div_code">
		<textarea id="code" name="paraMap.code" class="tabIndent" rows="22" wrap="off" style="word-wrap:normal;width:50px;overflow:scroll"><s:property value="dataMap.code" escape="false"/></textarea>
	</div>
     </form>
	<div id="div_code_preview">
	</div>
	   <div id="div_head" class="ptop_10 txac">
			<input type="button" value="预览" onclick="viewCode(this);" class="layui-btn">
			&nbsp;&nbsp;
			<input type="reset" value="重 置"class="botton_img_search" />
			&nbsp;&nbsp;
			<input type="button" value="运行" onclick="runCode();" class="layui-btn">
			&nbsp;&nbsp;
			<input type="button" value="提 交" onclick="edit(this);" class="layui-btn	">
		</div>
   </div>
</div>

<script type="text/javascript">

	var editor = null;
	window.onload = function(){
		/*editor = CKEDITOR.replace('code');
		tabIndent.renderAll();*/  // 在IE 下不支持
		reloadTabKey();
	}

	function edit(thisObj){
		document.forms.editform.submit();
		thisObj.onclick = function(){util.alert("数据正在提交，请稍候...");}<%-- 防止重复提交 --%>
	}
    
	function viewCode(thisObj){
		if("源码" == thisObj.value){
			$("#div_code_preview").hide();
			$("#div_code").show();
			thisObj.value= "预览";
		}else{
			$("#div_code").hide();
			$("#div_code_preview").show();
			$("#div_code_preview").html($("#code").val());
			thisObj.value= "源码";
		}
	}
	
	function runCode(){
		var url = "${path}sys/BussModelAction_runCode.ms?paraMap.ID=<s:property value="paraMap.ID"/>";
		window.open(url);
	}
    
	<%-- 设置textarea 自适应宽度 --%>
	function setTextAreaWidth(){
		var tdWh= $("#div_code").width();
		var docWh= $(document).width();
		var winWh = $(window).width();
		if(docWh > (winWh+21)){
			$("#code").css({width:tdWh-(docWh-winWh+7)});
		}else{
			$("#code").css({width:tdWh-2});
		}
	}
	<%-- 设置textarea 自适应高度 --%>
	function setTextAreaHeight(){
		var divHeadH= $("#div_head").height();
		var docWh= $(document).height();
		var winWh = $(window).height();
		$("#code").css({height:winWh-divHeadH-21});
	}
	
	if(window.navigator.userAgent.indexOf("MSIE") > -1 ){
		setTextAreaWidth();
		$(window).resize(function(){
		  	setTextAreaWidth();
		  	setTextAreaHeight();
		});
	}else{
		$("#code").css({width:"100%"});
	}
		setTextAreaHeight();

</script>

<script type="text/javascript">
/*
//截获了Tab按键，其他的textarea框不进行此配置
        //下面的代码就是为了实现这个功能，原理很简单，采用上一行的缩进就行
        //只要在html中插入脚本调用reloadTabKey()函数就可以了
        //注1：需要jQuery支持，如果不喜欢jQuery改成裸javascript也很方便的
        //兼容firefox和IE！
*/
        /*------selection operations-------*/
        function insertAtCursor(obj, txt) {
            obj.focus();
            //IE support
            if (document.selection) {
                sel = document.selection.createRange();
                sel.text = txt;
            }
            //MOZILLA/NETSCAPE support
            else {
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
                stored_range.setEndPoint('EndToEnd', range);
                // Now we can calculate start and end points
                ctrl.selectionStart = stored_range.text.length - range.text.length;
                ctrl.selectionEnd = ctrl.selectionStart + range.text.length;
                caretPos = ctrl.selectionStart;
            } else if (ctrl.selectionStart || ctrl.selectionStart == '0')
            // Firefox support
                caretPos = ctrl.selectionStart;
            return (caretPos);
        }

        function getCurrentLineBlanks(obj) {
            var pos = getCaretPos(obj);
            var str = obj.value;
            var i = pos - 1;
            while (i >= 0) {
                if (str.charAt(i) == '\n')
                    break;
                i--;
            }
            i++;
            var blanks = "";
            while (i < str.length) {
                var c = str.charAt(i);
                if (c == ' ' || c == '\t')
                    blanks += c;
                else
                    break;
                i++;
            }
            return blanks;
        }

        function reloadTabKey() {
            /* set all the tab indent for all the text areas */
            $("textarea").each(function() {
                $(this).keydown(function(eve) {
                    if (eve.target != this) return;
                    if (eve.keyCode == 13)
                        last_blanks = getCurrentLineBlanks(this);
                    else if (eve.keyCode == 9) {
                        eve.preventDefault();
                        insertAtCursor(this, "\t");
                        this.returnValue = false;
                    }
                }).keyup(function(eve) {
                    if (eve.target == this && eve.keyCode == 13)
                        insertAtCursor(this, last_blanks);
                });
            });
        }
    </script>


</body>
<%@ include file="/plf/common/pub_end.jsp" %>