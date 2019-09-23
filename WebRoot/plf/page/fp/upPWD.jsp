<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="第一次登录修改密码页面" /></title>
		<style>
			.main{
				width:100%;
				margin-top:90px;
			}
			
			.main tr td:nth-of-type(1){
				vertical-align: top;
			}
			
			.main tr td:nth-of-type(2){
				padding-left:10px;
			}
			
			.main tr td input{
				margin-bottom:15px;
			}
			
			.main tr td button{
				background-color:#aace36;
				font-size:14px;
				width:70px;
				height:28px;
				border:none;
				color:#fff;
				margin-right:15px;
				cursor:pointer;
			}
			
			.main tr td button:hover{
				background-color:#99b932;	
			}
			.pwd_tip {
				background-color: #ffedde;
				color: #fc8923;
				font-size: 14px;
				padding: 10px 0px;
				text-align: center;
				margin: 20px 0 10px 0;
			}
			.pwd_tip .layui-icon-tips {
				font-weight: bold;
				margin-right: 5px;
			}
			
		</style>
		<%-- 
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
			<jsp:param name="popDivWinFp" value="1" />
			<jsp:param name="chosen" value="1" />
		</jsp:include>--%>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
		<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%-- <%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>--%>
	</head>
<body style="overflow-y: hidden;" >
	<div class="all">
            		
			<div class="add_table_div" >
	<form id="up_form" class="layui-form" name="up_form" method="post" target="submit_frame">
	
			<div class="pwd_tip"><i class="layui-icon layui-icon-tips"></i>密码至少由数字和字母组成，且字符长度仅限6~20个</div>
 
			<table class="add_table">
		        <tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
						<dict:lang value="新密码" />
					</td>
					<td colspan="3">
						<input type="password" id="userDto_pwNew" lay-verify="checkNew" class=" layui-input" name="userDto.pwNew" maxlength="60" style="width: 80%;">
						<span class="Eng"><span id="userDto_pwNew_err"><c:out value='${errors["userDto.pwNew"][0]}' /></span></span>
					</td>
		       </tr>
		        <tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
						<dict:lang value="确认密码" />
					</td>
					<td colspan="3">
						<input type="password" id="userDto_pwNewCk" lay-verify="checkDou" class=" layui-input" name="userDto.pwNewCk" maxlength="60" style="width: 80%;">
						<span class="Eng"><span id="userDto_pwNewCk_err"><c:out value='${errors["userDto.pwNewCk"][0]}' /></span></span>
					</td>
		       </tr>
		       <%--<tr>
		       		<td></td>
		       		<td>
						<button type="button" onclick="editPwdMsg(this);"><dict:lang value="保存"/></button>
						<button type="button" onclick="resetForm();"><dict:lang value="重置"/></button>
    
					</td>
		       </tr> --%>
		     </table>
		     
		     <div class="ptop_10 txac">
					
					<input type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="*" onclick="/*editPwdMsg(this);*/" class="layui-btn">
					<input type="button" value="<dict:lang value="重置" />" onclick="resetForm();" class="layui-btn layui-btn-primary">
			</div>
		     <input type="hidden" id="login_name" class="user-defind-input input" name="userDto.loginName" value="<s:property value="paraMap.loginName"/>">
			 <input type="hidden" id="flag" class="user-defind-input input" name="paraMap.flag" value="<s:property value="paraMap.flag"/>"> 
			 <input type="hidden" id="hidden_language" class="user-defind-input input" name="paraMap.language" value="<s:property value="paraMap.language"/>">		
   		
		
     </form>
   </div>
</div>
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">	
	var const_pwd_isinvaild_msg = "不符合密码规则!";//"密码由数字和字母组成，且字符长度仅限6~20个";
	var const_pwd_twicenotsame = "两次输入的密码不一致!";
	var editButObj;
 
	var resetButObj = document.getElementById("resetBut");
	layui.use('form', function(){
		var form = layui.form;
		form.verify({
			checkNew: function(value,item){
				var userDtoPwNew = util.allTrim($("#userDto_pwNew").val());
				if(userDtoPwNew=="" || userDtoPwNew.length<6){
		   			$("#userDto_pwNew").focus();
		    		return const_pwd_isinvaild_msg;// "<dict:lang value="+eval(const_pwd_isinvaild_msg)+" />";
		    	}
				//var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
				var reg = /^(?=.*[0-9])(?=.*[a-zA-Z])(.{6,20})$/;
		    	if(!reg.test(userDtoPwNew)){
		    		//alert("密码由数字和字母组成，且字符长度仅限6~20个！");
		    		return const_pwd_isinvaild_msg;//"密码由数字和字母组成，且字符长度仅限6~20个";
		    	}
			},
			checkDou: function(value,item){
				var userDtoPwNew = util.allTrim($("#userDto_pwNew").val());
		    	var userDtoPwNewCk = util.allTrim($("#userDto_pwNewCk").val());
		    	if(userDtoPwNew !=userDtoPwNewCk){
		   			//_alertValMsg($("#userDto_pwNewCk"),"<dict:lang value="两次输入的密码不一致" />");
		   			$("#userDto_pwNewCk").focus();
		    		return const_pwd_twicenotsame;//"<dict:lang value="两次输入的密码不一致" />";
		    	} 
			}
	    });
		 form.on('submit(*)', function(data){
			 editPwdMsg();
		 });
	});
	function editPwdMsg(thisObj){
		if(!valData()){
			return ;
		}
		util.showLoading("修改密码中,请稍后...");
		$.ajax({
		type: "POST",
	    dataType: "json",
	    data:$("#up_form").serialize(),
	    url: "${path}fp/FpAction_updatePwd.ms",
		success: function(data){
			util.closeLoading();
			var checkUser = data.ajaxMap.checkUser;
 			if(checkUser.result) {
 				parent.toMainFrameFp();
 			}else{
 				util.closeLoading();
 				alert(checkUser.msg);
 			}
		},
		error: function(msg){
			util.closeLoading();
			alert("密码修改失败"+msg);
		}
	});
	
	}
    
    function valData(){    	
    	var userDtoPwNew = util.allTrim($("#userDto_pwNew").val());
    	var userDtoPwNewCk = util.allTrim($("#userDto_pwNewCk").val());
    	
    	if(userDtoPwNew=="" || userDtoPwNew.length<6){
   			//_alertValMsg($("#userDto_pwNew"),"<dict:lang value="新密码不能为空,并且密码长度不得低于6个字符" />");
   			$("#userDto_pwNew").focus();
    		return false;
    	}
    	 if(userDtoPwNew !=userDtoPwNewCk){
   			//_alertValMsg($("#userDto_pwNewCk"),"<dict:lang value="两次输入的密码不一致" />");
   			$("#userDto_pwNewCk").focus();
    		return false;
    	} 
    	//var regex = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{6,20}');
    	var reg = /^(?=.*[0-9])(?=.*[a-zA-Z])(.{6,20})$/;
    	if(!reg.test(userDtoPwNew)){
    		//alert("密码由数字和字母组成，且字符长度仅限6~20个！");
    		alert(const_pwd_isinvaild_msg);
    		return false;
    	}
    	$("#userDto_pwNew").val(userDtoPwNew);
    	$("#userDto_pwNewCk").val(userDtoPwNewCk);
    	return true;
    }
	//重置	
	function resetForm(){
		$("#up_form")[0].reset();
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>