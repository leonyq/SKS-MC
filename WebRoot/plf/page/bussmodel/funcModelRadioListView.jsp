<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="功能模型" />
	<dict:lang value="列表" />
</title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="layui" value="1" />
</jsp:include>
</head>

<body>

	<div class="all">
		<div class="table_div">
			<form id="searchForm" name="searchForm"
				action="${path}sys/BussModelAction_funcModelRadioListView.ms" method="post">
				<input type="hidden" id="paraMap_funcMId" name="paraMap.funcMId"
					value="<s:property value="paraMap.funcMId"/>" />
				<input type="hidden" id="paraMap_mcIframeName" name="paraMap_mcIframeName"
					   value="${mcIframeName}" />

				<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
				<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
			</form>

			<table id="listTable" class="table_list table-mc-form">
				<thead>
					<tr class="tdcolor">
						<th style="width: 40px"><dict:lang value="序号" />
						</th>
						<th style="width: 40px"></th>
						<%--<th width="20%"><dict:lang value="视图ID" /></th>
			--%>
						<th style="width: 200px"><dict:lang value="功能模型ID" />
						</th>
						<%--<th width="15%"><dict:lang value="视图编码" /></th>--%>
						<th style="width: 100px"><dict:lang value="功能模型名称" />
						</th>
					</tr>
				<thead>
				<tbody>
					<s:iterator value="listData" status="index">
						<tr class="listDataTr" title="<dict:lang value="双击选中" />"
							style="cursor:pointer">
							<td><s:property value="#index.count" />
							</td>
							<td><input type="radio" name="funcMId"
								value="<s:property value="ID"/>" />
							</td>
							<td title="<s:property value="ID" />" class="_noedit">
								<s:property value="ID" />
							</td>
							<%--<td><s:property value="ID"/></td>--%>
							<td class="ACT_NAME"><s:property value="ACT_NAME" />
							</td>

						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>


	</div>



	<script type="text/javascript">


		$(function() {
			$(".listDataTr").click(function(){
				$(this).find("input[name='funcMId']").attr("checked","checked");

			});
			var paraMap_mcIframeName = $("#paraMap_mcIframeName").val();
			var parentFrame = top.document.getElementById(paraMap_mcIframeName);


			 $(".listDataTr").dblclick(function(){
				var funcMId = $(this).find("input[name='funcMId']:checked").val();
				var paraMap_funcMId = $("#paraMap_funcMId").val();
				var mcIframeName  =window.name;
				 var mcWindow = getSrcByIframeName({mcIframeName:mcIframeName,type:'window'});
				$("#"+paraMap_funcMId,parentFrame.contentWindow.document).val(funcMId);
				mcWindow.closePage();
			});

		});
	</script>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="popConfirm" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>