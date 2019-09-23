var timer;  //初始化定时器
//点击登录事件
$('#submitBtn').click(function () {
	
    if($("#userDto_loginName").val() == "" || $("#userDto_loginName").val() == null){
    	showMessage(_GLO_VALIDATE_USERNAME_NULL_MSG);
        $("#userDto_loginName").focus();
        return false;
    }
    if($("#userDto_pw").val() == "" || $("#userDto_pw").val() == null){
    	showMessage(_GLO_VALIDATE_PWD_NULL_MSG);
        //$("#userDto_pw").focus();
        return false;
    } 
    
    if($("#userDto_validateCode").val() == "" || $("#userDto_validateCode").val() == null){
    	showMessage(_GLO_VALIDATE_CODE_NULL_MSG);
        $("#userDto_validateCode").focus();
        return false;

    }
    var oldPw = document.login_form.userDto_pw.value;
    document.login_form.userDto_pw.value=encrypt(login_random_key,document.login_form.userDto_pw.value);
    $("#loginRandom").val(login_random_key);
    var formData = form.serialize($("#login_form"));
    //$("#submitBtn").attr("disabled","disabled");
    $.ajax({
		type: "POST",
	    dataType: "json",
	    url: _GLO_PATH+"/mlabel/MlAction_mlLogin.ms",//checkValidateCode.ms
	    data: formData,
		success: function(data){
				if(null == data){
					return;
				}
				if(null != data.ajaxMap.result){
					if(data.ajaxMap.type == "1"){//验证码不正确
						showMessage(_GLO_VALIDATE_CODE_ERR_MSG);
						document.login_form.userDto_pw.value = oldPw;
						getCkImg(document.getElementById("imgCode"));
						$("#userDto_validateCode").focus();
						//$("#submitBtn").removeAttr("disabled");
					}else if(data.ajaxMap.type == "-1"){//验证码超时
						showMessage(_GLO_VALIDATE_CODE_TIMEOUT);
						document.login_form.userDto_pw.value = oldPw;
						var randKey= data.ajaxMap.login_random_key;
						if(randKey!=null&&randKey!=''){
							login_random_key=randKey;
						}
						getCkImg(document.getElementById("imgCode"));
						$("#userDto_validateCode").focus();
						//$("#submitBtn").removeAttr("disabled");
					}else if(data.ajaxMap.type == "2"){// 其他错误
					    //登录信息正确，页面跳转
							//setCookie("morelabel_user_name",$("#userDto_loginName").val(),30);//记住用户名
						getCkImg(document.getElementById("imgCode"));
						showMessage(data.ajaxMap.result);
						$("#userDto_pw").val("");
						$("#userDto_validateCode").val("");
					}else if(data.ajaxMap.type == "3"){
						window.location.href=_GLO_PATH+"mlabel/MlAction_mainFrameMl.ms";
					}else if(data.ajaxMap.type == "4"){
						window.location.href=_GLO_PATH+"buss/bussModel.ms?exeid=88ab12a17f404df585d8d2284b87f3b5&paraMap.flag=2&FUNC_CODE=F6425";
					}
				}
			},
			error: function(msg){
				$("#submitBtn").removeAttr("disabled");
				showMessage("error:"+msg.responseText);
		  }
		});

    

});

// 密码不正确
function password_error(msg) {
    showMessage(msg);
    $('.form .content .password .empty').css('background-image', 'url('+_GLO_PATH+'/plf/page/mlabel/img/ico-empty-red.png)');
    $('.form .content .password input').css('color', '#dd4b39');
}

// 显示信息
function showMessage(message) {
    clearTimeout(timer);
    $('.main .message').remove();//若已经存在定时器，移除
    $('<p class="message"><i></i><span></span></p>').appendTo('.main ');
    $('.message span').html(message);
    $('.message').css('display', 'block');
    timer = setTimeout(function () {
        $('.main .message').remove();
    }, 5000);     //两秒后移除提示信息
}

//点X清空input
$('.form .content').on('click', '.empty', function () {
    $(this).prev().val('');
    $('.form .content .empty').css('background-image', 'url('+_GLO_PATH+'/plf/page/mlabel/img/ico-empty.png)');
    $('.form .content div input').css('color', '#333');
    $(this).css('display', 'none');
})

//当输入框无值时隐藏X，反之显示
$('.form .content .password input,.form .content .username input').on('input', function () {
    if ($(this).val() == '') {
        $('.form .content .empty').css('background-image', 'url('+_GLO_PATH+'/plf/page/mlabel/img/ico-empty.png)');
        $('.form .content div input').css('color', '#333');
        $(this).next().css('display', 'none');
    } else {
        $(this).next().css('display', 'block');
    }

});

if(loginMsg != "" && loginMsg != null){
	showMessage(loginMsg);
}