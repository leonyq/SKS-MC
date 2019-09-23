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
       /* 高度重调 */
        .main{
            height: 1320px;
        }

        .bottom{
            height: calc(100% - 1320px);
        }

        .main .center{
            height: 1160px;
        }

        .main .centerTop h3{
            margin-left: 15px;
        } 
        
        /* 每块的样式 */
        .main .centerBottom .content .block{
            margin-top: 45px;
        }

        /* 每块的标题 */
        .main .centerBottom .content .title h4{
            font-size: 16px;
            color: #0068b5;
            font-weight: normal;
            margin-left: 20px;
        }

        .main .centerBottom .content .title .line{
            height: 1px;
            width: 100%;
            margin-top: 5px;
            background-color: #eee;
        }

        /* 每块的内容 */
        .main .center .content .cont>div{
            margin-bottom: 15px;
            position: relative;
        }

        .main .center .content .cont>div:nth-of-type(1){
            margin-top: 35px;
        }

        .main .center .content .cont>div:nth-last-of-type(1){
            margin-bottom: 0;
        }

        .main .center .content .cont>div input{
            width: 300px;
        }

        /* 文本域 */
        .main .center .content .cont>div textarea{
            width: 300px;
            height: 90px;            
        }

        .main .center .content .cont .address{
            height: 90px;            
        }

        /* 下拉框 */
        .main .center .centerBottom .content .trade select{
            width: 300px;
        }

        /* 上传图片 */
        .main .center .centerBottom .content .license{
            height: 110px;
        }

        .main .center .centerBottom .content .license span{
            display: block;
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

        .main .center .centerBottom .content .license .uploading ._uploading{
            display: none;
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

        /* 城市 */
        .main .center .content .cont .city{
            height: 30px;
        }

        .main .center .content .cont .city select{
            width: 140px;
            float: left;
        }

        .main .center .content .city select:nth-of-type(2){
            margin-left: 20px;
        }
        
        /* 提交 */
        .main .center .centerBottom .content .sub{
            margin-top: 30px;
            width: 140px;
            height: 36px;
            margin-left: calc((100% - 300px)/2);
            background-color: #75c4ff;
            color: #fff;
            font-size: 14px;
            border:none;
        }

        .main .center .centerBottom .content .sub:active{
            background-color: #42a7f2;
        }
    </style>
</head>
<body>
	<div class="hidden-info">
	</div>
	
    <div class="top"></div>
    <div class="main">
        <script src="${path }plf/page/mlabel/js/head.js"></script>
        <div class="center">
            <div class="centerTop">
                <div class="container">
                    <h3><dict:lang value="资料完善" /></h3>
                </div>
            </div>
            <div class="centerBottom">
                <div class="container">
                    <div class="content">
                    
                    <form action="${path}buss/bussModel_exeFunc.ms?FUNC_CODE=F6465&funcMId=f08d1d44d97c48ae90c61d4ed04606bf" id="registerForm" name="registerForm" method="post" enctype="multipart/form-data">
                        <div class="block">
                            <div class="title">
                                <h4><dict:lang value="申请人信息" /></h4>
                                <div class="line"></div>
                            </div>
                            <div class="cont">
                                <div class="tel">
                                    <div class="name"><dict:lang value="手机号" /></div>
                                    <input type="text" readonly class="readonly"  id="tel" name="tel" value="">
                                </div>
                                <div class="proposer">
                                    <div class="name"><span>*</span><dict:lang value="申请人姓名" /></div>
                                    <input type="text"  id="proposer" name="proposer"placeholder="请输入姓名"  value="">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="IDNumber">
                                    <div class="name"><dict:lang value="身份证号" /></div>
                                    <input type="hidden" id="flag" value="">
                                    <input type="text"   id="IDNumber" name="IDNumber" placeholder="请输入身份证号" onblur="validateIDNumber();"  value="29545645548811">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="email">
                                    <div class="name"><span>*</span><dict:lang value="电子邮箱" /></div>
                                    <input type="text"  id="email" name="email" placeholder="请输入电子邮箱"  value="123456789@qq.com">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="department">
                                    <div class="name"><dict:lang value="部门" /></div>
                                    <input type="text"  id="department" name="department" placeholder="请输入部门" value="">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="job">
                                    <div class="name"><dict:lang value="职务" /></div>
                                    <input type="text"  id="job" name="job" placeholder="请输入职务" value="">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                            </div>
                        </div>
                        <div class="block">
                            <div class="title">
                                <h4><dict:lang value="企业信息" /></h4>
                                <div class="line"></div>
                            </div>
                            <div class="cont">
                                <div class="company">
                                    <div class="name"><span>*</span><dict:lang value="企业全称" /></div>
                                    <input type="hidden" id="flag2" value="">
                                    <input type="text"  id="company" name="company" placeholder="请输入企业全称" onblur="validateCompany();"  value="">
                                    <input type="hidden" id="companyId" name="companyId" value="${dataMap.ID}">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="legalPerson">
                                    <div class="name"><dict:lang value="法人代表" /></div>
                                    <input type="text"  id="legalPerson" name="legalPerson" placeholder="请输入法人代表"  value=""> 
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="trade">
                                    <div class="name"><span>*</span><dict:lang value="所属行业" /></div>
                                    <select name="industry" id="industry" name="industry" style="width:300px">
                                    
                                        <option value=""><dict:lang value="请选择"/></option>
                                     
                                    </select>    
                                    <span class="empty"></span>
                                    <p class="message"></p>     
                                </div>
                               <div class="license">
                                    <input type="hidden" name="photoUrl" id="photoUrl" value="${dataMap.PATH}">
                                    <input type="hidden" name="delectFlag" id="delectFlag">
                                    <div class="name"><dict:lang value="上传营业执照"/></div>
                                    <div class="uploading">
                                        <div class="_uploading">
                                            <div class="pic"></div>
                                            <p><dict:lang value="点击上传照片"/></p>
                                            <p><dict:lang value="支持jpg/png格式，不超过10M"/></p>
                                        </div>
                                    </div>
                                    <input type="file" id="license" name="upFile" accept="image/*" style="display:none">
                                </div>
                                <div class="license_id">
                                    <div class="name"><dict:lang value="营业执照社会信用代码或注册号" /></div>
                                    <input type="text"  id="license_id" name="license_id" placeholder="请输入信用代码或注册号" value="">
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="city">
                                    <div class="name"><span>*</span><dict:lang value="所在城市" /></div>
                                    <select name="province" id="province" name="province">
                                    
                                        <option value=""><dict:lang value="请选择"/></option>
                                     
                                    </select>

                                    <select name="city" id="city" name="city">
                                        <option value=""><dict:lang value="请选择"/></option>
                                    </select>
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                                <div class="address">
                                    <div class="name"><span>*</span><dict:lang value="详细地址" /></div>
                                    <textarea   id="address" name="address" placeholder="请输入详细地址" ></textarea>
                                    <span class="empty"></span>
                                    <p class="message"></p>
                                </div>
                            </div>
                        </div>
                        <div class="block">
                           
                            <div class="cont">					
                                <p class="operate">
                                	<input  type="button" class="sub" value="<dict:lang value="提交" />">
                                   	
                                </p>  
                                </form>
                            </div>
                        </div>
                    </div>
                </div>  <img src="" alt="">
            </div>
        </div>
        <script src="${path}plf/page/mlabel/js/foot.js"></script>
    </div>
    <div class="bottom"></div>
   
    
    <!-- jq滚轮滚动事件 -->
    <script src="${path}plf/page/mlabel/js/formEvents.js"></script>
    <script>
        var _tel = '${dataMap["A_MOBILE"]}';
	var _proposer = '${dataMap["APPLICANT"]}';
	var _IDNumber = '${dataMap["CARD_NO"]}';
	var _email = '${dataMap["E_MAIL"]}';
	var _department = '${dataMap["DEPARTMENT"]}';
	var _job = '${dataMap["POST"]}';
	var _company = '${dataMap["E_NAME"]}';
	var _legalPerson = '${dataMap["LEGAL_PERSON"]}';
	var _industry = '${dataMap["INDUSTRY_ID"]}';
	var url = '${dataMap["PATH"]}';
        var _license_id = '${dataMap["E_NO"]}';
	var _province = '${dataMap["P_ID"]}' ;
        var _city = '${dataMap["C_ID"]}';
        var _address = '${dataMap["ADDRESS"]}';
        var vaEmail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;//电子邮箱
        function initVal(){
        $('#tel').val(_tel);
        $('#proposer').val(_proposer);
        $('#IDNumber').val(_IDNumber);
        $('#email').val(_email);
        $('#department').val(_department);
        $('#job').val(_job);
        $('#company').val(_company);
        $('#legalPerson').val(_legalPerson);
        $('#license_id').val(_license_id);
        $('#address').val(_address);
        //var reg = new RegExp('-','g');
        var path = url; 
        if(path == ''){ //url为空显示未上传
                //$('.license .uploading').remove();
                //$('<span>未上传</span>').appendTo('.license');
                //$('.license').css('height','30px').css('line-height','30px');
            }else{
                $('.license .uploading').css('background-image','url(' + path + ')');//营业执照
                $('._uploading').css('display','none');
                $("<span class='close'></sapn>").appendTo('.uploading');
            } 
        }
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
            $('#delectFlag').val('1');
            $('._uploading').css('display','block');
        })
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
	             $('#flag').val("2"); 
	             showMessage('.IDNumber','<dict:lang value="该身份证可以注册" />');
	             $('.content .IDNumber .message').css('color','#00c66b');
	            }else if(data.checkIDNumberRes == "ZERO"){
	             $('.content .IDNumber .message').css('color','##FF0000');
	             showMessage('.IDNumber','');	             
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
 
        
               //关闭放大
        function closeBig(){
            $('.shadow_div').remove();
            $('.master_map').remove();
            $('.close_img').remove();
        }
        $('body').on('click','.shadow_div',closeBig)
        $('body').on('click','.close_img',closeBig)

        //移除默认的拖动事件
        $('body').on('dragstart','.master_map',function(){
            return false;
        })

        //点击拖动图片
        $('body').on('mousedown','.master_map',function(e){
            var event = $(this);     
            var oldx = e.offsetX;
            var oldy = e.offsetY;
            document.onmousemove = function(ev){        
                $(event).css('left',ev.clientX - oldx +'px');
                $(event).css('top',ev.clientY - oldy +'px');
            }    
        })
        
        //松开移除拖动事件
        window.onmouseup = function(){
            document.onmousemove = null;
        }

        //图片滚动事件(放大缩小)
        $('body').on('mousewheel','.master_map',function(e,d){
            var direction = d > 0 ? 'Up' : 'Down';
            if (direction == 'Up') {
                resizeImg($(this),false)
            } else {
                resizeImg($(this),true)
            }

            return false;
        })

        //图片放大缩小  参数1:执行放大缩小的元素   参数2:是否放大(否的话则缩小)
        function resizeImg(item,isBig){
            var oldHeight = $(item).height();
            var oldWidth = $(item).width();
            var oldTop = $(item).css('top');
            var oldLeft = $(item).css('left');
            
            if(isBig){
                $(item).height($(item).height() + 50);
            }else{
                if(oldHeight <= 100 || oldHeight <= 100){
                    //太小就不允许缩
                }else{
                    $(item).height($(item).height() - 50);
                }
                
            }

            // 重新定位
            var top = parseFloat(oldTop) - ($(item).height() - oldHeight)/2;
            var left = parseFloat(oldLeft) - ($(item).width() - oldWidth)/2;

            $(item).css('top',top + 'px').css('left',left + 'px');
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
        $('#industry option').each(function(){
        
        if($(this).val()==_industry){
        
        $(this).attr('selected',true);
        }
        });                    
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
         $('#province option').each(function(){
       
        if($(this).val()==_province){
        
        $(this).attr('selected',true);
        }
        }); 
        addCity(); 
                   
          },
               error: function(){
                util.closeLoading();
                }
          });
       }  
       //加载城市
       function addCity(){
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
        $('#city option').each(function(){
       
        if($(this).val()==_city){
        
        $(this).attr('selected',true);
        }
        });                    
          },
               error: function(){
            util.closeLoading();
			$('#city').empty();
			$('#city').append("<option value=''><dict:lang value='请选择'/></option>");               
                }                  
           });
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
        $('.sub').click(function(){
        var IdTest = IdentityCodeValid($('#IDNumber').val());
            if($('#flag').val()=="1"){
                showMessage('.IDNumber','<dict:lang value="该身份证已被注册" />');
            }else if($('#flag2').val()=="1"){
                showMessage('.company','<dict:lang value="该企业已被注册" />');
            }else if($('#proposer').val() ==''){
                showMessage('.proposer','<dict:lang value="申请人姓名不能为空"/>');
            }else if(IdTest==false && $('#IDNumber').val()!=""){
                showMessage('.IDNumber','<dict:lang value="身份证格式错误"/>');
            }else if(!(vaEmail.test($('#email').val()))){
                showMessage('.email','<dict:lang value="电子邮箱格式错误"/>');
            }else if($('#company').val()==''){
                showMessage('.company','<dict:lang value="企业全称不能为空"/>');
            }else if($('#industry').val()==""){
                showMessage('.trade','<dict:lang value="所属行业不能为空"/>');
            }else if($('#province').val()==""){
                showMessage('.city','<dict:lang value="请选择省份"/>');
            }else if($('#city').val()==""){
                showMessage('.city','<dict:lang value="请选择所在城市"/>');
            }else if($('#address').val()==""){
                showMessage('.address','<dict:lang value="详细地址不能为空"/>');
            }else{

             $('#registerForm').submit();  
    
               
            }
        });
       function init(){
       addIndustry();
       addProvinces();
       initVal();
       }
       init();
    </script>  
    <bu:submit viewId="88ab12a17f404df585d8d2284b87f3b5" /> 
	<bu:script viewId="88ab12a17f404df585d8d2284b87f3b5" />
  </body>
  </html>