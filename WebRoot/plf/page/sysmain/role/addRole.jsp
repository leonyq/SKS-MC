<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="角色新增" /></title>
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
		<div class="hd">
			<div style="margin-left:10px;margin-top: -35px;">
				<div class="save-close" title="<dict:lang value='保存并关闭窗口' />" onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
			</div>
			    <div class="optn">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i><dict:lang value='保存' /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value='取消' /></button>
			    </div>
			</div>
			<div style="height: 160px;margin-top: -30px;">
	<form id="add_form" name="addForm" action="${path}sys/RoleAction_addRole.ms" method="post" target="submitFrame">
	<s:token />
		<input type="hidden" id="iframeId" name="iframeId"/>
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>
	<table class="basic-table" >
        <%-- <tr>
          <td colspan="6"><dict:lang value="角色新增" /><span class="Point"><dict:lang value="（带" /> <span class="Eng">*</span><dict:lang value=" 为必填项）" /></span></td>
       </tr> --%>
        <tr>

			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="角色名称" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input type="text" class="input" name="roleDto.name" id="roleDto_name" maxlength="30" style="width: 200px;" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
				 <span class="Eng"><span id="roleDto_name_err"><c:out value='${errors["roleDto.name"][0]}' /></span></span>
			</td>
       </tr>
       <tr>

		<td style="width: 116px;text-align: right;"><dict:lang value="角色描述" /></td>
       	<td style="text-align: left;padding-left:5px;height: 80px;">
       		<textarea name="roleDto.remark" id="roleDto_remark" style="width: 200px;height: 100%;" maxlength="200" onkeyup="javascript:utilsFp.replaceLikeVal(this)"></textarea>

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
	
	function add(thisObj){
		if(!valData()){
			return ;
		}
		
		if ($("#isCloseWin").attr("checked")) {
			$("#isCloseWin_s").val("0");
		}else{
			$("#isCloseWin_s").val("1");
		}
		var len = $("#roleDto_remark").val().length;
		if(len>100){
			var roleDto_remark = document.getElementById("roleDto_remark");
			_alertValMsg(roleDto_remark,"<dict:lang value="角色描述长度不能超过规定长度" />");
			return ;
		}
		util.showLoading("处理中...");
		var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#roleDto_name").val());
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/RoleAction_roleNameVal.ms",
			    data: {
			    	"paraMap.roleName" : langs
			    },
				success: function(data){
						if(data.ajaxMap != null && data.ajaxMap.msg !=null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
						util.closeLoading(); 
						if(null == data){
						return ;}
						if(null != data.ajaxList){
							if (data.ajaxList.length>0) {
    							var roleDtoName = document.getElementById("roleDto_name");
   								_alertValMsg(roleDtoName,"<dict:lang value="角色名称已存在" />");
				    			roleDtoName.focus();
				    			return false;
						}else{
							document.forms.add_form.submit();
							/* thisObj.onclick = function(){
						//utilsFp.confirmIcon(1,"","","","<dict:lang value="数据正在提交，请稍候...111" />",0,"300","");
						}; */
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
    	var roleDtoName = document.getElementById("roleDto_name");
    	if(val.isBlank(roleDtoName)){
   			_alertValMsg(roleDtoName,"<dict:lang value="角色名称不能为空" />");
    		roleDtoName.focus();
    		return false;
    	}
    	
    	return true;
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

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>