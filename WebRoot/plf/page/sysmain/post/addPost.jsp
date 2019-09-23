<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="新增" /></title>
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
	<form id="add_form" name="addForm" action="${path}sys/PostMgrAction_addPost.ms" method="post" target="submitFrame">
	<s:token />
		<input type="hidden" id="iframeId" name="iframeId"/>
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>
	<table class="basic-table" >
        
        <tr>
			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="岗位名称" /></td>
			<td style="text-align:left;padding-left:5px;">
				<input type="text" class="input" name="paraMap.postName" id="postName" maxlength="20" style="width: 230px;" onkeyup="javascript:utilsFp.replaceLikeVal(this)"
				/>
				<span class="Eng"><span id="postName_err"><c:out value='${errors["jobDto.jobName"][0]}' /></span></span>
			</td>
       </tr>
       
       <tr>
        <td style="width: 116px;text-align: right;"><dict:lang value="岗位描述" /></td>
       	<td style="text-align: left;padding-left:5px;height: 80px;">
       		<textarea name="paraMap.remark" id="remark" style="width:230px;height:100%" maxlength="120" onkeyup="javascript:utilsFp.replaceLikeVal(this)"></textarea>
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
		//var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#postName").val());
		document.forms.add_form.submit();
        
	}
      
    function valData(){
    	var roleDtoName = document.getElementById("postName");
    	if(val.isBlank(roleDtoName)){
   			_alertValMsg(roleDtoName,"<dict:lang value="岗位名称不能为空" />");
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