<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增注册控件" />
	</title>
		
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
	<style type="text/css">
	
	</style>
</head>
<body>
	<div class="all" >
		<div class="add_table_div">
			<form id="addForm" class="layui-form" name="addForm" action="${path}sys/cusControlAction_add.ms" method="post" enctype="multipart/form-data" target="submitFrame">
				<table class="add_table">
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="UI图标" />
						</td>
						<td colspan="4">
								<div id="photoImg">
									<img id="userPhoto" title="支持图像大小在<c:out value='${photoSizeInt}' />k以内" />
									<img id="preview" style="display: none;margin-bottom: 10px;height: 133px;width: 133px;"
										title="支持图像大小在<c:out value='${photoSizeInt}' />k以内"/> <input
										type="file" id="photo" name="upFile" lay-verify="required"
										onchange="javascript:setImagePreview();" /> <span class="Eng"><span
										id="userDto_photo_err"></span> </span>
								</div>
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="UI名称" />
						</td>
						<td colspan="4">
							<s:textfield cssStyle="width:100%"  id="uiName" name="cusControlDto.uiName"  />
						</td>
					</tr>
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="UI实现类" />
						</td>
						<td colspan="4">
								<s:textfield cssStyle="width:100%" id="uiClass" name="cusControlDto.uiClass"  />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="显示顺序" />
						</td>
						<td colspan="4">
								<s:textfield cssStyle="width:100%" id="showOrder" onkeyup="this.value=this.value.replace(/[^0-9]/gi,'')" name="cusControlDto.showOrder"  />
						</td>
					</tr>
					
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="资源zip文件" />
						</td>
						<td colspan="4">
								<div id="resfile">
										<input type="file" lay-verify="checkFil" id="reszipfilename" name="reszipfilename" onchange="javascript:reszipchange();"/> 
										
								</div>
						</td>
					</tr>
					
				</table>
				<div class="ptop_10 txac">
					<input type="button" value="<dict:lang value="清空" />" onclick="clean(this);" class="layui-btn layui-btn-normal">
					<input type="button" value="<dict:lang value="提交" />" lay-submit lay-filter="go" onclick="/*add(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
			</form>
		</div>
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	 //图片上传控件预览
	function setImagePreview() {
			var hhotoObj = document.getElementById("photo");
			var imgObjPreview = document.getElementById("preview");
			document.getElementById("userPhoto").style.display = "none";
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
	var isSumbit=false;
	var flag=false;
	var holderArr=null;//替换字符数组
	var paramArr=null;//参数数组
	function clean(){
		//util.confirm(cleanConfirm);
		cleanConfirm();
	}
	function returnBack(){
		document.forms.addForm1.submit();
	}
	$(function(){
		$("#uiName").attr("lay-verify","required");
		$("#uiClass").attr("lay-verify","required");
		$("#showOrder").attr("lay-verify","required|number");
	});
	layui.use('form', function(){
  	  	var form = layui.form;
  	  	form.verify({
  	  	checkFil: function(value,item){
		  	  	var obj=document.getElementById("reszipfilename");
				if(obj.value!='' && obj.value.indexOf('.zip')==-1){
					obj.value='';
					return '资源zip文件必须是zip格式';
				}
			}
	    });
  	  	form.on('submit(go)', function(data){
  	  		add();
	 	});
	});
	function cleanConfirm(){
		document.getElementById("preview").src = "";
		$("#photo").val("");
		$("#uiName").val("");
		$("#uiClass").val("");
		$("#showOrder").val("");
		$("#reszipfilename").val("");
		isSumbit=false;
		flag=false;
	}
	function cancel(){
		parent.closePopWin();
	}
	function add(){
		if(!vailCommit()){
			return;
		}
		if(isSubmit){
			document.forms.addForm.submit();
		}
		isSubmit = true;
	}
	function vailCommit(){
		var photo=$("#photo").val();
		var uiName=$("#uiName").val();
		var uiClass=$("#uiClass").val();
		var showOrder=$("#showOrder").val();
		if(val.isBlank(photo)){
			isSubmit=false;
			util.alert("<dict:lang value="ui图片必须上传" />");
			return false;
		}
		if(val.isBlank(uiName)){
			isSubmit=false;
			util.alert("<dict:lang value="ui名称必输" />");
			return false;
		}
		if(val.isBlank(uiClass)){
			isSubmit=false;
			util.alert("<dict:lang value="ui实现类必输" />");
			return false;
		}
		if(val.isBlank(showOrder)){
			isSubmit=false;
			util.alert("<dict:lang value="显示顺序必输" />");
			return false;
		}
		
		reszipchange();
		
		isSubmit=true;
		return true;
	}
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
		function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reszipchange(){
		var obj=document.getElementById("reszipfilename");
		if(obj.value!='' && obj.value.indexOf('.zip')==-1){
			obj.value='';
			util.alert("<dict:lang value="资源zip文件必须是zip格式" />");
			return false;
			
		}
	}
	
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>