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
	<div class="all">
		<div>
			<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" /> target="submitFrame">
				<input type="hidden" name="exeid" value="${exeid}">
				<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
				<s:token />
				<table class="func_table">
					<tr>
						<td width="100%" align="right">
							<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
							<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
						</td>
					</tr>
				</table>
				<table class="add_table">
					<tr>
						<th colspan="4">
							<span class="Eng">*</span>
							<dict:lang value="为必填项" />
						</th>
					</tr>
				</table>
		<bu:set name="paraMapObj" value="${dataId}" formId="6fad1aef6171440eb416ea02f44518c3" type="add" />
	<table class="add_table" >
	<input type="hidden" name="formIds" value="6fad1aef6171440eb416ea02f44518c3" />
	<input type="hidden" name="6fad1aef6171440eb416ea02f44518c3" value="paraMap1@" />
	<input type="hidden" name="paraMap1@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap1@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'6b6bde35e18b4dc89ce8734dcdffd816'" />
		<s:set name="_$formId_1" value="'6fad1aef6171440eb416ea02f44518c3'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<bu:td colNo="BBB" formId="6fad1aef6171440eb416ea02f44518c3" cssClass="tr1" /></td>
			<td><bu:ui colNo="BBB" formId="6fad1aef6171440eb416ea02f44518c3" value="%{BBB}" formIndex="1" /></td>
			<bu:td colNo="CCC" formId="6fad1aef6171440eb416ea02f44518c3" cssClass="tr1" /></td>
			<td><bu:ui colNo="CCC" formId="6fad1aef6171440eb416ea02f44518c3" value="%{CCC}" formIndex="1" /></td>
		</tr>
		<tr>
			<bu:td colNo="AAA" formId="6fad1aef6171440eb416ea02f44518c3" cssClass="tr1" /></td>
			<td colspan="3"><bu:ui colNo="AAA" formId="6fad1aef6171440eb416ea02f44518c3" value="%{AAA}" formIndex="1" /></td>
		</tr>
	</table>
			<bu:jsVal formId="6fad1aef6171440eb416ea02f44518c3" formIndex="1" />
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
