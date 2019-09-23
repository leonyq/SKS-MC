<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="修改类别" /> 
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			 <jsp:param name="layui" value="1" />
			<jsp:param name="popDivWin" value="1" />
		</jsp:include>
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
</head>

    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
    <title></title>
    
</head>
<body>
    
        <div  class="add_table_div">
        <form id="add_form" name="add_form" class="layui-form" action="${path}comm/WorkFlowAction_saveFlowType.ms" method="post" target="submitFrame">
        
        	<table class="add_table">
        		<tr  height="130px">
						<td style="width: 100px;" class="tr1 title">
							<span class="Eng">*</span><dict:lang value="名称" />
						</td>
						
						<td style="width: 270px;">
						    <input type="hidden" id="flowId" name="paraMap.flowId" value='${paraMap.flowId }' >
							<input type="text" id="flowName" name="paraMap.flowName" value='${paraMap.flowName }' lay-verify="required">
						</td>
				</tr>
				
        	</table>
    
        <div class="ptop_10 txac">
					
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit"><dict:lang value="提交" /></button>
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div>
        </form>
        </div>
   <div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
    <jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
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



$(function(){
		layui.use('form', function(){
	    	  var form = layui.form;  	  
			
			form.on('submit(filterSubmit)', function (data) {
		       return true;
				       
			}); 
           
	    });
	    
	});

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>