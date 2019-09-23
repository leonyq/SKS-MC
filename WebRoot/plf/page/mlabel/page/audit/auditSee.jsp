<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<% request.setAttribute("_login_rd_time",System.currentTimeMillis()); %>
  <head>
    <title><dict:lang value="审核查看" />--<dict:lang value="摩尔标签云系统" /></title>
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
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/frame.css">
   <style>
        /* 高度重调 */
        .main{
            height: 1300px;
        }

        .bottom{
            height: calc(100% - 1100px);
        }

        .main .center{
            height: 1300px;
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

        .main .center .content .cont .suggestion,.main .center .content .cont .address{
            height: 90px;            
        }


        /* 图片 */
        .main .center .content .license{
            height: 110px;
        }

        .main .center .content .license .uploading{
            display: inline-block;
            width: 200px;
            height: 110px;
            background-color: #f2f2f2;
            background-size: 100% 100%;
            cursor: pointer;
        }

        /* 城市 */
        .main .center .content .cont .city{
            height: 30px;
        }

        .main .center .content .cont .city input{
            width: 140px;
            float: left;
        }

        .main .center .content .city input:nth-of-type(2){
            margin-left: 20px;
        }

        /* 按钮样式 */
        .main .center .centerBottom .content .operate{
            width: 300px;
            margin-left: calc((100% - 300px)/2);
        }
        
        .main .center .centerBottom .content .operate input[type='button']{
            width: 140px;
            float: left;
            height: 36px;
            background-color: #75c4ff;
            color: #fff;
            font-size: 14px;
            border: none;
        }

        .main .center .centerBottom .content .operate input[type='button']:active{
            background-color: #42a7f2;
        }

        .main .center .centerBottom .content .operate .fail{
            margin-left: 20px;
        }

        /* 查看原图 */
        .master_map{
            position: fixed;
            background-color: #fff;
            cursor: move;
            z-index: 101;
        }

        .shadow_div{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            opacity: 0.35;
            z-index: 100;
        }

        .close_img{
            position: fixed;
            width: 36px;
            height: 36px;
            top: 0;
            right: 0;
            background-image: url(${path }plf/page/mlabel/img/close-big.png);
            z-index: 102;
            cursor: pointer;
        }

        .close_img:hover{
            background-image: url(${path }plf/page/mlabel/img/close-big-h.png);
        }
    </style>
</head>
<body>
    <div class="top"></div>
    <div class="main">
        <%-- <script src="${path }plf/page/mlabel/js/head.js"></script> --%>
        <div class="center">
            <div class="centerTop">
                <div class="container">
                    <h3><dict:lang value="审核查看" /></h3>
                </div>
            </div>
            <div class="centerBottom">
                <div class="container">
                    <div class="content">
                        <div class="block">
                            <div class="title">
                                <h4><dict:lang value="申请人信息" /></h4>
                                <div class="line"></div>
                            </div>
                            <div class="cont">
                                <div class="tel">
                                    <div class="name"><dict:lang value="手机号" /></div>
                                    <input type="text" class="readonly" id="tel" readonly value="">
                                </div>
                                <div class="proposer">
                                    <div class="name"><span>*</span><dict:lang value="申请人姓名" /></div>
                                    <input type="text" class="readonly" id="proposer" readonly value="">
                                </div>
                                <div class="IDNumber">
                                    <div class="name"><dict:lang value="身份证号" /></div>
                                    <input type="text" class="readonly" id="IDNumber" readonly value="">
                                </div>
                                <div class="email">
                                    <div class="name"><span>*</span><dict:lang value="电子邮箱" /></div>
                                    <input type="text" class="readonly" id="email" readonly value="">
                                </div>
                                <div class="company">
                                    <div class="name"><span>*</span><dict:lang value="企业全称" /></div>
                                    <input type="text" class="readonly" id="company2" readonly value="">
                                </div>
                                <div class="department">
                                    <div class="name"><dict:lang value="部门" /></div>
                                    <input type="text" class="readonly" id="department" readonly value="">
                                </div>
                                <div class="job">
                                    <div class="name"><dict:lang value="职务" /></div>
                                    <input type="text" class="readonly" id="job" readonly value="">
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
                                    <input type="text" class="readonly" id="company" readonly value="">
                                </div>
                                <div class="legalPerson">
                                    <div class="name"><dict:lang value="法人代表" /></div>
                                    <input type="text" class="readonly" id="legalPerson" readonly value=""> 
                                </div>
                                <div class="trade">
                                    <div class="name"><span>*</span><dict:lang value="所属行业" /></div>
                                    <input type="text" class="readonly" id="trade" readonly value="">
                                </div>
                                <div class="license">
                                    <div class="name"><dict:lang value="上传营业执照" /></div>
                                    <div class="uploading"></div>
                                </div>
                                <div class="license_id">
                                    <div class="name"><dict:lang value="营业执照社会信用代码或注册号" /></div>
                                    <input type="text" class="readonly" id="license_id" readonly value="">
                                </div>
                                <div class="city">
                                    <div class="name"><span>*</span><dict:lang value="所在城市" /></div>
                                    <input type="text" class="readonly" id="province" readonly value="">
                                    <input type="text" class="readonly" id="city" readonly value="">
                                </div>
                                <div class="address">
                                    <div class="name"><span>*</span><dict:lang value="详细地址" /></div>
                                    <textarea  class="readonly" id="address" readonly></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="block">
                            <div class="title">
                                <h4><dict:lang value="备注信息" /></h4>
                                <div class="line"></div>
                            </div>
                            <div class="cont">
                                <div class="suggestion" style="margin-bottom: 30px;">
                                    <div class="name"><dict:lang value="审核意见" /></div>
                                    <textarea id="audit_memo" disabled></textarea>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>  <img src="" alt="">
            </div>
        </div>
       <%--  <script src="${path }plf/page/mlabel/js/foot.js"></script> --%>
    </div>
    <div class="bottom"></div>
    <script src="${path }plf/page/mlabel/js/jquery.mousewheel.min.js"></script>
    <!-- jq滚轮滚动事件 -->
    <script src="${path }plf/page/mlabel/js/formEvents.js"></script>
    <script>
        // 点击显示原图片
        var _province = '${dataMap["PROVINCE"]}' ;
        var _city = '${dataMap["CITY"]}';
        var _tel = '${dataMap["A_MOBILE"]}';
        var _proposer = '${dataMap["APPLICANT"]}';
        var _IDNumber = '${dataMap["CARD_NO"]}';
        var _email = '${dataMap["E_MAIL"]}';
        var _company = '${dataMap["E_NAME"]}';
        var _department = '${dataMap["DEPARTMENT"]}';
        var _job = '${dataMap["POST"]}';
        var _legalPerson = '${dataMap["LEGAL_PERSON"]}';
        var _trade = '${dataMap["INDUSTRY"]}';
        var url = '${dataMap["E_LICENSE"]}';
        var _license_id = '${dataMap["E_NO"]}';
        var _address = '${dataMap["ADDRESS"]}';
        var _audit_memo = '${dataMap["AUDIT_MEMO"]}';
        //页面加载完成后执行的事件
        $(function(){
            $("#tel").val(_tel);
            $("#proposer").val(_proposer);
            $("#IDNumber").val(_IDNumber);
            $("#email").val(_email);
            $("#company").val(_company);
            $("#department").val(_department);
            $("#job").val(_job);
            $("#company2").val(_company);
            $("#legalPerson").val(_legalPerson);
            $("#trade").val(_trade);
            $("#audit_memo").text(_audit_memo);

            if(url == ''){ //url为空显示未上传
                $('.license .uploading').remove();
                $('<span>未上传</span>').appendTo('.license');
                $('.license').css('height','30px').css('line-height','30px');
            }else{
                $('.license .uploading').css('background-image','url(' + url + ')');//营业执照
            }
            
            $('#license_id').val(_license_id);
            $("#province").val(_province);
            $("#city").val(_city);
            $("#address").text(_address);
        });

        $('.license .uploading').click(function(){ 
            $("<div class='shadow_div'>").appendTo('body');

            $("<img class ='master_map' src='" + url + "'>").appendTo('body');
            $('.master_map').css('left','calc((100% - ' + $('.master_map').width() + 'px)/2)'); 
            $('.master_map').css('top','calc((100% - ' + $('.master_map').height() + 'px)/2)'); 
            
            $("<div class='close_img'>").appendTo('body');  
        });



        //关闭放大
        function closeBig(){
            $('.shadow_div').remove();
            $('.master_map').remove();
            $('.close_img').remove();
        }
        $('body').on('click','.shadow_div',closeBig);
        $('body').on('click','.close_img',closeBig);

        //移除默认的拖动事件
        $('body').on('dragstart','.master_map',function(){
            return false;
        });

        //点击拖动图片
        $('body').on('mousedown','.master_map',function(e){
            var event = $(this);     
            var oldx = e.offsetX;
            var oldy = e.offsetY;
            document.onmousemove = function(ev){        
                $(event).css('left',ev.clientX - oldx +'px');
                $(event).css('top',ev.clientY - oldy +'px');
            }    
        });
        
        //松开移除拖动事件
        window.onmouseup = function(){
            document.onmousemove = null;
        };

        //图片滚动事件(放大缩小)
        $('body').on('mousewheel','.master_map',function(e,d){
            var direction = d > 0 ? 'Up' : 'Down';
            if (direction == 'Up') {
                resizeImg($(this),false)
            } else {
                resizeImg($(this),true)
            }

            return false;
        });

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
        
    </script>  
   
  </body>
  </html>