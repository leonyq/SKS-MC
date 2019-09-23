<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="钉钉平台企业" /> 
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
</head>

    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
    <title></title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
    
        html,body{
            height: 100%;
            font-size:12px;
        }
    
        .container{
            width: 620px;
            height: 310px;
            padding-top:2px; 
        }

        .container .top{
            background-color: #e8f5fc;
            height: 36px;
            border: 1px solid #a8c7ce;
            text-align: right;
            padding: 0 5px;
            box-sizing: border-box;
        }

        .container .top input[type='button']{
            margin-top: 5px;
        }

        .container .main{
            padding-top: 60px;
        }

        .container .main p{
            margin-left: 180px;
        }
        
        .container .main p span{
            display: inline-block;
            width: 70px;
            text-align: right;
        }

        .container .main p input[type="text"]{          
            width: 160px;
            height: 26px;
            border: 1px solid #a9a9a9;
            padding-left: 5px;
        }
    </style>
</head>
<body>
    <%-- <div class='container'>
        <div class="top">
            <input type="button" value="测试" class="botton_img_search" onclick="testcorp()">
            <input type="button" value="确定" class="botton_img_add" onclick="configcorp()">
        </div>--%>
        <div  class="add_table_div">
        <form id="add_form" class="layui-form" name="add_form" action="${path}ding/dingAction_configcorp.ms" method="post" >
        <input type="hidden" id="dept" name="paramMap.DEPT_ID" value='<s:property value="paraMap.DEPT_ID"/>' />
        <table class="add_table">
        		<tr>
						<td style="width:77px;" class="tr1 mc_form_title mc_form_title">
							开发者ID
						</td>
						
						<td style="width: 270px;">
							<input type="text" lay-verify="required" id="DING_CORP_ID" name="paramMap.DING_CORP_ID" value='<s:property value="ajaxMap.DING_CORP_ID"/>'>
						</td>
				</tr>
				<tr>
						<td style="width: 77px;" class="tr1 mc_form_title mc_form_title">
							开发者密钥
						</td>
						
						<td style="width: 270px;">
							<input type="text" lay-verify="required" id="DING_CORP_SECRET" name="paramMap.DING_CORP_SECRET" value='<s:property value="ajaxMap.DING_CORP_SECRET"/>'>
						</td>
				</tr>
        	</table>
        	<%-- 
        <div class="main">
            <p>
                <span>开发者ID</span>
                <input type="text" id="DING_CORP_ID" name="paramMap.DING_CORP_ID" value='<s:property value="ajaxMap.DING_CORP_ID"/>'>
            </p>
            <p style="margin-top: 30px;">
                <span>开发者密钥</span>
                <input type="text" id="DING_CORP_SECRET" name="paramMap.DING_CORP_SECRET" value='<s:property value="ajaxMap.DING_CORP_SECRET"/>'>
            </p>
        </div>--%>
        <div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="测试" />" lay-submit lay-filter="got" onclick="/*testcorp();*/" class="layui-btn layui-btn-normal ">
					
					<input type="button" value="<dict:lang value="确定" />" lay-submit lay-filter="goc" onclick="/*configcorp();*/" class="layui-btn ">
		</div>
        </form>
        </div>
    <%--</div>--%>
    
    <script>
        
    </script>
</body>
</html>

<script type="text/javascript">
var isSubmit = false;
function reloadPg(msg){
	isSubmit = false;
	window.parent.reloadPg(msg);
}

function alertInfo(msg){
	isSubmit = false;
	util.alert(msg);
}
layui.use('form', function(){
	  var form = layui.form;
	
	form.on('submit(got)', function(data){
		testcorp();
	});
	form.on('submit(goc)', function(data){
		configcorp();
	});
});
function testcorp(){
	var DING_CORP_ID = document.getElementById("DING_CORP_ID");
	if(val.isBlank(DING_CORP_ID)){
	   	util.alert("开发者ID不能为空");
	   	return false;
	}
	
	var DING_CORP_SECRET = document.getElementById("DING_CORP_SECRET");
	if(val.isBlank(DING_CORP_SECRET)){
	   	util.alert("开发者密钥不能为空");
	   	return false;
	}
	
	$.ajax({
           url:'${path}ding/dingAction_testcorp.ms',
           type:'GET',
           dataType:'json',
           data: {
           	"paramMap.DING_CORP_ID":DING_CORP_ID.value,
           	"paramMap.DING_CORP_SECRET":DING_CORP_SECRET.value
           },
           success:function (res) {
               if(res.ajaxMap.result=='0'){
               		util.alert("开发者ID密钥有效");
               }else if(res.ajaxMap.result=='2'){
               		util.alert("开发者ID：包含非法字符，请检查");
               }else if(res.ajaxMap.result=='3'){
               		util.alert("开发者密钥：包含非法字符，请检查");
               }else{
               		util.alert("开发者ID密钥无效");
               }
               
           }
     });
	
}

function configcorp(){
    if(isSubmit){util.alert("数据正在提交，请稍候...")};
 
	var DING_CORP_ID = document.getElementById("DING_CORP_ID");
	if(val.isBlank(DING_CORP_ID)){
	   	util.alert("开发者ID不能为空");
	   	return false;
	}
	
	var DING_CORP_SECRET = document.getElementById("DING_CORP_SECRET");
	if(val.isBlank(DING_CORP_SECRET)){
	   	util.alert("开发者密钥不能为空");
	   	return false;
	}
		
	document.forms.add_form.submit();
	isSubmit = true;
	
}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>