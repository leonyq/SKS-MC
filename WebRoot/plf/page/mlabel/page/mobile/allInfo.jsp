<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8"/> 
  <title>摩尔软件</title> 
  <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no"/> 
  <meta name="apple-mobile-web-app-capable" content="yes" /> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
  <script src="${path}plf/page/mlabel/page/mobile/js/mui.js"></script> 
  <script src="${path}plf/page/mlabel/page/mobile/js/public/public.js"></script> 
  <link rel="stylesheet" href="${path}plf/page/mlabel/page/mobile/css/mui.min.css"/>
  <link rel="stylesheet" type="text/css" href="${path}plf/page/mlabel/page/mobile/css/app.css"/> 
<style>
  	.head-div{
  		width: 100%;
  		height: 0.333rem;
  		background-color: #004098;
  		text-align: center;
  		margin: auto;
  	}
  	.head-div div{
  		color: #ffffff;
  		font-size: 0.141rem;
  		font-family: 黑体;
  		padding-top:0.096rem;
  		display: block;
  		font-weight:bold;
  	}
  	
  	.head-div-user{
  		width: 100%;
  		height: 0.304rem;
  		background-color: #EFEFEF;
  		margin: auto;
  		border-bottom: 1px solid #E1E1E1;
  	}
  	.head-div-user span{
  		color: #999999;
  		font-size: 0.108rem;
  		font-family: 黑体;
  		padding-top:0.0780rem;
  		padding-left:10%;
  		display: block;
  	}
  	.text-content-div{
  		width: 100%;
  		height: 0.45rem;
  		font-size: 0.108rem;
  	}
	input::-webkit-input-placeholder { /* WebKit browsers*/ 
	　　color:#AAAAAA;font-size: 0.108rem;
	　}
	input:-moz-placeholder {  /* Mozilla Firefox 4 to 18*/ 
	　　color:#AAAAAA;font-size: 0.108rem;
	　　}
	input::-moz-placeholder {  /* Mozilla Firefox 19+*/ 
	　　color:#AAAAAA;font-size: 0.108rem;
	　　}
	input:-ms-input-placeholder { /* Internet Explorer 10+*/ 
	　　color:#AAAAAA;font-size: 0.108rem;
	}
	input{
		font-size: 0.108rem;
		height: 0.166rem;
	}
  </style>
 </head> 
 <body style="background-color: #efefef;width: 100%"> 
  <div class="head-div" id="yesDiv">
  		<div>
   		<img src="${path}plf/page/mlabel/page/mobile/img/logo.png" style="height: 0.11rem"><span>&ensp; 共享标签</span>
   		</div>
  </div> 
  
    <div class="head-div" style="display:none;text-align: center;" id="errorDiv">
  		<div  style="height:0.291rem;background-color: #e85a48;font-size:0.108rem;width:100%;text-align: left;">
  				<span id="errorContexnt" style="margin-left:10%;display:block;margin-top: -0.03rem;"></span>
   		</div>
  </div> 
  <div class="head-div-user">
   		<span>申请人认证</span>
  </div> 
  <div style="background-color: #ffffff;">
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 25%;float: left;">
  				<span>手机号</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input placeholder="请输入申请人姓名" style="border: 0px;;padding:0px" id="telephone" value="" readonly="readonly"/>
  				
  			</div>
  		</div>
  		
  </div>
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 25%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>申请人姓名</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input placeholder="请输入申请人姓名" style="border: 0px;padding:0px;height: 0.166rem" type="text" id="userName" onblur="validateUserName()"/>
  			</div>
  		</div>
  		
  </div>
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 25%;float: left;">
  				<span>身份证号</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input placeholder="请输入正确身份证号" style="border: 0px;padding:0px;height: 0.166rem" type="text"  id="idNumber"/>
  			</div>
  		</div>
  		
  </div>
 <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 25%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>电子邮箱</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input placeholder="请输入常用电子邮箱" style="border: 0px;padding:0px;height: 0.166rem" type="text" id="mailbox" onblur="validateMailInfo()"/>
  			</div>
  		</div>
  		
  </div>

	 <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 25%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>企业名称</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input placeholder="请输入企业名称" style="border: 0px;padding:0px;height: 0.166rem" type="text" id="companyName" onblur="validateAllInfo()"/>
  			</div>
  		</div>
  		
  </div>
  
   <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 25%;float: left;">
  				<span>部门</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input placeholder="请输入部门" style="border: 0px;padding:0px;height: 0.166rem" type="text" id="department"/>
  			</div>
  		</div>
  		
  </div>
  
 <div class="text-content-div">
  		<div style="width:90%;height: 100%;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 25%;float: left;">
  				<span>职务</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input placeholder="请输入职务" style="border: 0px;;padding:0px;height: 0.166rem" type="text" id="job"/>
  			</div>
  		</div>
  		
  </div>
 
  		
  </div>
  
  <div style="width: 100%;height: 80px;background-color: #efefef;">
  	<div style="width: 80%;font-size:0.141rem;color:#ffffff;margin-left: 10%;border:  0px solid #004098;height: 0.375rem;margin-top: 25%;border-radius:0.056rem;background-color: #004098;text-align: center" id="submitInfo">
  		<div style="margin-top: 0.117rem;padding-top: 0.100rem" onclick="submitInfoContant()">下一步</div>
  	</div>
  </div>
  <script src="${path}plf/page/mlabel/page/mobile/js/jquery-1.8.0.min.js"></script>
  <script>
  	$(function(){
  		$("#telephone").val(localStorage.telePhone);
  		//localStorage.telePhone="18558760325";
  		//$("#telephone").val("18558760325");
  	
  	})
  	//提交数据到后台
  	function submitInfoContant(){
  		if(validateAllInfo()){
  			var validateId=true;
  			
  			var validateMailTo=true;
  			var validateCompany=true;
  			if($("#idNumber").val()!=""){
  				 var reg = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
  				 if(!reg.test($("#idNumber").val())){
  				 	validateId=false;
  				 	$("#errorDiv").show();
		 			$("#yesDiv").hide();
		 			$("#errorContexnt").html("该身份证格式不正确");
  				 	return false;
  				 }else{
  				 	validateId=validateIdNumber();
  				 }
  				
  			}
  			validateCompany=validateCompanyName();
  			validateMailTo=validateCompanyName();
  			if(validateId&&validateCompany&&validateMailTo){
  				localStorage.proposer=$("#userName").val();
  				localStorage.email=$("#mailbox").val();
  				localStorage.company=$("#companyName").val();
  				localStorage.IDNumber=$("#idNumber").val();
  				localStorage.department=$("#department").val();
  				localStorage.job=$("#job").val();	
  				window.open("${path}buss/bussModel.ms?exeid=b8236183cac84619ba7ebc1735501b5c&FUNC_CODE=F7005","_self");
  			}
  		}
  	}
  	//验证身份号码
  	function validateIdNumber(){
  		var temp=false;
  		$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=valRegister&method=valRegCode&ytype=3",
				data : {
					phone:localStorage.telePhone,
					IDNumber:$("#idNumber").val()
				},
				dataType : "json",
				async: false,
				success : function(data) {
					if(data.checkIDNumberRes=="NG"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("该身份证已被注册");
					}else if(data.checkIDNumberRes=="OK"){
						temp=true;
					}else if(data.checkIDNumberRes=="ZERO"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("证件号为空");
					}
					
					
				},
				error : function(data) {
					alert("系统错误！");
				}
				
			});
			return temp;
  	}
  	//验证公司名称
  	function validateCompanyName(){
  		var temp=false;
  		$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=valRegister&method=valRegCode&ytype=4",
				data : {
					phone:localStorage.telePhone,
					company:$("#companyName").val()
				},
				dataType : "json",
				async: false,
				success : function(data) {
					if(data.checkCompanyRes=="NG"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("该企业已被注册");
					}else if(data.checkCompanyRes=="OK"){
						temp=true;
					}else if(data.checkCompanyRes=="ZERO"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("企业为空");
					}
				},
				error : function(data) {
					alert("系统错误！");
				}
				
			});
  		return temp;
  	}
  	//验证企业邮箱
  	function validateMail(){
  	var temp=false;
  		$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=valRegister&method=valRegCode&ytype=5",
				data : {
					phone:localStorage.telePhone,
					email:$("#mailbox").val()
				},
				dataType : "json",
				async: false,
				success : function(data) {
					if(data.checkEmailRes=="NG"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("该邮箱已被注册");
					}else if(data.checkEmailRes=="OK"){
						temp=true;
					}else if(data.checkEmailRes=="ZERO"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("邮箱为空");
					}
				},
				error : function(data) {
					alert("系统错误！");
				}
				
			});
  		return temp;
  	}
  	
  	
  	
  	
  	//验证信息
  	function validateAllInfo(){
  		if($("#userName").val()==""){
  			$("#errorDiv").show();
		 	$("#yesDiv").hide();
		 	$("#errorContexnt").html("申请人姓名不为空");
		 	return false;
  		} 
  		
  		
  		if($("#mailbox").val()==""){
  			$("#errorDiv").show();
		 	$("#yesDiv").hide();
		 	$("#errorContexnt").html("邮箱不为空");
		 	return false;
  		} 
  		var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
  		var mailbox=$("#mailbox").val();
  		
  		if(!reg.test(mailbox)){
  			$("#errorDiv").show();
		 	$("#yesDiv").hide();
		 	$("#errorContexnt").html("邮箱格式不正确");
		 	return false;
  		}
  		if($("#companyName").val()==""){
  			$("#errorDiv").show();
		 	$("#yesDiv").hide();
		 	$("#errorContexnt").html("企业名称不为空");
		 	return false;
  		} 
  		$("#errorDiv").hide();
	 	$("#yesDiv").show();
  		return true;
  	}
  	
  	//验证公司名称
  	function validateUserName(){
  		if($("#userName").val()==""){
  			$("#errorDiv").show();
		 	$("#yesDiv").hide();
		 	$("#errorContexnt").html("申请人姓名不为空");
		 	return false;
  		} 
  		$("#errorDiv").hide();
	 	$("#yesDiv").show();
	 	return true;
  		
  	}
  	
  	function validateMailInfo(){
  		if($("#userName").val()==""){
  			$("#errorDiv").show();
		 	$("#yesDiv").hide();
		 	$("#errorContexnt").html("申请人姓名不为空");
		 	return false;
  		} 
  		
  		
  		if($("#mailbox").val()==""){
  			$("#errorDiv").show();
		 	$("#yesDiv").hide();
		 	$("#errorContexnt").html("邮箱不为空");
		 	return false;
  		} 
  		var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
  		var mailbox=$("#mailbox").val();
  		
  		if(!reg.test(mailbox)){
  			$("#errorDiv").show();
		 	$("#yesDiv").hide();
		 	$("#errorContexnt").html("邮箱格式不正确");
		 	return false;
  		}
  		$("#errorDiv").hide();
	 	$("#yesDiv").show();
	 	return true;
  	}
  	
  	
  </script>
 </body>
</html>