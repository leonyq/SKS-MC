<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ include file="/plf/common/pub_cloud.jsp"%>
<head>
	<title><dict:lang value="平台用户登录" /></title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	<link rel="stylesheet" href="${basePath}plf/page/fp/css/chosen.css?_mc_res_version=<%=PlfStaticRes.CHOSEN_CSS %>"/>
	<script type="text/javascript" src="${basePath}plf/js/login.js?_mc_res_version=<%=PlfStaticRes.LOGIN_JS %>"></script>
	<script type="text/javascript" src="${basePath}plf/page/fp/js/chosen.jquery.js?_mc_res_version=<%=PlfStaticRes.CHOSEN_JQUERY_JS %>"></script>

    <style>
        *{
            padding: 0;
            margin: 0;
        }

        body,html{
            height: 100%;
        }
        
        /* 屏蔽ie下自带的input清空 */
        input::-ms-clear{display:none;}
        
        body{
            overflow: auto;
        }

        .container{
            height: 100%;
            background: url(${basePath}plf/page/sysmain/main/img/bg.png) no-repeat center bottom; 
            background-color: #333;
            position: relative;
            min-height: 600px;
            min-width:800px;
        }

        .container .logo{
            float: left;
            width: 130px;
            height: 24px;
            margin-top:36px;
            margin-left: 142px; 
            background-image: url(${basePath}plf/page/sysmain/main/img/logo.png)
        }

        .container .main{
            position: absolute;
            width: 320px;
            height: 330px;
            border:1px solid #5c5c5c;
            border-radius:10px; 
            left: calc(50% - 160px);
            top:calc(50% - 220px);
        }
        
        .container .main .title{
            margin-top: 35px;
            text-align: center;
            height: 35px;
        }

        .container .main .title img{
            vertical-align: top;
            margin-top: 5px;
            margin-right: 10px;
        }

        .container .main .title span{
            color: #fff;
            font-size: 24px;
        }
        
        .container .main .username,.container .main .password{
            width: 270px;
            height: 38px;
            border-radius:2px; 
            background-color: #fff;
            margin: 0 auto;
            margin-top: 20px;
            position: relative;
        }
        
        .container .main .username{
            margin-top: 36px;
        }
        
        .container .main .username>*,.container .main .password>*{
            float: left;
        }

        .container .main .username img,.container .main .password img{
            width: 16px;
            height: 16px;
            margin-left: 15px;
            margin-right: 20px;
            margin-top: 11px;
        }
        
        .container .main .username input,.container .main .password input,.container .main .password select{
            box-sizing: border-box;
            border: none;
            outline: none;
            height: 100%;
            width: calc(100% - 80px);
            border-radius:2px;
            padding-right:5px;  
            color: #333;
            font-size: 14px;
        }

        .container .main .username .cancel,.container .main .password .cancel{
            position: absolute;
            background-image: url(${basePath}plf/page/sysmain/main/img/cancel.png);
            width: 18px;
            height: 18px;
            right: 10px;
            top:10px;
            display: none;
        }

        .container .main .login{
            height: 38px;
            width: 270px;
            margin: 0 auto;
            margin-top:30px; 
        }

        .container .main .login>*{
            float: left;
        }

        .container .main .login .btn{
            width: 150px;
            height: 38px;
            line-height: 38px;
            text-align: center;
            border-radius:2px;
            font-size: 16px; 
            color: #fff;
            background-color: #aace36;
            cursor: pointer;
            border: none;
    		outline: none;
        }

        .container .main .login .btn:hover{
            background-color: #99b932;
        }

        .container .main .login .language{
            width: 100px;
            height: 25px;
            margin-left: 20px;
            margin-top: 6.5px;
            outline: none;
            border: none;
        }

        .container .main .message{
            color: #dd4b39;
            font-size: 12px;
            position: absolute;
            left: 25px;
            top: 80px;
            display: none;
        }

        .container .copyright{
            position: absolute;
            color: #bfbfbf;
            font-size: 12px;
            width: 100%;
            text-align: center;
            bottom:150px;
        }
        
        input:-webkit-autofill,
        textarea:-webkit-autofill,
        select:-webkit-autofill {
            -webkit-box-shadow: 0 0 0 26px #fff inset;
        }
        
        .mc-login-wrap {
        	text-align: right;
        	padding-right: 24px;
    		padding-top: 20px;
        }
        .mc-login-wrap a {
        	font-size: 14px;
        	text-decoration: underline;
        	color: #fff;
        	cursor: pointer;
        }
        #langSelecter_chosen {
        	margin-top: 0!important;
        }
        #langSelecter_chosen .chosen-single span {
        	display: block;
        }
        #langSelecter_chosen .chosen-single div b {
        	background-position: 0 8px;
        }
        #langSelecter_chosen .chosen-single{
        	height: 38px;
        	
        }
        #langSelecter_chosen a.chosen-single{
            border-radius: 2px;
         }
        #langSelecter_chosen .chosen-single span {
        	margin-top: 7px;
        }
        #langSelecter_chosen.chosen-with-drop .chosen-single div b {
        	background-position: -18px 8px;
        }
		
        .layui-layer.layui-layer-dialog {
        	width: 260px!important;
        }
        
        
    </style>
</head>
<body>
    <div class="container">
        <div class="logo"></div>
        <div class="main">
         <form id="login_form" name="login_form" action="${path}sys/LoginAction_login.ms?loadMark=10" method="post"
										onsubmit="return submitEvn(this);">
			
	<input type="hidden" id="loadMark" value="<%=StringUtilsMc.toString(request.getAttribute("loadMark")) %>">
	<input type="hidden" id="MC_L_S_K" value="<c:out value='${MC_L_S_K}' />" name="MC_L_S_K"/>
	  <input  type="hidden" id="chkSId" value="<%=session.getId() %>" name="chkSId"/>
	<input  type="hidden" id="mcDataAuthCache" value="<c:out value='${mcDataAuthCache}' />" name="mcDataAuthCache"/>	
			
			<s:token />
            <div class="title">
                <img src="${basePath}plf/page/sysmain/main/img/MC.png">
                <span><dict:lang value="摩尔云开发平台" /></span>
            </div>
            <div class="username">
            <div class="title" style="display: none;" id="userDto_loginName_title"><dict:lang value="账号" /></div>
                <img src="${basePath}plf/page/sysmain/main/img/ico-username.png">
                <input type="text" id="userDto_loginName" name="userDto.loginName" maxlength="30" placeholder="<dict:lang value="用户" />">
                 <span class="required_sign"><c:out value='${errors["userDto.loginName"][0]}' /></span>
            </div>
            <div class="password">
             <div class="title" style="display: none;" id="keeper_title"><dict:lang value="密码" /></div>
                <img src="${basePath}plf/page/sysmain/main/img/ico-password.png">
                <input type="password" id="keeper" name="keeper" maxlength="32" class="borderGray" value=""  autocomplete="off"  placeholder="<dict:lang value="密码" />">
               <span class="required_sign"><c:out value='${errors["userDto.pw"][0]}' /></span>
            </div>
             <c:if test="${mcIsOpenAuth eq '1'}">
            <div class="password" id="deptAuthImg"  >
                <img   src="${basePath}plf/page/sysmain/main/img/icon-department.png">
                <select id = "mcDataAuth" name="mcDataAuth"  style="width: 230px;display: none;"  >
                <option value="">--<dict:lang value="请选择！" />--</option>
                </select>
            </div>
           </c:if>
            
            <div class="login">
             <button type="button" class="btn" onclick="ajaxLogin(this)" id="btnLogin"><dict:lang value="登录" /></button>
                <%--<div  id="btnLogin">登录</div>
                
                --%><s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']"/>
							<s:bean id="locales" name="com.more.fw.core.common.method.CommMethodMc"/>
							<s:select label="Language" 
									list="#locales.locales" listKey="value"    listValue="%{getText(key)}"
									value="#SESSION_LOCALE == null ? locale : #SESSION_LOCALE"
									name="request_locale" id="langSelecter" 
									onchange="langSelecter_onChanged()" theme="simple"/><%--             
                
                <select class="language">
                    <option value="">中文简体</option>
                    <option value="">中文繁体</option>
                    <option value="">英文</option>
                </select>
            --%></div>
            <div class="mc-login-wrap">
            	<c:if test="${cloud_mod ne '0'}">
					<a onclick="gotoCloudSystem();return false;" href="">摩尔云用户登录</a>
				</c:if>
            	
            </div>
        </div>
         </form>
        <p class="copyright">MOREWIS(Xiamen) Technology Co.Ltd</p>
    </div>
    <script>
        
        
        //登录按钮点击事件
      
        
        //显示提示信息
     

        //鐐筙娓呯┖input
        $('.cancel').on('click',function () {
            $(this).prev().val('');
            $(this).css('display', 'none');
        })

        //当输入框为空时，隐藏清空按钮
        $('.password input,.username input').on('input', function () {
            if ($(this).val() == '') {
                $(this).next().css('display', 'none');
            } else {
                $(this).next().css('display', 'block');
            }
        });

       
        function ajaxLogin(thisObj) {
         	if(!submitEvn(thisObj))return;
         	$.ajax({url:"${path}sys/LoginAction_login.ms?loadMark=10",data:$("#login_form").serialize(),type:"post",
         		success:function(data) {
         			if(data.ajaxMap.checkUser) {
         				var checkUser = data.ajaxMap.checkUser;
         				if(checkUser.result) {
         					if(data.ajaxMap.first != null && data.ajaxMap.first=="first"){
 								var url = "${path}fp/FpAction_upPWD.ms?paraMap.loginName="+data.ajaxMap.loginName+"&paraMap.flag=Sys"+"&paraMap.language="+$("#langSelecter").val();
								var fn1 = parent.reflusMeth;
								mcShowPopWinFp(url,{width:500, height:300,title:'<dict:lang value="首次登录修改密码" />',cancel:fn1});
 								return ;
 							} 
         					window.location.href = "${path}sys/LoginAction_mainFrame.ms";
         				}else {
         					isSubmit = false;
         					if($(".layui-layer-dialog").length==0){
         						util.alert(checkUser.msg);
       	 				  	}
         				    //$("#userDto_loginName").focus();
         				    $("#keeper").val("");
         					$.post("${path}sys/LoginAction_getToken.ms?MC_L_S_K="+$("#MC_L_S_K").val(),{},function(data) {
         						$("input[name='token']").val(data.ajaxMap.token);
         						if(data.ajaxMap.login_random_key) {
         							login_random_key = data.ajaxMap.login_random_key+"";
         						}
         					}); 
         				}
         			}
         		},
         		error:function(data) {
         			util.alert(data);
         		}
         	});
         }
       
        
        function validDataAuth(){
        	var pwd =encrypt("<c:out value='${login_random_key}' />",document.login_form.keeper.value);
    		var loginRandomKey = "<c:out value='${login_random_key}' />";
    		var loginName = $("#userDto_loginName").val();
    		var MC_L_S_K=$("#MC_L_S_K").val();
    		var dataAuth = $("#mcDataAuth").val();
    		var isTrue = true;
    		$.ajax({
    			url:"${path}fp/FpAction_validDataAuth.ms",
    			type:"post",
    			async:false, 
    			data:{loginName:loginName,password:pwd,MC_L_S_K:MC_L_S_K,loginRandomKey:loginRandomKey,dataAuth:dataAuth},
    	 		success:function(data) {
    	 			 alert(data.ajaxMap.state);
    	 			   if(data.ajaxMap.state!="1"){
    	 				   alert(isTrue);
    	 				  isTrue = false;
    	 			   }
    	 		},
    	 		error:function(data) {
    	 			isTrue = false;
    	 			util.alert(data);
    	 		}
    	 	});
    		return isTrue;
        }
       
        function getAuthDataByUserInfo(){
        	 if($("#userDto_loginName").val() == "" || $("#userDto_loginName").val() == null){
        			//utilsFp.alert("<dict:lang value="用户名不能为空" />",null,"");
        			//utilsFp.confirmIcon(1,"","","", "<dict:lang value="用户名不能为空" />","","300","145");
        			//$("#userDto_loginName").focus();
        			return false;
        		}
        		//var pwd =encrypt("<c:out value='${login_random_key}' />",document.login_form.keeper.value);
        		//var loginRandomKey = "<c:out value='${login_random_key}' />";
        		var loginName = $("#userDto_loginName").val();
        		//var MC_L_S_K=$("#MC_L_S_K").val();
        		$.ajax({
        			url:"${path}fp/FpAction_getDataAuthByUserName.ms?loadMark=10",
        			type:"post",
        			data:{loginName:loginName},
        	 		success:function(data) {
        	 				var dataAuth = ["<option value=''>--<dict:lang value="请选择" />--</option>"];
        	 			   if(data.ajaxMap.state=="1" && data.ajaxMap.daList){
        	 				   
        	 				   var list = data.ajaxMap.daList;
        	 				   var mcDataAuthCache = $("#mcDataAuthCache").val();
        	 				  if(list.length>0){
        	 					  dataAuth=[];
        	 				   }
        	 				   $.each(list,function(i,v){
        	 					  if(mcDataAuthCache==v.DEPTID){
        	 						  dataAuth.push("<option selected='selected' value="+v.DEPTID+">"+v.DEPTNAME+"</option>");
        	 					   }else{
        	 						  dataAuth.push("<option value="+v.DEPTID+">"+v.DEPTNAME+"</option>");
        	 					   }
        	 				   });
        	 			  }else{
        	 				  if($(".layui-layer-dialog").length==0){
        	 					 util.alert(data.ajaxMap.msg); 
        	 				  }
        	 				//$("#keeper").focus();
        	 			  }
        	 			 $("#mcDataAuth").html(dataAuth.join(""));
   	 				  	 $("#mcDataAuth").trigger("chosen:updated");
   	 				   //$("#deptAuthImg").show();
   	 				  	 $("#mcDataAuth").chosen();
   	 				   	 $("#mcDataAuth_chosen").css({"margin":"-20px 0 0 40px","width":"230px"});
   	 				   	 $("#mcDataAuth_chosen a").css("border","none");
        	 			 $(".main").css("height","340px");
        	 		},
        	 		error:function(data) {
        	 			isSubmit = false;
        	 			util.alert(data);
        	 		}
        	 	});
        	}
        $(document).ready(function(){
               		var username = getCookieValue("cookUserName");
               		if (username != null) {
        				$("#userDto_loginName").val(username);
        				$("#rmbUser").attr("chenked",true);
        			}else{
        				$("#rmbUser").attr("chenked",false);
        			}
        			$("#rmbUser").click(function(){
        				if ($(this).attr("checked")=='checked') {
        					time = 60*60*60;
        				}
        			});
        			  
                    if($("#userDto_loginName").val()!=""){
                    	getAuthDataByUserInfo();
                    }else{
                      $("#mcDataAuth").trigger("chosen:updated");
          			   $("#mcDataAuth").chosen();
          			   $("#mcDataAuth_chosen").css({"margin":"-20px 0 0 40px","width":"230px"});
          			   $("#mcDataAuth_chosen a").css("border","none");
          			   $(".main").css("height","340px");
                    }
                    
                    $("#userDto_loginName").blur(function(){
                    	getAuthDataByUserInfo();
                     });
               });
               function getCookieValue(name){   
               		var name = escape(name);
               		var allcookies = document.cookie;
               		name += "=";
               		var pos = allcookies.indexOf(name);
               		if (pos != -1) {
        				var start = pos +name.length;
        				var end = allcookies.indexOf(";",start);
        				if (end == -1) {
        					end = allcookies.length;
        				}
        				var value = allcookies.substring(start,end);
        				if(value =="\"\""){
							return null;
						}else{
							return unescape(value);
						}
        			}else{
        				return null;
        			}
               }
           	var login_random_key = "<c:out value='${login_random_key}' />";
           	function getCkImg(thisObj){
            	thisObj.src = "${basePath}plf/common/imagevalid.jsp?_login_rd_time="+new Date();
            }
           	var isSubmit = false;
           	function submitEvn(thisObj){
           		try{ 
           		 
		   		if(!val.valNull(document.login_form.userDto_loginName,document.login_form.keeper)){
           			return false;
           		}
		   	   if("1"=="<c:out value='${mcIsOpenAuth}'/>" && $("#mcDataAuth").val() ==""){
		   		    util.alert("<dict:lang value="组织机构不能为空" />");
					return false;
		   	   }
           		document.login_form.keeper.value=encrypt(login_random_key,document.login_form.keeper.value);
           		$("#submitBtn").attr("disabled","disabled");
        	   		if(isSubmit){
        	   			util.alert("<dict:lang value="正在登录,请稍候" />",null,"");
        	   			return false;
        	   		}
           		}catch(e){util.alert("<dict:lang value="登录出错" />"+e);return false;}
           		isSubmit = true;
           		return true;
           	}
           	function langSelecter_onChanged() {
                document.login_form.action = "${path}sys/LoginAction_forLogin.ms?loadMark=10";
                document.login_form.submit();
            }
         	<s:if test="! checkUser.result">
         		util.alert("<s:property value='checkUser.msg' />");
         	</s:if>
         	<s:elseif test="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USER_LOGOUT_FLAG] == \"2\"}">
        	util.alert("<dict:lang value="您的账号已在其它地方登录" />");
        	$("#loadMark").val(10);
        	<%session.removeAttribute(ConstantsMc.SESSION_USER_LOGOUT_FLAG);%>
        	</s:elseif>
         	<s:elseif test="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USER_LOGOUT_FLAG] == \"3\"}">
        		util.alert("<dict:lang value="在线用户已达到授权数量，您被强制下线，请和管理员联系！" />");
        		$("#loadMark").val(10);
        		<%session.removeAttribute(ConstantsMc.SESSION_USER_LOGOUT_FLAG);%>
        	</s:elseif>
         	<s:elseif test="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USER_LOGOUT_FLAG] == \"4\"}">
        	util.alert("<dict:lang value="您的账号已被强制下线" />");
        	$("#loadMark").val(10);
        	<%session.removeAttribute(ConstantsMc.SESSION_USER_LOGOUT_FLAG);%>
        	</s:elseif>
        	<s:else>
         		//document.login_form.userDto_loginName.focus();
         	</s:else>
           //$("#userDto_loginName,#userDto_pw").attr("autocomplete","off");
          $("#langSelecter").chosen();
          	$("#langSelecter_chosen,#paraMap_dataSource_chosen").css({"margin":"6px 0 0 18px","width":"101"});
          	$(".chosen-container-single .chosen-single").css({"border":"0"});


          $(function(){
              if($("#loadMark").val()!="10")
                langSelecter_onChanged();
                initLabelInfo();  
          })
          function initLabelInfo(){
           //initLabelInfo初始化标签信息 2018-02-26 10:01 cjdjk
            
         	//登录页面上的多语言要单独处理，不能用JS方法取语言
             //util.initLangMap('["摩尔云开发平台"]');   
             //$("#divMC_SHOW_TITLE").text('<dict:lang value="摩尔云开发平台" />');
          }
          
       // $("#userDto_loginName").focus();
        $("#userDto_loginName").keyup(function(event){
          if(event.keyCode ==13) 
             $("#keeper").focus();   
        });
		 $("#keeper").keyup(function(event){
          if(event.keyCode ==13){
        	 ajaxLogin($("#btnLogin"));
          }
        });
         
	function reflusMeth(){
		//document.cookie="cookUserName="+$("#userDto_loginName").val();
    	//location.reload();
    	 var url = "${path}sys/LoginAction_logout.ms?__random__timeSeq="+new Date();
		window.top.location.href = url;
    }
 	function toMainFrameFp(){
 		window.location.href = "${path}sys/LoginAction_mainFrame.ms";
 	}
	function gotoCloudSystem(){
		var languageNow=$("#langSelecter").val();
		$.ajax({
		url:"${path}sys/LoginAction_gotoCloudSystem.ms",
		data:{
			"paraMap.languageNow":languageNow,
			"paraMap.flag":"Sys"
		},
		type:"post",
 		success:function(data) {
 			window.location.href=data.ajaxMap.address;
 		},
 		error:function(data) {
 			isSubmit = false;
 			utilsFp.confirmIcon(3,"","","", data,"","300","145");
 		}
 	});
	}
	 
</script>

 <script type="text/javascript" src="${path}plf/page/js_files/comm/chk.session.id.state.utils.js"> </script>
</body>

</html>
<%
CommMethodMc.initMcLoginSession();//初始化 
 %>