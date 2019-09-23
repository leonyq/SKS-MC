<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<% request.setAttribute("_login_rd_time",System.currentTimeMillis()); %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta http-equiv="keywords" content="<dict:lang value="摩尔" />,<dict:lang value="标签" />,keyword3">
	<meta http-equiv="description" content="<dict:lang value="摩尔标签云系统" />">    
    <title><dict:lang value="用户注册" /></title>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="placeholder" value="1" />
        <jsp:param name="subStyle" value="0" />
        <jsp:param name="style" value="0" />
    </jsp:include>
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/main.css">
    <link rel="stylesheet" href="${path}plf/page/fp/css/fp-confirm.css">
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/frame.css">
    <style>
       .black_overlay{  display: none;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: black;  z-index:1001;  -moz-opacity: 0.8;  opacity:.80;  filter: alpha(opacity=80);  } 
        .white_content {  display: none;  position: absolute;  top: 25%;  left: 25%;  width: 50%;  height: 50%;  padding: 16px;  border: 2px solid #75c4ff;  background-color: white;  z-index:1002;  overflow: auto;  } 
        .main .center .centerBottom .step .pic .pic1{
            background-image: url(${path}plf/page/mlabel/img/pic1-h.png);
        }

        .main .center .centerBottom .step .char .char1{
            color: #75c4ff;
        }

        /* 右上角样式 */
        .main .center .centerTop .other{
            margin-top: 10px;
        }

        .main .center .centerTop .other a{
            display: inline-block;
            height: 25px;
            width: 50px;
            background-color: #fff;
            color: #0068b5;
            border-radius:4px; 
            text-align: center;
            line-height: 25px;
            margin-left: 8px;
        }

        /* 输入框间距 */
        .main .center .centerBottom .content .tel,
        .main .center .centerBottom .content .password,
        .main .center .centerBottom .content .confirm_password,
        .main .center .centerBottom .content .verification{
            height: 30px;
            margin-bottom: 15px;
            position: relative;
        }

        /* 输入框宽度 */
        .main .center .centerBottom .content .tel input,
        .main .center .centerBottom .content .password input,
        .main .center .centerBottom .content .confirm_password input{
            width: 300px;
        }

        .main .center .centerBottom .content .verification input{
            width: 170px;
            float: left;
        }

        .main .center .centerBottom .content .verification .getCode{
            width: 115px;
            color: #333;
            background-color: #eee;
            border: none;
            margin-left: 15px;
        }

        .main .center .centerBottom .content .verification .getCode:active{
            background-color: #dbdbdb;
        }


        /* 模拟勾选框样式 */
        .main .center .centerBottom .content .protocol{
            width: 300px;
            margin-left: calc((100% - 300px)/2);
            margin-bottom: 30px;
        }

        .main .center .centerBottom .content .protocol .pic{
            display: inline-block;
            width: 12px;
            height: 12px;
            background-image: url(${path}plf/page/mlabel/img/unchecked.png);
            vertical-align: middle;
        }

        .main .center .centerBottom .content .protocol a{
            color: #333;
            text-decoration: none;
            font-size: 12px;
        }
        .clsfont{
            color: #333;
            font-size: 12px;
            margin-top:-10px;
            margin-left:400px;
            cursor: pointer;
        }
        .clsbut{
            margin-left:230px;
            margin-top:260px;
            min-width: 180px;
            display: inline-block;
            zoom: 1;
            height: 36px;
            line-height: 36px;
            padding: 0 20px;
            color: #FFF;
            font-weight: 700;
            font-size: 16px;
            text-align: center;
            background: #75c4ff;
            border: 0;
            border-radius: 3px;
            cursor: pointer;
        }
        .sendmessage{
           font-size:5px;
           color:silver;
        }
    .message2{
    width: 200px;   
    font-size: 12px;
    position: absolute;
    top: 7px;
    left:calc(50% + 150px + 10px);
    color: #00FF00;
    display: none;
        
        }
    </style>
</head>
<body>
    <div class="top"></div>
    <div class="main">
        <script src="${path}plf/page/mlabel/js/head.js"></script>
        <div class="center">
            <div class="centerTop">
                <div class="container">
                    <h3><dict:lang value="注册新用户"/></h3>
                    <p class="other"><dict:lang value="已有账号,立即"/><a href="${path}/mlabel/MlAction_forMlLogin.ms"><dict:lang value="登录"/></a></p>   
                </div>
            </div>
            <div class="centerBottom">
                <div class="container">
                        <div class="step">
                            <div class="pic">
                                <span class="pic1"></span>
                                <span class="pic2"></span>
                                <span class="pic3"></span>
                            </div>
                            <div class="char">
                                <span class="char1"><dict:lang value="手机注册"/></span>
                                <span class="char2"><dict:lang value="申请人认证"/></span>
                                <span class="char3"><dict:lang value="企业认证"/></span>
                            </div>
                        </div>
                        <div class="content">
                            <input type="hidden" id="flag" value="">
                            <form action="${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6399&funcMId=8a8a08ff0c234f5d8896722ce013397e" id="registerForm" name="registerForm" method="post">
                                <div class="tel">
                                    <div class="name"><span>*</span><dict:lang value="手机号"/></div>
                                    <input type="text" placeholder="<dict:lang value="手机号"/>" onblur="validatePhone();" id="tel" name="tel" value="${param.tel}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="password">
                                    <div class="name"><span>*</span><dict:lang value="密码"/></div> 
                                    <input type="password" placeholder="<dict:lang value="请输入密码"/>" maxlength="15" id="pwd1"> 
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="confirm_password">
                                    <div class="name"><span>*</span><dict:lang value="确认密码"/></div>
                                    <input type="password" placeholder="<dict:lang value="再次输入密码"/>" maxlength="15" id="pwd2"> 
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="verification">
                                    <div class="name"><span>*</span><dict:lang value="验证码"/></div>
                                    <input type="text" id="msgCode" name="msgCode" maxlength="4" onkeypress="return GetInput()" onblur="Set(this)" onkeyup="Set(this)" placeholder="<dict:lang value="请输入短信验证码"/>">
                                    <input type="button" class="getCode" id="codeBut" value="<dict:lang value="获取验证码"/>" onclick="sendMsg();">
                                    <p class="message"></p>
                                </div>
                                <p class="protocol">
                                    <span class="pic"></span>
                                    <a href="#" onclick="PopAgreement();"><dict:lang value="我已阅读并同意《摩尔云用户协议》"/></a>
                                    <input type="checkbox"  id="protocol" style="display:none;">
                                </p>
                                <input type="button" class="next" value="<dict:lang value="下一步"/>">
                            </form>
                        </div>
                </div>
            </div>
        </div>
         <script src="${path}plf/page/mlabel/js/foot.js"></script>
    </div>
    <div class="bottom"></div>
<div id="light" class="white_content"> 
               <dict:lang value="这是一份用户协议，我就问你同不同意。"/> 
    <a  href="javascript:void(0)" onclick="closeAgreement();"> 
    <span class="clsfont">×</span></a>
    <button class="clsbut" onclick="agreement();"><dict:lang value="同意协议"/></button>
    </div>    
    <div id="fade" class="black_overlay"> 
</div> 
    <script src="${path}plf/page/mlabel/js/formEvents.js"></script>
    <script>
        var zcount = 1000;
        var isCheck = false;//是否勾选变量
        var Reg = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;//电话号码正则表达式
function init(){
       
      
        
        }
        init();
 function validatePhone(){
   var phone = $('#tel').val();
   if(!(Reg.test($('#tel').val()))){
                 $('.content .tel .message').css('color','##FF0000');
                 if($('#tel').val()==""){
                 showMessage('.tel','<dict:lang value="手机号码不能为空" />');
                 
                 }else{
                 showMessage('.tel','<dict:lang value="手机号码格式错误" />');
                 
                 }               
            }else{
   $.ajax({
                type: "POST",
                dataType: "json",
                url:"${path}/http/interface.ms?model=valRegister&method=valRegCode&ytype=1",
                data: "phone="+phone, 
                success: function(data){
                util.closeLoading();
                
	            if(data.checkPhoneRes == "NG"){
	             $('.content .tel .message').css('color','##FF0000');
	             showMessage('.tel','<dict:lang value="手机账号已注册，请直接登录" />');
	             $('#flag').val("1");
	            }else if(data.checkPhoneRes == "OK"){
	             $('#flag').val("2");
	             showMessage('.tel','<dict:lang value="该手机可以注册" />');
	             $('.content .tel .message').css('color','#00c66b');
	            }else if(data.checkPhoneRes == "ZERO"){
	             $('.content .tel .message').css('color','##FF0000');
	             showMessage('.tel','');
	             
	            }              
                },
                error: function(){} 
   
   });           
            }
 
 }       
 function GetInput(){//屏蔽非数字和非退格符
    var k = event.keyCode;   //48-57是大键盘的数字键，96-105是小键盘的数字键，8是退格符←
    if ((k <= 57 && k >= 48) || (k <= 105 && k >= 96) || (k== 8)){
     return true;
    } else {
     return false;
    }
}
function Set(obj){
   //清空替换非数字
   obj.value=obj.value.replace(/[^\d|]/g,'');
}
 function showMessage2(elem,message) {
    clearTimeout(timer);
    $('.content .message').css('display','none');    
    $('.content ' + elem + ' .message').text(message);
    $('.content ' + elem + ' .message').css('display','block');
    //$('.content ' + elem + ' input:first').css('border-color','#00FF00').css('color','#00FF00');
     $('.content ' + elem + ' .message').css('color','#00c66b');
    $('.content ' + elem + ' .empty').css('background-image', 'url('+_GLO_PATH+'/plf/page/mlabel/img/ico-empty-red.png)');
    timer = setTimeout(function () {
        $('.content ' + elem + ' .message').css('display','none');
    }, 5000);     //5秒后移除提示信息
}

        function validateInfo(){
                var phone = $('#tel').val();
                var msgCode = $('#msgCode').val();
                var pwd = $('#pwd1').val();
                
                $.ajax({
                type: "POST",
                dataType: "json",
                url:"${path}/http/interface.ms?model=valRegister&method=valRegCode&ytype=2",
                data: "phone="+phone+"&msgCode="+msgCode+"&pwd="+pwd,
                success: function(data){
                util.closeLoading();
	               if(data.checkoutNextRes =="UNEG"){
	               showMessage('.verification','<dict:lang value="验证码不正确" />');
	
	               }else if(data.checkoutNextRes =="UNEX"){
	               showMessage('.verification','<dict:lang value="验证码不存在" />');
	               }else if(data.checkoutNextRes =="OVERTIME"){
	               showMessage('.verification','<dict:lang value="验证码已失效" />');
	               }else if(data.checkoutNextRes =="NULL"){
	               showMessage('.verification','<dict:lang value="请输入验证码" />');
	               }else if(data.checkoutNextRes =="SNULL"){
	               showMessage('.verification','<dict:lang value="请获取验证码" />');
	               }else if(data.checkoutNextRes =="OK"){
	               
	               showMessage2('.verification','<dict:lang value="验证码正确" />');
	                     var timer;
                         var count = 1;
            timer = setInterval(function(){
            if(count <= 1){
                clearInterval(timer);
                $('#registerForm').submit();
            }else{
               count--;
            }  
        },1000)               
	               }  
	            

                },
                error: function(){
                util.closeLoading();
                alert("fail");
                }
                });
        }
        function agreement(){
        closeAgreement();
        $('.protocol>.pic').css('background-image','url(${path}plf/page/mlabel/img/checked.png)');
        isCheck = true;
        }
        function closeAgreement(){
        document.getElementById('light').style.display='none';
        document.getElementById('fade').style.display='none';      
        }
        function PopAgreement(){
        document.getElementById('light').style.display='block';
        document.getElementById('fade').style.display='block';
        }
        function sendMsg(){
          var phone = $('#tel').val();
            if($('#flag').val()=="1"){
                showMessage('.tel','<dict:lang value="手机账号已注册，请直接登录" />');
                }else if(!(Reg.test($('#tel').val()))){
                 if($('#tel').val()==""){
                 showMessage('.tel','<dict:lang value="手机号码不能为空" />');
                 }else{
                 showMessage('.tel','<dict:lang value="手机号码格式错误" />');
                 }               
            }else if($('#pwd1').val().length<6 || $('#pwd1').val().length>15){
                  if($('#pwd1').val()==""){
                 showMessage('.password','<dict:lang value="密码不能为空" />');
                 }else{
                 showMessage('.password','<dict:lang value="密码由6-15个字符组成" />');
                 }                 
            }else if($('#pwd1').val() != $('#pwd2').val()){
                showMessage('.confirm_password','<dict:lang value="密码不一致" />');
            }else{
                messageTime();
                $.ajax({
                type: "POST",
                dataType: "json",
                url:"${path}/http/interface.ms?model=sendMsg&method=senMsgfunc",
                data: "phone="+phone,
                success: function(data){
                util.closeLoading();
                if(data.checkoutRes == "NO"){
                utilsFp.confirmIcon(1,"","","", "<dict:lang value="1分钟内只能发送一条短信" />","","280","145");
                }else if(data.checkoutRes == "OK"){
                utilsFp.confirmIcon(2,"","","", "<dict:lang value="短信发送成功" />","","280","145");
                }else if(data.checkoutRes == "OVER"){
                utilsFp.confirmIcon(1,"","","", "<dict:lang value="发送验证码最多支持5条/小时 ，累计10条/天" />","","280","145");
                }
                },
                error: function(){
                util.closeLoading();
                alert("fail");
                }
                });
            }
        }
        function messageTime(){
        var timer;
        var count = 60;
        timer = setInterval(function(){
            if(count <= 1){
                clearInterval(timer);
                $('#codeBut').val("<dict:lang value="获取验证码" />");
                showMessage('.verification','');
               // $('#codeBut').removeClass('sendmessage');
               // $('#codeBut').addClass('getCode');
                $('#codeBut').attr("disabled",false);
            }else{
               $('#codeBut').val("<dict:lang value="重新获取"/>"+"("+(--count)+")s");
               //$('#codeBut').removeClass('getCode');
               //$('#codeBut').addClass('sendmessage');
               $('#codeBut').attr("disabled",true);
                //$('#second').html(--count);
            }  
        },1000)
        
        }
        

       
        
        // 勾选变化图片,模拟checkBox
        $('.protocol .pic').click(function(){
            $('#protocol').click();
            isCheck = !isCheck;
            if(isCheck == true){
                //$('.protocol>.pic').css('background-image','url(${path}plf/page/mlabel/img/checked.png)');
                PopAgreement();
            }else{
                $('.protocol>.pic').css('background-image','url(${path}plf/page/mlabel/img/unchecked.png)');
           }
        })
        
        //下一步
        $('.next').click(function(){
            
                if($('#flag').val()=="1"){
                showMessage('.tel','<dict:lang value="手机账号已注册，请直接登录" />');
                }else if(!(Reg.test($('#tel').val()))){
                 if($('#tel').val()==""){
                 showMessage('.tel','<dict:lang value="手机号码不能为空" />');
                 }else{
                 showMessage('.tel','<dict:lang value="手机号码格式错误" />');
                 }               
            }else if($('#pwd1').val().length<6 || $('#pwd1').val().length>15){
                  if($('#pwd1').val()==""){
                 showMessage('.password','<dict:lang value="密码不能为空" />');
                 }else{
                 showMessage('.password','<dict:lang value="密码由6-15个字符组成" />');
                 }                 
            }else if($('#pwd1').val() != $('#pwd2').val()){
                showMessage('.confirm_password','<dict:lang value="密码不一致" />');
            }
            else if($('#msgCode').val()==""){
                showMessage('.verification','<dict:lang value="验证码不能为空" />'); 
            }
            else if(isCheck==false){
               utilsFp.confirmIcon(1,"","","", "<dict:lang value="请先阅读协议并确认是否同意" />","","260","145");
            }else{
                validateInfo();
                
                   
            }
            

        })
    </script>
</body>
  </html>