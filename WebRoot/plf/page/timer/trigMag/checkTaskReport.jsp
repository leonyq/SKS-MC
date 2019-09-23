<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="发件设置" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/trigMagAction_checkTaskReport.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="收件人账号" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_receive_account" name="paraMap.receive_account" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="抄送人账号" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_receive_account_cc" name="paraMap.receive_account_cc" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="密送人账号" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_receive_account_bcc" name="paraMap.receive_account_bcc" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" style="table-layout: fixed;"  width="950px" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="20px"></th>
			<th width="50px"><dict:lang value="序号" /></th>
			<th width="150px"><dict:lang value="收件人账号" /></th>
			<th width="200px"><dict:lang value="抄送人账号" /></th>
			<th width="200px"><dict:lang value="密送人账号" /></th>
			<th width="8%"><dict:lang value="详细描述" /></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="report" status="index">
		<tr id="<s:property value="id"/>">
			<s:if test="#report.id==paraMap2.checkId">
				<td><input type="radio" name="button" onClick="check('<s:property value="id"/>','<s:property value="detail"/>');" checked="checked"/></td>
			</s:if>
			<s:else>
				<td><input type="radio" name="button" onClick="check('<s:property value="id"/>','<s:property value="detail"/>');"/></td>
			</s:else>
			<td><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"><s:property value="receive_account"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"><s:property value="receive_account_cc"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"><s:property value="receive_account_bcc"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;"><s:property value="detail"/></td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	<s:hidden name="paraMap2.checkId" id="checkId"/>
	<s:hidden name="paraMap2.workDec" id="workDec"/>
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div>

</div>
<script type="text/javascript">
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){
			util.alert(util.submit_default_info);
		};
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function check(checkId,workDec){
		parent.checkData(checkId,workDec);
	}
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}
	$(function(){
		var checkId=$("#checkId").val();
		var workDec=$("#workDec").val();
		if(checkId!=""){
			check(checkId,workDec);
		}
		
	});
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>