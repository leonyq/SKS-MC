<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title>列表</title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">
	<%-- 操作功能区域 --%>
	<form id="funForm" name="funForm" action="${path}buss/bussModel.ms" method="post">
	<input type="hidden" name="@_VIEW_ID" value="" />
	<table class="search_table">
		<tr>
			<td width="20%" align="right">
					<%-- 功能按钮区域 --%>
			    &nbsp;&nbsp;<input type="button" value="<s:property value="%{getText('button.add')}"/>" onclick="add();" class="botton_img_add">
		  </td>
	    </tr>
	</table>
	</form>
	<%-- 查询条件区域 --%>
	<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
	<input type="hidden" name="@_VIEW_ID" value="" />
	<table class="search_table">
		<tr>
			<td width="2%">
		  		<img src="${path}plf/style/css2/images/ss.gif?_mc_res_version=<%=PlfStaticRes.SS_GIF %>" width="29" height="28" class="sp b_5"/>
		  </td>
			<td width="26%">
			  	用户名称：
			  	<s:textfield id="name" name="paraMap.name" cssClass="input_sh" maxlength="30" />
		  </td>
			<td width="26%">
			  	登录名称：
			  	<s:textfield id="url" name="paraMap.loginName" cssClass="input_sh" maxlength="120" />
		  </td>
			<td width="20%" align="right">
			    <input type="button" value="<s:property value="%{getText('button.search')}"/>" onclick="query(this);" class="botton_img_search">
		  </td>
	    </tr>
	</table>
	</form>
	
	<div>
    <table class="table_list" >
	<%-- 数据列表标题区域 --%>
		<tr class="tdcolor">
			<th width="5%">序号</th>
			<th width="15%">用户名称</th>
			<th width="15%">登录名称</th>
			<th width="10%">状态</th>
			<th width="15%">操作</th>
		</tr>
	<%-- 数据列表区域 --%>
	<s:iterator value="paginationImpl.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td><s:property value="name"/></td>
			<td><s:property value="loginName"/></td>
			<td><span <s:if test="enable == \"0\"">style="color: red;"</s:if> ><dict:viewDict dictCode="user_enable" dictValue="%{enable}" /></span></td>
			<td>
				<%-- 功能按钮区域 --%>
				<a href="javascript:update('<s:property value="id"/>')" title="<s:property value="%{getText('button.edit')}"/>" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
				||<a href="javascript:resetPw('<s:property value="id"/>','<s:property value="name"/>')" title="重置密码" ><img src="${IMG_PATH}/ContImg07.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG07_GIF %>" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<s:property value="%{getText('button.del')}"/>" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
			</td>
		</tr>
	</s:iterator>
	</table>
	</div>
	
	<%-- 分页功能区域 --%>
	<div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=search_form&resetSearchVal=resetSearchVal" />
	</div>
</div>

	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" name="@_VIEW_ID" value="" />
		<input type="hidden" id="del_id" name="userDto.id" />
	</form>
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>

</div>

<%-- javascript 脚本区域 --%>
<script type="text/javascript">
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.search_form.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.search_form.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function closePopWin(){
		hidePopWin(false);
	}
	
	function add(){
		var url = "${path}sys/UserAction_showAddUser.ms?funcDto.upId="+$("#funcDtoSh_upId").val();
    showPopWin(url, 700, 400,null,"新增");
	}
	
	function update(id){
		var url = "${path}sys/UserAction_showUpUser.ms?userDto.id="+id;
     showPopWin(url, 700, 400,null,"修改");
	}
	
	var delId = "";
	function del(id){
		openDiag(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submit_form.action="${path}sys/UserAction_delUser.ms";
		$("#del_id").val(delId);
		document.forms.submit_form.submit();
	}
	
	function resetPw(uid,uname){
		openDiag(resetPwCf," 确定要重置<font class=\"hzt\">“&lt;"+uname+"&gt;用户密码”</font>吗？");
		delId = uid;
	}
	function resetPwCf(uid){	
    document.forms.submit_form.action="${path}sys/UserAction_resetUserPw.ms";
		$("#del_id").val(delId);
		document.forms.submit_form.submit();
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>