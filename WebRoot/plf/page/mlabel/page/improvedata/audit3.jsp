<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<% request.setAttribute("_login_rd_time",System.currentTimeMillis()); %>
  <head>
    <title><dict:lang value="资料完善" />--<dict:lang value="摩尔标签云系统" /></title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
<%--     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    --%>
	<meta http-equiv="keywords" content="<dict:lang value="摩尔" />,<dict:lang value="标签" />,keyword3">
	<meta http-equiv="description" content="<dict:lang value="摩尔标签云系统" />"> 
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="placeholder" value="1" />
        <jsp:param name="subStyle" value="0" />
        <jsp:param name="style" value="0" />
        <jsp:param name="chosen" value="1" />
    </jsp:include>
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/main.css">
    <link rel="stylesheet" href="${path}plf/page/fp/css/fp-confirm.css">
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/frame.css">
    <style>
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
            width: 110px;
            height: 110px;
            margin-right: 40px;
        }

        .main .centerBottom .content .right h3{
            color: #0068b5;
            font-size: 22px;
            height: 22px;
            line-height: 22px;
            margin-bottom: 20px;
        }

        .main .centerBottom .content .right p{
            color: #bbbbbb;
        }

        .main .centerBottom .content .right p:nth-of-type(2){
            margin-bottom: 40px;
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
        <script src="${path }plf/page/mlabel/js/head.js"></script>
        <div class="center">
            <div class="centerTop">
                <div class="container">
                    <h3>资料完善</h3>
                </div>
            </div>
            <div class="centerBottom">
                <div class="container">
                    <div class="content">
                        <div class="left">
                            <img src="${path}plf/page/mlabel/img/audit.png" alt="加载中……">
                        </div>
                        <div class="right">
                            <div class="msg">
                                <h3>审核资料已提交</h3>
                                <p>系统将在1个工作日内进行审核，审核结果将通过短信方式进行通知。</p>
                                <p>审核通过后才能正式使用系统，感谢您的支持！</p>
                                <button onclick="jumpLogin();">返回登录</button>
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
    function jumpLogin(){
    window.parent.location.href = "${path}/mlabel/MlAction_forMlLogin.ms";
    }
    </script>
</body>
</html>