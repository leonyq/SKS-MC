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
            height: 860px;
        }

        .bottom{
            height: calc(100% - 860px);
        }

        .main .center{
            height: 700px;
        }

        /* 当前步骤 */
        .main .center .centerBottom .step .pic .pic1{
            background-image: url(${path}plf/page/mlabel/img/pic1-h.png);
        }

        .main .center .centerBottom .step .pic .pic2{
            background-image: url(${path}plf/page/mlabel/img/pic2-h.png);
        }

        .main .center .centerBottom .step .pic .pic3{
            background-image: url(${path}plf/page/mlabel/img/pic3-h.png);
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
            margin-bottom: 15px;
            position: relative;
        }

        .main .center .centerBottom .content .city{
            height: 30px;
        }

        /* 输入框宽度 */
        .main .center .centerBottom .content div input{
            width: 300px;
        }

        /* 上传图片 */
        .main .center .centerBottom .content .license{
            height: 110px;
        }

        .main .center .centerBottom .content .license span{
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url(${path}plf/page/mlabel/img/close.png);
            float: right;
            cursor: pointer;
        }

        .main .center .centerBottom .content .license .uploading{
            display: inline-block;
            width: 200px;
            height: 110px;
            background-color: #f2f2f2;
            text-align: center;
            background-size: 100% 100%;
        }

        .main .center .centerBottom .content .license .uploading .pic{
            display: inline-block;
            width: 35px;
            height: 35px;
            background-image: url(${path}plf/page/mlabel/img/uploading.png);
            margin-top: 20px;
            cursor: pointer;
        }

        .main .center .centerBottom .content .license .uploading p:nth-of-type(1){
            color: #999;
            margin: 2px 0;
        }

        .main .center .centerBottom .content .license .uploading p:nth-of-type(2){
            color: #bbb;
            font-size: 12px;
        }

        /* 地址 */
        .main .center .centerBottom .content .address textarea{
            height: 60px;
            width: 300px;
        }

        /* 按钮样式 */
        .main .center .centerBottom .content .operate{
            width: 300px;
            margin-left: calc((100% - 300px)/2);
        }
        
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

        /* 多选框宽度 */
        .main .center .centerBottom .content .trade select{
            width: 300px;
        }

        .main .center .centerBottom .content .city select{
            width: 140px;
            float: left;
        }

        .main .center .centerBottom .content .city select:nth-of-type(2){
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
                            <form action="${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6369&funcMId=c458fd0f52a14bf7b0ec73747998ed16" id="registerForm" name="registerForm" method="post" enctype="multipart/form-data">
                                <div class="company">
                                    <div class="name"><span>*</span><dict:lang value="企业全称"/></div>
                                    <input type="hidden" id="flag" value="">
                                    <input type="text" placeholder="<dict:lang value="请输入企业全称"/>" onblur="validateCompany();" maxlength="100" id="company" name="company" value="${param.company}">
                                    <input type="hidden" id="tel" name="tel" value="${param.tel}">
                                    <input type="hidden" id="proposer" name="proposer" value="${param.proposer}">
                                    <input type="hidden" id="IDNumber" name="IDNumber" value="${param.IDNumber}">
                                    <input type="hidden" id="email" name="email" value="${param.email}">
                                    <input type="hidden" id="department" name="department" value="${param.department}">
                                    <input type="hidden" id="job" name="job" value="${param.job}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="legalPerson">
                                    <div class="name"><dict:lang value="法人代表"/></div>
                                    <input type="text" placeholder="<dict:lang value="请输入法人代表"/>" maxlength="50" id="legalPerson" name="legalPerson">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="trade">
                                    <div class="name"><span>*</span><dict:lang value="所属行业"/></div>
                                    <select name="industry" id="industry">
                                    
                                        <option value=""><dict:lang value="请选择"/></option>
                                     
                                    </select>                                   
                                    
                                    <p class="message"></p>
                                </div>
                                <div class="license">
                                    <div class="name"><dict:lang value="上传营业执照"/></div>
                                    <div class="uploading">
                                        <div class="_uploading">
                                            <div class="pic"></div>
                                            <p><dict:lang value="点击上传照片"/></p>
                                            <p><dict:lang value="支持jpg/png格式，不超过10M"/></p>
                                        </div>
                                    </div>
                                    <input type="file" id="license" name="upFile" accept="image/*" style="display:none;">
                                    <p class="message"></p>
                                </div>
                                <div class="license_id">
                                    <div class="name"><dict:lang value="营业执照社会信用代码或注册号"/></div>
                                    <input type="text" placeholder="<dict:lang value="请输入信用代码或注册号"/>" maxlength="50" id="license_id" name="license_id">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="city">
                                    <div class="name"><span>*</span><dict:lang value="所在城市"/></div>
                                    <select name="province" id="province">
                                    
                                        <option value=""><dict:lang value="请选择"/></option>
                                     
                                    </select>

                                    <select name="city" id="city">
                                        <option value=""><dict:lang value="请选择"/></option>
                                    </select>
                                    <p class="message"></p>
                                </div>
                                <div class="address">
                                    <div class="name"><span>*</span><dict:lang value="详细地址"/></div>
                                    <textarea id="detailAddr" name="detailAddr" maxlength="250"></textarea>
                                    <p class="message"></p>
                                </div>
                                <p class="operate">
                                    <input type="button" class="prev" value="<dict:lang value="上一步"/>">
                                    <input type="button" class="next" value="<dict:lang value="完成"/>">
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
       //初始化方法
       function init(){
       jug();
       addProvinces();
       addIndustry();
       
       }
       init();
       function jug(){
       var flag = $('#proposer').val();
       if(flag==""){
         utilsFp.confirmIcon(1,"","lastStep","", "<dict:lang value="请先完善上一步的信息" />","","360","145");        
       }
       }
       function lastStep(){
         window.location.href = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6399&funcMId=8a8a08ff0c234f5d8896722ce013397e";
       }
       //加载行业
       function addIndustry(){
                  $.ajax({
          type: "POST",
          dataType: "json",
          url:"${path}/http/interface.ms?model=selectPro&method=selectProFunc",
          data: "selectType=3",
          success: function(data){
            util.closeLoading();
			$('#industry').empty();
			$('#industry').append("<option value=''><dict:lang value='请选择'/></option>");			
			for(var i = 0;i < data.length; i++){
			$('#industry').append("<option value=\""+data[i].ID+"\">"+data[i].I_NAME+"</option>");
            }
                                
          },
               error: function(){
                util.closeLoading();
                }
          });       
       
       
       
       
       } 
       //加载省份
       function addProvinces(){
       
       
                  $.ajax({
          type: "POST",
          dataType: "json",
          url:"${path}/http/interface.ms?model=selectPro&method=selectProFunc",
          data: "selectType=1",
          success: function(data){
            util.closeLoading();
			$('#province').empty();
			$('#province').append("<option value=''><dict:lang value='请选择'/></option>");			
			for(var i = 0;i < data.length; i++){
			$('#province').append("<option value=\""+data[i].PROVINCEID+"\">"+data[i].PROVINCE+"</option>");
            }
                                
          },
               error: function(){
                util.closeLoading();
                }
          });
       }   
       //保存信息
       function saveInfo(){
          $('#registerForm').submit();       
       }   
        //省改变时，加载市级城市信息
        $('#province').change(function(){
        var provinceId = $('#province').val();
           $.ajax({
           type: "POST",
          dataType: "json",
          url:"${path}/http/interface.ms?model=selectPro&method=selectProFunc",
          data: "provinceId="+provinceId+"&selectType=2",
          success: function(data){
            util.closeLoading();
			$('#city').empty();
			$('#city').append("<option value=''><dict:lang value='请选择'/></option>");			
			for(var i = 0;i < data.length; i++){
			$('#city').append("<option value=\""+data[i].CITYID+"\">"+data[i].CITY+"</option>");
            }
                                
          },
               error: function(){
            util.closeLoading();
			$('#city').empty();
			$('#city').append("<option value=''><dict:lang value='请选择'/></option>");               
                }                  
           });
        })

        //点击图片模拟 file的点击事件
        $('.uploading').on('click','.pic',function(){
            $('#license').click();
        })

        //当file发生改变时，展示图片
        $('#license').change(function(){
            //展示图片
            file = this.files[0];
            var url = URL.createObjectURL(file);
            $(this).prev().css('background-image','url(' + url + ')'); 

            //把里面的内容隐藏
            $('._uploading').css('display','none');

            //重选图标
            $("<span class='close'></sapn>").appendTo('.uploading')
        })

        // 点击重选图片
        $('.uploading').on('click','.close',function(){
            $(this).remove();
            $('.uploading').css('background-image','');
            $('#license').val('');
            $('._uploading').css('display','block');
        })
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
	             $('#flag').val("1");
	            }else if(data.checkCompanyRes == "OK"){
	             $('#flag').val("2"); 
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
            //window.location.href = "${path}plf/page/mlabel/page/register/register2.jsp";
            var lastUrl = "${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6399&funcMId=8a8a08ff0c234f5d8896722ce013397e";
            $('#registerForm').attr('action',lastUrl);
            $('#registerForm').submit();
        })
        
        //下一步
        $('.next').click(function(){
            jug();
            if($('#flag').val()=="1"){
                showMessage('.company','<dict:lang value="该企业已被注册" />');
            }else if($('#company').val()==""){
                showMessage('.company','<dict:lang value="企业全称不能为空"/>');
            }else if($('#industry').val()==""){
                showMessage('.trade','<dict:lang value="所属行业不能为空"/>');
            }else if($('#province').val()==""){
                showMessage('.city','<dict:lang value="请选择省份"/>');
            }else if($('#city').val()==""){
                showMessage('.city','<dict:lang value="请选择所在城市"/>');
            }else if($('#detailAddr').val()==""){
                showMessage('.address','<dict:lang value="详细地址不能为空"/>');
            }else{
              saveInfo();
               
            }
        })

    </script>


</body>
  </html>