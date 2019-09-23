<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="工种修改" /></title>
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
			<div style="height: 180px;">
	<form id="up_form" name="upForm" action="${path}sys/JobAction_upJob.ms" method="post" target="submitFrame">
	<s:token />
	<s:hidden name="jobDto.id" />
	<s:hidden name="jobDto.jobName" />
	<s:hidden name="jobDto.jobLevel" />
	<input type="hidden" id="iframeId" name="paraMap.iframeId"/>
	<input type="hidden" id="jobName_s"/>
	<input type="hidden" id="jobLevel_s"/>
	<input type="hidden" id="jobRemark_s"/>
	<table class="basic-table">
        <%-- <tr>
          <td colspan="6"><dict:lang value="工种修改" /><span class="Point"><dict:lang value="（带" /> <span class="Eng">*</span><dict:lang value="为必填项）" /> </span></td>
       </tr> --%>
        <tr>

			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="工种名称" /></td>
			<td style="text-align: left;padding-left:5px;">

				<s:textfield cssClass="input" cssStyle="width: 230px;" id="jobName" maxlength="20" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
				<span class="Eng"><span id="jobDto_jobName_err"><c:out value='${errors["jobDto.jobName"][0]}'/></span></span>
			</td>
       </tr>
       <tr>

			<td style="width: 116px;text-align: right;"><dict:lang value="工种等级" /></td>
			<td style="text-align: left;padding-left:5px;">

				<s:textfield cssClass="input" cssStyle="width: 230px;" id="jobLevel" maxlength="20" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
			</td>
       </tr>
       <tr>

			<td style="width: 116px;text-align: right;"><dict:lang value="工种描述" /></td>
       		<td colspan="3" style="text-align: left;padding-left:5px;height: 80px;">
       		<textarea name="jobDto.remark" id="jobDto_remark" style="width: 230px;height: 100%;" maxlength="120" onkeyup="javascript:utilsFp.replaceLikeVal(this)"><s:property value="jobDto.remark"/></textarea>
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
	   window.onload=function(){
	 	$("#jobName").val($("#jobDto_jobName").val());
	 	$("#jobLevel").val($("#jobDto_jobLevel").val());
	 	$("#jobName_s").val($("#jobName").val());
	 	$("#jobLevel_s").val($("#jobLevel").val());
	 	$("#jobRemark_s").val($("#jobDto_remark").val());
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
		$("#jobDto_jobName").val($("#jobName").val());
		$("#jobDto_jobLevel").val($("#jobLevel").val());
		if(!valData()){
			return ;
		}
		var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#jobDto_jobName").val());
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/JobAction_jobNameVal.ms",
			    data: {
			    	"paraMap.jobName" : langs,
			    	"paraMap.jobId" : $("#jobDto_id").val()
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
    							var jobDtoName = document.getElementById("jobName");
   								_alertValMsg(jobDtoName,"<dict:lang value="工种名称已存在" />");
				    			jobDtoName.focus();
				    			return false;
						}else{
							document.forms.up_form.submit();
//							thisObj.onclick = function(){
//						utilsFp.confirmIcon(1,"","","","<dict:lang value="数据正在提交，请稍候..." />",0,"300","");
//						}; 
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
    	var roleDtoName = document.getElementById("jobDto_jobName");
    	if(val.isBlank(roleDtoName)){
   			_alertValMsg(roleDtoName,"<dict:lang value="工种名称不能为空" />");
    		roleDtoName.focus();
    		return false;
    	}
    	
    	return true;
    }
	//重置	
	function resetForm(){
	 	$("#jobName").val($("#jobName_s").val());
	 	$("#jobLevel").val($("#jobLevel_s").val());
	 	$("#jobDto_remark").val($("#jobRemark_s").val());
	}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>