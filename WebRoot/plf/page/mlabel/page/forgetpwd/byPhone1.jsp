<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
  <head>
    <title><dict:lang value="找回密码" />--<dict:lang value="摩尔标签云系统" /></title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
	<meta http-equiv="keywords" content="<dict:lang value="摩尔" />,<dict:lang value="标签" />,keyword3">
	<meta http-equiv="description" content="<dict:lang value="摩尔标签云系统" />"> 
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="placeholder" value="1" />
        <jsp:param name="subStyle" value="0" />
        <jsp:param name="chosen" value="1" />
    </jsp:include>
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/main.css">
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/frame.css">
    <link rel="stylesheet" href="${path}plf/page/fp/css/fp-confirm.css">
    
    <style>
        .main .center .centerBottom .step .pic .pic1{
            background-image: url(${path}plf/page/mlabel/img/pic1-h.png);
        }

        .main .center .centerBottom .step .char .char1{
            color: #75c4ff;
        }

      
        .main .center .centerBottom .content .tel{
            margin-bottom: 15px;
            position: relative;
        }

        .main .center .centerBottom .content .verification{
            height: 30px;
            margin-bottom: 30px;
            position: relative;
        }

        .main .center .centerBottom .content .tel input{
            width: 300px;
        }

        .main .center .centerBottom .content .verification input{
            width: 170px;
            float: left;
        }

        .main .center .centerBottom .content .verification .getCode{
            width: 115px;
            margin-left: 15px;
            color: #333;
            background-color: #eee;
            border: none;
        }

        .main .center .centerBottom .content .verification .getCode:active{
            background-color: #dbdbdb;
        }

        
    </style>
  </head>
	<script type="text/javascript">
	var zcount=1000;
	</script>
  
  <body>
    <div class="top"></div>
    <div class="main">
        <script src="${path}plf/page/mlabel/js/head.js"></script>
        <div class="center">
            <div class="centerTop">
                <div class="container">
                    <h3><dict:lang value="手机找回密码" /></h3>
                    <p class="other">
                        <a href="${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6335&funcMId=ce75f4feebdc4a0ead672dfd3857658b"><dict:lang value="手机找回密码" /></a>
                        <span class="line"></span>
                        <a href="${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6340&funcMId=bcdadff6cedc436bae52ee800f491d70"><dict:lang value="邮箱找回密码" /></a>
                    </p>   
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
                                <span class="char1"><dict:lang value="发送验证码" /></span>
                                <span class="char2"><dict:lang value="设置新密码" /></span>
                                <span class="char3"><dict:lang value="完成" /></span>
                            </div>
                        </div>
                        <div class="content">
                            <form action="#">
                                <div class="tel">
                                    <div class="name"><dict:lang value="手机号码" /></div>
                                    <input type="text" placeholder="<dict:lang value="手机号码" />" id="tel" value="${phoneNum}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="verification">
                                    <div class="name"><dict:lang value="短信验证码" /></div>
                                    <input type="text" placeholder="<dict:lang value="请输入短信验证码" />" id="code" maxlength="4"/>
                                    <input type="button" class="getCode" id="getCode" value="<dict:lang value="获取验证码" />" onclick="getcode();">
                                    <p class="message"></p>
                                </div>
                                <input type="button" class="next" value="<dict:lang value="下一步" />" onclick="next();" />
                            </form>
                            
                        </div>
                </div>
            </div>
        </div>
        <bu:submit viewId="c5025b283b694c9da56c2bf4f9ce60d7" />
        <bu:script viewId="c5025b283b694c9da56c2bf4f9ce60d7" />
       <script src="${path}plf/page/mlabel/js/foot.js"></script>
    </div>
    <div class="bottom"></div>
    <script src="${path}plf/page/mlabel/js/formEvents.js"></script>
    <script type="text/javascript">
        var Reg = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;//电话号码正则
        //获取验证码
        function getcode(){
        	if($("#tel").val() == ""){
                showMessage(".tel","<dict:lang value='请输入手机号码'/>");
            }else if(!(Reg.test($("#tel").val()))){//如果非手机号
                showMessage(".tel","<dict:lang value='请输入正确格式的手机号码'/>");
            }else{ //验证成功，跳转
     			util.showTopLoading();
                $.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"${path}http/interface.ms?model=forGetPwd&method=byPhone",
     		    data: {"flag":"checkout","phoneNumber":$("#tel").val()},
     			success: function(data){
     					util.closeLoading();
				        if(data!= null){
				        	if (data.checkoutRes == "OK") {
				        		utilsFp.confirmIcon(2,"","","", "<dict:lang value='验证码发送成功'/>",0,"","");
								verification_countDown($("#getCode"));
							}else if (data.checkoutRes == "NG") {
								showMessage(".tel","<dict:lang value='该手机未注册'/>");
							}else if (data.checkoutRes == "NO") {
								showMessage(".tel","<dict:lang value='验证码已发送'/>");
							}else{
								showMessage(".tel",data.checkoutRes);
							}
     					}else{
     						showMessage(".verification","<dict:lang value='获取验证码失败'/>");
     					}
     				},
     			 error: function(msg){
     					util.closeLoading();
     					showMessage(".verification","<dict:lang value='错误:验证码发送失败'/>");
     					//utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
     			  }
     			});
            }
        }
        
        //下一步
        function next(){
        	if(!(Reg.test($("#tel").val()))){//如果非手机号
                showMessage(".tel","<dict:lang value='请输入正确格式的手机号码'/>");
            }else{
	        	if(""==$("#code").val()){
	                showMessage(".verification","<dict:lang value='请输入验证码'/>");
	            }else{
	     			util.showTopLoading();
	                $.ajax({
	     			type: "POST",
	     		    dataType: "json",
	     		    url:"${path}http/interface.ms?model=forGetPwd&method=byPhone",
	     		    data: {"flag":"checkoutNext","checkoutCode":$("#code").val()},
	     			success: function(data){
	     					util.closeLoading();
					        if(data!= null){
					        	if (data.checkoutNextRes == "OK") {
					        		window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6336&funcMId=d450b422dfc54458ab2a5ea63d54aa0b";
								}else{
									showMessage(".verification",data.checkoutNextRes);
								}
	     					}else{
	     						showMessage(".verification","<dict:lang value='校验验证码出错'/>");
	     					}
	     				},
	     			 error: function(msg){
	     					util.closeLoading();
	     					showMessage(".verification","<dict:lang value='错误:校验验证码出错'/>");
	     					//utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"","");
	     			  }
	     			});
	            }
            }
        }
    </script>
  </body>
  </html>