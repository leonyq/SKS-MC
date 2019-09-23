<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="角色修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
	<div style="background-color: white;margin-top: 37px;">
			    <div class="optn">
			        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
				    <button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value="重置" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			<div style="height: 160px;">
	<form id="up_form" name="upForm" action="${path}sys/RoleAction_upRole.ms" method="post" target="submitFrame">
	<s:token />
	<s:hidden name="roleDto.id" />
	<s:hidden name="roleDto.name" /> 
	<input type="hidden" id="iframeId" name="paraMap.iframeId"/>
	<input type="hidden" id="role_name_s"/>
	<input type="hidden" id="role_remark_s"/>
	<table class="basic-table">
        <%-- <tr>
          <td colspan="6"><dict:lang value="角色名称" /><span class="Point"><dict:lang value="（带 " /><span class="Eng">*</span><dict:lang value=" 为必填项）" /></span></td>
       </tr> --%>
        <tr>
			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="角色名称" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" id="roleName" maxlength="30" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
				 <span class="Eng"><span id="roleDto_name_err"><c:out value='${errors["roleDto.name"][0]}' /></span></span>
			</td>
       </tr>
       <tr>
        <td style="width: 116px;text-align: right;"><dict:lang value="角色描述" /></td>
       	<td style="text-align: left;padding-left:5px; height: 80px;">
       		<textarea name="roleDto.remark" id="roleDto_remark" style="width: 200px;height: 100%;" maxlength="200" onkeyup="javascript:utilsFp.replaceLikeVal(this)"><s:property value="roleDto.remark"/></textarea>
       	</td>
       </tr>
     </table>
     </form>
     	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
   </div>
</div>

<script type="text/javascript">
	   window.onload=function(){
	 	$("#roleName").val($("#roleDto_name").val());
	 	$("#role_remark_s").val($("#roleDto_remark").val());
	 	$("#role_name_s").val($("#roleName").val());
	 };
	
	$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
    	
    });

	function edit(thisObj){
		$("#roleDto_name").val($("#roleName").val());
		if(!valData()){
			return ;
		}
		var len = $("#roleDto_remark").val().length;
		if(len>100){
			var roleDto_remark = document.getElementById("roleDto_remark");
			_alertValMsg(roleDto_remark,"<dict:lang value="角色描述长度不能超过规定长度" />");
			return ;
		}
		var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#roleDto_name").val());
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/RoleAction_roleNameVal.ms",
			    data: {
			    	"paraMap.roleName" : langs,
			    	"paraMap.roleId" : $("#roleDto_id").val()
			    },
				success: function(data){
						if(null == data){
						return ;}
						if(data.ajaxMap != null && data.ajaxMap.msg !=null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
						if(null != data.ajaxList){
							if (data.ajaxList.length>0) {
    							var roleDtoName = document.getElementById("roleName");
   								_alertValMsg(roleDtoName,"<dict:lang value="角色名称已存在" />");
				    			roleDtoName.focus();
				    			return false;
						}else{
							document.forms.up_form.submit();
// 							thisObj.onclick = function(){
// 							utilsFp.confirmIcon(1,"","","","<dict:lang value="数据正在提交，请稍候..." />",0,"300","");
// 							}; 
						}
							}
							
				},
					error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }	
				});
		}
      	function alertInfo(msg){
		utilsFp.confirmIcon(3,"","","", msg,0,"300","");
	}
    function valData(){
    	var roleDtoName = document.getElementById("roleDto_name");
    	if(val.isBlank(roleDtoName)){
   			_alertValMsg(roleDtoName,"<dict:lang value="角色名称不能为空" />");
    		roleDtoName.focus();
    		return false;
    	}
    	
    	return true;
    }
	//重置	
	function resetForm(){
	 	$("#roleDto_remark").val($("#role_remark_s").val());
	 	$("#roleName").val($("#role_name_s").val());
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>