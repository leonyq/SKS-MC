<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
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
			<form action="${path }performance/performanceMonitorAction_httpRequestView.ms" method="post" id="searchForm">
				<table class="search_table">
				<tr>
					<td width="100%" style="text-align: center;"><dict:lang value="节点IP" /><select
						name="tempNode">
							<c:forEach items="${nodeIdList}" var="nodeId">
								<option
									<c:if test="${nodeId eq tempNode}"> selected="selected"</c:if>><c:out value='${nodeId }'/></option>
							</c:forEach>
					</select>
						<div style="display: inline-block;width: 40px;"></div><dict:lang value="时间范围" /><input
						id="begin_time" name="beginTime"
						value='<fmt:formatDate value="${beginTime }" pattern="yyyy-MM-dd"/>' class="input WdateNomorl"
						onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})"
						readonly="readOnly"> ~<input id="end_time"
						name="endTime" value='<fmt:formatDate value="${endTime }" pattern="yyyy-MM-dd"/>'
						class="input WdateNomorl"
						onfocus="WdatePicker({skin:'blue',dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d'})"
						readonly="readOnly"> <input type="button"
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
						<th width="25%">URL
						</th>
						<th width="10%"><dict:lang value="请求耗时" />
						</th>
						<th width="10%"><dict:lang value="请求CPU耗时" />
						</th>
						<th width="15%"><dict:lang value="记录时间" />
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
						<td width="25%" style="text-align: left;">
							<span title='<c:out value="${data.URL }"/>'><c:out value='${data.URL }'/></span>
						</td>
						<td width="10%">
							<span ><c:out value='${data.REQUEST_TIME }' /></span>
						</td>
						<td width="10%">
							<span><c:out value='${data.CPU_TIME }' /></span>
						</td>
						<td width="15%">
							<span><fmt:formatDate value="${data.RECODETIME }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
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