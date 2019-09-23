<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8"/> 
  <title>摩尔软件</title> 
  <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no" /> 
  <meta name="apple-mobile-web-app-capable" content="yes" /> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
   <script src="${path}plf/page/mlabel/page/mobile/js/jquery-1.8.0.min.js"></script> 
  <link rel="stylesheet" href="${path}plf/page/mlabel/page/mobile/css/mui.min.css" />
  <link rel="stylesheet" type="text/css" href="${path}plf/page/mlabel/page/mobile/css/app.css"/> 
  <link href="${path}plf/page/mlabel/page/mobile/css/mui.picker.css" rel="stylesheet" />
  <link href="${path}plf/page/mlabel/page/mobile/css/mui.poppicker.css" rel="stylesheet" />
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
	.more-but{
		border-radius:3px;
		border:1px solid #43565f; 
		width:15px; 
		height:15px; 
		cursor:pointer;
		font-weight:bold;
		margin-right:5px;
		background: url(${path}plf/page/mlabel/page/mobile/img/ico-more.png);
		background-size:cover;
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
   		<span>企业认证</span>
  </div> 
  <div style="background-color: #ffffff;">
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>企业全称</span>
  			</div>
  			<div style=";width: 80%;float: left;">
  				<input placeholder="请填写企业全称" style="border: 0px;height: 0.166rem;width: 90%;" id="company" readonly="readonly"/>
  			</div>
  		</div>
  		
  </div>
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span>企业法人</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input placeholder="请填写法人代表" style="border: 0px;padding:0px;height: 0.166rem;" id="legalPerson" type="text"/>
  			</div>
  		</div>
  		
  </div>
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>所属行业</span>
  			</div>
  			<div style="width: 80%;float: left;">
  				<div style="width: 100%" id='showUserPicker'>
  				<div style="color:#AAAAAA;font-size: 0.108rem;width: 80%;float: left;word-break:keep-all;white-space:nowrap;   overflow:hidden;" id="industryInfo">请选择</div><img src="${path}plf/page/mlabel/page/mobile/img/ico-more.png" style="width: 0.07rem;margin-left: 9%;margin-top: 0.01rem;" >
  				</div>
  			</div>
  		</div>
  </div>
 <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>所在城市</span>
  			</div>
  			<div style="width: 80%;float: left;" id="showCityPicker">
  				<div style="width: 100%">
					<div style="color:#AAAAAA;font-size: 0.108rem;width: 80%;float: left;word-break:keep-all;white-space:nowrap;overflow:hidden;" id="cityResult3">请选择</div><img src="${path}plf/page/mlabel/page/mobile/img/ico-more.png" style="width: 0.07rem;margin-left: 9%;margin-top: 0.01rem;" >
  				</div>
  			</div>
  		</div>
  		
  </div>
  
  <div class="text-content-div" style="height: 0.9rem;">
  		<div style="width:90%;height: 100%;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>详细地址</span>
  			</div>
  			<div style=";width: 80%;float: left;">
  				
  				<textarea rows="3" cols="10" style="border: 0px;padding:0px;font-size: 0.108rem" id="detailAddr"></textarea>
  			</div>
  		</div>
  		
  </div>
  </div>
  <div style="width: 100%;height: 80px;background-color: #efefef;">
  
  	<div style="width: 80%;font-size:0.141rem;color:#ffffff;margin-left: 10%;border:  0px solid #004098;height: 0.375rem;margin-top: 20%;border-radius:0.056rem;background-color: #004098;text-align: center" id="submitInfo">
  		<div style="margin-top: 0.117rem;padding-top: 0.100rem" onclick="openNextPage()">提交完成</div>
  	</div>
  </div>
 	  <div class="mui-popup mui-popup-in" style="display: none;width: 100%;height: 100%;background-color: #000000;opacity:0.5;border-radius: 0px;">
  		
  </div>
  <div class="mui-popup mui-popup-in" style="display: none;">
	  <div class="mui-popup-inner">
	  	<img src="${path}plf/page/mlabel/page/mobile/img/ico-success.png" style="width: 0.416rem;margin-top: 0.1rem;">
	  	<div style="font-size:0.15rem ;margin-top: 0.05rem;" >注册成功</div>
	  	<div style="font-size:0.1083rem;color: #666666;margin-top: 0.05rem;">
	  		<span>请在PC端(http://morelabel.cn/)</span><br/>
	  		<span>登录使用</span>
	  	</div>
	  	
	  	<div style='background-color: #004098;width: 100%;height:0.375rem;margin-top: 0.1rem;border-radius:0.056rem;' onclick="goHomePage()">
	  	
	  		<span style="color: #ffffff;display: block;font-size:0.141rem;padding-top: 0.117rem;">确定</span>
	  	</div>
	  	
	  </div>
	  
  </div>
 
   <script src="${path}plf/page/mlabel/page/mobile/js/mui.js"></script> 
  <script src="${path}plf/page/mlabel/page/mobile/js/mui.picker.js"></script>
	<script src="${path}plf/page/mlabel/page/mobile/js/mui.poppicker.js"></script>
	<script src="${path}plf/page/mlabel/page/mobile/js/city.data.js" type="text/javascript" charset="utf-8"></script>
	<script src="${path}plf/page/mlabel/page/mobile/js/city.data-3.js" type="text/javascript" charset="utf-8"></script>
  <script src="${path}plf/page/mlabel/page/mobile/js/public/public.js"></script> 
  <script>
  $(function(){
  		$("#company").val(localStorage.company);
  		localStorage.province="";
  		localStorage.city="";
  		localStorage.industry="";
  	});
  
  function openNextPage(){
  	if(localStorage.industry==""){
  		$("#errorDiv").show();
		$("#yesDiv").hide();
		$("#errorContexnt").html("请选择所属行业");
		return false;
  	}
  	
  	if(localStorage.province==""){
  		$("#errorDiv").show();
		$("#yesDiv").hide();
		$("#errorContexnt").html("请选择归属城市");
		return false;
  	}
  	
  	if($("#detailAddr").val()==""){
  		$("#errorDiv").show();
		$("#yesDiv").hide();
		$("#errorContexnt").html("请填写详细地址");
		return false;
  	}
  	localStorage.detailAddr=$("#detailAddr").val();	
  	
  		$.ajax({
				type : "post",
				url : "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6369&funcMId=c458fd0f52a14bf7b0ec73747998ed16&saveType=mobile",
				data : {
					tel:localStorage.telePhone,
					proposer:localStorage.proposer,
					email:localStorage.email,
					company:localStorage.company,
					IDNumber:localStorage.IDNumber,
					department:localStorage.department,
					legalPerson:$("#legalPerson").val(),
					industry:localStorage.industry,
					province:localStorage.province,
					city:localStorage.city,
					detailAddr:localStorage.detailAddr	
				},
				dataType : "json",
				async: false,
				success : function(data) {
					if(data.ajaxString=="OK"){
						$(".mui-popup-in").show();
						$("#errorDiv").hide();
						$("#yesDiv").show();
					}else if(data.ajaxString=="EXISTS"){
						$("#errorDiv").show();
						$("#yesDiv").hide();
						$("#errorContexnt").html("该用户已存在");
					}else if(data.ajaxString=="NG"){
						$("#errorDiv").show();
						$("#yesDiv").hide();
						$("#errorContexnt").html("注册失败");
					}
					
				},
				error : function(data) {
					console.log(data);
					alert("系统错误！");
				}
			});
  	
	  //$(".mui-popup-in").show();
	}
  </script>
  <script>
			(function($, doc) {
				$.init();
				$.ready(function() {
					/**
					 * 获取对象属性的值
					 * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
					 * @param {Object} obj 对象
					 * @param {String} param 属性名
					 */
					var _getParam = function(obj, param) {
						return obj[param] || '';
					};
					//普通示例
					var userPicker = new $.PopPicker();
					var industryArray=gainIndustry();//获取行业
					userPicker.setData(industryArray);
					var showUserPickerButton = doc.getElementById('showUserPicker');
					var userResult = doc.getElementById('industryInfo');
					showUserPickerButton.addEventListener('tap', function(event) {
						userPicker.show(function(items) {
							userResult.innerText = _getParam(items[0], 'text');
							localStorage.industry= _getParam(items[0], 'value');
							userResult.style.color="#000000";
							hideErrorInfo();
							//返回 false 可以阻止选择框的关闭
							//return false;
						});
					}, false);
					//-----------------------------------------
					
					//-----------------------------------------
					 
					//					//级联示例
					var province=gainPrivinceList();
					var cityPicker3 = new $.PopPicker({
						layer: 2
					});
					cityPicker3.setData(province,callBackFunction);
					var showCityPickerButton = doc.getElementById('showCityPicker');
					var cityResult3 = doc.getElementById('cityResult3');
					showCityPickerButton.addEventListener('tap', function(event) {
						cityPicker3.show(function(items) {
							cityResult3.innerText = "" + _getParam(items[0], 'text') + " " + _getParam(items[1], 'text');
							localStorage.province= _getParam(items[0], 'value');
							localStorage.city= _getParam(items[1], 'value');
							cityResult3.style.color="#000000";
							hideErrorInfo();
							//返回 false 可以阻止选择框的关闭
							//return false;
						});
					}, false);
				});
			})(mui, document);
			
			
		//加载行业
		function gainIndustry(){
			var industryArray=[];
			$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=selectPro&method=selectProFunc&selectType=3",
				data : {
				},
				dataType : "json",
				async: false,
				success : function(data) {
					for(var i=0;i<data.length;i++){
						var tempValue={value:data[i].ID,text:data[i].I_NAME};
						industryArray.push(tempValue);
					}
				},
				error : function(data) {
					alert("系统错误！");
				}
			});
			return industryArray;
		}		
		
		//获取省份列表
		function gainPrivinceList(){
		
			var cityArray=[];
			$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=selectPro&method=selectProFunc&selectType=1",
				data : {
				},
				dataType : "json",
				async: false,
				success : function(data) {
					for(var i=0;i<data.length;i++){
						var tempValue={value:data[i].PROVINCEID,text:data[i].PROVINCE};
						cityArray.push(tempValue);
					}
				},
				error : function(data) {
					alert("系统错误！");
				}
			});
			return cityArray;
		
		}
		
		
		//获取城市列表
		function gainCityList(provinceId){
		
			var cityArray=[];
			$.ajax({
				type : "post",
				url : "${path}/http/interface.ms?model=selectPro&method=selectProFunc&selectType=2",
				data : {
					provinceId:provinceId
				},
				dataType : "json",
				async: false,
				success : function(data) {
					for(var i=0;i<data.length;i++){
						var tempValue={value:data[i].CITYID,text:data[i].CITY};
						cityArray.push(tempValue);
					}
				},
				error : function(data) {
					alert("系统错误！");
				}
			});
			return cityArray;
		
		}
		
		function hideErrorInfo(){
			$("#errorDiv").hide();
		 	$("#yesDiv").show();
			
		}
		
		function callBackFunction(data){
			var cityList=gainCityList(data.value);
			return cityList;
		}
		function goHomePage(){
			window.open("${path}buss/bussModel.ms?exeid=0508af47f45a4464b510da7055ac3885&FUNC_CODE=F6987","_self");
		}
		</script>
	</body>
 </body>
</html>
 