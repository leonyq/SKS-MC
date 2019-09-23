<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用页面列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
		<style type="text/css">
		 table#listTable tr td input {
		 	border:none;
		 }
		   table#listTable tr td:nth-child(4){
		 	white-space: nowrap;overflow:hidden;text-overflow: ellipsis;
		 	
		 }
		  table#listTable tr td:nth-child(3){
		 	white-space: nowrap;overflow:hidden;text-overflow: ellipsis;
		 }
		</style>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/trigMagAction_checkWebService.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="事务名称" /></div>
								<div class ="search_value">
								<s:textfield id="wbsSh.jobName" name="wbsSh.jobName" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="详细描述" /></div>
								<div class ="search_value">
								<s:textfield id="wbsSh.jobDec" name="wbsSh.jobDec" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" class="table_list" style="width:100%;table-layout: fixed">
		<thead>
		<tr class="tdcolor">
			<th width="5%"></th>
			<th width="5%"><dict:lang value="序号" /></th>
			<th width="8%"><dict:lang value="事务名称" /></th>
			<th width="15%"><dict:lang value="详细描述" /></th>
			<th width="23%"><dict:lang value="请求接口" /></th>
			<th width="23%"><dict:lang value="访问方法" /></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="wbsList" id="websJob" status="index">
		<tr id="<s:property value="#websJob.id"/>">
			<s:if test="#websJob.id==paraMap.checkId">
			<td><input type="radio" name="button" onClick="check('<s:property value="id"/>','<s:property value="jobDec"/>');" checked="checked"/></td>
			</s:if>
			<s:else>
			<td><input type="radio" name="button" onClick="check('<s:property value="id"/>','<s:property value="jobDec"/>');"/></td>
			</s:else>
			<td><s:property value="#index.count"/></td>
			<td title="<s:property value="#websJob.jobName"/>"><s:property value="#websJob.jobName"/></td>
			<td title="<s:property value="#websJob.jobDec"/>">
				<s:property value="#websJob.jobDec"/></span>
			</td>
			<td >
				<s:property value="#websJob.wscName"/></span>
			</td>
			<td >
				<s:property value="#websJob.func"/></span>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	<s:hidden name="paraMap.checkId" id="checkId"/>
	<s:hidden name="paraMap.workDec" id="workDec"/>
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>
	
</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	function query(){
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	function check(checkId,workDec){
		parent.checkData(checkId,workDec);
	}
	$(function(){
		var checkId=$("#checkId").val();
		var workDec=$("#workDec").val();
		if(checkId!=""){
			check(checkId,workDec)
		}
		
	})
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>