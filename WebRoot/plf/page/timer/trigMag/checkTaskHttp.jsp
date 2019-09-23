<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="http" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/trigMagAction_checkEventHttp.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
				<table class="search_table">
					<tr>
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="名称" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_name" name="paraMap.name" cssClass="input_sh" maxlength="33" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="请求类型" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_method" name="paraMap.method" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" id="searchButtonId" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
					</tr>
				</table>
	</form>
    <table id="listTable" style="table-layout: fixed;" class="table_list" >
		<thead>
		<tr class="tdcolor">
			<th width="40px"><dict:lang value="单选按钮" /></th>
			<th width="20px"><dict:lang value="序号" /></th>
			<th width="100px"><dict:lang value="名称" /></th>
			<th width="50px"><dict:lang value="请求方式" /></th>
			<th width="100px"><dict:lang value="详细" /></th>
			<th width="100px"><dict:lang value="url" /></th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" id="http" status="index">
		<tr id="<s:property value="id"/>">
			<s:if test="#http.id==paraMap2.checkId">
				<td><input type="radio" name="button" onClick="check('<s:property value="id"/>','<s:property value="detail"/>');" checked="checked"/></td>
			</s:if>
			<s:else>
				<td><input type="radio" name="button" onClick="check('<s:property value="id"/>','<s:property value="detail"/>');"/></td>
			</s:else>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="count"/>><s:property value="#index.count"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="name"/>><s:property value="name"/></td>
			<td><dict:viewDict dictCode="RQ_TYPE" dictValue="%{method}" /></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="detail"/>><s:property value="detail"/></td>
			<td style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" title=<s:property value="url"/>><s:property value="url"/></td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>

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
			check(checkId,workDec)
		}
		
	})
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>