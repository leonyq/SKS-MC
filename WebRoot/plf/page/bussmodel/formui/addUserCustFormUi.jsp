<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="自定义输出" />UI <dict:lang value="配置" />
	</title>
	<jsp:include page="/plf/common/pub_head.jsp">
		<jsp:param name="chosen" value="1" />
		<jsp:param name="layui" value="1" />
		<jsp:param name="popDivWin" value="1" />
	</jsp:include>
</head>
<body>
		<div class="add_table_div">
			<form id="add_form" name="addForm" class="layui-form" action="${path}sys/BussModelAction_cfgUIComp.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.FORM_COL_ID" />
				<s:hidden name="paraMap.UI_COMP" />
				<s:hidden name="paraMap.UI_COMP__TYPE" />
				<s:hidden name="paraMap.UI_MODEL_ID" />
				<input type="hidden" name="mcIframeName" id="mcIframeName" value="${mcIframeName}">
				<input type="hidden" name="curIframeName" id="curIframeName" value="${curIframeName}">
				
				<table class="add_table element_table">

					<tr>
						<td  class="tr1 title" >
							<dict:lang value="选择类源码" />
						</td>
						<td >
							<!--  
							<select id="paraMap_UI_DATA" name="paraMap.UI_DATA" class="chosen-select" style="width:70%" 
							 title="<dict:lang value="这里类必需实现UserCustFormUiFace接口，从公用方法页面中新增" />" >
					    	<option value='' ><dict:lang value="--请选择--" /></option>
							<c:forEach items="${dataMap.commClassLs}" var="ls" varStatus="index">
					    	<option value="<c:out value='${ls.MS_CLASS_CODE_ID}'/>" <c:if test="${dataMap.UI_DATA == ls.MS_CLASS_CODE_ID}"> selected="selected"</c:if>>
					    	<c:out value='${ls.CLASS_DESC}'/><c:out value='${ls.CLASS_NAME}'/></option>
							</c:forEach>
							-->
							
							<select id="paraMap_UI_DATA" name="paraMap.UI_DATA" lay-search  
							 title="<dict:lang value="这里类必需实现UserCustFormUiFace接口，从公用方法页面中新增" />" >
					    	<option value='' ><dict:lang value="--请选择--" /></option>
							<c:forEach items="${dataMap.commClassLs}" var="ls" varStatus="index">
					    	<option value="<c:out value='${ls.MS_CLASS_CODE_ID}'/>" <c:if test="${dataMap.UI_DATA == ls.MS_CLASS_CODE_ID}"> selected="selected"</c:if>><c:out value='${ls.CLASS_DESC}'/><c:out value='${ls.CLASS_NAME}'/></option>
							</c:forEach>
							
						</td>
					</tr>
				</table>
				
				<div class="ptop_10 txac">			
			
					<button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
					<input type="button" value="<dict:lang value="关闭" />" onclick="closePopWin_ui();" class="layui-btn layui-btn-danger">
							
				</div>
				
			</form>
		</div>
		<br>
		<br>

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
		//window.parent.parent.reloadPg(msg);
		window.parent.parent.add();
	}
	
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function add(thisObj){
		//if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");}
		if(!valData()){
			return false;
		}
		//document.forms.add_form.submit();
		//isSubmit = true;
		return true;
	}
        
	function valData(){
		var paraMap_UI_DATA = document.getElementById("paraMap_UI_DATA");
   	if(val.isBlank(paraMap_UI_DATA)){
   		_alertValMsg(document.getElementById("paraMap_UI_DATA_chosen"),"<dict:lang value="类源码" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}
    
		return true;
	}

	function init(){$(".chosen-select").chosen();}
	
		var form;
$(function(){
	layui.use('form', function(){
	    	 form = layui.form;
	          
			 form.on('submit(filterSubmit)', function (data) {
			 document.getElementById("mcIframeName").value=window.parent.location.href;
			 document.getElementById("curIframeName").value=window.parent.name;
		       var flag=add(data.elem);
		       if(!flag){
		       		return false;
		       }else{
		       		return true;
		       }
				       
			}) 
	
	    });
	    
})

</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>