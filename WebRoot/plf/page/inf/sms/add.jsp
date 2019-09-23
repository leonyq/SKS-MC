<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增短信模板" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}sys/ALIMsgAction_add.ms" method="post" target="submitFrame">
			
				<table class="add_table">
				
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="短信模板名称" />
						</td>
						<td colspan="3">
							<input type="text" lay-verify="required" id="aliMsgName" maxlength="100" name="aliMsgDto.name"  class="_VAL_NULL _VAL_DATABASE" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="accessKeyId" />
						</td>
						<td colspan="3">
							<input type="text" lay-verify="required" id="accessKeyId" maxlength="100" name="aliMsgDto.accessKeyId"  class="_VAL_NULL _VAL_DATABASE" style="width:100%;" />
						</td>
					</tr>
					<td style="width: 106px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="accessKeySecrt" />
						</td>
						<td colspan="3">
							<input type="text" lay-verify="required" id="accessKeySecrt" maxlength="100" name="aliMsgDto.accessKeySecrt"  class="_VAL_NULL _VAL_DATABASE" style="width:100%;" />
						</td>
					</tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="短信签名" />
						</td>
						<td colspan="3">
							<input type="text" lay-verify="required" id="autograph" maxlength="100" name="aliMsgDto.autograph"  class="_VAL_NULL _VAL_DATABASE" style="width:100%;" />
						</td>
					</tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng"></span><dict:lang value="短信签名" />
						</td>
						<td colspan="3">
							<s:textarea  id="memo"  name="aliMsgDto.memo" cssStyle="word-wrap: normal;width:100%;" wrap="off"/>
						</td>
					</tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="短信类型" />
						</td>
						<td colspan="3">
							<dict:selectDict name="aliMsgDto.type" id="aliMsgType" dictCode="ALIMSG_TYPE" dictValue="${fn:escapeXml(aliMsgDto.type)}" />
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
					
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="go" onclick="/*add(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	function cancel(){
		parent.closePopWin();
	}
	layui.use('form',function(){
        var form = layui.form;
        form.render("select");
        form.on('submit(go)', function(data){
        	add();
  	 	});
	});
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function add(thisObj){
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		if(!val.valDataBaseSetData()){
			return ;
		}
		document.forms.addForm.submit();
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>