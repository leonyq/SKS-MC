<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="服务配置" /> <dict:lang value="修改" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}webservice/ServerMgrAction_editConfig.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口名称" />
						</td>
						<td style="width: 270px;">
							<s:textfield id="name" maxlength="100" name="config.name" cssClass="_VAL_NULL _VAL_DATABASE"></s:textfield>
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="类源码" />
						</td>
						<td style="width: 270px;">
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
							<s:textfield id="className1" name="config.className" cssClass="_VAL_NULL input_indent" ></s:textfield>
							<i class="layui-icon layui-icon-search" onclick="showEditCode();" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
							<s:hidden id="codeType" name="config.codeType"></s:hidden>
							<s:hidden id="classId" name="config.classId"></s:hidden>
							<s:hidden id="classCode" name="config.classCode"></s:hidden>
							<%-- <a href="javascript:void(0);" onclick="showEditCode();">
								<dict:lang value="编辑" />
							</a>--%>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口说明" />
						</td>
						<td style="width: 270px;">
							<s:textfield id="memo" maxlength="200" name="config.memo" cssClass="_VAL_NULL _VAL_DATABASE" ></s:textfield>
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="服务器类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict id="type" name="#config.type" dictCode="WS_SERVER_TYPE" cssClass="_VAL_NULL" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="自定义实现类" />
						</td>
						<td colspan="4">
								<select  name="config.userClassName">
									<s:iterator id="map" value="userClassMap">
										<s:if test="#map['CLASS_NAME'] == config.userClassName">
											<option value="<s:property value="#map['CLASS_NAME']"/>" selected="selected"><s:property value="#map['CLASS_NAME']"/></option>
										</s:if>
										<s:else>
										<option value="<s:property value="#map['CLASS_NAME']"/>"><s:property value="#map['CLASS_NAME']"/></option>
										</s:else>
									</s:iterator>
								</select>
						</td>
						
					</tr>  
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="配置模板" />
						</td>
						<td colspan="4">
							<textarea id="configDeclare" lay-verify="required" name="config.configDeclare"  rows="9" style="width:100%" class="_VAL_NULL"> </textarea>
						</td>
					</tr> 
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="*" onclick="/*add(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<s:hidden name="config.id"></s:hidden>
				<s:hidden  name="config.moduleId" ></s:hidden>
				<s:hidden name="config.createUserId"></s:hidden>
				<s:hidden name="config.createTime"></s:hidden>
				<s:hidden name="config.deptId"></s:hidden>
				<input
					type="hidden" name="paraMap.MC_ID_MYSQL"
					value="<s:property value="dataMap.MC_ID_MYSQL" />" /><input
					type="hidden" name="paraMap.MC_ID_SQLSERVER"
					value="<s:property value="dataMap.MC_ID_SQLSERVER" />" /><input
					type="hidden" name="paraMap.MC_ID_ORACLE"
					value="<s:property value="dataMap.MC_ID_ORACLE" />" /><input
					type="hidden" name="paraMap.MC_ID_BASE"
					value="<s:property value="dataMap.MC_ID_BASE" />" /><input
					type="hidden" name="paraMap.MC_ID_PG"
					value="<s:property value="dataMap.MC_ID_PG" />" />
				<input type="hidden" id="MWNM_ID" name="config.MWNM_ID" value="<s:property value="paraMap.id"/>"/>
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
	$(function(){
		$("#name").attr("lay-verify","required|checkName");
		$("#className1").attr("lay-verify","required");
		$("#className1").attr("readonly","readonly");
		$("#memo").attr("lay-verify","required");
	});
	layui.use('form', function(){
		  var form = layui.form;
		  form.render("select");
		  form.verify({
			  checkName: function(value,item){
				  var myReg = /^[a-zA-Z0-9_]{0,}$/;
					if(!myReg.test(value)){
						return "接口名称只能是字母、数字、_";
					}
			  }
		  });
		  form.on('submit(*)', function(data){
			  add();
		 		 
		 	});
	});
	function showEditCode(){
		//var url = "${path}webservice/ServerMgrAction_toEditCode.ms";
		var piframeName = window.frameElement.name;
		//console.log(piframeName);
		var classId=$("#classId").val();
		var url = "${path}webservice/ServerMgrAction_toEditCode.ms?paraMap.tableName=MS_WS_SERVER&paraMap.tpl=wssImpl&paraMap.colName=CLASS_ID&paraMap.CODE_ID="+classId+"&paraMap.piframeName="+piframeName+"&paraMap.toFlag=interface";
		
		showPopWin(url, '99%', '99%',null,"<dict:lang value="修改类源码"/>");
	}
	
	function updateCodeData(codeType,className,classCode) {
		$("#codeType").val(codeType);
		$("#className1").val(className);
		$("#classCode").val(classCode);
	}
	
	var isSubmit = false;
	
	
	function reloadPg(msg){
		isSubmit = false;
		var obj = {};
		obj.isFramesetMethod=true;
		obj.methodName="reloadPg";
		obj.frameName="mainFrame";
		obj.methodParames=msg;
		runMethod(obj);
		//window.parent.reloadPg(msg);
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
		if(!val.valDataBaseSetData()){
			return ;
		}
		var name = $("#name").val();
		var myReg = /^[a-zA-Z0-9_]{0,}$/;
		if(!myReg.test(name)){
			util.alert("<dict:lang value="接口名称只能是字母、数字、_" />");
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