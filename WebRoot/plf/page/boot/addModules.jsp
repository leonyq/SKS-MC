<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="套件名称" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div>
			<form id="addForm" name="addForm" action="${path}sys/moduleMagAction_modulesList.ms" method="post" >
				<table class="add_table">
					<tr>
						<td colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<tr>
						<td width="30%" class="tr1">
							<dict:lang value="套件名称" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<s:textfield id="MODEL_NAME" maxlength="100" name="paraMap.MODEL_NAME"   cssClass="_VAL_NULL _VAL_DATABASE"   cssStyle="width:90%;" />
						</td>
					</tr>
						<tr>
						<td width="30%" class="tr1">
							<dict:lang value="套件展示名称" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<s:textfield id="MODELS_SHOW_NAME" maxlength="100" name="paraMap.MODELS_SHOW_NAME"  cssClass="_VAL_NULL _VAL_DATABASE"   cssStyle="width:90%;" />
						</td>
					</tr>
						<tr>
						<td width="30%" class="tr1">
							<dict:lang value="套件版本号" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<s:textfield id="MODELS_VERSION" maxlength="100" name="paraMap.MODELS_VERSION"  cssClass="_VAL_NULL _VAL_DATABASE"  cssStyle="width:90%;" />
						</td>
					</tr>
						<tr>
						<td width="30%" class="tr1">
							<dict:lang value="套件组名称" /><span class="Eng">*</span>
						</td>
						<td width="70%">
							<s:textfield  id="MODELS_NAME" maxlength="100" name="paraMap.MODELS_NAME"  cssClass="_VAL_NULL _VAL_DATABASE"  cssStyle="width:90%;" />
						</td>
					</tr>
					<tr>
						<td width="30%" class="tr1">
							<dict:lang value="套件说明" /><span class="Eng"></span>
						</td>
						<td width="70%">
							<s:textarea id="MODELS_MEMO" name="paraMap.MODELS_MEMO" rows="6" 
							cssStyle="width: 90%;overflow:auto;word-wrap:normal;height:200px" >
							</s:textarea>
						</td>
					</tr>
				</table>
				<s:hidden id="MODEL_ID" name="paraMap.ID"></s:hidden>
				<s:hidden id="MODELS_ID" name="paraMap.MODELS_ID"></s:hidden>
			</form>
		</div>
		<div class="ptop_10 txac">
			<input id="nextButton"type="button" value="<dict:lang value="下一步" />"  onclick="next(this);" class="botton_img_add">
			<input id="saveButton" type="button" value="<dict:lang value="取消" />" onclick="cancel(this);" class="botton_img_add">
		</div>
	</div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
	<jsp:include page="/plf/common/pub_dom.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

	<script type="text/javascript">
	var isSubmit=false;
	var isCan=false;
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function next(thisObj){
		vali();
		if(isSubmit){
			
			return false
		}
		document.forms.addForm.submit();
	}
	function vali(){
		var MODEL_NAME=$("#MODEL_NAME").val();
		var MODELS_SHOW_NAME=$("#MODELS_SHOW_NAME").val();
		var MODELS_VERSION=$("#MODELS_VERSION").val();
		var MODELS_NAME=$("#MODELS_NAME").val();
		
		var regx1=/^[A-Za-z]+$/
		var regx2=/^[\u4e00-\u9fa5a-zA-Z0-9]+$/
		var regx3=/^[0-9]*.*[0-9]$/ 
		var regx4=/^[a-zA-Z]*.*[a-zA-Z]$/
		if(val.isBlank(MODEL_NAME)){
			util.alert("套件名称不能为空");
			isSubmit=true
			return;
		}
		
		if(!regx1.test(MODEL_NAME)){
			isSubmit=true
			util.alert("套件名称只能输入英文")
			return
		}
		if(val.isBlank(MODELS_SHOW_NAME)){
			util.alert("套件展示名称不能为空");
			isSubmit=true
			return;
		}
		if(!regx2.test(MODELS_SHOW_NAME)){
			isSubmit=true
			util.alert("套件展示名称不能输入符号")
			return
		}
		if(val.isBlank(MODELS_VERSION)){
			util.alert("套件版本号不能为空");
			isSubmit=true
			return;
		}
		if(!regx3.test(MODELS_VERSION)){
			isSubmit=true
			util.alert("套件版本号只能输入数字和 .且头尾不能为.")
			return
		}
		if(val.isBlank(MODELS_NAME)){
			util.alert("套件组名称不能为空");
			isSubmit=true
			return;
		}
		if(!regx4.test(MODELS_NAME)){
			isSubmit=true
			util.alert("套件组名称只能输入英文和 .且头尾不能为.")
			return
		}
		checkOnly();
		if(isCan){
			return
		}
		isSubmit=false
	}
	function cancel(obj){
		parent.closePopWin();
	}
	function checkOnly(){
		var MODEL_NAME=$("#MODEL_NAME").val();
		var MODELS_SHOW_NAME=$("#MODELS_SHOW_NAME").val();
		var MODELS_VERSION=$("#MODELS_VERSION").val();
		var MODELS_NAME=$("#MODELS_NAME").val();
		var MODEL_ID=$("#MODEL_ID").val();
		var names=MODELS_NAME+"."+MODEL_NAME+"."+MODELS_VERSION
		$.ajax({
			type: "POST",
		    dataType: "json",
		    async:false,
		    data: {
		    	"paraMap.names":names,
		    	"paraMap.model_id":MODEL_ID
		    },
		    url: "${path}sys/moduleMagAction_checkMName.ms",
			success: function(data){
				console.log(data.ajaxMap.status=='false')
				if(data.ajaxMap.status=='false'){
					util.alert(data.ajaxMap.info);
					isSubmit=true
					isCan=true;
					return
				}else{
					isSubmit=false;
					isCan=false;
					return ;
				}
			},
			error: function(msg){
				util.closeLoading();
			}
		});
	}
	</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>