<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="模块类管理" /><dict:lang value="查看" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
<body>
<div class="all">
	<div>
	<table class="add_table">
      <tr>
				<td width="10%" class="tr1"><dict:lang value="类全名" /></td>
				<td width="90%"><s:property value="dataMap.CLZ_QNAME"/></td>
				</tr>
				<tr>
				<td width="10%" class="tr1"><dict:lang value="类说明" /></td>
				<td width="90%"><s:property value="dataMap.CLASS_DESC"/></td>
				</tr>
				<tr>
				<td width="10%" class="tr1"><dict:lang value="类型" /></td>
				<td width="90%"><s:property value="dataMap.MS_CLASS_TYPE"/></td>
				</tr>
				<tr>
				<td width="10%" class="tr1"><dict:lang value="源码" /></td>
				<td width="90%">
				<textarea name="paraMap.CLZ_SRC" id="paraMap_CLZ_SRC" rows="10" cols="150" style="width: 99%;"  readonly>
				<s:property value="dataMap.CLZ_SRC"/>
				</textarea>
				</td>
      </tr>
     </table>
     <div style="height: 2px;"></div>
   </div>
   <div class="ptop_10 txac">
		<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
	</div>
</div>

<script type="text/javascript">
	
	var editTable = $('#editTable');

	function init(){
		var tableTrJs = editTable.find("tbody tr");
		row_count = tableTrJs.length;
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
	<jsp:param name="needValidate" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>