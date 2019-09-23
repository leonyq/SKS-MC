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
            width: 400;
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
            padding-left: 10px;
        }

        .container .main p{
            margin-left: 85px;
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
    <div class='container'>
      
        <form id="add_form" class="layui-form" name="add_form" action="${path}picmg/picmgAction_addpicmg.ms" method="post" enctype="multipart/form-data">
        <input type="hidden" id="NODE_ID" name="paramMap.NODE_ID" value='<s:property value="paramMap.NODE_ID"/>' />
        <table class="add_table">
        	<tr>
        		
        		<td style="width: 370px;"  colspan="2">
        				<blockquote class="layui-elem-quote">
						支持图像<s:property value="ajaxMap.PIC_WIDTH"/>*<s:property value="ajaxMap.PIC_HEIGHT"/>,大小在<s:property value="ajaxMap.PIC_SIZE"/>KB以内
						</blockquote>
				</td>
				
        	</tr>
        	<tr>
        		
        		<td style="width: 370px;    padding-left: 110px;"  colspan="2">
						<img id="userPhoto" width="200px" height="200px"   />
				</td>
						
				
        	</tr>
        	<tr>
        		
        		<td style="width: 370px; padding-left: 110px; padding-top: 0;" colspan="2">
						<img width="200px" height="200px" id="preview" style="display: none;"/>
					
					<span class="layui-btn layui-btn-sm fileinput-button"">
			            <span>上传</span>
			            <!--  
			            <input type="file" lay-verify="checkPhoto" id="photo" name="upFile" onchange="javascript:setImagePreview(this);" /> 
			            -->
			            <input type="file" lay-verify="checkPhoto" id="photo" name="upFile" /> 
			        </span>
			        
					<span class="Eng"><span id="userDto_photo_err"></span>
					 <span id="errmsg2" style='color:red;'></span>
				</td>
						
				
        	</tr>
        	<tr>
        		<td style="width: 100px;" class="tr1 mc_form_title" >
						<span style='color:red;white-space: nowrap;display: inline-block;'>*</span><dict:lang value="文件名称" />
				</td>
						
				<td style="width: 270px;">
						<input type="text" lay-verify="checkVal" id="PIC_FILES_NAME" name="paramMap.PIC_FILES_NAME" value='<s:property value="ajaxMap.PIC_FILES_NAME"/>'>
                <span id="errmsg1" style='color:red;'></span>
				</td>
        	</tr>
        </table>
        <%--
        <div class="main">
        	<p style='padding-left:20px;color:red;'>
        			支持图像<s:property value="ajaxMap.PIC_WIDTH"/>*<s:property value="ajaxMap.PIC_HEIGHT"/>,大小在<s:property value="ajaxMap.PIC_SIZE"/>M以内
			</p></br>	
			
        	<p style='padding-left:20px;'>
					<img id="userPhoto" width="200px" height="200px"   />
					</br>
			</p></br>	
			
        	<p style='padding-left:20px;'>
					<img width="200px" height="200px" id="preview" style="display: none;"/>
					
					<input type="file" id="photo" name="upFile" onchange="javascript:setImagePreview();" /> 
						
					<span class="Eng"><span id="userDto_photo_err"></span> </span>
					 <span id="errmsg2" style='color:red;'></span>
			</p>
			</br>	
						
            <p >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>文件名称</span><span style='color:red;white-space: nowrap;display: inline-block;'>*</span>
                <input type="text" id="PIC_FILES_NAME" name="paramMap.PIC_FILES_NAME" value='<s:property value="ajaxMap.PIC_FILES_NAME"/>'>
                <span id="errmsg1" style='color:red;'></span>
            </p></br>

        </div>
         --%>
         <div class="ptop_10 txac">
			 
			 <input type="button" value="提交" class="layui-btn" lay-submit lay-filter="*" onclick="/*add()*/">
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
		 checkPhoto: function(value,item){
			 if (value=="") {
	                return '请先上传图片';
	         }
		 },
		 checkVal: function(value,item){
			   if (value=="") {
	                return '不能为空';
	           }
			   var PIC_FILES_NAME = document.getElementById("PIC_FILES_NAME");
			   if(PIC_FILES_NAME.value.indexOf("'")!=-1 || PIC_FILES_NAME.value.indexOf('"')!=-1 || PIC_FILES_NAME.value.indexOf('<')!=-1 || PIC_FILES_NAME.value.indexOf('>')!=-1 || PIC_FILES_NAME.value.indexOf('/')!=-1 || PIC_FILES_NAME.value.indexOf('?')!=-1){
				    PIC_FILES_NAME.value = PIC_FILES_NAME.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
				      
				    return '不能输入单引号双引号<>/?';
			   }
			   var pic_files_name=PIC_FILES_NAME.value;
			   if(pic_files_name.indexOf('.jpg')==-1 && pic_files_name.indexOf('.png')==-1 && pic_files_name.indexOf('.gif')==-1 && pic_files_name.indexOf('.bmp')==-1){
				   	
				   	return '上传图片格式不正确';
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

function add(){
    if(isSubmit){util.alert("数据正在提交，请稍候...")};
    
    document.getElementById("errmsg1").innerHTML="";
    document.getElementById("errmsg2").innerHTML="";
    
    var tp=document.getElementById("photo");

	if(tp.value==null || tp.value==''){
	   	document.getElementById("errmsg2").innerHTML="*请先上传图片";
	   	return false;
	}
    
	var PIC_FILES_NAME = document.getElementById("PIC_FILES_NAME");
	if(val.isBlank(PIC_FILES_NAME)){
	   	document.getElementById("errmsg1").innerHTML="*不能为空";
	   	return false;
	}
	
	//跨站脚本漏洞处理lth
    if(PIC_FILES_NAME.value.indexOf("'")!=-1 || PIC_FILES_NAME.value.indexOf('"')!=-1 || PIC_FILES_NAME.value.indexOf('<')!=-1 || PIC_FILES_NAME.value.indexOf('>')!=-1 || PIC_FILES_NAME.value.indexOf('/')!=-1 || PIC_FILES_NAME.value.indexOf('?')!=-1){
      PIC_FILES_NAME.value = PIC_FILES_NAME.value.replace(/\'/g,"").replace(/\"/g,"").replace(/\</g,"").replace(/\>/g,"").replace(/\//g,"").replace(/\?/g,"");
      document.getElementById("errmsg1").innerHTML="*不能输入单引号双引号<>/?";
      return false;
    }
	
	var pic_files_name=PIC_FILES_NAME.value;
	if(pic_files_name.indexOf('.jpg')==-1 && pic_files_name.indexOf('.png')==-1 && pic_files_name.indexOf('.gif')==-1 && pic_files_name.indexOf('.bmp')==-1){
	   	document.getElementById("errmsg1").innerHTML="*上传图片格式不正确";
	   	return false;
	}
	
	document.forms.add_form.submit();
	isSubmit = true;
	
}

$("#photo").on("change",function(){
	var PIC_WIDTH = "${ajaxMap.PIC_WIDTH}";
	var PIC_HEIGHT = "${ajaxMap.PIC_HEIGHT}";
	var PIC_SIZE = "${ajaxMap.PIC_SIZE}";
	
	var _this = this;
	var url = window.URL || window.webkitURL;
    //console.log(url.createObjectURL(this.files[0]));
    var imgSize = this.files[0].size;
    var img = new Image();
    img.src = url.createObjectURL(this.files[0]);
    img.onload = function () {
    	var imgHeight = this.height;
    	var imgWidth = this.width;
    	if(imgHeight<= PIC_HEIGHT){
    		if(imgWidth <= PIC_WIDTH){
    			if(imgSize <= (PIC_SIZE*1024) ){
    				setImagePreview();
    			}else {
    				 alterWindows("图片大小超过"+PIC_SIZE+"kb",5);
    				_this.value="";
    			}
    		}else {
    			alterWindows("图片宽度超过"+PIC_WIDTH+"px",5);
    			_this.value="";
    		}
    	}else {
    		alterWindows("图片高度超过"+PIC_HEIGHT+"px",5);
    		_this.value="";
    	}
    }
});

function setImagePreview() {
	var hhotoObj = document.getElementById("photo");
	var imgObjPreview = document.getElementById("preview");
	document.getElementById("userPhoto").style.display = "none";
	
	var tp=document.getElementById("photo");
	var fileName = $("#photo").val();
    var strFileName = fileName.substring(fileName.lastIndexOf("\\")+1); 
	document.getElementById("PIC_FILES_NAME").value=strFileName;
	
	if (hhotoObj.files && hhotoObj.files[0]) {
		//火狐下，直接設img属性
		imgObjPreview.style.display = 'block';
		imgObjPreview.src = window.URL
				.createObjectURL(hhotoObj.files[0]);
	} else {
		//IE下，使用滤镜
		//$("#photo").parent().show();
		hhotoObj.select();
		var imgSrc = document.selection.createRange().text;
		document.selection.empty();
		//$("#photo").parent().hide();
		var imgId = document.getElementById("photoImg");
		try {
			imgId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			imgId.filters
					.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		} catch (e) {
			utilsFp.confirmIcon(3, "", "", "",
					"<dict:lang value="您上传的图片格式不正确" />", 0, "300", "");
			return false;
		}
		imgObjPreview.style.display = 'none';
		//document.selection.empty();
	}
	return true;
}

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>