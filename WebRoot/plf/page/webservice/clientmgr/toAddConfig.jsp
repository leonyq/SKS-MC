<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="服务配置" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}webservice/ClientMgrAction_addConfig.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.UP_ID" />
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="服务器类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict id="type" name="config.type" dictCode="WS_CLIENT_TYPE" cssClass="_VAL_NULL" />
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口包路径" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required|checkPath" id="packagePath" name="config.packagePath" class="_VAL_NULL" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口描述文件地址" />
						</td>
						<td colspan='4'>
							<input type="text" lay-verify="required" id="serverAddress" name="config.serverAddress" class="_VAL_NULL" style="width:100%" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="接口说明" />
						</td>
						<td  colspan='4'>
							<input id="memo" type="text" maxlength="65" name="config.memo"  style="width:100%;"></input>
						</td>
					</tr> 
						<td colspan="5">
							<blockquote class="layui-elem-quote">
							<span class="Point"><dict:lang value="点击“生成类源码”按钮，填充" /> </span>
							</blockquote>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="接口名称" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required" id="name" name="config.name" class="_VAL_NULL"  readonly="readonly"/>
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="类源码" />
						</td>
						<td style="width: 270px;">
							<div id="paraMap_SEARCH_UI_div" style="" class="layui-input-inline">
							<input type="text" id="stubFullName" lay-verify="required" name="config.stubFullName"  value="" class="_VAL_NULL input_indent" readonly="readonly"/>
							<i class="layui-icon layui-icon-search" onclick="viewCode();" style="position: absolute;top:11px;right: 8px;"></i>
							</div>
							<textarea  id="stubCode" name="config.stubCode" style="display:none"></textarea>
							<%-- 
							<a href="javascript:void(0);" onclick="viewCode();">
								<dict:lang value="查看" />
							</a>--%>
						</td>
					</tr> 
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="生成类源码" />"  onclick="genClientCode(this);" class="layui-btn layui-btn-normal">
				
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="go" onclick="/*add(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<s:hidden  name="config.moduleId" ></s:hidden>
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
	layui.use('form', function(){
		  var form = layui.form;
		  form.render("select");
		  form.verify({
			  checkPath: function(value,item){
				  var reg = /^[a-zA-Z0-9\\.]{0,}$/;
					if(!reg.test(value)){
						return "接口包路径，只能由字母、数字、.组成请检查";
					}
				  }
		  });
		  form.on('submit(go)', function(data){
			  add();
		  });
	});
	function viewCode(){
		var url = "${path}webservice/ClientMgrAction_toViewCode.ms?paraMap.piframeName="+window.frameElement.name;
		showPopWin(url, '99%', '99%',null,"<dict:lang value="查看源码"/>");
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
	function genClientCode(thisObj) {
		if(!val.valNullData("#packagePath","#serverAddress")){
			return ;
		}
		var reg = /^[a-zA-Z0-9\\.]{0,}$/;
		var packPath=$("#packagePath").val();
		if(!reg.test(packPath)){
			util.alert("<dict:lang value="接口包路径，只能由字母、数字、.组成请检查" />...");
			return ;
		}
		util.showLoading("正在生成客户端代码,请稍后...");
		$.ajax({
			type : "POST",
			dataType : "json",
			data:{
				"config.packagePath":$("#packagePath").val(),
				"config.serverAddress":$("#serverAddress").val()
			},
			url : '${path}webservice/ClientMgrAction_genClientCode.ms',
			success : function(data) {
				if(data.ajaxMap != null && data.ajaxMap.msg != null){
							util.closeLoading();
							util.alert("error:"+data.ajaxMap.msg);
							return ;
				}
				util.closeLoading();
				$("#stubFullName").val(data.ajaxMap.config.stubFullName);
				$("#stubCode").text(data.ajaxMap.config.stubCode);
				$("#name").val(data.ajaxMap.config.name);
				
			},
			error : function(msg) {
			}
		});
	}
	function add(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		document.forms.addForm.submit();
		isSubmit = true;
	}
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>