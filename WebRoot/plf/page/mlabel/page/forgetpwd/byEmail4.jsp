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

        .main .center .centerBottom .step .pic .pic1{
            background-image: url(${path}plf/page/mlabel/img/pic1-h.png);
        }

        .main .center .centerBottom .step .pic .pic2{
            background-image: url(${path}plf/page/mlabel/img/pic2-h.png);
        }

        .main .center .centerBottom .step .pic .pic3{
            background-image: url(${path}plf/page/mlabel/img/pic3-h.png);
        }

        .main .center .centerBottom .step .pic .pic4{
            background-image: url(${path}plf/page/mlabel/img/pic4-h.png);
        }

        .main .center .centerBottom .step .char .char1{
            color: #75c4ff;
        }

        .main .center .centerBottom .step .char .char2{
            color: #75c4ff;
        }
        
        .main .center .centerBottom .step .char .char3{
            color: #75c4ff;
        }

        .main .center .centerBottom .step .char .char4{
            color: #75c4ff;
        }
        
        .main .center .centerBottom .content{
            width: 100%;
        }

        .main .center .centerBottom .content .msg{
            margin-top: 15px;
            margin-bottom: 60px;
            text-align: center;
        }

        .main .center .centerBottom .content .msg p{
            margin-left: 20px;
            display: inline-block;
        }

        .main .center .centerBottom .content .msg p span{
            font-size: 18px;
            color: #75c4ff;
        }

        .main .center .centerBottom .content .to_login{
            background-color: #75c4ff;
            width: 138px;
            height: 36px;
            color: #fff;
            margin: 0 auto;
            margin-left: calc((100% - 138px)/2);
            border: none;
        }

        .main .center .centerBottom .content .to_login:active{
            background-color: #42a7f2;
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
                            <div class="msg">
                                <img src="${path}plf/page/mlabel/img/ico-succeed.png" alt="" width="60" height="60">
                                <p><dict:lang value="恭喜" />，<dict:lang value="用户名" />:<span>${ajaxString}</span> <dict:lang value="重置密码成功" />！</p>
                            </div>
                            <input type="button" class="to_login" value="<dict:lang value="直接登录" />">
                        </div>
                </div>
            </div>
        </div>
       <script src="${path}plf/page/mlabel/js/foot.js"></script>
    </div>
    <div class="bottom"></div>
	    <form action="${path}mlabel/MlAction_forMlLogin.ms" method="post" id="login_form"></form>
    <script src="${path}plf/page/mlabel/js/formEvents.js"></script>
    <script>
        //直接登录
        $('.to_login').click(function(){ 
            $("#login_form").submit();
        });
    </script>
  </body>
  </html>