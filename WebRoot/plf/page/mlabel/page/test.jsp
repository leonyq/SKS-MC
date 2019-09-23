<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<% request.setAttribute("_login_rd_time",System.currentTimeMillis()); %>
  <head>
    <title><dict:lang value="用户登录" />--<dict:lang value="摩尔标签云系统" /></title>
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
    <link rel="stylesheet" href="${path}plf/page/mlabel/css/login.css">
    <link rel="stylesheet" href="${path}plf/page/fp/css/fp-confirm.css">
    
    <style type="text/css">

         input:-webkit-autofill,
         textarea:-webkit-autofill,
         select:-webkit-autofill {
             -webkit-box-shadow: 0 0 0 26px #ffffff inset;
             -webkit-text-fill-color:#000;
         }  
         
         .chosen-container .chosen-single{
                height: 38px;
                line-height: 38px;
                background-color: transparent;
         }
         .chosen-container .chosen-single div b{
                width:18px;
                height:25px;
                margin-top:6.5px;
         }
    </style>
  </head>
  
  <body>
    <div class="main">
        <script src="${path}plf/page/mlabel/js/head.js"></script>
        <div id="ID1" class="center">
			<input id="input1" type="text"/>
			<button onclick="addInput();">add</button>
			<button onclick="next();">下一步</button>
        </div>
        
        <div id="ID2" style="display:none;">
        	<select id="selectId"></select>
        	<button onclick="pre();">上一步</button>
        </div>

       <script src="${path}plf/page/mlabel/js/foot.js"></script>
    </div>
    <div class="bottom"></div>
    
    <script type="text/javascript">
	function addInput(){
		$("#input1").after("<input type=\"text\"/>");
	}
	
	function next(){
		$("#selectId option").remove();
		$("input").each(function(i,item){
			$("#selectId").append("<option value='"+$(item).val()+"'>"+$(item).val()+"</option>");
		});
		
		$("#ID1").hide();
		$("#ID2").show();
	}
	
	function pre(){
		$("#ID2").hide();
		$("#ID1").show();
	}
         
    </script>
  </body>
  </html>