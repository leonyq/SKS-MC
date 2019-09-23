<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<% request.setAttribute("_login_rd_time",System.currentTimeMillis()); %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><dict:lang value="用户注册"/></title>
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
        /* 高度重调 */
        .main{
            height: 730px;
        }

        .bottom{
            height: calc(100% - 730px);
        }

        .main .center{
            height: 570px;
        }

        /* 当前步骤 */
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
        .main .center .centerBottom .content form>div{
            height: 30px;
            margin-bottom: 15px;
            position: relative;
        }

        /* 输入框宽度 */
        .main .center .centerBottom .content div input{
            width: 300px;
        }


        .main .center .centerBottom .content .operate{
            width: 300px;
            margin-left: calc((100% - 300px)/2);
        }

        /* 按钮样式 */
        .main .center .centerBottom .content input[type='button']{
            width: 140px;
        }

        .main .center .centerBottom .content .prev{
            float: left;
            height: 36px;
            background-color: #75c4ff;
            color: #fff;
            font-size: 14px;
            border: none;
        }

        .main .center .centerBottom .content .prev:active{
            background-color: #42a7f2;
        }

        .main .center .centerBottom .content .next{
            margin-left: 20px;
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
                    <p class="other"><dict:lang value="已有账号,立即"/><a href="${path}/mlabel/MlAction_login.ms"><dict:lang value="登录"/></a></p>   
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
                            
                            <form action="${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6400&funcMId=a71c94d231e849949e44715e39a1456f" id="registerForm" name="registerForm" method="post">
                                <div class="tel">
                                    <div class="name"><span>*</span><dict:lang value="手机号"/></div>
                                    <input type="text" class="readonly" placeholder="<dict:lang value="手机号"/>" maxlength="20" id="tel" name="tel" readonly value="${param.tel}">
                                    
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="proposer">
                                    <div class="name"><span>*</span><dict:lang value="申请人姓名"/></div>
                                    <input type="text" placeholder="<dict:lang value="请输入姓名"/>" maxlength="20" id="proposer" name="proposer" value="${param.proposer}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="IDNumber">
                                    <div class="name"><dict:lang value="身份证号"/></div>
                                    <input type="hidden" id="flag" value="">
                                    <input type="text" placeholder="<dict:lang value="请输入身份证号"/>" maxlength="18" id="IDNumber" name="IDNumber" onblur="validateIDNumber();" value="${param.IDNumber}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="email">
                                    <div class="name"><span>*</span><dict:lang value="电子邮箱"/></div>
                                    <input type="text" placeholder="<dict:lang value="电子邮箱"/>" maxlength="100" id="email" name="email" value="${param.email}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="company">
                                    <div class="name"><span>*</span><dict:lang value="企业全称"/></div>
                                    <input type="hidden" id="flag2" value="">
                                    <input type="text" placeholder="<dict:lang value="请输入企业全称"/>" maxlength="100" id="company" name="company" onblur="validateCompany();" value="${param.company}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="department">
                                    <div class="name"><dict:lang value="部门"/></div>
                                    <input type="text" placeholder="<dict:lang value="请输入部门"/>" maxlength="50" id="department" name="department" value="${param.department}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="job">
                                    <div class="name"><dict:lang value="职务"/></div>
                                    <input type="text" placeholder="<dict:lang value="请输入职务"/>" maxlength="50" id="job" name="job" value="${param.job}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <p class="operate">
                                    <input type="button" class="prev" value="<dict:lang value="上一步"/>">
                                    <input type="button" class="next" value="<dict:lang value="下一步"/>">
                                </p>        
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
    var zcount = 1000;
    function init(){
     jug();
    }
    init(); 
    function jug(){
    var flag = $('#tel').val();
      if(flag==""){
         utilsFp.confirmIcon(1,"","lastStep2","", "<dict:lang value="请先完善上一步的信息" />","","280","145");
       }
    }
    function lastStep2(){
         window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6387&funcMId=f44a718e571c48b4bbba1b6688551df3";
       } 
      
        //var Reg = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;//电话号码正则表达式
        var vaEmail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;//电子邮箱
      function IdentityCodeValid(code) { 
            var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
            var tip = "";
            var pass= true;
             if(!city[code.substr(0,2)]){
                tip = "地址编码错误";
                pass = false;
             }
            //15位
            if(code.length == 15){
              if(!code || !/^\d{8}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}$/.test(code)){//生日验证
                tip = "身份证号格式错误";
                pass = false;
              } 
               
             //18位             
            }else if(code.length == 18){
              if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){//生日验证
                tip = "身份证号格式错误";
                pass = false;
              } 
                    code = code.split('');
                    //∑(ai×Wi)(mod 11)
                    //加权因子
                    var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                    //校验位
                    var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                    var sum = 0;
                    var ai = 0;
                    var wi = 0;
                    for (var i = 0; i < 17; i++)
                    {
                        ai = code[i];
                        wi = factor[i];
                        sum += ai * wi;
                    }
                    var last = parity[sum % 11];
                    if(parity[sum % 11] != code[17]){
                        tip = "校验位错误";
                        pass =false;
                    }
            
            }else{
                  pass =false;
            }

            //if(!pass) alert(tip);
            return pass;
        }
 function validateIDNumber(){
   var phone = $('#tel').val();
   var IdTest = IdentityCodeValid($('#IDNumber').val());
   var IDNumber = $('#IDNumber').val();
if(IdTest==false && $('#IDNumber').val()!=""){
            showMessage('.IDNumber','<dict:lang value="身份证格式错误"/>');
            }else{
   $.ajax({
                type: "POST",
                dataType: "json",
                url:"${path}/http/interface.ms?model=valRegister&method=valRegCode&ytype=3",
                data: "IDNumber="+IDNumber+"&phone="+phone, 
                success: function(data){
                util.closeLoading();
                
	            if(data.checkIDNumberRes == "NG"){
	             
	             $('.content .IDNumber .message').css('color','##FF0000');
	             showMessage('.IDNumber','<dict:lang value="该身份证已被注册" />');
	             $('#flag').val("1");
	            }else if(data.checkIDNumberRes == "OK"){	              
	             showMessage('.IDNumber','<dict:lang value="该身份证可以注册" />');
	             $('.content .IDNumber .message').css('color','#00c66b');
	             $('#flag').val("2");
	            }else if(data.checkIDNumberRes == "ZERO"){
	             $('.content .IDNumber .message').css('color','##FF0000');
	             showMessage('.IDNumber','');
	             $('#flag').val("2");	             
	            }             
                },
                error: function(){} 
   
   });           
            }

 
 
 } 
function validateCompany(){
   var company = $('#company').val();
   var phone = $('#tel').val();
if($('#company').val()==""){
            showMessage('.company','<dict:lang value="企业全称不能为空"/>');
            }else{
   $.ajax({
                type: "POST",
                dataType: "json",
                url:"${path}/http/interface.ms?model=valRegister&method=valRegCode&ytype=4",
                data: "company="+company+"&phone="+phone, 
                success: function(data){
                util.closeLoading();
                
	            if(data.checkCompanyRes == "NG"){
	             $('.content .company .message').css('color','##FF0000');
	             showMessage('.company','<dict:lang value="该企业已被注册" />');
	             $('#flag2').val("1");
	            }else if(data.checkCompanyRes == "OK"){
	             $('#flag2').val("2");
	             showMessage('.company','<dict:lang value="该企业可以注册" />');
	             $('.content .company .message').css('color','#00c66b');
	            }             
                },
                error: function(){} 
   
   });           
            }

 
 
 }
        //上一步
        $('.prev').click(function(){
            var phone = $('#tel').val();
            // window.location.href = "${path}plf/page/mlabel/page/register/register1.jsp?phone="+phone;
            var lastUrl = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6387&funcMId=f44a718e571c48b4bbba1b6688551df3";
            $('#registerForm').attr('action',lastUrl); 
            $('#registerForm').submit();
        })
        
        //下一步
        $('.next').click(function(){
            
            jug();
            var IdTest = IdentityCodeValid($('#IDNumber').val());
            
           if($('#flag').val()=="1"){
                showMessage('.IDNumber','<dict:lang value="该身份证已被注册" />');
            }else if($('#flag2').val()=="1"){
                showMessage('.company','<dict:lang value="该企业已被注册" />');
            }else if($('#proposer').val()==""){
            showMessage('.proposer','<dict:lang value="名字不能为空"/>');
            }
            else if(IdTest==false && $('#IDNumber').val()!=""){
            showMessage('.IDNumber','<dict:lang value="身份证格式错误"/>');
            }
            else if(!(vaEmail.test($('#email').val()))){
            showMessage('.email','<dict:lang value="电子邮箱格式错误"/>');
            }else if($('#company').val()==""){
            showMessage('.company','<dict:lang value="企业全称不能为空"/>');
            }else{ 
            //window.location.href = "${path}plf/page/mlabel/page/register/register3.jsp?Info="+Info+"&comname="+Company;
            //console.log(Info); 
           
             $('#registerForm').submit();  
                                                
            }
                
            //}
        })

    </script>


</body>
  </html>