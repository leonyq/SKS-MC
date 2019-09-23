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
        <jsp:param name="style" value="0" />
        <jsp:param name="chosen" value="1" />
    </jsp:include>
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/main.css">
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/frame.css">
    
    <style>
        .main .center .centerBottom .step{
            margin-left: calc(50% - 420px);
        }

        /* 步骤颜色设置 */
        .main .center .centerBottom .step .pic .pic1{
            background-image: url(${path}plf/page/mlabel/img/pic1-h.png);
        }

        .main .center .centerBottom .step .char .char1{
            color: #75c4ff;
        }

        /* 间距设置 */
        .main .center .centerBottom .content .email{
            margin-bottom: 15px;
            position: relative;
        }

        .main .center .centerBottom .content .verification{
            height: 30px;
            margin-bottom: 30px;
            position: relative;
        }

        /* 宽度设置 */
        .main .center .centerBottom .content .email input{
            width: 300px;
        }

        .main .center .centerBottom .content .verification input{
            width: 170px;
            float: left;
        }
       
        .content div.verification .pic {
            border-radius: 2px;
            width: 115px;
            height: 30px;
            color: #333;
            background-color: #eee;
            border: none;
            float: left;
            margin-left: 15px;
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
                    <h3><dict:lang value="邮箱找回密码" /></h3>
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
                                <span class="pic4"></span>
                                <span class="pic3"></span>
                            </div>
                            <div class="char">
                                <span class="char1"><dict:lang value="填写邮箱" /></span>
                                <span class="char2"><dict:lang value="设置新密码" /></span>
                                <span class="char3"><dict:lang value="验证邮箱" /></span>
                                <span class="char4"><dict:lang value="完成" /></span>
                            </div>
                        </div>
                        <div class="content">
                            <form action="#">
                                <div class="email">
                                    <div class="name"><dict:lang value="注册邮箱" /></div>
                                    <input type="text" placeholder="<dict:lang value='邮箱' />" id="email">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="verification">
                                    <div class="name"><dict:lang value="验证码" /></div>
                                    <input type="text" id="code" placeholder="<dict:lang value='请输入右侧验证码' />" maxlength="5" />
                                    <div class="pic"><img id="imgCode" src="${basePath}plf/common/imagevalid.jsp?_login_rd_time=${_login_rd_time}" onclick="getCkImg(this);" title="<dict:lang value="看不清楚可点击更换一张" />"
                                                                            style="cursor: pointer;width:108px;height:100%;" /></div>
                                <p class="message"></p>
                                </div>
                                <input type="button" class="next" value="<dict:lang value="下一步" />" onclick="next();"/>
                            </form>
                        </div>
                </div>
            </div>
        </div>
       <script src="${path}plf/page/mlabel/js/foot.js"></script>
    </div>
    <div class="bottom"></div>
    <script src="${path}plf/page/mlabel/js/formEvents.js"></script>
    <script>
        var Reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;   //邮箱正则
        
    //下一步
    function next(){
    		if($("#email").val()==""){//如果非邮箱
                showMessage(".email","<dict:lang value='请输入邮箱账号'/>");
            }else if(!Reg.test($("#email").val())){//如果非邮箱
                showMessage(".email","<dict:lang value='邮箱格式不正确'/>");
            }else if("" == $("#code").val()){
                showMessage(".verification","<dict:lang value='验证码不能为空'/>");
            }else{ 
     			util.showTopLoading();
                $.ajax({
     			type: "POST",
     		    dataType: "json",
     		    url:"${path}http/interface.ms?model=forGetPwd&method=byEmail",
     		    data: {"flag":"checkEmail","EMAIL":$("#email").val(),"CODE":$("#code").val()},
     			success: function(data){
     					util.closeLoading();console.log(data);
				        if(data!= null){
				        	if (data.checkEmailRes == "OK") {
								window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6341&funcMId=d91df71fd96d4087b7b802bde3129565";
							}else if (data.checkEmailRes == "NG") {
								showMessage(".verification","<dict:lang value='验证码错误'/>");
								getCkImg(document.getElementById("imgCode"));
							}else if (data.checkEmailRes == "NO") {
								showMessage(".email","<dict:lang value='该邮箱未注册'/>");
							}else if (data.checkEmailRes == "OVERTIME") {
								showMessage(".verification","<dict:lang value='验证码已过期'/>");
								getCkImg(document.getElementById("imgCode"));
							}
     					}
     				},
     			 error: function(msg){
     					util.closeLoading();
     					showMessage(".verification","<dict:lang value='错误:验证码验证失败'/>");
						getCkImg($("#imgCode"));
     			  }
     			});
            }
        }
    
    //获取验证码
    function getCkImg(thisObj){
        thisObj.src = "${basePath}plf/common/imagevalid.jsp?_login_rd_time="+new Date();
    }
    </script>
  </body>
  </html>