<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="服务配置" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
			<form id="addForm" name="addForm" action="${path}webservice/ServerMgrAction_addConfig.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				<table class="add_table">
					<tr>
						<td colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="接口名称" /><span class="Eng">*</span>
						</td>
						<td width="35%">
							<input type="text" maxlength="100" id="name" name="config.name" class="_VAL_NULL _VAL_DATABASE" style="width:80%" />
						</td>
						<td width="15%" class="tr1">
							<dict:lang value="类源码" /><span class="Eng">*</span>
						</td>
						<td width="35%">
							<input type="text" id="className" readOnly="readOnly" name="config.className"  value="" class="_VAL_NULL" style="width:80%" />
							<input type="hidden" id="codeType" name="config.codeType" value=""/>
							<textarea type="hidden" id="classCode" name="config.classCode" style="display:none"></textarea>
							<a href="javascript:void(0);" onclick="showEditCode('<s:property value="dataMap.MS_CLASS_CODE_ID"/>','<s:property value="dataMap.ID"/>','MS_CLASS_CODE_ID','MS_CLASS_CODE_ID','<s:property value="@com.more.fw.core.common.method.ConstantsMc@MS_COMM_CLASS_REL_"/>');">
								<dict:lang value="编辑" />
							</a>
						</td>
					</tr> 
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="接口说明" /><span class="Eng">*</span>
						</td>
						<td width="35%">
							<input type="text" maxlength="200" id="memo" name="config.memo" class="_VAL_NULL _VAL_DATABASE" style="width:80%" />
						</td>
						<td width="15%" class="tr1">
							<dict:lang value="服务器类型" /><span class="Eng">*</span>
						</td>
						<td width="35%">
							<dict:selectDict id="type" name="config.type" dictCode="WS_SERVER_TYPE" cssClass="_VAL_NULL" />
						</td>
					</tr> 
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="自定义实现类" />
						</td>
						<td width="85%" colspan="3">
								<select style="width:80%" name="config.userClassName">
									<option value="" selected="selected">===请选择===</option>
									<s:iterator id="map" value="userClassMap">
										<option value="<s:property value="#map['CLASS_NAME']"/>"><s:property value="#map['CLASS_NAME']"/></option>
									</s:iterator>
								</select>
						</td>
						
					</tr> 
					<tr>
						<td width="15%" class="tr1">
							<dict:lang value="配置模板" /><span class="Eng">*</span>
						</td>
						<td width="75%" colspan="3">
							<textarea id="configDeclare"  name="config.configDeclare"  rows="15" style="width:100%" class="_VAL_NULL" ></textarea>
						</td>
					</tr> 
				</table>
				<s:hidden  name="config.moduleId" ></s:hidden>1111111
				<input type="hidden" id="MWNM_ID" name="config.MWNM_ID" value="<s:property value="paraMap.id"/>"/>
			</form>
		</div>
		<div class="ptop_10 txac">
			<input type="button" value="<dict:lang value="提交" />" onclick="add(this);" class="botton_img_add">
			&nbsp;&nbsp;
			<input type="button" value="<dict:lang value="关闭" />" onclick="parent.closePopWin();" class="botton_img_search">
		</div>
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	
	function showEditCode(codeId,OWNER_ID,CLASS_NAME_TEXT_ID,colName,OWNER_TYPE){
		var url = "${path}webservice/ServerMgrAction_toEditCode.ms";
		showPopWin(url, "99%", "99%",null,"<dict:lang value="修改类源码"/>");
	}
	
	function updateCodeData(codeType,className,classCode) {
		$("#codeType").val(codeType);
		$("#className").val(className);
		$("#classCode").val(classCode);
	}
	
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
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		if($("#classCode").val()==""||$("#classCode").val()==null){
			util.alert("请先编辑类源码！");
			return ;
		}
		document.forms.addForm.submit();
		isSubmit = true;
	}
	
	$(function() {
		$.ajax({
			type : "GET",
			dataType : "json",
			url : '${path}webservice/ServerMgrAction_getConfigModel.ms',
			success : function(data) {
				$("#configDeclare").text(data.ajaxMap.model);
			},
			error : function(msg) {
			}
		});
	});
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>