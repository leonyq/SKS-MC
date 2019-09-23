<%@page import="com.more.fw.core.common.method.XssFilterUtil"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@ include file="/plf/common/pub_cloud.jsp"%>
<% 
request.setAttribute("_login_rd_time",System.currentTimeMillis()); 
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-store");  
String loadMark=StringUtilsMc.toString(request.getAttribute("loadMark"));

String is_morelang_login=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("is_morelang_login"));
request.setAttribute("is_morelang_login",is_morelang_login); 

String def_lang_login=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("def_lang_login"));

%>
<head>
	<title><dict:lang value='<%=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("text_title"))%>' /></title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
	<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="placeholder" value="1" />
		<jsp:param name="subStyle" value="0" />
	</jsp:include>
	<script src="${path}plf/page/fp/js/jquery-ui.js?_mc_res_version=<%=PlfStaticRes.JQUERY_UI_JS %>"></script>
	<link rel="stylesheet" href="${path}plf/js/select-mania-master/src/select-mania.css" type="text/css" />
	<script src="${path}plf/js/select-mania-master/src/select-mania.min.js"></script>
	<link rel="stylesheet" href="${path}plf/page/fp/css/style.css?_mc_res_version=<%=PlfStaticRes.STYLE_CSS %>" type="text/css" />
	<script type="text/javascript" src="${basePath}plf/js/login.js?_mc_res_version=<%=PlfStaticRes.LOGIN_JS %>"></script>
	<link rel=stylesheet type=text/css href="${path}plf/style/css2/login/css.css?_mc_res_version=<%=PlfStaticRes.LOGIN_CSS_CSS %>" />
    <link rel="stylesheet" href="${path}plf/page/fp/css/fp-confirm.css?_mc_res_version=<%=PlfStaticRes.FP_CONFIRM_CSS %>">
    <style>
        /* 火狐 placeholder属性 */
        :-moz-placeholder {  
            color: #ccc !important; 
        }

        ::-moz-placeholder { 
            color: #ccc !important;
        }

        /* ie placeholder属性 */
        :-ms-input-placeholder{ 
            color: #ccc !important;
        }
        /* 谷歌 placeholder属性 */
        ::-webkit-input-placeholder{
            color: #ccc !important;
        }

        /* 去掉ie下input后面的X 眼睛 */
        ::-ms-clear,::-ms-reveal{display:none;}

        *{
            margin: 0;
            padding: 0;
        }

        html,body{
            height: 100%;
            font-size: 14px;
        }
	
		body{
			overflow:auto;
		}
		
		input{
			background-color: transparent;
		}
		
        .bg_image{
            width: 100%;
            height: 100%;
            float: left;
            position: relative;
            min-width: 400px;
            min-height: 500px;
        }

        .bg_image>p{
            position: absolute;
            color:#999;
            font-size: 12px;
            text-align: center;
            bottom: 10%;
            width: 100%;
        }

        .login{
            height: 70%;
            position: relative;
    		top: 15%; 
        }

        .login .content{
            width: 280px;
            margin: 0 auto;
            margin-top: 50px;
        }
		
		.login>h3{
			text-align:center;	
		}
		
		.login>h3>img{
			vertical-align: middle;
    		margin-right: 20px;
    		margin-top: -10px;
		}
		
        .login>h3>span{
            font-size: 40px;
            color: #333;
            font-weight:bold;
        }

        .username,.password,.language{
            border-bottom: 1px solid #ccc;
            height: 46px;
            box-sizing:border-box;
            background-color:#fff;
        }
        
        .username{
        	border-top-left-radius: 4px;
        	border-top-right-radius: 4px;  	
        }
        
        .language{
        	border-bottom: 0;
        	border-bottom-left-radius: 4px;
        	border-bottom-right-radius: 4px;  	
        }
	
        .username>*,.password>*{
            float: left;
        }

        .username img,.password img{
            margin-left: 15px;
            margin-right: 15px;
            margin-top: 13px;
            vertical-align: middle;
        }

        .username input,.password input{
            width: calc(100% - 51px);
            height: 100%;
            line-height: 46px;
            color: #333;
            border: none;
            outline: none;
            box-sizing: border-box;
        }

        .button{
            height: 40px;
            width: 100%;
            margin-top: 20px;
            border: none;
            outline: none;
            color: #fff;
            font-size:16px;
            border-radius:20px;
            cursor: pointer; 
            background-color:#aace36; 
        }
			
        .button:hover{
            background-color:#99b932; 
        }
		
		.select-main{
			position: relative;
		}
		
		.select-set{
			height: 46px;
    		line-height: 46px;
    		text-align: left;
    		margin-left: 17px;
		}
		
		.select-block{
			position: relative;	
			margin-top:-2px;
			border:1px solid #cdcdcd;
			width:280px;
			z-index:99;
			margin-left:-1px;
			box-sizing:border-box;
		}
		
		li.select-items:hover{
			background-color:#aace36;
			color:#fff;
			width:280px;
			margin-left:-1px;
		}
		
		.select-arrow{
			width:10px;
			height:5px;
			background-image:url(${path}plf/page/fp/img/login/ico-more.png?_mc_res_version=<%=PlfStaticRes.ICO_MORE_PNG%>);
			position: absolute;
			right:10px;
			top:20px;
		}
		
		.select-arrow.reverse{
			background-image:url(${path}plf/page/fp/img/login/ico-more-h.png?_mc_res_version=<%=PlfStaticRes.ICO_MORE_H_PNG%>);
		}
			
       	
       	
        input:-webkit-autofill,
        textarea:-webkit-autofill,
        select:-webkit-autofill {
            -webkit-box-shadow: 0 0 0 26px #fff inset;
        }
        
        canvas{
            display:block;
        }

        #particles-js{ 
            width: 100%; 
            height: 100%; 
            background-color: #f6f5f7;
            position: absolute;
            top:0;
            left:0;
            z-index:-1;
        }
        
        ._frame{
        	border-top:1px solid #ccc;
        	border-left:1px solid #ccc;
        	border-right:1px solid #ccc;
        	margin-top:60px;
        	border-radius:4px;
        }
        .mc-login-wrap {
        	text-align: center;
        	padding-top: 15px;
        }
        .mc-login-wrap a {
        	font-size: 14px;
        	text-decoration: underline;
        	color: #004098;
        	cursor: pointer;
        }
        
    </style>


<script>
	function reLoadToken(){
		$.post("${path}fp/FpAction_getToken.ms",{},function(data) {
			$("input[name='token']").val(data.ajaxMap.token);
			if(data.ajaxMap.login_random_key) {
				login_random_key = data.ajaxMap.login_random_key+"";
			}
		}); 
	}
	
	function javaScriptshow() {
            
        JavaScriptL.result("OK");
    }
		
	window.onload=function(){
		var u = navigator.userAgent;
		var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1;
		
		if(isAndroid){
			try{
				window.JavaScriptL.show();
			}catch(err)
		   {
		   //在这里处理错误
		   }
			
		}
	}
		
	//reLoadToken();
</script>

</head>
<body>
	<input type="hidden" id="loadMark" value="<%=loadMark %>" name="loadMark"/>
	<input  type="hidden" id="chkSId" value="<%=session.getId() %>" name="chkSId"/>
	<input  type="hidden" id=mcIsOpenAuth value="<c:out value='${mcIsOpenAuth}' />" name="mcIsOpenAuth"/>
	<input  type="hidden" id="mcDataAuthCache" value="<c:out value='${mcDataAuthCache}' />" name="mcDataAuthCache"/>
        <div class="bg_image">
        	<div id="particles-js"></div>
            <p><%=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("compname_login"))%></p>
            <div class="login">
             <h3><img src="${path}<%=StringUtilsMc.toString( ConstantsMc.CUSTCONFIG_MAP.get("logo_login"))%>"><span><dict:lang value='<%=StringUtilsMc.toString(ConstantsMc.CUSTCONFIG_MAP.get("text_login"))%>'/></span></h3>
             <div class="content">
               
             <form action="${path}fp/FpAction_fpLogin.ms?loadMark=10" method="post" id="login_form" name="login_form" class="form" onsubmit="return submitEvn(this);">
              <s:token/>
				<input type="hidden" id="MC_L_S_K" value="<c:out value='${MC_L_S_K}' />" name="MC_L_S_K"/>
              	<div class="_frame">
              	
                <div class="username">
                    <img src="${path}plf/page/fp/img/login/username.png?_mc_res_version=<%=PlfStaticRes.USERNAME_PNG %>" width="20" height="20">
                    <input class="input" placeholder="<dict:lang value="请输入用户名"/>" type="text" name="userDto.loginName" id="userDto_loginName" tabindex="1" />
                	<span class="required_sign"><c:out value='${errors["userDto.loginName"][0]}' /></span>
                	
                </div>
                <div class="password">
                    <img src="${path}plf/page/fp/img/login/password.png?_mc_res_version=<%=PlfStaticRes.PASSWORD_PNG %>" width="20" height="20">
                    <input class="input" placeholder="<dict:lang value="请输入密码"/>" type="password" autocomplete="off" name="keeper" id="keeper" tabindex="1" />
              		<span class="required_sign"><c:out value='${errors["userDto.pw"][0]}' /></span>
                </div>
				 
                   <%-- --%>
                  <div class="group">
					<s:select id="paraMap_dataSource" name="paraMap.dataSource" list="page.dataList" listKey="ACC_NO" listValue="ACC_NAME" cssClass="ui-select" cssStyle="display:none;"/>
					<span class="required_sign"><c:out value='${errors["paraMap.accNo"][0]}' /></span> 
                  </div>
                  <div class="group">
					<s:bean id="locales" name="com.more.fw.core.common.method.CommMethodMc"/>
					<div >
					<s:if test="${is_morelang_login}==1 || ${is_morelang_login}=='1'">
				 	    <select name="request_locale" id="langSelecter" style="display: none;">
				
						<s:iterator value="#locales.locales" status="index">
							<option value="<s:property value="value"/>"><s:property value="%{getText(key)}"/></option>
						</s:iterator>
						
						</select>
				 	</s:if>
				 	<s:else>
				 		<select name="request_locale"  style="display: none;">
							<option value="<%=def_lang_login %>"></option>			
						</select>
				 	</s:else>
					</div>
					<input type="hidden" id="validate_code" name="userDto.validateCode" maxlength="5" class="borderGray"  value="admin"
						style="width: 70px; FONT-SIZE: 14px; LINE-HEIGHT: 16px;" title="<dict:lang value="输入右边显示的验证码&#10;不区分大小写" />" />								
                  </div>
                   <c:if test="${mcIsOpenAuth eq '1'}">
                  
                   <div class="group" id="mcDataAuthB" >
                         <select id = "mcDataAuth" name="mcDataAuth"   ></select>
                  </div>
                  
                  </c:if>
                  </div>
                 
                  <div class="group">
                  
<%--                <button class="btn-submit button" type="submit" value="" /><dict:lang value="登 录" /></button>--%>
                <input class="btn-submit button" id="loginButton" type="button" value="<dict:lang value="登录" />" onclick="ajaxLogin(this)">
            	</div>
            	<div class="mc-login-wrap">
            	<c:if test="${cloud_mod ne '0'}">
					<a onclick="gotoCloudSystem();return false;" >摩尔云用户登录</a>
				</c:if>
            		
            	</div>
            	
		 </form>
        </div>
    </div>
        </div>
        
</body>

<script src="${path}plf/page/fp/js/login/particles.min.js?_mc_res_version=<%=PlfStaticRes.PARTICLES_MIN_JS %>"></script>
<script src="${path}plf/page/fp/js/login/app.js?_mc_res_version=<%=PlfStaticRes.LOGIN_APP_JS %>"></script>
<script type="text/javascript">
$("#mcDataAuth").selectMania();
function ajaxLogin(thisObj) {
 	if(!submitEvn(thisObj))return;
 	$.ajax({url:"${path}fp/FpAction_fpLogin.ms?loadMark=10",data:$("#login_form").serialize(),type:"post",
 		success:function(data) {
 			if(data.ajaxMap.checkUser) {
 				var checkUser = data.ajaxMap.checkUser;
 				if(checkUser.result) {
 					if(data.ajaxMap.first != null && data.ajaxMap.first=="first"){
 						var url = "${path}fp/FpAction_upPWD.ms?paraMap.loginName="+data.ajaxMap.loginName+"&paraMap.flag=Fp"+"&paraMap.language="+$("#langSelecter").val();
						showPopWinFp(url, 500, 300,null,"<dict:lang value="首次登录修改密码" />"); 
 						return ;
 					}
 					window.location.href = "${path}fp/FpAction_mainFrameFp.ms";
 				}else {
 					$("#keeper").val("");
 					isSubmit = false;
 					utilsFp.confirmIcon(1,"","","", checkUser.msg,"","300","145");
 				    //$("#userDto_loginName").focus();
 					$.post("${path}fp/FpAction_getToken.ms?MC_L_S_K="+$("#MC_L_S_K").val(),{},function(data) {
 						$("input[name='token']").val(data.ajaxMap.token);
 						if(data.ajaxMap.login_random_key) {
 							login_random_key = data.ajaxMap.login_random_key+"";
 						}
 					}); 
 				}
 			}
 		},
 		error:function(data) {
 			isSubmit = false;
 			utilsFp.confirmIcon(3,"","","", data,"","300","145");
 		}
 	});
 }


function getAuthDataByUserInfo(){
 if($("#userDto_loginName").val() == "" || $("#userDto_loginName").val() == null){
		//utilsFp.alert("<dict:lang value="用户名不能为空" />",null,"");
		//utilsFp.confirmIcon(1,"","","", "<dict:lang value="用户名不能为空" />","","300","145");
		//$("#userDto_loginName").focus();
		return false;
	}
	var loginName = $("#userDto_loginName").val();
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
 				  if($(".ui-draggable-handle").length==0){
 					 utilsFp.confirmIcon(3,"","","", data.ajaxMap.msg,"","300","145");
 				  }
 			  }
 			 $("#mcDataAuth").html(dataAuth.join(""));
			 $("#mcDataAuth").selectMania("update");
 		},
 		error:function(data) {
 			isSubmit = false;
 			utilsFp.confirmIcon(3,"","","", data,"","300","145");
 		}
 	});
}

  function toMainFrameFp(){
 	window.location.href = "${path}fp/FpAction_mainFrameFp.ms";
 }
   
  
  
//设置语言选中项（为兼容IE8）#SESSION_LOCALE == null ? locale : #SESSION_LOCALE
function setLocals(){
	<s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" />
	<%
	String SESSION_LOCALE = StringUtilsMc.toString(session.getAttribute("WW_TRANS_I18N_LOCALE"));
	if(null != SESSION_LOCALE){
      SESSION_LOCALE = CommMethodMc.escapeJs(SESSION_LOCALE);
      SESSION_LOCALE = XssFilterUtil.stripXss(SESSION_LOCALE);
	}
	%>
	var selObj = "<%=SESSION_LOCALE%>";
	//var selText = $("#langSelecter").find("option:selected").text();
	$("#langSelecter").selectMania();
    $("#langSelecter").change(function(){
    	langSelecter_onChanged();
	});
    $("#langSelecter").val(selObj);
    $("#langSelecter").selectMania("update");
}

$(document).ready(function(){
	

		$("input,textarea").placeholder();
   
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
        	  var dataAuth = ["<option value=''>--<dict:lang value="请选择！" />--</option>"];
		   		 $("#mcDataAuth").html(dataAuth.join(""));
				  $("#mcDataAuth").selectMania("update");	
          }
          
          $("#userDto_loginName").blur(function(){
          	getAuthDataByUserInfo();
           });
		
	 setLocals();
	 
});//init data $(document).ready(function(){
       
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
   		/*if(!val.valNull(document.login_form.userDto_loginName,document.login_form.userDto_pw,document.login_form.validate_code)){
   			return false;
   		}*/
   		if($("#userDto_loginName").val() == "" || $("#userDto_loginName").val() == null){
   			//utilsFp.alert("<dict:lang value="用户名不能为空" />",null,"");
   			utilsFp.confirmIcon(1,"","","", "<dict:lang value="用户名不能为空" />","","300","145");
   			$("#userDto_loginName").focus();
   			return false;
   		}
   		if($("#keeper").val() == "" || $("#keeper").val() == null){
   			//utilsFp.alert("<dict:lang value="密码不能为空" />",null,"");
   			utilsFp.confirmIcon(1,"","","", "<dict:lang value="密码不能为空" />","","300","145");
   			//$("#userDto_pw").focus();
   			return false;
   		}   	
   		
   	   if("1"=="<c:out value='${mcIsOpenAuth}'/>" && $("#mcDataAuth").val() ==""){
   		    utilsFp.confirmIcon(1,"","","", "<dict:lang value="组织机构不能为空" />","","300","145");
			return false;
   	   
   	   }
   	   
   		document.login_form.keeper.value=encrypt(login_random_key,document.login_form.keeper.value);
   		$("#submitBtn").attr("disabled","disabled");
   		if(isSubmit){
   			//utilsFp.alert("<dict:lang value="正在登录,请稍候" />",null,"");
   			utilsFp.confirmIcon(2,"","","", "<dict:lang value="正在登录,请稍候" />","","360","145");
   			return false;
   		}
   		}catch(e){
   		   //util.alert("<dict:lang value="登录出错" />"+e);
   		   utilsFp.confirmIcon(3,"","","", "<dict:lang value="登录出错" />","","300","145");
   		   return false;
   		   }
   		isSubmit = true;
   		return true;
   	}
   	
   	function langSelecter_onChanged() {
        document.login_form.action = "${path}fp/FpAction_forFpLogin.ms?MC_L_S_K="+$("#MC_L_S_K").val()+"&loadMark=10&__temp_time_rand_="+new Date() ;
        document.login_form.submit();
    }
   	
 	<s:if test="! checkUser.result">
 	    utilsFp.confirmIcon(1,"","","", "<s:property value='checkUser.msg' />","","360","145");
 	</s:if>
 	<s:elseif test="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USER_LOGOUT_FLAG] == \"2\"}">
 		utilsFp.confirmIcon(1,"","","", "<dict:lang value="您的账号已在其它地方登录" />","","360","145");
		<%session.removeAttribute(ConstantsMc.SESSION_USER_LOGOUT_FLAG);%>
	</s:elseif>
 	<s:elseif test="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USER_LOGOUT_FLAG] == \"3\"}">
 	    utilsFp.confirmIcon(1,"","","", "<dict:lang value="在线用户已达到授权数量，您被强制下线，请和管理员联系！" />","","400","135");
		<%session.removeAttribute(ConstantsMc.SESSION_USER_LOGOUT_FLAG);%>
	</s:elseif>
 	<s:elseif test="%{#session[@com.more.fw.core.common.method.ConstantsMc@SESSION_USER_LOGOUT_FLAG] == \"4\"}">
		utilsFp.confirmIcon(1,"","","", "<dict:lang value="您的账号已被强制下线" />","","330","145");
	<%session.removeAttribute(ConstantsMc.SESSION_USER_LOGOUT_FLAG);%>
	</s:elseif>
	/*<s:else>
 		document.login_form.userDto_loginName.focus();
 	</s:else>*/
 
	 $(".username input").focus(function(){
          $(this).prev().attr('src','${path}plf/page/fp/img/login/username-h.png?_mc_res_version=<%=PlfStaticRes.USERNAME_H_PNG %>')
      })

      $(".username input").blur(function(){
          $(this).prev().attr('src','${path}plf/page/fp/img/login/username.png?_mc_res_version=<%=PlfStaticRes.USERNAME_PNG %>')
      })

      $(".password input").focus(function(){
          $(this).prev().attr('src','${path}plf/page/fp/img/login/password-h.png?_mc_res_version=<%=PlfStaticRes.PASSWORD_H_PNG %>')
      })

      $(".password input").blur(function(){
          $(this).prev().attr('src','${path}plf/page/fp/img/login/password.png?_mc_res_version=<%=PlfStaticRes.PASSWORD_PNG %>')
      })
	
	
	
	
$("#userDto_loginName").focus();
$("#userDto_loginName").keyup(function(event){
  if(event.keyCode ==13) 
     $("#keeper").focus();   
});

$("#keeper").keyup(function(event){
  if(event.keyCode ==13){
	  ajaxLogin($("#btnLogin"));
  }
});
   function closePopWinFp(){
		//document.cookie="cookUserName="+$("#userDto_loginName").val();
    	//location.reload();
		var url = "${path}fp/FpAction_logoutFp.ms?__random__timeSeq="+new Date();
		window.location.href = url;
   } 
   function gotoCloudSystem(){
		var languageNow=$("#langSelecter").val();
		$.ajax({
		url:"${path}sys/LoginAction_gotoCloudSystem.ms",
		data:{
			"paraMap.languageNow":languageNow,
			"paraMap.flag":"Fp"
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
<script type="text/javascript" src="${path}plf/page/js_files/comm/chk.session.id.state.utils.prev.js"> </script>
<%@ include file="/plf/common/pub_end.jsp"%>
<%
CommMethodMc.initMcLoginSession();//初始化 
 %>