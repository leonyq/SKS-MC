<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="工种新增" /></title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>
<body>
	<div style="background-color: white;margin-top: 37px;">
		<div class="hd">
			<div style="margin-left:10px;margin-top: -35px;">
				<div class="save-close" title="<dict:lang value='保存并关闭窗口' />" onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
				<%--<input type="checkbox" checked id="isCloseWin_s"/>
				<dict:lang value="保存并关闭窗口" />--%>
			</div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value='保存' /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value='取消' /></button>
			    </div>
			</div>
			<div style="height: 180px;margin-top: -30px;">
	<form id="add_form" name="addForm" action="${path}sys/JobAction_addJob.ms" method="post" target="submitFrame">
	<s:token />
		<input type="hidden" id="iframeId" name="iframeId"/>
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>
	<table class="basic-table" >
        <%-- <tr>
          <td colspan="6"><dict:lang value="工种新增" /><span class="Point"><dict:lang value="（带" /> <span class="Eng">*</span><dict:lang value="为必填项）" /> </span></td>
       </tr> --%>
        <tr>
			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="工种名称" /></td>
			<td style="text-align:left;padding-left:5px;">
				<input type="text" class="input" name="jobDto.jobName" id="jobDto_jobName" maxlength="20" style="width: 230px;" onkeyup="javascript:utilsFp.replaceLikeVal(this)"
				/>
				<span class="Eng"><span id="jobDto_jobName_err"><c:out value='${errors["jobDto.jobName"][0]}' /></span></span>
			</td>
       </tr>
       <tr>
			<td style="width: 116px;text-align: right;"><dict:lang value="工种等级" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input type="text" class="input" name="jobDto.jobLevel" id="jobDto_jobLevel" maxlength="20" style="width: 230px;" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
			</td>
       </tr>
       <tr>
        <td style="width: 116px;text-align: right;"><dict:lang value="工种描述" /></td>
       	<td style="text-align: left;padding-left:5px;height: 80px;">
       		<textarea name="jobDto.remark" id="jobDto_remark" style="width:230px;height:100%" maxlength="120" onkeyup="javascript:utilsFp.replaceLikeVal(this)"></textarea>
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
    	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
    	
    });

	function add(thisObj){
		if(!valData()){
			return ;
		}

		if ($("#isCloseWin").attr("checked")) {
			$("#isCloseWin_s").val("0");
		}else{
			$("#isCloseWin_s").val("1");
		}
		util.showLoading("处理中...");
		var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#jobDto_jobName").val());
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/JobAction_jobNameVal.ms",
			    data: {
			    	"paraMap.jobName" : langs
			    },
				success: function(data){
						util.closeLoading(); 
						if(null == data){
						return ;}
						if(data.ajaxMap != null && data.ajaxMap.msg !=null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
						if(null != data.ajaxList){
							if (data.ajaxList.length>0) {
    							var jobDtoName = document.getElementById("jobDto_jobName");
   								_alertValMsg(jobDtoName,"<dict:lang value="工种名称已存在" />");
				    			jobDtoName.focus();
				    			return false;
						}else{
							document.forms.add_form.submit();
						}
							}
							
				},
					error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }	
				});
        
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

</script>

</body>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
<%@ include file="/plf/common/pub_end.jsp" %>