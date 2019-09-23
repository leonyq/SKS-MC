<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="编辑企业模板" /> 
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
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
            width: 810px;
            height: 420px;
            padding-top: 6px;
            box-sizing: border-box;
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
            padding-top: 30px;
        }

        .container .main p{
            margin-top: 20px;
        }

        .container .main p .title{
            display: inline-block;
            width: 70px;
            text-align: right;
            margin-right: 5px;
            vertical-align: top;
            line-height: 25px;
        }

        .container .main p input{
            height: 25px;
            width: 300px;
            border: 1px solid #a9a9a9;
            padding-left: 5px;
            box-sizing: border-box;
        }

        .container .main p textarea{
            resize: none;
            width: 300px;
            height: 130px;
            padding: 5px;
            box-sizing: border-box;
            outline: none;
        }
    </style>
</head>
<body>
    <div class=''>
        <%-- 
        <div class="top">
            <input type="button" value="确定" class="botton_img_add" onclick="edittp()">
            <input type="button" value="取消" class="botton_img_search" onclick="cancel();">
        </div>
        --%>
        <div class="add_table_div">
        <form id="edit_form" class="layui-form" name="edit_form" action="${path}wx/wxAction_edittp.ms" method="post" >
        <input type="hidden" id="dept_id" name="paramMap.DEPT_ID" value='<s:property value="paramMap.DEPT_ID"/>' />
        <input type="hidden" id="id" name="paramMap.ID" value='<s:property value="paramMap.ID"/>' />
        <table class="add_table">
        	<tr>
				<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="标题" />
				</td>
				<td style="width: 270px;">
							<input type="text" lay-verify="required|checkV1" id="TITLE" name="paramMap.TITLE" value="<s:property value="ajaxMap.TITLE"/>">
				</td>
				<td>
					&nbsp;
				</td>
				<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="编码" />
				</td>
				<td style="width: 270px;">
							<input type="text" lay-verify="required|checkV2" id="CODE" name="paramMap.CODE" value='<s:property value="ajaxMap.CODE"/>'>
				</td>
			</tr>
			<tr>
				<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="模板ID" />
				</td>
				<td style="width: 270px;">
							<input type="text" lay-verify="required|checkV3" id="TEMPLATE_ID" name="paramMap.TEMPLATE_ID" value='<s:property value="ajaxMap.TEMPLATE_ID"/>'>
				</td>
				<td>
					&nbsp;
				</td>
				<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="场景" />
				</td>
				<td style="width: 270px;">
							<input type="text" lay-verify="checkV4" id="SCENE" name="paramMap.SCENE" value='<s:property value="ajaxMap.SCENE"/>'>
				</td>
			</tr>
			<tr>
				<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="模板内容" />
				</td>
				<td style="width: 270px;">
							<textarea id="TEMPLATE" lay-verify="required" style="width:100%;height:170px;" name="paramMap.TEMPLATE" maxlength="3000"><s:property value="ajaxMap.TEMPLATE"/></textarea>
				</td>
				<td>
					&nbsp;
				</td>
				<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="模板示例" />
				</td>
				<td style="width: 270px;">
							<textarea id="EXAMPLE" style="width:100%;height:170px;" name="paramMap.EXAMPLE" maxlength="3000"><s:property value="ajaxMap.EXAMPLE"/></textarea>
				</td>
			</tr>
        </table>
        <%-- 
        <div class="main" style="display: none;">
            <p>
                <span class="title"><span style="color:red;">*</span>标题</span>
                <input type="text" id="TITLE" name="paramMap.TITLE" value="<s:property value="ajaxMap.TITLE"/>">
                <span class="title"><span style="color:red;">*</span>编码</span>
                <input type="text" id="CODE" name="paramMap.CODE" value="<s:property value="ajaxMap.CODE"/>">
            </p>
            <p>
                <span class="title"><span style="color:red;">*</span>模板ID</span>
                <input type="text" id="TEMPLATE_ID" name="paramMap.TEMPLATE_ID" value="<s:property value="ajaxMap.TEMPLATE_ID"/>">
                <span class="title">场景</span>
                <input type="text" id="SCENE" name="paramMap.SCENE" value='<s:property value="ajaxMap.SCENE"/>'>
            </p>
            <p>
                <span class="title" style="line-height: 130px;"><span style="color:red;">*</span>模板内容</span>
                <textarea id="TEMPLATE" name="paramMap.TEMPLATE" maxlength="3000"><s:property value="ajaxMap.TEMPLATE"/></textarea>
                <span class="title" style="line-height: 130px;">模板示例</span>
                <textarea id="EXAMPLE" name="paramMap.EXAMPLE" maxlength="3000"><s:property value="ajaxMap.EXAMPLE"/></textarea>
            </p>
        </div>
        --%>
        <div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="*" onclick="/*edittp();*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
        </form>
        </div>
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

function cancel(){
	parent.closePopWin();
}
layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
	 form.verify({
		 checkV1: function(value,item){
			 if(value.indexOf("'")!=-1 ||value.indexOf('"')!=-1 ||value.indexOf('<')!=-1 ||value.indexOf('>')!=-1 ||value.indexOf('/')!=-1 ||value.indexOf('?')!=-1){
			     value =value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
			      return "标题不能输入单引号双引号<>/?";
			 }
		 },
		 checkV2: function(value,item){
			 if(value.indexOf("'")!=-1 ||value.indexOf('"')!=-1 ||value.indexOf('<')!=-1 ||value.indexOf('>')!=-1 ||value.indexOf('/')!=-1 ||value.indexOf('?')!=-1){
			     value =value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
			      return "编码不能输入单引号双引号<>/?";
			 }
		 },
		 checkV3: function(value,item){
			 if(value.indexOf("'")!=-1 ||value.indexOf('"')!=-1 ||value.indexOf('<')!=-1 ||value.indexOf('>')!=-1 ||value.indexOf('/')!=-1 ||value.indexOf('?')!=-1){
			     value =value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
			      return "模板ID不能输入单引号双引号<>/?";
			 }
		 },
		 checkV4: function(value,item){
			 if(!val.isBlank(value)){
				 if(value.indexOf("'")!=-1 ||value.indexOf('"')!=-1 ||value.indexOf('<')!=-1 ||value.indexOf('>')!=-1 ||value.indexOf('/')!=-1 ||value.indexOf('?')!=-1){
				     value =value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
				      return "场景不能输入单引号双引号<>/?";
				 }
			 }
		 }
});
	form.on('submit(*)', function(data){
		edittp();
	});
});
function edittp(){
    if(isSubmit){util.alert("数据正在提交，请稍候...")};
 
	var TITLE = document.getElementById("TITLE");
	if(val.isBlank(TITLE)){
	   	util.alert("标题不能为空");
	   	return false;
	}
	
	if(TITLE.value.indexOf("'")!=-1 || TITLE.value.indexOf('"')!=-1 || TITLE.value.indexOf('<')!=-1 || TITLE.value.indexOf('>')!=-1 || TITLE.value.indexOf('/')!=-1 || TITLE.value.indexOf('?')!=-1){
      TITLE.value = TITLE.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
      util.alert("标题不能输入单引号双引号<>/?");
      return false;
    }
	
	var CODE = document.getElementById("CODE");
	if(val.isBlank(CODE)){
	   	util.alert("编码不能为空");
	   	return false;
	}
	
	if(CODE.value.indexOf("'")!=-1 || CODE.value.indexOf('"')!=-1 || CODE.value.indexOf('<')!=-1 || CODE.value.indexOf('>')!=-1 || CODE.value.indexOf('/')!=-1 || CODE.value.indexOf('?')!=-1){
      CODE.value = CODE.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
      util.alert("编码不能输入单引号双引号<>/?");
      return false;
    }
	
	var TEMPLATE_ID = document.getElementById("TEMPLATE_ID");
	if(val.isBlank(TEMPLATE_ID)){
	   	util.alert("模板ID不能为空");
	   	return false;
	}
	
	if(TEMPLATE_ID.value.indexOf("'")!=-1 || TEMPLATE_ID.value.indexOf('"')!=-1 || TEMPLATE_ID.value.indexOf('<')!=-1 || TEMPLATE_ID.value.indexOf('>')!=-1 || TEMPLATE_ID.value.indexOf('/')!=-1 || TEMPLATE_ID.value.indexOf('?')!=-1){
      TEMPLATE_ID.value = TEMPLATE_ID.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
      util.alert("模板ID不能输入单引号双引号<>/?");
      return false;
    }
    
    var SCENE = document.getElementById("SCENE");
    if(!val.isBlank(SCENE)){
    	if(SCENE.value.indexOf("'")!=-1 || SCENE.value.indexOf('"')!=-1 || SCENE.value.indexOf('<')!=-1 || SCENE.value.indexOf('>')!=-1 || SCENE.value.indexOf('/')!=-1 || SCENE.value.indexOf('?')!=-1){
	      SCENE.value = SCENE.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
	      util.alert("场景不能输入单引号双引号<>/?");
	      return false;
	    }
	    
    }
	
	var TEMPLATE = document.getElementById("TEMPLATE");
	if(val.isBlank(TEMPLATE)){
	   	util.alert("模板内容不能为空");
	   	return false;
	}
		
	document.forms.edit_form.submit();
	isSubmit = true;
	
}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>