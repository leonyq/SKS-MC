<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<% request.setAttribute("_login_rd_time",System.currentTimeMillis()); 

String loadMark=request.getParameter("loadMark");
if(loadMark==null)loadMark=""; 

%>
  <head>
    <title><dict:lang value="用户登录" />--<dict:lang value="摩尔共享标签" /></title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
<%--     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    --%>
	<meta http-equiv="keywords" content="<dict:lang value="摩尔" />,<dict:lang value="标签" />,keyword3">
	<meta http-equiv="description" content="<dict:lang value="摩尔共享标签" />"> 
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="placeholder" value="1" />
        <jsp:param name="subStyle" value="0" />
        <jsp:param name="style" value="0" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="serializeForm" value="1" />
    </jsp:include>
    <%@ include file="/buss/inc_files/inc_dev.jsp"%>
    
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/login.css?_mc_res_version=<%=MLABEL_CSS_LOGIN_CSS %>">
    <link rel="stylesheet" href="${path}plf/page/fp/css/fp-confirm.css?_mc_res_version=<%=PlfStaticRes.FP_CONFIRM_CSS %>">
    <script type="text/javascript" src="${basePath}plf/js/login.js?_mc_res_version=<%=LOGIN_JS %>"></script>
    
    <style type="text/css">

         input:-webkit-autofill,
         textarea:-webkit-autofill,
         select:-webkit-autofill {
             -webkit-box-shadow: 0 0 0 26px #ffffff inset;
             /* -webkit-text-fill-color:#000; */
         }  
         
         .chosen-container .chosen-single{
                height: 46px;
                line-height: 46px;
                background-color: transparent;
         }
         .chosen-container .chosen-single div b{
                width: 10px;
    			height: 5px;
   				margin-top: 21px;
				background:url(${path}plf/page/fp/img/login/ico-more.png)
         }

	.chosen-container-active.chosen-with-drop .chosen-single div b{
		background:url(${path}plf/page/fp/img/login/ico-more-h.png)
	}
         
         .chosen-container .chosen-drop {
  		width: calc(100% + 2px);
    		margin-left: -1px;
    	}
    	
    	.chosen-container .chosen-drop{
    		border: 1px solid #ccc;
            background-color: #fff;
    	}
    	
    	.chosen-container .chosen-results li{
    		height:40px;
    		line-height:30px;
    		box-sizing:border-box;
    	}
    	
    	.chosen-container .chosen-results li.highlighted{
    		background-color:#aace36;
    	}
    	
    	.popPic{
            position: fixed;
        }
    	
    	.popPic .close{
            width: 10px;
            height: 10px;      
            position: absolute;
            right: 4px;
            top: 4px;
            cursor: pointer;
            background-image:url(${path}plf/page/mlabel/img/ico-closePic.png)
        }
        
        .popPic .close:hover{
        	background-image:url(${path}plf/page/mlabel/img/ico-closePic-h.png)
        }
    </style>
    <script type="text/javascript">
    
    //设置语言选中项（为兼容IE8）#SESSION_LOCALE == null ? locale : #SESSION_LOCALE
function setLocals(selObj){
    //var selObj = '<s:property value="#SESSION_LOCALE == null ? locale : #SESSION_LOCALE"/>';
    
    var selLang = '<s:property value="#SESSION_LOCALE == null ? locale : #SESSION_LOCALE"/>';
    
    if(selObj == null || selObj == ""){
        selObj = selLang;
    }/* else if(selLang != selObj){
        langSelecter_onChanged();
    } */
    
    $("#langSelecter").val(selObj);

}


		function setCookie(cname,cvalue,exdays){
		  var d = new Date();
		  d.setTime(d.getTime()+(exdays*24*60*60*1000));
		  var expires = "expires="+d.toUTCString();
		  document.cookie = cname+"="+cvalue+";"+expires;
		}
		
       
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
                return unescape(value);
            }else{
                return "";
            }
       }
       
    
    
    var login_random_key = "${login_random_key}";
    function getCkImg(thisObj){
        thisObj.src = "${basePath}plf/common/imagevalid.jsp?_login_rd_time="+new Date();
    }
    
    function langSelecter_onChanged() {
        setCookie("morelabel_lang",$("#langSelecter").val(),30);
        document.login_form.action = "${path}mlabel/MlAction_forMlLogin.ms?loadMark=10";
        document.login_form.submit();
    }
    
    
    
    var loginMsg = "${checkUser.msg}";
    $(function(){
        setLocals(getCookieValue("morelabel_lang"));
        $("#userDto_loginName").val(getCookieValue("morelabel_user_name"));
        $("#langSelecter").chosen();    
        $("#langSelecter_chosen").css({"text-align":"left","width":"278"});
         $(".chosen-container-single .chosen-single").css({"width":"278","background":"#ffffff","border":"0","color":"#333"});
         //$(".chosen-drop").css({"border":"1px solid red;"});
         $("input,textarea").placeholder(); 

         //输入框回车事件
         $("input").on("keypress",function(event){
            if(event.keyCode == 13){
                //$('#submitBtn').click();
            }
         });      
    });
    
    function forgetPwd(){
    	var Reg = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;//电话号码正则
    	var loginName = "";
    	if ("" != $("#userDto_loginName").val() && Reg.test($("#userDto_loginName").val())) {
			loginName = $("#userDto_loginName").val();
		}
    	window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6335&funcMId=ce75f4feebdc4a0ead672dfd3857658b&phoneNum="+loginName;
    }
    </script>
  </head>
  
  <body>
  
<input type="hidden" id="loadMark" value="<%=loadMark %>" name="loadMark"/>
    <div class="container">
        <div id="particles-js"></div>
        
        <div class="content">
            <div class="slogan">
                <h2>共享标签</h2>
                <p>简单快捷的&nbsp;<span>条码管理</span></p>
                <p><span>标签</span>&nbsp;设计</p>
                <p><span>协同</span>&nbsp;及打印平台</p>
            </div>
            <div class="frame">
            <form  action="${path}mlabel/MlAction_mlLogin.ms?loadMark=10" method="post" id="login_form" name="login_form" class="form" >
                  <%--   <s:token /> --%>
                  <input type="hidden" name="paraMap.mlLongToken" value="${paraMap.mlLongToken}">
                  <input type="hidden" name="loginRandom" id="loginRandom">
                <div class="title"></div>
                <div class="main">
                    <div class="username">
                        <img src="${path}plf/page/mlabel/img/username.png">
                        <input type="text" placeholder="<dict:lang value="用户名" />" name="userDto.loginName" id="userDto_loginName" maxlength="30" tabindex="1">
                    </div>
                    <div class="password">
                        <img src="${path}plf/page/mlabel/img/password.png">
                        <input type="password" placeholder="<dict:lang value="密码" />"  name="userDto.pw" id="userDto_pw" maxlength="30" tabindex="1">
                    </div>
                    <!-- <div class="language" onclick="showdiv(this,event)">
                        <p><span class="index">简体中文</span><span class="ico"></span></p>
                        <ul class="_language">
                            <li>简体中文</li>
                            <li>繁体中文</li>
                            <li>英文</li>
                        </ul>
                    </div> -->
                    <div class="language" >
                            <s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']"/>
                            <s:bean id="locales" name="com.more.fw.core.common.method.CommMethod"/>
                              
                        <s:select label="Language" 
                              list="#locales.locales" listKey="value" listValue="key"
                                    name="request_locale" id="langSelecter" 
                             onchange="langSelecter_onChanged()" theme="simple"/>  
						
					</select>  
                     </div>
                     <s:select id="paraMap_dataSource" name="paraMap.dataSource" list="page.dataList" listKey="ACC_NO" listValue="ACC_NAME" cssStyle="display:none;"/>
                     
                    <div class="validation">
                        <input type="text" placeholder="<dict:lang value="请输入验证码" />" id="userDto_validateCode" name="userDto.validateCode" maxlength="5" tabindex="1">
                        <img id="imgCode" src="${path}plf/common/imagevalid.jsp?_login_rd_time=${_login_rd_time}" onclick="getCkImg(this);" title="<dict:lang value="看不清楚可点击更换一张" />"
                                                                            style="cursor: pointer;" />
                    </div>
                </div>
               <input type="button" class="button" id="submitBtn" value="<dict:lang value="登录" />" style="cursor:pointer;">
                
                <p class="other">
                    <a href="${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6387&funcMId=f44a718e571c48b4bbba1b6688551df3"><dict:lang value="免费注册" /></a>
                    <span class="line"></span>
                     <a href="javascript:void(0);" onclick="forgetPwd();"><dict:lang value="找回密码" /></a>
                </p>
                </form>
            </div>  
        </div>
        <script src="${path}plf/page/mlabel/js/foot.js?_mc_res_version=<%=PlfStaticRes.MLABEL_JS_FOOT_JS %>"></script>

    </div>
    <script src="${path}plf/page/mlabel/js/login.js?_mc_res_version=<%=PlfStaticRes.MLABEL_JS_LOGIN_JS %>"></script>
    <script src="${path}plf/page/mlabel/js/particles.min.js"></script>
    <script src="${path}plf/page/mlabel/js/app.js"></script>
    <script type="text/javascript">
    
     //
        $('.username input').focus(function(){
            $(this).prev().attr('src','${path}plf/page/mlabel/img/username-h.png')
        });

        $('.username input').blur(function(){
            $(this).prev().attr('src','${path}plf/page/mlabel/img/username.png')
        });

        $('.password input').focus(function(){
            $(this).prev().attr('src','${path}plf/page/mlabel/img/password-h.png')
        });

        $('.password input').blur(function(){
            $(this).prev().attr('src','${path}plf/page/mlabel/img/password.png')
        });

        //显示多语言选项
        function showdiv(elem,event){
            $(elem).find('._language').slideToggle('fast');
            $(elem).toggleClass('active');
            //阻止事件冒泡
            var e=arguments.callee.caller.arguments[0]||event; 
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else if (window.event) {
                window.event.cancelBubble = true;
            }
        }

        //点空白处隐藏多语言选项
        $(document).click(function () {
            $("._language").slideUp('fast');
            $(".language").removeClass('active')
        });

        //选择多语言事件
        $('._language li').click(function(){
            $('.language .index').text($(this).text())
        });
    
   var zcount = 1000;
	    <s:if test="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USER_LOGOUT_FLAG] == \"2\"}">
	        utilsFp.confirmIcon(1,"","","", "<dict:lang value="您的账号已在其它地方登录" />","","360","145");
	        $("#loadMark").val(10);
	        <%session.removeAttribute(Constants.SESSION_USER_LOGOUT_FLAG);%>
	    </s:if>
	    <s:elseif test="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USER_LOGOUT_FLAG] == \"3\"}">
	        utilsFp.confirmIcon(1,"","","", "<dict:lang value="在线用户已达到授权数量，您被强制下线，请和管理员联系！" />","","400","135");
	       $("#loadMark").val(10);
	        <%session.removeAttribute(Constants.SESSION_USER_LOGOUT_FLAG);%>
	    </s:elseif>
	    <s:elseif test="%{#session[@com.more.fw.core.common.method.Constants@SESSION_USER_LOGOUT_FLAG] == \"4\"}">
	        utilsFp.confirmIcon(1,"","","", "<dict:lang value="您的账号已被强制下线" />","","330","145");
	   $("#loadMark").val(10);
	    <%session.removeAttribute(Constants.SESSION_USER_LOGOUT_FLAG);%>
	    </s:elseif>    
            
         if($("#userDto_loginName").val() == null || $("#userDto_loginName").val() == ""){
            $("#userDto_loginName").focus();
         }else if($("#userDto_pw").val() == null || $("#userDto_pw").val() == ""){
            $("#userDto_pw").focus();
         }else{
            $("#userDto_validateCode").focus();
         }
         
         $("#userDto_loginName").keyup(function(event){
           if(event.keyCode ==13) 
              $("#userDto_pw").focus();   
            });

           $("#userDto_pw").keyup(function(event){
             if(event.keyCode ==13) 
                $("#userDto_validateCode").focus();
            });
            $("#userDto_validateCode").keyup(function(event){
             if(event.keyCode ==13) 
               $('#submitBtn').click();
            });
             
		         //弹出图片方法   
        //W:图片宽度  H:图片高度  
        //top:距上边的距离 left:距左边的距离 right:距右边的距离 bottom:距下边的距离
        //(上下同时设置以上为准，左右同时设置以左为准,若为负值则不生效) 
        //picUrl:图片地址 href:点击图片的链接地址
        function newPic(W,H,top,left,right,bottom,picUrl,href){
            
            $("<div class='popPic'></div>").css('height',H + 'px').css('width',W + 'px').appendTo('body');
            if(top != ""){
                $('.popPic:last').css('top',top);
            }
            if(left != ""){
                $('.popPic:last').css('left',left);
            }
            if(right != ""){
                $('.popPic:last').css('right',right);
            }
            if(bottom != ""){
                $('.popPic:last').css('bottom',bottom);
            }
                                                                         
            $("<div class='close'></div>").appendTo('.popPic:last');

            if(!href){
                $("<a></a>").appendTo('.popPic:last');
            }else{
                $("<a href='" + href + "' target='_blank'></a>").appendTo('.popPic:last');
            }            
            $('<img>').css('height',H + 'px').css('width',W + 'px').attr('src',picUrl).appendTo('.popPic:last a');
        }
        
        //点击移除图片
        $('body').on('click','.popPic .close',function(){
            $(this).parents('.popPic').remove();
        });
         
  $(function (){
     newPic(194,130,'','25px','','15px',"${path}plf/page/mlabel/img/popPic1.png","${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6387&funcMId=f44a718e571c48b4bbba1b6688551df3");
     newPic(194,130,'','','25px','15px',"${path}plf/page/mlabel/img/popPic2.png","${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6387&funcMId=f44a718e571c48b4bbba1b6688551df3");
    if($("#loadMark").val()!="10")
     langSelecter_onChanged();
  });
    </script>
  </body>
  </html>