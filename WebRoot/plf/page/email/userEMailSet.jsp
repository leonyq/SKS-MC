<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>  
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="定时发送EMail" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}email/userEmailManageAction_addEmailUser.ms" method="post" target="submitFrame">
				<table class="add_table">
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="发件人账号" />
						</td>
						<td style="width: 270px;">
							<input type="text"  lay-verify="checkAcc" autocomplete="off" id="account" name="paraMap.account" maxlength="33" value="<s:property value="ajaxMap.account"/>" class="_VAL_NULL"  />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="发件人密码" />
						</td>
						<td style="width: 270px;">
							<input type="password" style="width: 270px;" lay-verify="required" autocomplete="off" id="pw" maxlength="33" name="paraMap.pw" value="<s:property value="ajaxMap.pw"/>" class="_VAL_NULL layui-input" />
						</td>
					</tr>
					<tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="SMPT地址" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="smtp" lay-verify="checkSmtp" name="paraMap.smtp"  maxlength="20" value="<s:property value="ajaxMap.smtp"/>" class="_VAL_NULL" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="端口号" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="checkPor" id="port_num" maxlength="4" name="paraMap.port_num" value="<s:property value="ajaxMap.port_num"/>" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="是否启用" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict name="paraMap.flag"  dictCode="EMAIL_FLAG" dictValue="${fn:escapeXml(ajaxMap.flag)}" />
						</td>
						
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="账号类型" /></td>
						<td style="width: 270px;">
							<dict:selectDict name="paraMap.account_type"  dictCode="YJ" dictValue="${fn:escapeXml(ajaxMap.account_type)}" />
						</td>
					</tr>
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="go" onclick="/*save(this);*/" class="layui-btn">
					<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>	
				<input type="hidden" id="id" name="paraMap.id" value="<s:property value="ajaxMap.id"/>">
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
	layui.use('form', function(){
  	  	var form = layui.form;
  		form.render("select");
  		form.verify({
  			checkAcc: function(value,item){
  				var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
  				if (!myreg.test(value)) {
  		 			return '请输入正确的邮箱格式，如1234@163.com';
  				}
  			},
  			checkSmtp: function(value,item){
  				if(value.trim()==""){
  					return '必填项不能为空';
  				}
  				var reg = /^[a-zA-Z0-9\\.]{0,}$/;
  				if(!reg.test(value)){
  					return 'SMPT地址，只能由字母、数字、.组成请检查';
  				}
  			},
  			checkPor: function(value,item){
  				if(value.length>0){
  					var reg = /^[0-9]{0,}$/;
  					if(!reg.test(value)){
  						return "端口号，只能是数字组成请检查";
  					}
  				}
  			}
  	    });
  		form.on('submit(go)', function(data){
  			save();
  	 	});
	});
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function save(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!myreg.test($("#account").val())) {
 			util.alert("<dict:lang value='请输入正确的邮箱格式，如1234@163.com' />");
  			return false;
		}
		var reg = /^[a-zA-Z0-9\\.]{0,}$/;
		var smtp=$("#smtp").val();
		if(!reg.test(smtp)){
			util.alert("<dict:lang value="SMPT地址，只能由字母、数字、.组成请检查" />...");
			return ;
		}
		var port_num=$("#port_num").val();
		if(port_num.length>0){
			var reg = /^[0-9]{0,}$/;
			if(!reg.test(port_num)){
				util.alert("<dict:lang value="端口号，只能是数字组成请检查" />...");
				return ;
			}
		}
		
		document.forms.addForm.submit();
		isSubmit = true;
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>