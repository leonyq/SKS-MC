<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="部门新增" /></title>
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
	<div style="background-color: white;margin-top: 50px;">
		<div class="hd">
			<div style="margin-left:10px;margin-top: -40px;">
				<div class="save-close" title="<dict:lang value='保存并关闭窗口' />" onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
				
			</div>
			    <div class="optn" style="top:10px">
			        <button type="button" onclick="add(this);"><i class="ico ico-save"></i>
			   <dict:lang value='保存' />     
			        </button>
			        <button type="button" onclick="closeWindow_s();"><i class="ico ico-cancel"></i>
			   <dict:lang value='取消' />     
			        </button>
			    </div>
			</div>
			<div style="height: 290px;">
	<form id="add_form" name="addForm" action="${path}sys/DeptAction_addDept.ms" method="post" target="submitFrame" style="margin-top: -35px;">
	<s:token />
	<input type="hidden" id="upId" name="deptDto.upId" value="<s:property value="deptDtoUp.id" />" />
		
	<s:hidden id="deptDtoUp_id" name="deptDtoUp.id" />
		
	<s:hidden id="deptDtoUp_name" name="deptDtoUp.name" />
		<input type="hidden" id="iframeId" name="iframeId" value="<c:out value='${iframeId}'/>"/>
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>

		<input type="hidden" id="isAuth_s" name="deptDto.isAuth"/>

	<table class="basic-table" style="text-align: center;margin-top:10px;">
        <%-- <tr>
          <td colspan="6"><dict:lang value="部门新增" /><span class="Point"><dict:lang value="（带" /> <span class="dot"></span><dict:lang value="为必填项）" /> </span></td>
       </tr> --%>
        <tr>

			<td style="width: 116px;text-align: right;"><span class="dot">*</span><dict:lang value="部门名称" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input class="input" name="deptDto.name" id="deptDto_name" maxlength="150" style="width: 200px;" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>

				 <br /><span id="deptDto_name_err" class="Eng"><c:out value='${errors["deptDto.name"][0]}'/></span>
			</td>
			<%-- <td width="20%" class="name">上级部门</td>
			<td width="30%">
				<s:textfield name="deptDto.upId" id="deptDto_upId" maxlength="150" />
			</td> --%>
       </tr>
        <tr>

			<td style="width: 116px;text-align: right;"><dict:lang value="默认角色" /></td>
			<td style="text-align:left;padding-left: 5px;">

				<s:select list="roleLs" headerKey="" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="name"  id="deptDto_roleId" name="deptDto.roleId" 
					cssStyle="width: 200px;" cssClass="dept_select" />
			</td>
       </tr>
        <tr>

			<td style="width: 98px;text-align: right;"><dict:lang value="默认工种" /></td>
			<td style="text-align:left;padding-left: 5px;">

				<s:select list="jobLs" headerKey="" headerValue="--%{getText('请选择')}--"
					listKey="id" listValue="jobName"  id="deptDto_jobId" name="deptDto.jobId" 
					cssStyle="width: 200px;" cssClass="dept_select"/>
			</td>
       </tr>
       <tr>

			<td style="width: 98px;text-align: right;"><dict:lang value="是否组织机构" /></td>
			<td style="text-align:left;padding-left: 5px;">

			<input type="checkbox" checked id="isAuth" name="isAuth"  value="1"/>
				<%-- <dict:radioDict dictCode="SY_DEPT_IS_AUTH" name="deptDto.isAuth" dictValue="2"/> --%>

			</td>
       </tr>
       <tr>

			<td style="width: 98px;text-align: right;"><dict:lang value="ERP代码" /></td>
			<td style="text-align:left;padding-left: 5px;">

				<input class="input" name="deptDto.erpCode" id="erp_code" maxlength="33" style="width: 200px;" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
			</td>
       </tr>
       <tr>

			<td style="width: 98px;text-align: right;"><span class="dot">*</span><dict:lang value="单位编码" /></td>
			<td style="text-align:left;padding-left: 5px;">

				<input class="input" name="deptDto.depSn" id="dep_sn" maxlength="50" style="width: 200px;" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
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
		
	})
	
	function add(thisObj){
		if(!valData()){
			return ;
		}
		if ($("#isAuth").attr("checked")) {
			$("#isAuth_s").val("1");
		}else{
			$("#isAuth_s").val("2");
		} 
		if ($("#isCloseWin").attr("checked")) {
			$("#isCloseWin_s").val("0");
		}else{
			$("#isCloseWin_s").val("1");
		} 
		var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#deptDto_name").val());
		var dep_sn = _mcBase64JsToJava.getMcDealBase64Encode($("#dep_sn").val());
		$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/DeptAction_deptNameVal.ms",
			    data: {
			    	"paraMap.deptName" : langs,
			    	"paraMap.depSn" : dep_sn
			    },
				success: function(data){
						if(data.ajaxMap != null && data.ajaxMap.msg !=null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
						if(null == data){
						return ;}
						if(null != data.ajaxMap){
						var countName = parseInt(data.ajaxMap.countName);
						var countSn = parseInt(data.ajaxMap.countSn);
							if (countSn > 0) {
								var dep_sn = document.getElementById("dep_sn");
	   							_alertValMsg(dep_sn,"<dict:lang value="单位编码已存在" />");
					    		dep_sn.focus();
					    		return false;
							}else{
								/* if ($("#isCloseWin").attr("checked")) {
									document.forms.add_form.submit();
								}else{
									addDeptSubmit();
								} */
									addDeptSubmit();
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
    
    
    //异步新增部门信息
    function addDeptSubmit(){
		util.showTopLoading();
		var langs = _mcBase64JsToJava.getMcDealBase64Encode($("#deptDto_name").val());
		var dep_sn = _mcBase64JsToJava.getMcDealBase64Encode($("#dep_sn").val());
		var erp_code = _mcBase64JsToJava.getMcDealBase64Encode($("#erp_code").val());
    	$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}sys/DeptAction_addDeptAjax.ms",
			    data: {
			    	"paraMap.deptName" : langs,
			    	"paraMap.upId" : $("#upId").val(),
			    	"paraMap.roleId" : $("#deptDto_roleId").val(),
			    	"paraMap.jobId" : $("#deptDto_jobId").val(),
			    	"paraMap.erpCode" : erp_code,
			    	"paraMap.isAuth" : $("#isAuth_s").val(),
			    	"paraMap.depSn" : dep_sn
			    },
				success: function(data){
						if(data.ajaxMap != null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
						if(null == data){
						return ;}
						util.closeLoading();
						if ($("#isCloseWin").attr("checked")) {
							top.document.getElementById($("#iframeId").val()).contentWindow.reloadPgExe();
							$('#popupFrameFpIdpop',parent.document).parent().remove();
							if(parent.$(".dialog-close").length > 0){
								parent.$(".dialog-close").click();				
							}
						}else{
							util.initLangMap("['新增成功']");
							util.initLangMap("['摩尔提示']");
							msgPop(util.getLangShow("新增成功"),"",util.getLangShow("摩尔提示"),200,150,3000);
							$('.dialog-close',parent.document).attr('onclick','');		
							$('.dialog-close',parent.document).click(function(){
								top.document.getElementById($("#iframeId").val()).contentWindow.reloadPgExe();
								$('#popupFrameFpIdpop',parent.document).parent().remove();
							});
						} 
						
				},
					error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }	
				});
    }
    
    
    
    function closeValMsg(objthis){
    	document.getElementById(objthis).innerHTML = "";
    }
        
    function valData(){
    	var deptDtoName = document.getElementById("deptDto_name");
    	if(val.isBlank(deptDtoName)){
   			_alertValMsg(deptDtoName,"<dict:lang value="部门名称不能为空" />");
    		deptDtoName.focus();
    		return false;
    	}
    	
    	var depSn = document.getElementById("dep_sn");
    	if(val.isBlank(depSn)){
   			_alertValMsg(depSn,"<dict:lang value="单位编码不能为空" />");
    		depSn.focus();
    		return false;
    	}
    	
    	return true;
    }

	function closeWindow_s(){
		if (!$("#isCloseWin").attr("checked")) {
			top.document.getElementById($("#iframeId").val()).contentWindow.reloadPgExe();
			$('#popupFrameFpIdpop',parent.document).parent().remove();
		}else{
			if(parent.$(".dialog-close").length > 0){
				parent.$(".dialog-close").click();				
			}else if(parentWindow != null){
				var iframeSeq = parentWindow.name.replace("iframe","");
				location.reload();
				parent.closeTab(iframeSeq);
			}
			}
		}
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>