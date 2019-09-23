<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
<title><dict:lang value="微信" />
</title>
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
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>
	<div class="all">
		<div>
		
			<input type="hidden" id="appid_hidden" class="input" value="<c:out value='${wxPageVO.wxPlatform.appid}' />">
			<input type="hidden" id="appsecret_hidden" class="input" value="<c:out value='${wxPageVO.wxPlatform.appsecret}' />">
			<input type="hidden" id="templateid_hidden" class="input" value="<c:out value='${wxPageVO.wxPlatform.templateId}' />">
			<form action="${path }wx/wxAction_toWxIndexPage.ms" method="post"
				id="searchForm">
				<table class="search_table">
					<tr>
						<td width="100%" style="text-align: center;"><dict:lang
								value="开发者ID" /><input type="text" id="appid" class="input" value="<c:out value='${wxPageVO.wxPlatform.appid}' />">
								
								
							<div style="display: inline-block;width: 40px;"></div> <dict:lang
								value="开发者密码" /> <input type="text" id="appsecret" class="input" value="<c:out value='${wxPageVO.wxPlatform.appsecret}' />">
						<div style="display: inline-block;width: 40px;"></div> <dict:lang
								value="模板ID" /><input type="text" id="templateid" class="input" value="<c:out value='${wxPageVO.wxPlatform.templateId}' />">
						<div style="display: inline-block;width: 40px;"></div> <input
							type="button" id="searchButtonId"
							value="<dict:lang value="确定" />" onclick="regist(this)"
							class="botton_img_add" /></td>


					</tr>
					<tr>
						<td width="100%" style="text-align: center;"><dict:lang
								value="任务描述" /> <input name='wxPageVO.jobDesc'
							value="<c:out value='${wxPageVO.jobDesc}' />" type="text" class="input">
						<div style="display: inline-block;width: 40px;"></div> <dict:lang
								value="任务类型" /> <select name="wxPageVO.jobType">
								<option value="-1"
									<c:if test="${wxPageVO.jobType == '-1' }">selected</c:if>>
									<dict:lang value="所有类型" />
								</option>
								<option value="0"
									<c:if test="${wxPageVO.jobType == '0' }">selected</c:if>>
									<dict:lang value="email任务" />
								</option>
								<option value="1"
									<c:if test="${wxPageVO.jobType == '1' }">selected</c:if>>
									<dict:lang value="http任务" />
								</option>
								<option value="2"
									<c:if test="${wxPageVO.jobType == '2' }">selected</c:if>>
									<dict:lang value="webService任务" />
								</option>
						</select>

							<div style="display: inline-block;width: 40px;"></div> <input
							type="button" id="searchButtonId"
							value="<dict:lang value="查询" />" onclick="query(this)"
							class="botton_img_add" /></td>
					</tr>
				</table>

			</form>


			<table id="listTable" class="table_list"
				style="width:100%;table-layout: fixed">
				<thead>
					<tr class="tdcolor">
						<th width="2%"><dict:lang value="序号" /></th>
						<th width="20%"><dict:lang value="任务描述" /></th>
						<th width="10%"><dict:lang value="任务类型" /></th>
						<th width="10%"><dict:lang value="操作" /></th>

					</tr>
				</thead>
			</table>
			<table id="listTable" class="table_list"
				style="width:100%;table-layout: fixed">
				<tbody class="body_data">
					<c:forEach items="${wxPageVO.wxJobs }" var="wxJob"
						varStatus="status">
						<tr>
							<td width="2%"><c:out value='${status.count }'/></td>
							<td width="20%" style="text-align: left;"><span
								title="<c:out value='${wxJob.jobDesc }'/>"><c:out value='${wxJob.jobDesc }'/></span></td>
							<td width="10%"><c:if test="${wxJob.jobType == '0'}">email任务</c:if>
								<c:if test="${wxJob.jobType == '1'}">http任务</c:if> 
								<c:if test="${wxJob.jobType == '2'}">webService任务</c:if></td>
							<td width="10%"><a title="消息推送配置"
								href="javascript:showUserPage('<c:out value="${wxJob.jobType}"/>','<c:out value="${wxJob.id}"/>');"><img
									src="/mc/plf/style/css1/images/ContImg08.gif?_mc_res_version=20180205" />
							</a>
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
		function query(obj) {
			document.forms.searchForm.submit();
		}
	
		function regist() {
			if($("#appid").val() == '') {
				util.alert("开发者ID不能为空");
				return ;
			}
			
			if($("#appsecret").val() == '') {
				util.alert("开发者密码不能为空");
				return ;
			}
			
			if($("#templateid").val() == '') {
				util.alert("模板ID不能为空");
				return ;
			}
			
			var dataObj = {
					"wxPageVO.wxPlatform.appid" : $("#appid").val(),
					"wxPageVO.wxPlatform.appsecret" : $("#appsecret").val(),
					"wxPageVO.wxPlatform.templateId" : $("#templateid").val()
					
			};
			$.post("${path }wx/wxAction_wxRegist.ms",dataObj,function(res) {
				if(res.ajaxMap.res == "1") {
					$("#appid_hidden").val(dataObj['wxPageVO.wxPlatform.appid']);
					$("#appsecret_hidden").val(dataObj['wxPageVO.wxPlatform.appsecret']);
					$("#trmplateid_hidden").val(dataObj['wxPageVO.wxPlatform.templateId']);
				}
				util.alert(res.ajaxMap.msg);
				
			});
		}
		
		function showUserPage(type,id) {
			if($("#appid_hidden").val() == '' || $("#appsecret_hidden").val()=='' || $("#templateid_hidden").val()=='' ) {
				util.alert("请输入开发者ID,开发者密码,模板ID 并点击确定");
				return ;
			}
			showPopWin("${path }wx/wxAction_toWxUserPage.ms?wxUserPageVO.jobType="+type+"&wxUserPageVO.jobId="+id+"&wxPageVO.wxPlatform.appid="  + $("#appid_hidden").val()+"&wxPageVO.wxPlatform.appsecret="+$("#appsecret_hidden").val()+"&wxPageVO.wxPlatform.templateId="+$("#templateid_hidden").val(), 600, 400, null, "微信消息推送");
		}
	</script>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>