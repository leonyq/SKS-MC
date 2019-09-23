<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="部门信息修改" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
	<div style="background-color: white;margin-top: 50px;padding-top: 10px;">
			    <div class="optn" style="top:10px;">
			        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value='保存' /> </button>
				    <button type="button" onclick="resetForm();"><i class="ico ico-gk"></i><dict:lang value='重置' /> </button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value='取消' /> </button>
			    </div>
			<div style="height: 290px;">
	<form id="up_form" name="upForm" action="${path}sys/DeptAction_upDept.ms" method="post" target="submitFrame">
	<s:token />
	<s:hidden name="deptDto.id" />
	<s:hidden  id="isAuth_s" name="deptDto.isAuth" />
	<s:hidden id="deptDtoUp_id" name="deptDtoUp.id" />
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<c:out value='${iframeId}'/>"/>
	<table class="basic-table">
        <%-- <tr>
          <td colspan="6"><dict:lang value="部门信息修改" /><span class="Point"><dict:lang value="（带 " /><span class="Eng">*</span><dict:lang value=" 为必填项）" /></span></td>
       </tr> --%>
        <tr>
			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="部门名称" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="deptDto.name" maxlength="150" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
				 <br /><span id="deptDto_name_err" class="Eng"><c:out value='${errors["deptDto.name"][0]}'/></span>
			</td>
			<%-- <td width="20%" class="name">所属地区</td>
			<td width="30%">
				<dict:selectDict dictCode="dept_area" dictValue="%{deptDto.area}" id="deptDto_area" name="deptDto.area" 
					cssClass="text_input_150" custom_option="<option value=''>--请选择--</option>" />
			</td> --%>
       </tr>
        <tr>
			<td style="width: 116px;text-align: right;"><dict:lang value="默认角色" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:select list="roleLs" headerKey="" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="name"  id="deptDto_roleId" name="deptDto.roleId" 
					cssStyle="width: 200px;" cssClass="dept_select"/>
			</td>
       </tr>
        <tr>
			<td style="width: 98px;text-align: right;"><dict:lang value="默认工种" /></td>
			<td style="text-align: left;padding-left:5px;">
				<s:select list="jobLs" headerKey="" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="jobName"  id="deptDto_jobId" name="deptDto.jobId" 
					cssStyle="width: 200px;" cssClass="dept_select"/>
			</td>
       </tr>
        <tr>

			<td style="width: 98px;text-align: right;"><dict:lang value="是否组织机构" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input type="checkbox" id="isAuth" name="isAuth"  value="1"/>
			</td>
       </tr>
       <tr>

			<td style="width: 98px;text-align: right;"><dict:lang value="ERP代码" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="deptDto.erpCode" maxlength="33" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
			</td>
       </tr>
       <tr>

			<td style="width: 98px;text-align: right;"><span class="dot">*</span><dict:lang value="单位编码" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<s:textfield cssClass="input" cssStyle="width: 200px;" name="deptDto.depSn" maxlength="50" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
			</td>
       </tr>
     </table>
     </form>
   </div>
</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
<script type="text/javascript">
	   $(function(){
	   	if ($("#isAuth_s").val() == "1") {
			$("#isAuth").attr("checked",true);
		}
	   });
	
	/*$(function(){
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
    	
    });*/
	function edit(thisObj){
	// $("#iframeId").val(window.name);
		if(!valData()){
			return ;
		}
		if ($("#isAuth").attr("checked")) {
			$("#isAuth_s").val("1");
		}else{
			$("#isAuth_s").val("2");
		} 
		var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#deptDto_name").val());
		var dep_sn = _mcBase64JsToJava.getMcDealBase64Encode($("#deptDto_depSn").val());
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/DeptAction_deptNameVal.ms",
			    data: {
			    	"paraMap.deptName" : langs,
			    	"paraMap.deptId" : $("#deptDto_id").val(),
			    	"paraMap.deptId" : $("#deptDto_id").val(),
			    	"paraMap.depSn" : dep_sn
			    },
				success: function(data){
						if(null == data){
						return ;}
						if(data.ajaxMap != null && data.ajaxMap.msg !=null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
						if(null != data.ajaxMap){
							var countName = parseInt(data.ajaxMap.countName);
							var countSn = parseInt(data.ajaxMap.countSn);
					         if (countSn > 0) {
								var dep_sn = document.getElementById("deptDto_depSn");
	   							_alertValMsg(dep_sn,"<dict:lang value="单位编码已存在" />");
					    		dep_sn.focus();
					    		return false;
							}else{
							document.forms.up_form.submit();
//							thisObj.onclick = function(){utilsFp.confirmIcon(1,"","","","<dict:lang value="数据正在提交，请稍候..." />",0,"300","");}
						}
							}
							
				},
					error: function(msg){
						if(msg.readyState!=0){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
					}
				  }	
				}); 
	}
        function alertInfo(msg){
		utilsFp.confirmIcon(3,"","","", msg,0,"300","");
	}
    function valData(){
    	var deptDtoName = document.getElementById("deptDto_name");
    	if(val.isBlank(deptDtoName)){
   			_alertValMsg(deptDtoName,"<dict:lang value="部门名称不能为空" />");
    		//document.getElementById("deptDto_name_err").innerHTML = "<dict:lang value="部门名称-不能为空" />";
    		deptDtoName.focus();
    		//window.setTimeout("closeValMsg('deptDto_name_err')", 2000);
    		return false;
    	}
    	var depSn = document.getElementById("deptDto_depSn");
    	if(val.isBlank(depSn)){
   			_alertValMsg(depSn,"<dict:lang value="单位编码不能为空" />");
    		depSn.focus();
    		return false;
    	}
    	
    	return true;
    }
	//重置	
	function resetForm(){
		$("#up_form")[0].reset();
		$("#deptDto_roleId").trigger("chosen:updated");
		$("#deptDto_jobId").trigger("chosen:updated");
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>