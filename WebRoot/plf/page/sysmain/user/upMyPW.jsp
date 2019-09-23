<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="个人信息修改" /></title>
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
			
			
		</style>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
		</jsp:include>
		<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body style="background-color: #fff;">
	<div class="edit">
            		
			<div class="bd" style="border:none;">
	<form id="up_form" name="up_form" action="${path}sys/UserAction_upMyPW.ms" method="post" target="submit_frame">
		<div>
			<table class="main"><%--
		        <tr>
					<td style="width: 35%;text-align: right;"><span class="dot"></span><dict:lang value="用户名称" /></td>
					<td>
						<input type="text" id="userDto_name" name="userDto.name" class="user-defind-input input"  value="<s:property value="userDto.name" />" maxlength="15" style="width: 200px;"/>
						<span class="Eng"><span id="userDto_name_err">${errors["userDto.name"][0]}</span></span>
									
					</td>
		       </tr>
		        --%><tr>
					<td style="text-align: right;"><dict:lang value="原密码" /></td>
					<td>
						<input type="password" id="userDto_pw" name="userDto.pw" class="user-defind-input input" maxlength="60" style="width: 200px;">
						<span class="Eng"><span id="userDto_pw_err"><c:out value='${errors["userDto.pw"][0]}' /></span></span>
					</td>
		       </tr>
		        <tr>
					<td style="text-align: right;"><dict:lang value="新密码" /></td>
					<td>
						<input type="password" id="userDto_pwNew" class="user-defind-input input" name="userDto.pwNew" maxlength="60" style="width: 200px;">
						<span class="Eng"><span id="userDto_pwNew_err"><c:out value='${errors["userDto.pwNew"][0]}' /></span></span>
					</td>
		       </tr>
		        <tr>
					<td style="text-align: right;"><dict:lang value="确认密码" /></td>
					<td>
						<input type="password" id="userDto_pwNewCk" class="user-defind-input input" name="userDto.pwNewCk" maxlength="60" style="width: 200px;">
						<span class="Eng"><span id="userDto_pwNewCk_err"><c:out value='${errors["userDto.pwNewCk"][0]}' /></span></span>
					</td>
		       </tr>
		       <tr>
		       		<td></td>
		       		<td>
						<button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存"/></button>
						<button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value="重置"/></button>
    
					</td>
		       </tr>
		     </table>
   		</div>
		
     </form>
   </div>
</div>
	<div style="display: none;">
	<iframe id="submit_frame" name="submit_frame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">	
	var pwFlag = true;
	$(function(){
		$("#userDto_pw").blur(function(){
			var _this = $(this);
			var userDto_pw  = _this.val();
			if(userDto_pw == ""){
				_alertValMsg(_this,"<dict:lang value="原密码不能为空" />");
				return;
			}
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/UserAction_validatePw.ms",
			    data: {"userDto_pw":userDto_pw},
				success: function(data){
						if(!data.success){
							pwFlag = false;
							_alertValMsg(_this,data.info);
						}else{
							pwFlag = true;
						}
					},
				error: function(msg){
						util.alert("error:"+msg.responseText);
				  }
				});
		});
	});
	
	var editButObj;
	var resetButObj = document.getElementById("resetBut");
	function edit(thisObj){
		editButObj = thisObj;
		if(!valData()){
			return ;
		}
		document.forms.up_form.submit();
		thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="数据正在提交，请稍候..." />",0,"300","");}
	}
    
    function valData(){
    	
    	var userDtoPw = $("#userDto_pw").val(); 
    	
    	var userDtoPwNew = $("#userDto_pwNew").val();
    	
    	if(userDtoPw==""){
    		_alertValMsg($("#userDto_pw"),"<dict:lang value="原密码不能为空！" />");
    		return false;
    	}
    	
    	if(!pwFlag){
    		_alertValMsg($("#userDto_pw"),"<dict:lang value="原密码错误,请重新输入！" />");
    		return false;
    	}
    	
    	userDtoPwNew = util.allTrim(userDtoPwNew);
    /* 	var regex = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{6,20}');
    	if(!regex.test(userDtoPwNew)){
    		_alertValMsg($("#userDto_pwNew"),"<dict:lang value="密码中必须包含字母、数字、特殊字符，且字符长度仅限6~20个！" />");
    		return ;
    	} */
    	//var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
    	var reg = /^(?=.*[0-9])(?=.*[a-zA-Z])(.{6,20})$/;
    	if(!reg.test(userDtoPwNew)){
    		//alert("密码由数字和字母组成，且字符长度仅限6~20个！");
    		utilsFp.confirmIcon(3,"","","", "<dict:lang value="密码至少由数字和字母组成，且字符长度仅限6~20个！" />",0,0,0);
    		return ;
    	}
    	/* if(userDtoPwNew==""|| userDtoPwNew.length<6){
   			_alertValMsg($("#userDto_pwNew"),"<dict:lang value="新密码不能为空,并且密码长度不得低于6个字符" />");
   			$("#userDto_pwNew").focus();
    		return false;
    	} */
    	var userDtoPwNewCk = util.allTrim($("#userDto_pwNewCk").val());

    	if(userDtoPwNew !=userDtoPwNewCk){
   			_alertValMsg($("#userDto_pwNewCk"),"<dict:lang value="两次输入的密码不一致" />");
   			$("#userDto_pwNewCk").focus();
    		return false;
    	}
    	$("#userDto_pwNew").val(userDtoPwNew);
    	$("#userDto_pwNewCk").val(userDtoPwNewCk);
    	return true;
    }
    
    function reloadPg(msg){
     editButObj.onclick = function(){edit(editButObj);}
     if(undefined != msg && "" != msg){
    	var index = msg.lastIndexOf('successFlag');
		if(index<0){
			utilsFp.confirmIcon(3,"","","", msg,0,"250","");
			return ;
		}
		$("#userDto_pw,#userDto_pwNew,#userDto_pwNewCk").val("");
		utilsFp.confirmIcon(2,"","","", "<dict:lang value="修改成功" />",0,"250","");
     }else{
    	utilsFp.confirmIcon(3,"","","", "<dict:lang value="修改出错" />",0,"250","");
     }
    }
    
    function reloadPgCf(msg){
		parent.topFrame.location.href = "${path}/plf/page/sysmain/main/top.jsp";
		window.location.href = "${path}sys/UserAction_showUpMyUser.ms";
    }
    
    function goToMain(){
    	window.location.href = "<%=CommMethodMc.getMainFrameUrl(request)%>";
    }
	//重置	
	function resetForm(){
		$("#up_form")[0].reset();
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>