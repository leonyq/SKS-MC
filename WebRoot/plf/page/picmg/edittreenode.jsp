<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="统一图片管理" /> 
	</title>
	<jsp:include page="/plf/common/pub_head.jsp" >
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
		
	</jsp:include>
	<link rel="stylesheet" href="${path}/plf/style/layui/layuiadmin/layui/css/layui.css" media="all">
	 <script src="${path}/plf/style/layui/layuiadmin/layui/layui.js"></script>
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
            width: 330;
            height: 150;
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
            padding-top: 20px;
        }

        .container .main p{
            margin-left: 140px;
        }
        
        .container .main p span{
            display: inline-block;
            width: 50;
            text-align: right;
        }

        .container .main p input[type="text"]{          
            width: 180px;
            height: 26px;
            border: 1px solid #a9a9a9;
            padding-left: 5px;
        }
    </style>
</head>
<body>
    <div class='container'>
      
        <form id="add_form" class="layui-form" name="add_form" action="${path}picmg/picmgAction_edittreenode.ms" method="post" >
        <input type="hidden" id="id" name="paramMap.ID" value='<s:property value="paramMap.ID"/>' />
        <table class="add_table">
        	<tr>
        		<td style="width: 100px;" class="tr1 mc_form_title">
						<span style='color:red;white-space: nowrap;display: inline-block;'>*</span><dict:lang value="节点名称" />
				</td>
						
				<td style="width: 270px;">
						<input type="text" lay-verify="required" id="NODE_NAME" maxlength="100" name="paramMap.NODE_NAME" value='<s:property value="ajaxMap.NODE_NAME"/>'>
                		<span id="errmsg1" style='color:red;'></span>
				</td>
        	</tr>
        	<tr>
        		<td style="width: 100px;" class="tr1 mc_form_title">
						<span style='color:red;white-space: nowrap;display: inline-block;'>*</span><dict:lang value="上传路径" />
				</td>
						
				<td style="width: 270px;">
						<input type="text" lay-verify="required" id="PIC_PATH" maxlength="50" name="paramMap.PIC_PATH" value='<s:property value="ajaxMap.PIC_PATH"/>'>
                		<span id="errmsg2" style='color:red;'></span>
				</td>
        	</tr>
        	<tr>
        		<td style="width: 100px;" class="tr1 mc_form_title">
						<span style='color:red;white-space: nowrap;display: inline-block;'>*</span><dict:lang value="图片宽度(PX)" />
				</td>
						
				<td style="width: 270px;">
						<input type="text" lay-verify="numVerify" id="PIC_WIDTH" maxlength="10" name="paramMap.PIC_WIDTH" value='<s:property value="ajaxMap.PIC_WIDTH"/>'>
                		<span id="errmsg3" style='color:red;'></span>
				</td>
        	</tr>
        	<tr>
        		<td style="width: 100px;" class="tr1 mc_form_title">
						<span style='color:red;white-space: nowrap;display: inline-block;'>*</span><dict:lang value="图片高度(PX)" />
				</td>
						
				<td style="width: 270px;">
						<input type="text" lay-verify="numVerify" id="PIC_HEIGHT" maxlength="10" name="paramMap.PIC_HEIGHT" value='<s:property value="ajaxMap.PIC_HEIGHT"/>'>
                		<span id="errmsg4" style='color:red;'></span>
				</td>
        	</tr>
        	<tr>
        		<td style="width: 100px;" class="tr1 mc_form_title">
						<span style='color:red;white-space: nowrap;display: inline-block;'>*</span><dict:lang value="文件大小(KB)" />
				</td>
						
				<td style="width: 270px;">
						<input type="text" lay-verify="numVerify" id="PIC_SIZE" maxlength="10" name="paramMap.PIC_SIZE" value='<s:property value="ajaxMap.PIC_SIZE"/>'>
                		<span id="errmsg5" style='color:red;'></span>
				</td>
        	</tr>
        </table>
        <%-- 
        <div class="main">
            <p>
                                节点名称<span style='color:red;white-space: nowrap;display: inline-block;'>*</span>
                <input type="text" id="NODE_NAME" name="paramMap.NODE_NAME" value="<s:property value="ajaxMap.NODE_NAME"/>">
                <span id="errmsg1" style='color:red;'></span>
            </p></br>
            
            <p>
                                 上传路径<span style='color:red;white-space: nowrap;display: inline-block;'>*</span>
                <input type="text" id="PIC_PATH" name="paramMap.PIC_PATH" value="<s:property value="ajaxMap.PIC_PATH"/>">
                <span id="errmsg2" style='color:red;'></span>
            </p></br>
            
            <p>
                                图片宽度<span style='color:red;white-space: nowrap;display: inline-block;'>*</span>
                <input type="text" id="PIC_WIDTH" name="paramMap.PIC_WIDTH" value='<s:property value="ajaxMap.PIC_WIDTH"/>' maxlength="5">&nbsp;PX
                <span id="errmsg3" style='color:red;'></span>
            </p></br>
            
            <p>
                                图片高度<span style='color:red;white-space: nowrap;display: inline-block;'>*</span>
                <input type="text" id="PIC_HEIGHT" name="paramMap.PIC_HEIGHT" value='<s:property value="ajaxMap.PIC_HEIGHT"/>' maxlength="5">&nbsp;PX
                <span id="errmsg4" style='color:red;'></span>
            </p></br>
            
             <p>
                               文件大小<span style='color:red;white-space: nowrap;display: inline-block;'>*</span>
                <input type="text" id="PIC_SIZE" name="paramMap.PIC_SIZE" value='<s:property value="ajaxMap.PIC_SIZE"/>' maxlength="3">&nbsp;M(兆)
                <span id="errmsg5" style='color:red;'></span>
            </p>
            
        </div>
        --%>
        <div class="ptop_10 txac">
			 
			 <input type="button" value="提交" class="layui-btn" lay-submit lay-filter="*" onclick="/*edit()*/">
			<input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div>
        </form>
        
    </div>
    
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
	  //监听提交
	 form.verify({
		numVerify: function(value,item){
			   if (value==""||/[^0-9]/gi.test(value)) {
	                return '不能为空且只能填入数字';
	            }
		    }
  });
	form.on('submit(*)', function(data){
		document.forms.add_form.submit();
		  //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
		  //console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
		  //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
		  //return true; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
});
function edit(){
    if(isSubmit){util.alert("数据正在提交，请稍候...")};
    
    document.getElementById("errmsg1").innerHTML="";
    document.getElementById("errmsg2").innerHTML="";
    document.getElementById("errmsg3").innerHTML="";
    document.getElementById("errmsg4").innerHTML="";
    document.getElementById("errmsg5").innerHTML="";
 
	var NODE_NAME = document.getElementById("NODE_NAME");
	if(val.isBlank(NODE_NAME)){
	   	document.getElementById("errmsg1").innerHTML="*不能为空";
	   	return false;
	}
	if(NODE_NAME.value.indexOf("'")!=-1 || NODE_NAME.value.indexOf('"')!=-1 || NODE_NAME.value.indexOf('<')!=-1 || NODE_NAME.value.indexOf('>')!=-1 || NODE_NAME.value.indexOf('?')!=-1){
      NODE_NAME.value = NODE_NAME.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\?/g,"");
      document.getElementById("errmsg1").innerHTML="*不能输入单引号双引号<>?";
      return false;
    }
	
	var PIC_PATH = document.getElementById("PIC_PATH");
	if(val.isBlank(PIC_PATH)){
	   	document.getElementById("errmsg2").innerHTML="*不能为空";
	   	return false;
	}
	
    //跨站脚本漏洞处理lth
    if(PIC_PATH.value.indexOf("'")!=-1 || PIC_PATH.value.indexOf('"')!=-1 || PIC_PATH.value.indexOf('<')!=-1 || PIC_PATH.value.indexOf('>')!=-1 || PIC_PATH.value.indexOf('?')!=-1 || PIC_PATH.value.indexOf(':')!=-1){
      PIC_PATH.value = PIC_PATH.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\?/g,"").replace(/\:/g,"");
      document.getElementById("errmsg2").innerHTML="*不能输入单引号双引号<>?:";
      return false;
    }
	
	var PIC_WIDTH = document.getElementById("PIC_WIDTH");
	if(val.isBlank(PIC_WIDTH)){
	   	document.getElementById("errmsg3").innerHTML="*不能为空";
	   	return false;
	}else{
		if(isNaN(PIC_WIDTH.value)){
			document.getElementById("errmsg3").innerHTML="*只能是数字";
	   		return false;
		}
			
	}
	
	var PIC_HEIGHT = document.getElementById("PIC_HEIGHT");
	if(val.isBlank(PIC_HEIGHT)){
	   	document.getElementById("errmsg4").innerHTML="*不能为空";
	   	return false;
	}else{
		if(isNaN(PIC_HEIGHT.value)){
			document.getElementById("errmsg4").innerHTML="*只能是数字";
	   		return false;
		}
			
	}
	
	var PIC_SIZE = document.getElementById("PIC_SIZE");
	if(val.isBlank(PIC_SIZE)){
	   	document.getElementById("errmsg5").innerHTML="*不能为空";
	   	return false;
	}else{
		if(isNaN(PIC_SIZE.value)){
			document.getElementById("errmsg5").innerHTML="*只能是数字";
	   		return false;
		}
			
	}
		
	document.forms.add_form.submit();
	isSubmit = true;
	
}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>