<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="定时发送EMail" /> <dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
	</jsp:include>
</head>
<body>
	<div class="all">
		<div class="add_table_div">
			<form id="addForm"  class="layui-form" name="addForm" action="${path}email/userEmailManageAction_addSendEmail.ms" method="post" target="submitFrame">
				<table class="add_table">
					<%-- <tr>
						<td colspan="4">
							<span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span>
						</td>
					</tr>
					<blockquote class="layui-elem-quote"><span class="Point"> <span class="Eng">*</span> <dict:lang value="为必填项" /> </span></blockquote>
					--%><tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="报表类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict  id="reportType" name="paraMap.reportType" dictCode="MS_SEND_EMAIL_TO_REPORT_TYPE" dictValue="%{ajaxMap.reportType}" onchange="changeReType()" />
						</td>
					<%-- </tr> 
					<tr>--%>
						<td>
						&nbsp;
						</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="发件人账号" />
						</td>
						<td style="width: 270px;">
								<select  name="paraMap.account" lay-search lay-verify="required">
									<option value="<s:property value="ajaxMap.account"/>" selected="selected"><s:property value="ajaxMap.account"/></option>
									<s:iterator id="map" value="userEmailMap">
										<option value="<s:property value="#map['ACCOUNT']"/>"><s:property value="#map['ACCOUNT']"/></option>
									</s:iterator>
								</select>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="收件人账号" />
						</td>
						<td colspan="4">
							<input type="text" lay-verify="required|checkEm1" id="receive_account" name="paraMap.receive_account" value="<s:property value="ajaxMap.receive_account"/>" class="_VAL_NULL" style="width:100%;" />
						</td>
					</tr> 
				</table>	
				<table class="add_table" id="normal" >
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="抄送人账号" />
						</td>
						<td colspan="4">
							<input type="text" id="receive_account_cc" lay-verify="checkEm2" name="paraMap.receive_account_cc" value="<s:property value="ajaxMap.receive_account_cc"/>"  style="width:100%;" />
						</td>
					</tr>
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="密送人账号" />
						</td>
						<td colspan="4">
							<input type="text" id="receive_account_bcc" lay-verify="checkEm3" name="paraMap.receive_account_bcc" value="<s:property value="ajaxMap.receive_account_bcc"/>"  style="width:100%;" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="报表Url" />
						</td>
						<td colspan="4">
							<input type="text"  id="httpurl" name="paraMap.httpurl" value="<s:property value="ajaxMap.httpurl"/>" style="width:100%;" onkeyup="javascript:replaceLikeVal1(this)"/>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="详细描述" />
						</td>
						<td colspan="4">
							<input type="text" maxlength="160" id="detail" name="paraMap.detail" value="<s:property value="ajaxMap.detail"/>" style="width:100%;" />
						</td>
					</tr> 
				</table>
				<table class="add_table" id="report" style="display: none;">
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="报表节点" />
						</td>
						<td style="width: 270px;">  
						  <input id="reportNodeHidden" value="<s:property value="ajaxMap.reportNode"/>" style="display: none;">
						   <select  id="reportNode" name="paraMap.reportNode" >
						   
						   </select>
						<div id="divNode"  style="display: none;">
						 <s:property value="ajaxMap.nodeListStr"/>  
						</div>
						</td>
						<td>&nbsp;</td>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="报表附件类型" />
						</td>
						<td style="width: 270px;">
							<dict:selectDict  name="paraMap.attachmentType" dictCode="MS_SEND_EMAIL_TO_ATTACHMENT_TYPE" dictValue="%{ajaxMap.attachmentType}" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="报表标题" />
						</td>
						<td colspan="4">
							<input type="text"  id="reportTitle" name="paraMap.reportTitle" value="<s:property value="ajaxMap.reportTitle"/>" style="width:100%;" />
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="报表文件内容" />
						</td>
						<td colspan="4">
							<textarea rows="3" cols="20" id="reportDetail" name="paraMap.reportDetail" style="width:100%;"><s:property value="ajaxMap.reportDetail"/></textarea>
						</td>
					</tr> 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<span class="Eng">*</span><dict:lang value="报表路径" />
						</td>
						<td colspan="4">
							<input type="text" id="reportPath" name="paraMap.reportPath" onkeyup="javascript:replaceLikeVal1(this)" value="<s:property value="ajaxMap.reportPath"/>" style="width:100%;" />
						</td>
					</tr>
					<%-- 
					<tr>
						<td style="width: 100px;" class="tr1 mc_form_title mc_form_title">
							<dict:lang value="报表附件类型：" /><span class="Eng">*</span>
						</td>
						<td colspan="4">
							<dict:selectDict style="width:100%" name="paraMap.attachmentType" dictCode="MS_SEND_EMAIL_TO_ATTACHMENT_TYPE" dictValue="%{ajaxMap.attachmentType}" />
						</td>
					</tr> 
					--%> 
				</table>
				<div class="ptop_10 txac">
					<input id="saveButton" type="button" value="<dict:lang value="保存" />" lay-submit lay-filter="*" onclick="/*save(this);*/" class="layui-btn">
					
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin();" class="layui-btn layui-btn-danger">
				</div>
				<input type="hidden" id="id" name="paraMap.id" value="<s:property value="ajaxMap.id"/>">
				<s:hidden id="upId" name="paraMap.UP_ID" />
			<s:hidden id="workType" name="paraMap.FLAG"/>
			<s:hidden id="modelMemo" name="paraMap.MODEL_MEMO"/>
			<s:hidden id="modelName" name="paraMap.MODEL_NAME"/>
			<s:hidden id="type" name="paraMap.TYPE"/>
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
	var isSubmit = false;
	function reloadPg(msg){
		isSubmit = false;
		window.parent.reloadPg(msg);
	}
	function replaceLikeVal(comp){  
		util.replaceLikeVal(comp)
    }
	$(function(){
		$("#reportType").attr("lay-filter","changeReType");
	});
	layui.use('form', function(){
	  	  var form = layui.form;
	  		form.on('select(changeReType)',function(data){   
	  		  var val=data.value;
		  		if(val=="txt"){
					$("#normal").show();
					$("#report").hide();
					$("#reportTitle").val("");
					$("#reportDetail").val("");
					$("#reportPath").val("");
					$("#httpurl").attr("lay-verify","required");
					$("#detail").attr("lay-verify","required");
					$("#reportNode").removeAttr("lay-verify");
					$("#reportTitle").removeAttr("lay-verify");
					$("#reportDetail").removeAttr("lay-verify");
					$("#reportPath").removeAttr("lay-verify");
				}else{
					$("#normal").hide();
					$("#report").show();
					$("#httpurl").val("");
					$("#detail").val("");
					$("#receive_account_cc").val("");
					$("#receive_account_bcc").val("");
					$("#httpurl").removeAttr("lay-verify");
					$("#detail").removeAttr("lay-verify");
					$("#reportNode").attr("lay-verify","required");
					$("#reportTitle").attr("lay-verify","required");
					$("#reportDetail").attr("lay-verify","required");
					$("#reportPath").attr("lay-verify","required");
				}
	  			//console.info(val);
			});
	  		form.render("select");
	  		form.verify({
	  	 		checkEm1: function(value,item){
	  				  var fla = layValEmail(value);
	  				  if(fla!="1"){
	  					  return fla;
	  				  }
	  			},
	  			checkEm2: function(value,item){
	  				  var fla = layValEmail(value);
	  				  if(fla!="1"){
	  					  return fla;
	  				  }
	  			},
	  			checkEm3: function(value,item){
	  				  var fla = layValEmail(value);
	  				  if(fla!="1"){
	  					  return fla;
	  				  }
	  			}
	  	    });
	  		form.on('submit(*)', function(data){
	  			save();
	  	 	});
	});
	function replaceLikeVal1(comp){
		  if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
	        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
	        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1) {  
	            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
	            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"");
	            util.alert("不能输入单引号双引号<>{}()[]");
	        }  
} 
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	function validateEmail(){
		var receive = $("#receive_account").val();
		var receivecc = $("#receive_account_cc").val();
		var receivebcc = $("#receive_account_bcc").val();
		if(!valiCommEmail(receive)){
			return false;
		}
		if(!valiCommEmail(receivecc)){
			return false;
		}
		if(!valiCommEmail(receivebcc)){
			return false;
		}
		return true;
	}
	function layValEmail(emailStr){
		if(emailStr!=null && emailStr!="" && emailStr!=undefined){
		  	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if(emailStr.indexOf(";")!=-1){
					var arr = new Array();
					arr=emailStr.split(";");
					for(i=0;i<arr.length;i++){
						if(arr[i]!=null && arr[i]!=""){
							if (!myreg.test(arr[i])) {
	 							//util.alert(arr[i]+"<dict:lang value="：不符合规则，请输入正确的邮箱格式，如1234@163.com" />");
	  							return arr[i]+"<dict:lang value="：不符合规则，请输入正确的邮箱格式，如1234@163.com" />";
							}
						}else{
							return "1";
						}
					}
			}else{
					if(!myreg.test(emailStr)){
	 					//util.alert(emailStr+"<dict:lang value="：不符合规则，请输入正确的邮箱格式，如1234@163.com" />");
	  					return emailStr+"<dict:lang value="：不符合规则，请输入正确的邮箱格式，如1234@163.com" />";
					}else{
						return "1";
					} 
			}
		}else{
			return "1";
		}
	}
	function valiCommEmail(emailStr){
	  if(emailStr!=null && emailStr!="" && emailStr!=undefined){
	  	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if(emailStr.indexOf(";")!=-1){
				var arr = new Array();
				arr=emailStr.split(";");
				for(i=0;i<arr.length;i++){
					if(arr[i]!=null && arr[i]!=""){
						if (!myreg.test(arr[i])) {
 							util.alert(arr[i]+"<dict:lang value="：不符合规则，请输入正确的邮箱格式，如1234@163.com" />");
  							return false;
						}
					}else{
						return true;
					}
				}
		}else{
				if(!myreg.test(emailStr)){
 					util.alert(emailStr+"<dict:lang value="：不符合规则，请输入正确的邮箱格式，如1234@163.com" />");
  					return false;
				}else{
					return true;
				} 
			}
		}else{
			return true;
		}
	}
	function save(thisObj){
		if(!validateEmail()){
			return ;
		}
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!val.valNullData()){
			return ;
		}
		if(!val.valOjbsData()){
			return ;
		}
		var reportType = $("#reportType").val();
		if(reportType=="txt"){
			var httpurl = $("#httpurl").val();
			var detail = $("#detail").val();
			if(httpurl==""){
				util.alert("报表Url不能为空");
				return ;
			}
			if(detail==""){
				util.alert("详细描述不能为空");
				return ;
			}
		}else{
			var reportTitle = $("#reportTitle").val();
			var reportDetail = $("#reportDetail").val();
			var reportPath = $("#reportPath").val();
			if(reportTitle==""){
				util.alert("报表标题不能为空");
				return ;
			}
			if(reportDetail==""){
				util.alert("报表内容不能为空");
				return ;
			}
			if(reportPath==""){
				util.alert("报表路径不能为空");
				return ;
			}
		}
		document.forms.addForm.submit();
		isSubmit = true;
	}
	function changeReType(){
		var type=$("#reportType").val();
		if(type=="txt"){
			$("#normal").show();
			$("#report").hide();
			$("#reportTitle").val("");
			$("#reportDetail").val("");
			$("#reportPath").val("");
			$("#httpurl").attr("lay-verify","required");
			$("#detail").attr("lay-verify","required");
			$("#reportNode").removeAttr("lay-verify");
			$("#reportTitle").removeAttr("lay-verify");
			$("#reportDetail").removeAttr("lay-verify");
			$("#reportPath").removeAttr("lay-verify");
		}else{
			$("#normal").hide();
			$("#report").show();
			$("#httpurl").val("");
			$("#detail").val("");
			$("#receive_account_cc").val("");
			$("#receive_account_bcc").val("");
			$("#httpurl").removeAttr("lay-verify");
			$("#detail").removeAttr("lay-verify");
			$("#reportNode").attr("lay-verify","required");
			$("#reportTitle").attr("lay-verify","required");
			$("#reportDetail").attr("lay-verify","required");
			$("#reportPath").attr("lay-verify","required");
		}
	}
	
	$(function(){
	   changeReType();
	   var nodeObjStr=$("#divNode").text();
	   var nodeObj=jQuery.parseJSON(nodeObjStr); //由JSON字符串转换为JSON对象 
	   $("#reportNode").empty();
	   var ipPort="";
	    for(var i=0; i<nodeObj.length; i++){  
	      ipPort="";
	     ipPort=nodeObj[i].ip+":"+nodeObj[i].port; 
	     if($("#reportNodeHidden").val()==ipPort)
	      $("#reportNode").append("<option selected value='"+ipPort+"'>"+ipPort+"</option>");
	     else
	     $("#reportNode").append("<option value='"+ipPort+"'>"+ipPort+"</option>");
	   }//for(var node in nodeObj){
	   
	});
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>