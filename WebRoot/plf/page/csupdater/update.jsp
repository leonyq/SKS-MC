<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="编辑文件" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="saveForm" class="layui-form" name="addForm" action="${path}sys/CsUpdateAction_saveForUpdate.ms" method="post" 
			target="submitFrame" enctype="multipart/form-data">
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="文件" />
						</td>
						<td  style="width: 270px;"><!-- paraMap.FILE_NAME -->
							<span id="fileName"><s:property value="paraMap.FILE_NAME"/></span><input type="file" lay-verify="checkFil" id="upfilename" name="upfile" size="1"  onchange="hidName()">
							<input type="hidden" id="file_id" name="paraMap.ID"  value="<s:property value="paraMap.ID"/>">
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="保存路径" />
						</td>
						<td style="width: 270px;">
							<s:textfield readonly="true" name="paraMap.FILE_PATH" cssStyle="width:100%;"/>
						</td>
					</tr>
					<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="说明" />
						</td>
						<td style="width: 270px;">
							<input type="text" lay-verify="required|checkPath" maxlength="300" id="FILE_MEMO" name="paraMap.FILE_MEMO" class="_VAL_NULL _VAL_DATABASE" value="<s:property value="paraMap.FILE_MEMO"/>"  style="width:100%;" />
						</td>
					</tr>
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
	var canSubmit=true;
	function hidName(){
		var upfilename=$("#upfilename").val();
		var pos=upfilename.lastIndexOf("\\");
		var upName=upfilename.substring(pos+1);
		var fileName=$("#fileName").text();
		if(upName.trim()==fileName.trim()){
			canSubmit=true;
			$("#fileName").css("display","none")
		}else{
			canSubmit=false;
			//util.alert("上传文件名不一致,请重新上传");	
		}
	}
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
  		form.render("select");
  		form.verify({
  			checkFil: function(value,item){
  				if(!canSubmit){
  					return "上传文件名不一致,请重新上传";	
  				}
  			},
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
	function save(thisObj){
		if(canSubmit){
			
	
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		/* if(!valData()){
			return ;
		} */
		document.forms.saveForm.submit();
		}else{
			util.alert("上传文件名不一致,请重新上传");	
		}
   
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