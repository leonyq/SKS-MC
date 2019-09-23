<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="SQL内容" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin"  value="1" />
	<jsp:param name="datePicker" value="1" />
	<jsp:param name="ace"        value="1"/>
</jsp:include>
<style type="text/css">
.WdateNomorl {
	border-color: #ccc;
	font-size: 12px;
	width: 120px;
	box-sizing: border-box;
	border: 1px solid #dbdbdb;
	height: 20px;
	line-height: 25px;
	padding-left: 5px;
}

.body_data td {
	overflow: hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
}
</style>
</head>
<body>

	<div class="all">
		<div>
			<table id="listTable" class="table_list"
				style="width:100%;height:300px;table-layout: fixed">
				<tbody class="body_data">
					<tr>
						<td >
							<pre id="ace_code" style="width: 100%;height:100%;"><c:out value="${sqlDetail }" escapeXml="true"></c:out>
							</pre>
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>

		<%-- <div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
		</div> --%>
	</div>

	<%-- <jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include> --%>
	<!-- 初始化ace代码编辑器 -->
	<script type="text/javascript">
		//初始化ace对象
		editor = ace.edit("ace_code");
		//设置风格和语言（更多风格和语言，请到github上相应目录查看）
		theme = "idle_fingers"//clouds
		language = "sql"
		editor.setTheme("ace/theme/" + theme);
		editor.session.setMode("ace/mode/" + language);
		//字体大小
		editor.setFontSize(14);
		//设置只读（true时只读，用于展示代码）
		editor.setReadOnly(true);
		//自动换行,设置为off关闭
		editor.setOption("wrap", "free");
		//启用提示菜单
		ace.require("ace/ext/language_tools");
		editor.setOptions({
			enableBasicAutocompletion : true,
			enableSnippets : true,
			enableLiveAutocompletion : true
		});
	</script>
	<script type="text/javascript">
	function query(){
		document.forms.searchForm.submit();
	}
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>