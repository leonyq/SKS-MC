<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title>用户信息列表</title><%-- 异步刷新用户列表方式 --%>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">
	<table class="search_table">
		<tr>
			<td width="2%">
		  		<img src="${path}plf/style/css2/images/ss.gif?_mc_res_version=<%=PlfStaticRes.SS_GIF%>" width="29" height="28" class="sp b_5"/>
		  	</td>
			<td width="26%">
			  	用户名称：
			  	<s:textfield id="name" name="userDtoSh.name" cssClass="input_sh" maxlength="30" />
		  	</td>
			<td width="26%">
			  	登录名称：
			  	<s:textfield id="loginName" name="userDtoSh.loginName" cssClass="input_sh" maxlength="120" />
		  	</td>
			<td width="26%">
			  	单位名称：
			  	<s:textfield id="deptName" name="userDtoSh.deptName" cssClass="input_sh" maxlength="120" />
		  	</td>
			<td width="20%" align="right">
			    <input type="button" value="查 询" onclick="query();" class="botton_img_search">
			    &nbsp;&nbsp;<input type="button" value="新 增" onclick="add();" class="botton_img_add">
		  	</td>
	    </tr>
	</table>	
	<div>
    <table class="table_list" >
		<tr class="tdcolor">
			<th width="5%">编号</th>
			<th width="15%">用户名称</th>
			<th width="15%">登录名称</th>
			<th width="40%">单位名称</th>
			<th width="10%">状态</th>
			<th width="15%">操作</th>
		</tr>
		<tbody id="data_list_tr" />
	</table>
	</div>

	<div class="center">
		<s:include value="/plf/common/paginationAx.jsp?listDataFn=listUserAx&showLoading=0" />
	</div>
</div>
	<div style="display: none;">
	<%-- 数据提交from(用于实现异步提交) --%>
	<form id="submit_form" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="del_id" name="userDto.id" />
	</form>
	<%-- 数据提交iframe(用于实现异步提交) --%>
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">

	function listUserAx(paginationImpl){
		util.showTopLoading();		
		var url = "${path}/sys/UserAction_getHMsg.ms";
	    jQuery.ajax({
			type: "POST",
		    dataType: "json",
		    url: url,
		    data: {"paginationImpl.currentPage":paginationImpl.currentPage,"paginationImpl.pageRecord":paginationImpl.pageRecord,
		    	"userDtoSh.name":$("#name").val(),"userDtoSh.loginName":$("#loginName").val(),"userDtoSh.deptName":$("#deptName").val()},
			success: function(data){
				if(null == data){return;}
				var innerTbody="";
				if(null !=data.ajaxPage.dataList){
					jQuery.each(data.ajaxPage.dataList, function(i, userDto) {
						innerTbody += '<tr>';
						innerTbody += '<td>'+(i+1)+'</td>';
						innerTbody += '<td>'+toString(userDto.name)+'</td>';
						innerTbody += '<td>'+toString(userDto.loginName)+'</td>';
						innerTbody += '<td>'+toString(userDto.deptName)+'</td>';
						if("0"==userDto.enable){
							innerTbody += '<td><span style="color: red;" >'+toString(userDto.enableCn)+'</span></td>';
						}else{
							innerTbody += '<td>'+toString(userDto.enableCn)+'</td>';
						}
						innerTbody += '<td>';
						innerTbody += '<a href="javascript:update(\''+userDto.id+'\')" title="修改" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF%>" /></a>';
						innerTbody += '||<a href="javascript:void(0);" onclick=resetPw(\''+userDto.id+'\',\''+userDto.name+'\') title="重置密码" ><img src="${IMG_PATH}/ContImg07.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG07_GIF%>" /></a>';
						innerTbody += '||<a href="javascript:void(0);" onclick=del(\''+userDto.id+'\',\''+userDto.name+'\') title="删除" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF%>" /></a>';
						innerTbody += '<td>';
						innerTbody += '</tr>';
					});
				}
				$("#data_list_tr").html(innerTbody);
				showPageBar(data.ajaxPage);
				isQuery= false;
				util.closeTopLoading();
			},
			error: function(msg){
				util.alert("error:"+msg);
				isQuery= false;
				util.closeTopLoading();
			}
		});
	}
	
	var isQuery = false;
	function query(){
		paginationImpl.currentPage = "1";
		queryLs();
	}
	function queryLs(){
		listUserAx(paginationImpl);
		if(isQuery){util.alert(util.submit_default_info);}
		isQuery= true;
	}
	
	function reloadPg(msg){
		util.alert(msg,reloadPgExe);
	}
	
	function reloadPgExe(){
		closePopWin();
		queryLs();
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
	function del(id,uname){
		openDiag(delConfirm," 确定要删除<font class=\"hzt\">“&lt;"+uname+"&gt;用户”</font>吗？");
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
	
	listUserAx(paginationImpl);

</script>
<%-- 引用弹对话框 --%>
<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>