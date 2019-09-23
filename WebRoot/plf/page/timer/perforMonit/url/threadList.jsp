<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="系统异常日志" /></title>
<%@ include file="/plf/common/pub_meta.jsp"%>
<jsp:include page="/plf/common/pub_head.jsp">
	<jsp:param name="popDivWin" value="1" />
	<jsp:param name="datePicker" value="1" />
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
			<form action="${path }performance/performanceMonitorAction_threadList.ms" method="post" id="searchForm">
				<table class="search_table">
				<tr>
					<td width="100%" style="text-align: center;"><dict:lang value="优先级" /><select
						name="priority">
							<option value="-1">--优先级--</option>
							<c:forEach items="${priList}" var="pri">
								<option
									<c:if test="${pri eq priority}"> selected="selected"</c:if>><c:out value='${pri}'/></option>
							</c:forEach>
					</select>
						<div style="display: inline-block;"><input type="button"
						id="searchButtonId" value="<dict:lang value="查询" />"
						onclick="query(this)" class="botton_img_add" />
					</td>
				</tr>
			</table>
			
			</form>
			

			<table id="listTable" class="table_list"
				style="width:100%;table-layout: fixed">
				<thead>
					<tr class="tdcolor">
						<th width="5%"><dict:lang value="序号" />
						</th>
						<th width="20%"><dict:lang value="线程名" />
						</th>
						<th width="10%"><dict:lang value="优先级" />
						</th>
						<th width="20%"><dict:lang value="线程状态" />
						</th>
						<th width="20%"><dict:lang value="执行方法" />
						</th>
						<th width="20%"><dict:lang value="线程消耗CPU" />
						</th>
						<th width="20%"><dict:lang value="线程消耗用户时间" />
						</th>
					</tr>
				</thead>
			</table>
			<table id="listTable" class="table_list"
				style="width:100%;table-layout: fixed">
				<tbody class="body_data">
					<c:forEach items="${dataList }" var="data" varStatus="status">
						<tr>
						<td width="5%">
							<c:out value='${status.count }'/>
						</td>
						<td width="20%" style="text-align: left;">
							<span title='<c:out value="${data.name }" escapeXml="true"></c:out>'><c:out value="${data.name }" escapeXml="true"></c:out></span>
						</td>
						<td width="10%">
							<span title="<c:out value='${data.priority }'/>"><c:out value='${data.priority }'/></span>
						</td>
						<td width="20%">
							<span><c:out value='${data.state }'/></span>
							
						</td>
						<td width="20%">
							<span title="<c:out value='${data.bytes }'/>"><c:out value='${data.bytes }'/></span>
						</td>
						<td width="20%">
							<span title="<c:out value='${data.bytes }'/>"><c:out value='${data.cpuTime }'/></span>
						</td>
						<td width="20%">
							<span title="<c:out value='${data.bytes }'/>"><c:out value='${data.userTime }'/></span>
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="center">
			<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
		</div>
	</div>

	<script type="text/javascript">
	function query(){
		document.forms.searchForm.submit();
	}
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>