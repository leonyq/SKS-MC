<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<title><dict:lang value="多语言配置修改" /></title>
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
	<div style="background-color: white;margin-top: 37px;">
			    <div class="optn">
			        <button type="button" onclick="edit(this);"><i class="ico ico-save"></i><dict:lang value="保存" /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value="取消" /></button>
			    </div>
			<div style="height: 212px;overflow:auto;" class="scroll" >
	<form id="up_form" name="upForm" action="${path}comm/CacheAction_editLangFileAx.ms?&<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=F5002" method="post">
		<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<c:out value='${iframeId}'/>"/>
	<table class="basic-table" id="basic-table">
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="属性名称" />(KEY)</td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 230px;" id="messageKey" value="%{paraMap.messageKey}"  maxlength="125" readonly="true" onchange="codeJSFun(this)" />
				<input type="hidden" name="paraMap.messageKey" id="code_messageKey" value="" />
				
				<script>
				$(function(){
				var valStr=$("#messageKey").val();
				valStr = _mcBase64JsToJava.getMcDealBase64Encode(valStr); 
				 $("#code_messageKey").val(valStr);
				});
				</script>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot"></span><dict:lang value="模块名称" />(KEY)</td>
			<td style="text-align: left;padding-left:5px;">
				<s:textfield cssClass="input" cssStyle="width: 230px;" id="moduleName" value="%{paraMap.moduleName}"  maxlength="125" readonly="true" onchange="codeJSFun(this)" />
				<input type="hidden" name="paraMap.moduleName" id="code_moduleName" value="" />
				
				<script>
				$(function(){
				var valStr=$("#moduleName").val();
				valStr = _mcBase64JsToJava.getMcDealBase64Encode(valStr); 
				 $("#code_moduleName").val(valStr);
				});
				</script>
			</td>
       </tr>
		<s:iterator id="key" value="keyList" status="index">
		<tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="${key}" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<s:textfield cssClass="input"  id="col${index.count}" value="%{paraMap.col${index.count}}" maxlength="125" cssStyle="width: 230px;" onchange="codeJSFun(this)" />
				<input type="hidden" name="paraMap.col${index.count}" id="code_col${index.count}"  />
				<script>
				$(function(){
				var valStr=$("#col${index.count}").val();
				valStr = _mcBase64JsToJava.getMcDealBase64Encode(valStr); 
				 $("#code_col${index.count}").val(valStr);
				});
				</script>
			</td>
			 </tr>
		</s:iterator>
     </table>
     <s:hidden name="paraMap._langKeyColNum_"></s:hidden>
     </form>
   </div>
</div>

<script type="text/javascript">

  function codeJSFun(objThis){
  		var langs = _mcBase64JsToJava.getMcDealBase64Encode(objThis.value);  
  		 $(objThis).next().val(langs);
  		}
  		
	function edit(thisObj){
	 $("#iframeId").val(window.name);
	 document.forms.up_form.submit();
		
	}
	function replaceLikeVal(comp){  
		utilsFp.replaceLikeVal(comp)
    }      
    function valData(){
    	var deptDtoName = document.getElementById("deptDto_name");
    	if(val.isBlank(deptDtoName)){
   			_alertValMsg(deptDtoName,"<dict:lang value="部门名称不能为空" />");
    		//document.getElementById("deptDto_name_err").innerHTML = "<dict:lang value="部门名称-不能为空" />";
    		deptDtoName.focus();
    		//window.setTimeout("closeValMsg('deptDto_name_err')", 2000);
    		return false;
    	}/* else{
    		document.getElementById("deptDto_name_err").innerHTML = "";
    	} */
    	
    	return true;
    }
	//重置	
	function resetForm(){
		$("#up_form")[0].reset();
	}
	$(window).on('load',function(){
		setPopScroll('.scroll')
	})
	
	
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>