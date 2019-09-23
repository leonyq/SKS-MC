<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<% request.setAttribute("_login_rd_time",System.currentTimeMillis()); %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户注册</title>
        <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="placeholder" value="1" />
        <jsp:param name="subStyle" value="0" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="style" value="0" />
    </jsp:include>
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/main.css">
    <link rel="stylesheet" href="${path}plf/page/fp/css/fp-confirm.css">
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/frame.css">
    <style>
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

        .main .centerBottom .content{
            margin-top: 135px;
            height: 300px;
        }
        
        .main .centerBottom .content>div{
            width: 50%;
            height: 100%;      
            float: left;
        }

        .main .centerBottom .content .left{
            text-align: right;
        }

        .main .centerBottom .content .left img{
            width: 170px;
            height: 115px;
            margin-right: 35px;
        }

        .main .centerBottom .content .right .msg{
            margin-left: 35px;
        }

        .main .centerBottom .content .right h3{
            color: #0068b5;
            font-size: 22px;
            height: 22px;
            line-height: 22px;
            margin-bottom: 15px;
        }

        .main .centerBottom .content .right p{
            color: #bbbbbb;
            line-height: 14px;
            margin-bottom: 30px;
        }

        .main .centerBottom .content .right p span{
            color: #dd4b39;
        }

        .main .centerBottom .content .right button{
            width: 138px;
            height: 36px;
            background-color: #75c4ff;
            color: #fff;
            border: none;
            outline: none;
        }

        .main .centerBottom .content .right button:active{
            background-color: #42a7f2;
        }
    </style>
</head>
<body>
    <div class="top"></div>
    <div class="main">
        <script src="${path}plf/page/mlabel/js/head.js"></script>
        <input type="hidden" id="company" name="company" value="${param.company}">
        <div class="center">
            <div class="centerTop">
                <div class="container">
                    <h3><dict:lang value="注册新用户"/></h3>
                    <p class="other"><dict:lang value="已有账号,立即"/><a href="${path}/mlabel/MlAction_forMlLogin.ms"><dict:lang value="登录"/></a></p>   
                </div>
            </div>
            <div class="centerBottom">
                <div class="container">
                    <div class="content">
                        <div class="left">
                            <img src="img/registration_successful.png" alt="加载中……">
                        </div>
                        <div class="right">
                            <div class="msg">
                                <h3><dict:lang value="恭喜您，注册成功！"/></h3>
                                <p><span>5</span>&nbsp;<dict:lang value="秒后页面跳转"/></p>
                                <button><dict:lang value="立即登录"/></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${path}plf/page/mlabel/js/foot.js"></script>
    </div>
    <div class="bottom"></div>
    
    <script src="${path}plf/page/mlabel/js/formEvents.js"></script>
    <script>
    function init(){
     jug();
    }
    function jug(){
       var flag = $('#company').val();
       if(flag==""){
         window.location.href = "${path}/mlabel/MlAction_register1.ms";       
       }    
    }
 
    init();
        // 5秒后页面跳转
        var timer;
        var count = 5;
        timer = setInterval(function(){
            if(count <= 1){
                clearInterval(timer);
                window.location.href = "${path}/mlabel/MlAction_forMlLogin.ms";
            }else{
                $('.content .right p span').html(--count);
            }  
        },1000)

        $('.right .msg button').click(function(){
               window.location.href = "${path}/mlabel/MlAction_forMlLogin.ms";
        });
    </script>
</body>
  </html>