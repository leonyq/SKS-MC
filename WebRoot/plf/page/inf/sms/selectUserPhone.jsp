<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="模型管理"/><dict:lang value="列表"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
		<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
<div class="all">
	<form id="search_form" name="searchForm" action="${path}sys/ALIMsgAction_queryPhonePage.ms"  method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<table class="search_table">
		<tr>
				<td width="50%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="短信模板名称" /></div>
								<div class ="search_value">
								<s:textfield id="name" name="userDtosh.name" cssClass="input" maxlength="100"/>
								</div>
							</div>
							<div>
						</div>
						</td>
			<td width="50%" align="right">
				<input type="button" value="<dict:lang value="查询" />"  onclick="query();" class="botton_img_search">
			 	 <input type="button" value="<dict:lang value="提交" />" onclick="add();" class="botton_img_search">
		  		<input type="button" value="<dict:lang value="取消" />" onclick="cancel();" class="botton_img_search">
		    </td>
	    </tr>
	</table>
	</form>
	
	<div>
<div class="all">	
	<div>
	<form id="moduleForm" name="moduleForm" action="${path}sys/ALIMsgAction_queryPhonePage.ms" method="post" target="submitFrame">
   <input type="hidden" id="filepaths" name="paraMap.filepaths"></input>
    <table id="listTable" class="table_list" >
    <thead>
		<tr class="tdcolor">
			<th width=5%><input type="checkbox" id="selectAll" /></th>
			<th width=5%><dict:lang value="序号" /></th>
			<th width="15%"><dict:lang value="姓名" /></th>
			<th width="15%"><dict:lang value="部门" /></th>
			<th width="15%"><dict:lang value="手机号码" /></th>
		</tr>
		<thead>
		<tbody>
		<c:forEach items="${page.dataList}" var="ls" varStatus="index">
		<tr>
			<td><input type = "checkbox" name="checkbox" value = "<c:out value='${ls.phone}' />"></td>
			<td>${index.count}</td>
			<td><c:out value='${ls.name}' /></td>
			<td><c:out value='${ls.deptName}' /></td>
			<td><c:out value='${ls.phone}' /></td>
		</c:forEach>
	
	</tbody>
	</table>
	</form>
	</div>

	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm&resetSearchVal=resetSearchVal" />
	</div>
</div>

	<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>
	<script type="text/javascript">
	function cancel(){
		parent.closePopWin();
	}
	function query()
	{
		document.forms.searchForm.submit();
	}
	$("#selectAll").click(function(){
		if($(this).is(":checked"))
		{
			$("[name=checkbox]:checkbox").attr("checked",true);
		}
		else
		{
			$("[name=checkbox]:checkbox").attr("checked",false);
		}
	});
	function add(){
		var phones=null;
		 $("#listTable :checkbox").each(function(){
				if($(this).attr("checked")){
					if($(this).val()!="on"){
					if(phones ==null){
						phones=$(this).val();
					}else{
						phones=phones+","+$(this).val();
					}
					}
				}
			});
		_setSelValue(phones)
	}
	

	<%-- 回填选择的值 --%>
	function _setSelValue(phones){
		_thisSelObj=parent.window._thisSelObj;
		_thisSelObj.value = phones;
		_thisSelObj.focus();
		parent.closePopWin();
	}
	
	
	
	
	
	</script>
</body>
