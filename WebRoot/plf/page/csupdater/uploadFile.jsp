<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="上传文件" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="saveForm" class="layui-form" name="addForm" action="${path}sys/CsUpdateAction_saveFileUploaded.ms" method="post" 
			target="submitFrame" enctype="multipart/form-data">
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="文件" />
						</td>
						<td style="width: 270px;"><!-- paraMap.FILE_NAME -->
							<input type="file" lay-verify="required" id="FILE_NAME" name="upfile" size="1" >
							<input type="hidden" id="upfilename" name="upfileFileName"  >
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="保存路径" />
						</td>
						<td style="width: 270px;">
							<input type="text" id="FILE_PATH" maxlength="100" 
							name="paraMap.FILE_PATH" lay-verify="required|checkPath" 
							onkeyup="replaceLikeVal(this)"
							value="<s:property value="paraMap.FILE_PATH"/>" 
							class="_VAL_NULL _VAL_DATABASE" 
							style="width:100%;" />
						</td>
					</tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="说明" />
						</td>
						<td style="width: 270px;">
							<input type="text" maxlength="300" id="FILE_MEMO" 
							name="paraMap.FILE_MEMO" lay-verify="required|checkPath"
							onkeyup="javascript:replaceLikeVal(this)"
							class="_VAL_NULL _VAL_DATABASE" 
							value="<s:property value="paraMap.FILE_MEMO"/>"  
							style="width:100%;" />
						</td>
					</tr>
					<s:hidden name="paraMap.TYPE"></s:hidden>
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="go" onclick="/*save(this);*/" class="layui-btn">
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>				
			</form>
		</div>
	</div>

	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	function replaceLikeVal(comp){
	        if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
	        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
	        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1) {  
	            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
	            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"");
	            //util.alter("不能输入单引号双引号<>{}()[]");
	        }  
	}
	layui.use('form', function(){
  	  	var form = layui.form;
  		form.render("select");
  		form.verify({
  			checkPath: function(value,item){
  				if (value.indexOf("'") != -1 ||value.indexOf("\"") != -1||value.indexOf("<") != -1||value.indexOf(">") != -1
  		        		||value.indexOf("{") != -1||value.indexOf("}") != -1||value.indexOf("[") != -1||value.indexOf("]") != -1
  		        		||value.indexOf("(") != -1||value.indexOf(")") != -1) {  
  		           
  		            return '不能输入单引号双引号<>{}()[]';
  		        }  
  			}
  	    });
  		form.on('submit(go)', function(data){
  			save();
  	 	});
	});
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function save(thisObj){
		document.forms.saveForm.submit();
		isSubmit = true;
	}
	
	function init(){
		changeReType();
	}
	function changeReType(){
		var type=$("#TYPE").val();
		if(type=="0"){
			$("#interface").hide();
		}else{
			$("#interface").show();
		}
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>