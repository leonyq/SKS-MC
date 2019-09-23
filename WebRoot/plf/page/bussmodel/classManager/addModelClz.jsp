<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title>
		<dict:lang value="模型类管理" /><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
			<form id="add_form" name="addForm" action="${path}sys/BussModelAction_saveClzMgr.ms" method="post" >
				<s:hidden name="paraMap.MID" />
				<table class="add_table">
					<tr>
						<td colspan="6">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" />
							</span>
						</td>
					</tr>
					<tr>
						<td width="5%" class="tr1">
							<dict:lang value="类全名" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:textfield name="paraMap.CLZ_QNAME" id="paraMap_CLZ_QNAME" maxlength="100" />
						</td>
					</tr>
					<tr>
						<td width="5%" class="tr1">
							<dict:lang value="类说明" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:textfield name="paraMap.CLASS_DESC" id="paraMap_CLASS_DESC" maxlength="100" />
						</td>
					</tr>
					<tr>
						<td width="5%" class="tr1">
							<dict:lang value="类型" /><span class="Eng">*</span>
						</td>
						<td width="30%">
							<s:textfield name="paraMap.MS_CLASS_TYPE" id="paraMap_MS_CLASS_TYPE" maxlength="100" />
						</td>
					</tr>
					<TR>
					<td class="tr1">
							<dict:lang value="自定义类源码" />
						</td>
						<td colspan="3">
							<textarea name="paraMap.CLZ_SRC" id="paraMap_CLZ_SRC" rows="10" cols="150" style="width: 99%;" ></textarea>
						</td>
					</TR>
				</table>
				<div style="height: 2px;"></div>
				
			</form>
 	
		</div>

		<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
			&nbsp;&nbsp;
			
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">	
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	var regStr= /^[a-zA-Z][a-zA-Z0-9_]*$/;<%-- 数据库命名规则，必需以字母开头 --%>
	function add0(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if("2"!=cur_CLZMGR_ADD_TYPE){
			if(!valData()){
				return ;
			}
		}else{
			var paraMapCLZQNAME = document.getElementById("paraMap_CLZ_QNAME");
	   	if(val.isBlank(paraMapCLZQNAME)){
	   		_alertValMsg(paraMapCLZQNAME,"<dict:lang value="类全名" /> -- <dict:lang value="不能为空" />");
	   		return false;
	   	}
		}
		document.forms.add_form.submit();
		isSubmit = true;
	}
	
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		
		document.forms.add_form.submit();
		isSubmit = true;
	}
	
	
//////////////////////////////////////////////////////////////////////////

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>