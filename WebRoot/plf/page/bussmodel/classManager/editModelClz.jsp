<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="持久化模型" /><dict:lang value="修改" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
<body>
<div class="all">
	<div>
	<form id="edit_form" name="editForm" action="${path}sys/BussModelAction_editClzMgr.ms" method="post" >
		<s:hidden name="paraMap.MID" />
		<s:hidden name="paraMap.ID" />
	<table class="add_table">
        <tr>
          <td colspan="6">
          	<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项"/></span>
          </td>
		</tr>
        <tr>
				<td width="20%" class="tr1"><dict:lang value="类全名" /></td>
				<td width="30%">
							<s:textfield name="paraMap.CLZ_QNAME" id="paraMap_CLZ_QNAME" maxlength="100"  value="%{dataMap.CLZ_QNAME}"/>
						</td>
				<td width="30%">
				</td>
      </tr>
       <tr>
				<td width="20%" class="tr1"><dict:lang value="类说明" /></td>
				<td width="30%">
							<s:textfield name="paraMap.CLASS_DESC" id="paraMap_CLASS_DESC" maxlength="100"  value="%{dataMap.CLASS_DESC}"/>
						</td>
				<td width="30%">
				</td>
      </tr>
       <tr>
				<td width="20%" class="tr1"><dict:lang value="类型" /></td>
				<td width="30%">
							<s:textfield name="paraMap.MS_CLASS_TYPE" id="paraMap_MS_CLASS_TYPE" maxlength="100"  value="%{dataMap.MS_CLASS_TYPE}"/>
						</td>
				<td width="30%">
				</td>
      </tr>
      <TR>
					<td class="tr1">
							<dict:lang value="自定义类源码" />
						</td>
						<td colspan="3">
							<textarea name="paraMap.CLZ_SRC" id="paraMap_CLZ_SRC" rows="10" cols="150" style="width: 99%;" >
								<s:property value="dataMap.CLZ_SRC"/>
							</textarea>
						</td>
	</TR>

     </table>
     <div style="height: 2px;"></div>
     </form>
     
   </div>
   <div class="ptop_10 txac">
		<input type="button" value="<dict:lang value="提交" />" onclick="edit(this);" class="botton_img_add">
		&nbsp;&nbsp;
		<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
		&nbsp;&nbsp;
	</div>
</div>

<script type="text/javascript">

	var editTable = $('#editTable');
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		util.alert(msg);
	  var oldUrl = document.forms.editForm.action;
	  document.forms.editForm.action="${path}sys/BussModelAction_forEditClzMgr.ms";
		document.forms.editForm.submit();
	  document.forms.editForm.action=oldUrl;
		util.showTopLoading();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	var regStr= /^[a-zA-Z][a-zA-Z0-9_]*$/;<%-- 数据库命名规则，必需以字母开头 --%>
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");return ;}
		
		document.forms.editForm.submit();
		isSubmit = true;
	}

</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
	<jsp:param name="needValidate" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>