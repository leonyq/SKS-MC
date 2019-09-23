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
    <style>
        .main .center .centerBottom .step .pic .pic1{
            background-image: url(${path}plf/page/mlabel/img/pic1-h.png);
        }

        .main .center .centerBottom .step .pic .pic2{
            background-image: url(${path}plf/page/mlabel/img/pic2-h.png);
        }

        .main .center .centerBottom .step .char .char1{
            color: #75c4ff;
        }

        .main .center .centerBottom .step .char .char2{
            color: #75c4ff;
        }
        
        .main .center .centerBottom .content .password{
            margin-bottom: 15px;
            position: relative;
        }

        .main .center .centerBottom .content .confirm_password{
            margin-bottom: 30px;
            position: relative;
        }

        .main .center .centerBottom .content div input{
            width: 300px;
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
                                <div class="password">
                                    <div class="name"><dict:lang value="新密码" /></div> 
                                    <input type="password" placeholder="<dict:lang value="请输入新密码" />" maxlength="15" id="pwd1"> 
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="confirm_password">
                                    <div class="name"><dict:lang value="确认密码" /></div>
                                    <input type="password" placeholder="<dict:lang value="请再次输入密码" />" maxlength="15" id="pwd2"> 
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <input type="button" class="next" value="<dict:lang value="下一步" />" onclick="next();"/>
                            </form>     
                        </div>
                </div>
            </div>
        </div>
        <bu:submit viewId="e6335c290d0b48edb40be3327c9bbebe" />
        <bu:script viewId="e6335c290d0b48edb40be3327c9bbebe" />
       <script src="${path}plf/page/mlabel/js/foot.js"></script>
    </div>
    <div class="bottom"></div>
    <script src="${path}plf/page/mlabel/js/formEvents.js"></script>
    <script>
        //下一步
        function next(){
        	if ("" == $("#pwd1").val()) {
				showMessage(".confirm_password","<dict:lang value='新密码不能为空'/>");
				return ;
			}
        	if ($("#pwd1").val().length<6) {
				showMessage(".confirm_password","<dict:lang value='新密码长度不能小于6位'/>");
				return ;
			}
        	if ("" == $("#pwd2").val()) {
				showMessage(".confirm_password","<dict:lang value='确认密码不能为空'/>");
				return ;
			}
        	if ($("#pwd2").val().length<6) {
				showMessage(".confirm_password","<dict:lang value='确认密码长度不能小于6位'/>");
				return ;
			}
        	if($("#pwd1").val() != $("#pwd2").val()){
                showMessage(".confirm_password","<dict:lang value='两次密码不一致'/>");
            }else{
	     			util.showTopLoading();
	                $.ajax({
	     			type: "POST",
	     		    dataType: "json",
	     		    url:"${path}http/interface.ms?model=forGetPwd&method=byPhone",
	     		    data: {"flag":"upPwd","newPwd":$("#pwd2").val()},
	     			success: function(data){
	     					util.closeLoading();
					        if(data!= null){
					        	if (data.upPwdRes == "OK") {
					        		window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6338&funcMId=495393ab13cd4f0f84740d79394128ad&USERNAME="+data.USERNAME;
								}else{
									showMessage(".verification","<dict:lang value='"+data.upPwdRes+"'/>");
					        		window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6339&funcMId=dfbc40f03c4a4f95b519d868b646e71a";
								}
	     					}else{
	     						showMessage(".verification","<dict:lang value='校验验证码出错'/>");
					        		window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6339&funcMId=dfbc40f03c4a4f95b519d868b646e71a";
	     					}
	     				},
	     			 error: function(msg){
	     					util.closeLoading();
	     					showMessage(".verification","<dict:lang value='错误:校验验证码出错'/>");
					        window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6339&funcMId=dfbc40f03c4a4f95b519d868b646e71a";
	     			  }
	     			});
	            }
        }
    </script>
    
  </body>
  </html>