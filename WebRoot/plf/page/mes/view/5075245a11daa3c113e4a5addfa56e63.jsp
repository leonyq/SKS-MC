<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="任务中心_任务日志_任务反馈" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="popDivWin" value="1" />
		<jsp:param name="datePicker" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
	<script src="${path}/plf/js/ui/textform/js/jquery.validate.js"></script>

</head>
<body>

	<div class="all">
		<div>
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<br>
			&nbsp;&nbsp;子任务数&nbsp;&nbsp;${dataMap.childTaskNum}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关结数&nbsp;&nbsp;${dataMap.closeTaskNum}
			<br><br>

		<div>
<div style="width: 40%;float: left;">
<table width="50%" class="table_list" id="showUserTable" >
<thead>
<tr class="thcolor" >
<th nowrap="nowrap">序号</th>
<th>反馈人</th>

<th>任务进度（%）</th>
<th>反馈时间</th>

<th>预估还需工时（天）</th>

</tr>
 <tbody>
 <c:forEach items="${dataList}" var="rz" varStatus="status">
    <tr onclick="showDesc('${rz.ID}')">
    <td>${status.index + 1}<input type="hidden" id="${rz.ID}_a" value="${rz.IMPLEMENT_STATUS}"/>
      <input type="hidden" id="${rz.ID}_b" value="${rz.NEED_ASSISTANCE}"/></td>
      <td>${rz.FEEDBACK_PERSONNAME}</td>
      <td>${rz.TASK_SPEED}</td>
      <td><fmt:formatDate value="${rz.FEEDBACK_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      <td>${rz.NEED_TIME}</td>       
    </tr>
  </c:forEach>
 </tbody>
</table>
</div>
 
 <div style="margin-left: 40%;">
				<table>
					<tr>
						<td align="right" nowrap="nowrap">执行情况&nbsp;</td>
						<td style="width:500px;"><textarea id="implement_status" cssClass="readonly" readonly="readonly" style="width:100%;height:200px;resize:none;box-sizing: border-box;"></textarea></td>
					</tr>
					<tr></tr>
					<tr>
						<td nowrap="nowrap">需协助事项&nbsp;</td>
						<td><textarea id="need_assistance" cssClass="readonly" readonly="readonly" style="width:100%;height:200px;resize:none;box-sizing: border-box;"></textarea></td>
					</tr>
				
				</table>
     </div> 
  </div>
 
 
 </div>


		</form>
		</div>
	</div>
		<bu:submit viewId="78579e343b524156aa0a3d13aee63062" />
		<bu:script viewId="78579e343b524156aa0a3d13aee63062" />
	<script type="text/javascript">
	var searchForm;
	var isQuery = false;
	function query(thisObj){
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		var selectObj = $(window.parent.document.forms.searchForm).clone(true);
		var pageHtml = $("#searchForm").html();
		var page_currentPage = $("#page_currentPage").val();
		var page_pageRecord = $("#page_pageRecord ").val(); 
		$("#searchDiv").html(selectObj);
		$("#searchDiv form").append(pageHtml);
		$("#searchDiv form").append("<input type='hidden' name='parentExeid' value='"+$("#searchForm input[name='exeid']").val()+"'/>");
		$("#searchForm input[name='exeid']").val($("#listForm input[name='exeid']").val());
		$("#page_currentPage").val(page_currentPage);
		$("#page_pageRecord ").val(page_pageRecord ); 
		$("#searchForm").submit();
		util.showTopLoading();
		isQuery=true;
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function showDesc(id){
	  $("#implement_status").html($("#"+id+"_a").val() );
	  $("#need_assistance").html($("#"+id+"_b").val() );  
	}
	
	function reloadPg(msg){
		util.alert(msg);
		if(isQuery){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		var selectObj = $(window.parent.document.forms.searchForm).clone(true);
		var pageHtml = $("#searchForm").html();
		var page_currentPage = $("#page_currentPage").val();
		var page_pageRecord = $("#page_pageRecord ").val(); 
		$("#searchDiv").html(selectObj);
		$("#searchDiv form").append(pageHtml);
		$("#searchDiv form").append("<input type='hidden' name='parentExeid' value='"+$("#searchForm input[name='exeid']").val()+"'/>");
		$("#searchForm input[name='exeid']").val($("#listForm input[name='exeid']").val());
		$("#page_currentPage").val(page_currentPage);
		$("#page_pageRecord ").val(page_pageRecord ); 
		$("#searchForm").submit();
		util.showTopLoading();
	}
	
	function init(){
		$(".table_list").each(function(seq) {
			var tableTrJs =$(this).find("tbody tr");
			_toClickColorMap(tableTrJs,$(this).attr("id"));
			_tongLineColor(tableTrJs);
		});
		
		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
	}

</script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
