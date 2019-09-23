<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><s:property value="%{getText('viewOrmRel.title')}"/></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	</head>
<body>

<div class="all">	
	<div>
	<form id="search_form" name="searchForm" action="" method="post">
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
    <table class="table_list" >
		<tr class="tdcolor">
			<th width="5%"><s:property value="%{getText('button.seq')}"/></th>
			<th width="15%"><s:property value="%{getText('viewOrmRel.VIEWID')}"/></th>
			<th width="15%"><s:property value="%{getText('viewOrmRel.ORMID')}"/></th>
			<th width="15%"><s:property value="%{getText('viewOrmRel.ORM_NAME')}"/></th>
			<th width="15%"><s:property value="%{getText('viewOrmRel.TABLE_NAME')}"/></th>
			<th width="15%"><s:property value="%{getText('button.oper')}"/>
				<input type="button" value="<s:property value="%{getText('button.add')}"/>" onclick="add();" class="botton_img_add3">
			</th>
		</tr>
	<s:iterator value="listData" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<td><s:property value="VIEWID"/></td>
			<td><s:property value="ORMID"/></td>
			<td><s:property value="ORM_NAME"/></td>
			<td><s:property value="TABLE_NAME"/></td>
			<td>
				<a href="javascript:update('<s:property value="id"/>')" title="<s:property value="%{getText('button.edit')}"/>" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="id"/>');" title="<s:property value="%{getText('button.del')}"/>" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
			</td>
		</tr>
	</s:iterator>
	</table>
	</div>

</div>

	<form id="submitForm" name="submitForm" action="" target="submit_frame" method="post">
		<input type="hidden" id="del_id" name="userDto.id" />
		<input type="hidden" id="MID" name="MID" value="<s:property value="paraMap.MID"/>"/>
	</form>
	<div style="display: none;">
	<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	
	function query(thisObj){
		_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	function reloadPg(msg){
		util.alert(msg);
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function closePopWin(){
		hidePopWin(false);
	}
	
	function add(){
		var url = "${path}sys/BussModelAction_addOrm.ms?paraMap.MID=<s:property value="paraMap.MID"/>";
		showPopWin(url, 700, 400,null,"新增");
	}
	
	function update(id){
		var url = "${path}sys/UserAction_showUpUser.ms?userDto.id="+id;
		showPopWin(url, 700, 400,null,"修改");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
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