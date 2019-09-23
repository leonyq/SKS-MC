<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="模型" /> <dict:lang value="修改" /></title>
	<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
		</jsp:include>
</head>
<body>
	<div class="all" >
		<div  class="add_table_div">
			<form id="editForm" class="layui-form" name="editForm" action="${path}sys/BussModelAction_editBussModel.ms" method="post" target="submitFrame">
				<s:hidden name="paraMap.ID" value="%{dataMap.ID}" />
				<s:hidden id="paraMap_treeTid" name="treeTid" value="%{paraMap.treeTid}"/>
				<table class="add_table">
					<tr>
						<td  class="tr1 title">
							<span class="Eng">*</span>
							<dict:lang value="模型名称" />
						</td>
						<td class="widget">
						 	<input type="text" lay-verify="required" value="<c:out value='${dataMap.M_NAME}' />" name="paraMap.M_NAME"  maxlength="40" id="paraMap_M_NAME"  />
							
						</td>
					</tr>
					<tr>
						<td  class="tr1 title">
						<span style="color:red">&nbsp;&nbsp;* <c:out value='${errors["paraMap.MODEL_CODE"][0]}' /></span>
						<dict:lang value="模型编码" />
						</td>
						<td class="widget">
						<input type="text" lay-verify="MODEL_CODE＿REG" name="paraMap.MODEL_CODE"  maxlength="30" value="<c:out value='${dataMap.MODEL_CODE}' />"  id="paraMap_MODEL_CODE"  />
							
						</td>
					</tr>						
					<tr>
						<td  class="tr1"><dict:lang value="是否显示模型" /></td>
						<td>
							<select id="paraMap_IF_SHOW_MODEL" name="paraMap.IF_SHOW_MODEL">
								<option value="Y"><dict:lang value="是" /></option>
								<option value="N"><dict:lang value="否" /></option>
							</select>
						</td>
					</tr>						
				</table>
				
				<div class="ptop_10 txac">
			 <button class="layui-btn" lay-filter="filterSubmit" lay-submit="formSubmit">提交</button>
			 <%--<input type="reset" value="<dict:lang value="重置" />" class="layui-btn layui-btn-primary" />
			--%><input type="button" value="关 闭" onclick="closePopWin();" class="layui-btn layui-btn-danger">
		</div>
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
	function alertInfo(msg){
		isSubmit = false;
		util.alert(msg);
	}
	
	function reloadPg(msg){
		isSubmit = false;
		parent.reloadPg(msg);
	}
	
	function edit(thisObj){
		if(isSubmit){util.alert("<dict:lang value="数据正在提交，请稍候" />...");return;}
		if(!valData()){
			return ;
		}
		isSubmit = true;
		document.forms.editForm.submit();
	}
        
	function valData(){
		var paraMap_M_NAME = document.getElementById("paraMap_M_NAME");
		var paraMap_MODEL_CODE = document.getElementById("paraMap_MODEL_CODE");
   	if(val.isBlank(paraMap_M_NAME)){
   		_alertValMsg(paraMap_M_NAME,"<dict:lang value="模型名称" /> -- <dict:lang value="不能为空" />");
   		return false;
   	}else if(val.isBlank(paraMap_MODEL_CODE)){
   		_alertValMsg(paraMap_MODEL_CODE,"<dict:lang value="模型编码" /> -- <dict:lang value="不能为空" />");
   		return false;	   		
   	}
    
		return true;
	}
		
   function goBack(){
		parent.closePopWin();
   }

   $(function(){
	   $("#paraMap_IF_SHOW_MODEL").val("<c:out value='${dataMap.IF_SHOW_MODEL}' />");
   });
   
   layui.use('form', function(){
	   	  var form = layui.form;
	   	  //监听提交
	   	 form.verify({
	     		MODEL_CODE＿REG: function(value,item){
	     		   if(value==""){
	     			  return '<dict:lang value="模型编码不能为空" />...';
	     		   }
	  			   if (!/^[a-zA-Z0-9\\_]{0,}$/.test(value)) {
	  	                return '<dict:lang value="模型编码，只能由字母、数字、_组成请检查" />...';
	  	            }
	  		    }
	        });
	   });
</script>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>